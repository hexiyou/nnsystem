<?php
/**
 * @Author: Lonelyer <hackkey@qq.com>
 * @link:  http://www.7s.com.cn
 * @Date:   2016-05-13 13:42:49
 * @Last Modified time: 2016-05-13 14:08:42
 * @Packages:   nnCMS
 * @Copyright: Copyright (c) 2016 7s.com.cn.Co.Ltd. All rights reserved.
 */
defined('IN_APP') or exit('Access Denied!');
/**
 *  API脚本调用外壳控制器
 */
class api extends baseContoller
{
	private $suffix = '.php';
	public $auto_display = false;
	
	public function __construct()
	{
		parent::__construct();
	}

	public function run($name='index'){
		$_api_path = APP_PATH.DIRECTORY_SEPARATOR.'api'.DIRECTORY_SEPARATOR;
		$_api_file = $_api_path.$name.$this->suffix;
        if(file_exists($_api_file)){
        	return require($_api_file);
        }
        return true;
	}

	public function index(){
		$this->api = $this->spArgs('file','index');
		$this->run($this->api);
	}
}