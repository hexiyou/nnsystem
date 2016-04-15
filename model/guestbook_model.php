<?php

class guestbook_model extends spModel
{
    var $pk = "id"; // 每个留言唯一的标志，可以称为主键
    var $table = "guestbook"; // 数据表的名称


    public function __construct()
    {

    }
}
