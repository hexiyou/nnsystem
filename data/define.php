<?php
/**
 * @Author: Lonelyer <hackkey@qq.com>
 * @link:  http://www.7s.com.cn
 * @Date:   2016-04-15 11:24:14
 * @Last Modified time: 2016-04-16 19:15:10
 * @Packages:   nnCMS
 * @Copyright: Copyright (c) 2016 7s.com.cn.Co.Ltd. All rights reserved.
 */
// 常规常量定义 
define('CHARSET','utf-8');
defined('DSP') or define('DSP',DIRECTORY_SEPARATOR); //目录分隔符，区分Windows/Linux
defined('APP_PATH') or define('APP_PATH',dirname(dirname(__FILE__))); //站点根目录绝对路径
defined('DATA_PATH') or define('DATA_PATH',dirname(__FILE__)); //站点Data目录
defined('INC_PATH') or define('INC_PATH',APP_PATH.DIRECTORY_SEPARATOR.'include'.DIRECTORY_SEPARATOR); //站点include类库目录
define('AUTO_LOAD_MODEL',true); // 是否自动载入数据库模型