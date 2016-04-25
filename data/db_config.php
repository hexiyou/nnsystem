<?php
/**
 * @Author: Xiyou
 * @Date:   2016-04-07 09:55:03
 * @Last Modified by:   Xiyou
 * @Last Modified time: 2016-04-18 18:25:13
 */

$db = array();

//  数据库配置信息
$db['driver']     = 'mysqli';   		// 驱动类型
$db['host']       = SAE_MYSQL_HOST_M;              //数据库地址，一般都可以是localhost
$db['port']       = SAE_MYSQL_PORT;        			// 端口
$db['login']      = SAE_MYSQL_USER;             //数据库用户名
$db['password']   = SAE_MYSQL_PASS;             //数据库密码
$db['database']   = SAE_MYSQL_DB;             //数据库的库名称
$db['prefix']     = 'nn_';           // 表前缀
$db['persistent'] = FALSE;    // 是否使用长链接