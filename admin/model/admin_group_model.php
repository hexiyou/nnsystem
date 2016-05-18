<?php
/**
 * @Author: Lonelyer <hackkey@qq.com>
 * @link:  http://www.7s.com.cn
 * @Date:   2016-05-17 12:31:03
 * @Last Modified time: 2016-05-17 17:23:36
 * @Packages:   nnCMS
 * @Copyright: Copyright (c) 2016 7s.com.cn.Co.Ltd. All rights reserved.
 */

class admin_group_model extends spModel
{

	public $pk = 'id';
	public $table = 'admin_group';

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
	}

	/**
	 * [updateById 根据ID更新用户组]
	 * @param  [type] $pk   [description]
	 * @param  [type] $data [description]
	 * @return [type]       [description]
	 */
	public function updateById($pk,$data){
		list($title,$description,$status,$list_order) = $data;
		$insert = array(
			'title' => $title,
			'description' => $description,
			'status'=>$status,
			'list_order'=>$list_order
			);
		return $this->update(array('id'=>$pk),$insert);
	}

	/**
	 * [add 添加管理员用户组]
	 * @param [type]  $title       [description]
	 * @param [type]  $description [description]
	 * @param integer $status      [description]
	 * @param integer $order       [description]
	 */
	public function add($title,$description,$status=1,$order=100){
		$insert_array = array('type'=>0,'title'=>$title,'description'=>$description,'status'=>$status,'list_order'=>$order);
		return $this->create($insert_array);
	}

	/**
	 * [getList 获取管理组列表]
	 * @param  [type]  $page       [description]
	 * @param  integer $pageSize   [description]
	 * @param  [type]  $conditions [description]
	 * @param  [type]  $sort       [description]
	 * @param  [type]  $fields     [description]
	 * @return [type]              [description]
	 */
	public function getList($page, $pageSize=10, $conditions = null, $sort = null, $fields = null){
		$data = $this->spPager($page, $pageSize)->findAll($conditions, $sort, $fields);
		return $data;
	}
	
}