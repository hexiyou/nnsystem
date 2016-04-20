<?php
/**
 * @Author: Lonelyer <hackkey@qq.com>
 * @link:  http://www.7s.com.cn
 * @Date:   2016-04-20 19:20:08
 * @Last Modified time: 2016-04-20 19:21:32
 * @Packages:   nnCMS
 * @Copyright: Copyright (c) 2016 7s.com.cn.Co.Ltd. All rights reserved.
 */

class cart extends baseContoller
{
	public $page_title = "购物车";
	
	function __construct()
	{
		parent::__construct();
	}

	public function index(){
		$this->display('cart');
	}
}