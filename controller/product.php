<?php
/**
 * @Author: Lonelyer <hackkey@qq.com>
 * @link:  http://www.7s.com.cn
 * @Date:   2016-04-18 10:14:32
 * @Last Modified time: 2016-04-20 18:52:43
 * @Packages:   nnCMS
 * @Copyright: Copyright (c) 2016 7s.com.cn.Co.Ltd. All rights reserved.
 */

class product extends baseContoller
{
    
	public $page_title = "产品详情";

    public function __construct()
    {
        parent::__construct();
    }


    public function index(){
    	$this->display('product');
    }


    public function full(){

    }
}