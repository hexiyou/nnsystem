<?php
/**
 * @Author: Lonelyer <hackkey@qq.com>
 * @link:  http://www.7s.com.cn
 * @Date:   $DATE$ $TIME$
 * @Last Modified time: 2016-04-16 15:23:26
 * @Packages:   nnCMS
 * @User:  $user$
 * @File:  Filename()
 * @Copyright: Copyright (c) 2016 7s.com.cn.Co.Ltd. All rights reserved.
 */

/**
 * 登录控制器
 *
 *
 */
$user = spClass('user',null,$GLOBALS['G_SP']['controller_path'].'/user.php');
class login extends user{

    public function __construct()
    {
        parent::__construct();
    }

    public function __autoload(){
        
    }

    public function getWhere()
    {
        $sql = "";
        return $sql;

    }


    public function set()
    {

    }

    public function QR(){
        spClass('QRcode')->img("http://www.speedphp.com"); 
    }

    public function oauth(){
        $this->center;
        $platform = $this->spArgs('p');
        loadOauth($platform);
    }


}