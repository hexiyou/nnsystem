<?php
/**
 * @Author: Lonelyer <hackkey@qq.com>
 * @link:  http://www.7s.com.cn
 * @Date:   2016-04-09 11:01:46
 * @Last Modified time: 2016-05-16 17:59:28
 * @Packages:   nnCMS
 * @Copyright: Copyright (c) 2016 7s.com.cn.Co.Ltd. All rights reserved.
 */
defined('IN_APP') or exit('Access Denied!');
defined('IN_ADMIN') or exit('Access Denied!');
class ajax extends base
{

	public $auto_display = false;
	
	public function __construct()
	{
		parent::__construct();
	}


	public function index(){

	}

	/**
	 * [checkUsername 检查管理员用户名是否重复]
	 * @return [type] [description]
	 */
	public function checkUsername(){
		$_username = $this->spArgs('username');
		$db = spDB('admin');
		$row = $db->find(array('user_name'=>$_username));
		if(!empty($row)){
			$msg = array('status'=>'error','msg'=>'用户名不能重复');
			echo json_encode($msg,true);
			// echo "false";
		}else{
			$msg = array('status'=>'success','msg'=>'验证通过');
			echo json_encode($msg,true);
			// echo "true";
		}
	}

	/**
	 * [checkEmail 检查管理员电子邮箱唯一性
	 * @return [type] [description]
	 */
	public function checkEmail(){
		$_email = $this->spArgs('email');
		$db = spDB('admin');
		$row = $db->find(array('email'=>$_email));
		if(!empty($row)){
			$msg = array('status'=>'error','msg'=>'电子邮件不能重复');
			echo json_encode($msg,true);
			// echo "false";
		}else{
			$msg = array('status'=>'success','msg'=>'验证通过');
			echo json_encode($msg,true);
			// echo "true";
		}
	}

}