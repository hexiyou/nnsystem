<?php
/**
 * @Author: Xiyou
 * @Date:   2016-04-09 16:49:26
 * @Last Modified by:   Xiyou
 * @Last Modified time: 2016-04-20 17:48:33
 */
/**
 * summary
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