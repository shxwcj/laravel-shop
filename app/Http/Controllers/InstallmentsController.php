<?php

namespace App\Http\Controllers;

use App\Events\OrderPaid;
use App\Exceptions\InvalidRequestException;
use App\Models\Installment;
use Carbon\Carbon;
use Endroid\QrCode\QrCode;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class InstallmentsController extends Controller
{
    /**
     * 分期付款列表页
     * @param Request $request
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     */
    public function index(Request $request)
    {
        $installments = Installment::query()
            ->where('user_id',$request->user()->id)
            ->paginate(10);
        return view('installments.index',['installments'=>$installments]);
    }

    /**
     * 分期详情页
     * @param Installment $installment
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     */
    public function show(Installment $installment)
    {
//        $this->authorize('own',$installment);
        // 取出当前分期付款的所有的还款计划，并按还款顺序排序
        $items = $installment->items()->orderBy('sequence')->get();
        return view('installments.show', [
            'installment' => $installment,
            'items'       => $items,
            // 下一个未完成还款的还款计划
            'nextItem'    => $items->where('paid_at', null)->first(),
        ]);
    }

    /**
     * 分期付款-支付宝网页支付
     * @param Installment $installment
     * @return mixed
     * @throws InvalidRequestException
     */
    public function payByAlipay(Installment $installment)
    {
        if ($installment->order->closed) {
            throw new InvalidRequestException('对应的商品订单已被关闭');
        }
        if ($installment->status === Installment::STATUS_FINISHED) {
            throw new InvalidRequestException('该分期订单已结清');
        }
        // 获取当前分期付款最近的一个未支付的还款计划
        if (!$nextItem = $installment->items()->whereNull('paid_at')->orderBy('sequence')->first()) {
            // 如果没有未支付的还款，原则上不可能，因为如果分期已结清则在上一个判断就退出了
            throw new InvalidRequestException('该分期订单已结清');
        }
        // 调用支付宝的网页支付
        return app('alipay')->web([
            // 支付订单号使用分期流水号+还款计划编号
            'out_trade_no' => $installment->no.'_'.$nextItem->sequence,
            'total_amount' => $nextItem->total,
            'subject'      => '支付 Laravel Shop 的分期订单：'.$installment->no,
            // 这里的 notify_url 和 return_url 可以覆盖掉在 AppServiceProvider 设置的回调地址
//            'notify_url'   => ngrok_url('installments.alipay.notify'),
            'notify_url'   => route('installments.alipay.notify'),
            'return_url'   => route('installments.alipay.return'),
        ]);
    }

    /**
     *  分期付款-支付宝前端回调
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     */
    public function alipayReturn()
    {
        try{
            app('alipay')->verify();
        }catch (\Exception $e){
            return view('pages.error', ['msg' => '数据不正确']);
        }
        return view('pages.success', ['msg' => '付款成功']);
    }

    /**
     * @desc 分期付款-支付宝服务器端回调
     */
    public function alipayNotify()
    {
        // 校验支付宝回调参数是否正确
        $data = app('alipay')->verify();
        // 如果订单状态不是成功或者结束，则不走后续的逻辑
        if (!in_array($data->trade_status, ['TRADE_SUCCESS', 'TRADE_FINISHED'])) {
            return app('alipay')->success();
        }
// /*----------  调用paid方法之前  -----------开始----------------------------------------------------------------*/
//        // 拉起支付时使用的支付订单号是由分期流水号 + 还款计划编号组成的
//        // 因此可以通过支付订单号来还原出这笔还款是哪个分期付款的哪个还款计划
//        list($no, $sequence) = explode('_', $data->out_trade_no);
//        // 根据分期流水号查询对应的分期记录，原则上不会找不到，这里的判断只是增强代码健壮性
//        if (!$installment = Installment::where('no', $no)->first()) {
//            return 'fail';
//        }
//        // 根据还款计划编号查询对应的还款计划，原则上不会找不到，这里的判断只是增强代码健壮性
//        if (!$item = $installment->items()->where('sequence', $sequence)->first()) {
//            return 'fail';
//        }
//        // 如果这个还款计划的支付状态是已支付，则告知支付宝此订单已完成，并不再执行后续逻辑
//        if ($item->paid_at) {
//            return app('alipay')->success();
//        }
//
//        // 使用事务，保证数据一致性
//        DB::transaction(function () use ($data, $no, $installment, $item) {
//            // 更新对应的还款计划
//            $item->update([
//                'paid_at'        => Carbon::now(), // 支付时间
//                'payment_method' => 'alipay', // 支付方式
//                'payment_no'     => $data->trade_no, // 支付宝订单号
//            ]);
//
//            // 如果这是第一笔还款
//            if ($item->sequence === 0) {
//                // 将分期付款的状态改为还款中
//                $installment->update(['status' => Installment::STATUS_REPAYING]);
//                // 将分期付款对应的商品订单状态改为已支付
//                $installment->order->update([
//                    'paid_at'        => Carbon::now(),
//                    'payment_method' => 'installment', // 支付方式为分期付款
//                    'payment_no'     => $no, // 支付订单号为分期付款的流水号
//                ]);
//                // 触发商品订单已支付的事件
//                event(new OrderPaid($installment->order));
//            }
//
//            // 如果这是最后一笔还款
//            if ($item->sequence === $installment->count - 1) {
//                // 将分期付款状态改为已结清
//                $installment->update(['status' => Installment::STATUS_FINISHED]);
//            }
//        });
//        return app('alipay')->success();
// /*----------  调用paid方法之前  -----------结束----------------------------------------------------------------*/
        if ($this->paid($data->out_trade_no, 'alipay', $data->trade_no)) {
            return app('alipay')->success();
        }
        return 'fail';

    }

    /**
     * 分期付款-微信支付
     * @param Installment $installment
     * @return \Illuminate\Contracts\Routing\ResponseFactory|\Illuminate\Http\Response
     * @throws InvalidRequestException
     */
    public function payByWechat(Installment $installment)
    {
        if ($installment->order->closed) {
            throw new InvalidRequestException('对应的商品订单已被关闭');
        }
        if ($installment->status === Installment::STATUS_FINISHED) {
            throw new InvalidRequestException('该分期订单已结清');
        }
        // 获取当前分期付款最近的一个未支付的还款计划
        if (!$nextItem = $installment->items()->whereNull('paid_at')->orderBy('sequence')->first()) {
            // 如果没有未支付的还款，原则上不可能，因为如果分期已结清则在上一个判断就退出了
            throw new InvalidRequestException('该分期订单已结清');
        }

        $wechatOrder = app('wechat_pay')->scan([
            'out_trade_no' => $installment->no.'_'.$nextItem->sequence,
            'total_fee'    => $nextItem->total * 100,
            'body'         => '支付 Laravel Shop 的分期订单：'.$installment->no,
//            'notify_url'   => ngrok_url('installments.wechat.notify'),
            'notify_url'   => route('installments.wechat.notify'),
        ]);
        // 把要转换的字符串作为 QrCode 的构造函数参数
        $qrCode = new QrCode($wechatOrder->code_url);

        // 将生成的二维码图片数据以字符串形式输出，并带上相应的响应类型
        return response($qrCode->writeString(), 200, ['Content-Type' => $qrCode->getContentType()]);
    }


    /**
     * @desc 分期付款-微信服务端回调
     * @return string
     */
    public function wechatNotify()
    {
        // 校验回调参数是否正确
        $data = app('wechat_pay')->verify();
        if ($this->paid($data->out_trade_no,'wechat',$data->transaction_id)){
            return app('wechat_pay')->success();
        }
        return 'fail';
    }


    /**
     * 分期付款-支付宝、微信还款后代码封装
     * @param $outTradeNo
     * @param $paymentMethod
     * @param $paymentNo
     * @return bool
     */
    protected function paid($outTradeNo, $paymentMethod, $paymentNo)
    {
        // 拉起支付时使用的支付订单号是由分期流水号 + 还款计划编号组成的
        list($no, $sequence) = explode('_', $outTradeNo);
        // 根据分期流水号查询对应的分期记录，原则上不会找不到，这里的判断只是增强代码健壮性
        if (!$installment = Installment::where('no', $no)->first()) {
            return false;
        }
        // 根据还款计划编号查询对应的还款计划，原则上不会找不到，这里的判断只是增强代码健壮性
        if (!$item = $installment->items()->where('sequence', $sequence)->first()) {
            return false;
        }
        // 如果这个还款计划的支付状态是已支付，则告知支付宝此订单已完成，并不再执行后续逻辑
        if ($item->paid_at) {
            return true;
        }
        // 使用事务，保证数据一致性
        DB::transaction(function () use ($paymentNo, $paymentMethod, $no, $installment, $item) {
            // 更新对应的还款计划
            $item->update([
                'paid_at'        => Carbon::now(),
                'payment_method' => $paymentMethod,
                'payment_no'     => $paymentNo,
            ]);
            // 如果这是第一笔还款
            if ($item->sequence === 0) {
                // 将分期付款的状态改为还款中
                $installment->update(['status' => Installment::STATUS_REPAYING]);
                // 将分期付款对应的商品订单状态改为已支付
                $installment->order->update([
                    'paid_at'        => Carbon::now(),
                    'payment_method' => 'installment',
                    'payment_no'     => $no,
                ]);
                // 触发商品订单已支付的事件
                event(new OrderPaid($installment->order));
            }
            // 如果这是最后一笔还款
            if ($item->sequence === $installment->count - 1) {
                // 将分期付款状态改为已结清
                $installment->update(['status' => Installment::STATUS_FINISHED]);
            }
        });
        return true;
    }
}