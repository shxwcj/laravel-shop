<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Ramsey\Uuid\Uuid;

class Order extends Model
{
    //退款状态
    const REFUND_STATUS_PENDING = 'pending';
    const REFUND_STATUS_APPLIED = 'applied';
    const REFUND_STATUS_PROCESSING = 'processing';
    const REFUND_STATUS_SUCCESS = 'success';
    const REFUND_STATUS_FAILED = 'failed';

    //物流状态
    const SHIP_STATUS_PENDING = 'pending';
    const SHIP_STATUS_DELIVERED = 'delivered';
    const SHIP_STATUS_RECEIVED = 'received';

    //退款状态属性
    public static $refundStatusMap = [
        self::REFUND_STATUS_PENDING => '未退款',
        self::REFUND_STATUS_APPLIED => '已申请退款',
        self::REFUND_STATUS_PROCESSING => '退款中',
        self::REFUND_STATUS_SUCCESS => '退款成功',
        self::REFUND_STATUS_FAILED => '退款失败',
        ];

    //物流状态属性
    public static $shipStatusMap  = [
        self::SHIP_STATUS_PENDING => '未发货',
        self::SHIP_STATUS_DELIVERED => '已发货',
        self::SHIP_STATUS_RECEIVED => '已收货',
    ];

    //批量赋值
    protected $fillable = ['no','address','total_amount', 'remark', 'paid_at','payment_method','payment_no','refund_status','refund_no', 'closed','reviewed','ship_status','ship_data','extra'];

    //属性类型转换
    protected $casts = [
      'closed'      => 'boolean',
      'reviewed'    => 'boolean',
      'address'     => 'json',
      'ship_data'   => 'json',
      'extra'       => 'json'
    ];

    //需要转换成日期的属性
    protected $dates = ['paid_at'];

    /**
     * @desc 模型监听事件 或者在observe里面进行监听
     *
     */
    protected static function boot()
    {
        parent::boot(); // TODO: Change the autogenerated stub
        // 监听模型创建事件，在写入数据库之前触发
        static::creating(function ($model){
           //若m模型中的no为空
            if (!$model->no){
                // 调用 findAvailableNo 生成订单流水号
                $model->no = static::findAvailableNo();
                if (!$model->no){
                    return false;
                }
            }
        });
    }

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function items()
    {
        return $this->hasMany(OrderItem::class);
    }

    public function couponCode()
    {
        return $this->belongsTo(CouponCode::class);
    }

    /**
     * 生成订单流水号
     * @return bool|string
     * @throws \Exception
     */
    public static function findAvailableNo()
    {
        //生成订单流水号前缀
        $prefix = date('YmdHis');
        for ($i=0;$i<10;$i++){
            //随机生成6位的数字
            $no = $prefix.str_pad(random_int(0, 999999), 6, '0', STR_PAD_LEFT);
            //判断是否已经存在
            if (!static::query()->where('no',$no)->exists()){
                return $no;
            }
        }
        \Log::warning('find order no failed');
        return false;
    }

    /**
     * 生成退款订单号
     * @return string
     * @throws \Exception
     */
    public static function getAvailableRefundNo()
    {
        do{
            //Uuid类可以用来生成大概率不重复的字符串
            $no = Uuid::uuid4()->getHex();
            //为了避免重复 我们在生成之后再数据库中查询是否已存在相同的退款订单号
        }while(self::query()->where('refund_no',$no)->exists());
        return $no;
    }

}
