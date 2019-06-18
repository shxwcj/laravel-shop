<?php

/**
 * 1.如果想要在其他页面也显示这个类目菜单，则需在对应控制器中获取类目树并注入到模板中，如果页面比较多，会出现大量复制粘贴的代码；
 * 2.获取类目树的代码与控制器的业务逻辑无关，可能会让刚接手项目的开发人员比较迷惑。
 * 对于此类问题，Laravel 提供了一个叫做 ViewComposer 的解决方案，ViewComposer 可以在不修改控制器的情况下直接向指定的模板文件注入变量。
 * 定义好 ViewComposer 之后我们还需要告诉 Laravel 要把这个 ViewComposer 应用到哪些模板文件里：
 * app/Providers/AppServiceProvider.php
 */
namespace App\Http\ViewComposers;

use App\Services\CategoryService;
use Illuminate\View\View;

class CategoryTreeComposer
{
    protected $categoryService;

    // 使用 Laravel 的依赖注入，自动注入我们所需要的 CategoryService 类
    public function __construct(CategoryService $categoryService)
    {
        $this->categoryService = $categoryService;
    }

    // 当渲染指定的模板时，Laravel 会调用 compose 方法
    public function compose(View $view)
    {
        // 使用 with 方法注入变量
        $view->with('categoryTree', $this->categoryService->getCategoryTree());
    }
}