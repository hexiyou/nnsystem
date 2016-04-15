<?php
/**
 * @Author: Xiyou
 * @Date:   2016-04-07 10:16:42
 * @Last Modified by:   Xiyou
 * @Last Modified time: 2016-04-09 11:19:46
 */
// 应用模板选项配置
// 
$view = array(
		'enabled' => TRUE, // 开启Smarty
		'config' =>array(
			'template_dir' => APP_PATH.'/template/', // 模板存放的目录
			'compile_dir' => APP_PATH.'/runtime/compile/', // 编译的临时目录
			'cache_dir' => APP_PATH.'/runtime/cache/acos(arg)', // 缓存的临时目录
			'left_delimiter' => '<{',  // smarty左限定符
			'right_delimiter' => '}>', // smarty右限定符
			'auto_literal' => TRUE, // Smarty3新特性
		),
	);