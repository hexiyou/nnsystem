<?php
/**
 * @Author: Lonelyer <hackkey@qq.com>
 * @link:  http://www.7s.com.cn
 * @Date:   2016-04-18 11:45:24
 * @Last Modified time: 2016-04-20 10:48:28
 * @Packages:   nnCMS
 * @Copyright: Copyright (c) 2016 7s.com.cn.Co.Ltd. All rights reserved.
 */
/**后台管理入口**/
class main extends base
{

    public function __construct(){
        parent::__construct();
    }

    function index(){ 
        //加载后台管理框架
        $this->display('main.html');
	}


    function fetch_tpl(){
        $pos = $this->spArgs('pos');
        $this->display($pos.'.html');
    }

    /**
     * [__destruct 析构函数]
     */
    public function __destruct(){

    }

}
