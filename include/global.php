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
	$connectFile = INC_PATH . '/oauth/' . $platform . '_connect.php';
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

function get_session($name)
{
	$_prefix = $G_C['cookie_pre']?$G_C['cookie_pre']:'';
	if(!isset($_SESSION)){return null;}
	$name = $_prefix.$name;
	return isset($_SESSION[$name])?$_SESSION[$name]:null;
}

/**
 * [clear_session 清除所有session会话
 * @param  string $range [description]
 * @return [type]        [description]
 */
function clear_session($range="all"){
	if($range=="all"){
		return session_unset();
	}else{
		return session_destroy();
	}
}

/**
 * [set_session 设置sesssion值]
 * @param [type] $name  [description]
 * @param string $value [description]
 */
function set_session($name,$value="")
{
	$_prefix = $G_C['cookie_pre']?$G_C['cookie_pre']:'';
	if(!isset($_SESSION)){session_start();}
	$name = $_prefix.$name;
	if(isset($_SESSION[$name])&&$value==""){
		unset($_SESSION[$name]);
	}
	return $_SESSION[$name] = $value;
}

/**
 * [L 调用语言项,有缓存时优先读取缓存]
 * [可同时支持多语言，不局限于config配置]
 * @param [type] $name [description]
 */
function L($name,$language=null){
    global $__controller,$__action,$config;
    $key = $__controller;
    $language==null&&$language=$config['language'];
    if(defined('IN_ADMIN')){
    	$key = 'admin_'.$key;
    }
    $key.='_'.$language;
    $_cache = spAccess('r',$key);
    if(!$_cache){
    	return source_Lang($name,$language);
    }
    if(array_key_exists($name,$_cache)){
    	return $_cache[$name];
    }
    return $name;
}

/**
 * [source_Lang 从语言文件包读取语言选项]
 * @param  [type] $name [description]
 * @return [type]       [description]
 */
function source_Lang($name,$language=null){
   global $__controller,$__action,$config;
   $_lang = spClass('lib_lang',null,INC_PATH.'lib_lang.php');
   $_lang->setLangDir(LANG_PATH);
   $language==null&&$language=$config['language'];
   $_lang->setLang($language);
   $_lang->importLangFile('system');
   $_lang->importLangFile('common');
   $key = $__controller;
   if(defined('IN_ADMIN')){
   		$key = 'admin_'.$key;
   		$_lang->importLangFile('admin');
   		$_lang->importLangFile($key);
   }
   $key.='_'.$language;
   spAccess('w',$key,$_lang->_langData);
   if(array_key_exists($name,$_lang->_langData)){
   		return $_lang->_langData[$name];
   }
   return $name;
}

/**
 * 获取请求ip
 *
 * @return ip地址
 */
function ip() {
	if(getenv('HTTP_CLIENT_IP') && strcasecmp(getenv('HTTP_CLIENT_IP'), 'unknown')) {
		$ip = getenv('HTTP_CLIENT_IP');
	} elseif(getenv('HTTP_X_FORWARDED_FOR') && strcasecmp(getenv('HTTP_X_FORWARDED_FOR'), 'unknown')) {
		$ip = getenv('HTTP_X_FORWARDED_FOR');
	} elseif(getenv('REMOTE_ADDR') && strcasecmp(getenv('REMOTE_ADDR'), 'unknown')) {
		$ip = getenv('REMOTE_ADDR');
	} elseif(isset($_SERVER['REMOTE_ADDR']) && $_SERVER['REMOTE_ADDR'] && strcasecmp($_SERVER['REMOTE_ADDR'], 'unknown')) {
		$ip = $_SERVER['REMOTE_ADDR'];
	}
	return preg_match ( '/[\d\.]{7,15}/', $ip, $matches ) ? $matches [0] : '';
}

function get_cost_time() {
	$microtime = microtime ( TRUE );
	return $microtime - SYS_START_TIME;
}


/**
 * 查询字符是否存在于某字符串
 *
 * @param $haystack 字符串
 * @param $needle 要查找的字符
 * @return bool
 */
function str_exists($haystack, $needle)
{
	return !(strpos($haystack, $needle) === FALSE);
}

/**
 * 取得文件扩展
 *
 * @param $filename 文件名
 * @return 扩展名
 */
function fileext($filename) {
	return strtolower(trim(substr(strrchr($filename, '.'), 1, 10)));
}


/**
 * iconv 编辑转换
 */
if (!function_exists('iconv')) {
	function iconv($in_charset, $out_charset, $str) {
		$in_charset = strtoupper($in_charset);
		$out_charset = strtoupper($out_charset);
		if (function_exists('mb_convert_encoding')) {
			return mb_convert_encoding($str, $out_charset, $in_charset);
		} else {
			pc_base::load_sys_func('iconv');
			$in_charset = strtoupper($in_charset);
			$out_charset = strtoupper($out_charset);
			if ($in_charset == 'UTF-8' && ($out_charset == 'GBK' || $out_charset == 'GB2312')) {
				return utf8_to_gbk($str);
			}
			if (($in_charset == 'GBK' || $in_charset == 'GB2312') && $out_charset == 'UTF-8') {
				return gbk_to_utf8($str);
			}
			return $str;
		}
	}
}

/**
 * IE浏览器判断
 */

function is_ie() {
	$useragent = strtolower($_SERVER['HTTP_USER_AGENT']);
	if((strpos($useragent, 'opera') !== false) || (strpos($useragent, 'konqueror') !== false)) return false;
	if(strpos($useragent, 'msie ') !== false) return true;
	return false;
}


/**
 * 文件下载
 * @param $filepath 文件路径
 * @param $filename 文件名称
 */

function file_down($filepath, $filename = '') {
	if(!$filename) $filename = basename($filepath);
	if(is_ie()) $filename = rawurlencode($filename);
	$filetype = fileext($filename);
	$filesize = sprintf("%u", filesize($filepath));
	if(ob_get_length() !== false) @ob_end_clean();
	header('Pragma: public');
	header('Last-Modified: '.gmdate('D, d M Y H:i:s') . ' GMT');
	header('Cache-Control: no-store, no-cache, must-revalidate');
	header('Cache-Control: pre-check=0, post-check=0, max-age=0');
	header('Content-Transfer-Encoding: binary');
	header('Content-Encoding: none');
	header('Content-type: '.$filetype);
	header('Content-Disposition: attachment; filename="'.$filename.'"');
	header('Content-length: '.$filesize);
	readfile($filepath);
	exit;
}

/**
 * 判断字符串是否为utf8编码，英文和半角字符返回ture
 * @param $string
 * @return bool
 */
function is_utf8($string) {
	return preg_match('%^(?:
					[\x09\x0A\x0D\x20-\x7E] # ASCII
					| [\xC2-\xDF][\x80-\xBF] # non-overlong 2-byte
					| \xE0[\xA0-\xBF][\x80-\xBF] # excluding overlongs
					| [\xE1-\xEC\xEE\xEF][\x80-\xBF]{2} # straight 3-byte
					| \xED[\x80-\x9F][\x80-\xBF] # excluding surrogates
					| \xF0[\x90-\xBF][\x80-\xBF]{2} # planes 1-3
					| [\xF1-\xF3][\x80-\xBF]{3} # planes 4-15
					| \xF4[\x80-\x8F][\x80-\xBF]{2} # plane 16
					)*$%xs', $string);
}


/**
 * 递归显示当前指定目录下所有文件
 * 使用dir函数
 * @param string $dir 目录地址
 * @return array $files 文件列表
 */
function get_files($dir) {
    $files = array();
 
    if (!is_dir($dir)) {
        return $files;
    }
 
    $d = dir($dir);
    while (false !== ($file = $d->read())) {
        if ($file != '.' && $file != '..') {
            $filename = $dir . "/"  . $file;
 
            if(is_file($filename)) {
                $files[] = $filename;
            }else {
                $files = array_merge($files, get_files($filename));
            }
        }
    }
    $d->close();
    return $files;
}

/**
 * 使用RecursiveDirectoryIterator遍历文件，列出所有文件路径
 * @param RecursiveDirectoryIterator $dir 指定了目录的RecursiveDirectoryIterator实例
 * @return array $files 文件列表
 */
function get_files2($dir) {
    $files = array();
 
    for (; $dir->valid(); $dir->next()) {
        if ($dir->isDir() && !$dir->isDot()) {
            if ($dir->haschildren()) {
                $files = array_merge($files, get_files($dir->getChildren()));
            };
        }else if($dir->isFile()){
            $files[] = $dir->getPathName();
        }
    }
    return $files;
}

/**
 * [unlink_tree 递归删除目录树，包含文件，子文件夹和子文件]
 * @param  [type] $dir [description]
 * @return [type]      [description]
 */
function unlink_tree($dir,$include_self=false){
    if (!is_dir($dir)) {
        return false;
    }
 
    $d = dir($dir);
    while (false !== ($file = $d->read())) {
        if ($file != '.' && $file != '..') {
            $filename = $dir . "/"  . $file;
            if(is_file($filename)) {
                unlink($filename);
            }else {
                unlink_tree($filename);
            }
        }
    }
    $d->close();
    if($include_self){
    	rmdir($dir);
    }
    return true;
}

/**
 * [get_LANGKey 根据控制器文件名称获取所有语言包键值项]
 * @param  string $language 语言品种:zh-cn,en-us等等
 * @param  string $range    获取范围:front-前台，admin-后台，all-整站
 * @return array  $key_arr  语言键值集合数组
 */
function get_LANGKey($language,$range='all'){
	$key_arr = array();

	switch ($range) {
		case 'front':
			$front_ctl = glob(CTL_PATH.'*');
			foreach ($front_ctl as $_ctl) {
				$_ctl = basename($_ctl,'.php');
				$key_arr[] = $_ctl.'_'.$language;
			}
			break;
		case 'admin':
			$admin_ctl = glob(ADMIN_CTL_PATH.'*');
			foreach ($admin_ctl as $_ctl) {
				$_ctl = basename($_ctl,'.php');
				$key_arr[] = 'admin_'.$_ctl.'_'.$language;
			}
			break;
		default:
			$front_ctl = glob(CTL_PATH.'*');
			$admin_ctl = glob(ADMIN_CTL_PATH.'*');
			foreach ($front_ctl as $_ctl) {
				$_ctl = basename($_ctl,'.php');
				$key_arr[] = $_ctl.'_'.$language;
			}
			foreach ($admin_ctl as $_ctl) {
				$_ctl = basename($_ctl,'.php');
				$key_arr[] = 'admin_'.$_ctl.'_'.$language;
			}
			break;
	}

	return $key_arr;
}

/**
 * 生成随机字符串
 * @param string $lenth 长度
 * @return string 字符串
 */
function create_randomstr($lenth = 6) {
	return random($lenth, '123456789abcdefghijklmnpqrstuvwxyzABCDEFGHIJKLMNPQRSTUVWXYZ');
}


//注册自动加载函数语句，不可删除
function_exists('spl_autoload_register') && spl_autoload_register('__autoload');