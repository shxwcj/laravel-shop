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
});