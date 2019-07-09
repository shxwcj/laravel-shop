<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/
use Illuminate\Support\Facades\Route;
//Route::get('/','PagesController@root')->name('root');
Route::redirect('/', '/products')->name('root');

Auth::routes(['verify' => true]);

Route::group(['middleware' => ['auth', 'verified']], function() {
    //收货地址列表
    Route::get('user_addresses', 'UserAddressesController@index')->name('user_addresses.index');

    //新增和编辑收货地址列表
    Route::get('user_addresses/create', 'UserAddressesController@create')->name('user_addresses.create');

    //添加收获地址
    Route::post('user_addresses', 'UserAddressesController@store')->name('user_addresses.store');

    //修改收货地址列表
    Route::get('user_addresses/{user_address}', 'UserAddressesController@edit')->name('user_addresses.edit');

    //修改收获地址
    Route::put('user_addresses/{user_address}', 'UserAddressesController@update')->name('user_addresses.update');

    //删除收获地址
    Route::delete('user_addresses/{user_address}', 'UserAddressesController@destroy')->name('user_addresses.destroy');

    //商品列表
    Route::get('products', 'ProductsController@index')->name('products.index');

    //收藏商品
    Route::post('products/{product}/favorite', 'ProductsController@favor')->name('products.favor');

    //取消收藏
    Route::delete('products/{product}/favorite', 'ProductsController@disfavor')->name('products.disfavor');

    //我的收藏列表
    Route::get('products/favorites', 'ProductsController@favorites')->name('products.favorites');

    //商品详情
    Route::get('products/{product}', 'ProductsController@show')->name('products.show');

    //添加购物车
    Route::post('cart', 'CartController@add')->name('cart.add');

    //查看购物车
    Route::get('cart', 'CartController@index')->name('cart.index');

    //移除购物车
    Route::delete('cart/{sku}', 'CartController@remove')->name('cart.remove');

    //添加订单
    Route::post('orders', 'OrdersController@store')->name('orders.store');

    //订单列表
    Route::get('orders', 'OrdersController@index')->name('orders.index');

    //订单详情
    Route::get('orders/{order}', 'OrdersController@show')->name('orders.show');

    //支付宝网页支付
    Route::get('payment/{order}/alipay', 'PaymentController@payByAlipay')->name('payment.alipay');

    //支付宝前端回调页面
    Route::get('payment/alipay/return', 'PaymentController@alipayReturn')->name('payment.alipay.return');

    //微信扫码支付
    Route::get('payment/{order}/wechat', 'PaymentController@payByWechat')->name('payment.wechat');

    //订单确认收货
    Route::post('orders/{order}/received', 'OrdersController@received')->name('orders.received');

    //订单评价列表
    Route::get('orders/{order}/review', 'OrdersController@review')->name('orders.review.show');

    //订单评价
    Route::post('orders/{order}/review', 'OrdersController@sendReview')->name('orders.review.store');

    //申请退款
    Route::post('orders/{order}/apply_refund', 'OrdersController@applyRefund')->name('orders.apply_refund');

    //优惠券详情
    Route::get('coupon_codes/{code}', 'CouponCodesController@show')->name('coupon_codes.show');

    //众筹订单
    Route::post('crowdfunding_orders', 'OrdersController@crowdfunding')->name('crowdfunding_orders.store');

    //秒杀订单
    Route::post('seckill_orders', 'OrdersController@seckill')->name('seckill_orders.store');

    //分期付款
    Route::post('payment/{order}/installment', 'PaymentController@payByInstallment')->name('payment.installment');

    //分期付款列表页
    Route::get('installments', 'InstallmentsController@index')->name('installments.index');

    //分期详情页
    Route::get('installments/{installment}', 'InstallmentsController@show')->name('installments.show');

    //分期付款-支付宝网页支付
    Route::get('installments/{installment}/alipay', 'InstallmentsController@payByAlipay')->name('installments.alipay');

    //分期付款-支付宝前端回调
    Route::get('installments/alipay/return', 'InstallmentsController@alipayReturn')->name('installments.alipay.return');

    //分期付款-微信支付
    Route::get('installments/{installment}/wechat', 'InstallmentsController@payByWechat')->name('installments.wechat');



});
// 后端回调不能放在 auth 中间件中

//支付宝服务器端回调
Route::post('payment/alipay/notify', 'PaymentController@alipayNotify')->name('payment.alipay.notify');

//微信服务器端回调
Route::post('payment/wechat/notify', 'PaymentController@wechatNotify')->name('payment.wechat.notify');

//退款回调
Route::post('payment/wechat/refund_notify', 'PaymentController@wechatRefundNotify')->name('payment.wechat.refund_notify');

//分期付款-支付宝服务器端回调
Route::post('installments/alipay/notify', 'InstallmentsController@alipayNotify')->name('installments.alipay.notify');


//分期付款-微信服务端回调
Route::post('installments/wechat/notify', 'InstallmentsController@wechatNotify')->name('installments.wechat.notify');

//分期付款-微信退款服务器端回调
Route::post('installments/wechat/refund_notify', 'InstallmentsController@wechatRefundNotify')->name('installments.wechat.refund_notify');









