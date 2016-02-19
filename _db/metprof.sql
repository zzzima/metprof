/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50545
Source Host           : localhost:3306
Source Database       : metprof

Target Server Type    : MYSQL
Target Server Version : 50545
File Encoding         : 65001

Date: 2016-02-19 17:51:36
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of catalog
-- ----------------------------
INSERT INTO `catalog` VALUES ('1', 'AAA', 'aaa', '0', null);
INSERT INTO `catalog` VALUES ('2', 'BBB', 'bbb', '0', null);
INSERT INTO `catalog` VALUES ('3', 'CCC', 'ccc', '0', null);

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
