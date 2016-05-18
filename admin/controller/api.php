<?php
/**
 * @Author: Lonelyer <hackkey@qq.com>
 * @link:  http://www.7s.com.cn
 * @Date:   2016-05-13 13:41:13
 * @Last Modified time: 2016-05-17 16:11:07
 * @Packages:   nnCMS
 * @Copyright: Copyright (c) 2016 7s.com.cn.Co.Ltd. All rights reserved.
 */
/**
 * api 脚本管理控制器
 */
class api extends base
{
	public $auto_display = false;

	public $page_title = 'API管理';

	public $suffix = '.php';
	
	public function __construct()
	{
		parent::__construct();
	}


	public function list_action(){
		$api_path = API_PATH;
		$this->name_config = include(API_PATH.'.config.conf');
		$api_files = glob($api_path.'*.php');
		$this->_apis = $api_files;
		$this->display('api_list.html');
	}


	public function run(){
		$name = $this->spArgs('file');
		if(empty($name)){
			exit('no api file');
		}
		$_api_path = APP_PATH.DIRECTORY_SEPARATOR.'api'.DIRECTORY_SEPARATOR;
		$_api_file = $_api_path.$name.$this->suffix;
        if(file_exists($_api_file)){
        	require($_api_file);
        	$this->show_done($name.".php -api脚本执行完毕！");
        	return true;
        }
        return true;
	}

	/**
	 * [show_done 脚本执行完毕显示提示信息]
	 * @return [type] [description]
	 */
	public function show_done($str="done..."){
		$output = '<div style="background-color:#efefef;width:100%;padding:12px;font-size:18px;margin-top:36px; border:1px solid green;">'.$str.'</div>';
		echo $output;
	}


	public function edit(){

	}


	public function delete(){

	}

	public function add(){
		echo "新建API";
	}
}