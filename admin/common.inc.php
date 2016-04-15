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
//系统后台初始化环境文件
@include_once(APP_PATH.DIRECTORY_SEPARATOR.'data'.DIRECTORY_SEPARATOR.'define.php');
define('ADMIN_TPL', ADMIN_PATH . DIRECTORY_SEPARATOR.'template'.DIRECTORY_SEPARATOR); //后台模板路径

define('ADMIN_ROOT',basename(getcwd())); //获取后台管理目录文件夹名称，仅文件夹名
define('TPL_PATH', 'template/'); //后台模板根目录路径
define('CSS_PATH', 'template/css/'); //后台CSS路径
define('JS_PATH', 'template/js/'); //后台JS路径
define('IMG_PATH', 'template/img/'); //后台引用图片路径
define('IMGS_PATH', 'template/images/'); //后台引用图片路径2

if(file_exists(APP_PATH.DIRECTORY_SEPARATOR.'coding_env.php')){
    include(APP_PATH.DIRECTORY_SEPARATOR.'coding_env.php');
}
isset($db) && $spConfig['db'] = $db;
$spConfig['db_spdb_full_tblname'] = false; //是否使用表全名
$spConfig['sp_cache'] = APP_PATH . DIRECTORY_SEPARATOR.'runtime'.DIRECTORY_SEPARATOR.'tmp';

//附加类库路径
$spConfig['include_path'][] = ADMIN_PATH . DIRECTORY_SEPARATOR.'lib';


// 判断是否开启URL重写

if ($config['url_rewrite'] == 1) {
	$spConfig['spUrlRewrite'] = array(
		'suffix' => '.html',
		'sep' => '-',
		'map' => array(
			'login' => 'user@login',
		),
		'args' => array(),
	);

	$spConfig['launch'] = array( // 加入挂靠点，以便开始使用Url_ReWrite的功能
		'router_prefilter' => array(
			array('spUrlRewrite', 'setReWrite'), // 对路由进行挂靠，处理转向地址
			array('spAcl', 'mincheck'), // 开启有限的权限控制
		),
		'function_url' => array(
			array("spUrlRewrite", "getReWrite"), // 对spUrl进行挂靠，让spUrl可以进行Url_ReWrite地址的生成
		),
	);
}

$__runtimepath = APP_PATH .DIRECTORY_SEPARATOR.'runtime';

$view = array(
	'enabled' => TRUE, // 开启Smarty
	'config' => array(
		'template_dir' => ADMIN_PATH .DIRECTORY_SEPARATOR.'template', // 模板存放的目录
		'compile_dir' => $__runtimepath.DIRECTORY_SEPARATOR.'compile'.DIRECTORY_SEPARATOR.'admin', // 编译的临时目录
		'cache_dir' => $__runtimepath.DIRECTORY_SEPARATOR.'cache'.DIRECTORY_SEPARATOR.'admin', // 缓存的临时目录
		'left_delimiter' => '{', // smarty左限定符
		'right_delimiter' => '}', // smarty右限定符
		'auto_literal' => TRUE, // Smarty3新特性
	),
	'auto_display' => TRUE, // 是否使用自动输出模板功能
	'auto_display_sep' => '_', // 自动输出模板的拼装模式，/为按目录方式拼装，_为按下划线方式，以此类推
	'auto_display_suffix' => '.html', // 自动输出模板的后缀名
	//'debugging' => TRUE   //模板变量调试
);
$spConfig['view'] = $view;

//GLOBAL variable $config 配置全局变量引用
$G_C = $config;

//// 后台管理入口文件更改 /////
///

$spConfig['controller_path'] = ADMIN_PATH . DIRECTORY_SEPARATOR.'controller'; // 用户控制器程序的路径定义
$spConfig['model_path'] = ADMIN_PATH .DIRECTORY_SEPARATOR. 'model'; // 用户模型程序的路径定义


$spConfig['dispatcher_error'] = "import(\$GLOBALS['G_SP']['controller_path'].DIRECTORY_SEPARATOR.'error_404.php');\$handle=spClass('error_404');\$handle->handle(\$__controller,\$__action);;exit();"; //404错误页面

if (defined('IS_DEBUG') && IS_DEBUG) {
	$spConfig['mode'] = 'debug';
} else {
	$spConfig['mode'] = 'release';
}