<?php
isset($db) && $spConfig['db'] = $db;
isset($view) && $spConfig['view'] = $view;
isset($config) && define('TPL_DIR',$config['template'].'/');

$spConfig['db_spdb_full_tblname'] = false; //是否使用表全名
$spConfig['sp_cache'] = APP_PATH.'/runtime/tmp';

$spConfig['spUrlRewrite'] = array(
	'suffix' => '.html',
	'sep' => '-', 
	'map' => array(
		'ok' => 'note@test'
		),
	'args' => array(),
);

$spConfig['launch'] = array( // 加入挂靠点，以便开始使用Url_ReWrite的功能
		'router_prefilter' => array( 
				array('spUrlRewrite', 'setReWrite'),  // 对路由进行挂靠，处理转向地址
				array('spAcl','mincheck') // 开启有限的权限控制 
		),
	 	'function_url' => array(
				array("spUrlRewrite", "getReWrite"),  // 对spUrl进行挂靠，让spUrl可以进行Url_ReWrite地址的生成
		),
);


if(defined('IS_DEBUG')&&IS_DEBUG){
	$spConfig['mode'] = 'debug';
}else{
	$spConfig['mode'] = 'release';
}