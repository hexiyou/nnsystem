<?php
/**
 * @Author: Lonelyer <hackkey@qq.com>
 * @link:  http://www.7s.com.cn
 * @Date:   2016-04-18 11:45:24
 * @Last Modified time: 2016-05-13 17:49:40
 * @Packages:   nnCMS
 * @Copyright: Copyright (c) 2016 7s.com.cn.Co.Ltd. All rights reserved.
 */
defined('IN_APP') or exit('Access Denied!');
defined('IN_ADMIN') or exit('Access Denied!');
/**后台系统设置管理控制器**/
class setting extends base
{
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * [clear 清除缓存主页]
     * @return [type] [description]
     */
    public function clear(){
    	if($this->isPOST('submit')){
    		$types = $this->spArgs('cache_type',array());
    		if(count($types)==1 && $types[0] == "template"){
    			$msg = L('template_clear_complete');
    			$this->clear_tplcompile();
    		}elseif(count($types)==1 && $types[0] == "lang"){
    			return $this->clear_langcache();
    		}elseif(count($types)==1 && $types[0] == "data"){
    			$msg = L('data_clear_complete');
    			$this->clear_datacache();
    		}else{
    			return $this->clear_all();
    		}
    		$this->success($msg);
    	}else{
    		$this->display('clear.html');
    	}
    }

    /**
     * [clear_all 清除所有缓存]
     * @return [type] [description]
     */
    public function clear_all(){
    	$cache_type = $this->spArgs('type','all');
    	switch ($cache_type) {
    		case 'template':
    			$this->clear_tplcompile(); //清除模板缓存
    			$msg = L('template_clear_complete');
    			break;
    		case 'data':
    			$this->clear_datacache();//清除数据缓存
    			$msg = L('data_clear_complete');
    			break;
    		default:
    			$this->clear_tplcompile();
    			$this->clear_datacache();
    			$msg = L('all_cache_clear_complete');
    			break;
    	}

    	$this->success($msg);
    }

    /**
     * [clear_datacache 清除数据缓存]
     * @return [type] [description]
     */
    public function clear_datacache(){
    	$_dirpath = APP_PATH.DSP.'runtime'.DSP.'tmp';
    	$cache_files = get_files($_dirpath);
    	foreach ($cache_files as $_file) {
    		unlink($_file);
    	}
    	return true;
    }

    /**
     * [clear_tplcompile 清除模板编译缓存]
     * @return [type] [description]
     */
    public function clear_tplcompile(){
    	$_dirpath = APP_PATH.DSP.'runtime'.DSP.'compile';
    	$cache_files = get_files($_dirpath);
    	foreach ($cache_files as $_file) {
    		unlink($_file);
    	}
    	return true;
    }

    /**
     * [clear_langcache 清除语言包缓存]
     * @return [type] [description]
     */
    public function clear_langcache(){
    	$lang_type = 'zh-cn';
    	$_langkeys = get_LANGKey($lang_type);
    	$prepare_key = array('common','admin','system','messages');
    	$clear_keys = array_merge($prepare_key,$_langkeys);

    	foreach ($clear_keys as $_key) {
    		spAccess('c',$_key);  //删除指定项语言包缓存
    	}

    	$this->success(L('language_clear_complete'));
    	return true;
    }

    public function index(){
    	$this->display('setting.html');
    }

    /**
     * [secure 网站服务器安全设置]
     * @return [type] [description]
     */
    public function secure(){
    	$this->display('setting_secure.html');
    }

    /**
     * [config 网站功能模块各参数配置
     * @return [type] [description]
     */
    public function config(){
    	$this->display('setting_config.html');
    }


    /**
     * [seo SEO功能设置]
     * @return [type] [description]
     */
    public function seo(){
    	$this->display('setting_seo.html');
    }

    /**
     * [menu 导航菜单设置]
     * @return [type] [description]
     */
    public function menu(){
    	$this->display('setting_menu.html');
    }
}