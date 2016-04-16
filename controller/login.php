<?php
/**
 * @Author: Lonelyer <hackkey@qq.com>
 * @link:  http://www.7s.com.cn
 * @Date:   $DATE$ $TIME$
 * @Last Modified time: 2016-04-16 19:14:02
 * @Packages:   nnCMS
 * @User:  $user$
 * @File:  Filename()
 * @Copyright: Copyright (c) 2016 7s.com.cn.Co.Ltd. All rights reserved.
 */

/**
 *  登录控制器,继承于 controller\user.php
 *
 *  调用user控制器已定义的方法
 */

class login extends user{

    public function __construct()
    {
        parent::__construct();
    }

    public function index(){
        $this->login();
    }

}