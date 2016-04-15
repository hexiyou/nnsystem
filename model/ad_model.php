<?php
/**
 * @Author: Lonelyer <hackkey@qq.com>
 * @link:  http://www.7s.com.cn
 * @Date:   2016-04-09 18:59:47
 * @Last Modified time: 2016-04-15 11:42:42
 * @Packages:   nnCMS
 * @Copyright: Copyright (c) 2016 7s.com.cn.Co.Ltd. All rights reserved.
 */

/**
 *  广告模型数据库
 */
class ad_model extends spModel
{
    public $table = "ad";

    public $verifier = array();

    public $addrules = array();

    public function __construct()
    {
        parent::__construct();
    }


    public function get_code(){

    }


    public function getOne(){

    }
}