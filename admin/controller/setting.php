<?php
/**
 * @Author: Lonelyer <hackkey@qq.com>
 * @link:  http://www.7s.com.cn
 * @Date:   2016-04-18 11:45:24
 * @Last Modified time: 2016-04-19 15:34:28
 * @Packages:   nnCMS
 * @Copyright: Copyright (c) 2016 7s.com.cn.Co.Ltd. All rights reserved.
 */
/**后台系统设置**/
class setting extends base
{
    public function __construct()
    {
        parent::__construct();
    }

    public function index(){
    	$this->display('setting');
    }
}