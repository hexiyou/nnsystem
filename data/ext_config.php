<?php
/**
 * @Author: Lonelyer <hackkey@qq.com>
 * @link:  http://www.7s.com.cn
 * @Date:   2016-04-16 11:56:24
 * @Last Modified time: 2016-04-16 14:24:47
 * @Packages:   nnCMS
 * @Copyright: Copyright (c) 2016 7s.com.cn.Co.Ltd. All rights reserved.
 */
/**
 *  拓展组件配置信息
 */
return array(
	'ext' => array(
			'spVerifyCode' => array( //验证码扩展
			'width' => 90, //验证码宽度
			'height' => 32, //验证码高度
			'length' => 4, //验证码字符长度
			'bgcolor' => '#FFFFFF', //背景色
			'noisenum' => 60, //图像噪点数量
			'fontsize' => 28, //字体大小
			'fontfile' => 'font.ttf', //字体文件
			'format' => 'png', //验证码输出图片格式
	),

   'spEmail' => array( //邮件扩展的基本设置
            'debug' => TRUE, //调试模式
            'host_name' => '163.com', //邮件主机名
            'smtp_host' => 'smtp.163.com',        //SMTP服务器
            'smtp_port' => '25',        //SMTP端口
            'auth' => TRUE,        //身份验证
            'from' => 'admin@163.com', //发件邮箱
            'user' => 'admin',        //用户名
            'pass' => 'pass',        //密码
            'log_file' => '',        //日志文件
            'time_out' => 30,        //超时时间
        ),


		// 康盛UCenter的设置 
	'spUcenter' => array(
			'UC_CLIENT_DIR' => "", // uc_client文件夹的目录，无需设置

			'UC_CONNECT' => NULL, // 连接 UCenter 的方式: mysql/NULL, 默认为空时为 fscoketopen()
			// mysql 是直接连接的数据库, 为了效率, 建议采用 mysql

			//数据库相关 (mysql 连接时, 并且没有设置 UC_DBLINK 时, 需要配置以下变量)
			'UC_DBHOST' => 'localhost', // UCenter 数据库主机
			'UC_DBUSER' => 'root', // UCenter 数据库用户名
			'UC_DBPW' => '', // UCenter 数据库密码
			'UC_DBNAME' => 'ucenter', // UCenter 数据库名称
			'UC_DBCHARSET' => 'utf8', // UCenter 数据库字符集
			'UC_DBTABLEPRE' => 'ucenter.uc_', // UCenter 数据库表前缀，务必注意：最好在表前缀前加上库名

			//通信相关
			'UC_KEY' => '123456789', // 与 UCenter 的通信密钥, 要与 UCenter 保持一致
			'UC_API' => 'http://yourwebsite/uc_server', // UCenter 的 URL 地址, 在调用头像时依赖此常量
			'UC_CHARSET' => 'utf8', // UCenter 的字符集
			'UC_IP' => '', // UCenter 的 IP, 当 UC_CONNECT 为非 mysql 方式时, 并且当前应用服务器解析
			'UC_APPID' => 1 // 当前应用的 ID
	),


	 'logsize'   => '10240000',      // 日志文件大小
        'logpath'   => APP_PATH.'/tmp', // 日志保存目录
        'logprefix' => 'log_',          // 日志文件前缀’
        'mail'      => 'ALL',           // 是否发送日志邮件，
        // 取值"ALL"是全部日志都发送，取值'ERROR', 'WARN','NOTICE','INFO','DEBUG'任意一种是只发送该种日志，取值NULL是不发送日志
        'mailto'    => 'webmaster@localhost', // 发送到的邮件地址

)
);
