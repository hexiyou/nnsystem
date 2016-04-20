<?php
/**
 * @Author: Lonelyer <hackkey@qq.com>
 * @link:  http://www.7s.com.cn
 * @Date:   2016-04-09 18:59:47
 * @Last Modified time: 2016-04-20 14:37:04
 * @Packages:   nnCMS
 * @Copyright: Copyright (c) 2016 7s.com.cn.Co.Ltd. All rights reserved.
 */
class category extends baseContoller
{
	public $page_title = "商品分类";
	
	function __construct()
	{
		parent::__construct();
		//echo $GLOBALS['__action'];
	}

	public function index(){
		$this->display('category_list');
	}

	public function grid(){
		echo "1111";
		$this->display('category-grid');
	}

	public function listAction(){
		$this->display('category_list');
	}
}