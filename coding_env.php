<?php
/**
 * @Author: Xiyou
 * @Date:   2016-04-11 19:32:05
 * @Last Modified by:   Xiyou
 * @Last Modified time: 2016-04-11 19:42:02
 * @description
 */

$VCAP_SERVICES = $_ENV['VCAP_SERVICES'];
$MYSQL_INSTANCE  = $VCAP_SERVICES['mysql'][0]['credentials'];


/**覆盖 db_config.php 配置信息**/
$db['host']       = $MYSQL_INSTANCE['hostname'];              //数据库地址，一般都可以是localhost
$db['port']       = $MYSQL_INSTANCE['port'];        			// 端口
$db['login']      = $MYSQL_INSTANCE['username'];             //数据库用户名
$db['password']   = $MYSQL_INSTANCE['password'];             //数据库密码
$db['database']   = $MYSQL_INSTANCE['name'];             //数据库的库名称