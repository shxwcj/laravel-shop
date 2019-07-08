<?php

namespace App\Admin\Controllers;

use App\Models\Product;
use App\Models\SeckillProduct;
use Encore\Admin\Controllers\HasResourceActions;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Layout\Content;
use Encore\Admin\Show;

class SeckillProductsController extends CommonProductsController
{
// -----------------------------封装之前的代码----------------开始
//    use HasResourceActions;
//
//    /**
//     * Index interface.
//     *
//     * @param Content $content
//     * @return Content
//     */
//    public function index(Content $content)
//    {
//        return $content
//            ->header('Index')
//            ->description('description')
//            ->body($this->grid());
//    }
//
//    /**
//     * Show interface.
//     *
//     * @param mixed $id
//     * @param Content $content
//     * @return Content
//     */
//    public function show($id, Content $content)
//    {
//        return $content
//            ->header('Detail')
//            ->description('description')
//            ->body($this->detail($id));
//    }
//
//    /**
//     * Edit interface.
//     *
//     * @param mixed $id
//     * @param Content $content
//     * @return Content
//     */
//    public function edit($id, Content $content)
//    {
//        return $content
//            ->header('Edit')
//            ->description('description')
//            ->body($this->form()->edit($id));
//    }
//
//    /**
//     * Create interface.
//     *
//     * @param Content $content
//     * @return Content
//     */
//    public function create(Content $content)
//    {
//        return $content
//            ->header('Create')
//            ->description('description')
//            ->body($this->form());
//    }
//
//    /**
//     * Make a grid builder.
//     *
//     * @return Grid
//     */
//    protected function grid()
//    {
//        $grid = new Grid(new SeckillProduct);
//
//        $grid->id('Id');
//        $grid->product_id('Product id');
//        $grid->start_at('Start at');
//        $grid->end_at('End at');
//
//        return $grid;
//    }
//
//    /**
//     * Make a show builder.
//     *
//     * @param mixed $id
//     * @return Show
//     */
//    protected function detail($id)
//    {
//        $show = new Show(SeckillProduct::findOrFail($id));
//
//        $show->id('Id');
//        $show->product_id('Product id');
//        $show->start_at('Start at');
//        $show->end_at('End at');
//
//        return $show;
//    }
//
//    /**
//     * Make a form builder.
//     *
//     * @return Form
//     */
//    protected function form()
//    {
//        $form = new Form(new SeckillProduct);
//
//        $form->number('product_id', 'Product id');
//        $form->datetime('start_at', 'Start at')->default(date('Y-m-d H:i:s'));
//        $form->datetime('end_at', 'End at')->default(date('Y-m-d H:i:s'));
//
//        return $form;
//    }
// -----------------------------封装之前的代码----------------结束

    public function getProductType()
    {
        return Product::TYPE_SECKILL;
    }

    protected function customGrid(Grid $grid)
    {
        $grid->id('ID')->sortable();
        $grid->title('商品名称');
        $grid->on_sale('已上架')->display(function ($value) {
            return $value ? '是' : '否';
        });
        $grid->price('价格');
        $grid->column('seckill.start_at', '开始时间');
        $grid->column('seckill.end_at', '结束时间');
        $grid->sold_count('销量');
    }

    protected function customShow(Show $show)
    {
        $show->seckill('秒杀时间', function ($seckill) {
            $seckill->start_at('秒杀开始时间');
            $seckill->end_at('秒杀结束时间');
            $seckill->panel()
                ->tools(function ($tools) {
                    $tools->disableEdit();
                    $tools->disableList();
                    $tools->disableDelete();
                });;
        });
    }

    protected function customForm(Form $form)
    {
        // 秒杀相关字段
        $form->datetime('seckill.start_at', '秒杀开始时间')->rules('required|date');
        $form->datetime('seckill.end_at', '秒杀结束时间')->rules('required|date');
    }
}
