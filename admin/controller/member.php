<?php
/**
 * @Author: Lonelyer <hackkey@qq.com>
 * @link:  http://www.7s.com.cn
 * @Date:   2016-04-18 11:45:24
 * @Last Modified time: 2016-05-16 11:40:52
 * @Packages:   nnCMS
 * @Copyright: Copyright (c) 2016 7s.com.cn.Co.Ltd. All rights reserved.
 */
defined('IN_APP') or exit('Access Denied!');
defined('IN_ADMIN') or exit('Access Denied!');
/**
 *  用户管理
 */
class member extends base
{
    public function __construct()
    {
        parent::__construct();
    }

    public function index(){

    }

    /**添加用户**/
    public function add(){

    	$this->display('member_add.html');
    }

    /**删除用户**/
    public function remove(){

    }

    /**修改用户**/
    public function edit(){

    }


    public function log(){

    }



    public function get_params(){
        
    }


}
