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
 *
 *    伯恩CMS后台管理入口文件
 *
 * 
 */
define('ADMIN_PATH',dirname(__FILE__)); //后台管理完整路径
define("APP_PATH",dirname(ADMIN_PATH));
define("SP_PATH",APP_PATH.'/framework');

// 载入数据库配置
if(file_exists(APP_PATH.'/db_config.php')){
	include_once(APP_PATH.'/db_config.php');
}

// 载入网站全局配置
if(file_exists(APP_PATH.'/config.php')){
	include_once(APP_PATH.'/config.php');
}

//载入后台管理初始化文件
require_once(ADMIN_PATH.'/common.inc.php');

/** 载入框架 **/
require(SP_PATH."/SpeedPHP.php");

import($spConfig['controller_path'].DIRECTORY_SEPARATOR.'base.php',FALSE,TRUE);

//启动应用
spRun();