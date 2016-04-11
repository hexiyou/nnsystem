<?php
/**
 * @Author: Xiyou
 * @Date:   2016-04-07 09:47:06
 * @Last Modified by:   Xiyou
 * @Last Modified time: 2016-04-11 20:43:01
 */
define("APP_PATH",dirname(__FILE__));
define("SP_PATH",APP_PATH.'/framework');

// 载入数据库配置
if(file_exists(APP_PATH.'/db_config.php')){
	include_once(APP_PATH.'/db_config.php');
}

// 载入模板初始配置
if(file_exists(APP_PATH.'/view_config.php')){
	include_once(APP_PATH.'/view_config.php');
}

// 载入网站全局配置
if(file_exists(APP_PATH.'/config.php')){
	include_once(APP_PATH.'/config.php');
}

//载入初始化文件
require_once(APP_PATH.'/common.inc.php');

/** 载入框架 **/
require(SP_PATH."/SpeedPHP.php");

import('baseContoller.php');

print_r($spConfig['db']);

//启动应用
spRun();