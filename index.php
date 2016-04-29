<?php
/**
 * @Author: Lonelyer <hackkey@qq.com>
 * @link:  http://www.7s.com.cn
 * @Date:   2016-04-09 18:31:45
 * @Last Modified time: 2016-04-29 10:11:51
 * @Packages:   nnCMS
 * @Copyright: Copyright (c) 2016 7s.com.cn.Co.Ltd. All rights reserved.
 */
define("APP_PATH",dirname(__FILE__));
define("SP_PATH",APP_PATH.DIRECTORY_SEPARATOR.'framework');
//各类数据和配置文件存储路径
define('DATA_PATH', APP_PATH.DIRECTORY_SEPARATOR.'data'.DIRECTORY_SEPARATOR); 

// 载入数据库配置
file_exists(DATA_PATH.'db_config.php') && include_once(DATA_PATH.'db_config.php');

// 载入模板初始配置
file_exists(DATA_PATH.'view_config.php') && include_once(DATA_PATH.'view_config.php');

// 载入网站全局配置
file_exists(DATA_PATH.'config.php') && include_once(DATA_PATH.'config.php');

//载入初始化文件
require_once(APP_PATH.DIRECTORY_SEPARATOR.'common.inc.php');

//载入新浪云平台环境配置文件
if(file_exists(APP_PATH.DSP.'sae_env.php')){
    include(APP_PATH.DSP.'sae_env.php');
}

/** 载入框架 **/
require(SP_PATH.DIRECTORY_SEPARATOR."SpeedPHP.php");

import('baseContoller.php');

//启动应用
spRun();