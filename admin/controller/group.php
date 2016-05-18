<?php
/**
 * @Author: Lonelyer <hackkey@qq.com>
 * @link:  http://www.7s.com.cn
 * @Date:   2016-04-18 11:45:24
 * @Last Modified time: 2016-05-17 17:40:09
 * @Packages:   nnCMS
 * @Copyright: Copyright (c) 2016 7s.com.cn.Co.Ltd. All rights reserved.
 */
defined('IN_APP') or exit('Access Denied!');
defined('IN_ADMIN') or exit('Access Denied!');
/**
 * 管理员用户组管理
 */
class group extends base
{
    public $page_title = "用户组管理";

    public function __construct()
    {
        parent::__construct();
        $this->db=spClass('admin_group_model');
    }

	/**
	 * [index description]
	 * @return [type] [description]
	 */
    public function index(){
    	$this->assign('addCss',array("uniform.css","select2.css"));
        $this->assign('appendJS',array('jquery.ui.custom.js'));
    	$conditions = "status!=-1";
    	$pageSize = get_cookie('admin_pagesize')==null?10:get_cookie('admin_pagesize');
        if($this->spArgs('pagesize')!=null){
            $this->setPageSize('admin_pagesize',$this->spArgs('pagesize'));
            $pageSize = $this->spArgs('pagesize');
        }
        $page = $this->spArgs('page', 1);
        $this->_list = $this->db->getList($page,$pageSize,$conditions, $sort = null, $fields = null);
        $this->pager=$this->db->spPager()->getPager();
    	$this->display('user_group.html');
    }


    public function list_action(){
    	$this->index();
    }


    public function edit(){
    	$id = $this->spArgs('id');
    	if($this->isPOST()){
    		$title = $this->spArgs('name');
    		$description = $this->spArgs('description');
    		if(empty($title)){
    			$this->error('角色名为必填项');
    		}
    		$status = $this->spArgs('status',1);
    		$list_order = $this->spArgs('list_order',100);
            if($this->db->updateById($id,array($title,$description,$status,$list_order))){
            	$this->success(L('submit_success'));
            }else{
            	$this->error(L('submit_failure'));
            }
    		print_r($values);
    		exit();
    		$this->db->update($this->spArgs());
    	}else{
    		$this->group = $this->db->find(array('id'=>$id));
    		$this->display('group_edit.html');
    	}

    }


    /**
     * [delete 删除用户组]
     * @return [type] [description]
     */
    public function delete(){
    	$id = $this->spArgs('id');
    	if($id<=0){
    		$this->error(L('super_user_delete_denied'));
    	}
    	if($this->db->deleteByPk($id)){
    		$this->success(L('delete_success'));
    	}else{
    		$this->error(L('delete_failure'));
    	}
    }


    public function update_listorder(){

    }

    //权限设置
    public function priv_setting(){

    }

    //栏目权限
    public function role_priv(){

    }

    /**
     * [add 添加管理员用户组]
     */
    public function add(){
    	if($this->isPOST()){
    		$title = $this->spArgs('name');
    		$description = $this->spArgs('description');
    		if(empty($title)){
    			$this->error('角色名为必填项');
    		}
    		$status = $this->spArgs('status');
    		$list_order = $this->spArgs('list_order',100);
    		if($this->db->add($title,$description,$status,$list_order)){
    			$this->success('success');
    		}else{
    			$this->error('failure');
    		}
    	}else{
    		$this->display('group_add.html');
    	}
    }
}