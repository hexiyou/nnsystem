<?php
/**
 * @Author: Xiyou
 * @Date:   2016-04-07 13:21:18
 * @Last Modified by:   Xiyou
 * @Last Modified time: 2016-05-04 20:25:28
 */

class user_model extends spModel
{

	public $pk = 'id';
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


	
	public function __construct()
	{
		parent::__construct();
		$this->group_table = spClass('admin_group_model');
	}

	public function checkUser(){

	}



	public function getGroupName($groupid){
		if($groupid==null) return false;
		$result = $this->group_table->find(array('id'=>$groupid));
		return $result!=false?$result['title']:'Unknown';
	}



	public function getUserByID($user_id){
		return $this->find(array('id'=>$user_id));
	}

	/**
	 * [getList 获取管理员用户列表，带分页输出]
	 * @param  integer $page 当前页码
	 * @param  integer $pageSize 页长/记录条数
	 * @param  [type] $conditions [description]
	 * @param  [type] $sort       [description]
	 * @param  [type] $fields     [description]
	 * @return [type]             [description]
	 */
	public function getList($page, $pageSize=10, $conditions = null, $sort = null, $fields = null){
		$data = $this->spPager($page, $pageSize)->findAll($conditions, $sort, $fields);
		foreach ($data as $key => $row) {
			$data[$key]['groupname'] = $this->getGroupName($row['groupid']);
			$data[$key]['create_time'] = date("Y-m-d H:i",$row['create_time']);
			$data[$key]['last_login'] = date("Y-m-d H:i",$row['last_login']);
		}
		return $data;
	}
}