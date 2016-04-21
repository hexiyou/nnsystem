<?php
/**
 * @Author: Lonelyer <hackkey@qq.com>
 * @link:  http://www.7s.com.cn
 * @Date:   2016-04-18 11:45:33
 * @Last Modified time: 2016-04-21 11:42:50
 * @Packages:   nnCMS
 * @Copyright: Copyright (c) 2016 7s.com.cn.Co.Ltd. All rights reserved.
 */
/**
 *  前台404错误句柄控制器
 */
class error_404 extends baseContoller
{
	public $page_title = "404 未找到页面";

	public function __construct()
	{
		parent::__construct();
	}

	public function handle(){
		$this->display('404.html');
	}
}