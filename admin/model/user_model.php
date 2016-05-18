<?php
/**
 * @Author: Xiyou
 * @Date:   2016-04-07 13:21:18
 * @Last Modified by:   Xiyou
 * @Last Modified time: 2016-05-17 11:43:31
 */
defined('IN_APP') or exit('Access Denied!');
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

	/**
	 * [checkUser 检查用户名唯一性]
	 * @param  [type] $username [description]
	 * @return [type]           [description]
	 */
	public function checkUser($username){
		return $this->find(array('user_name'=>$username));
	}

	/**
	 * [add 添加管理员用户]
	 * @param [type] $data [description]
	 */
	public function add($data){
		$create_ip = ip();
		$create_time = time();
		$locked = $data['locked']?$data['locked']:0;
		$password = md5(md5($data['password']).$data['pwd_hash']);
		$crete_array = array(
			'user_name' => $data['username'],
			'password'=>$password,
			'pwd_hash' => $data['pwd_hash'],
			'email' => $data['email'],
			'mobile' => $data['mobile'],
			'birthday' => $data['birthday'],
			'create_time' => $create_time,
			'create_ip' => $create_ip,
			'list_order' => 100,
			'locked' =>$locked
			);
		return $this->create($crete_array);
	}


	public function getGroupName($groupid){
		if($groupid==null) return false;
		$result = $this->group_table->find(array('id'=>$groupid));
		return $result!=false?$result['title']:'Unknown';
	}


	/**
	 * [userLogin 后台用户登录统一入口]
	 * @param  string $user_name [用户名]
	 * @param  string $password  [密码]
	 * @return integer -1，账号不存在;-2.账户被禁用；0，登录失败;登录成功返回用户id;
	 */
	public function userLogin($user_name,$password){
         $_info = $this->find(array('user_name'=>$user_name));
         if(empty($_info)){
         	return -1; //账户不存在
         }
         $_halt = $_info['pwd_hash'];
         $_password = $_info['password'];
         $_lock_status = $_info['lock'];
         if($_lock_status==1) return -2; //账户被禁用
         $password_encrypt = md5(md5($password).$_halt);
         if($password_encrypt==$_password){
         	return $_info[$this->pk];
         }
         return 0;
	}

	/**
	 * [update_passwd 修改用户密码]
	 * @param  [type] $user_id      [description]
	 * @param  [type] $new_password [description]
	 * @return [type]               [description]
	 */
	public function update_passwd($user_id,$new_password){
		$_info = $this->find(array('id'=>$user_id));
         if(empty($_info)){
         	return false; //账户不存在
         }
         $_halt = $_info['pwd_hash'];
         $_password = $_info['password'];
         $password_encrypt = md5(md5($new_password).$_halt);
         return $this->update(array('id'=>$user_id),array('password'=>$password_encrypt));
	}


	/**
	 * [getUserByID 由用户ID获取用户信息]
	 * @param  [type] $user_id [description]
	 * @return [type]          [description]
	 */
	public function getUserByID($user_id){
		return $this->find(array('id'=>$user_id));
	}

	/**
	 * [getList 获取管理员用户列表，带分页输出]
	 * @param  integer $page 当前页码
	 * @param  integer $pageSize 页长/记录条数
	 * @param  [type] $conditions 查询条件
	 * @param  [type] $sort       排序
	 * @param  [type] $fields     待取出字段列表
	 * @return array             查询结果
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