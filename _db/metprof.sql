/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50545
Source Host           : localhost:3306
Source Database       : metprof

Target Server Type    : MYSQL
Target Server Version : 50545
File Encoding         : 65001

Date: 2016-03-01 23:34:17
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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of catalog
-- ----------------------------
INSERT INTO `catalog` VALUES ('1', 'AAAA', 'aaaaa', '0', null, '0', '2016-02-24 16:18:59', '2016-02-27 16:23:46');
INSERT INTO `catalog` VALUES ('2', 'BBBB', 'bbb', '0', null, '1', '2016-02-24 16:18:44', '2016-02-27 19:18:01');
INSERT INTO `catalog` VALUES ('3', 'CCC', 'ccc', '0', null, '1', '2016-02-24 16:18:45', null);
INSERT INTO `catalog` VALUES ('4', 'DDD', 'ddd', '0', null, '1', '2016-02-24 16:18:44', null);
INSERT INTO `catalog` VALUES ('5', 'A1', 'a1', '1', null, '1', '2016-02-24 16:18:46', null);
INSERT INTO `catalog` VALUES ('7', 'B1', 'b1', '2', null, '1', '2016-02-24 16:18:46', null);
INSERT INTO `catalog` VALUES ('8', 'B2', 'b2', '2', null, '1', '2016-02-24 16:18:47', null);
INSERT INTO `catalog` VALUES ('9', 'C1', 'c1', '3', null, '1', '2016-02-24 16:18:48', null);
INSERT INTO `catalog` VALUES ('10', 'D1', 'd1', '4', null, '1', '2016-02-24 16:18:48', null);
INSERT INTO `catalog` VALUES ('11', 'D2', 'd2', '4', null, '1', '2016-02-24 16:18:48', null);
INSERT INTO `catalog` VALUES ('12', 'D3', 'd3', '4', null, '1', '2016-02-24 16:18:49', null);
INSERT INTO `catalog` VALUES ('13', 'A11', 'a11', '5', 'image.jpg', '1', '2016-02-25 23:13:33', '2016-02-27 16:07:19');
INSERT INTO `catalog` VALUES ('14', 'B21', 'b21', '8', null, '1', '2016-02-24 16:18:49', null);
INSERT INTO `catalog` VALUES ('15', 'D11', 'd11', '10', null, '1', '2016-02-24 19:04:16', null);
INSERT INTO `catalog` VALUES ('16', 'D31', 'd31', '12', null, '1', '2016-02-24 16:18:51', null);
INSERT INTO `catalog` VALUES ('17', 'A12', 'a12a12a2', '5', null, '1', '2016-02-27 21:06:17', '2016-02-27 21:06:17');
INSERT INTO `catalog` VALUES ('19', 'A121', 'test', '17', null, '1', '2016-03-01 23:15:37', '2016-03-01 23:15:37');

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
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of catalog_files
-- ----------------------------
INSERT INTO `catalog_files` VALUES ('3', '7', '800.jpg', '0');
INSERT INTO `catalog_files` VALUES ('25', '1', '800.jpg', '0');
INSERT INTO `catalog_files` VALUES ('27', '13', '0_8abc3_81986c03_XL.jpg', '0');
INSERT INTO `catalog_files` VALUES ('28', '17', '1269.jpg', '0');
INSERT INTO `catalog_files` VALUES ('31', '5', '800 (2).jpg', '0');
INSERT INTO `catalog_files` VALUES ('32', '5', '800 (3).jpg', '0');
INSERT INTO `catalog_files` VALUES ('52', '5', '800.jpg', '1');
INSERT INTO `catalog_files` VALUES ('55', '19', '1_hvC58K3K.jpg', '1');
INSERT INTO `catalog_files` VALUES ('56', '19', '0_8abc3_81986c03_XL (2).jpg', '0');

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
