<?php
/**
 * @Author: Xiyou
 * @Date:   2016-04-07 13:20:33
 * @Last Modified by:   Xiyou
 * @Last Modified time: 2016-04-07 15:19:36
 */

class user extends spController
{

	public function __construct()
	{
		parent::__construct();
	}
	
	function index(){

	}


	function login(){
		$this->display('login.html');
	}


	function admin_add(){
		$this->display('index.html');
	}


	function auto(){
		$this->allvars=$_SERVER;
	}
}