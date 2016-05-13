<?php
/**
 * @Author: Lonelyer <hackkey@qq.com>
 * @link:  http://www.7s.com.cn
 * @Date:   2016-05-13 14:08:12
 * @Last Modified time: 2016-05-13 14:48:40
 * @Packages:   nnCMS
 * @Copyright: Copyright (c) 2016 7s.com.cn.Co.Ltd. All rights reserved.
 */
defined('IN_APP') or exit('Access Denied!');

echo "<pre>";
echo "清除缓存文件\n";

$path = APP_PATH.DIRECTORY_SEPARATOR.'runtime';

$files = get_files($path);

$keepfile = array_shift($files);

if(!preg_match('/\.gitkeep$/i',$keepfile)){
	unlink($keepfile);
}

foreach ($files as $file) {
	unlink($file);
}

echo "done";