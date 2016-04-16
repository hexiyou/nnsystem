<?php
/**
 *  全局函数库  在APP启动前 common.inc.php 中载入
 *
 *  $file  global.php
 *
 *  generate by lonelyer <hackkey@qq.com>
 */

/**
 * [自动载入函数类库]
 * 路径查找顺序 model_path->contoller_path->include_path
 * @param  [string] $className [要加载的类名]
 * @return [booens]        [是否成功载入类库]
 */
function __autoload($class) {
	if (is_file($GLOBALS['G_SP']['model_path'] . DIRECTORY_SEPARATOR . $class . '.php')) {
		import($GLOBALS['G_SP']['model_path'] . DIRECTORY_SEPARATOR . $class . '.php');
		return true;
	} elseif (is_file($GLOBALS['G_SP']['controller_path'] . DIRECTORY_SEPARATOR . $class . '.php')) {
		import($GLOBALS['G_SP']['controller_path'] . DIRECTORY_SEPARATOR . $class . '.php');
		return true;
	} elseif (INC_PATH . $class . '.php') {
		import(INC_PATH . $class . '.php');
		return true;
	} else {
		return false;
	}
}

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

/**
 * [show_QRImg 显示二维码]
 * @param  [type] $context [description]
 * @return [type]          [description]
 */
function show_QRImg($context){
  return spClass('QRcode')->img($context); 
}

/**
 * [_email 测试邮件发送]
 * @return [type] [description]
 */
function _email() {
	$mail = spClass('spEmail');
	$mailsubject = "SpeedPHP邮件扩展"; //邮件主题
	$mailbody = "<h1> SpeedPHP邮件扩展 </h1>"; //邮件内容
	$mailtype = "HTML"; //邮件格式（HTML/TXT）,TXT为文本邮件
	$mail->sendmail('收件人邮箱@email.com', $mailsubject, $mailbody, $mailtype);
}

function loadOauth($platform = "qq") {
	$connectFile = APP_PATH . '/include/oauth/' . $platform . '_connect.php';
	if (file_exists($connectFile)) {
		require_once $connectFile;
	}
}

function_exists('spl_autoload_register') && spl_autoload_register('__autoload');