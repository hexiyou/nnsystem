<?php

/**
 * @Author: Lonelyer <hackkey@qq.com>
 * @link:  http://www.7s.com.cn
 * @Date:   2016-04-16 11:32:14
 * @Last Modified time: 2016-04-21 16:45:10
 * @Packages:   nnCMS
 * @Copyright: Copyright (c) 2016 7s.com.cn.Co.Ltd. All rights reserved.
 */

/**
 *  验证码类控制器
 */
class verify extends baseContoller {

	public $auto_display = false;

	public function __construct() {
		parent::__construct();
	}

	/**
	 * [输出验证码图片]
	 * @return [type] [description]
	 */
	public function show() {
		$img_format = $this->spArgs('t')!=null?$this->spArgs('t'):'png'; //可获取参数中需要最终输出的图片格式jpg or png or gif;
		$params = array(90,30,5,$img_format);
		$vcode = spClass('spVerifyCode',$params);
		$vcode->display();
	}

	/**
	 * [check 检查验证码是否正确]
	 * @return [boolean] [description]
	 */
	public function check() {
		$vcode = spClass('spVerifyCode');
		if ($vcode->verify($this->spArgs('verifycode'))) {
			//通过验证
			return true;
		} else {
			//没有通过验证
			return false;
		}
	}
}
