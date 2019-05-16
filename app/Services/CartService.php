<?php

namespace App\Services;

use App\Models\CartItem;
use Illuminate\Support\Facades\Auth;

class CartService
{
    /**
     * @desc 预加载商品以及商品SKU
     * @return mixed
     */
    public function get()
    {
        return Auth::user()->cartItems()->with(['productSku.product'])->get();
    }

    /**
     * @desc 添加购物车
     * @param $skuId
     * @param $amount
     */
    public function add($skuId,$amount)
    {
        $user = Auth::user();
        //从数据库中查询该商品是否已经在购物车中
        if ($item = $user->cartItems()->where('product_sku_id',$skuId)->first()){
            //如果存在则叠加商品数量
            $item->update(['amount'=>$item->amount+$amount]);
        }else{
            //创建一个新的购物车记录
            $item = new CartItem(['amount'=>$amount]);
            $item->user()->associate($user);
            $item->productSku()->associate($skuId);
            $item->save();
        }
        return response()->json(['msg'=>'success'],200);
    }

    /**
     * @desc 购物车移除
     * @param $skuIds
     */
    public function remove($skuIds)
    {
        // 可以传单个 ID，也可以传 ID 数组
        if (!is_array($skuIds)) {
            $skuIds = [$skuIds];
        }
        Auth::user()->cartItems()->whereIn('product_sku_id', $skuIds)->delete();
        return response()->json(['msg'=>'success'],200);
    }
}
