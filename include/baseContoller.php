<?php
/**
 * @Author: Lonelyer <hackkey@qq.com>
 * @link:  http://www.7s.com.cn
 * @Date:   $DATE$ $TIME$
 * @Last Modified time: 2016-04-20 18:45:29
 * @Packages:   nnCMS
 * @User:  $user$
 * @File:  Filename()
 * @Copyright: Copyright (c) 2016 7s.com.cn.Co.Ltd. All rights reserved.
 */

/**
 *  baseContoller 前台基础控制器类
 *
 *  前台所有控制器方法在此基础上继承拓展
 *  
 */
abstract class baseContoller extends spController
{
    public $ctl_version = 'V1.0';

    function __construct()
    {
        global $__controller, $__action;
        parent::__construct();
        if ($GLOBALS['G_C']['template_suffix'] != "") {
            $this->tpl_suffix = $GLOBALS['G_C']['template_suffix'];
        }
        $this->__set_siteConfig(); //公共变量赋值
        $this->seo();
        if (IS_DEBUG) $this->enable_php_tag(TRUE);
        // 自动载入控制器相匹配的数据模型
        if (defined('AUTO_LOAD_MODEL')) {
            $__model_path = $GLOBALS['G_SP']['model_path'] . DSP . $__controller . '_model.php';
            if (AUTO_LOAD_MODEL && file_exists($__model_path)) {
                import($__model_path, false);
                class_exists($__controller . '_model') && $this->db = spClass($__controller . '_model', null, $__model_path);
            }
        }
        //是否自动调用模板
        if (isset($this->auto_display) && false === $this->auto_display) {
            $this->setAutoDisplay('OFF');
        }
    }


    /**
     * [__set_siteConfig 赋值]
     * @return [type] [description]
     */
    public function __set_siteConfig()
    {
        $this->__set('CFG', $GLOBALS['G_C']); //config.php 配置项赋值
        $this->site_name = $GLOBALS['G_C']['site_name'];
        $this->site_url = $GLOBALS['G_C']['site_url'];
        $this->assignConst();
    }


     /**
     *  赋值常用模板变量
     * @author hexiyou.cn@gmail.com
     *
     */
    public function assignConst()
    {
        $this->__set('TPL_PATH',TPL_PATH);
        $this->__set('CSS_PATH', CSS_PATH);
        $this->__set('JS_PATH', JS_PATH);
        $this->__set('IMG_PATH', IMG_PATH);
        $this->__set('IMGS_PATH', IMGS_PATH);
    }

    /**
     * [seo SEO优化，重新设置网站的标题，关键词，描述]
     * @return [type] [description]
     */
    public function seo()
    {
        $this->title = $this->page_title . ' - ' . $this->site_name;
        $this->keywords = $this->CFG['keywords'];
        $this->description = $this->CFG['description'];
        $this->author = '7s.com.cn';
        //是否展示 SEO标题
        if (isset($this->seo_title) && !empty($this->seo_title)) {
            $this->show_title = $this->seo_title;
        } else {
            $this->show_title = $this->title;
        }

    }


    /**
     * [getHeaderStr 获取模板公共头部内容，返回字符串]
     * @return [String] [模板内容]
     */
    public function getHeaderStr(){
        $header=$this->display('header',FALSE);
        $header_sub=$this->display('header_sub',FALSE);
        return $header.$header_sub;
    }

    /**
     * [getFooterStr 获取底部模板字符串内容]
     * @return [type] [description]
     */
    public function getFooterStr(){
        return $this->display('footer',FALSE);
    }


    /**
     *
     * 错误提示程序 重载sp框架函数
     *
     * 应用程序的控制器类可以覆盖该函数以使用自定义的错误提示
     *
     * @param $msg   错误提示需要的相关信息
     * @param $url   跳转地址
     */
    public function error($msg, $url = '')
    {
        $this->display('error.html');
        exit;
    }

    /**
     *
     * 成功提示程序 重载sp框架函数
     *
     * 应用程序的控制器类可以覆盖该函数以使用自定义的成功提示
     *
     * @param $msg   成功提示需要的相关信息
     * @param $url   跳转地址
     */
    public function success($msg, $url = '')
    {
        $this->display('success.html');
        exit;
    }


    /**
     * [assign __set 别名，赋值变量到模板]
     * @param  [type] $name  [description]
     * @param  [type] $value [description]
     * @return [type]        [description]
     */
    public function assign($name, $value)
    {
        $this->__set($name, $value);
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
     * 输出模板 覆写 spContoller display方法，省略后缀
     *
     * @param $tplname   模板路径及名称
     * @param $output   是否直接显示模板，设置成FALSE将返回HTML而不输出
     * @author hexiyou.cn@gmail.com
     */
    public function display($tplname, $output = TRUE)
    {
        if ($this->tpl_suffix && stripos($tplname, $this->tpl_suffix) === false)
            $tplname .= $this->tpl_suffix;
        @ob_start();
        if (TRUE == $GLOBALS['G_SP']['view']['enabled']) {
            $this->v->display($tplname);
        } else {
            extract($this->__template_vals);
            require($tplname);
        }
        if (TRUE != $output) return ob_get_clean();
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
     * [__empty 控制器默认空方法]
     * @return [type] [description]
     */
    public function __empty(){
        global $__controller,$__action;
        echo $__controller.'没有发现方法'.$__action;
        exit();
    }


    /**
     * [__toString 魔术方法，指明控制器用途]
     * @return string [description]
     */
    public function __toString(){
        return "nnCMS前端公共控制器";
    }

}