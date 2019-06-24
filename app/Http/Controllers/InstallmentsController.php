<?php

namespace App\Http\Controllers;

use App\Models\Installment;
use Illuminate\Http\Request;

class InstallmentsController extends Controller
{
    /**
     * 分期付款列表页
     * @param Request $request
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     */
    public function index(Request $request)
    {
        $installments = Installment::query()
            ->where('user_id',$request->user()->id)
            ->paginate(10);
        return view('installments.index',['installments'=>$installments]);
    }

    /**
     * 分期详情页
     * @param Installment $installment
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     */
    public function show(Installment $installment)
    {
        $this->authorize('own',$installment);
        // 取出当前分期付款的所有的还款计划，并按还款顺序排序
        $items = $installment->items()->orderBy('sequence')->get();
        return view('installments.show', [
            'installment' => $installment,
            'items'       => $items,
            // 下一个未完成还款的还款计划
            'nextItem'    => $items->where('paid_at', null)->first(),
        ]);
    }
}
