<?php
/**
 * @Author: Lonelyer <hackkey@qq.com>
 * @link:  http://www.7s.com.cn
 * @Date:   2016-04-09 18:59:47
 * @Last Modified time: 2016-04-18 11:03:24
 * @Packages:   nnCMS
 * @Copyright: Copyright (c) 2016 7s.com.cn.Co.Ltd. All rights reserved.
 */
class category extends baseContoller
{
	public $page_title = "商品分类";
	
	function __construct()
	{
		parent::__construct();
	}

	public function index(){

	}

	public function grid(){
		$this->display('category-grid');
	}

	public function clist(){
		$this->display('category_list');
	}
}