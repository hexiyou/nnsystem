<?php
/**
 * @Author: Lonelyer <hackkey@qq.com>
 * @link:  http://www.7s.com.cn
 * @Date:   2016-04-09 09:18:48
 * @Last Modified time: 2016-04-20 19:15:47
 * @Packages:   nnCMS
 * @Copyright: Copyright (c) 2016 7s.com.cn.Co.Ltd. All rights reserved.
 */
/**
*   新闻模块控制器
*/
class article extends baseContoller
{
	public $page_title = "文章列表";
	
	function __construct()
	{
		parent::__construct();
	}

	public function index(){
		$this->display('typography');
	}
}