<?php
/**
 * @Author: Lonelyer <hackkey@qq.com>
 * @link:  http://www.7s.com.cn
 * @Date:   $DATE$ $TIME$
 * @Last Modified time: 2016-04-15 11:25:15
 * @Packages:   nnCMS
 * @User:  $user$
 * @File:  Filename()
 * @Copyright: Copyright (c) 2016 7s.com.cn.Co.Ltd. All rights reserved.
 */

class search_model extends spModel
{

    public $table = "search_index";

    public $addrules = array();

    public $verifier = array();


    public function __construct()
    {
        parent::__construct();
    }
}