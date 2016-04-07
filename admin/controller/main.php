<?php
class main extends spController
{

    public function __construct(){
        parent::__construct();
    }

    function index(){ // 这里是首页
        $this->display('index.html');
	}

    
    function show() {
        
        // 这里是查看留言内容
        $id = $this->spArgs("id");
        
        // 用spArgs接收spUrl传过来的ID
        $guestbook = spClass("guestbook");
        
        // 还是用spClass
        $condition = array('id' => $id);
        
        // 制造查找条件，这里是使用ID来查找属于ID的那条留言记录
        $result = $guestbook->find($condition);
        
        // 这次是用find来查找，我们把$condition（条件）放了进去
        // 下面输出了该条留言内容
        echo "<p>留言标题：{$result['title']}</p>";
        echo "<p>留言者：{$result['name']}</p>";
        echo "<p>留言内容：{$result['contents']}</p>";
    }
    
    function write() {
        
        // 这里是留言
        $guestbook = spClass("guestbook");
        $guestbook->create($this->spArgs());
        
        // 这里用$this->spArgs()取得了表单的全部内容，然后增加了一条留言记录
        echo "留言成功，<a href=/index.php>返回</a>";
    }

    function test_update(){ // 测试update用页面
		$guestbook = spClass("guestbook");
		$conditions = array("id"=>2); // 查找id是2的记录
		$newrow = array(
			'name' => '喜羊羊',  // 然后将这条记录的name改成“喜羊羊”
		);
		$guestbook->update($conditions, $newrow); // 更新记录
		echo "已修改id为2的记录！";
	}

    /**
     * [__destruct 析构函数]
     */
    public function __destruct(){

    }

}
