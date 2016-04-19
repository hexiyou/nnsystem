<?php
/**
 * @Author: Lonelyer <hackkey@qq.com>
 * @link:  http://www.7s.com.cn
 * @Date:   2016-04-18 11:45:24
 * @Last Modified time: 2016-04-19 15:43:30
 * @Packages:   nnCMS
 * @Copyright: Copyright (c) 2016 7s.com.cn.Co.Ltd. All rights reserved.
 */

/**模块管理**/

class module extends base
{
    public function __construct()
    {
        parent::__construct();
    }

    public function index()
    {
    	$this->display('module');
    }
}