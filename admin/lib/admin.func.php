<?php
/**
 * @Author: Lonelyer <hackkey@qq.com>
 * @link:  http://www.7s.com.cn
 * @Date:   2016-05-17 12:31:03
 * @Last Modified time: 2016-05-17 18:07:18
 * @Packages:   nnCMS
 * @Copyright: Copyright (c) 2016 7s.com.cn.Co.Ltd. All rights reserved.
 */

//时间格式化函数 for test only
if(!function_exists('date_format')){
	function date_format($time=null, $fomrat='Y-m-d H:i:s'){
		$time==null && $time = time();
		return date($format,$time);
	}
}

//获取当前登录管理员的ID
function _getuid(){
	return get_session('uid');
}

//获取当前用户
function _getuserinfo(){
	$model = spClass('user_model');
	return $model->getUserByID(_getuid());
}

//清除新浪云缓存
function saeCache_clear($key=null){
	$mmc = new Memcache;
 	$ret = $mmc->connect();
 	if($key!=null){
 		return $mmc->delete($key);
 	}
 	return $mmc->flush();
}

