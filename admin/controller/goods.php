<?php
/**
 * @Author: Lonelyer <hackkey@qq.com>
 * @link:  http://www.7s.com.cn
 * @Date:   2016-04-18 11:45:24
 * @Last Modified time: 2016-05-18 15:07:09
 * @Packages:   nnCMS
 * @Copyright: Copyright (c) 2016 7s.com.cn.Co.Ltd. All rights reserved.
 */

class goods extends base
{
    public function __construct()
    {
        parent::__construct();
    }

    public function index(){
    	$this->display('goods_main');
    }


    /**
     * [list_action 获取商品列表]
     * @return [type] [description]
     */
    public function list_action(){
    	$this->display('goods_list.html');
    }
}