/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50545
Source Host           : localhost:3306
Source Database       : metprof

Target Server Type    : MYSQL
Target Server Version : 50545
File Encoding         : 65001

Date: 2016-03-03 19:25:33
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `catalog`
-- ----------------------------
DROP TABLE IF EXISTS `catalog`;
CREATE TABLE `catalog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(500) DEFAULT NULL,
  `descr` varchar(5000) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL,
  `isactive` tinyint(4) DEFAULT NULL,
  `creationdate` datetime DEFAULT NULL,
  `updatedate` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of catalog
-- ----------------------------
INSERT INTO `catalog` VALUES ('1', 'Р—Р°Р±РѕСЂС‹', '<p>aaaaa</p>', '0', null, '0', '2016-02-24 16:18:59', '2016-03-03 18:42:20');
INSERT INTO `catalog` VALUES ('2', 'РљРѕР·С‹СЂСЊРєРё', 'bbb', '0', null, '1', '2016-02-24 16:18:44', '2016-03-03 18:46:10');
INSERT INTO `catalog` VALUES ('3', 'РќР°РІРµСЃС‹', 'ccc', '0', null, '1', '2016-02-24 16:18:45', '2016-03-03 18:47:10');
INSERT INTO `catalog` VALUES ('4', 'Р‘РµСЃРµРґРєРё', 'ddd', '0', null, '1', '2016-02-24 16:18:44', '2016-03-03 18:47:21');
INSERT INTO `catalog` VALUES ('5', 'Р—Р°Р±РѕСЂС‹ РёР· РїСЂРѕС„РЅР°СЃС‚РёР»Р°', '<p>a1</p>', '1', null, '1', '2016-02-24 16:18:46', '2016-03-03 18:42:36');
INSERT INTO `catalog` VALUES ('20', 'Р—Р°Р±РѕСЂС‹ РёР· СЃРµС‚РєРё СЂР°Р±РёС†С‹', 'РІС‹Р°С„С‹РІР°', '1', null, '1', '2016-03-03 18:45:34', '2016-03-03 18:45:34');
INSERT INTO `catalog` VALUES ('21', 'Р—Р°Р±РѕСЂС‹ СЃРІР°СЂРЅС‹Рµ', 'С‹РІР°С„С‹РІР°', '1', null, '1', '2016-03-03 18:45:48', '2016-03-03 18:45:48');
INSERT INTO `catalog` VALUES ('22', 'Р РµС€С‘С‚РєРё РЅР° РѕРєРЅР°', 'С„С‹РІР°С‹РІ', '0', null, '0', '2016-03-03 18:47:39', '2016-03-03 18:47:39');
INSERT INTO `catalog` VALUES ('23', 'Р“Р°СЂР°Р¶РЅС‹Рµ РІРѕСЂРѕС‚Р°', 'СЏС‡СЃРјС‹Р°Рј', '0', null, '1', '2016-03-03 18:47:53', '2016-03-03 18:47:53');
INSERT INTO `catalog` VALUES ('24', 'РћРіСЂР°РґРєРё', 'РІР°РїРІР°', '0', null, '1', '2016-03-03 18:48:15', '2016-03-03 18:48:15');
INSERT INTO `catalog` VALUES ('25', 'РЎРєР°РјРµР№РєРё', 'С„С‹Р°РІС„Р°', '0', null, '1', '2016-03-03 18:48:29', '2016-03-03 18:48:34');
INSERT INTO `catalog` VALUES ('26', 'РўРµРїР»РёС†С‹', 'РІР°РїС‹РІР°Рї', '0', null, '1', '2016-03-03 18:48:55', '2016-03-03 18:48:55');

-- ----------------------------
-- Table structure for `catalog_files`
-- ----------------------------
DROP TABLE IF EXISTS `catalog_files`;
CREATE TABLE `catalog_files` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `catalog_id` int(11) NOT NULL,
  `filename` varchar(500) DEFAULT NULL,
  `is_main` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ware_id` (`catalog_id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of catalog_files
-- ----------------------------
INSERT INTO `catalog_files` VALUES ('25', '1', '800.jpg', '0');
INSERT INTO `catalog_files` VALUES ('31', '5', '800 (2).jpg', '0');
INSERT INTO `catalog_files` VALUES ('32', '5', '800 (3).jpg', '0');
INSERT INTO `catalog_files` VALUES ('52', '5', '800.jpg', '1');
INSERT INTO `catalog_files` VALUES ('57', '1', 'cat5.jpg', '1');
INSERT INTO `catalog_files` VALUES ('58', '22', 'cat3.jpg', '1');
INSERT INTO `catalog_files` VALUES ('59', '23', 'cat2.jpg', '1');
INSERT INTO `catalog_files` VALUES ('60', '2', 'cat1.jpg', '1');
INSERT INTO `catalog_files` VALUES ('61', '3', 'cat1 (1).jpg', '1');
INSERT INTO `catalog_files` VALUES ('62', '24', 'cat4.jpg', '1');
INSERT INTO `catalog_files` VALUES ('63', '25', 'cat1 (2).jpg', '1');
INSERT INTO `catalog_files` VALUES ('64', '26', 'cat6.jpg', '1');

-- ----------------------------
-- Table structure for `login_attempts`
-- ----------------------------
DROP TABLE IF EXISTS `login_attempts`;
CREATE TABLE `login_attempts` (
  `user_id` int(11) NOT NULL,
  `creationdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of login_attempts
-- ----------------------------
INSERT INTO `login_attempts` VALUES ('1', '2016-02-18 18:26:45');
INSERT INTO `login_attempts` VALUES ('1', '2016-02-18 18:29:53');
INSERT INTO `login_attempts` VALUES ('1', '2016-03-01 21:44:49');
INSERT INTO `login_attempts` VALUES ('1', '2016-03-01 21:45:02');
INSERT INTO `login_attempts` VALUES ('1', '2016-03-01 21:45:06');
INSERT INTO `login_attempts` VALUES ('1', '2016-03-01 21:45:10');
INSERT INTO `login_attempts` VALUES ('1', '2016-03-01 21:49:38');
INSERT INTO `login_attempts` VALUES ('1', '2016-03-03 18:41:32');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` char(128) DEFAULT NULL,
  `salt` char(128) DEFAULT NULL,
  `updatedate` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', 'da805c7edc2c5cbf8e07540c1c76428d37c824d320cc4502f273e64b2f62af355b7c35bcf6309260c3f6c0f442169f74d615c2c21750ba17243704e16fc4ffe8', 'ea5be85defa525aedf2d19c139e601bb2038e7d76f23018e5814dee6c571daabcf70d000b448e0b5298a55ebe4a078242364c2a15c65d1d0c7efb933c54d4454', '2016-03-01 22:47:17');

-- ----------------------------
-- Table structure for `ware`
-- ----------------------------
DROP TABLE IF EXISTS `ware`;
CREATE TABLE `ware` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(500) DEFAULT NULL,
  `descr` text,
  `creationdate` datetime DEFAULT NULL,
  `updatedate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `isactive` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ware
-- ----------------------------

-- ----------------------------
-- Table structure for `ware_catalog`
-- ----------------------------
DROP TABLE IF EXISTS `ware_catalog`;
CREATE TABLE `ware_catalog` (
  `ware_id` int(11) DEFAULT NULL,
  `catalog_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ware_catalog
-- ----------------------------

-- ----------------------------
-- Table structure for `ware_files`
-- ----------------------------
DROP TABLE IF EXISTS `ware_files`;
CREATE TABLE `ware_files` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ware_id` int(11) NOT NULL,
  `filename` varchar(500) DEFAULT NULL,
  `is_main` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ware_id` (`ware_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ware_files
-- ----------------------------
