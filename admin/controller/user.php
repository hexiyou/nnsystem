<?php
/**
 * @Author: Lonelyer <hackkey@qq.com>
 * @link:  http://www.7s.com.cn
 * @Date:   2016-04-18 11:45:24
 * @Last Modified time: 2016-05-17 13:10:41
 * @Packages:   nnCMS
 * @Copyright: Copyright (c) 2016 7s.com.cn.Co.Ltd. All rights reserved.
 */
defined('IN_APP') or exit('Access Denied!');
defined('IN_ADMIN') or exit('Access Denied!');
class user extends base
{
    public $auto_display = false; //关闭自动模板输出
    public $page_title = "用户管理";

    public function __construct()
    {
        parent::__construct();
    }

    public function index()
    {
        $this->assign('addCss',array("uniform.css","select2.css"));
        $this->assign('appendJS',array('jquery.ui.custom.js'));
        $pageSize = get_cookie('admin_pagesize')==null?10:get_cookie('admin_pagesize');
        if($this->spArgs('pagesize')!=null){
            $this->setPageSize('admin_pagesize',$this->spArgs('pagesize'));
            $pageSize = $this->spArgs('pagesize');
        }
        $page = $this->spArgs('page', 1);
        $_search = $this->spArgs('search','');
        $conditions = null;
        if($_search!=""){
           if(is_email($_search)){
             $conditions = '`email`='.$_search;
           }elseif(is_mobilePhone($_search)){
             $conditions = '`mobile`='.$_search;
           }else{
             $conditions = "";
             $_where[]= '`user_name` LIKE \'%'.$_search.'%\'';
             $_where[]= '`email` LIKE \'%'.$_search.'%\'';
             $_where[]= '`mobile` LIKE \'%'.$_search.'%\'';
             $conditions = implode(' OR ',$_where);
           }
        }
        //获取管理员用户列表
        $this->user_list = $this->db->getList($page,$pageSize,$conditions, $sort = null, $fields = null);
        $this->pager=$this->db->spPager()->getPager();
        $this->display('user.html');
    }


    public function list_action(){
        $this->index();
    }

    /**
     * [group 用户组管理]
     * @return [type] [description]
     */
    public function group(){

    }

    /**
     * [edit 修改管理员用户]
     * @return [type] [description]
     */
    public function edit(){
        $uid = $this->spArgs('id');
        if($uid==null){
            $this->error(L('empty_uid'));
        }

        if($this->isPost()){
            $this->success(L('submit_success'));
        }else{
            $this->page_title = L('user_edit');
            $this->user = $this->db->find(array('id'=>$uid));
            $this->display('user_edit.html');
        }
    }

    /**
     * [delete 删除管理员用户]
     * @return [type] [description]
     */
    public function delete(){
        $uid = $this->spArgs('id');
        if($uid==null){
            $this->error(L('not_selected_item'));
        }elseif($uid<=1){
            $this->error('初始管理员用户不允许删除！');
            exit();
        }

        if(is_array($uid)){
            $uid = implode(',',$uid);
            $conditions = '`id` IN ('.$uid.')';
        }else{
            $conditions = array('id'=>$uid);
        }
        $this->db->delete($conditions);

        if($this->db->affectedRows()<=0){
            $this->error(L('delete_faliure'));
            exit();
        }
        $this->jump($this->referer);
    }

    /**
     * [login 管理员登录]
     * @return [type] [description]
     */
    public function login()
    {
        if ($this->isPOST()) {
            $user_name = $this->spArgs('username');
            $password = $this->spArgs('password');
            if(empty($user_name)||empty($password)){
                $this->error('账号和密码不能为空!');
            }
            $touch = $this->db->userLogin($user_name,$password);
            if($touch>=1){
                $user = $this->db->getUserByID($touch);
                $this->_setUserStatus($user);
                $direct_url = urldecode($this->spArgs('r',spUrl('main','index')));
                $this->jump($direct_url);
            }elseif($touch==-1){
                $this->error(L('account_does_not_exist'));
            }else{
                $this->error(L('login_error'));

            }
        } else {
            $this->direct_url = urlencode($this->spArgs('r'));
            $this->display('login.html');
        }
    }


    /**
     * [logout 注销管理员登录，显式]
     * @return [type] [description]
     */
    public function logout(){
        $this->_logout();
        $this->success('退出成功!',spUrl('user','login'));
    }

    /**
     * [_logout 注销管理员登录，隐式]
     * @return [type] [description]
     */
    public function _logout(){
        $this->_clearUserCache($this->getuid());
        set_session('uid');
        set_session('author_hash');
    }


    /**
     * [update_listorder 更新排序]
     * @return [type] [description]
     */
    public function update_listorder(){
        if($this->isPOST('exec')){
            $exec = $this->spArgs('exec','');
            $_query_arr = explode(",",$exec);
            foreach ($_query_arr as $key => $val) {
               $_item_arr = explode("#",$val);
                if(!$this->db->update(array('id'=>$_item_arr[0]),array('list_order'=>$_item_arr[1]))){
                    $this->error(L('operation_failure'),$this->referer);
                }
            }
            $this->success(L('listorder_update_success'),$this->referer);
        }else{
            $this->list_action();
        }
    }

    /**
     * [add 添加管理员用户]
     */
    public function add()
    {
        if($this->isPOST()){
            $_username = $this->spArgs('username');
            if($this->db->checkUser($_username)){
                $this->error('用户名不能重复！');
            }
            $_pwd_halt = create_randomstr(6);
            $_password = $this->spArgs('password');
            $_email = $this->spArgs('email');
            $_mobile = $this->spArgs('mobile','');
            $_user_group =$this->spArgs('user_group','1');
            $_birthday = $this->spArgs('birthday','');
            $_locked = $this->spArgs('status');
            $data = array(
                'username'=>$_username,
                'password'=>$_password,
                'pwd_hash'=> $_pwd_halt,
                'user_group'=>$_user_group,
                'email'=>$_email,
                'mobile'=>$_mobile,
                'birthday'=>$_birthday,
                'locked'=>$_locked
                );
            if(strlen($_password)<6||strlen($_password)>16){
                $this->error('密码长度应为6-16个字符！');
            }
            if($this->db->add($data)){
                $this->success(L('add_success'),spUrl('user','add'));
            }else{
                $this->error(L('add_failure'));
            }
        }else{
            $this->display('user_add.html');
        }
    }

    /**
     * [changepwd 更改当前登录管理员密码]
     * @return [type] [description]
     */
    public function changepwd(){
        if($this->isPOST()){
            $old_password = $this->spArgs('old_password');
            $new_password = $this->spArgs('new_password');
            $user_name = $this->getusername();
            if(!$old_password||!$new_password){
                $this->error('原密码和新密码不能为空');
            }

            if(!$this->db->userLogin($user_name,$old_password)){
                $this->error('原始密码填写错误，请修正');
            }
            $user = $this->_getUserInfo();
            if($this->db->update_passwd($user['id'],$new_password)){
                $this->_logout();
                $this->success(L('update_passwd_success'),spUrl('user','login'));
            }else{
                $this->error(L('update_passwd_failure'));
            }
        }else{
            $this->_user = $this->_getUserInfo();
            $this->display('change_pwd.html');
        }
    }

}