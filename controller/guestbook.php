<?php
/**
 * @Author: Lonelyer <hackkey@qq.com>
 * @link:  http://www.7s.com.cn
 * @Date:   $DATE$ $TIME$
 * @Last Modified time: 2016-04-20 18:39:50
 * @Packages:   nnCMS
 * @User:  $user$
 * @File:  Filename()
 * @Copyright: Copyright (c) 2016 7s.com.cn.Co.Ltd. All rights reserved.
 */
class guestBook extends baseContoller
{

    public $page_title = "留言簿";
	
	function __construct()
	{
		parent::__construct();
		# code...
	}

	public function index()
	{
		$this->head_title="欢迎使用留言簿";
		$this->display('guestbook');
	}


	/**
	 * [add 添加留言]
	 */
	public function add(){

	}
}