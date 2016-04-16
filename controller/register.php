<?php
/**
 * @Author: Lonelyer <hackkey@qq.com>
 * @link:  http://www.7s.com.cn
 * @Date:   2016-04-09 18:41:28
 * @Last Modified time: 2016-04-16 19:24:27
 * @Packages:   nnCMS
 * @Copyright: Copyright (c) 2016 7s.com.cn.Co.Ltd. All rights reserved.
 */
/**
 *
 * 注册控制器
 * 
 */
class register extends user
{
    public function __construct()
    {
        parent::__construct();
    }


    public function index(){
    	$_classname = get_class();
    	$this->$_classname();
    }
}