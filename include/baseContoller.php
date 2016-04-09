<?php
/**
 * @Author: Xiyou
 * @Date:   2016-04-09 11:32:08
 * @Last Modified by:   Xiyou
 * @Last Modified time: 2016-04-09 11:52:42
 */

/**
* 
*/
class baseContoller extends spController
{
	public $myvar="nongnian";

	function __construct()
	{
		parent::__construct();
	}


	function myfun(){
		echo "This is my Function";
	}
}