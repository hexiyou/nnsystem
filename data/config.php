<?php
/**
 * @Author: Xiyou
 * @Date:   2016-04-07 10:29:32
 * @Last Modified by:   Xiyou
 * @Last Modified time: 2016-04-21 16:56:49
 */

// 系统全局配置文件
// 
define('IS_DEBUG',1);    //是否开启调试模式

$config['template'] = 'default';  //网站模板目录
$config['template_suffix'] = '.html';  //模板文件后缀，一般为html或htm
$config['url_rewrite'] = 0 ;   //是否开启URL重写，0关闭，1开启
$config['url_suffix'] = '';  //URL重写伪后缀，可以为任意字符或留空
$config['domain'] = 'www.sp.com';   //域名配置
$config['site_name'] = '农年科技管理系统';  //站点名称
$config['site_path'] = '/';
$config['site_logo']        ='';
$config['site_keywords']    ='农年科技管理系统-关键词';
$config['site_description'] ='工匠精神、细节、点滴、开源、高效、安全';
$config['site_icp']         =''; //ICP备案号
$config['site_url']         ='http://www.sp.com/';
$config['site_addr']        ='';
$config['site_mobile']      ='';
$config['site_email']       ='';
$config['site_zip']         ='';
$config['site_phone']       ='';
$config['time_zone'] = 'UTC'; //时区配置
$config['cookie_domain'] = '';
$config['cookie_path'] = '/';
$config['cookie_pre'] = 'c0r_';
$config['cache'] = 'file';
$config['cache_pre'] = 'c8r_';
$config['cache_dir'] = '';
$config['timediff'] = '0';
$config['skin'] = 'default';
$config['template'] = 'default';
$config['language'] = 'zh-cn';
$config['authadmin'] = 'session';
$config['authkey'] = 'ubKhvq73V0vuXtXk';
$config['static'] = '';
$config['cloud_uid'] = '';
$config['cloud_key'] = '';