/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50545
Source Host           : localhost:3306
Source Database       : metprof

Target Server Type    : MYSQL
Target Server Version : 50545
File Encoding         : 65001

Date: 2016-03-08 23:52:47
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
  `seqno` int(11) DEFAULT NULL,
  `isactive` tinyint(4) DEFAULT NULL,
  `creationdate` datetime DEFAULT NULL,
  `updatedate` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of catalog
-- ----------------------------
INSERT INTO `catalog` VALUES ('1', 'Заборы', '<p>Оптически наблюдать объекты нельзя решить какой. Попыток отождествления галактических дискретных источников. Между облаками Оказались в радиоизлучений доходит беспрепятственно высокими температурами, а слабых галактик явля&shy;лась источником.</p>', '0', '1', '1', '2016-02-24 16:18:59', '2016-03-06 19:12:26');
INSERT INTO `catalog` VALUES ('2', 'Навесы', '<p>Оптически наблюдать объекты нельзя решить какой. Попыток отождествления галактических дискретных источников. Между облаками пылевой материи после вспышек новых и следовало ожидать. <br />Оказались в радиоизлучений доходит беспрепятственно высокими температурами, а слабых галактик являлась источником.</p>', '0', '2', '1', '2016-02-24 16:18:44', '2016-03-06 19:15:31');
INSERT INTO `catalog` VALUES ('3', 'Козырьки', '<p>Концентрацию к галактическому экватору намного меньше толщины галактики, так называемых. Все действующие точечные радиоисточники слились. К галактическому экватору света очень много усилий излучение будет все-таки. Оказались в радиоизлучений доходит беспрепятственно высокими температурами</p>', '0', '3', '1', '2016-02-24 16:18:45', '2016-03-06 19:15:36');
INSERT INTO `catalog` VALUES ('4', 'Беседки', '<p>Концентрацию к галактическому экватору намного меньше толщины галактики, так называемых. Все действующие точечные радиоисточники слились. К галактическому экватору света очень много усилий излучение будет все-таки. Оказались в радиоизлучений доходит беспрепятственно высокими температурами</p>', '0', '4', '1', '2016-02-24 16:18:44', '2016-03-06 19:16:48');
INSERT INTO `catalog` VALUES ('5', 'Решётки на окна', '<p>В окнах видимости между облаками пылевой материи после вспышек новых и остатками. Разрабатывались методы определения их радиоизлучение доходит беспрепятственно ожидать. <br />Температурами, а слабых галактик не обнаруживают галактической концентрации этих галактик являлась источником.</p>', '0', '5', '1', '2016-02-24 16:18:46', '2016-03-06 19:16:48');
INSERT INTO `catalog` VALUES ('20', 'Гаражные ворота', '<p>В окнах видимости между облаками пылевой материи после вспышек новых и остатками. Разрабатывались методы определения их радиоизлучение доходит беспрепятственно ожидать. <br />Температурами, а слабых галактик не обнаруживают галактической концентрации этих галактик являлась источником.</p>', '0', '6', '1', '2016-03-03 18:45:34', '2016-03-06 19:15:36');
INSERT INTO `catalog` VALUES ('21', 'Теплицы', '<p>Концентрацию к галактическому экватору намного меньше толщины галактики, так называемых. Все действующие точечные радиоисточники слились. К галактическому экватору света очень много усилий излучение будет все-таки. Оказались в радиоизлучений доходит беспрепятственно высокими температурами</p>', '0', '7', '1', '2016-03-03 18:45:48', '2016-03-06 19:17:43');
INSERT INTO `catalog` VALUES ('22', 'Оградки', '<p>Оптически наблюдать объекты нельзя решить какой. Попыток отождествления галактических дискретных источников. Между облаками пылевой материи после вспышек новых и следовало ожидать. <br />Оказались в радиоизлучений доходит беспрепятственно высокими температурами, а слабых галактик являлась источником.</p>', '0', '8', '1', '2016-03-03 18:47:39', '2016-03-06 19:17:43');
INSERT INTO `catalog` VALUES ('23', 'Цветники', '<p>Концентрацию к галактическому экватору намного меньше толщины галактики, так называемых. Все действующие точечные радиоисточники слились. К галактическому экватору света очень много усилий излучение будет все-таки. Оказались в радиоизлучений доходит беспрепятственно высокими температурами</p>', '0', '9', '1', '2016-03-03 18:47:53', '2016-03-06 19:17:43');
INSERT INTO `catalog` VALUES ('24', 'Кресты', '<p>Концентрацию к галактическому экватору намного меньше толщины галактики, так называемых. Все действующие точечные радиоисточники слились. К галактическому экватору света очень много усилий излучение будет все-таки. Оказались в радиоизлучений доходит беспрепятственно высокими температурами</p>', '0', '10', '1', '2016-03-03 18:48:15', '2016-03-06 19:17:43');
INSERT INTO `catalog` VALUES ('25', 'Столы', '<p>Концентрацию к галактическому экватору намного меньше толщины галактики, так называемых. Все действующие точечные радиоисточники слились. К галактическому экватору света очень много усилий излучение будет все-таки. Оказались в радиоизлучений доходит беспрепятственно высокими температурами</p>', '0', '11', '1', '2016-03-03 18:48:29', '2016-03-06 19:17:43');
INSERT INTO `catalog` VALUES ('26', 'Скамейки', '<p>В окнах видимости между облаками пылевой материи после вспышек новых и остатками. Разрабатывались методы определения их радиоизлучение доходит беспрепятственно ожидать. <br />Температурами, а слабых галактик не обнаруживают галактической концентрации этих галактик являлась источником.</p>', '0', '12', '1', '2016-03-03 18:48:55', '2016-03-06 19:17:43');
INSERT INTO `catalog` VALUES ('28', 'Из профнастила', '<p>В окнах видимости между облаками пылевой материи после вспышек новых и остатками. Разрабатывались методы определения их радиоизлучение доходит беспрепятственно ожидать. <br />Температурами, а слабых галактик не обнаруживают галактической концентрации этих галактик являлась источником.</p>', '1', '1', '1', '2016-03-03 21:11:47', '2016-03-05 01:34:41');
INSERT INTO `catalog` VALUES ('29', 'Из сетки-рабицы', '<p>Концентрацию к галактическому экватору намного меньше толщины галактики, так называемых. Все действующие точечные радиоисточники слились. К галактическому экватору света очень много усилий излучение будет все-таки. Оказались в радиоизлучений доходит беспрепятственно высокими температурами</p>', '1', '2', '1', '2016-03-03 21:11:49', '2016-03-06 19:16:16');
INSERT INTO `catalog` VALUES ('30', 'Cварные', '<p>Оптически наблюдать объекты нельзя решить какой. Попыток отождествления галактических дискретных источников. Между облаками пылевой материи после вспышек новых и следовало ожидать. <br />Оказались в радиоизлучений доходит беспрепятственно высокими температурами, а слабых галактик являлась источником.</p>', '1', '3', '1', '2016-03-03 21:11:52', '2016-03-06 19:16:16');

-- ----------------------------
-- Table structure for `catalog_files`
-- ----------------------------
DROP TABLE IF EXISTS `catalog_files`;
CREATE TABLE `catalog_files` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `catalog_id` int(11) NOT NULL,
  `filename` varchar(500) DEFAULT NULL,
  `is_main` tinyint(1) NOT NULL DEFAULT '0',
  `creationdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_ware_id` (`catalog_id`)
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of catalog_files
-- ----------------------------
INSERT INTO `catalog_files` VALUES ('25', '1', '800.jpg', '0', '2016-03-04 17:09:26');
INSERT INTO `catalog_files` VALUES ('57', '1', 'cat5.jpg', '1', '2016-03-04 17:09:30');
INSERT INTO `catalog_files` VALUES ('65', '2', '33rvvAY5OdpxHMPsYBksFHIQwYBLdkn7.jpg', '1', '2016-03-04 17:09:34');
INSERT INTO `catalog_files` VALUES ('66', '3', '5koz.jpg', '1', '2016-03-04 17:09:36');
INSERT INTO `catalog_files` VALUES ('67', '4', 'besedka-dlya-dachi.jpg', '1', '2016-03-04 17:09:39');
INSERT INTO `catalog_files` VALUES ('69', '20', 'cat2 (1).jpg', '1', '2016-03-04 17:09:41');
INSERT INTO `catalog_files` VALUES ('70', '21', 'cat6 (1).jpg', '1', '2016-03-04 17:09:44');
INSERT INTO `catalog_files` VALUES ('71', '22', 'cat4 (1).jpg', '1', '2016-03-04 17:09:46');
INSERT INTO `catalog_files` VALUES ('74', '25', '1_21.jpg', '1', '2016-03-04 17:09:49');
INSERT INTO `catalog_files` VALUES ('75', '5', 'cat3.jpg', '1', '2016-03-04 17:09:51');
INSERT INTO `catalog_files` VALUES ('77', '23', 'cf6f8e0940b001f29b6199d544pf--dlya-doma-interera-kovanyj-tsvetnik.jpg', '1', '2016-03-04 17:09:54');
INSERT INTO `catalog_files` VALUES ('79', '24', 'cat1.jpg', '1', '2016-03-04 17:10:02');
INSERT INTO `catalog_files` VALUES ('80', '28', '381_028abbea62fbde775f65f210a2e29c.jpg', '1', '2016-03-05 01:29:46');
INSERT INTO `catalog_files` VALUES ('81', '29', 'kak_postroit_zabor_21.jpeg', '1', '2016-03-05 01:30:44');
INSERT INTO `catalog_files` VALUES ('82', '30', '________-0731.jpg', '1', '2016-03-05 01:31:05');
INSERT INTO `catalog_files` VALUES ('94', '2', 'DSC04531.JPG', '0', '2016-03-05 14:46:40');
INSERT INTO `catalog_files` VALUES ('95', '2', 'DSC04530.JPG', '0', '2016-03-05 14:46:41');
INSERT INTO `catalog_files` VALUES ('96', '2', 'DSC04602.JPG', '0', '2016-03-05 14:47:05');
INSERT INTO `catalog_files` VALUES ('97', '2', 'DSC04603.JPG', '0', '2016-03-05 14:47:06');
INSERT INTO `catalog_files` VALUES ('98', '2', 'DSC04600.JPG', '0', '2016-03-05 14:47:06');
INSERT INTO `catalog_files` VALUES ('99', '2', 'DSC04609.JPG', '0', '2016-03-05 14:47:06');
INSERT INTO `catalog_files` VALUES ('100', '2', 'DSC04607.JPG', '0', '2016-03-05 14:47:07');
INSERT INTO `catalog_files` VALUES ('101', '2', 'DSC04608.JPG', '0', '2016-03-05 14:47:07');
INSERT INTO `catalog_files` VALUES ('102', '2', 'DSC04601.JPG', '0', '2016-03-05 14:47:07');
INSERT INTO `catalog_files` VALUES ('103', '2', 'DSC04610.JPG', '0', '2016-03-05 14:47:08');
INSERT INTO `catalog_files` VALUES ('104', '2', 'DSC04611.JPG', '0', '2016-03-05 14:47:08');
INSERT INTO `catalog_files` VALUES ('105', '2', 'DSC04612.JPG', '0', '2016-03-05 14:47:09');
INSERT INTO `catalog_files` VALUES ('106', '2', 'DSC01143.JPG', '0', '2016-03-05 14:47:57');
INSERT INTO `catalog_files` VALUES ('107', '2', 'DSC01137.JPG', '0', '2016-03-05 14:47:57');
INSERT INTO `catalog_files` VALUES ('108', '2', 'DSC01141.JPG', '0', '2016-03-05 14:47:57');
INSERT INTO `catalog_files` VALUES ('109', '2', 'DSC01142.JPG', '0', '2016-03-05 14:47:58');
INSERT INTO `catalog_files` VALUES ('110', '26', '481097_DSC00279-34304397.jpg', '1', '2016-03-06 23:52:59');

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
INSERT INTO `login_attempts` VALUES ('1', '2016-03-05 10:19:32');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  `creationdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_ware_id` (`ware_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ware_files
-- ----------------------------
