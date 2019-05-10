<?php

namespace App\Http\Controllers;

use App\Models\Product;
use Illuminate\Http\Request;

class ProductsController extends Controller
{
    public function index(Request $request)
    {
        $products = Product::query()->where('on_sale',true)->paginate(16);

        return view('products.index',compact('products',$products));        //其中一种方式即可
//        return view('products.index')->with('products',$products);
    }
}
