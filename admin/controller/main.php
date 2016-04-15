<?php
class main extends spController
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
    
    function show() {
        
    }
    
    function write() {
        
    
    }

    function test_update(){ // 测试update用页面
		
	}

    /**
     * [__destruct 析构函数]
     */
    public function __destruct(){

    }

}
