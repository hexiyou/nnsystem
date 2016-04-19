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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-04-19 16:59:51
