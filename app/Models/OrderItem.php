<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class OrderItem extends Model
{
    //批量赋值
    protected $fillable = ['amount','price', 'rating','review', 'reviewed_at'];

    //需要转换成日期的属性
    protected $dates = ['reviewed_at'];

    //执行模型是否自动维护时间戳
    public $timestamps = false;

    public function product()
    {
        return $this->belongsTo(Product::class);
    }

    public function productSku()
    {
        return $this->belongsTo(ProductSku::class);
    }

    public function order()
    {
        return $this->belongsTo(Order::class);
    }
}
