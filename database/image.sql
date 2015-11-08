/*
Navicat MySQL Data Transfer

Source Server         : homestead
Source Server Version : 50619
Source Host           : localhost:33060
Source Database       : image

Target Server Type    : MYSQL
Target Server Version : 50619
File Encoding         : 65001

Date: 2015-11-08 23:56:26
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(16) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(10) NOT NULL,
  `email` varchar(100) NOT NULL,
  `role` smallint(5) unsigned DEFAULT NULL,
  `status` tinyint(1) unsigned DEFAULT '1' COMMENT '1=正常，2=冻结',
  PRIMARY KEY (`uid`),
  UNIQUE KEY `username` (`username`),
  KEY `group` (`role`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'aura', '1fee67c9db1a13f94d805bbe02eb19cbe7592566', 'de5746d632', 'aura', '1', '1');
INSERT INTO `admin` VALUES ('3', 'lenovo', 'db36bd92248ee133ac2772f446aee712938a7647', 'a3e563ec5a', 'lenovo', '1', '1');
INSERT INTO `admin` VALUES ('4', 'portal', 'dfc911cd7b2d1dd58511a1666e29b8b5a6f730d9', 'a7ccd884d0', 'portal', '1', '1');

-- ----------------------------
-- Table structure for `admin_hold`
-- ----------------------------
DROP TABLE IF EXISTS `admin_hold`;
CREATE TABLE `admin_hold` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `ip` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin_hold
-- ----------------------------
INSERT INTO `admin_hold` VALUES ('7', '1', 'login', '::1', '2014-10-12 14:54:41', '2014-10-12 14:54:41');
INSERT INTO `admin_hold` VALUES ('6', '1', 'attempt_login', '::1', '2014-09-24 13:51:41', '2014-09-24 13:51:41');

-- ----------------------------
-- Table structure for `admin_log_login`
-- ----------------------------
DROP TABLE IF EXISTS `admin_log_login`;
CREATE TABLE `admin_log_login` (
  `logid` int(11) NOT NULL AUTO_INCREMENT COMMENT 'logid',
  `username` varchar(30) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `loginip` varchar(20) NOT NULL DEFAULT '',
  `logintime` int(11) NOT NULL DEFAULT '0',
  `password` varchar(30) NOT NULL DEFAULT '',
  `loginauth` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`logid`)
) ENGINE=InnoDB AUTO_INCREMENT=273 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin_log_login
-- ----------------------------

-- ----------------------------
-- Table structure for `admin_session`
-- ----------------------------
DROP TABLE IF EXISTS `admin_session`;
CREATE TABLE `admin_session` (
  `session_id` varchar(40) NOT NULL DEFAULT '0',
  `ip_address` varchar(16) NOT NULL DEFAULT '0',
  `user_agent` varchar(120) NOT NULL,
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  `user_data` text,
  PRIMARY KEY (`session_id`),
  KEY `last_activity_idx` (`last_activity`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin_session
-- ----------------------------

-- ----------------------------
-- Table structure for `image`
-- ----------------------------
DROP TABLE IF EXISTS `image`;
CREATE TABLE `image` (
  `fid` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `origin_name` varchar(1024) NOT NULL,
  `sn` varchar(100) NOT NULL,
  `order` int(11) DEFAULT NULL,
  `path` varchar(1024) NOT NULL,
  `size` int(11) DEFAULT NULL,
  `server` int(1) NOT NULL,
  `ip` varchar(15) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`fid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of image
-- ----------------------------

-- ----------------------------
-- Table structure for `server`
-- ----------------------------
DROP TABLE IF EXISTS `server`;
CREATE TABLE `server` (
  `id` tinyint(4) DEFAULT NULL,
  `ip` varchar(15) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `display_name` varchar(255) DEFAULT NULL,
  `description` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of server
-- ----------------------------
