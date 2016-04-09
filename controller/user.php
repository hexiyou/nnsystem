<?php
/**
 * @Author: Xiyou
 * @Date:   2016-04-09 16:49:26
 * @Last Modified by:   Xiyou
 * @Last Modified time: 2016-04-09 17:50:32
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

    public function index(){
    	$this->login();
    }


    public function login(){
    	$this->display('login.html');
    }
}