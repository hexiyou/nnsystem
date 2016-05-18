<?php
/**
 * @Author: Lonelyer <hackkey@qq.com>
 * @link:  http://www.7s.com.cn
 * @Date:   2016-04-18 11:45:24
 * @Last Modified time: 2016-05-17 18:34:53
 * @Packages:   nnCMS
 * @Copyright: Copyright (c) 2016 7s.com.cn.Co.Ltd. All rights reserved.
 */

/**
 * SEO优化系统设置
 */
class seo extends base
{
    public function __construct()
    {
       parent::__construct(); 
    }

    public function index(){
    	getMemcacheKeys();
    	// $this->display('seo');
    }


    public function test(){
    	print_r(_getuserinfo());
    }
}