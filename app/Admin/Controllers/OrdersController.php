<?php

namespace App\Admin\Controllers;

use App\Exceptions\InternalException;
use App\Exceptions\InvalidRequestException;
use App\Http\Requests\Admin\HandleRefundRequest;
use App\Models\CrowdfundingProduct;
use App\Models\Order;
use App\Http\Controllers\Controller;
use App\Services\OrderService;
use Encore\Admin\Controllers\HasResourceActions;
use Encore\Admin\Grid;
use Encore\Admin\Layout\Content;
use Illuminate\Http\Request;

class OrdersController extends Controller
{
    use HasResourceActions;

    /**
     * @desc 订单列表
     * @param Content $content
     * @return Content
     */
    public function index(Content $content)
    {
        return $content
            ->header('订单列表')
            ->body($this->grid());
    }

    /**
     * @desc 订单详情
     * @param Order $order
     * @param Content $content
     * @return Content
     */
    public function show(Order $order,Content $content)
    {
        return $content
            ->header('查看订单')
            // body 方法可以接受 Laravel 的视图作为参数
            ->body(view('admin.orders.show', ['order' => $order]));
    }

    /**
     * @desc 订单发货
     * @param Order $order
     * @param Request $request
     * @return \Illuminate\Http\RedirectResponse
     * @throws InvalidRequestException
     * @throws \Illuminate\Validation\ValidationException
     */
    public function ship(Order $order,Request $request)
    {
        //判断当前订单是否已支付
        if ($order->paid_at){
            throw new InvalidRequestException('该订单未付款');
        }
        //判断当前订单发货状态是否为未发货
        if ($order->ship_status !== Order::SHIP_STATUS_PENDING){
            throw new InvalidRequestException('该订单已发货');
        }
        // 众筹订单只有在众筹成功之后发货
        if ($order->type === Order::TYPE_CROWDFUNDING &&
            $order->items[0]->product->crowdfunding->status !== CrowdfundingProduct::STATUS_SUCCESS) {
            throw new InvalidRequestException('众筹订单只能在众筹成功之后发货');
        }
        // Laravel 5.5 之后 validate 方法可以返回校验过的值
        $data = $this->validate($request,[
            'express_company'   => ['required'],
            'express_no'        => ['required'],
        ],[],[
            'express_company' => '物流公司',
            'express_no'      => '物流单号',
        ]);
        //将订单发货状态改为已发货，并存入物流信息
        $order->update(['ship_status' => Order::SHIP_STATUS_RECEIVED,'ship_data'=>$data]);
        //返回上一页
        return redirect()->back();
    }

    public function grid()
    {
        $grid = new Grid(new Order);

        // 只展示已支付的订单，并且默认按支付时间倒序排序
        $grid->model()->whereNotNull('paid_at')->orderBy('paid_at', 'desc');

        $grid->no('订单流水号');
        // 展示关联关系的字段时，使用 column 方法
        $grid->column('user.name', '买家');
        $grid->total_amount('总金额')->sortable();
        $grid->paid_at('支付时间')->sortable();
        $grid->ship_status('物流')->display(function($value) {
            return Order::$shipStatusMap[$value];
        });
        $grid->refund_status('退款状态')->display(function($value) {
            return Order::$refundStatusMap[$value];
        });
        // 禁用创建按钮，后台不需要创建订单
        $grid->disableCreateButton();
        $grid->actions(function ($actions) {
            // 禁用删除和编辑按钮
            $actions->disableDelete();
            $actions->disableEdit();
        });
        $grid->tools(function ($tools) {
            // 禁用批量删除按钮
            $tools->batch(function ($batch) {
                $batch->disableDelete();
            });
        });
        $grid->filter(function($filter){
            $filter->disableIdFilter();
            $filter->like('no','订单流水号');
            $filter->between('total_amount', '总金额');
            $filter->date('paid_at', '支付时间');
        });
        return $grid;
    }

    /**
     * @desc 拒绝退款
     * @param Order $order
     * @param HandleRefundRequest $request
     * @return Order
     * @throws InvalidRequestException
     */
    public function handleRefund(Order $order,HandleRefundRequest $request,OrderService $orderService)
    {
        //判断订单状态是否正确
        if ($order->refund_status !== Order::REFUND_STATUS_APPLIED){
            throw new InvalidRequestException('订单状态不正确');
        }
        //是否同意退款
        if ($request->agree){
            //清空拒绝退款理由
            $extra = $order->extra ?: [];
            unset($extra['refund_disagree_reason']);
            $order->update([
                'extra'  =>  $extra,
            ]);
            //调用退款逻辑
            /*$this->_refundOrder($order); 封装方法之前*/
            //改为调用封装的方法
            $orderService->refundOrder($order);
        }else{
            //将拒绝退款理由写在extra字段中
            $extra = $order->extra ?:[];
            $extra['refund_disagree_reason'] = $request->reason;

            $order->update([
                'refund_status' => Order::REFUND_STATUS_PENDING,
                'extra' => $extra,
            ]);
        }
        return $order;
    }

   /* protected function _refundOrder(Order $order)
    {
        //判断该订单的支付方式
        switch ($order->payment_method){
            case 'wechat':
                //生成退款订单号
                $refundNo = Order::getAvailableRefundNo();
                app('wechat_pay')->refund([
                    'out_trade_no'  =>  $order->no,     // 之前的订单流水号
                    'total_fee'     =>  $order->total_amount*100,//原订单金额，单位分
                    'refund_fee'    =>   $order->total_amount * 100, // 要退款的订单金额，单位分
                    'out_refund_no' =>   $refundNo, // 退款订单号
                    // 微信支付的退款结果并不是实时返回的，而是通过退款回调来通知，因此这里需要配上退款回调接口地址
                    'notify_url'    =>  route('payment.wechat.refund_notify'), // 由于是开发环境，需要配成 requestbin 地址
//                    'notify_url'    =>  ngrok_url('payment.wechat.refund_notify'), // 暂时用ngrok来测试回调
                ]);
                //将订单状态改成退款中
                $order->update([
                    'refund_no' => $refundNo,
                    'refund_status' => Order::REFUND_STATUS_PROCESSING,
                ]);
                break;
            case 'alipay':
                // 用我们刚刚写的方法来生成一个退款订单号
                $refundNo = Order::getAvailableRefundNo();
                //调用支付宝支付实例的refund方法
                $ret = app('alipay')->refund([
                    'out_trade_no'  =>  $order->no,// 之前的订单流水号
                    'refund_amount'  =>  $order->total_amount,// 之前的订单金额
                    'out_request_no'  =>  $refundNo, // 退款订单号
                ]);
                //根据支付宝的文档，如果返回值里有sub_code字段说明退款失败
                if ($ret->sub_code){
                    //将退款失败的保存extra字段中
                    $extra = $order->extra;
                    $extra['refund_failed_code'] = $ret->sub_code;
                    // 将订单的退款状态标记为退款失败
                    $order->update([
                        'refund_no' => $refundNo,
                        'refund_status' => Order::REFUND_STATUS_FAILED,
                        'extra' => $extra,
                    ]);
                }else{
                    // 将订单的退款状态标记为退款成功并保存退款订单号
                    $order->update([
                        'refund_no' => $refundNo,
                        'refund_status' => Order::REFUND_STATUS_SUCCESS,
                    ]);
                }
                break;
            default:
                //原则上不可能出现，这个只是为了代码健全性
                throw new InternalException('未知订单支付方式:'.$order->payment_method);
                break;
        }
    }*/
}