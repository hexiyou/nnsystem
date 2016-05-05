<?php
/**
 * @Author: Lonelyer <hackkey@qq.com>
 * @link:  http://www.7s.com.cn
 * @Date:   $DATE$ $TIME$
 * @Last Modified time: 2016-05-05 11:12:05
 * @Packages:   nnCMS
 * @User:  $user$
 * @File:  Filename()
 * @Copyright: Copyright (c) 2016 7s.com.cn.Co.Ltd. All rights reserved.
 */
defined('IN_APP') or exit('Access Denied!');
class error_404 extends base
{
    public $page_title = "页面不存在";
    public $auto_display = false; //关闭自动调用模板

    public function __construct($params)
    {
        parent::__construct();
        $this->params = $params['params'];
    }

    public function error_404($params){
    	$this->__construct($params);
    }


    public function handle(){
    	$this->__controller =$__controller = $this->params['__controller'];
    	$this->__action = $__action=$this->params['__action'];
        if($GLOBALS['G_SP']['mode']=="debug"){
        	spError("404错误 ".$__controller."->".$__action);
        }else{
        	$this->display('error404.html');
        }
    }

}