/* 
* @Author: Xiyou
* @Date:   2016-04-21 16:11:16
* @Last Modified by:   Xiyou
* @Last Modified time: 2016-04-21 16:46:38
*/

'use strict';
//重新加载图片，用例：刷新验证码
function reload_img(obj){
	var _src = obj.src.replace(/(&|\?)_rand=[^&$]+/i,'');
	var random = new Date().getTime();
	var new_src = _src+(_src.indexOf('?')>-1?'&':'?')+'_rand='+random;
	obj.src = new_src;
}