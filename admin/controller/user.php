<?php

/**
 * @Author: Xiyou
 * @Date:   2016-04-07 13:20:33
 * @Last Modified by:   Xiyou
 * @Last Modified time: 2016-04-07 15:19:36
 */
class user extends base
{
    public $auto_display = false; //关闭自动模板输出

    public function __construct()
    {
        parent::__construct();
    }

    public function index()
    {

    }


    function login()
    {
        if ($this->isPOST()) {
            $this->dumpout($this->spArgs());
        } else {
            $this->display('login.html');
        }
    }


    function admin_add()
    {
        $this->display('index.html');
    }


    function auto()
    {
        $this->allvars = $_SERVER;
    }
}