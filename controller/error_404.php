<?php
/**
 * @Author: Xiyou
 * @Date:   2016-04-09 13:29:37
 * @Last Modified by:   Xiyou
 * @Last Modified time: 2016-04-09 15:38:06
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