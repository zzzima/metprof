/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50545
Source Host           : localhost:3306
Source Database       : metprof

Target Server Type    : MYSQL
Target Server Version : 50545
File Encoding         : 65001

Date: 2016-03-04 00:35:59
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
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of catalog
-- ----------------------------
INSERT INTO `catalog` VALUES ('1', 'Заборы', '<p>aaaaa</p>', '0', null, '1', '2016-02-24 16:18:59', '2016-03-03 21:13:08');
INSERT INTO `catalog` VALUES ('2', 'Навесы', 'bbb', '0', null, '1', '2016-02-24 16:18:44', '2016-03-03 21:09:33');
INSERT INTO `catalog` VALUES ('3', 'Козырьки', 'ccc', '0', null, '1', '2016-02-24 16:18:45', '2016-03-03 21:09:37');
INSERT INTO `catalog` VALUES ('4', 'Беседки', 'ddd', '0', null, '1', '2016-02-24 16:18:44', '2016-03-03 21:09:41');
INSERT INTO `catalog` VALUES ('5', 'Решётки на окна', '<p>a1</p>', '0', null, '1', '2016-02-24 16:18:46', '2016-03-03 21:11:28');
INSERT INTO `catalog` VALUES ('20', 'Гаражные ворота', 'fgdsfg', '0', null, '1', '2016-03-03 18:45:34', '2016-03-03 21:11:29');
INSERT INTO `catalog` VALUES ('21', 'Теплицы', 'dfgsdfg', '0', null, '1', '2016-03-03 18:45:48', '2016-03-03 21:11:30');
INSERT INTO `catalog` VALUES ('22', 'Оградки', 'dfgsdfg', '0', null, '1', '2016-03-03 18:47:39', '2016-03-03 21:27:02');
INSERT INTO `catalog` VALUES ('23', 'Цветники', 'dfg', '0', null, '1', '2016-03-03 18:47:53', '2016-03-03 21:12:34');
INSERT INTO `catalog` VALUES ('24', 'Кресты', 'fgdfg', '0', null, '1', '2016-03-03 18:48:15', '2016-03-03 21:12:39');
INSERT INTO `catalog` VALUES ('25', 'Столы', 'dfgsdfg', '0', null, '1', '2016-03-03 18:48:29', '2016-03-03 21:12:44');
INSERT INTO `catalog` VALUES ('26', 'Скамейки', 'fdgsdfgsd', '0', null, '1', '2016-03-03 18:48:55', '2016-03-03 21:12:55');
INSERT INTO `catalog` VALUES ('28', 'Заборы из профнастила', null, '1', null, '1', '2016-03-03 21:11:47', '2016-03-03 21:11:57');
INSERT INTO `catalog` VALUES ('29', 'Заборы из сетки-рабицы', null, '1', null, '1', '2016-03-03 21:11:49', '2016-03-03 21:11:58');
INSERT INTO `catalog` VALUES ('30', 'Заборы сварные', null, '1', null, '1', '2016-03-03 21:11:52', '2016-03-03 21:12:26');

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
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of catalog_files
-- ----------------------------
INSERT INTO `catalog_files` VALUES ('25', '1', '800.jpg', '0');
INSERT INTO `catalog_files` VALUES ('57', '1', 'cat5.jpg', '1');
INSERT INTO `catalog_files` VALUES ('65', '2', '33rvvAY5OdpxHMPsYBksFHIQwYBLdkn7.jpg', '1');
INSERT INTO `catalog_files` VALUES ('66', '3', '5koz.jpg', '1');
INSERT INTO `catalog_files` VALUES ('67', '4', 'besedka-dlya-dachi.jpg', '1');
INSERT INTO `catalog_files` VALUES ('69', '20', 'cat2 (1).jpg', '1');
INSERT INTO `catalog_files` VALUES ('70', '21', 'cat6 (1).jpg', '1');
INSERT INTO `catalog_files` VALUES ('71', '22', 'cat4 (1).jpg', '1');
INSERT INTO `catalog_files` VALUES ('74', '25', '1_21.jpg', '1');
INSERT INTO `catalog_files` VALUES ('75', '5', 'cat3.jpg', '1');
INSERT INTO `catalog_files` VALUES ('77', '23', 'cf6f8e0940b001f29b6199d544pf--dlya-doma-interera-kovanyj-tsvetnik.jpg', '1');
INSERT INTO `catalog_files` VALUES ('78', '26', '121.jpg', '1');
INSERT INTO `catalog_files` VALUES ('79', '24', 'cat1.jpg', '1');

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
