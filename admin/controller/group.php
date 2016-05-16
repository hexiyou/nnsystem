<?php
/**
 * @Author: Lonelyer <hackkey@qq.com>
 * @link:  http://www.7s.com.cn
 * @Date:   2016-04-18 11:45:24
 * @Last Modified time: 2016-05-16 18:25:27
 * @Packages:   nnCMS
 * @Copyright: Copyright (c) 2016 7s.com.cn.Co.Ltd. All rights reserved.
 */
defined('IN_APP') or exit('Access Denied!');
defined('IN_ADMIN') or exit('Access Denied!');
/**
 * 管理员用户组管理
 */
class group extends base
{
    public $page_title = "用户组管理";

    public function __construct()
    {
        parent::__construct();
    }

	/**
	 * [index description]
	 * @return [type] [description]
	 */
    public function index(){
    	$this->display('user_group.html');
    }


    public function add(){
    	if($this->isPOST()){
    		
    	}else{
    		$this->display('group_add.html');
    	}
    }
}