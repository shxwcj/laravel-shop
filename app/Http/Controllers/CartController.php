<?php

namespace App\Http\Controllers;

use App\Http\Requests\AddCartRequest;
use App\Models\CartItem;
use App\Models\ProductSku;
use App\Services\CartService;
use Illuminate\Http\Request;

class CartController extends Controller
{
    protected $cartService;

    public function __construct(CartService $cartService)
    {
        $this->cartService = $cartService;
    }

    /**
     * @desc 添加购物车 未封装前
     * @param AddCartRequest $request
     * @return \Illuminate\Http\JsonResponse
     */
//   public function add(AddCartRequest $request)
//   {
//        $user = $request->user();
//        //从数据库中查询该商品是否已经在购物车中
//       if ($cart = $user->cartItems()->where('product_sku_id',$request->sku_id)->first()){
//           //如果存在则直接叠加商品数量
//           $cart->update(['amount' => $cart->amount + $request->amount]);
//       }else{
//           //不存在 则添加购物车 当更新 belongsTo 关联时，可以使用 associate 方法。此方法将会在子模型中设置外键：
//           $cart = new CartItem(['amount'=>$request->amount]);
//           $cart->user()->associate($user);
//           $cart->productSku()->associate($request->sku_id);
//           $cart->save();
//       }
//       return response()->json(['msg'=>'success'],200);
//   }

    //封装购物车添加代码
    public function add(AddCartRequest $request)
    {
        $this->cartService->add($request->sku_id, $request->amount);
    }

    /**
     * @desc 查看购物车 未封装前
     * @param Request $request
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     */
//   public function index(Request $request)
//   {
//       $cartItems = $request->user()->cartItems()->with(['productSku.product'])->get();
//       $addresses = $request->user()->addresses()->orderBy('last_used_at', 'desc')->get();
//       return view('cart.index',['cartItems'=>$cartItems,'addresses'=>$addresses]);
//   }

    //封装购物车列表代码
    public function index(Request $request)
    {
        $cartItems = $this->cartService->get();
        $addresses = $request->user()->addresses()->orderBy('last_used_at', 'desc')->get();

        return view('cart.index', ['cartItems' => $cartItems, 'addresses' => $addresses]);
    }

    /**
     * @desc 购物车移除 未封装前
     * @param ProductSku $sku = productSku的id
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
//   public function remove(ProductSku $sku,Request $request)
//   {
//        $request->user()->cartItems()->where('product_sku_id',$sku->id)->delete();
//        return response()->json(['msg'=>'success'],200);
//   }

    //封装购物车移除代码
    public function remove(ProductSku $sku)
    {
        $this->cartService->remove($sku->id);
    }
}
