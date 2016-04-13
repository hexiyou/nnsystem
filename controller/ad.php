<?php
/**
 * @Author: Xiyou
 * @Date:   2016-04-09 18:41:28
 * @Last Modified by:   Xiyou
 * @Last Modified time: 2016-04-13 10:01:39
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
         $this->error();
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

    /**
     * [list description]
     * @return [type] [description]
     */
    public function list(){
        $this->display('index');
    }
}