<?php
/**
 * @Author: Lonelyer <hackkey@qq.com>
 * @link:  http://www.7s.com.cn
 * @Date:   2016-04-18 11:45:24
 * @Last Modified time: 2016-05-18 19:31:51
 * @Packages:   nnCMS
 * @Copyright: Copyright (c) 2016 7s.com.cn.Co.Ltd. All rights reserved.
 */

class extend extends base
{
	
	public function __construct()
	{
		parent::__construct();
	}


	public function index(){
		$this->tpl_test();
	}

	/**
	 * [showtpl 调用显示模板]
	 * @return [type] [description]
	 */
	public function showtpl(){
		$tpl=$this->spArgs('tpl');
		if($tpl==null){
			exit('没有选中模板');
		}
		$this->display($tpl);
	}

	/**
	 * [tpl_test 测试后台模板展示效果，供开发用]
	 * @return [type] [description]
	 */
	public function tpl_test(){
		$this->page_title = '后台模板效果测试';
		$template_dir = ADMIN_PATH.DIRECTORY_SEPARATOR.'template'.DIRECTORY_SEPARATOR.'*.html';
		$tpl_files = glob($template_dir);
		$this->files = $tpl_files;
		$this->display('tpl_test.html');
	}
}