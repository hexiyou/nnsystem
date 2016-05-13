<?php
/**
 * @Author: Lonelyer <hackkey@qq.com>
 * @link:  http://www.7s.com.cn
 * @Date:   $DATE$ $TIME$
 * @Last Modified time: 2016-05-13 16:26:33
 * @Packages:   nnCMS
 * @User:  $user$
 * @File:  Filename()
 * @Copyright: Copyright (c) 2016 7s.com.cn.Co.Ltd. All rights reserved.
 */

/**
  *
  *    @author lonelyer <hackkey@qq.com>
  * 
  *    农年CMS后台管理入口文件
  *    
  */
define('IN_APP',true);//入口绑定，防止非法调用PHP文件
define('IN_ADMIN',true);
define('ADMIN_PATH',dirname(__FILE__)); //后台管理完整路径
define("APP_PATH",dirname(ADMIN_PATH));
define("SP_PATH",APP_PATH.DIRECTORY_SEPARATOR.'framework');
//各类数据和配置文件存储路径
define('DATA_PATH', APP_PATH.DIRECTORY_SEPARATOR.'data'.DIRECTORY_SEPARATOR); 

// 载入数据库配置
file_exists(DATA_PATH.'db_config.php') && include_once(DATA_PATH.'db_config.php');

// 载入网站全局配置
file_exists(DATA_PATH.'config.php') && include_once(DATA_PATH.'config.php');

//载入后台管理初始化文件
require_once(ADMIN_PATH.DIRECTORY_SEPARATOR.'common.inc.php');

//载入新浪云平台环境检测文件
file_exists(APP_PATH.DSP.'sae_env.php') && include(APP_PATH.DSP.'sae_env.php');

/** 载入框架 **/
require(SP_PATH.DIRECTORY_SEPARATOR."SpeedPHP.php");

//载入基础控制器
import($spConfig['controller_path'].DIRECTORY_SEPARATOR.'base.php',FALSE,TRUE);

//启动应用
spRun();