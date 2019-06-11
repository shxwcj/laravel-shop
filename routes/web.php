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

//Route::get('/','PagesController@root')->name('root');
Route::redirect('/', '/products')->name('root');

Auth::routes(['verify' => true]);

Route::group(['middleware' => ['auth', 'verified']], function() {
    Route::get('user_addresses', 'UserAddressesController@index')->name('user_addresses.index');        //收货地址列表

    Route::get('user_addresses/create', 'UserAddressesController@create')->name('user_addresses.create');//新增和编辑收货地址列表

    Route::post('user_addresses', 'UserAddressesController@store')->name('user_addresses.store');       //添加收获地址

    Route::get('user_addresses/{user_address}', 'UserAddressesController@edit')->name('user_addresses.edit'); //修改收货地址列表

    Route::put('user_addresses/{user_address}', 'UserAddressesController@update')->name('user_addresses.update');  //修改收获地址

    Route::delete('user_addresses/{user_address}', 'UserAddressesController@destroy')->name('user_addresses.destroy');  //删除收获地址

    Route::get('products', 'ProductsController@index')->name('products.index');                                 //商品列表

    Route::post('products/{product}/favorite', 'ProductsController@favor')->name('products.favor');             //收藏商品

    Route::delete('products/{product}/favorite', 'ProductsController@disfavor')->name('products.disfavor');     //取消收藏

    Route::get('products/favorites', 'ProductsController@favorites')->name('products.favorites');               //我的收藏列表

    Route::get('products/{product}', 'ProductsController@show')->name('products.show');                         //商品详情

    Route::post('cart', 'CartController@add')->name('cart.add');  //添加购物车

    Route::get('cart', 'CartController@index')->name('cart.index');  //查看购物车

    Route::delete('cart/{sku}', 'CartController@remove')->name('cart.remove');  //移除购物车

    Route::post('orders', 'OrdersController@store')->name('orders.store');  //添加订单

    Route::get('orders', 'OrdersController@index')->name('orders.index');  //订单列表

    Route::get('orders/{order}', 'OrdersController@show')->name('orders.show');  //订单详情

    Route::get('payment/{order}/alipay', 'PaymentController@payByAlipay')->name('payment.alipay');  //支付宝网页支付

    Route::get('payment/alipay/return', 'PaymentController@alipayReturn')->name('payment.alipay.return'); //支付宝前端回调页面

    Route::get('payment/{order}/wechat', 'PaymentController@payByWechat')->name('payment.wechat');      //微信扫码支付

    Route::post('orders/{order}/received', 'OrdersController@received')->name('orders.received');       //订单确认收货

    Route::get('orders/{order}/review', 'OrdersController@review')->name('orders.review.show');     //订单评价列表

    Route::post('orders/{order}/review', 'OrdersController@sendReview')->name('orders.review.store'); //订单评价

    Route::post('orders/{order}/apply_refund', 'OrdersController@applyRefund')->name('orders.apply_refund'); //申请退款



});

Route::post('payment/alipay/notify', 'PaymentController@alipayNotify')->name('payment.alipay.notify'); //支付宝服务器端回调

Route::post('payment/wechat/notify', 'PaymentController@wechatNotify')->name('payment.wechat.notify'); //微信服务器端回调