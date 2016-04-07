<?php
/**
 * @Author: Xiyou
 * @Date:   2016-04-07 13:21:18
 * @Last Modified by:   Xiyou
 * @Last Modified time: 2016-04-07 15:10:08
 */

class user_model extends spModel
{

	private $pk = 'id';
	public $table = 'admin';

	var $addrules = array();

	var $verifier = array(
		"rules" => array( // 规则
			'username' => array(  // 这里是对username的验证规则
				'notnull' => TRUE, // username不能为空
				'minlength' => 5,  // username长度不能小于5
				'maxlength' => 12, // username长度不能大于12
			),
			'email' => array(   // 这里是对email的验证规则
				'notnull' => TRUE, // email不能为空
				'email' => TRUE,   // 必须要是电子邮件格式
				'minlength' => 8,  // email长度不能小于8
				'maxlength' => 20, // email长度不能大于20
			),
		),
		"messages" => array( // 提示信息
			'username' => array(
				'notnull' => "姓名不能为空",
				'minlength' => "姓名不能少于5个字符",
				'maxlength' => "姓名不能大于20个字符",
				'youare' => "看来你不是jake", // 没有出现在规则中的信息提示
			),
		)
	);


	
	function __construct(argument)
	{
		# code...
	}

	public function checkUser(){

	}
}