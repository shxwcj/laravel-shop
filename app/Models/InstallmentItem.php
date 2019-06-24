<?php

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;
use Moontoast\Math\BigNumber;

class InstallmentItem extends Model
{
    //定义4中分期还款时退款状态
    const REFUND_STATUS_PENDING     = 'pending';
    const REFUND_STATUS_PROCESSING  = 'processing';
    const REFUND_STATUS_SUCCESS     = 'success';
    const REFUND_STATUS_FAILED      = 'failed';

    public static $refundStatusMap = [
        self::REFUND_STATUS_PENDING     => '未退款',
        self::REFUND_STATUS_PROCESSING  => '退款中',
        self::REFUND_STATUS_SUCCESS     => '退款成功',
        self::REFUND_STATUS_FAILED      => '退款失败',
    ];

    protected $fillable = ['installment_id','sequence','base','fee','fine','due_date','paid_at','payment_method','payment_no','refund_status'];

    protected $dates = ['paid_at','due_date'];

    public function installment()
    {
        return $this->belongsTo(Installment::class);
    }

    //创建一个访问器，返回当前还款计划需还款的总金额
    public function getTotalAttribute()
    {
//*----------- 没有用 moontoast/math 第三方类库时 ----------开始*/
//        // 小数点计算需要用 bcmath 扩展提供的函数 bcadd():此函数接受两个任意精度数字作为字符串，并在将结果缩放到指定精度后返回两个数字的相加。
//        $total = bcadd($this->base, $this->fee, 2);
//        if (!is_null($this->fine)){
//            $total = bcadd($total, $this->fine, 2);
//        }
//        return $total;
//*----------- 没有用 moontoast/math 第三方类库时 ----------结束*/

//*----------- 用 moontoast/math 第三方类库后 ----------开始*/
//        $total = (new BigNumber($this->base, 2))->add($this->fee); 没用辅助函数时
        //使用辅助函数来替代每次的new
        $total = big_number($this->base)->add($this->fee);
        if (!is_null($this->fine)) {
            $total->add($this->fine);
        }
        return $total->getValue();
    }

    // 创建一个访问器，返回当前还款计划是否已经逾期
    public function getIsOverdueAttribute()
    {
        return Carbon::now()->gt($this->due_date);
    }

}
