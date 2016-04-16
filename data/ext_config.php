<?php
/**
 * @Author: Lonelyer <hackkey@qq.com>
 * @link:  http://www.7s.com.cn
 * @Date:   2016-04-16 11:56:24
 * @Last Modified time: 2016-04-16 13:05:41
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
)
);
