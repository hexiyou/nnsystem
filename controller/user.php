<?php
/**
 * @Author: Lonelyer <hackkey@qq.com>
 * @link:  http://www.7s.com.cn
 * @Date:   2016-04-18 11:45:33
 * @Last Modified time: 2016-04-21 11:40:41
 * @Packages:   nnCMS
 * @Copyright: Copyright (c) 2016 7s.com.cn.Co.Ltd. All rights reserved.
 */
/**
 * 用户个人中心模块
 */
class user extends baseContoller
{
    public $page_title = "用户中心";
    
    public function __construct()
    {
        parent::__construct();
    }

    public function center(){
        echo "用户中心 test";
    }

    public function index(){
    	$this->login();
    }


    public function list_action(){
        echo $this->getHeaderStr();
        echo "这是用户中心列表";
        echo '<pre>';
        print_r($this->spArgs());
        echo $this->getFooterStr();
    }


    public function getall(){
        echo $this->getHeaderStr();
        echo "这是用户中心列表2呀";
        echo '<pre>';
        print_r($this->spArgs());
         echo $this->getFooterStr();
    }


    public function login(){
    	$this->display('login');
    }

    public function register(){
        $this->display('register');
    }
}