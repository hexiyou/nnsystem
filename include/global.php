<?php
/**
 * @Author: Xiyou
 * @Date:   2016-04-07 11:33:14
 * @Last Modified by:   Xiyou
 * @Last Modified time: 2016-04-07 18:44:45
 */

/**
 * [spGetUrl Smarty注册spUrl函数]
 * @param  [type] $param [description]
 * @return [type]        [description]
 */
function spGetUrl($param){
	$controller = $param['controller'];
	$action = $param['action'];
	$params = isset($param['param'])?$param['param']:array();
	return spUrl($controller,$action,$params);
}