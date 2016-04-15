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
class ad extends baseContoller
{
    /**
     * summary
     */
    public function __construct()
    {
        parent::__construct();

    }

    /**
     * [index description]
     * @return [type] [description]
     */
    public function index(){
//        $this->display('ad');
        echo $this->db->test_parent();
    }


    /**
     * [show 显示单页广告]
     * @return [type] [description]
     */
    public function show(){

    }


    /**
     * [getCode 获得广告代码]
     * @return [type] [description]
     * @author hexiyou.cn@gmail.com
     */
    public function getCode(){

    }

}