<?php
/**
 * @Author: Lonelyer <hackkey@qq.com>
 * @link:  http://www.7s.com.cn
 * @Date:   2016-04-15 11:24:14
 * @Last Modified time: 2016-05-17 15:12:42
 * @Packages:   nnCMS
 * @Copyright: Copyright (c) 2016 7s.com.cn.Co.Ltd. All rights reserved.
 */
// 常规常量定义 
define('CHARSET','utf-8');
defined('DSP') or define('DSP',DIRECTORY_SEPARATOR); //目录分隔符，区分Windows/Linux
defined('APP_PATH') or define('APP_PATH',dirname(dirname(__FILE__))); //站点根目录绝对路径
defined('DATA_PATH') or define('DATA_PATH',dirname(__FILE__)); //站点Data目录
defined('API_PATH') or define('API_PATH',APP_PATH.DIRECTORY_SEPARATOR.'api'.DIRECTORY_SEPARATOR);
defined('INC_PATH') or define('INC_PATH',APP_PATH.DIRECTORY_SEPARATOR.'include'.DIRECTORY_SEPARATOR); //站点include类库目录
defined('LANG_PATH') or define('LANG_PATH',INC_PATH.'lang'.DIRECTORY_SEPARATOR); //站点语言库目录
defined('CTL_PATH') or define('CTL_PATH',APP_PATH.DSP.'controller'.DSP);
if(defined('ADMIN_PATH')){
	defined('ADMIN_CTL_PATH') or define('ADMIN_CTL_PATH',ADMIN_PATH.DSP.'controller'.DSP);
}
define('AUTO_LOAD_MODEL',true); // 是否自动载入数据库模型
define('LIST_ALIAS_ACTION','list_action');   //为各个控制器 list 动作创建别名指向