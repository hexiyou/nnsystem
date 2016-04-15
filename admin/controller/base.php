<?php
/**
 * @Author: Lonelyer <hackkey@qq.com>
 * @link:  http://www.7s.com.cn
 * @Date:   $DATE$ $TIME$
 * @Last Modified time: 2016-04-15 11:25:15
 * @Packages:   nnCMS
 * @User:  $user$
 * @File:  Filename()
 * @Copyright: Copyright (c) 2016 7s.com.cn.Co.Ltd. All rights reserved.
 */

/**
 * Class base
 * @desscription 后台管理基础控制类
 */
class base extends spController
{
    public $version = 'V1.0';

    public $__pre_open = false; //是否已输出<pre>标签，调试用

    public $name = "nnCMS backend manage conntoller";



    public $no_author_contollers = array(
        'error_404',
        'login'


    );//不需要登录验证的controller



    /**
     * base constructor.
     */
    public function __construct()
    {
        parent::__construct();
        $this->enable_php_tag(TRUE); // 启用PHP标签
        $this->setAutoDisplay('ON'); //设置模板自动显示
        $this->checkLogin(); //检查是否登录
        $this->checkPrivilege(); //检查是否有权限
        $this->autoSetVal(); //自动初始化参数
        $this->assignConst(); //赋值常用变量到模板
    }


    /**
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


    //TODO: 判断是否是POST提交，不严谨
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
     *  检查用户是否登录
     * @return bool
     */
    public function checkLogin()
    {
        return false;
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

    }
}