<?php
/**
 * @Author: Xiyou
 * @Date:   2016-04-09 11:32:08
 * @Last Modified by:   Xiyou
 * @Last Modified time: 2016-04-15 11:23:45
 */
class baseContoller extends spController
{
	public $ctl_version = 'V1.0';

	function __construct()
	{
		global $__controller,$__action;
		parent::__construct();
		if($GLOBALS['G_C']['template_suffix']!=""){
			$this->tpl_suffix = $GLOBALS['G_C']['template_suffix'];
		}
		$this->__set_siteConfig(); //公共变量赋值
		$this->seo();
		if(IS_DEBUG) $this->enable_php_tag(TRUE);
		// 自动载入控制器相匹配的数据模型
        if(defined('AUTO_LOAD_MODEL')){
        	$__model_path = $GLOBALS['G_SP']['model_path'].DSP .$__controller .'_model.php';
        	if(AUTO_LOAD_MODEL && file_exists($__model_path)){
        		$this->db = spClass($__controller.'_model',null,$__model_path);
        	}
        }
	}


	/**
	 * [__set_siteConfig 赋值]
	 * @return [type] [description]
	 */
	public function __set_siteConfig(){
		$this->__set('CFG',$GLOBALS['G_C']); //config.php 配置项赋值
		$this->site_name = $GLOBALS['G_C']['site_name'];
		$this->site_url =  $GLOBALS['G_C']['site_url'];
	}

	/**
	 * [seo SEO优化，重新设置网站的标题，关键词，描述]
	 * @return [type] [description]
	 */
	public function seo(){
		$this->title = $this->page_title.' - '.$this->site_name;
		$this->keywords = $this->CFG['keywords'];
		$this->description = $this->CFG['description'];
		$this->author = '7s.com.cn';
		//是否展示 SEO标题
		if(isset($this->seo_title)&&!empty($this->seo_title)){
			$this->show_title = $this->seo_title;
		}else{
			$this->show_title = $this->title;
		}

	}


	/**
     *
     * 错误提示程序 重载sp框架函数
     *
     * 应用程序的控制器类可以覆盖该函数以使用自定义的错误提示
     *
     * @param $msg   错误提示需要的相关信息
     * @param $url   跳转地址
     */
    public function error($msg, $url = ''){
		$this->display('error.html');
		exit;
    }

    /**
     *
     * 成功提示程序 重载sp框架函数
     *
     * 应用程序的控制器类可以覆盖该函数以使用自定义的成功提示
	 *
     * @param $msg   成功提示需要的相关信息
     * @param $url   跳转地址
     */
    public function success($msg, $url = ''){
		$this->display('success.html');
		exit;
    }


    /**
     * [assign __set 别名，赋值变量到模板]
     * @param  [type] $name  [description]
     * @param  [type] $value [description]
     * @return [type]        [description]
     */
    public function assign($name, $value){
    	$this->__set($name, $value);
    }

    /**
     * [enable_php_tag 是否允许在Smarty模板中书写PHP标签]
     * @param  boolean $status [开关选项TRUE OR FALASE]
     * @return [type]          [description]
     * @author hexiyou.cn@gmail.com
     */
    public function enable_php_tag($status=FALSE)
    {
    	$this->getView()->allow_php_tag = $status;
    }



    /**
	 * 输出模板 覆写 spContoller display方法，省略后缀
	 *
     * @param $tplname   模板路径及名称
     * @param $output   是否直接显示模板，设置成FALSE将返回HTML而不输出
     * @author hexiyou.cn@gmail.com
	 */
	public function display($tplname, $output = TRUE)
	{
		if($this->tpl_suffix && stripos($tplname,$this->tpl_suffix)===false) 
			$tplname.=$this->tpl_suffix;
    	@ob_start();
		if(TRUE == $GLOBALS['G_SP']['view']['enabled']){
			$this->v->display($tplname);
		}else{
			extract($this->__template_vals);
			require($tplname);
		}
		if( TRUE != $output )return ob_get_clean();
    }

}