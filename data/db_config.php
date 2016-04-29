<?php
/**
 * @Author: Xiyou
 * @Date:   2016-04-07 09:55:03
 * @Last Modified by:   Xiyou
 * @Last Modified time: 2016-04-14 15:32:08
 */

$db = array();

//  数据库配置信息
$db['driver']     = 'mysqli';   		// 驱动类型
$db['host']       = 'localhost';              //数据库地址，一般都可以是localhost
$db['port']       = 3306;        			// 端口
$db['login']      = 'root';             //数据库用户名
$db['password']   = 'root';             //数据库密码
$db['database']   = 'SpeedPHP';             //数据库的库名称
$db['prefix']     = 'nn_';           // 表前缀
$db['persistent'] = FALSE;    // 是否使用长链接