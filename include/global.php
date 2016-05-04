<?php
/**
 *  全局函数库  在APP启动前 common.inc.php 中载入
 *
 *  $file  global.php
 *
 *  generate by lonelyer <hackkey@qq.com>
 */
defined('IN_APP') or exit('Access Denied!');
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
 * [is_email 判断输入是否是电子邮箱]
 * @param  [type]  $input [description]
 * @return boolean        [description]
 */
function is_email($input){
	return preg_match("/^[a-z]([a-z0-9]*[-_\.]?[a-z0-9]+)*@([a-z0-9]*[-_]?[a-z0-9]+)+[\.][a-z]{2,3}([\.][a-z]{2})?$/i",$input);
}

/**
 * [is_mobilePhone 判断输入是否是手机号码]
 * @param  [type]  $input [description]
 * @return boolean        [description]
 */
function is_mobilePhone($input){
    return preg_match('#^1[3578]{1}[0-9]{9}$#',$input);
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

/**
 * [get_cookie 全局函数:获取cookie值]
 * [安全性考虑，自动附加配置文件前缀选项]
 * @param  string $name [description]
 * @return [type]       [description]
 */
function get_cookie($name=""){
	$__cookiePrefix = $G_C['cookie_pre']?$G_C['cookie_pre']:'';
	return isset($_COOKIE[$__cookiePrefix.$name])?trim($_COOKIE[$__cookiePrefix.$name]):null;
}

/**
 * [set_cookie 全局函数：设置Cookie]
 * [高级用法，自定义过期时间，分钟，小时，天]
 * @param string  $name   cookie名称
 * @param string  $value  cookie数值
 * @param integer $expire [过期时间，默认时间为秒，可加字母定义单位]
 * @param string  $path   cookie路径
 * @param string  $domain cookie域名
 * @param boolean  $secure 是否HTTPS传输
 * @return boolean          是否设置成功
 */
function set_cookie($name,$value,$expire=3600,$path=null,$domain=null,$secure=null)
{
	$__cookiePrefix = $G_C['cookie_pre']?$G_C['cookie_pre']:'';
	$name = $__cookiePrefix.$name;
	if(is_numeric($expire)){
		$expire = time()+$expire;  //过期时间为秒数
	}else{
		$unit =  substr($expire,-1);
		$number = str_replace($expire,$unit,"");
		switch ($unit) {
			case 's'://秒
				break;
			case 'm'://分
				$expire = time()+$expire*60;
				break;
			case 'H'://时
			case "h":
				$expire = time()+$expire*3600;
				break;
			case 'd'://天
				$expire = time()+$expire*3600*24;
				break;
			default:
				break;
		}
	}
	return setcookie($name,$value,$expire,$path,$domain,$secure);
}

//注册自动加载函数语句，不可删除
function_exists('spl_autoload_register') && spl_autoload_register('__autoload');