<?php

namespace App\Http\Controllers;

use App\Http\Requests\AddCartRequest;
use App\Models\CartItem;
use App\Models\ProductSku;
use Illuminate\Http\Request;

class CartController extends Controller
{
    /**
     * @desc 添加购物车
     * @param AddCartRequest $request
     * @return \Illuminate\Http\JsonResponse
     */
   public function add(AddCartRequest $request)
   {
        $user = $request->user();
        //从数据库中查询该商品是否已经在购物车中
       if ($cart = $user->cartItems()->where('product_sku_id',$request->sku_id)->first()){
           //如果存在则直接叠加商品数量
           $cart->update(['amount' => $cart->amount + $request->amount]);
       }else{
           //不存在 则添加购物车 当更新 belongsTo 关联时，可以使用 associate 方法。此方法将会在子模型中设置外键：
           $cart = new CartItem(['amount'=>$request->amount]);
           $cart->user()->associate($user);
           $cart->productSku()->associate($request->sku_id);
           $cart->save();
       }
       return response()->json(['msg'=>'success'],200);
   }

    /**
     * @desc 查看购物车
     * @param Request $request
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     */
   public function index(Request $request)
   {
       $cartItems = $request->user()->cartItems()->with(['productSku.product'])->get();
       $addresses = $request->user()->addresses()->orderBy('last_used_at', 'desc')->get();

       return view('cart.index',['cartItems'=>$cartItems,'addresses'=>$addresses]);
   }

    /**
     * @desc 购物车移除
     * @param ProductSku $sku = productSku的id
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
   public function remove(ProductSku $sku,Request $request)
   {
        $request->user()->cartItems()->where('product_sku_id',$sku->id)->delete();
        return response()->json(['msg'=>'success'],200);
   }
}
