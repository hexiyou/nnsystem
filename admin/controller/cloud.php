<?php
/**
 * @Author: Lonelyer <hackkey@qq.com>
 * @link:  http://www.7s.com.cn
 * @Date:   2016-05-17 12:30:58
 * @Last Modified time: 2016-05-17 15:07:14
 * @Packages:   nnCMS
 * @Copyright: Copyright (c) 2016 7s.com.cn.Co.Ltd. All rights reserved.
 */
/**
 * 云平台控制器 
 */
defined('IN_APP') or exit('Access Denied!');
defined('IN_ADMIN') or exit('Access Denied!');
class cloud extends base
{
	public $auto_display = false;

	public function __construct()
	{
		parent::__construct();
	}


	public function update(){
		echo "在线升级";
	}


	public function plugins(){
		
	}
}