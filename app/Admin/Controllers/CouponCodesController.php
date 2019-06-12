<?php

namespace App\Admin\Controllers;

use App\Models\CouponCode;
use App\Http\Controllers\Controller;
use Encore\Admin\Controllers\HasResourceActions;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Layout\Content;
use Encore\Admin\Show;

class CouponCodesController extends Controller
{
    use HasResourceActions;

    /**
     * Index interface.
     *
     * @param Content $content
     * @return Content
     */
    public function index(Content $content)
    {
        return $content
            ->header('优惠券列表')
            ->description('description')
            ->body($this->grid());
    }

    /**
     * Show interface.
     *
     * @param mixed $id
     * @param Content $content
     * @return Content
     */
    public function show($id, Content $content)
    {
        return $content
            ->header('优惠券详情')
            ->description('description')
            ->body($this->detail($id));
    }

    /**
     * Edit interface.
     *
     * @param mixed $id
     * @param Content $content
     * @return Content
     */
    public function edit($id, Content $content)
    {
        return $content
            ->header('优惠券编辑')
            ->description('description')
            ->body($this->form()->edit($id));
    }

    /**
     * Create interface.
     *
     * @param Content $content
     * @return Content
     */
    public function create(Content $content)
    {
        return $content
            ->header('新增优惠券')
            ->description('description')
            ->body($this->form());
    }

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new CouponCode);
        $grid->model()->orderBy('created_at','desc');
        $grid->id('Id')->sortable();
        $grid->name('名称');
        $grid->code('优惠码');
        $grid->code('优惠码');
        /*------优化之前的代码 开始----- */
//        $grid->type('类型')->display(function ($value){
//            return CouponCode::$typeMap[$value];
//        });
//        // 根据不同的折扣类型用对应的方式来展示
//        $grid->value('折扣')->display(function ($value){
//            return $this->type === CouponCode::TYPE_FIXED ?'￥'.$value :$value.'%';
//        });
//        $grid->min_amount('最低金额')->sortable();
//        $grid->total('总量')->sortable();
//        $grid->used('已用');
        /*------优化之前的代码 结束----- */

        /*------优化之后的代码 开始----- */
        $grid->description('描述');
        //$grid->column('usage', '用量') 是我们虚拟出来的一个字段，然后通过 display() 来输出这个虚拟字段的内容。
        $grid->column('usage', '用量')->display(function ($value) {
            return "{$this->used} / {$this->total}";
        });
        /*------优化之后的代码 结束----- */

        $grid->enabled('是否启用')->display(function ($value){
            return $value ?'是':'否';
        });
        $grid->created_at('创建时间')->sortable();

        $grid->filter(function($filter) use ($grid){
            $filter->disableIdFilter();
            //关联查询过滤
//            $filter->where(function ($query){
//                $query->whereHas('user', function ($query) {
//                    $query->where('name','like',"%{$this->input}%");
//                });
//            },'發佈者');
            $filter->like('name','名称');
            $filter->like('code','优惠码');
            $filter->date('created_at', '發佈時間');
        });
        return $grid;
    }

    /**
     * Make a show builder.
     *
     * @param mixed $id
     * @return Show
     */
    protected function detail($id)
    {
        $show = new Show(CouponCode::findOrFail($id));
        $show->id('Id');
        $show->name('名称');
        $show->code('优惠码');
        $show->type('类型')->as(function ($value){
            return CouponCode::$typeMap[$value];
        });
        $show->value('折扣');
        $show->total('总量');
        $show->used('已用');
        $show->min_amount('最低金额');
        $show->not_before('之前可用');
        $show->not_after('之后可用');
        $show->enabled('是否启用')->as(function ($value){
            return $value ?'是':'否';
        });;
        $show->created_at('创建时间');
        $show->updated_at('更新时间');
        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new CouponCode);

        $form->text('name', '名称');
        $form->text('code', '优惠码');
        $form->text('type', '类型');
        $form->decimal('value', '折扣');
        $form->number('total', '总量');
        $form->number('used', '已用');
        $form->decimal('min_amount', '最低金额');
        $form->datetime('not_before', '之前可用')->default(date('Y-m-d H:i:s'));
        $form->datetime('not_after', '之后可用')->default(date('Y-m-d H:i:s'));
        $form->switch('enabled', '是否启用')->default(1);
        return $form;
    }
}
