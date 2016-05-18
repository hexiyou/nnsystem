<?php
/**
 * @Author: Lonelyer <hackkey@qq.com>
 * @link:  http://www.7s.com.cn
 * @Date:   2016-04-18 11:45:24
 * @Last Modified time: 2016-05-18 18:57:28
 * @Packages:   nnCMS
 * @Copyright: Copyright (c) 2016 7s.com.cn.Co.Ltd. All rights reserved.
 */

class article extends base
{
	
	public function __construct()
	{
		parent::__construct();
	}

	public function index(){
		
	}


	public function list_action()
	{
		$this->display('article_list.html');
	}
}