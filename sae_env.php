<?php 
//新浪云环境检测配置
if(defined('SAE_MYSQL_HOST_M')){//根据常量判断是否是新浪云环境

 $sae_ViewConfig = array(
            'compile_dir' => 'saemc://runtime/compile/',
            'cache_dir' => 'saemc://runtime/cache/',
			'compile_locking' => false,
 );

$spConfig['view']['config']  = array_merge($spConfig['view']['config'], $sae_ViewConfig);

$spConfig['sp_cache'] = 'saemc://runtime/cache/';

$db_config = array(
        'host' => SAE_MYSQL_HOST_M,
        'port' => SAE_MYSQL_PORT,
        'login' => SAE_MYSQL_USER,
        'password' => SAE_MYSQL_PASS,
        'database' => SAE_MYSQL_DB,
	);

$spConfig['db'] = array_merge($spConfig['db'],$db_config);
}
?>