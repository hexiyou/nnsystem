<?php
/**
 * @Author: Lonelyer <hackkey@qq.com>
 * @link:  http://www.7s.com.cn
 * @Date:   2016-04-14 16:02:14
 * @Last Modified time: 2016-04-15 10:20:36
 * @Packages:   nnCMS
 * @Copyright: Copyright (c) 2016 7s.com.cn.Co.Ltd. All rights reserved.
 */
/**
 * 单页管理控制器
 */
class page extends baseContoller
{
    /**
     * summary
     */
    public function __construct()
    {
        parent::__construct();
    }


    public function index(){

    }


    /**
     * [about 关于我们]
     * @return [type] [description]
     */
    public function about(){
    	$this->page_title = "关于我们";
    	$this->display('about');
    }

    /**
     * [show 显示单页页面]
     * @return [type] [description]
     */
    public function show(){

    }
}