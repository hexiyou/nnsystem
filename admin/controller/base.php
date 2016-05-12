<?php
/**
 * @Author: Lonelyer <hackkey@qq.com>
 * @link:  http://www.7s.com.cn
 * @Date:   $DATE$ $TIME$
 * @Last Modified time: 2016-05-12 10:35:36
 * @Packages:   nnCMS
 * @User:  $user$
 * @File:  Filename()
 * @Copyright: Copyright (c) 2016 7s.com.cn.Co.Ltd. All rights reserved.
 */
defined('IN_APP') or exit('Access Denied!');
/**
 * Class base
 * @desscription 后台管理基础控制类,抽象类，被继承
 */
abstract class base extends spController
{
    public $version = 'V1.0';

    public $__pre_open = false; //是否已输出<pre>标签，调试用

    public $_cache_prefix='admin_user_';

    public $name = "nnCMS backend manage conntoller";

    public $no_author_contollers = array(
        'error_404',
        'login'

    );//不需要登录验证的controller


    public $addCss= array();//在header前附加的CSS

    public $insertJS = array(); //在header前插入的CSS

    public $appendJS = array();  //在页脚附加的JS文件

    /**
     * base constructor.
     */
    public function __construct()
    {
        global $__controller, $__action;
        parent::__construct();
        $this->enable_php_tag(TRUE); // 启用PHP标签
        $this->setAutoDisplay('ON'); //设置模板自动显示
        // 自动载入控制器相匹配的数据模型
        if (defined('AUTO_LOAD_MODEL')) {
            $__model_path = $GLOBALS['G_SP']['model_path'] . DSP . $__controller . '_model.php';
            if (AUTO_LOAD_MODEL && file_exists($__model_path)) {
                import($__model_path, false);
                class_exists($__controller . '_model') && $this->db = spClass($__controller . '_model', null, $__model_path);
            }
        }
        $this->checkLogin($__controller,$__action); //检查是否登录
        $this->checkPrivilege(); //检查是否有权限
        $this->autoSetVal(); //自动初始化参数
        $this->assignConst(); //赋值常用变量到模板
    }


    /**
     * 设置在否自动调用模板显示
     * @param string $status
     * @return bool
     */
    public function setAutoDisplay($status = 'ON')
    {
        switch ($status) {
            case "ON":
                $GLOBALS['G_SP']['view']['auto_display'] = TRUE;
                break;
            case "OFF":
                $GLOBALS['G_SP']['view']['auto_display'] = FALSE;
                break;
            default:
                $GLOBALS['G_SP']['view']['auto_display'] = $status;
        }
        return true;
    }

    /**
     * [enable_php_tag 是否允许在Smarty模板中书写PHP标签]
     * @param  boolean $status [开关选项TRUE OR FALASE]
     * @return [type]          [description]
     * @author hexiyou.cn@gmail.com
     */
    public function enable_php_tag($status = FALSE)
    {
        $this->getView()->allow_php_tag = $status;
    }

    /**
     * 根据控制器预定义的成员变量，设置初始参数
     *
     */
    public function autoSetVal()
    {
        if (isset($this->auto_display) && false === $this->auto_display) {
            $this->setAutoDisplay('OFF');
        }
        if(isset($this->page_title)){
            $this->assign('page_title',$this->page_title);
        }
        $title = isset($this->title)?$this->title:"";
        $this->assign('title',$title);
        $this->assign('__controller',$GLOBALS['__controller']);
        $this->assign('__action',$GLOBALS['__action']);
        ## coding
    }

    /**
     * [__set_siteConfig 赋值]
     * @return [type] [description]
     */
    public function __set_siteConfig(){
        $this->__set('CFG',$GLOBALS['G_C']); //config.php 配置项赋值
        $this->site_name = $GLOBALS['G_C']['site_name'];
        $this->site_url =  $GLOBALS['G_C']['site_url'];
    }


    /**
     * assgin __set函数别名，设置模板变量
     * @param $name
     * @param $value
     */
    public function assign($name, $value)
    {
        return $this->__set($name, $value);
    }

    /**
     * @param $var 要调试变量
     * @param bool $isreturn
     * @return string
     */
    public function dumpout($var,$isreturn=false)
    {
        $outstr = "";
        if(!$this->__pre_open){
            $outstr.="<pre>";
            $this->__pre_open = TRUE;
        }

        $outstr.=var_export($var,true);

        if($isreturn===TRUE){
            return $outstr;
        }

        echo $outstr;
    }


    /**
     *   __get 函数别名，获取模板变量值
     *
     * @param $name
     * @return mixed
     */
    public function getVal($name)
    {
        return $this->__get($name);
    }

    /**
     *  赋值常用模板变量
     * @author hexiyou.cn@gmail.com
     *
     */
    public function assignConst()
    {
        $this->__set('ADMIN_ROOT',ADMIN_ROOT);
        $this->__set('TPL_PATH',TPL_PATH);
        $this->__set('CSS_PATH', CSS_PATH);
        $this->__set('JS_PATH', JS_PATH);
        $this->__set('IMG_PATH', IMG_PATH);
        $this->__set('IMGS_PATH', IMGS_PATH);
        $this->__set_siteConfig();
    }


    //TODO: 判断是否是POST提交，不严谨,不推荐
    /**
     *  检测是否有POST数据提交
     * @return bool
     */
    public function hasPOST()
    {
        if (!empty($_POST)) {
            return true;
        } else {
            return false;
        }
    }


    /**
     * 检查当前是否有表单提交，和hasPOST有区别
     * @param string 要检查的字段名称，和form表单对应
     * @return bool
     */
    public function isPOST($field = "submit")
    {
        if ($this->spArgs($field) || isset($_POST[$field])) {
            return true;
        } else {
            return false;
        }
    }

    /**
     * [setPageSize cookie设置每页步长]
     * @param [type] $itemName [description]
     * @param [type] $itemVal  [description]
     */
    public function setPageSize($itemName,$itemVal){
        return set_cookie($itemName,$itemVal,'1d');
    }


    /**
     * [checkLogin 检查用户是否登录，并作相应处理]
     * @param  [type] $controller [description]
     * @param  [type] $action     [description]
     * @return [type]             [description]
     */
    public function checkLogin($controller,$action)
    {
        //登录页面不重复跳转
        if($controller=="user"&&$action=="login"){ 
           if($this->_checkUserLogin()){
                $this->jump(spUrl('main','index'));
            }
            return true;
        }
        if(in_array($controller,$this->no_author_contollers)){
            return true;
        }
        if(!$this->_checkUserLogin()){
            $direct = urlencode(spUrl($controller,$action));
            $args = array('r'=>$direct);
            $this->success('请先登录后再操作！',spUrl('user','login',$args));
            // $this->jump(spUrl('user','login'));
            return false;
        }
    }

    /**
     * [_getUserInfo 获取当前登录管理员用户信息]
     * @return [type] [description]
     */
    public function _getUserInfo(){
        $uid = get_cookie('uid');
        if(!$uid) return false;
        $_model = spClass('user_model');
        return $_model->getUserByID($uid);
    }

    /**
     * [_checkUserLogin 内部函数，检查用户登录是否有效]
     * @return boolean [description]
     */
    public function _checkUserLogin(){
        if($this->getuid()==null){
            return false;
        }
        $uid = get_session('uid');
        $_author_hash = get_session('author_hash');
        $_user = spAccess('r',$this->_cache_prefix.$uid);
        if(!$_user){
            $_model = spClass('user_model');
            $_user = $_model->getUserByID($uid); 
            spAccess('w',$this->_cache_prefix.$uid,$_user);         
        }
        if(!$_user||$_author_hash != md5($_user['password'].$_user['pwd_hash'])){
            return false;
        }
        return true;
    }


    /**
     * [_setUserStatus 设置用户登入]
     * @param [type] $_user [description]
     */
    public function _setUserStatus($_user){
        set_session('uid',$_user['id']);
        set_session('author_hash',md5($_user['password'].$_user['pwd_hash']));
        spAccess('w',$this->_cache_prefix.$uid,$_user);
        return true;
    }


    /**
     *  检查用户是否有该项的操作权限
     *
     */
    public function checkPrivilege()
    {
        return false;
    }

    /**
     *
     *  获取当前登录用户的ID
     */
    public function getuid()
    {
        return get_session('uid');
    }


     /**
     *
     * 错误提示程序
     *
     * 应用程序的控制器类可以覆盖该函数以使用自定义的错误提示
     *
     * @param $msg   错误提示需要的相关信息
     * @param $url   跳转地址
     */
    public function error($msg, $url = ''){
      /* if($url == "exit"){
           $url="";
        }else{
            $url = empty($url) ? "window.history.back();" : "location.href=\"{$url}\";";
        }
        echo "<html><head><meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\"><script>function sptips(){alert(\"{$msg}\");{$url}}</script></head><body onload=\"sptips()\"></body></html>";
        exit;*/
        $this->page_title = $msg;
        $this->msg = $msg;
        $this->url = $url;
        $this->display('error.html');
        exit();
    }

    /**
     *
     * 成功提示程序
     *
     * 应用程序的控制器类可以覆盖该函数以使用自定义的成功提示
     *
     * @param $msg   成功提示需要的相关信息
     * @param $url   跳转地址
     */
    public function success($msg, $url = ''){
      /*  if($url == "exit"){
           $url="";
        }else{
            $url = empty($url) ? "window.history.back();" : "location.href=\"{$url}\";";
        }
        echo "<html><head><meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\"><script>function sptips(){alert(\"{$msg}\");{$url}}</script></head><body onload=\"sptips()\"></body></html>";
        exit;*/
        $this->page_title = $msg;
        $this->msg = $msg;
        $this->url = $url;
        $this->display('success.html');
        exit();
    }

}