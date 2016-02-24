/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50545
Source Host           : localhost:3306
Source Database       : metprof

Target Server Type    : MYSQL
Target Server Version : 50545
File Encoding         : 65001

Date: 2016-02-24 19:06:28
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
  `creationdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of catalog
-- ----------------------------
INSERT INTO `catalog` VALUES ('1', 'AAA', 'aaa', '0', null, '0', '2016-02-24 16:18:59');
INSERT INTO `catalog` VALUES ('2', 'BBB', 'bbb', '0', null, '1', '2016-02-24 16:18:44');
INSERT INTO `catalog` VALUES ('3', 'CCC', 'ccc', '0', null, '1', '2016-02-24 16:18:45');
INSERT INTO `catalog` VALUES ('4', 'DDD', 'ddd', '0', null, '1', '2016-02-24 16:18:44');
INSERT INTO `catalog` VALUES ('5', 'A1', 'a1', '1', null, '1', '2016-02-24 16:18:46');
INSERT INTO `catalog` VALUES ('7', 'B1', 'b1', '2', null, '1', '2016-02-24 16:18:46');
INSERT INTO `catalog` VALUES ('8', 'B2', 'b2', '2', null, '1', '2016-02-24 16:18:47');
INSERT INTO `catalog` VALUES ('9', 'C1', 'c1', '3', null, '1', '2016-02-24 16:18:48');
INSERT INTO `catalog` VALUES ('10', 'D1', 'd1', '4', null, '1', '2016-02-24 16:18:48');
INSERT INTO `catalog` VALUES ('11', 'D2', 'd2', '4', null, '1', '2016-02-24 16:18:48');
INSERT INTO `catalog` VALUES ('12', 'D3', 'd3', '4', null, '1', '2016-02-24 16:18:49');
INSERT INTO `catalog` VALUES ('13', 'A11', 'a11', '5', null, '1', '2016-02-24 16:18:49');
INSERT INTO `catalog` VALUES ('14', 'B21', 'b21', '8', null, '1', '2016-02-24 16:18:49');
INSERT INTO `catalog` VALUES ('15', 'D11', 'd11', '10', null, '1', '2016-02-24 19:04:16');
INSERT INTO `catalog` VALUES ('16', 'D31', 'd31', '12', null, '1', '2016-02-24 16:18:51');

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

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` char(128) DEFAULT NULL,
  `salt` char(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', 'b9139a1e9c410e0d243917ddf404348bed9c8354d41de09661e3bb5777259c45ac742f19af4ce551cdf5c19ea00bcd81a846bdb84f68ce135079416ddbce0ab3', 'cb2867446e24e52bde2ab77246f1bd512baf7043e0d6765b5fb3d9db8256468a54f0ba5aa812bc10e6343ad5c003ef2e1cbd4ee207c1f85c3f0e1b436b499242');

-- ----------------------------
-- Table structure for `ware`
-- ----------------------------
DROP TABLE IF EXISTS `ware`;
CREATE TABLE `ware` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(500) DEFAULT NULL,
  `descr` text,
  `creationdate` datetime DEFAULT NULL,
  `updatedate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ware
-- ----------------------------
INSERT INTO `ware` VALUES ('1', 'ware1', null, null, null);
INSERT INTO `ware` VALUES ('2', 'ware2', null, null, null);
INSERT INTO `ware` VALUES ('3', 'ware3', null, null, null);
INSERT INTO `ware` VALUES ('4', 'ware4', null, null, null);
INSERT INTO `ware` VALUES ('5', 'ware5', null, null, null);
INSERT INTO `ware` VALUES ('6', 'ware6', null, null, null);
INSERT INTO `ware` VALUES ('7', 'ware7', null, null, null);

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
INSERT INTO `ware_catalog` VALUES ('1', '9');
INSERT INTO `ware_catalog` VALUES ('1', '16');
INSERT INTO `ware_catalog` VALUES ('2', '13');
INSERT INTO `ware_catalog` VALUES ('3', '13');
INSERT INTO `ware_catalog` VALUES ('4', '13');
INSERT INTO `ware_catalog` VALUES ('5', '14');
INSERT INTO `ware_catalog` VALUES ('6', '14');
INSERT INTO `ware_catalog` VALUES ('7', '15');
INSERT INTO `ware_catalog` VALUES ('7', '9');

-- ----------------------------
-- Table structure for `ware_image`
-- ----------------------------
DROP TABLE IF EXISTS `ware_image`;
CREATE TABLE `ware_image` (
  `image_id` int(11) NOT NULL AUTO_INCREMENT,
  `ware_id` int(11) NOT NULL,
  `extension` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`image_id`),
  KEY `idx_ware_id` (`ware_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ware_image
-- ----------------------------
