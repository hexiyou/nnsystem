<?php
/**
 * @Author: Xiyou
 * @Date:   2016-04-09 09:19:57
 * @Last Modified by:   Xiyou
 * @Last Modified time: 2016-04-09 16:27:33
 */

class category extends baseContoller
{
	public $page_title = "商品分类";
	
	function __construct()
	{
		parent::__construct();
	}

	public function grid(){
		$this->display('category-grid.html');
	}

	public function list_action(){

	}
}