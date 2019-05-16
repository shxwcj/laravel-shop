<?php

namespace App\Http\Controllers;

use App\Exceptions\InvalidRequestException;
use App\Models\Order;
use Carbon\Carbon;
use Endroid\QrCode\QrCode;
use Illuminate\Http\Request;

class PaymentController extends Controller
{
    /**
     * @desc 支付宝网页支付
     * @param Order $order
     * @param Request $request
     * @return mixed
     * @throws InvalidRequestException
     * @throws \Illuminate\Auth\Access\AuthorizationException
     */
    public function payByAlipay(Order $order,Request $request)
    {
        //判断当前订单是否属于当前用户
        $this->authorize('own', $order);
        //判断订单是否已支付或关闭
        if ($order->paid_at || $order->cloesed) {
            throw new InvalidRequestException('订单状态不正确');
        }

        //调用支付宝的网页支付
        return app('alipay')->web([
            'out_trade_no' => $order->no, // 订单编号，需保证在商户端不重复
            'total_amount' => $order->total_amount, // 订单金额，单位元，支持小数点后两位
            'subject'      => '支付 Laravel Shop 的订单：'.$order->no, // 订单标题
        ]);
    }

    /**
     * @desc 支付宝前端回调页面
     */
    public function alipayReturn()
    {
        //校验提交的参数是否合法
        try{
            app('alipay')->verify();
        }catch (\Exception $e){
            return view('pages.error', ['msg' => '数据不正确']);
        }
        return view('pages.success', ['msg' => '付款成功']);
    }

    /**
     * @desc 支付宝服务器端回调
     */
    public function alipayNotify()
    {
        $data = app('alipay')->verify();
        // 如果订单状态不是成功或者结束，则不走后续的逻辑
        // 所有交易状态：https://docs.open.alipay.com/59/103672
        if(!in_array($data->trade_status, ['TRADE_SUCCESS', 'TRADE_FINISHED'])) {
            return app('alipay')->success();
        }
        // $data->out_trade_no 拿到订单流水号，并在数据库中查询
        $order = Order::where('no', $data->out_trade_no)->first();

        // 正常来说不太可能出现支付了一笔不存在的订单，这个判断只是加强系统健壮性。
        if (!$order) {
            return 'fail';
        }
        // 如果这笔订单的状态已经是已支付
        if ($order->paid_at) {
            // 返回数据给支付宝
            return app('alipay')->success();
        }

        $order->update([
            'paid_at'        => Carbon::now(), // 支付时间
            'payment_method' => 'alipay', // 支付方式
            'payment_no'     => $data->trade_no, // 支付宝订单号
        ]);

        return app('alipay')->success();
    }

    /**
     * @desc 微信扫码支付
     * @param Order $order
     * @param Request $request
     * @return mixed
     * @throws InvalidRequestException
     * @throws \Illuminate\Auth\Access\AuthorizationException
     */
    public function payByWechat(Order $order,Request $request)
    {
        //校验权限
        $this->authorize('own',$order);
        //判断订单是否已支付或关闭
        if ($order->paid_at || $order->cloesed) {
            throw new InvalidRequestException('订单状态不正确');
        }
        //scan 方法为拉起微信扫码支付
        $wechatOrder = app('wechat_pay')->scan([
            'out_trade_no' => $order->no,  // 商户订单流水号，与支付宝 out_trade_no 一样
            'total_fee'    => $order->total_amount * 100, // 与支付宝不同，微信支付的金额单位是分。
            'body'         => '支付 Laravel Shop 的订单：'.$order->no, // 订单描述
        ]);
        //把要转换的字符串作为QrCode的构造函数 生成二维码
        $qrCode = new QrCode($wechatOrder->code_url);

        //将生成的二维码图片以字符串形式输出，并带上相应的响应类型
        return response($qrCode->writeString(),200,['Content-Type' => $qrCode->getContentType()]);

    }

    /**
     * @desc 微信服务端回调
     * @return string
     */
    public function wechatNotify()
    {

        // 校验回调参数是否正确
        $data  = app('wechat_pay')->verify();
        // 找到对应的订单
        $order = Order::where('no', $data->out_trade_no)->first();
        // 订单不存在则告知微信支付
        if (!$order) {
            return 'fail';
        }
        // 订单已支付
        if ($order->paid_at) {
            // 告知微信支付此订单已处理
            return app('wechat_pay')->success();
        }

        // 将订单标记为已支付
        $order->update([
            'paid_at'        => Carbon::now(),
            'payment_method' => 'wechat',
            'payment_no'     => $data->transaction_id,
        ]);

        return app('wechat_pay')->success();
    }

}
