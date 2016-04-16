<?php

/**
 * @Author: Lonelyer <hackkey@qq.com>
 * @link:  http://www.7s.com.cn
 * @Date:   2016-04-16 11:32:14
 * @Last Modified time: 2016-04-16 13:06:19
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

	public function show() {
		$vcode = spClass('spVerifyCode');
		$vcode->display();
	}

	public function check() {
		$vcode = spClass('spVerifyCode');
		if ($vcode->verify($this->spArgs('verifycode'))) {
			//通过验证
		} else {
			//没有通过验证
		}
	}
}
