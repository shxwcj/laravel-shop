<?php

use Illuminate\Routing\Router;

Admin::registerAuthRoutes();

Route::group([
    'prefix'        => config('admin.route.prefix'),
    'namespace'     => config('admin.route.namespace'),
    'middleware'    => config('admin.route.middleware'),
], function (Router $router) {
    $router->get('/', 'HomeController@index');
    $router->get('users', 'UsersController@index');                 //用户管理
    $router->get('api/categories', 'CategoriesController@apiIndex');//商品类目加载

//    $router->get('products', 'ProductsController@index');           //管理后台-普通商品管理
//
//    $router->get('products/create', 'ProductsController@create');   //管理后台-创建普通商品列表
//
//    $router->post('products', 'ProductsController@store');          //添加普通商品
//
//    $router->get('products/{id}/edit', 'ProductsController@edit');  //管理后台-编辑普通商品列表
//
//    $router->put('products/{id}', 'ProductsController@update');     //修改普通商品

    $router->resource('products','ProductsController');//普通商品管理

    $router->get('orders', 'OrdersController@index')->name('admin.orders.index');   //订单列表

    $router->get('orders/{order}', 'OrdersController@show')->name('admin.orders.show'); //订单详情

    $router->post('orders/{order}/ship', 'OrdersController@ship')->name('admin.orders.ship'); //订单发货

    $router->post('orders/{order}/refund', 'OrdersController@handleRefund')->name('admin.orders.handle_refund');//拒绝退款

    $router->resource('coupon_codes','CouponCodesController');//优惠券管理

    $router->resource('categories','CategoriesController');//商品类目管理

    $router->resource('crowdfunding_products','CrowdfundingProductsController');//众筹商品管理

    $router->resource('seckill_products','SeckillProductsController');//秒杀商品管理


});
