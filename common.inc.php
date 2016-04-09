<?php
isset($db) && $spConfig['db'] = $db;
isset($view) && $spConfig['view'] = $view;
isset($config) && define('TPL_DIR', $config['template'] . '/');
define('SITE_PATH', $config['site_path'] != "" ? $config['site_path'] : '/');

$spConfig['db_spdb_full_tblname'] = false; //是否使用表全名
$spConfig['sp_cache'] = APP_PATH . '/runtime/tmp'; //临时目录
// $spConfig['auto_load_controller'][] = 'base'; //自动加载控制器

$spConfig['spUrlRewrite'] = array(
	'suffix' => '.html',
	'sep' => '-',
	'map' => array(
		'ok' => 'note@test',
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

//识别当前配置模板配置项，自动补全模板路径
if (isset($config['template']) && !empty($config['template'])) {
	$spConfig['view']['config']['template_dir'] .= trim($config['template']) . '/';

	//自动加载模板
	$spConfig['view']['auto_display'] = TRUE; // 是否使用自动输出模板功能
	$spConfig['view']['auto_display_sep'] = '_'; // 自动输出模板的拼装模式，/为按目录方式拼装，_为按下划线方式，以此类推
	$spConfig['view']['auto_display_suffix'] = '.html'; // 自动输出模板的后缀名
}

//GLOBAL config 整站备用全局变量
$G_C = $config;
// 定义SKIN PATH
define('SKIN_PATH', SITE_PATH . 'skin/' . $config['template'] . '/');
define('CSS_PATH', SKIN_PATH . 'css/');
define('JS_PATH', SKIN_PATH . 'js/');

define('SKIN_IMG', SKIN_PATH . 'images/');
define('IMG_PATH', SITE_PATH.'statics/images/');

if (defined('IS_DEBUG') && IS_DEBUG) {
	$spConfig['mode'] = 'debug';
} else {
	$spConfig['mode'] = 'release';
}