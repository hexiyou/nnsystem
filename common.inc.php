<?php
@include(APP_PATH.DIRECTORY_SEPARATOR.'data'.DIRECTORY_SEPARATOR.'define.php');
if(file_exists(APP_PATH.DSP.'coding_env.php')){
    include(APP_PATH.DSP.'coding_env.php');
}
isset($db) && $spConfig['db'] = $db;
isset($view) && $spConfig['view'] = $view;
isset($config) && define('TPL_DIR', $config['template'] . DSP);

/////////////////////// URL引用路径设置 //////////////////////////////////
define('SITE_PATH', $config['site_path'] != "" ? $config['site_path'] : '/');
define('TPL_TRUE_PATH', APP_PATH.DSP.'template'.DSP.TPL_DIR);//模板真实路径

define('SKIN_PATH', SITE_PATH . 'skin/' . $config['template'] . '/'); // 定义SKIN PATH
define('CSS_PATH', SKIN_PATH . 'css/');
define('JS_PATH', SKIN_PATH . 'js/');

define('SKIN_IMG', SKIN_PATH . 'images/');
define('IMG_PATH', SITE_PATH . 'statics/images/');
////////////////////////////////////////////////////////////////////////

$spConfig['controller_path'] = APP_PATH . DIRECTORY_SEPARATOR.'controller'; // 用户控制器程序的路径定义
$spConfig['model_path'] = APP_PATH .DIRECTORY_SEPARATOR. 'model'; // 用户模型程序的路径定义

$spConfig['db_spdb_full_tblname'] = false; //是否使用表全名
$spConfig['sp_cache'] = APP_PATH . '/runtime/tmp'; //临时目录
$spConfig['dispatcher_error'] = "import(SP_PATH.'/Misc/404.php');exit();"; //404错误页面
//$spConfig['auto_load_controller'][] = 'base'; //自动加载控制器

// 根据全局配置项判断是否开启伪静态
if ($config['url_rewrite'] == TRUE) {
    $spConfig['spUrlRewrite'] = array(
    // 'suffix' => '.html',
		'suffix' => '', 
		'sep'    => '-',
		'map'    => array(
			'index' => 'main@index',
			'user'   => 'user@login',
			'login'  => 'user@login',
			'@'    => 'error_404', 
     	), 
     	'args' 	=> array(
     		 'search' => array('q','page'), 
     		),
     	);
    
    $spConfig['launch'] = array(
     // 加入挂靠点，以便开始使用Url_ReWrite的功能
    'router_prefilter' => array(array('spUrlRewrite', 'setReWrite'),
     // 对路由进行挂靠，处理转向地址
    array('spAcl', 'mincheck'),
     // 开启有限的权限控制
    ), 'function_url' => array(array("spUrlRewrite", "getReWrite"),
     // 对spUrl进行挂靠，让spUrl可以进行Url_ReWrite地址的生成
    ),);
}

//识别当前配置模板配置项，自动补全模板路径
if (isset($config['template']) && !empty($config['template'])) {
    $spConfig['view']['config']['template_dir'].= trim($config['template']) . '/';
    
    $spConfig['dispatcher_error'] = "import(\$GLOBALS['G_SP']['controller_path'].DIRECTORY_SEPARATOR.'error_404.php');\$handle=spClass('error_404');\$handle->handle(\$__controller,\$__action);;exit();"; //404错误页面
    //自动加载模板
    $spConfig['view']['auto_display'] = TRUE;
     // 是否使用自动输出模板功能
    $spConfig['view']['auto_display_sep'] = '_';
     // 自动输出模板的拼装模式，/为按目录方式拼装，_为按下划线方式，以此类推
    $spConfig['view']['auto_display_suffix'] = '.html';
     // 自动输出模板的后缀名
    
}

//GLOBAL variable $config 配置全局变量引用
$G_C = $config;

// 设置 siteApp 为调试或部署运行模式
if (defined('IS_DEBUG') && IS_DEBUG) {
    $spConfig['mode'] = 'debug';
} else {
    $spConfig['mode'] = 'release';
}
