<?php

namespace App\Admin\Controllers;

use App\Models\Category;
use App\Models\CrowdfundingProduct;
use App\Models\Product;
use App\Http\Controllers\Controller;
use Encore\Admin\Controllers\HasResourceActions;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Layout\Content;
use Encore\Admin\Show;
use Illuminate\Support\Str;

class CrowdfundingProductsController extends CommonProductsController
{
    /*--------代码封装前--------开始*/
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
//            ->header('众筹商品列表')
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
//            ->header('众筹商品详情')
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
//            ->header('编辑众筹商品')
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
//            ->header('创建众筹商品')
//            ->description('description')
//            ->body($this->form());
//    }
//    /**
//     * Make a grid builder.
//     *
//     * @return Grid
//     */
//    protected function grid()
//    {
//        $grid = new Grid(new Product);
//        // 只展示 type 为众筹类型的商品
//        $grid->model()->where('type',Product::TYPE_CROWDFUNDING);
//        $grid->id('Id')->sortable();
//        $grid->title('商品名称');
//        $grid->on_sale('已上架')->display(function ($value) {
//            return $value ? '是' : '否';
//        });
//        $grid->price('商品价格');
//        // 展示众筹相关字段
//        $grid->column('crowdfunding.target_amount','目标金额');
//        $grid->column('crowdfunding.total_amount','目前金额');
//        $grid->column('crowdfunding.end_at','结束时间');
//        $grid->column('crowdfunding.status','状态')->display(function ($value){
//            return CrowdfundingProduct::$statusMap[$value];
//        });
//        $grid->tools(function ($tools) {
//            // 禁用批量删除按钮
//            $tools->batch(function ($batch) {
//                $batch->disableDelete();
//            });
//        });
//        $grid->filter(function($filter) use ($grid){
//            $filter->disableIdFilter();
//            $filter->like('title','商品名称');
//            $filter->where(function ($query){
//                $query->whereHas('crowdfunding', function ($query) {
//                    $query->where('target_amount',"{$this->input}");
//                });
//            },'目标金额');
//            $filter->between('price', '商品价格');
//        });
//        return $grid;
//    }
//  /**
//     * Make a show builder.
//     *
//     * @param mixed $id
//     * @return Show
//     */
//    protected function detail($id)
//    {
//        $show = new Show(Product::findOrFail($id));
//
//        $show->id('Id');
//        $show->title('商品名称');
//        $show->image('图片')->as(function ($pictures) {
//            try {
//                $html = '';
//                if (Str::startsWith($pictures,['http://','https://'])){
//                    $html .= "  <img src='$pictures' style='max-height:200px; margin-right=10px' /> &nbsp;";
//                }else{
//                    $pictures =\Storage::disk('public')->url($pictures);
//                    $html .= "  <img src='$pictures' style='max-height:200px; margin-right=10px' /> &nbsp;";
//                }
//                return $html;
//            }catch (\Exception $e){
//            }
//        })->unescape();
//        $show->on_sale('已上架')->as(function ($value) {
//            return $value ? '是' : '否';
//        });
//
//        $show->rating('评分');
//        $show->sold_count('销量');
//        $show->review_count('评价数');
//        $show->price('价格');
//        return $show;
//    }
//    /**
//     * Make a form builder.
//     *
//     * @return Form
//     */
//    protected function form()
//    {
//        $form = new Form(new Product);
//        // 在表单中添加一个名为 type，值为 Product::TYPE_CROWDFUNDING 的隐藏字段
//        $form->hidden('type')->value(Product::TYPE_CROWDFUNDING);
//
//        $form->text('title', '商品名称')->rules('required');
//        $form->select('category_id', '类目')->options(function ($id) {
//            $category = Category::find($id);
//            if ($category) {
//                return [$category->id => $category->full_name];
//            }
//        })->ajax('/admin/api/categories?is_directory=0');
//
//        $form->image('image', '封面图片')->rules('required|image');
//        $form->editor('description', '商品描述')->rules('required');
//        $form->radio('on_sale', '上架')->options(['1' => '是', '0' => '否'])->default('1');
//
//        // 添加众筹相关字段
//        $form->text('crowdfunding.target_amount', '众筹目标金额')->rules('required|numeric|min:0.01');
//        $form->datetime('crowdfunding.end_at', '众筹结束时间')->rules('required|date');
//
//        $form->hasMany('skus', '商品 SKU', function (Form\NestedForm $form) {
//            $form->text('title', 'SKU 名称')->rules('required');
//            $form->text('description', 'SKU 描述')->rules('required');
//            $form->text('price', '单价')->rules('required|numeric|min:0.01');
//            $form->text('stock', '剩余库存')->rules('required|integer|min:0');
//        });
//
//        $form->saving(function (Form $form) {
//            $form->model()->price = collect($form->input('skus'))->where(Form::REMOVE_FLAG_NAME, 0)->min('price');
//        });
//
//        $form->tools(function (Form\Tools $tools) {
//            // 去掉`删除`按钮
//            $tools->disableDelete();
//            // 去掉`查看`按钮
//            $tools->disableView();
//        });
//        $form->footer(function ($footer) {
//            // 去掉`查看`checkbox
//            $footer->disableViewCheck();
//            // 去掉`继续编辑`checkbox
//            $footer->disableEditingCheck();
//            // 去掉`继续创建`checkbox
//            $footer->disableCreatingCheck();
//        });
//
//        return $form;
//    }
//    /**
//     * @param $id
//     * @return \Illuminate\Http\JsonResponse
//     */
//    public function destroy($id)
//    {
//        $product = Product::find($id);
//        $crowdfunding = $product->type;
//        if ($crowdfunding == Product::TYPE_CROWDFUNDING) {
//            $product->crowdfunding()->delete();
//        }
//        $product->skus()->delete();
//        if ($this->form()->destroy($id)) {
//            $data = [
//                'status' => true,
//                'message' => trans('admin.delete_succeeded'),
//            ];
//        } else {
//            $data = [
//                'status' => false,
//                'message' => trans('admin.delete_failed'),
//            ];
//        }
//        return response()->json($data);
//    }
    /*--------代码封装前--------结束*/


/*---------------------代码封装后-----------------------------------开始*/
    // 移除 HasResourceActions  // 移除 `index()` / `create()` / `edit()` / `detail()` 这四个方法
    public function getProductType()
    {
        return Product::TYPE_CROWDFUNDING;
    }

    protected function customGrid(Grid $grid)
    {
        $grid->id('Id')->sortable();
        $grid->title('商品名称');
        $grid->on_sale('已上架')->display(function ($value) {
            return $value ? '是' : '否';
        });
        $grid->price('商品价格');
        // 展示众筹相关字段
        $grid->column('crowdfunding.target_amount','目标金额');
        $grid->column('crowdfunding.total_amount','目前金额');
        $grid->column('crowdfunding.end_at','结束时间');
        $grid->column('crowdfunding.status','状态')->display(function ($value){
            return CrowdfundingProduct::$statusMap[$value];
        });
        $grid->filter(function($filter) use ($grid){
            $filter->where(function ($query){
                $query->whereHas('crowdfunding', function ($query) {
                    $query->where('target_amount',"{$this->input}");
                });
            },'目标金额');
        });
    }

    protected function customShow(Show $show)
    {
        // 众筹商品没有额外的字段，因此这里不需要写任何代码
    }

    protected function customForm(Form $form)
    {
        // 添加众筹相关字段
        $form->text('crowdfunding.target_amount', '众筹目标金额')->rules('required|numeric|min:0.01');
        $form->datetime('crowdfunding.end_at', '众筹结束时间')->rules('required|date');
    }

/*---------------------代码封装后-----------------------------------结束*/

}
