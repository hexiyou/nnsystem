<?php
/**
 * @Author: Lonelyer <hackkey@qq.com>
 * @link:  http://www.7s.com.cn
 * @Date:   2016-04-07 11:33:14
 * @Last Modified time: 2016-04-16 15:38:12
 * @Packages:   nnCMS
 * @Copyright: Copyright (c) 2016 7s.com.cn.Co.Ltd. All rights reserved.
 */

/**
 * [spGetUrl Smarty注册spUrl函数]
 * @param  [type] $param [description]
 * @return [type]        [description]
 */
function spGetUrl($param) {
	$controller = $param['controller'];
	$action = $param['action'];
	$params = isset($param['param']) ? $param['param'] : array();
	return spUrl($controller, $action, $params);
}


function _email() {
	$mail = spClass('spEmail');
	$mailsubject = "SpeedPHP邮件扩展"; //邮件主题
	$mailbody = "<h1> SpeedPHP邮件扩展 </h1>"; //邮件内容
	$mailtype = "HTML"; //邮件格式（HTML/TXT）,TXT为文本邮件
	$mail->sendmail('收件人邮箱@email.com', $mailsubject, $mailbody, $mailtype);
}


public function __autoload($class_name){
	import($class_name.'.php');
	throw new Exception("Unable to load $class_name.");
}

function loadOauth($platform="qq"){
	$connectFile  = APP_PATH.'/include/oauth/'.$platform.'_connect.php';
	if(file_exists($connectFile)){
		require_once($connectFile);
	}
}