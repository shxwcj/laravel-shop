<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Str;


class Product extends Model
{
   protected $fillable = ['title','description','image','on_sale','rating','sold_count','review_count'];

   protected $casts = ['on_sale' => 'boolean'];  //on_sale 是一个布尔类型的字段

   public function skus()
   {
       return $this->hasMany(ProductSku::class);
   }

    public function category()
    {
        return $this->belongsTo(Category::class);
    }

    /**
     * @desc 获取图片链接属性 image_url下划线的形式会被解析成驼峰式命名
     * @return mixed
     */
   public function getImageUrlAttribute()
   {
       // 如果 image 字段本身就已经是完整的 url 就直接返回
       if (Str::startsWith($this->attributes['image'],['http://','https://'])){ //Str::startWith:确定给定的字符串是否以给定的子字符串开始
           return $this->attributes['image'];
       }
       return \Storage::disk('public')->url($this->attributes['image']);
   }


}
