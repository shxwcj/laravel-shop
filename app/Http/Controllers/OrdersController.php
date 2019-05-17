<?php
namespace App\Http\Controllers;

use App\Exceptions\InternalException;
use App\Exceptions\InvalidRequestException;
use App\Http\Requests\OrderRequest;
use App\Jobs\CloseOrder;
use App\Models\ProductSku;
use App\Models\UserAddress;
use App\Models\Order;
use App\Services\CartService;
use App\Services\OrderService;
use Carbon\Carbon;
use Illuminate\Http\Request;

class OrdersController extends Controller
{
    /**
     * @desc 订单添加 未封装前
     * @param OrderRequest $request
     * @return mixed
     */
//    public function store(OrderRequest $request)
//    {
//        $user  = $request->user();
//        // 开启一个数据库事务
//        $order = \DB::transaction(function () use ($user, $request) {
//            $address = UserAddress::find($request->input('address_id'));
//            // 更新此地址的最后使用时间
//            $address->update(['last_used_at' => Carbon::now()]);
//            // 创建一个订单
//            $order   = new Order([
//                'address'      => [ // 将地址信息放入订单中
//                    'address'       => $address->full_address,
//                    'zip'           => $address->zip,
//                    'contact_name'  => $address->contact_name,
//                    'contact_phone' => $address->contact_phone,
//                ],
//                'remark'       => $request->input('remark'),
//                'total_amount' => 0,
//            ]);
//            // 订单关联到当前用户
//            $order->user()->associate($user);
//            // 写入数据库
//            $order->save();
//
//            $totalAmount = 0;
//            $items = $request->input('items');
//            // 遍历用户提交的 SKU
//            foreach ($items as $data) {
//                $sku  = ProductSku::find($data['sku_id']);
//                // 创建一个 OrderItem 并直接与当前订单关联
//                $item = $order->items()->make([
//                    'amount' => $data['amount'],
//                    'price'  => $sku->price,
//                ]);
//                $item->product()->associate($sku->product_id);
//                $item->productSku()->associate($sku);
//                $item->save();
//                $totalAmount += $sku->price * $data['amount'];
//                if ($sku->decreaseStock($data['amount']) <=0){
//                    throw new InternalException('该商品库存不足');
//                }
//            }
//            // 更新订单总金额
//            $order->update(['total_amount' => $totalAmount]);
//
//            // 将下单的商品从购物车中移除 CartController封装前的代码
////            $skuIds = collect($items)->pluck('sku_id');
////            $user->cartItems()->whereIn('product_sku_id', $skuIds)->delete();
//            //CartController封装后的代码
//            $skuIds = collect($request->input('items'))->pluck('sku_id')->all();
//            $cartService = new CartService();
//            $cartService->remove($skuIds);
//            return $order;
//        });
//        $this->dispatch(new CloseOrder($order,config('app.order_ttl')));
//        return $order;
//    }

    //封装订单添加代码
    public function store(OrderRequest $request,OrderService $orderService)
    {
        $user = $request->user();
        $address = UserAddress::find($request->address_id);
        return $orderService->store($user,$address,$request->remark,$request->items);
    }

    /**
     * @desc 订单列表
     * @param Request $request
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     */
    public function index(Request $request)
    {
        $orders = Order::query()
        // 使用 with 方法预加载，避免N + 1问题
            ->with(['items.product','items.productSku'])
            ->where('user_id',$request->user()->id)
            ->orderBy('created_at','desc')
            ->paginate();
        return view('orders.index',['orders'=>$orders]);
    }

    /**
     * @desc 订单详情
     * @param Order $order
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     */
    public function show(Order $order)
    {
        $this->authorize('own',$order);
        return view('orders.show', ['order' => $order->load(['items.productSku', 'items.product'])]);
    }

    /**
     * 订单确认收货
     * @param Order $order
     * @param Request $request
     * @return \Illuminate\Http\RedirectResponse
     * @throws InvalidRequestException
     * @throws \Illuminate\Auth\Access\AuthorizationException
     */
    public function received(Order $order,Request $request)
    {
        $this->authorize('own',$order);
        //判断订单的发货状态是否为已发货
        if ($order->ship_status !== Order::SHIP_STATUS_DELIVERED){
            throw new InvalidRequestException('发货状态不正确');
        }
        // 更新发货状态为已收到
        $order->update(['ship_status'=> Order::SHIP_STATUS_RECEIVED]);
        
        return $order;
    }
}