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

    $router->get('products', 'ProductsController@index');           //商品管理

    $router->get('products/create', 'ProductsController@create');   //创建商品列表

    $router->post('products', 'ProductsController@store');          //添加商品

    $router->get('products/{id}/edit', 'ProductsController@edit');  //编辑商品列表

    $router->put('products/{id}', 'ProductsController@update');     //修改商品

});
