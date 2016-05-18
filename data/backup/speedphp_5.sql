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
  `mobile` int(11) DEFAULT NULL,
  `birthday` int(10) DEFAULT NULL,
  `create_time` int(10) NOT NULL COMMENT '创建时间',
  `last_login` int(10) DEFAULT NULL COMMENT '最后登录时间',
  `create_ip` varchar(120) COLLATE utf8_bin NOT NULL COMMENT '注册IP',
  `login_ip` varchar(120) COLLATE utf8_bin DEFAULT NULL COMMENT '最后登录IP',
  `list_order` int(6) NOT NULL DEFAULT '1' COMMENT '排序字段',
  `locked` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否锁定(1-锁定，2-不锁定)',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nn_admin`
--

LOCK TABLES `nn_admin` WRITE;
/*!40000 ALTER TABLE `nn_admin` DISABLE KEYS */;
/*!40000 ALTER TABLE `nn_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nn_admin_group`
--

DROP TABLE IF EXISTS `nn_admin_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nn_admin_group` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '鐢ㄦ埛缁刬d,鑷??涓婚敭',
  `type` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '缁勭被鍨',
  `title` char(20) NOT NULL DEFAULT '' COMMENT '鐢ㄦ埛缁勪腑鏂囧悕绉',
  `description` varchar(80) NOT NULL DEFAULT '' COMMENT '鎻忚堪淇℃伅',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '鐢ㄦ埛缁勭姸鎬侊細涓?姝ｅ父锛屼负0绂佺敤,-1涓哄垹闄',
  `rules` varchar(500) NOT NULL DEFAULT '' COMMENT '鐢ㄦ埛缁勬嫢鏈夌殑瑙勫垯id锛屽?涓??鍒?, 闅斿紑',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='鐢ㄦ埛缁勫畾涔夎〃';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nn_admin_group`
--

LOCK TABLES `nn_admin_group` WRITE;
/*!40000 ALTER TABLE `nn_admin_group` DISABLE KEYS */;
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
  `admin_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '鎵?睘鐢ㄦ埛',
  `sort` int(8) unsigned NOT NULL DEFAULT '100',
  `title` varchar(255) NOT NULL DEFAULT '',
  `url` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='鍚庡彴绠＄悊鍛樿〃';
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
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='鍚庡彴绠＄悊鍛樿〃';
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='骞垮憡绠＄悊';
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
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='骞垮憡浣嶇?鐞';
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
  `id` mediumint(8) NOT NULL AUTO_INCREMENT COMMENT '鏂囩珷id',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '鏂囩珷鏍囬?',
  `content` text NOT NULL COMMENT '鏂囩珷鍐呭?',
  `category_id` int(8) unsigned NOT NULL DEFAULT '0' COMMENT '鍒嗙被id',
  `thumb` varchar(255) NOT NULL DEFAULT '' COMMENT '鏂囩珷鍥剧墖',
  `display` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '鏄?惁鏄剧ず',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '澶栭摼',
  `dataline` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '鍙戝竷鏃堕棿',
  `sort` int(8) unsigned NOT NULL DEFAULT '100' COMMENT '鎺掑簭',
  `keywords` varchar(255) NOT NULL COMMENT '鍏抽敭瀛',
  `hits` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '闃呰?閲',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='鏂囩珷琛';
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
  `id` mediumint(8) NOT NULL AUTO_INCREMENT COMMENT '鍒嗙被id',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '鍒嗙被鍚嶇О',
  `parent_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '鐖跺垎绫',
  `display` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '鏄?惁鏄剧ず',
  `sort` int(8) unsigned NOT NULL DEFAULT '100' COMMENT '鎺掑簭',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='鏂囩珷鍒嗙被琛';
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
  `use_nums` smallint(3) unsigned NOT NULL DEFAULT '0' COMMENT '浣跨敤娆℃暟',
  `authcode` char(32) NOT NULL,
  `filetype` varchar(100) NOT NULL DEFAULT '',
  `md5` char(32) NOT NULL DEFAULT '',
  `sha1` varchar(100) NOT NULL DEFAULT '',
  `width` smallint(6) unsigned NOT NULL DEFAULT '0',
  `height` smallint(6) unsigned NOT NULL DEFAULT '0',
  `name` varchar(200) NOT NULL DEFAULT '',
  `issystem` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '鏄?惁鍚庡彴涓婁紶',
  `url` varchar(200) NOT NULL DEFAULT '',
  PRIMARY KEY (`aid`),
  KEY `authcode` (`authcode`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='闄勪欢琛';
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
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '灞炴?ID',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '鍚嶇О',
  `value` text NOT NULL COMMENT '灞炴?鍊?閫楀彿鍒嗛殧)',
  `search` smallint(2) unsigned NOT NULL DEFAULT '1' COMMENT '鏄?惁鍙備笌绛涢?',
  `type` varchar(50) NOT NULL DEFAULT '' COMMENT '杈撳叆鎺т欢鐨勭被鍨?radio:鍗曢?,checkbox:澶嶉?,input:杈撳叆',
  `sort` int(8) unsigned NOT NULL DEFAULT '100' COMMENT '鎺掑簭',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='灞炴?';
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
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '鍝佺墝id',
  `name` varchar(60) NOT NULL DEFAULT '' COMMENT '鍝佺墝鍚嶇О',
  `logo` varchar(200) NOT NULL DEFAULT '' COMMENT '鍝佺墝logo鍥剧墖',
  `descript` text NOT NULL COMMENT '鍝佺墝鎻忚堪',
  `url` varchar(200) NOT NULL DEFAULT '' COMMENT '鍝佺墝鐨勫湴鍧',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '鐘舵?(鏄?惁鏄剧ず锛屾樉绀?1,闅愯棌:0)',
  `isrecommend` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '鏄?惁鎺ㄨ崘',
  `sort` int(8) unsigned NOT NULL DEFAULT '100' COMMENT '鎺掑簭',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='鍟嗗搧鍝佺墝';
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
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '涓婚敭ID',
  `buyer_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '浼氬憳ID',
  `sku_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '瀛愬晢鍝両D',
  `nums` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '璐?拱鏁伴噺',
  `system_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '绯荤粺鏃堕棿',
  `clientip` char(15) NOT NULL DEFAULT '' COMMENT '鎿嶄綔IP鍦板潃',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='璐?墿杞';
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
  `sku_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '鍟嗗搧sku_id',
  `spu_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '鍟嗗搧spu_id',
  `order_sn` varchar(20) NOT NULL DEFAULT '' COMMENT '璁㈠崟鍙',
  `content` text NOT NULL,
  `mid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '鎵?睘浼氬憳',
  `datetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '鏃堕棿鎴',
  `clientip` char(15) NOT NULL DEFAULT '',
  `mood` enum('positive','neutral','negative') NOT NULL,
  `reply_content` text NOT NULL,
  `reply_time` int(10) unsigned NOT NULL,
  `imgs` text NOT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '瀹℃牳缁撴灉',
  `is_shield` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `username` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='鍟嗗搧璇勪环琛';
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
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '涓婚敭ID',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '鍚嶇О',
  `identif` varchar(50) NOT NULL DEFAULT '' COMMENT '鏍囪瘑',
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '寮?叧(1:寮?惎,0:鍏抽棴)',
  `logo` varchar(200) NOT NULL DEFAULT '' COMMENT 'LOGO',
  `insure` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '淇濅环',
  `tpl` text COMMENT '蹇??鍗曟ā鐗堝唴瀹',
  `sort` tinyint(3) unsigned NOT NULL DEFAULT '100' COMMENT '鎺掑簭',
  `systime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '鎿嶄綔鏃堕棿',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='鐗╂祦閰嶉?琛';
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
  `price` decimal(15,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '閰嶉?閲戦?',
  `district_id` text NOT NULL COMMENT '鍦板尯ID',
  `sort` int(8) unsigned NOT NULL DEFAULT '100' COMMENT '鎺掑簭',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='鐗╂祦鍦板尯璁剧疆';
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
  `parent_id` int(10) NOT NULL COMMENT '鐖舵爮鐩',
  `name` varchar(50) NOT NULL DEFAULT '',
  `zipcode` int(10) NOT NULL DEFAULT '0',
  `pinyin` varchar(100) NOT NULL DEFAULT '',
  `lng` varchar(20) NOT NULL DEFAULT '',
  `lat` varchar(20) NOT NULL DEFAULT '',
  `level` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `sort` tinyint(3) unsigned NOT NULL DEFAULT '50' COMMENT '鎺掑簭',
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
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '鍚嶇О',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '閾炬帴',
  `thumb` varchar(255) NOT NULL DEFAULT '' COMMENT '鍥剧墖',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '鎻忚堪',
  `width` int(4) unsigned NOT NULL DEFAULT '100' COMMENT '瀹',
  `height` int(4) unsigned NOT NULL DEFAULT '100' COMMENT '楂',
  `target` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '鏄?惁鏂扮獥鍙ｆ墦寮',
  `display` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '鏄?惁鏄剧ず',
  `sort` int(8) unsigned NOT NULL DEFAULT '100' COMMENT '鎺掑簭',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='鐒︾偣鍥';
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
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '鍙嬮摼鍚嶇О',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '閾炬帴',
  `logo` varchar(255) NOT NULL DEFAULT '' COMMENT '鍥剧墖',
  `target` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '鏄?惁鏂扮獥鍙ｆ墦寮',
  `display` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '鏄?惁鏄剧ず',
  `sort` int(8) unsigned NOT NULL DEFAULT '100' COMMENT '鎺掑簭',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='鍙嬫儏閾炬帴';
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
  `sku_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '鍟嗗搧id',
  `attribute_id` int(10) unsigned NOT NULL COMMENT '灞炴?id',
  `attribute_value` varchar(255) NOT NULL COMMENT '灞炴?鍊',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '鍟嗗搧灞炴?绉嶇被锛?涓鸿?鏍硷紝2涓哄睘鎬',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '鐘舵?(鏄?惁鏄剧ず锛屾樉绀?1,闅愯棌:0)',
  `sort` int(8) unsigned NOT NULL DEFAULT '100' COMMENT '鎺掑簭'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='鍟嗗搧灞炴?';
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
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '鍒嗙被鍚嶇О',
  `parent_id` mediumint(8) NOT NULL DEFAULT '0' COMMENT '鐖剁骇鍒嗙被id',
  `type_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '鍟嗗搧妯″瀷id',
  `keywords` varchar(200) NOT NULL,
  `descript` varchar(200) NOT NULL,
  `show_in_nav` tinyint(1) NOT NULL DEFAULT '0' COMMENT '鏄?惁鍦ㄥ?鑸?腑鏄剧ず,鐘舵?:0:鍏抽棴锛?:寮?惎',
  `grade` text NOT NULL COMMENT '浠锋牸鍒嗙骇',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '鐘舵?:0:鍏抽棴锛?:寮?惎',
  `sort` int(8) NOT NULL DEFAULT '100' COMMENT '鎺掑簭',
  `img` varchar(200) NOT NULL DEFAULT '' COMMENT '鍒嗙被鍓嶉潰鐨勫皬鍥炬爣',
  `url` varchar(200) NOT NULL DEFAULT '' COMMENT '澶栭儴閾炬帴',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='鍟嗗搧鍒嗙被';
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
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '鍟嗗搧鍜ㄨ?id',
  `spu_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '鍟嗗搧spu_id',
  `sku_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '瀛愬晢鍝乮d',
  `question` text NOT NULL COMMENT '鍜ㄨ?鍐呭?',
  `mid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '鍜ㄨ?浜轰細鍛業D锛岄潪浼氬憳涓虹┖',
  `username` varchar(60) NOT NULL DEFAULT '' COMMENT '鐢ㄦ埛鍚',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '鍜ㄨ?鏃堕棿',
  `reply_content` text NOT NULL COMMENT '鍜ㄨ?鍥炲?',
  `reply_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '鍥炲?鏃堕棿',
  `clientip` char(15) NOT NULL DEFAULT '' COMMENT '璇勮?鏃剁殑鐢ㄦ埛IP',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '璇勮?鐘舵?锛?锛氭湭瀹℃牳 1: 宸插?鏍',
  `sort` mediumint(8) unsigned NOT NULL DEFAULT '100' COMMENT '鎺掑簭',
  `see` int(1) NOT NULL DEFAULT '0' COMMENT '鏄?惁鏌ョ湅',
  PRIMARY KEY (`id`),
  KEY `spu_id` (`spu_id`) USING BTREE,
  KEY `spu_id, status` (`spu_id`,`status`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='鍟嗗搧鍜ㄨ?琛';
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
  `brand_id` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '鍝佺墝ID',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '鍟嗗搧鐘舵?',
  `sales` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '閿?噺',
  `hits` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '浜烘皵',
  `show_in_lists` tinyint(1) NOT NULL DEFAULT '0' COMMENT '鏄?惁鍦ㄥ垪琛ㄤ腑鏄剧ず',
  `status_ext` tinyint(1) NOT NULL,
  `shop_price` decimal(10,2) NOT NULL,
  `favorites` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '鏀惰棌',
  `attr_ids` text NOT NULL,
  `spec_ids` text NOT NULL,
  `sort` int(8) unsigned NOT NULL DEFAULT '100' COMMENT '鎺掑簭',
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
  `sku_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '瀛愬晢鍝乮d',
  `spu_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '鍟嗗搧id,鍙栧?goods鐨刧oods_id',
  `sku_name` varchar(200) NOT NULL DEFAULT '' COMMENT '瀛愬晢鍝佸悕绉',
  `subtitle` varchar(200) NOT NULL DEFAULT '' COMMENT '鍓?爣棰',
  `style` varchar(50) NOT NULL,
  `sn` varchar(200) NOT NULL DEFAULT '' COMMENT '鍟嗗搧璐у彿',
  `barcode` varchar(60) NOT NULL DEFAULT '' COMMENT '鍟嗗搧鏉″舰鐮',
  `spec` text NOT NULL COMMENT '鍟嗗搧鎵?睘瑙勬牸绫诲瀷id锛屽彇鍊約pec鐨刬d',
  `imgs` text NOT NULL COMMENT '鍟嗗搧鍥惧唽',
  `thumb` varchar(200) NOT NULL DEFAULT '' COMMENT '缂╃暐鍥',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `status_ext` tinyint(1) NOT NULL COMMENT '鍟嗗搧鏍囩?鐘舵?',
  `number` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '鍟嗗搧搴撳瓨鏁伴噺',
  `market_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '甯傚満鍞?环',
  `sort` int(8) unsigned NOT NULL DEFAULT '100' COMMENT '鎺掑簭',
  `shop_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '閿?敭鍞?环',
  `keyword` text NOT NULL,
  `description` text NOT NULL,
  `content` text NOT NULL,
  `show_in_lists` tinyint(1) NOT NULL DEFAULT '0' COMMENT '鏄?惁鍦ㄥ垪琛ㄦ樉绀',
  `warn_number` tinyint(3) NOT NULL DEFAULT '5',
  `prom_type` varchar(200) NOT NULL DEFAULT '' COMMENT '淇冮攢绫诲瀷',
  `prom_id` mediumint(8) NOT NULL DEFAULT '0' COMMENT '淇冮攢绫诲瀷ID',
  `up_time` int(10) NOT NULL DEFAULT '0' COMMENT '涓婃灦鏃堕棿',
  PRIMARY KEY (`sku_id`),
  UNIQUE KEY `sn` (`sn`) USING BTREE,
  KEY `goods_id` (`spu_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='瀛愬晢鍝佽〃';
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
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '鍟嗗搧id',
  `name` varchar(200) NOT NULL DEFAULT '' COMMENT '鍟嗗搧鍚嶇О,鍟嗗搧鏍囬?',
  `sn` varchar(200) NOT NULL DEFAULT '' COMMENT '鍟嗗搧璐у彿',
  `subtitle` varchar(200) NOT NULL DEFAULT '' COMMENT '鍓?爣棰橈紝骞垮憡璇',
  `style` varchar(50) NOT NULL COMMENT '鍟嗗搧鏍囬?鐨刪tml鏍峰紡',
  `catid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '鍒嗙被id',
  `brand_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '鍟嗗搧鍝佺墝id',
  `keyword` varchar(200) NOT NULL COMMENT '鍟嗗搧鍏抽敭璇嶏紝鍒╀簬鎼滅储寮曟搸浼樺寲',
  `description` varchar(200) NOT NULL COMMENT '鍟嗗搧鎻忚堪锛屽埄浜庢悳绱㈠紩鎿庝紭鍖',
  `content` text NOT NULL COMMENT '鍟嗗搧鐨勮?缁嗘弿杩',
  `imgs` text NOT NULL COMMENT '鍟嗗搧鍥惧唽',
  `thumb` varchar(200) NOT NULL DEFAULT '' COMMENT '缂╃暐鍥',
  `min_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '鏈?皬浠锋牸',
  `max_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '鏈?ぇ浠锋牸',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '鐘舵?(鏄?惁涓婃灦锛屽垹闄?-1,涓婃灦:1,涓嬫灦:0)',
  `specs` text NOT NULL COMMENT '瑙勬牸鏁版嵁 json',
  `sku_total` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '鍟嗗搧鎬绘暟',
  `give_point` int(11) NOT NULL DEFAULT '-1' COMMENT '绉?垎',
  `warn_number` tinyint(3) NOT NULL DEFAULT '2' COMMENT '搴撳瓨璀﹀憡鏁伴噺',
  `sort` int(8) unsigned NOT NULL DEFAULT '100' COMMENT '鎺掑簭',
  `spec_id` int(10) NOT NULL DEFAULT '0' COMMENT '涓婁紶鍥剧墖鏃朵笌瑙勬牸鍏宠仈鐨刬d',
  PRIMARY KEY (`id`),
  KEY `brand_id` (`brand_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='鍟嗗搧琛';
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
  `parent_id` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '鐖秈d',
  `url` varchar(50) NOT NULL DEFAULT '' COMMENT '瓒呴摼鎺',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '鏍囬?',
  `content` text NOT NULL COMMENT '鍐呭?',
  `display` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '鏄?惁鏄剧ず',
  `sort` int(8) unsigned NOT NULL DEFAULT '100' COMMENT '鎺掑簭',
  `keywords` varchar(50) NOT NULL DEFAULT '' COMMENT '甯?姪鍏抽敭瀛',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='绔欑偣甯?姪';
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
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '涓婚敭',
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '鎵ц?鐢ㄦ埛id',
  `action_ip` char(15) NOT NULL DEFAULT '0' COMMENT '鎵ц?琛屼负鑰卛p',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '鏃ュ織澶囨敞',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '鐘舵?',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '鎵ц?琛屼负鐨勬椂闂',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '鎿嶄綔URL',
  PRIMARY KEY (`id`),
  KEY `action_ip_ix` (`action_ip`) USING BTREE,
  KEY `user_id_ix` (`user_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='琛屼负鏃ュ織琛';
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
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '鑷??ID',
  `username` varchar(20) NOT NULL DEFAULT '' COMMENT '鐢ㄦ埛鍚',
  `password` char(32) NOT NULL DEFAULT '' COMMENT '鐧诲綍瀵嗙爜',
  `group_id` smallint(3) unsigned NOT NULL DEFAULT '0' COMMENT '浼氬憳绛夌骇',
  `encrypt` char(6) NOT NULL,
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT '鐢靛瓙閭?欢',
  `integral` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '鍙?敤绉?垎',
  `money` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '鍙?敤浣欓?',
  `mobile` char(11) NOT NULL DEFAULT '' COMMENT '鎵嬫満鍙风爜',
  `register_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '娉ㄥ唽鏃堕棿',
  `register_ip` char(15) NOT NULL DEFAULT '' COMMENT '娉ㄥ唽IP',
  `login_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '鐧诲綍鏃堕棿',
  `login_ip` char(15) NOT NULL DEFAULT '' COMMENT '鐧诲綍IP',
  `login_num` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '鐧诲綍娆℃暟',
  `islock` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '鏄?惁閿佸畾',
  `frozen_money` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '鍐荤粨璧勯噾',
  `exp` int(8) unsigned NOT NULL DEFAULT '0' COMMENT '缁忛獙鍊',
  `emailstatus` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '閭??璁よ瘉鐘舵?',
  `mobilestatus` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '鎵嬫満璁よ瘉鐘舵?',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='鐢ㄦ埛琛';
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
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '鑷??ID',
  `mid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '鎵?睘浼氬憳',
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '鏀惰揣浜',
  `mobile` char(11) NOT NULL DEFAULT '' COMMENT '鑱旂郴鐢佃瘽',
  `district_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '鍖哄垝ID',
  `address` varchar(255) NOT NULL DEFAULT '' COMMENT '璇︾粏鍦板潃',
  `zipcode` char(6) NOT NULL DEFAULT '' COMMENT '閭?紪',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '鐘舵?',
  `isdefault` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '鏄?惁榛樿?',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='鐢ㄦ埛鏀惰揣鍦板潃';
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
  `mid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '浼氬憳ID',
  `money` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '鍏呭?閲戦?',
  `order_sn` char(32) NOT NULL DEFAULT '' COMMENT '璁㈠崟鍙',
  `order_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '璁㈠崟鐢熸垚鏃堕棿',
  `pay_code` varchar(50) NOT NULL DEFAULT '' COMMENT '鏀?粯鏂瑰紡',
  `trade_sn` varchar(50) NOT NULL DEFAULT '' COMMENT '绗?笁鏂逛氦鏄撳彿',
  `trade_status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '浜ゆ槗鐘舵?锛堢?涓夋柟锛',
  `trade_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '浜ゆ槗鏃堕棿',
  `order_status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '璁㈠崟鐘舵?锛堟槸鍚﹀凡鍏ヨ处锛',
  PRIMARY KEY (`id`),
  KEY `mid` (`mid`) USING BTREE,
  KEY `order_sn` (`order_sn`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='浼氬憳鍏呭?璁板綍琛';
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
  `mid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '鎵?睘浼氬憳',
  `sku_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'SKU缂栧彿',
  `sku_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `datetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '鏀惰棌鏃堕棿',
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
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '绛夌骇鎻忚堪',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='浼氬憳绛夌骇缁';
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
  `value` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '鍙樺姩閲戦?',
  `msg` text NOT NULL,
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `type` varchar(20) NOT NULL DEFAULT '',
  `admin_id` int(10) unsigned DEFAULT '0',
  `money_detail` tinytext NOT NULL COMMENT '浣欓?鏄庣粏',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='璐㈠姟鍙樺姩璁板綍琛';
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
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '(0锛氭湭闃咃紱1锛氬凡闃?',
  `delstatus` tinyint(1) NOT NULL DEFAULT '0' COMMENT '鍒犻櫎鐘舵?',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='绔欏唴淇';
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
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '鍚嶇О',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '绠?粙',
  `version` char(50) NOT NULL DEFAULT '' COMMENT '鐗堟湰',
  `author` varchar(100) NOT NULL DEFAULT '' COMMENT '妯″潡浣滆?',
  `url` varchar(255) NOT NULL,
  `setting` text NOT NULL COMMENT '妯″潡閰嶇疆',
  `install_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '瀹夎?鏃堕棿',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '鏇存柊鏃堕棿',
  `issystem` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '绯荤粺妯″潡',
  `isenabled` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '鍚?敤鐘舵?',
  PRIMARY KEY (`identifier`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='妯″潡琛';
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
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '瀵艰埅鍚嶇О',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '閾炬帴鍦板潃',
  `display` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '鏄?惁鍚?敤',
  `sort` int(8) unsigned NOT NULL DEFAULT '100' COMMENT '鎺掑簭',
  `target` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '鏄?惁鏂扮獥鍙ｆ墦寮',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='瀵艰埅璁剧疆';
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
  `parent_id` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '涓婄骇鑿滃崟ID',
  `name` char(40) NOT NULL DEFAULT '' COMMENT '鑿滃崟鍚嶇О',
  `m` char(20) NOT NULL DEFAULT '' COMMENT '妯″潡',
  `c` char(20) NOT NULL DEFAULT '' COMMENT '鎺у埗鍣',
  `a` char(20) NOT NULL DEFAULT '' COMMENT '鎿嶄綔',
  `param` char(100) NOT NULL DEFAULT '' COMMENT '鍙傛暟',
  `sort` int(8) unsigned NOT NULL DEFAULT '100',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '鏄?惁鏄剧ず',
  `url` char(255) NOT NULL DEFAULT '',
  `pluginid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `split` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '鍒嗗壊绾',
  PRIMARY KEY (`id`),
  KEY `listorder` (`sort`) USING BTREE,
  KEY `parentid` (`parent_id`) USING BTREE,
  KEY `module` (`c`,`m`,`a`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=56 DEFAULT CHARSET=utf8 COMMENT='鑿滃崟&鏉冮檺鑺傜偣琛';
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
  `enabled` varchar(250) NOT NULL DEFAULT '1' COMMENT '鍚?敤鐘舵?',
  `config` text NOT NULL,
  `dateline` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '鏇存柊鏃堕棿',
  `sort` int(8) unsigned NOT NULL DEFAULT '100',
  `ignore` text NOT NULL,
  PRIMARY KEY (`code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='閫氱煡绯荤粺閰嶇疆淇℃伅';
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
  `id` varchar(100) NOT NULL DEFAULT '' COMMENT '宓屽叆鐐瑰悕绉',
  `enabled` text NOT NULL COMMENT '寮?惎鐨勯?鐭ユ柟寮',
  `template` text NOT NULL COMMENT '閫氱煡妯℃澘',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '妯＄増娉ㄩ噴',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='閫氱煡妯＄増璁剧疆';
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
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '涓婚敭id',
  `sn` char(20) NOT NULL DEFAULT '' COMMENT '璁㈠崟鍙',
  `buyer_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '涔板?id',
  `seller_ids` varchar(200) NOT NULL DEFAULT '0' COMMENT '鍗栧?ids',
  `source` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '璁㈠崟鏉ユ簮(1锛氭爣鍑嗭紝2锛歸ap锛?锛歸echat)',
  `pay_type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '鏀?粯绫诲瀷(1锛氬湪绾挎敮浠橈紝2锛氳揣鍒颁粯娆?',
  `sku_amount` decimal(15,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '鍟嗗搧鎬婚?',
  `delivery_amount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '鐗╂祦鎬婚?',
  `real_amount` decimal(15,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '搴斾粯鎬婚?',
  `paid_amount` decimal(15,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '瀹炰粯鎬婚?',
  `balance_amount` decimal(15,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '浣欓?浠樻?鎬婚?',
  `pay_method` varchar(200) NOT NULL DEFAULT '' COMMENT '鏀?粯鏂瑰紡',
  `pay_sn` varchar(50) NOT NULL DEFAULT '' COMMENT '绗?笁鏂规敮浠樺彿',
  `address_name` varchar(100) NOT NULL DEFAULT '' COMMENT '鏀惰揣浜哄?鍚',
  `address_mobile` varchar(100) NOT NULL DEFAULT '' COMMENT '鏀惰揣浜虹數璇',
  `address_detail` varchar(100) NOT NULL DEFAULT '' COMMENT '鏀惰揣璇︾粏鍦板潃',
  `address_district_ids` varchar(100) NOT NULL DEFAULT '' COMMENT '鏀惰揣鍦板尯ids(缁熻?绱㈠紩)',
  `invoice_tax` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '鍙戠エ绋庣巼',
  `invoice_title` varchar(200) NOT NULL DEFAULT '' COMMENT '鍙戠エ鎶?ご',
  `invoice_content` varchar(200) NOT NULL DEFAULT '' COMMENT '鍙戠エ鍐呭?',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '璁㈠崟鐘舵?(1锛氭?甯革紝2锛氬叏閮ㄥ彇娑堬紝3锛氬叏閮ㄥ洖鏀讹紝4锛氬叏閮ㄥ垹闄?',
  `pay_status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '鏄?惁鏀?粯(甯冨皵鍊?',
  `confirm_status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '纭??鐘舵?(0锛氬緟纭??锛?锛氶儴鍒嗙‘璁わ紝2锛氬凡纭??)',
  `delivery_status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '鍙戣揣鐘舵?(0锛氬緟鍙戣揣锛?锛氶儴鍒嗗彂璐э紝2锛氬凡鍙戣揣)',
  `finish_status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '瀹屾垚鐘舵?(0锛氬緟瀹屾垚锛?锛氶儴鍒嗗畬鎴愶紝2锛氬凡瀹屾垚)',
  `pay_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '鏀?粯鏃堕棿',
  `system_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '绯荤粺鏃堕棿',
  `promot_amount` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '鎵?湁浼樻儬鎬婚?',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='璁㈠崟涓昏〃';
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
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '涓婚敭ID',
  `sn` char(20) NOT NULL DEFAULT '' COMMENT '璁㈠崟鍙',
  `member_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '浼氬憳ID',
  `source` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '璁㈠崟鏉ユ簮(鏍囧噯璁㈠崟:0,鎵嬫満璁㈠崟:1,寰?俊璁㈠崟2)',
  `delivery_method` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '閰嶉?鏂瑰紡(鍦ㄧ嚎鏀?粯:0,璐у埌浠樻?:1)',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '璁㈠崟鐘舵?(1锛氭?甯革紝2锛氬凡鍙栨秷锛?锛氬凡鍥炴敹锛?锛氬墠鍙板凡鍒犻櫎)',
  `pay_status` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '鏀?粯鐘舵?',
  `confirm_status` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '纭??鐘舵?',
  `delivery_status` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '鍙戣揣鐘舵?',
  `completion_status` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '瀹屾垚鐘舵?',
  `return_status` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '閫?揣鐘舵?',
  `refund_status` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '閫??鐘舵?',
  `payable_amount` decimal(15,2) NOT NULL DEFAULT '0.00' COMMENT '鍟嗗搧鎬婚?',
  `real_amount` decimal(15,2) NOT NULL DEFAULT '0.00' COMMENT '搴斾粯鎬婚?',
  `balance_amount` decimal(15,2) NOT NULL DEFAULT '0.00' COMMENT '浣欓?浠樻?鎬婚?',
  `payable_freight` decimal(15,2) NOT NULL DEFAULT '0.00' COMMENT '閰嶉?鎬婚?',
  `discount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '鎶樻墸',
  `coupons` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '浼樻儬鍒告姷鎵',
  `coupons_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '浼樻儬鍒窱D',
  `integral` decimal(15,2) NOT NULL DEFAULT '0.00' COMMENT '浣跨敤绉?垎鎶垫墸',
  `pay_method` varchar(20) NOT NULL DEFAULT '' COMMENT '鏀?粯鏂瑰紡(濡傦細鏀?粯瀹濄?缃戦摱銆佸井淇＄瓑)',
  `pay_sn` varchar(100) NOT NULL DEFAULT '' COMMENT '鏀?粯娴佹按鍙',
  `remark` varchar(200) NOT NULL DEFAULT '' COMMENT '璁㈠崟澶囨敞',
  `invoice_taxes` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '鍙戠エ绋庨?',
  `invoice_title` varchar(100) NOT NULL DEFAULT '' COMMENT '鍙戠エ鎶?ご淇℃伅',
  `invoice_content` varchar(100) NOT NULL DEFAULT '' COMMENT '鍙戠エ鍐呭?',
  `delivery_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '鐗╂祦ID',
  `delivery_name` varchar(100) NOT NULL DEFAULT '' COMMENT '鐗╂祦鍚嶇О',
  `delivery_sn` varchar(100) NOT NULL DEFAULT '' COMMENT '杩愬崟鍙',
  `delivery_address_name` varchar(100) NOT NULL DEFAULT '' COMMENT '鏀惰揣浜哄悕绉',
  `delivery_address_mobile` varchar(20) NOT NULL DEFAULT '' COMMENT '鏀惰揣浜烘墜鏈哄彿',
  `delivery_address_postalcode` char(6) NOT NULL DEFAULT '' COMMENT '鏀惰揣浜洪偖缂',
  `delivery_address_district` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '鏀惰揣浜哄湴鍖篿d',
  `delivery_address_address` varchar(200) NOT NULL DEFAULT '' COMMENT '鏀惰揣浜鸿?缁嗗湴鍧',
  `comment_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '璇勮?ID',
  `return_amount` decimal(15,0) NOT NULL DEFAULT '0' COMMENT '閫??鎬婚?',
  `return_remarks` text NOT NULL COMMENT '閫??澶囨敞',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '鍒涘缓鏃堕棿',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '鏇存柊鏃堕棿',
  PRIMARY KEY (`id`),
  KEY `order_sn` (`sn`),
  KEY `member_id` (`member_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='璁㈠崟涓昏〃';
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
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '涓婚敭id',
  `o_sku_ids` varchar(200) NOT NULL DEFAULT '0' COMMENT '璁㈠崟鍟嗗搧鍒楄〃(澶氫釜鐢?,"閫楀彿鍒嗗壊)',
  `sub_sn` char(20) NOT NULL COMMENT '璁㈠崟鍙',
  `delivery_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '鐗╂祦id',
  `delivery_name` varchar(20) NOT NULL DEFAULT '' COMMENT '鎵?睘鐗╂祦',
  `delivery_sn` varchar(50) NOT NULL COMMENT '杩愬崟鍙',
  `delivery_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '鍙戣揣鏃堕棿',
  `isreceive` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '鏄?惁纭??鏀惰揣(甯冨皵鍊?',
  `receive_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '纭??鏀惰揣鏃堕棿',
  `print_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '鎵撳嵃鏃堕棿',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='璁㈠崟鐗╂祦琛';
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
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '鑷??ID',
  `order_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '璁㈠崟ID',
  `order_sn` char(20) NOT NULL DEFAULT '' COMMENT '璁㈠崟鍙',
  `member_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '浼氬憳ID',
  `sku_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '浜у搧ID',
  `sku_thumb` varchar(200) NOT NULL DEFAULT '' COMMENT '浜у搧缂╃暐鍥',
  `sku_barcode` varchar(30) NOT NULL DEFAULT '' COMMENT '浜у搧鐨勫敮涓?潯鐮?鍐欏叆鐩稿?搴斿晢鍝佹潯鐮?',
  `sku_name` varchar(200) NOT NULL DEFAULT '' COMMENT '浜у搧鍚嶇О',
  `sku_spec` text NOT NULL COMMENT '浜у搧瑙勬牸',
  `sku_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '閿?敭鍞?环',
  `real_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '瀹炰粯閲戦?',
  `buy_nums` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '鍟嗗搧璐?拱鏁伴噺',
  `give_coupons_id` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '璧犻?浼樻儬鍒',
  `return_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '閫?揣id',
  `refund_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '閫??ID',
  `iscomment` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '鏄?惁璇勮?',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '绯荤粺鏃堕棿',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`) USING BTREE,
  KEY `order_sn` (`order_sn`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='璁㈠崟鍟嗗搧琛';
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
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '涓婚敭ID',
  `order_sn` char(20) NOT NULL DEFAULT '' COMMENT '涓昏?鍗曞彿',
  `sub_sn` char(20) NOT NULL DEFAULT '' COMMENT '瀛愯?鍗曞彿',
  `action` varchar(50) NOT NULL DEFAULT '' COMMENT '鎿嶄綔绫诲瀷',
  `operator_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '鎿嶄綔鑰匢D',
  `operator_name` varchar(60) NOT NULL DEFAULT '' COMMENT '鎿嶄綔鑰呭悕绉',
  `operator_type` tinyint(1) unsigned NOT NULL DEFAULT '2' COMMENT '鎿嶄綔鑰呯被鍨?1:鍚庡彴绠＄悊鍛?2:浼氬憳3:鍟嗗?(棰勭暀))',
  `msg` text NOT NULL COMMENT '鏃ュ織璇︽儏',
  `system_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '鎿嶄綔鏃堕棿',
  `clientip` char(15) NOT NULL DEFAULT '' COMMENT '鎿嶄綔IP鍦板潃',
  PRIMARY KEY (`id`),
  KEY `order_sn` (`order_sn`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='璁㈠崟鏃ュ織琛';
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
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '涓婚敭ID',
  `order_sn` varchar(20) NOT NULL DEFAULT '' COMMENT '涓昏?鍗曞彿',
  `sub_sn` char(20) NOT NULL DEFAULT '' COMMENT '瀛愯?鍗曞彿',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '鐘舵?锛?1锛氶厤閫佸け璐ワ紝0锛氬緟閰嶈揣锛?锛氶厤閫佷腑锛?锛氶厤閫佸畬鎴愶級',
  `member_name` varchar(100) NOT NULL DEFAULT '' COMMENT '浼氬憳璐﹀彿',
  `address_name` varchar(100) NOT NULL DEFAULT '' COMMENT '鏀惰揣浜哄?鍚',
  `address_mobile` varchar(20) NOT NULL DEFAULT '' COMMENT '鏀惰揣浜烘墜鏈',
  `address_detail` varchar(200) NOT NULL DEFAULT '' COMMENT '鏀惰揣浜鸿?缁嗗湴鍧',
  `delivery_name` varchar(100) NOT NULL DEFAULT '' COMMENT '鐗╂祦鍚嶇О',
  `system_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '绯荤粺鏃堕棿',
  PRIMARY KEY (`id`),
  KEY `order_sn` (`order_sn`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='鍙戣揣鍗曠?鐞';
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
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '涓婚敭ID',
  `parcel_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '鍏宠仈鍙戣揣琛╥d',
  `order_sn` varchar(20) NOT NULL DEFAULT '' COMMENT '璁㈠崟鍙',
  `sub_sn` varchar(20) NOT NULL DEFAULT '' COMMENT '瀛愯?鍗曞彿',
  `buyer_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '浼氬憳ID',
  `member_name` varchar(100) NOT NULL DEFAULT '' COMMENT '浼氬憳甯愬彿',
  `action` varchar(50) NOT NULL DEFAULT '' COMMENT '鎿嶄綔鏄庣粏',
  `msg` text NOT NULL COMMENT '鎿嶄綔鏃ュ織澶囨敞',
  `operator_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '鎿嶄綔绠＄悊鍛業D',
  `operator_name` varchar(50) NOT NULL DEFAULT '' COMMENT '绠＄悊鍛樺悕绉',
  `system_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '绯荤粺鏃堕棿',
  PRIMARY KEY (`id`),
  KEY `order_sn` (`order_sn`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='璁㈠崟鍙戣揣鍗曟棩蹇';
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
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '鑷??ID',
  `return_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '閫?揣id',
  `order_sn` char(20) NOT NULL DEFAULT '' COMMENT '涓昏?鍗曞彿',
  `sub_sn` char(20) NOT NULL DEFAULT '' COMMENT '瀛愯?鍗曞彿(绌轰负鏁翠釜璁㈠崟)',
  `o_sku_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '璁㈠崟鍟嗗搧ID(0涓烘暣涓??鍗?',
  `buyer_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '浼氬憳ID',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '閫??绫诲瀷(1锛氶?璐у苟閫??锛?锛氫粎閫??)',
  `amount` decimal(15,2) NOT NULL DEFAULT '0.00' COMMENT '閫??閲戦?',
  `cause` varchar(200) NOT NULL DEFAULT '' COMMENT '鍘熷洜',
  `desc` tinytext NOT NULL COMMENT '閫??鎻忚堪',
  `images` text NOT NULL COMMENT '鍞?悗浼犲浘',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '鐘舵?(-2锛氭湭閫氳繃锛?1锛氬凡鍙栨秷锛?锛氬緟瀹℃牳锛?锛氶?杩?',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '鐢宠?鏃堕棿',
  `admin_id` decimal(8,0) unsigned NOT NULL DEFAULT '0' COMMENT '瀹℃牳绠＄悊鍛業D',
  `admin_desc` varchar(200) NOT NULL DEFAULT '' COMMENT '鍚庡彴瀹℃牳鎻忚堪',
  `admin_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '瀹℃牳鏃堕棿',
  `system_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '绯荤粺鏃堕棿',
  PRIMARY KEY (`id`),
  KEY `order_sn` (`order_sn`) USING BTREE,
  KEY `order_goods_id` (`o_sku_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='璁㈠崟閫??';
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
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '涓婚敭ID',
  `refund_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '閫??id',
  `order_sn` char(20) NOT NULL DEFAULT '',
  `sub_sn` char(20) NOT NULL DEFAULT '' COMMENT '瀛愯?鍗曞彿',
  `o_sku_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '璁㈠崟鍟嗗搧ID',
  `action` varchar(50) NOT NULL DEFAULT '' COMMENT '鎿嶄綔绫诲瀷',
  `operator_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '鎿嶄綔鑰匢D',
  `operator_name` varchar(60) NOT NULL DEFAULT '' COMMENT '鎿嶄綔鑰呭悕绉',
  `operator_type` tinyint(1) unsigned NOT NULL DEFAULT '2' COMMENT '鎿嶄綔鑰呯被鍨?1:鍚庡彴绠＄悊鍛?2:浼氬憳3:鍟嗗?(棰勭暀))',
  `msg` text NOT NULL COMMENT '鏃ュ織璇︽儏',
  `system_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '鎿嶄綔鏃堕棿',
  `clientip` char(15) NOT NULL DEFAULT '' COMMENT '鎿嶄綔IP鍦板潃',
  PRIMARY KEY (`id`),
  KEY `order_sn` (`order_sn`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='璁㈠崟閫??鏃ュ織';
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
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '鑷??ID',
  `order_sn` char(20) NOT NULL DEFAULT '' COMMENT '涓昏?鍗曞彿',
  `sub_sn` char(20) NOT NULL DEFAULT '' COMMENT '瀛愯?鍗曞彿',
  `o_sku_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '璁㈠崟鍟嗗搧ID',
  `buyer_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '涔板?ID',
  `cause` varchar(200) NOT NULL DEFAULT '' COMMENT '閫?揣鍘熷洜',
  `number` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '閫?揣鏁伴噺',
  `amount` decimal(8,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '閫??閲戦?',
  `desc` tinytext NOT NULL COMMENT '浼氬憳閫?揣鎻忚堪',
  `images` text NOT NULL COMMENT '浼氬憳閫?揣浼犲浘',
  `delivery_name` varchar(50) NOT NULL DEFAULT '' COMMENT '蹇??鍚嶇О',
  `delivery_sn` varchar(50) NOT NULL DEFAULT '' COMMENT '蹇??鍙',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '鐘舵?(-2锛氭湭閫氳繃锛?1锛氬凡鍙栨秷锛?锛氬緟瀹℃牳锛?锛氶?杩囷紝2锛氬凡閫?揣)',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '鐢宠?鏃堕棿',
  `admin_id` decimal(8,0) unsigned NOT NULL DEFAULT '0' COMMENT '瀹℃牳绠＄悊鍛業D',
  `admin_desc` varchar(200) NOT NULL DEFAULT '' COMMENT '鍚庡彴瀹℃牳鎻忚堪',
  `admin_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '瀹℃牳鏃堕棿',
  `system_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '绯荤粺鏃堕棿',
  PRIMARY KEY (`id`),
  KEY `order_sn` (`order_sn`) USING BTREE,
  KEY `o_sku_id` (`o_sku_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='璁㈠崟閫?揣';
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
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '涓婚敭ID',
  `return_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '閫?揣ID',
  `order_sn` char(20) NOT NULL DEFAULT '',
  `sub_sn` char(20) NOT NULL DEFAULT '' COMMENT '瀛愯?鍗曞彿',
  `o_sku_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '璁㈠崟鍟嗗搧ID',
  `action` varchar(50) NOT NULL DEFAULT '' COMMENT '鎿嶄綔绫诲瀷',
  `operator_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '鎿嶄綔鑰匢D',
  `operator_name` varchar(60) NOT NULL DEFAULT '' COMMENT '鎿嶄綔鑰呭悕绉',
  `operator_type` tinyint(1) unsigned NOT NULL DEFAULT '2' COMMENT '鎿嶄綔鑰呯被鍨?1:鍚庡彴绠＄悊鍛?2:浼氬憳3:鍟嗗?(棰勭暀))',
  `msg` text NOT NULL COMMENT '鏃ュ織璇︽儏',
  `system_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '鎿嶄綔鏃堕棿',
  `clientip` char(15) NOT NULL DEFAULT '' COMMENT '鎿嶄綔IP鍦板潃',
  PRIMARY KEY (`id`),
  KEY `order_sn` (`order_sn`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='璁㈠崟閫?揣鏃ュ織';
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
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '涓婚敭id',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '鍞?悗绫诲瀷(1锛氶?璐у苟閫??锛?锛氫粎閫??)',
  `order_sn` char(20) NOT NULL DEFAULT '' COMMENT '涓昏?鍗曞彿',
  `sub_sn` char(20) NOT NULL DEFAULT '' COMMENT '瀛愯?鍗曞彿',
  `buyer_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '涔板?id',
  `return_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '閫?揣琛ㄤ富閿甶d',
  `refund_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '閫??琛ㄤ富閿甶d',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '鍞?悗鐘舵?(0锛氬?鐞嗕腑锛?锛氬畬鎴?',
  `o_sku_id` mediumint(8) NOT NULL DEFAULT '0' COMMENT '璁㈠崟鍟嗗搧ID',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='璁㈠崟鍞?悗绱㈠紩琛';
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
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '鑷??ID',
  `order_sn` char(20) NOT NULL DEFAULT '' COMMENT '涓昏?鍗曞彿',
  `sub_sn` char(20) NOT NULL DEFAULT '' COMMENT '瀛愯?鍗曞彿',
  `buyer_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '浼氬憳ID',
  `seller_id` mediumint(10) unsigned NOT NULL DEFAULT '0' COMMENT '鍗栧?ID',
  `sku_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '浜у搧ID',
  `sku_thumb` varchar(200) NOT NULL DEFAULT '' COMMENT '浜у搧缂╃暐鍥',
  `sku_barcode` varchar(30) NOT NULL DEFAULT '' COMMENT '浜у搧鐨勫敮涓?潯鐮?鍐欏叆鐩稿?搴斿晢鍝佹潯鐮?',
  `sku_name` varchar(200) NOT NULL DEFAULT '' COMMENT '浜у搧鍚嶇О',
  `sku_spec` text NOT NULL COMMENT '浜у搧瑙勬牸',
  `sku_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '閿?敭鍞?环',
  `real_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '搴斾粯閲戦?',
  `buy_nums` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '璐?拱鏁伴噺',
  `return_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '閫?揣id',
  `refund_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '閫??ID',
  `delivery_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '璁㈠崟鐗╂祦鍏宠仈id',
  `delivery_status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '鍙戣揣鐘舵?(0锛氬緟鍙戣揣锛?锛氬凡鍙戣揣锛?锛氬凡鏀惰揣)',
  `iscomment` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '鏄?惁璇勮?',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '绯荤粺鏃堕棿',
  `promotion` text NOT NULL COMMENT '淇冮攢娲诲姩璇︽儏',
  `is_give` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`) USING BTREE,
  KEY `order_sn` (`order_sn`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='璁㈠崟鍟嗗搧琛';
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
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '涓婚敭id',
  `order_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '涓昏?鍗昳d',
  `order_sn` varchar(100) NOT NULL DEFAULT '' COMMENT '涓昏?鍗曞彿',
  `sub_sn` char(20) NOT NULL DEFAULT '' COMMENT '瀛愯?鍗曞彿',
  `pay_type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '鏀?粯鏂瑰紡(1锛氬湪绾挎敮浠橈紝2锛氳揣鍒颁粯娆?',
  `buyer_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '涔板?id',
  `seller_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '鍗栧?id',
  `delivery_name` varchar(50) NOT NULL DEFAULT '' COMMENT '鐗╂祦鍚嶇О',
  `sku_price` decimal(15,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '鍟嗗搧鎬婚?',
  `delivery_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '鐗╂祦璐圭敤',
  `real_price` decimal(15,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '搴斾粯鎬婚?',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '璁㈠崟鐘舵?(1锛氭?甯革紝2锛氬彇娑堬紝3锛氬洖鏀讹紝4锛氬垹闄?',
  `pay_status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '鏀?粯鐘舵?',
  `confirm_status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '纭??鐘舵?(0锛氬緟纭??锛?锛氬凡纭??)',
  `delivery_status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '鍙戣揣鐘舵?(0锛氬緟鍙戣揣锛?锛氶儴鍒嗗彂璐э紝2锛氬凡鍙戣揣)',
  `finish_status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '瀹屾垚鐘舵?(0锛氬緟瀹屾垚锛?锛氶儴鍒嗗畬鎴愶紝2锛氬凡瀹屾垚)',
  `pay_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '鏀?粯鏃堕棿(鏃堕棿鎴?',
  `confirm_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '纭??璁㈠崟(鏃堕棿鎴?',
  `delivery_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '鍙戣揣鏃堕棿(鏃堕棿鎴?',
  `finish_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '瀹屾垚鏃堕棿(鏃堕棿鎴?',
  `system_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '绯荤粺鏃堕棿(鏃堕棿鎴?',
  `remark` varchar(200) NOT NULL DEFAULT '' COMMENT '澶囨敞',
  `promotion` text NOT NULL COMMENT '淇冮攢娲诲姩',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='瀛愯?鍗曡〃';
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
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '妯＄増鍚嶇О',
  `content` text NOT NULL COMMENT '鍐呭?',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '淇?敼鏃堕棿',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='鍙戣揣鍗曟ā鏉';
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
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '涓婚敭',
  `delivery_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '璁㈠崟鐗╂祦鍏宠仈ID',
  `order_sn` char(20) NOT NULL DEFAULT '' COMMENT '涓昏?鍗曞彿',
  `sub_sn` char(20) NOT NULL DEFAULT '' COMMENT '瀛愯?鍗曞彿',
  `time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '杩借釜鏃堕棿',
  `msg` text NOT NULL COMMENT '鍐呭?',
  `add_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '娣诲姞鏃堕棿',
  `clientip` char(15) NOT NULL DEFAULT '' COMMENT '鎿嶄綔IP',
  PRIMARY KEY (`id`),
  KEY `order_sn` (`order_sn`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='璁㈠崟璺熻釜';
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
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '鍚?敤鐘舵?',
  `config` text NOT NULL,
  `dateline` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '鏇存柊鏃堕棿',
  `sort` int(8) unsigned NOT NULL DEFAULT '100',
  `isonline` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '鏄?惁鍦ㄧ嚎鏀?粯',
  `applie` varchar(10) NOT NULL DEFAULT 'pc' COMMENT '瀹㈡埛绔?被鍨',
  PRIMARY KEY (`pay_code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='鏀?粯鏂瑰紡閰嶇疆淇℃伅';
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
  `dateline` int(10) unsigned DEFAULT '0' COMMENT '鏇存柊鏃堕棿',
  PRIMARY KEY (`pluginid`),
  UNIQUE KEY `identifier` (`identifier`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='鎻掍欢琛';
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='鎻掍欢鍙橀噺琛';
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
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '涓婚敭',
  `name` varchar(200) NOT NULL DEFAULT '' COMMENT '娲诲姩鍚嶇О',
  `start_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '寮??鏃堕棿',
  `end_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '缁撴潫鏃堕棿',
  `sku_ids` text NOT NULL COMMENT '鍟嗗搧鍒楄〃',
  `rules` text NOT NULL COMMENT '娲诲姩瑙勫垯',
  `share_order` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '鏄?惁鍙備笌璁㈠崟淇冮攢娲诲姩',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `sort` mediumint(8) unsigned NOT NULL DEFAULT '100',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='鍟嗗搧淇冮攢琛';
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
  `title` varchar(200) NOT NULL DEFAULT '' COMMENT '淇冮攢鏍囬?锛岀敤浜庡悗鍙版爣璇',
  `subtitle` varchar(50) NOT NULL DEFAULT '' COMMENT '鎹嗙粦閿?敭鍚嶇О锛岀敤浜庡墠鍙版樉绀',
  `sku_ids` varchar(200) NOT NULL DEFAULT '' COMMENT '鍙備笌鎹嗙粦閿?敭鐨勫晢鍝乻ku_id',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '寮?惎鐘舵?',
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
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '鑷?姩閫掑?',
  `name` varchar(250) NOT NULL DEFAULT '' COMMENT '淇冮攢鍚嶇О',
  `start_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '寮??鏃堕棿',
  `end_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '缁撴潫鏃堕棿',
  `type` smallint(1) unsigned NOT NULL DEFAULT '0' COMMENT '淇冮攢绫诲瀷(0锛氭弧棰濈珛鍑忥紱1锛氭弧棰濆厤閭?紱2锛氭弧棰濊禒绀?',
  `price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '婊¤冻閲戦?',
  `discount` varchar(10) NOT NULL DEFAULT '' COMMENT '浼樻儬椤圭洰',
  `dateline` int(10) NOT NULL COMMENT '娣诲姞鏃堕棿',
  `sort` mediumint(8) NOT NULL COMMENT '鎺掑簭',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='璁㈠崟淇冮攢';
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
  `start_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '寮??鏃堕棿',
  `end_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '缁撴潫鏃堕棿',
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
  `type` varchar(100) NOT NULL DEFAULT '' COMMENT '绫诲瀷/椹卞姩',
  `method` varchar(255) NOT NULL DEFAULT '' COMMENT '鏂规硶/鎿嶄綔',
  `params` text NOT NULL COMMENT '鍙傛暟',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '鐘舵?锛?1锛氬け璐ワ紱0锛氬緟鎵ц?锛?锛氬凡瀹屾垚锛',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '鏃堕棿鎴',
  `sort` smallint(6) unsigned NOT NULL DEFAULT '100' COMMENT '鎺掑簭锛堣秺灏忚秺鍏堟墽琛岋級',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='闃熷垪琛';
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='璁剧疆琛';
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
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '瑙勬牸id',
  `name` varchar(60) NOT NULL DEFAULT '' COMMENT '瑙勬牸鍚嶇О',
  `value` text NOT NULL COMMENT '瑙勬牸鍊',
  `img` text NOT NULL COMMENT '瑙勬牸鍥剧墖',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '瑙勬牸鐘舵?',
  `sort` mediumint(5) unsigned NOT NULL DEFAULT '100' COMMENT '瑙勬牸鎺掑簭',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='鍟嗗搧瑙勬牸';
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
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '妯″瀷ID',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '妯″瀷鍚嶇О',
  `content` text NOT NULL COMMENT '瑙勬牸',
  `sort` tinyint(1) unsigned NOT NULL DEFAULT '100' COMMENT '鎺掑簭',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '鐘舵?',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='鍟嗗搧妯″瀷';
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
  `mid` int(8) unsigned NOT NULL DEFAULT '0' COMMENT '浼氬憳ID',
  `mobile` char(11) NOT NULL DEFAULT '' COMMENT '鎵嬫満鍙',
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

-- Dump completed on 2016-04-21 11:25:42
