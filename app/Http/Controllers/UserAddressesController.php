<?php

namespace App\Http\Controllers;

use App\Http\Requests\UserAddressRequest;
use App\Models\UserAddress;
use Illuminate\Http\Request;

class UserAddressesController extends Controller
{
    /**
     * @desc 收货地址列表
     * @param Request $request
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     */
    public function index(Request $request)
    {
        return view('user_addresses.index',['addresses' => $request->user()->addresses]);
    }

    /**
     * @desc 新增和编辑收货地址列表
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     */
    public function create()
    {
        return view('user_addresses.create_and_edit',['address'=>new UserAddress()]);
    }

    /**
     * @desc 添加收货地址
     * @param UserAddressRequest $request
     * @return \Illuminate\Http\RedirectResponse
     */
    public function store(UserAddressRequest $request)
    {
        $request->user()->addresses()->create($request->only(array('province','city','district','address','zip','contact_name','contact_phone')));
        return redirect()->route('user_addresses.index');
    }

    /**
     * @desc 编辑收货地址列表
     * @param UserAddress $user_address == 路由的{user_address}
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     */
    public function edit(UserAddress $user_address)
    {
        $this->authorize('own',$user_address);
        return view('user_addresses.create_and_edit',['address'=>$user_address]);
    }

    /**
     * @desc 修改收货地址
     * @param UserAddress $user_address == 路由的{user_address}
     * @param UserAddressRequest $request
     * @return \Illuminate\Http\RedirectResponse
     */
    public function update(UserAddress $user_address,UserAddressRequest $request)
    {
        $this->authorize('own',$user_address);
        $user_address->update($request->only(array('province','city','district','address','zip','contact_name','contact_phone')));
        return redirect()->route('user_addresses.index');
    }

    /**
     * @desc 删除收货地址
     * @param UserAddress $user_address == 路由的{user_address}
     * @return \Illuminate\Http\RedirectResponse
     * @throws \Exception
     */
    public function destroy(UserAddress $user_address)
    {
        $this->authorize('own',$user_address);
        $user_address->delete();
        return [];
    }
}
