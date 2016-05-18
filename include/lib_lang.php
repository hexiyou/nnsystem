<?php
/**
 * @Author: Lonelyer <hackkey@qq.com>
 * @link:  http://www.7s.com.cn
 * @Date:   2016-04-18 11:45:38
 * @Last Modified time: 2016-05-12 18:04:09
 * @Packages:   nnCMS
 * @Copyright: Copyright (c) 2016 7s.com.cn.Co.Ltd. All rights reserved.
 */
defined('IN_APP') or exit('Access Denied!');
class lib_lang 
{

	public $_langDir = "";
	public $_lang = 'zh-cn';
	public $_langData = array();
	
	public function __construct($LANGROOT=null,$LANG='zh-cn')
	{
		$LANGROOT = $LANGROOT!=null?$LANGROOT:APP_PATH.DSP.'include'.DSP.'lang'.DSP;
		$this->setLangDir($LANGROOT);
		$this->setLang($lANG);
	}


	public function getLangDir(){
       return $this->_langDir;
	}

	public function setLangDir($sDir){
		if(substr($sDir,-1)!=DIRECTORY_SEPARATOR){
			$sDir.=DIRECTORY_SEPARATOR;
		}
		$this->_langDir = $sDir;
	}

	public function setLang($name){
         $this->_lang=$name;
	}


	public function getLangData(){
		return $this->_langData;
	}


	public function getLangFile($file,$absolute=false,$suffix=".php"){
		$langData = array();
		if($absolute && file_exists($file)){
			include($file);
			$langData = $LANG;
		}else{
			$file = $this->_langDir.$this->_lang.DIRECTORY_SEPARATOR.$file.$suffix;
			if(file_exists($file)&&include($file)){
				if(isset($LANG) && is_array($LANG)){
					$langData = $LANG;
				}
			}
		}
		return $langData;
	}


	public function importLangFile($file,$absolute=false,$suffix=".php"){
		$langData = array();
		if($absolute && file_exists($file)){
			@include($file);
			$langData = $LANG;
		}else{
			$file = $this->_langDir.$this->_lang.DIRECTORY_SEPARATOR.$file.$suffix;
			if(file_exists($file)&&include($file)){
				if(isset($LANG) && is_array($LANG)){
					$langData = $LANG;
				}
			}
		}
		$this->_langData = array_merge($this->_langData,$langData);
		return $this->_langData;
	}


	public function getItem($name){
		if(array_key_exists($name,$this->_langData)){
			return $this->_langData[$name];
		}
		return "";
	}


	public function __destruct(){

	}
}