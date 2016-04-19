<?php
/**
 * @Author: Lonelyer <hackkey@qq.com>
 * @link:  http://www.7s.com.cn
 * @Date:   $DATE$ $TIME$
 * @Last Modified time: 2016-04-19 19:14:33
 * @Packages:   nnCMS
 * @User:  $user$
 * @File:  Filename()
 * @Copyright: Copyright (c) 2016 7s.com.cn.Co.Ltd. All rights reserved.
 */

class category extends base{

    public function __construct()
    {
        parent::__construct();
    }


    public function index(){

        $this->display('category.html');
    }

}