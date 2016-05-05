<?php
/**
 * @Author: Lonelyer <hackkey@qq.com>
 * @link:  http://www.7s.com.cn
 * @Date:   2016-04-18 11:45:24
 * @Last Modified time: 2016-05-05 13:55:00
 * @Packages:   nnCMS
 * @Copyright: Copyright (c) 2016 7s.com.cn.Co.Ltd. All rights reserved.
 */
defined('IN_APP') or exit('Access Denied!');
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
            $this->error('没有用户ID');
        }

        if($this->isPost()){
            $this->success('提交成功');
        }else{
            $this->page_title = "用户编辑";
            $user = $this->db->find(array('id'=>$uid));
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
            $this->error('没有用户ID');
        }elseif($uid<=1){
            $this->error('初始管理员用户不允许删除！');
            exit();
        }
        $this->db->delete(array('id'=>$uid));

        if($this->db->affectedRows<=0){
            $this->error('删除失败！');
        }
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
                $this->error('账户不存在！');
            }else{
                $this->error('登录失败！');

            }
        } else {
            $this->direct_url = urlencode($this->spArgs('r'));
            $this->display('login.html');
        }
    }


    /**
     * [logout 注销管理员登录]
     * @return [type] [description]
     */
    public function logout(){
        set_session('uid');
        set_session('author_hash');
        $this->success('退出成功!',spUrl('user','login'));
        //$this->jump(spUrl('user','login'));
    }


    public function admin_add()
    {
        $this->display('index.html');
    }


    public function auto()
    {
        $this->allvars = $_SERVER;
    }
}