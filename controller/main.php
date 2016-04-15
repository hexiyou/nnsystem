<?php
/**
 *  主控制器
 */
class main extends baseContoller
{

	public $page_title = "首页";

	public function __construct()
	{
		parent::__construct();		
	}

    function index() {
        $this->display('index.html');
    }

    
    function show() {
    }

    
    function write() {
    }


    public function __destruct(){

    }
}
