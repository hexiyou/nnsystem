<?php 
//新浪云环境检测配置
 $sae_ViewConfig = array(
            'compile_dir' => 'saemc://runtime/compile/',
            'cache_dir' => 'saemc://runtime/cache/',
			'compile_locking' => false,
 );

$spConfig['view']['config']  = array_merge($spConfig['view']['config'], $sae_ViewConfig);

$spConfig['sp_cache'] = 'saemc://runtime/cache/';
?>