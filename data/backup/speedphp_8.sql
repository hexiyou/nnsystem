-- MySQL dump 10.13  Distrib 5.5.40, for Win32 (x86)
--
-- Host: localhost    Database: speedphp
-- ------------------------------------------------------
-- Server version	5.5.40

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `nn_acl`
--

DROP TABLE IF EXISTS `nn_acl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nn_acl` (
  `aclid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `controller` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `action` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `acl_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`aclid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nn_acl`
--

LOCK TABLES `nn_acl` WRITE;
/*!40000 ALTER TABLE `nn_acl` DISABLE KEYS */;
/*!40000 ALTER TABLE `nn_acl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nn_admin`
--

DROP TABLE IF EXISTS `nn_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nn_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '默认主键',
  `groupid` int(11) NOT NULL COMMENT '用户组ID',
  `user_name` char(40) COLLATE utf8_bin NOT NULL,
  `password` char(160) COLLATE utf8_bin NOT NULL,
  `pwd_hash` char(10) COLLATE utf8_bin DEFAULT NULL,
  `email` varchar(120) COLLATE utf8_bin DEFAULT NULL,
  `mobile` char(11) COLLATE utf8_bin DEFAULT NULL,
  `birthday` int(10) DEFAULT NULL,
  `create_time` int(10) NOT NULL COMMENT '创建时间',
  `last_login` int(10) DEFAULT NULL COMMENT '最后登录时间',
  `create_ip` varchar(120) COLLATE utf8_bin NOT NULL COMMENT '注册IP',
  `login_ip` varchar(120) COLLATE utf8_bin DEFAULT NULL COMMENT '最后登录IP',
  `list_order` int(6) NOT NULL DEFAULT '1' COMMENT '排序字段',
  `locked` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否锁定(1-锁定，2-不锁定)',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nn_admin`
--

LOCK TABLES `nn_admin` WRITE;
/*!40000 ALTER TABLE `nn_admin` DISABLE KEYS */;
INSERT INTO `nn_admin` VALUES (3,0,'xninfo','07037df431085a1dc1a0505d2d5bae26','abcdef','xninfo@163.com','13812342022',1462354542,1462354542,1462354542,'127.0.0.1','127.0.0.1',50,0),(2,0,'admin','c7935cc8ee50b752345290d8cf136827','abcdef','hackkey@qq.com','15587210592',708393600,1462351247,1462351247,'127.0.0.1','127.0.0.1',50,0);
/*!40000 ALTER TABLE `nn_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nn_admin_group`
--

DROP TABLE IF EXISTS `nn_admin_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nn_admin_group` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户组id,自增主键',
  `type` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '组类型',
  `title` char(20) NOT NULL DEFAULT '' COMMENT '用户组中文名称',
  `description` varchar(80) NOT NULL DEFAULT '' COMMENT '描述信息',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '用户组状态：为1正常，为0禁用,-1为删除',
  `rules` varchar(500) NOT NULL DEFAULT '' COMMENT '用户组拥有的规则id，多个规则 , 隔开',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='用户组定义表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nn_admin_group`
--

LOCK TABLES `nn_admin_group` WRITE;
/*!40000 ALTER TABLE `nn_admin_group` DISABLE KEYS */;
INSERT INTO `nn_admin_group` VALUES (0,0,'超级管理员','超级管理员',1,'');
/*!40000 ALTER TABLE `nn_admin_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nn_admin_menu`
--

DROP TABLE IF EXISTS `nn_admin_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nn_admin_menu` (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `admin_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '所属用户',
  `sort` int(8) unsigned NOT NULL DEFAULT '100',
  `title` varchar(255) NOT NULL DEFAULT '',
  `url` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='后台管理员表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nn_admin_menu`
--

LOCK TABLES `nn_admin_menu` WRITE;
/*!40000 ALTER TABLE `nn_admin_menu` DISABLE KEYS */;
/*!40000 ALTER TABLE `nn_admin_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nn_admin_user`
--

DROP TABLE IF EXISTS `nn_admin_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nn_admin_user` (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `group_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` varchar(60) NOT NULL DEFAULT '',
  `password` varchar(32) NOT NULL DEFAULT '',
  `email` varchar(60) NOT NULL DEFAULT '',
  `encrypt` char(10) NOT NULL,
  `last_login_time` int(10) unsigned NOT NULL DEFAULT '0',
  `last_login_ip` char(15) NOT NULL DEFAULT '0',
  `login_num` int(10) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `sort` int(8) unsigned NOT NULL DEFAULT '100',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='后台管理员表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nn_admin_user`
--

LOCK TABLES `nn_admin_user` WRITE;
/*!40000 ALTER TABLE `nn_admin_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `nn_admin_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nn_adv`
--

DROP TABLE IF EXISTS `nn_adv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nn_adv` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `position_id` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `link` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `starttime` int(10) unsigned NOT NULL DEFAULT '0',
  `endtime` int(10) unsigned NOT NULL DEFAULT '0',
  `loading` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `hist` int(11) unsigned NOT NULL DEFAULT '0',
  `content` text NOT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `sort` int(8) unsigned NOT NULL DEFAULT '100',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='广告管理';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nn_adv`
--

LOCK TABLES `nn_adv` WRITE;
/*!40000 ALTER TABLE `nn_adv` DISABLE KEYS */;
/*!40000 ALTER TABLE `nn_adv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nn_adv_position`
--

DROP TABLE IF EXISTS `nn_adv_position`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nn_adv_position` (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `width` int(10) unsigned NOT NULL DEFAULT '0',
  `height` int(10) unsigned NOT NULL DEFAULT '0',
  `type` tinyint(1) NOT NULL DEFAULT '0',
  `defaultpic` varchar(255) NOT NULL DEFAULT '',
  `defaulttext` varchar(255) NOT NULL DEFAULT '',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `sort` int(8) unsigned NOT NULL DEFAULT '100',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='广告位管理';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nn_adv_position`
--

LOCK TABLES `nn_adv_position` WRITE;
/*!40000 ALTER TABLE `nn_adv_position` DISABLE KEYS */;
/*!40000 ALTER TABLE `nn_adv_position` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nn_article`
--

DROP TABLE IF EXISTS `nn_article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nn_article` (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT COMMENT '文章id',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '文章标题',
  `content` text NOT NULL COMMENT '文章内容',
  `category_id` int(8) unsigned NOT NULL DEFAULT '0' COMMENT '分类id',
  `thumb` varchar(255) NOT NULL DEFAULT '' COMMENT '文章图片',
  `display` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否显示',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '外链',
  `dataline` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '发布时间',
  `sort` int(8) unsigned NOT NULL DEFAULT '100' COMMENT '排序',
  `keywords` varchar(255) NOT NULL COMMENT '关键字',
  `hits` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '阅读量',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='文章表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nn_article`
--

LOCK TABLES `nn_article` WRITE;
/*!40000 ALTER TABLE `nn_article` DISABLE KEYS */;
/*!40000 ALTER TABLE `nn_article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nn_article_category`
--

DROP TABLE IF EXISTS `nn_article_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nn_article_category` (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '分类名称',
  `parent_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '父分类',
  `display` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否显示',
  `sort` int(8) unsigned NOT NULL DEFAULT '100' COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='文章分类表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nn_article_category`
--

LOCK TABLES `nn_article_category` WRITE;
/*!40000 ALTER TABLE `nn_article_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `nn_article_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nn_attachment`
--

DROP TABLE IF EXISTS `nn_attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nn_attachment` (
  `aid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `module` char(15) NOT NULL,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `filename` char(50) NOT NULL,
  `filepath` char(200) NOT NULL,
  `filesize` int(10) unsigned NOT NULL DEFAULT '0',
  `fileext` char(10) NOT NULL,
  `isimage` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `downloads` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `datetime` int(10) unsigned NOT NULL DEFAULT '0',
  `clientip` char(15) NOT NULL,
  `use_nums` smallint(3) unsigned NOT NULL DEFAULT '0' COMMENT '使用次数',
  `authcode` char(32) NOT NULL,
  `filetype` varchar(100) NOT NULL DEFAULT '',
  `md5` char(32) NOT NULL DEFAULT '',
  `sha1` varchar(100) NOT NULL DEFAULT '',
  `width` smallint(6) unsigned NOT NULL DEFAULT '0',
  `height` smallint(6) unsigned NOT NULL DEFAULT '0',
  `name` varchar(200) NOT NULL DEFAULT '',
  `issystem` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否后台上传',
  `url` varchar(200) NOT NULL DEFAULT '',
  PRIMARY KEY (`aid`),
  KEY `authcode` (`authcode`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='附件表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nn_attachment`
--

LOCK TABLES `nn_attachment` WRITE;
/*!40000 ALTER TABLE `nn_attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `nn_attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nn_attribute`
--

DROP TABLE IF EXISTS `nn_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nn_attribute` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '属性ID',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '名称',
  `value` text NOT NULL COMMENT '属性值(逗号分隔)',
  `search` smallint(2) unsigned NOT NULL DEFAULT '1' COMMENT '是否参与筛选',
  `type` varchar(50) NOT NULL DEFAULT '' COMMENT '输入控件的类型,radio:单选,checkbox:复选,input:输入',
  `sort` int(8) unsigned NOT NULL DEFAULT '100' COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='属性';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nn_attribute`
--

LOCK TABLES `nn_attribute` WRITE;
/*!40000 ALTER TABLE `nn_attribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `nn_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nn_brand`
--

DROP TABLE IF EXISTS `nn_brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nn_brand` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '品牌id',
  `name` varchar(60) NOT NULL DEFAULT '' COMMENT '品牌名称',
  `logo` varchar(200) NOT NULL DEFAULT '' COMMENT '品牌logo图片',
  `descript` text NOT NULL COMMENT '品牌描述',
  `url` varchar(200) NOT NULL DEFAULT '' COMMENT '品牌的地址',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态(是否显示，显示:1,隐藏:0)',
  `isrecommend` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否推荐',
  `sort` int(8) unsigned NOT NULL DEFAULT '100' COMMENT '排序',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='商品品牌';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nn_brand`
--

LOCK TABLES `nn_brand` WRITE;
/*!40000 ALTER TABLE `nn_brand` DISABLE KEYS */;
/*!40000 ALTER TABLE `nn_brand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nn_cart`
--

DROP TABLE IF EXISTS `nn_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nn_cart` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `buyer_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  `sku_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '子商品ID',
  `nums` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '购买数量',
  `system_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '系统时间',
  `clientip` char(15) NOT NULL DEFAULT '' COMMENT '操作IP地址',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='购物车';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nn_cart`
--

LOCK TABLES `nn_cart` WRITE;
/*!40000 ALTER TABLE `nn_cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `nn_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nn_comment`
--

DROP TABLE IF EXISTS `nn_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nn_comment` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `sku_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '商品sku_id',
  `spu_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '商品spu_id',
  `order_sn` varchar(20) NOT NULL DEFAULT '' COMMENT '订单号',
  `content` text NOT NULL,
  `mid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '所属会员',
  `datetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '时间戳',
  `clientip` char(15) NOT NULL DEFAULT '',
  `mood` enum('positive','neutral','negative') NOT NULL,
  `reply_content` text NOT NULL,
  `reply_time` int(10) unsigned NOT NULL,
  `imgs` text NOT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '审核结果',
  `is_shield` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `username` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='商品评价表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nn_comment`
--

LOCK TABLES `nn_comment` WRITE;
/*!40000 ALTER TABLE `nn_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `nn_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nn_delivery`
--

DROP TABLE IF EXISTS `nn_delivery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nn_delivery` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '名称',
  `identif` varchar(50) NOT NULL DEFAULT '' COMMENT '标识',
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '开关(1:开启,0:关闭)',
  `logo` varchar(200) NOT NULL DEFAULT '' COMMENT 'LOGO',
  `insure` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '保价',
  `tpl` text COMMENT '快递单模版内容',
  `sort` tinyint(3) unsigned NOT NULL DEFAULT '100' COMMENT '排序',
  `systime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '操作时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='物流配送表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nn_delivery`
--

LOCK TABLES `nn_delivery` WRITE;
/*!40000 ALTER TABLE `nn_delivery` DISABLE KEYS */;
/*!40000 ALTER TABLE `nn_delivery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nn_delivery_district`
--

DROP TABLE IF EXISTS `nn_delivery_district`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nn_delivery_district` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `delivery_id` int(8) unsigned NOT NULL DEFAULT '0',
  `price` decimal(15,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '配送金额',
  `district_id` text NOT NULL COMMENT '地区ID',
  `sort` int(8) unsigned NOT NULL DEFAULT '100' COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='物流地区设置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nn_delivery_district`
--

LOCK TABLES `nn_delivery_district` WRITE;
/*!40000 ALTER TABLE `nn_delivery_district` DISABLE KEYS */;
/*!40000 ALTER TABLE `nn_delivery_district` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nn_district`
--

DROP TABLE IF EXISTS `nn_district`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nn_district` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `parent_id` int(10) NOT NULL COMMENT '父栏目',
  `name` varchar(50) NOT NULL DEFAULT '',
  `zipcode` int(10) NOT NULL DEFAULT '0',
  `pinyin` varchar(100) NOT NULL DEFAULT '',
  `lng` varchar(20) NOT NULL DEFAULT '',
  `lat` varchar(20) NOT NULL DEFAULT '',
  `level` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `sort` tinyint(3) unsigned NOT NULL DEFAULT '50' COMMENT '排序',
  `location` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=659004503 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nn_district`
--

LOCK TABLES `nn_district` WRITE;
/*!40000 ALTER TABLE `nn_district` DISABLE KEYS */;
/*!40000 ALTER TABLE `nn_district` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nn_focus`
--

DROP TABLE IF EXISTS `nn_focus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nn_focus` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '名称',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '链接',
  `thumb` varchar(255) NOT NULL DEFAULT '' COMMENT '图片',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `width` int(4) unsigned NOT NULL DEFAULT '100' COMMENT '宽',
  `height` int(4) unsigned NOT NULL DEFAULT '100' COMMENT '高',
  `target` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否新窗口打开',
  `display` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否显示',
  `sort` int(8) unsigned NOT NULL DEFAULT '100' COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='焦点图';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nn_focus`
--

LOCK TABLES `nn_focus` WRITE;
/*!40000 ALTER TABLE `nn_focus` DISABLE KEYS */;
/*!40000 ALTER TABLE `nn_focus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nn_friendlink`
--

DROP TABLE IF EXISTS `nn_friendlink`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nn_friendlink` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '友链名称',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '链接',
  `logo` varchar(255) NOT NULL DEFAULT '' COMMENT '图片',
  `target` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否新窗口打开',
  `display` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否显示',
  `sort` int(8) unsigned NOT NULL DEFAULT '100' COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='友情链接';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nn_friendlink`
--

LOCK TABLES `nn_friendlink` WRITE;
/*!40000 ALTER TABLE `nn_friendlink` DISABLE KEYS */;
/*!40000 ALTER TABLE `nn_friendlink` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nn_goods_attribute`
--

DROP TABLE IF EXISTS `nn_goods_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nn_goods_attribute` (
  `sku_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '商品id',
  `attribute_id` int(10) unsigned NOT NULL COMMENT '属性id',
  `attribute_value` varchar(255) NOT NULL COMMENT '属性值',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '商品属性种类：1为规格，2为属性',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态(是否显示，显示:1,隐藏:0)',
  `sort` int(8) unsigned NOT NULL DEFAULT '100' COMMENT '排序'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='商品属性';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nn_goods_attribute`
--

LOCK TABLES `nn_goods_attribute` WRITE;
/*!40000 ALTER TABLE `nn_goods_attribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `nn_goods_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nn_goods_category`
--

DROP TABLE IF EXISTS `nn_goods_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nn_goods_category` (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '分类名称',
  `parent_id` mediumint(8) NOT NULL DEFAULT '0' COMMENT '父级分类id',
  `type_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '商品模型id',
  `keywords` varchar(200) NOT NULL,
  `descript` varchar(200) NOT NULL,
  `show_in_nav` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否在导航中显示,状态:0:关闭，1:开启',
  `grade` text NOT NULL COMMENT '价格分级',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态:0:关闭，1:开启',
  `sort` int(8) NOT NULL DEFAULT '100' COMMENT '排序',
  `img` varchar(200) NOT NULL DEFAULT '' COMMENT '分类前面的小图标',
  `url` varchar(200) NOT NULL DEFAULT '' COMMENT '外部链接',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='商品分类';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nn_goods_category`
--

LOCK TABLES `nn_goods_category` WRITE;
/*!40000 ALTER TABLE `nn_goods_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `nn_goods_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nn_goods_consult`
--

DROP TABLE IF EXISTS `nn_goods_consult`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nn_goods_consult` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '商品咨询id',
  `spu_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '商品spu_id',
  `sku_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '子商品id',
  `question` text NOT NULL COMMENT '咨询内容',
  `mid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '咨询人会员ID，非会员为空',
  `username` varchar(60) NOT NULL DEFAULT '' COMMENT '用户名',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '咨询时间',
  `reply_content` text NOT NULL COMMENT '咨询回复',
  `reply_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '回复时间',
  `clientip` char(15) NOT NULL DEFAULT '' COMMENT '评论时的用户IP',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '评论状态：0：未审核 1: 已审核',
  `sort` mediumint(8) unsigned NOT NULL DEFAULT '100' COMMENT '排序',
  `see` int(1) NOT NULL DEFAULT '0' COMMENT '是否查看',
  PRIMARY KEY (`id`),
  KEY `spu_id` (`spu_id`) USING BTREE,
  KEY `spu_id, status` (`spu_id`,`status`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='商品咨询表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nn_goods_consult`
--

LOCK TABLES `nn_goods_consult` WRITE;
/*!40000 ALTER TABLE `nn_goods_consult` DISABLE KEYS */;
/*!40000 ALTER TABLE `nn_goods_consult` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nn_goods_index`
--

DROP TABLE IF EXISTS `nn_goods_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nn_goods_index` (
  `sku_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `spu_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `catid` mediumint(8) unsigned NOT NULL,
  `brand_id` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '品牌ID',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '商品状态',
  `sales` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '销量',
  `hits` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '人气',
  `show_in_lists` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否在列表中显示',
  `status_ext` tinyint(1) NOT NULL,
  `shop_price` decimal(10,2) NOT NULL,
  `favorites` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '收藏',
  `attr_ids` text NOT NULL,
  `spec_ids` text NOT NULL,
  `sort` int(8) unsigned NOT NULL DEFAULT '100' COMMENT '排序',
  PRIMARY KEY (`sku_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nn_goods_index`
--

LOCK TABLES `nn_goods_index` WRITE;
/*!40000 ALTER TABLE `nn_goods_index` DISABLE KEYS */;
/*!40000 ALTER TABLE `nn_goods_index` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nn_goods_sku`
--

DROP TABLE IF EXISTS `nn_goods_sku`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nn_goods_sku` (
  `sku_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '子商品id',
  `spu_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '商品id,取值goods的goods_id',
  `sku_name` varchar(200) NOT NULL DEFAULT '' COMMENT '子商品名称',
  `subtitle` varchar(200) NOT NULL DEFAULT '' COMMENT '副标题',
  `style` varchar(50) NOT NULL,
  `sn` varchar(200) NOT NULL DEFAULT '' COMMENT '商品货号',
  `barcode` varchar(60) NOT NULL DEFAULT '' COMMENT '商品条形码',
  `spec` text NOT NULL COMMENT '商品所属规格类型id，取值spec的id',
  `imgs` text NOT NULL COMMENT '商品图册',
  `thumb` varchar(200) NOT NULL DEFAULT '' COMMENT '缩略图',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `status_ext` tinyint(1) NOT NULL COMMENT '商品标签状态',
  `number` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '商品库存数量',
  `market_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '市场售价',
  `sort` int(8) unsigned NOT NULL DEFAULT '100' COMMENT '排序',
  `shop_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '销售售价',
  `keyword` text NOT NULL,
  `description` text NOT NULL,
  `content` text NOT NULL,
  `show_in_lists` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否在列表显示',
  `warn_number` tinyint(3) NOT NULL DEFAULT '5',
  `prom_type` varchar(200) NOT NULL DEFAULT '' COMMENT '促销类型',
  `prom_id` mediumint(8) NOT NULL DEFAULT '0' COMMENT '促销类型ID',
  `up_time` int(10) NOT NULL DEFAULT '0' COMMENT '上架时间',
  PRIMARY KEY (`sku_id`),
  UNIQUE KEY `sn` (`sn`) USING BTREE,
  KEY `goods_id` (`spu_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='子商品表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nn_goods_sku`
--

LOCK TABLES `nn_goods_sku` WRITE;
/*!40000 ALTER TABLE `nn_goods_sku` DISABLE KEYS */;
/*!40000 ALTER TABLE `nn_goods_sku` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nn_goods_spu`
--

DROP TABLE IF EXISTS `nn_goods_spu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nn_goods_spu` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '商品id',
  `name` varchar(200) NOT NULL DEFAULT '' COMMENT '商品名称,商品标题',
  `sn` varchar(200) NOT NULL DEFAULT '' COMMENT '商品货号',
  `subtitle` varchar(200) NOT NULL DEFAULT '' COMMENT '副标题，广告语',
  `style` varchar(50) NOT NULL COMMENT '商品标题的html样式',
  `catid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '分类id',
  `brand_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '商品品牌id',
  `keyword` varchar(200) NOT NULL COMMENT '商品关键词，利于搜索引擎优化',
  `description` varchar(200) NOT NULL COMMENT '商品描述，利于搜索引擎优化',
  `content` text NOT NULL COMMENT '商品的详细描述',
  `imgs` text NOT NULL COMMENT '商品图册',
  `thumb` varchar(200) NOT NULL DEFAULT '' COMMENT '缩略图',
  `min_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '最小价格',
  `max_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '最大价格',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态(是否上架，删除:-1,上架:1,下架:0)',
  `specs` text NOT NULL COMMENT '规格数据 json',
  `sku_total` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '商品总数',
  `give_point` int(11) NOT NULL DEFAULT '-1' COMMENT '积分',
  `warn_number` tinyint(3) NOT NULL DEFAULT '2' COMMENT '库存警告数量',
  `sort` int(8) unsigned NOT NULL DEFAULT '100' COMMENT '排序',
  `spec_id` int(10) NOT NULL DEFAULT '0' COMMENT '上传图片时与规格关联的id',
  PRIMARY KEY (`id`),
  KEY `brand_id` (`brand_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='商品表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nn_goods_spu`
--

LOCK TABLES `nn_goods_spu` WRITE;
/*!40000 ALTER TABLE `nn_goods_spu` DISABLE KEYS */;
/*!40000 ALTER TABLE `nn_goods_spu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nn_guestbook`
--

DROP TABLE IF EXISTS `nn_guestbook`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nn_guestbook` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT NULL,
  `contents` varchar(200) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nn_guestbook`
--

LOCK TABLES `nn_guestbook` WRITE;
/*!40000 ALTER TABLE `nn_guestbook` DISABLE KEYS */;
/*!40000 ALTER TABLE `nn_guestbook` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nn_help`
--

DROP TABLE IF EXISTS `nn_help`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nn_help` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `parent_id` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '父id',
  `url` varchar(50) NOT NULL DEFAULT '' COMMENT '超链接',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '标题',
  `content` text NOT NULL COMMENT '内容',
  `display` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否显示',
  `sort` int(8) unsigned NOT NULL DEFAULT '100' COMMENT '排序',
  `keywords` varchar(50) NOT NULL DEFAULT '' COMMENT '帮助关键字',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='站点帮助';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nn_help`
--

LOCK TABLES `nn_help` WRITE;
/*!40000 ALTER TABLE `nn_help` DISABLE KEYS */;
/*!40000 ALTER TABLE `nn_help` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nn_log`
--

DROP TABLE IF EXISTS `nn_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nn_log` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '执行用户id',
  `action_ip` char(15) NOT NULL DEFAULT '0' COMMENT '执行行为者ip',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '日志备注',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '执行行为的时间',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '操作URL',
  PRIMARY KEY (`id`),
  KEY `action_ip_ix` (`action_ip`) USING BTREE,
  KEY `user_id_ix` (`user_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='行为日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nn_log`
--

LOCK TABLES `nn_log` WRITE;
/*!40000 ALTER TABLE `nn_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `nn_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nn_member`
--

DROP TABLE IF EXISTS `nn_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nn_member` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `username` varchar(20) NOT NULL DEFAULT '' COMMENT '用户名',
  `password` char(32) NOT NULL DEFAULT '' COMMENT '登录密码',
  `group_id` smallint(3) unsigned NOT NULL DEFAULT '0' COMMENT '会员等级',
  `encrypt` char(6) NOT NULL,
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT '电子邮件',
  `integral` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '可用积分',
  `money` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '可用余额',
  `mobile` char(11) NOT NULL DEFAULT '' COMMENT '手机号码',
  `register_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `register_ip` char(15) NOT NULL DEFAULT '' COMMENT '注册IP',
  `login_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '登录时间',
  `login_ip` char(15) NOT NULL DEFAULT '' COMMENT '登录IP',
  `login_num` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '登录次数',
  `islock` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否锁定',
  `frozen_money` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '冻结资金',
  `exp` int(8) unsigned NOT NULL DEFAULT '0' COMMENT '经验值',
  `emailstatus` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '邮箱认证状态',
  `mobilestatus` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '手机认证状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nn_member`
--

LOCK TABLES `nn_member` WRITE;
/*!40000 ALTER TABLE `nn_member` DISABLE KEYS */;
/*!40000 ALTER TABLE `nn_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nn_member_address`
--

DROP TABLE IF EXISTS `nn_member_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nn_member_address` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `mid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '所属会员',
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '收货人',
  `mobile` char(11) NOT NULL DEFAULT '' COMMENT '联系电话',
  `district_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '区划ID',
  `address` varchar(255) NOT NULL DEFAULT '' COMMENT '详细地址',
  `zipcode` char(6) NOT NULL DEFAULT '' COMMENT '邮编',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态',
  `isdefault` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否默认',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户收货地址';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nn_member_address`
--

LOCK TABLES `nn_member_address` WRITE;
/*!40000 ALTER TABLE `nn_member_address` DISABLE KEYS */;
/*!40000 ALTER TABLE `nn_member_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nn_member_deposit`
--

DROP TABLE IF EXISTS `nn_member_deposit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nn_member_deposit` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `mid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  `money` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '充值金额',
  `order_sn` char(32) NOT NULL DEFAULT '' COMMENT '订单号',
  `order_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '订单生成时间',
  `pay_code` varchar(50) NOT NULL DEFAULT '' COMMENT '支付方式',
  `trade_sn` varchar(50) NOT NULL DEFAULT '' COMMENT '第三方交易号',
  `trade_status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '交易状态（第三方）',
  `trade_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '交易时间',
  `order_status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '订单状态（是否已入账）',
  PRIMARY KEY (`id`),
  KEY `mid` (`mid`) USING BTREE,
  KEY `order_sn` (`order_sn`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='会员充值记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nn_member_deposit`
--

LOCK TABLES `nn_member_deposit` WRITE;
/*!40000 ALTER TABLE `nn_member_deposit` DISABLE KEYS */;
/*!40000 ALTER TABLE `nn_member_deposit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nn_member_favorite`
--

DROP TABLE IF EXISTS `nn_member_favorite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nn_member_favorite` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `mid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '所属会员',
  `sku_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'SKU编号',
  `sku_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `datetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '收藏时间',
  `clientip` char(15) NOT NULL DEFAULT '' COMMENT 'IP',
  PRIMARY KEY (`id`),
  KEY `mid` (`mid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nn_member_favorite`
--

LOCK TABLES `nn_member_favorite` WRITE;
/*!40000 ALTER TABLE `nn_member_favorite` DISABLE KEYS */;
/*!40000 ALTER TABLE `nn_member_favorite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nn_member_group`
--

DROP TABLE IF EXISTS `nn_member_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nn_member_group` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '',
  `min_points` int(10) unsigned NOT NULL DEFAULT '0',
  `max_points` int(10) unsigned NOT NULL DEFAULT '0',
  `discount` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `sort` int(8) unsigned NOT NULL DEFAULT '100',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '等级描述',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='会员等级组';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nn_member_group`
--

LOCK TABLES `nn_member_group` WRITE;
/*!40000 ALTER TABLE `nn_member_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `nn_member_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nn_member_log`
--

DROP TABLE IF EXISTS `nn_member_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nn_member_log` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `mid` mediumint(8) unsigned NOT NULL,
  `value` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '变动金额',
  `msg` text NOT NULL,
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `type` varchar(20) NOT NULL DEFAULT '',
  `admin_id` int(10) unsigned DEFAULT '0',
  `money_detail` tinytext NOT NULL COMMENT '余额明细',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='财务变动记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nn_member_log`
--

LOCK TABLES `nn_member_log` WRITE;
/*!40000 ALTER TABLE `nn_member_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `nn_member_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nn_member_message`
--

DROP TABLE IF EXISTS `nn_member_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nn_member_message` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `mid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `title` varchar(250) NOT NULL,
  `message` text NOT NULL,
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '(0：未阅；1：已阅)',
  `delstatus` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='站内信';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nn_member_message`
--

LOCK TABLES `nn_member_message` WRITE;
/*!40000 ALTER TABLE `nn_member_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `nn_member_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nn_module`
--

DROP TABLE IF EXISTS `nn_module`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nn_module` (
  `identifier` varchar(100) NOT NULL DEFAULT '',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '名称',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '简介',
  `version` char(50) NOT NULL DEFAULT '' COMMENT '版本',
  `author` varchar(100) NOT NULL DEFAULT '' COMMENT '模块作者',
  `url` varchar(255) NOT NULL,
  `setting` text NOT NULL COMMENT '模块配置',
  `install_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '安装时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `issystem` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '系统模块',
  `isenabled` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '启用状态',
  PRIMARY KEY (`identifier`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='模块表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nn_module`
--

LOCK TABLES `nn_module` WRITE;
/*!40000 ALTER TABLE `nn_module` DISABLE KEYS */;
/*!40000 ALTER TABLE `nn_module` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nn_navigation`
--

DROP TABLE IF EXISTS `nn_navigation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nn_navigation` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '导航名称',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `display` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否启用',
  `sort` int(8) unsigned NOT NULL DEFAULT '100' COMMENT '排序',
  `target` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否新窗口打开',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='导航设置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nn_navigation`
--

LOCK TABLES `nn_navigation` WRITE;
/*!40000 ALTER TABLE `nn_navigation` DISABLE KEYS */;
/*!40000 ALTER TABLE `nn_navigation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nn_node`
--

DROP TABLE IF EXISTS `nn_node`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nn_node` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '上级菜单ID',
  `name` char(40) NOT NULL DEFAULT '' COMMENT '菜单名称',
  `m` char(20) NOT NULL DEFAULT '' COMMENT '模块',
  `c` char(20) NOT NULL DEFAULT '' COMMENT '控制器',
  `a` char(20) NOT NULL DEFAULT '' COMMENT '操作',
  `param` char(100) NOT NULL DEFAULT '' COMMENT '参数',
  `sort` int(8) unsigned NOT NULL DEFAULT '100',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '是否显示',
  `url` char(255) NOT NULL DEFAULT '',
  `pluginid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `split` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '分割线',
  PRIMARY KEY (`id`),
  KEY `listorder` (`sort`) USING BTREE,
  KEY `parentid` (`parent_id`) USING BTREE,
  KEY `module` (`c`,`m`,`a`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=57 DEFAULT CHARSET=utf8 COMMENT='菜单&权限节点表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nn_node`
--

LOCK TABLES `nn_node` WRITE;
/*!40000 ALTER TABLE `nn_node` DISABLE KEYS */;
/*!40000 ALTER TABLE `nn_node` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nn_notify`
--

DROP TABLE IF EXISTS `nn_notify`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nn_notify` (
  `code` varchar(50) NOT NULL DEFAULT '',
  `name` varchar(250) NOT NULL DEFAULT '',
  `description` varchar(250) NOT NULL DEFAULT '',
  `enabled` varchar(250) NOT NULL DEFAULT '1' COMMENT '启用状态',
  `config` text NOT NULL,
  `dateline` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `sort` int(8) unsigned NOT NULL DEFAULT '100',
  `ignore` text NOT NULL,
  PRIMARY KEY (`code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='通知系统配置信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nn_notify`
--

LOCK TABLES `nn_notify` WRITE;
/*!40000 ALTER TABLE `nn_notify` DISABLE KEYS */;
/*!40000 ALTER TABLE `nn_notify` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nn_notify_template`
--

DROP TABLE IF EXISTS `nn_notify_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nn_notify_template` (
  `id` varchar(100) NOT NULL DEFAULT '' COMMENT '嵌入点名称',
  `enabled` text NOT NULL COMMENT '开启的通知方式',
  `template` text NOT NULL COMMENT '通知模板',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '模版注释',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='通知模版设置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nn_notify_template`
--

LOCK TABLES `nn_notify_template` WRITE;
/*!40000 ALTER TABLE `nn_notify_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `nn_notify_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nn_order`
--

DROP TABLE IF EXISTS `nn_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nn_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `sn` char(20) NOT NULL DEFAULT '' COMMENT '订单号',
  `buyer_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '买家id',
  `seller_ids` varchar(200) NOT NULL DEFAULT '0' COMMENT '卖家ids',
  `source` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '订单来源(1：标准，2：wap，3：wechat)',
  `pay_type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '支付类型(1：在线支付，2：货到付款)',
  `sku_amount` decimal(15,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '商品总额',
  `delivery_amount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '物流总额',
  `real_amount` decimal(15,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '应付总额',
  `paid_amount` decimal(15,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '实付总额',
  `balance_amount` decimal(15,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '余额付款总额',
  `pay_method` varchar(200) NOT NULL DEFAULT '' COMMENT '支付方式',
  `pay_sn` varchar(50) NOT NULL DEFAULT '' COMMENT '第三方支付号',
  `address_name` varchar(100) NOT NULL DEFAULT '' COMMENT '收货人姓名',
  `address_mobile` varchar(100) NOT NULL DEFAULT '' COMMENT '收货人电话',
  `address_detail` varchar(100) NOT NULL DEFAULT '' COMMENT '收货详细地址',
  `address_district_ids` varchar(100) NOT NULL DEFAULT '' COMMENT '收货地区ids(统计索引)',
  `invoice_tax` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '发票税率',
  `invoice_title` varchar(200) NOT NULL DEFAULT '' COMMENT '发票抬头',
  `invoice_content` varchar(200) NOT NULL DEFAULT '' COMMENT '发票内容',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '订单状态(1：正常，2：全部取消，3：全部回收，4：全部删除)',
  `pay_status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否支付(布尔值)',
  `confirm_status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '确认状态(0：待确认，1：部分确认，2：已确认)',
  `delivery_status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '发货状态(0：待发货，1：部分发货，2：已发货)',
  `finish_status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '完成状态(0：待完成，1：部分完成，2：已完成)',
  `pay_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '支付时间',
  `system_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '系统时间',
  `promot_amount` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '所有优惠总额',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='订单主表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nn_order`
--

LOCK TABLES `nn_order` WRITE;
/*!40000 ALTER TABLE `nn_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `nn_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nn_order_copy`
--

DROP TABLE IF EXISTS `nn_order_copy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nn_order_copy` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `sn` char(20) NOT NULL DEFAULT '' COMMENT '订单号',
  `member_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  `source` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '订单来源(标准订单:0,手机订单:1,微信订单2)',
  `delivery_method` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '配送方式(在线支付:0,货到付款:1)',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '订单状态(1：正常，2：已取消，3：已回收，4：前台已删除)',
  `pay_status` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '支付状态',
  `confirm_status` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '确认状态',
  `delivery_status` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '发货状态',
  `completion_status` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '完成状态',
  `return_status` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '退货状态',
  `refund_status` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '退款状态',
  `payable_amount` decimal(15,2) NOT NULL DEFAULT '0.00' COMMENT '商品总额',
  `real_amount` decimal(15,2) NOT NULL DEFAULT '0.00' COMMENT '应付总额',
  `balance_amount` decimal(15,2) NOT NULL DEFAULT '0.00' COMMENT '余额付款总额',
  `payable_freight` decimal(15,2) NOT NULL DEFAULT '0.00' COMMENT '配送总额',
  `discount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '折扣',
  `coupons` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '优惠券抵扣',
  `coupons_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '优惠券ID',
  `integral` decimal(15,2) NOT NULL DEFAULT '0.00' COMMENT '使用积分抵扣',
  `pay_method` varchar(20) NOT NULL DEFAULT '' COMMENT '支付方式(如：支付宝、网银、微信等)',
  `pay_sn` varchar(100) NOT NULL DEFAULT '' COMMENT '支付流水号',
  `remark` varchar(200) NOT NULL DEFAULT '' COMMENT '订单备注',
  `invoice_taxes` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '发票税额',
  `invoice_title` varchar(100) NOT NULL DEFAULT '' COMMENT '发票抬头信息',
  `invoice_content` varchar(100) NOT NULL DEFAULT '' COMMENT '发票内容',
  `delivery_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '物流ID',
  `delivery_name` varchar(100) NOT NULL DEFAULT '' COMMENT '物流名称',
  `delivery_sn` varchar(100) NOT NULL DEFAULT '' COMMENT '运单号',
  `delivery_address_name` varchar(100) NOT NULL DEFAULT '' COMMENT '收货人名称',
  `delivery_address_mobile` varchar(20) NOT NULL DEFAULT '' COMMENT '收货人手机号',
  `delivery_address_postalcode` char(6) NOT NULL DEFAULT '' COMMENT '收货人邮编',
  `delivery_address_district` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '收货人地区id',
  `delivery_address_address` varchar(200) NOT NULL DEFAULT '' COMMENT '收货人详细地址',
  `comment_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '评论ID',
  `return_amount` decimal(15,0) NOT NULL DEFAULT '0' COMMENT '退款总额',
  `return_remarks` text NOT NULL COMMENT '退款备注',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `order_sn` (`sn`),
  KEY `member_id` (`member_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='订单主表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nn_order_copy`
--

LOCK TABLES `nn_order_copy` WRITE;
/*!40000 ALTER TABLE `nn_order_copy` DISABLE KEYS */;
/*!40000 ALTER TABLE `nn_order_copy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nn_order_delivery`
--

DROP TABLE IF EXISTS `nn_order_delivery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nn_order_delivery` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `o_sku_ids` varchar(200) NOT NULL DEFAULT '0' COMMENT '订单商品列表(多个用","逗号分割)',
  `sub_sn` char(20) NOT NULL COMMENT '订单号',
  `delivery_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '物流id',
  `delivery_name` varchar(20) NOT NULL DEFAULT '' COMMENT '所属物流',
  `delivery_sn` varchar(50) NOT NULL COMMENT '运单号',
  `delivery_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '发货时间',
  `isreceive` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否确认收货(布尔值)',
  `receive_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '确认收货时间',
  `print_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '打印时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='订单物流表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nn_order_delivery`
--

LOCK TABLES `nn_order_delivery` WRITE;
/*!40000 ALTER TABLE `nn_order_delivery` DISABLE KEYS */;
/*!40000 ALTER TABLE `nn_order_delivery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nn_order_goods`
--

DROP TABLE IF EXISTS `nn_order_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nn_order_goods` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `order_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '订单ID',
  `order_sn` char(20) NOT NULL DEFAULT '' COMMENT '订单号',
  `member_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  `sku_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '产品ID',
  `sku_thumb` varchar(200) NOT NULL DEFAULT '' COMMENT '产品缩略图',
  `sku_barcode` varchar(30) NOT NULL DEFAULT '' COMMENT '产品的唯一条码(写入相对应商品条码)',
  `sku_name` varchar(200) NOT NULL DEFAULT '' COMMENT '产品名称',
  `sku_spec` text NOT NULL COMMENT '产品规格',
  `sku_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '销售售价',
  `real_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '实付金额',
  `buy_nums` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '商品购买数量',
  `give_coupons_id` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '赠送优惠券',
  `return_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '退货id',
  `refund_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '退款ID',
  `iscomment` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否评论',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '系统时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`) USING BTREE,
  KEY `order_sn` (`order_sn`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='订单商品表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nn_order_goods`
--

LOCK TABLES `nn_order_goods` WRITE;
/*!40000 ALTER TABLE `nn_order_goods` DISABLE KEYS */;
/*!40000 ALTER TABLE `nn_order_goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nn_order_log`
--

DROP TABLE IF EXISTS `nn_order_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nn_order_log` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `order_sn` char(20) NOT NULL DEFAULT '' COMMENT '主订单号',
  `sub_sn` char(20) NOT NULL DEFAULT '' COMMENT '子订单号',
  `action` varchar(50) NOT NULL DEFAULT '' COMMENT '操作类型',
  `operator_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '操作者ID',
  `operator_name` varchar(60) NOT NULL DEFAULT '' COMMENT '操作者名称',
  `operator_type` tinyint(1) unsigned NOT NULL DEFAULT '2' COMMENT '操作者类型(1:后台管理员,2:会员3:商家(预留))',
  `msg` text NOT NULL COMMENT '日志详情',
  `system_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '操作时间',
  `clientip` char(15) NOT NULL DEFAULT '' COMMENT '操作IP地址',
  PRIMARY KEY (`id`),
  KEY `order_sn` (`order_sn`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='订单日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nn_order_log`
--

LOCK TABLES `nn_order_log` WRITE;
/*!40000 ALTER TABLE `nn_order_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `nn_order_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nn_order_parcel`
--

DROP TABLE IF EXISTS `nn_order_parcel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nn_order_parcel` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `order_sn` varchar(20) NOT NULL DEFAULT '' COMMENT '主订单号',
  `sub_sn` char(20) NOT NULL DEFAULT '' COMMENT '子订单号',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态（-1：配送失败，0：待配货；1：配送中，2：配送完成）',
  `member_name` varchar(100) NOT NULL DEFAULT '' COMMENT '会员账号',
  `address_name` varchar(100) NOT NULL DEFAULT '' COMMENT '收货人姓名',
  `address_mobile` varchar(20) NOT NULL DEFAULT '' COMMENT '收货人手机',
  `address_detail` varchar(200) NOT NULL DEFAULT '' COMMENT '收货人详细地址',
  `delivery_name` varchar(100) NOT NULL DEFAULT '' COMMENT '物流名称',
  `system_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '系统时间',
  PRIMARY KEY (`id`),
  KEY `order_sn` (`order_sn`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='发货单管理';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nn_order_parcel`
--

LOCK TABLES `nn_order_parcel` WRITE;
/*!40000 ALTER TABLE `nn_order_parcel` DISABLE KEYS */;
/*!40000 ALTER TABLE `nn_order_parcel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nn_order_parcel_log`
--

DROP TABLE IF EXISTS `nn_order_parcel_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nn_order_parcel_log` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `parcel_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '关联发货表id',
  `order_sn` varchar(20) NOT NULL DEFAULT '' COMMENT '订单号',
  `sub_sn` varchar(20) NOT NULL DEFAULT '' COMMENT '子订单号',
  `buyer_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  `member_name` varchar(100) NOT NULL DEFAULT '' COMMENT '会员帐号',
  `action` varchar(50) NOT NULL DEFAULT '' COMMENT '操作明细',
  `msg` text NOT NULL COMMENT '操作日志备注',
  `operator_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '操作管理员ID',
  `operator_name` varchar(50) NOT NULL DEFAULT '' COMMENT '管理员名称',
  `system_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '系统时间',
  PRIMARY KEY (`id`),
  KEY `order_sn` (`order_sn`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='订单发货单日志';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nn_order_parcel_log`
--

LOCK TABLES `nn_order_parcel_log` WRITE;
/*!40000 ALTER TABLE `nn_order_parcel_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `nn_order_parcel_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nn_order_refund`
--

DROP TABLE IF EXISTS `nn_order_refund`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nn_order_refund` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `return_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '退货id',
  `order_sn` char(20) NOT NULL DEFAULT '' COMMENT '主订单号',
  `sub_sn` char(20) NOT NULL DEFAULT '' COMMENT '子订单号(空为整个订单)',
  `o_sku_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '订单商品ID(0为整个订单)',
  `buyer_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '退款类型(1：退货并退款，2：仅退款)',
  `amount` decimal(15,2) NOT NULL DEFAULT '0.00' COMMENT '退款金额',
  `cause` varchar(200) NOT NULL DEFAULT '' COMMENT '原因',
  `desc` tinytext NOT NULL COMMENT '退款描述',
  `images` text NOT NULL COMMENT '售后传图',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态(-2：未通过，-1：已取消，0：待审核，1：通过)',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '申请时间',
  `admin_id` decimal(8,0) unsigned NOT NULL DEFAULT '0' COMMENT '审核管理员ID',
  `admin_desc` varchar(200) NOT NULL DEFAULT '' COMMENT '后台审核描述',
  `admin_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '审核时间',
  `system_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '系统时间',
  PRIMARY KEY (`id`),
  KEY `order_sn` (`order_sn`) USING BTREE,
  KEY `order_goods_id` (`o_sku_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='订单退款';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nn_order_refund`
--

LOCK TABLES `nn_order_refund` WRITE;
/*!40000 ALTER TABLE `nn_order_refund` DISABLE KEYS */;
/*!40000 ALTER TABLE `nn_order_refund` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nn_order_refund_log`
--

DROP TABLE IF EXISTS `nn_order_refund_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nn_order_refund_log` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `refund_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '退款id',
  `order_sn` char(20) NOT NULL DEFAULT '',
  `sub_sn` char(20) NOT NULL DEFAULT '' COMMENT '子订单号',
  `o_sku_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '订单商品ID',
  `action` varchar(50) NOT NULL DEFAULT '' COMMENT '操作类型',
  `operator_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '操作者ID',
  `operator_name` varchar(60) NOT NULL DEFAULT '' COMMENT '操作者名称',
  `operator_type` tinyint(1) unsigned NOT NULL DEFAULT '2' COMMENT '操作者类型(1:后台管理员,2:会员3:商家(预留))',
  `msg` text NOT NULL COMMENT '日志详情',
  `system_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '操作时间',
  `clientip` char(15) NOT NULL DEFAULT '' COMMENT '操作IP地址',
  PRIMARY KEY (`id`),
  KEY `order_sn` (`order_sn`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='订单退款日志';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nn_order_refund_log`
--

LOCK TABLES `nn_order_refund_log` WRITE;
/*!40000 ALTER TABLE `nn_order_refund_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `nn_order_refund_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nn_order_return`
--

DROP TABLE IF EXISTS `nn_order_return`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nn_order_return` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `order_sn` char(20) NOT NULL DEFAULT '' COMMENT '主订单号',
  `sub_sn` char(20) NOT NULL DEFAULT '' COMMENT '子订单号',
  `o_sku_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '订单商品ID',
  `buyer_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '买家ID',
  `cause` varchar(200) NOT NULL DEFAULT '' COMMENT '退货原因',
  `number` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '退货数量',
  `amount` decimal(8,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '退款金额',
  `desc` tinytext NOT NULL COMMENT '会员退货描述',
  `images` text NOT NULL COMMENT '会员退货传图',
  `delivery_name` varchar(50) NOT NULL DEFAULT '' COMMENT '快递名称',
  `delivery_sn` varchar(50) NOT NULL DEFAULT '' COMMENT '快递号',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态(-2：未通过，-1：已取消，0：待审核，1：通过，2：已退货)',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '申请时间',
  `admin_id` decimal(8,0) unsigned NOT NULL DEFAULT '0' COMMENT '审核管理员ID',
  `admin_desc` varchar(200) NOT NULL DEFAULT '' COMMENT '后台审核描述',
  `admin_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '审核时间',
  `system_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '系统时间',
  PRIMARY KEY (`id`),
  KEY `order_sn` (`order_sn`) USING BTREE,
  KEY `o_sku_id` (`o_sku_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='订单退货';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nn_order_return`
--

LOCK TABLES `nn_order_return` WRITE;
/*!40000 ALTER TABLE `nn_order_return` DISABLE KEYS */;
/*!40000 ALTER TABLE `nn_order_return` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nn_order_return_log`
--

DROP TABLE IF EXISTS `nn_order_return_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nn_order_return_log` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `return_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '退货ID',
  `order_sn` char(20) NOT NULL DEFAULT '',
  `sub_sn` char(20) NOT NULL DEFAULT '' COMMENT '子订单号',
  `o_sku_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '订单商品ID',
  `action` varchar(50) NOT NULL DEFAULT '' COMMENT '操作类型',
  `operator_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '操作者ID',
  `operator_name` varchar(60) NOT NULL DEFAULT '' COMMENT '操作者名称',
  `operator_type` tinyint(1) unsigned NOT NULL DEFAULT '2' COMMENT '操作者类型(1:后台管理员,2:会员3:商家(预留))',
  `msg` text NOT NULL COMMENT '日志详情',
  `system_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '操作时间',
  `clientip` char(15) NOT NULL DEFAULT '' COMMENT '操作IP地址',
  PRIMARY KEY (`id`),
  KEY `order_sn` (`order_sn`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='订单退货日志';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nn_order_return_log`
--

LOCK TABLES `nn_order_return_log` WRITE;
/*!40000 ALTER TABLE `nn_order_return_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `nn_order_return_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nn_order_server`
--

DROP TABLE IF EXISTS `nn_order_server`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nn_order_server` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '售后类型(1：退货并退款，2：仅退款)',
  `order_sn` char(20) NOT NULL DEFAULT '' COMMENT '主订单号',
  `sub_sn` char(20) NOT NULL DEFAULT '' COMMENT '子订单号',
  `buyer_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '买家id',
  `return_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '退货表主键id',
  `refund_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '退款表主键id',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '售后状态(0：处理中，2：完成)',
  `o_sku_id` mediumint(8) NOT NULL DEFAULT '0' COMMENT '订单商品ID',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='订单售后索引表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nn_order_server`
--

LOCK TABLES `nn_order_server` WRITE;
/*!40000 ALTER TABLE `nn_order_server` DISABLE KEYS */;
/*!40000 ALTER TABLE `nn_order_server` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nn_order_sku`
--

DROP TABLE IF EXISTS `nn_order_sku`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nn_order_sku` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `order_sn` char(20) NOT NULL DEFAULT '' COMMENT '主订单号',
  `sub_sn` char(20) NOT NULL DEFAULT '' COMMENT '子订单号',
  `buyer_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  `seller_id` mediumint(10) unsigned NOT NULL DEFAULT '0' COMMENT '卖家ID',
  `sku_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '产品ID',
  `sku_thumb` varchar(200) NOT NULL DEFAULT '' COMMENT '产品缩略图',
  `sku_barcode` varchar(30) NOT NULL DEFAULT '' COMMENT '产品的唯一条码(写入相对应商品条码)',
  `sku_name` varchar(200) NOT NULL DEFAULT '' COMMENT '产品名称',
  `sku_spec` text NOT NULL COMMENT '产品规格',
  `sku_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '销售售价',
  `real_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '应付金额',
  `buy_nums` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '购买数量',
  `return_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '退货id',
  `refund_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '退款ID',
  `delivery_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '订单物流关联id',
  `delivery_status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '发货状态(0：待发货，1：已发货，2：已收货)',
  `iscomment` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否评论',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '系统时间',
  `promotion` text NOT NULL COMMENT '促销活动详情',
  `is_give` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`) USING BTREE,
  KEY `order_sn` (`order_sn`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='订单商品表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nn_order_sku`
--

LOCK TABLES `nn_order_sku` WRITE;
/*!40000 ALTER TABLE `nn_order_sku` DISABLE KEYS */;
/*!40000 ALTER TABLE `nn_order_sku` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nn_order_sub`
--

DROP TABLE IF EXISTS `nn_order_sub`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nn_order_sub` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `order_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '主订单id',
  `order_sn` varchar(100) NOT NULL DEFAULT '' COMMENT '主订单号',
  `sub_sn` char(20) NOT NULL DEFAULT '' COMMENT '子订单号',
  `pay_type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '支付方式(1：在线支付，2：货到付款)',
  `buyer_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '买家id',
  `seller_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '卖家id',
  `delivery_name` varchar(50) NOT NULL DEFAULT '' COMMENT '物流名称',
  `sku_price` decimal(15,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '商品总额',
  `delivery_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '物流费用',
  `real_price` decimal(15,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '应付总额',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '订单状态(1：正常，2：取消，3：回收，4：删除)',
  `pay_status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '支付状态',
  `confirm_status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '确认状态(0：待确认，2：已确认)',
  `delivery_status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '发货状态(0：待发货，1：部分发货，2：已发货)',
  `finish_status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '完成状态(0：待完成，1：部分完成，2：已完成)',
  `pay_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '支付时间(时间戳)',
  `confirm_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '确认订单(时间戳)',
  `delivery_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '发货时间(时间戳)',
  `finish_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '完成时间(时间戳)',
  `system_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '系统时间(时间戳)',
  `remark` varchar(200) NOT NULL DEFAULT '' COMMENT '备注',
  `promotion` text NOT NULL COMMENT '促销活动',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='子订单表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nn_order_sub`
--

LOCK TABLES `nn_order_sub` WRITE;
/*!40000 ALTER TABLE `nn_order_sub` DISABLE KEYS */;
/*!40000 ALTER TABLE `nn_order_sub` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nn_order_tpl_parcel`
--

DROP TABLE IF EXISTS `nn_order_tpl_parcel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nn_order_tpl_parcel` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '模版名称',
  `content` text NOT NULL COMMENT '内容',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='发货单模板';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nn_order_tpl_parcel`
--

LOCK TABLES `nn_order_tpl_parcel` WRITE;
/*!40000 ALTER TABLE `nn_order_tpl_parcel` DISABLE KEYS */;
/*!40000 ALTER TABLE `nn_order_tpl_parcel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nn_order_track`
--

DROP TABLE IF EXISTS `nn_order_track`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nn_order_track` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `delivery_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '订单物流关联ID',
  `order_sn` char(20) NOT NULL DEFAULT '' COMMENT '主订单号',
  `sub_sn` char(20) NOT NULL DEFAULT '' COMMENT '子订单号',
  `time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '追踪时间',
  `msg` text NOT NULL COMMENT '内容',
  `add_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `clientip` char(15) NOT NULL DEFAULT '' COMMENT '操作IP',
  PRIMARY KEY (`id`),
  KEY `order_sn` (`order_sn`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='订单跟踪';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nn_order_track`
--

LOCK TABLES `nn_order_track` WRITE;
/*!40000 ALTER TABLE `nn_order_track` DISABLE KEYS */;
/*!40000 ALTER TABLE `nn_order_track` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nn_payment`
--

DROP TABLE IF EXISTS `nn_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nn_payment` (
  `pay_code` varchar(50) NOT NULL DEFAULT '',
  `pay_name` varchar(120) NOT NULL DEFAULT '',
  `pay_fee` varchar(5) NOT NULL DEFAULT '',
  `pay_desc` text NOT NULL,
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '启用状态',
  `config` text NOT NULL,
  `dateline` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `sort` int(8) unsigned NOT NULL DEFAULT '100',
  `isonline` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否在线支付',
  `applie` varchar(10) NOT NULL DEFAULT 'pc' COMMENT '客户端类型',
  PRIMARY KEY (`pay_code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='支付方式配置信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nn_payment`
--

LOCK TABLES `nn_payment` WRITE;
/*!40000 ALTER TABLE `nn_payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `nn_payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nn_plugin`
--

DROP TABLE IF EXISTS `nn_plugin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nn_plugin` (
  `pluginid` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `available` tinyint(1) NOT NULL DEFAULT '0',
  `adminid` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `name` varchar(40) NOT NULL DEFAULT '',
  `identifier` varchar(40) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `datatables` varchar(255) NOT NULL DEFAULT '',
  `directory` varchar(100) NOT NULL DEFAULT '',
  `copyright` varchar(100) NOT NULL DEFAULT '',
  `modules` text NOT NULL,
  `version` varchar(20) NOT NULL DEFAULT '',
  `author` varchar(250) NOT NULL DEFAULT '',
  `dateline` int(10) unsigned DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`pluginid`),
  UNIQUE KEY `identifier` (`identifier`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='插件表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nn_plugin`
--

LOCK TABLES `nn_plugin` WRITE;
/*!40000 ALTER TABLE `nn_plugin` DISABLE KEYS */;
/*!40000 ALTER TABLE `nn_plugin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nn_pluginvar`
--

DROP TABLE IF EXISTS `nn_pluginvar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nn_pluginvar` (
  `pluginvarid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `pluginid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `displayorder` tinyint(3) NOT NULL DEFAULT '0',
  `title` varchar(100) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `variable` varchar(40) NOT NULL DEFAULT '',
  `type` varchar(20) NOT NULL DEFAULT 'text',
  `value` text NOT NULL,
  `extra` text NOT NULL,
  PRIMARY KEY (`pluginvarid`),
  KEY `pluginid` (`pluginid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='插件变量表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nn_pluginvar`
--

LOCK TABLES `nn_pluginvar` WRITE;
/*!40000 ALTER TABLE `nn_pluginvar` DISABLE KEYS */;
/*!40000 ALTER TABLE `nn_pluginvar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nn_promotion_goods`
--

DROP TABLE IF EXISTS `nn_promotion_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nn_promotion_goods` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(200) NOT NULL DEFAULT '' COMMENT '活动名称',
  `start_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '开始时间',
  `end_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '结束时间',
  `sku_ids` text NOT NULL COMMENT '商品列表',
  `rules` text NOT NULL COMMENT '活动规则',
  `share_order` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否参与订单促销活动',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `sort` mediumint(8) unsigned NOT NULL DEFAULT '100',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='商品促销表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nn_promotion_goods`
--

LOCK TABLES `nn_promotion_goods` WRITE;
/*!40000 ALTER TABLE `nn_promotion_goods` DISABLE KEYS */;
/*!40000 ALTER TABLE `nn_promotion_goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nn_promotion_group`
--

DROP TABLE IF EXISTS `nn_promotion_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nn_promotion_group` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL DEFAULT '' COMMENT '促销标题，用于后台标识',
  `subtitle` varchar(50) NOT NULL DEFAULT '' COMMENT '捆绑销售名称，用于前台显示',
  `sku_ids` varchar(200) NOT NULL DEFAULT '' COMMENT '参与捆绑销售的商品sku_id',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '开启状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nn_promotion_group`
--

LOCK TABLES `nn_promotion_group` WRITE;
/*!40000 ALTER TABLE `nn_promotion_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `nn_promotion_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nn_promotion_order`
--

DROP TABLE IF EXISTS `nn_promotion_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nn_promotion_order` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '自动递增',
  `name` varchar(250) NOT NULL DEFAULT '' COMMENT '促销名称',
  `start_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '开始时间',
  `end_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '结束时间',
  `type` smallint(1) unsigned NOT NULL DEFAULT '0' COMMENT '促销类型(0：满额立减；1：满额免邮；2：满额赠礼)',
  `price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '满足金额',
  `discount` varchar(10) NOT NULL DEFAULT '' COMMENT '优惠项目',
  `dateline` int(10) NOT NULL COMMENT '添加时间',
  `sort` mediumint(8) NOT NULL COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='订单促销';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nn_promotion_order`
--

LOCK TABLES `nn_promotion_order` WRITE;
/*!40000 ALTER TABLE `nn_promotion_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `nn_promotion_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nn_promotion_time`
--

DROP TABLE IF EXISTS `nn_promotion_time`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nn_promotion_time` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `start_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '开始时间',
  `end_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '结束时间',
  `sku_info` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nn_promotion_time`
--

LOCK TABLES `nn_promotion_time` WRITE;
/*!40000 ALTER TABLE `nn_promotion_time` DISABLE KEYS */;
/*!40000 ALTER TABLE `nn_promotion_time` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nn_queue`
--

DROP TABLE IF EXISTS `nn_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nn_queue` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(100) NOT NULL DEFAULT '' COMMENT '类型/驱动',
  `method` varchar(255) NOT NULL DEFAULT '' COMMENT '方法/操作',
  `params` text NOT NULL COMMENT '参数',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态（-1：失败；0：待执行；1：已完成）',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '时间戳',
  `sort` smallint(6) unsigned NOT NULL DEFAULT '100' COMMENT '排序（越小越先执行）',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='队列表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nn_queue`
--

LOCK TABLES `nn_queue` WRITE;
/*!40000 ALTER TABLE `nn_queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `nn_queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nn_setting`
--

DROP TABLE IF EXISTS `nn_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nn_setting` (
  `key` varchar(200) NOT NULL DEFAULT '',
  `value` text NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='设置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nn_setting`
--

LOCK TABLES `nn_setting` WRITE;
/*!40000 ALTER TABLE `nn_setting` DISABLE KEYS */;
/*!40000 ALTER TABLE `nn_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nn_spec`
--

DROP TABLE IF EXISTS `nn_spec`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nn_spec` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '规格id',
  `name` varchar(60) NOT NULL DEFAULT '' COMMENT '规格名称',
  `value` text NOT NULL COMMENT '规格值',
  `img` text NOT NULL COMMENT '规格图片',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '规格状态',
  `sort` mediumint(5) unsigned NOT NULL DEFAULT '100' COMMENT '规格排序',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='商品规格';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nn_spec`
--

LOCK TABLES `nn_spec` WRITE;
/*!40000 ALTER TABLE `nn_spec` DISABLE KEYS */;
/*!40000 ALTER TABLE `nn_spec` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nn_type`
--

DROP TABLE IF EXISTS `nn_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nn_type` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '模型ID',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '模型名称',
  `content` text NOT NULL COMMENT '规格',
  `sort` tinyint(1) unsigned NOT NULL DEFAULT '100' COMMENT '排序',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='商品模型';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nn_type`
--

LOCK TABLES `nn_type` WRITE;
/*!40000 ALTER TABLE `nn_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `nn_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nn_vcode`
--

DROP TABLE IF EXISTS `nn_vcode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nn_vcode` (
  `id` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `mid` int(8) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  `mobile` char(11) NOT NULL DEFAULT '' COMMENT '手机号',
  `vcode` text NOT NULL,
  `action` varchar(100) NOT NULL DEFAULT '',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nn_vcode`
--

LOCK TABLES `nn_vcode` WRITE;
/*!40000 ALTER TABLE `nn_vcode` DISABLE KEYS */;
/*!40000 ALTER TABLE `nn_vcode` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-05-16 15:07:45
