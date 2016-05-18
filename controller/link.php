<?php
/**
 * @Author: Lonelyer <hackkey@qq.com>
 * @link:  http://www.7s.com.cn
 * @Date:   2016-04-18 11:45:33
 * @Last Modified time: 2016-04-21 11:39:11
 * @Packages:   nnCMS
 * @Copyright: Copyright (c) 2016 7s.com.cn.Co.Ltd. All rights reserved.
 */
/**
 * 友情链接模块
 */
class link extends baseContoller
{
    public function __construct()
    {
        parent::__construct();
    }


    public function index(){
    	$this->display('link');
    }
}