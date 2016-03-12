/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50545
Source Host           : localhost:3306
Source Database       : metprof

Target Server Type    : MYSQL
Target Server Version : 50545
File Encoding         : 65001

Date: 2016-03-12 19:12:15
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
INSERT INTO `catalog` VALUES ('2', 'Навесы', '<p>Навес &mdash; это архитектурный объект, который располагается на несущих опорах,&nbsp; применяется в самых различных целях.<br />Функциональное предназначение &mdash; В большинстве случаев его изготавливают при отсутствии гаража с накрытием на даче или для того, чтобы защитить площадку для отдыха от сильных лучей солнца, дождя и снега. <br />Современные красивые навесы &mdash; это еще и декоративные элементы дворика. Аккуратный навес, гармонично вписанный в общий стиль участка, долго будет служить местом отдыха для всех членов семьи.</p>', '0', '2', '1', '2016-02-24 16:18:44', '2016-03-12 17:26:09');
INSERT INTO `catalog` VALUES ('3', 'Козырьки', '<p>Козырек представляет собой небольшую пристройку, которую устанавливают над дверью или окнами, и главным отличием является то, что он крепится не на опорных стойках, а за счет кронштейнов к стене.<br />Очень часто он служит последним декоративным штрихом, делающим замысел хозяина дома завершенным. Для дачи или дома различают следующие виды навесных конструкций: В зависимости от размещения: пристроенные, отдельно размещенные и встроенные. Если пристроенные устанавливаются к стенам здания над крыльцом или входной дверью, то отдельно размещенные устанавливаются отдельно от дома. В зависимости от формы: навес с наклоном, прямой или другой более сложной формы. Такие конструкции могут быть как функциональными, так и декоративными элементами. Декоративные представляют собой художественную композицию, которая сочетается с другими дачными или придомовыми элементами и выступает украшением ландшафтного дизайна.</p>', '0', '3', '1', '2016-02-24 16:18:45', '2016-03-12 17:30:43');
INSERT INTO `catalog` VALUES ('4', 'Беседки', '<p>В солнечный жаркий день, у многих из нас нередко возникает желание найти место для отдыха на свежем воздухе. Удачным решением обустройства такого уютного уголка на открытом воздухе станет беседка из металла. Изящная конструкция не будет закрывать собой живописный пейзаж или вид на дом. Главным преимуществом беседок для дачи из металла является их прочность и долговечность, они легкие, могут иметь самую различную форму и цвет, своей красотой они привлекают восторженные взгляды соседей и гостей.</p>', '0', '4', '1', '2016-02-24 16:18:44', '2016-03-12 17:33:29');
INSERT INTO `catalog` VALUES ('5', 'Решётки на окна', '<p>Решетки на окнах загородного дома или квартиры на первом этаже &ndash; это не только гарантия безопасности и неприкосновенности жилища. Решетки могут стать декоративным элементом, украшающим окна и придающим ему шарм и индивидуальность. Решетки могут быть как глухими, жестко закрепленными в стене, так и распашными, запирающимися изнутри. Целесообразность установки решеток на окна очевидна. Это безопасность и спокойствие живущих в доме людей.&nbsp;</p>', '0', '5', '1', '2016-02-24 16:18:46', '2016-03-12 17:34:31');
INSERT INTO `catalog` VALUES ('20', 'Гаражные ворота', '<p>Металлические распашные гаражные ворота являются классикой гаражного строительства. При учете нынешних цен на гаражные ворота, все больше и больше автомобилистов принимает решение установить гаражные ворота распашные. &nbsp;<br />Преимущество таких ворот:&nbsp; простота конструкции, высокая надёжность, отличная ремонтопригодность, простота эксплуатации, даже замены, а также невысокая цена.&nbsp;</p>', '0', '6', '1', '2016-03-03 18:45:34', '2016-03-12 17:35:10');
INSERT INTO `catalog` VALUES ('21', 'Теплицы', '<p>Мы предлагаем&nbsp; теплицы повышенной прочности. Каркас&nbsp; теплицы изготовлен полностью из профильной трубы сечением&nbsp; 25*25*1.5 мм. Каркас теплицы окрашен в алкидный Сурик. Укрывным материалом служит&nbsp; качественный&nbsp; поликарбонат&nbsp; толщиной 4 мм&nbsp; марки \"АКТУАЛЬ Bio\". г. Казань.<br />Такие изделия, как теплицы под поликарбонат, обеспечат стабильную температуру для ваших растений и позволят снять немалый урожай. <br /><br /></p>', '0', '7', '1', '2016-03-03 18:45:48', '2016-03-12 17:29:27');
INSERT INTO `catalog` VALUES ('22', 'Оградки', '<p>Оградки применяются в качестве небольшого заборчика для ограждения декоративных клумб или на могилу.&nbsp; Они помогают защитить нежные цветы от варварского отношения. Даже на кладбище посаженные кусты долголетних цветов нередко огораживают именно такими оградками. Для роли \"защитников\" лучше всего подходят оградки из металла, которые не боятся ни ветра, ни снега, ни бури и даже бродячих собак или других животных. Такая металлическая ограда состоит из секций, калитки и столбов конструкция сборно-разборная для облегчения доставки и установки. <br />Оградки бывают нескольких видов. Какая из них наиболее подходящая, решать вам. Цены на оградку рассчитывают, исходя из погонных метров и материала, который использовался при изготовлении.<br />Наша фирма занимается не только изготовлением оград, но по желанию клиента можем также изготовить столики, скамейки, кресты и цветники.</p>', '0', '8', '1', '2016-03-03 18:47:39', '2016-03-12 17:32:24');
INSERT INTO `catalog` VALUES ('23', 'Цветники', '<p>Металлический&nbsp; цветник &ndash; необходимый атрибут ритуального захоронения, который идеально сочетается с могильной оградкой и ритуальным крестом.<br />Цветник, или как его еще называют, цветочница, устанавливается на могилу как альтернатива надгробной плите. Он представляет собой невысокое ограждение по периметру места захоронения. Чтобы могила смотрелась красиво и ухожено, пространство цветника можно засыпать декоративным гравием, но традиционно в него высаживают цветы. </p>', '0', '9', '1', '2016-03-03 18:47:53', '2016-03-12 17:35:38');
INSERT INTO `catalog` VALUES ('24', 'Кресты', '<p>Концентрацию к галактическому экватору намного меньше толщины галактики, так называемых. Все действующие точечные радиоисточники слились. К галактическому экватору света очень много усилий излучение будет все-таки. Оказались в радиоизлучений доходит беспрепятственно высокими температурами</p>', '0', '10', '1', '2016-03-03 18:48:15', '2016-03-06 19:17:43');
INSERT INTO `catalog` VALUES ('25', 'Столы', '<p>Концентрацию к галактическому экватору намного меньше толщины галактики, так называемых. Все действующие точечные радиоисточники слились. К галактическому экватору света очень много усилий излучение будет все-таки. Оказались в радиоизлучений доходит беспрепятственно высокими температурами</p>', '0', '11', '1', '2016-03-03 18:48:29', '2016-03-06 19:17:43');
INSERT INTO `catalog` VALUES ('26', 'Скамейки', '<p>В окнах видимости между облаками пылевой материи после вспышек новых и остатками. Разрабатывались методы определения их радиоизлучение доходит беспрепятственно ожидать. <br />Температурами, а слабых галактик не обнаруживают галактической концентрации этих галактик являлась источником.</p>', '0', '12', '1', '2016-03-03 18:48:55', '2016-03-06 19:17:43');
INSERT INTO `catalog` VALUES ('28', 'Из профнастила', '<p>Забор из профнастила можно быстро установить. За таким забором хозяева чувствуют себя комфортно &ndash; он защищает от пыли проезжей части, шумапорывов ветра, любопытных глаз посторонних людей, являясь довольно крепким. Забор из профнастила можно сделать высоким.&nbsp; Благодаря всему этому заборы из профнастила пользуются всё большей популярностью.</p>', '1', '1', '1', '2016-03-03 21:11:47', '2016-03-12 17:22:23');
INSERT INTO `catalog` VALUES ('29', 'Из сетки-рабицы', '<p>Неплохой вариант&nbsp; оградить участок забором из оцинкованной сетки рабицы. Оцинкованная сетка рабица не поддается коррозии. Именно поэтому пользуется повсеместной популярностью.Он не будет препятствовать проникновению солнечных лучей и движению воздушных масс. Подобные заборы популярны не только среди дачников, но и используются для ограждения технических зон, спортивных площадок, озер&nbsp; и других водоемов, курятников и других объектов</p>', '1', '2', '1', '2016-03-03 21:11:49', '2016-03-12 17:24:40');
INSERT INTO `catalog` VALUES ('30', 'Cварные', '<p>Сварные заборы, а также другие ограждения из металла, отлично вписываются в ландшафтный дизайн любого земельного участка. Подобными конструкциями можно огородить всю территорию, сад, хозяйственную часть участка и даже небольшие клумбы.&nbsp; Кроме того, любой сварной забор может обеспечить максимальное сочетание с архитектурой участка, так как вы можете самостоятельно нарисовать и предоставить эскизы сварных заборов. Это будет намного дешевле, чем установить кованый или другой декоративный забор, но поверьте, по внешним данным вы ничего не потеряете. Не портят они и внешний вид участка, ведь всегда можно заказать забор из гнутых металлических прутьев, оригинальный сварной забор из профильной трубы, а также разбавить простую конструкцию некоторыми рисунками и дополнениями.</p>', '1', '3', '1', '2016-03-03 21:11:52', '2016-03-12 17:25:42');

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
) ENGINE=InnoDB AUTO_INCREMENT=208 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of catalog_files
-- ----------------------------
INSERT INTO `catalog_files` VALUES ('25', '1', '800.jpg', '0', '2016-03-04 17:09:26');
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
INSERT INTO `catalog_files` VALUES ('112', '29', 'DSC01504.JPG', '0', '2016-03-12 17:37:23');
INSERT INTO `catalog_files` VALUES ('113', '29', 'DSC01502.JPG', '0', '2016-03-12 17:37:24');
INSERT INTO `catalog_files` VALUES ('114', '29', 'DSC01506.JPG', '0', '2016-03-12 17:37:24');
INSERT INTO `catalog_files` VALUES ('115', '29', 'DSC01514.JPG', '0', '2016-03-12 17:37:24');
INSERT INTO `catalog_files` VALUES ('116', '29', 'DSC01505.JPG', '0', '2016-03-12 17:37:25');
INSERT INTO `catalog_files` VALUES ('117', '29', 'DSC01503.JPG', '0', '2016-03-12 17:37:25');
INSERT INTO `catalog_files` VALUES ('118', '29', 'DSC01515.JPG', '0', '2016-03-12 17:37:26');
INSERT INTO `catalog_files` VALUES ('119', '29', 'DSC01516.JPG', '0', '2016-03-12 17:37:26');
INSERT INTO `catalog_files` VALUES ('120', '29', 'DSC01517.JPG', '0', '2016-03-12 17:37:27');
INSERT INTO `catalog_files` VALUES ('121', '28', 'DSC01143 (1).JPG', '0', '2016-03-12 17:38:16');
INSERT INTO `catalog_files` VALUES ('122', '28', 'DSC01137 (1).JPG', '0', '2016-03-12 17:38:16');
INSERT INTO `catalog_files` VALUES ('123', '28', 'DSC01142 (1).JPG', '0', '2016-03-12 17:38:17');
INSERT INTO `catalog_files` VALUES ('124', '28', 'DSC01145.JPG', '0', '2016-03-12 17:38:17');
INSERT INTO `catalog_files` VALUES ('125', '28', 'DSC01141 (1).JPG', '0', '2016-03-12 17:38:17');
INSERT INTO `catalog_files` VALUES ('126', '28', 'DSC01146.JPG', '0', '2016-03-12 17:38:18');
INSERT INTO `catalog_files` VALUES ('127', '30', 'DSC01284.JPG', '0', '2016-03-12 17:38:57');
INSERT INTO `catalog_files` VALUES ('128', '30', 'DSC01287.JPG', '0', '2016-03-12 17:38:57');
INSERT INTO `catalog_files` VALUES ('129', '30', 'DSC01297.JPG', '0', '2016-03-12 17:38:58');
INSERT INTO `catalog_files` VALUES ('130', '30', 'DSC01296.JPG', '0', '2016-03-12 17:38:58');
INSERT INTO `catalog_files` VALUES ('131', '30', 'DSC01289.JPG', '0', '2016-03-12 17:38:59');
INSERT INTO `catalog_files` VALUES ('132', '30', 'DSC01255.JPG', '0', '2016-03-12 17:38:59');
INSERT INTO `catalog_files` VALUES ('133', '30', 'DSC01299.JPG', '0', '2016-03-12 17:39:00');
INSERT INTO `catalog_files` VALUES ('134', '30', 'DSC01300.JPG', '0', '2016-03-12 17:39:00');
INSERT INTO `catalog_files` VALUES ('135', '3', 'DSC01182.JPG', '0', '2016-03-12 17:41:02');
INSERT INTO `catalog_files` VALUES ('136', '3', 'DSC01184.JPG', '0', '2016-03-12 17:41:02');
INSERT INTO `catalog_files` VALUES ('137', '3', 'DSC01183.JPG', '0', '2016-03-12 17:41:03');
INSERT INTO `catalog_files` VALUES ('138', '3', 'DSC01186.JPG', '0', '2016-03-12 17:41:03');
INSERT INTO `catalog_files` VALUES ('139', '3', 'DSC01185.JPG', '0', '2016-03-12 17:41:04');
INSERT INTO `catalog_files` VALUES ('140', '3', 'DSC01187.JPG', '0', '2016-03-12 17:41:04');
INSERT INTO `catalog_files` VALUES ('141', '3', 'DSC01192.JPG', '0', '2016-03-12 17:41:04');
INSERT INTO `catalog_files` VALUES ('142', '3', 'DSC01193.JPG', '0', '2016-03-12 17:41:05');
INSERT INTO `catalog_files` VALUES ('143', '4', 'DSC03298.JPG', '0', '2016-03-12 17:42:00');
INSERT INTO `catalog_files` VALUES ('144', '4', 'DSC03306.JPG', '0', '2016-03-12 17:42:01');
INSERT INTO `catalog_files` VALUES ('145', '4', 'DSC03311.JPG', '0', '2016-03-12 17:42:01');
INSERT INTO `catalog_files` VALUES ('146', '4', 'DSC03316.JPG', '0', '2016-03-12 17:42:02');
INSERT INTO `catalog_files` VALUES ('147', '4', 'DSC03305.JPG', '0', '2016-03-12 17:42:02');
INSERT INTO `catalog_files` VALUES ('148', '4', 'DSC03312.JPG', '0', '2016-03-12 17:42:02');
INSERT INTO `catalog_files` VALUES ('149', '4', 'DSC03317.JPG', '0', '2016-03-12 17:42:03');
INSERT INTO `catalog_files` VALUES ('150', '4', 'DSC03322.JPG', '0', '2016-03-12 17:42:03');
INSERT INTO `catalog_files` VALUES ('151', '5', 'DSC01896.JPG', '0', '2016-03-12 17:43:37');
INSERT INTO `catalog_files` VALUES ('152', '5', 'DSC01925.JPG', '0', '2016-03-12 17:43:37');
INSERT INTO `catalog_files` VALUES ('153', '5', 'DSC01900.JPG', '0', '2016-03-12 17:43:38');
INSERT INTO `catalog_files` VALUES ('154', '5', 'DSC01927.JPG', '0', '2016-03-12 17:43:38');
INSERT INTO `catalog_files` VALUES ('155', '5', 'DSC01929.JPG', '0', '2016-03-12 17:43:39');
INSERT INTO `catalog_files` VALUES ('156', '5', 'DSC01924.JPG', '0', '2016-03-12 17:43:39');
INSERT INTO `catalog_files` VALUES ('157', '5', 'DSC01932.JPG', '0', '2016-03-12 17:43:39');
INSERT INTO `catalog_files` VALUES ('158', '5', 'DSC01953.JPG', '0', '2016-03-12 17:43:40');
INSERT INTO `catalog_files` VALUES ('159', '20', 'DSC02047.JPG', '0', '2016-03-12 17:45:17');
INSERT INTO `catalog_files` VALUES ('160', '20', 'DSC02041.JPG', '0', '2016-03-12 17:45:17');
INSERT INTO `catalog_files` VALUES ('161', '20', 'DSC02040.JPG', '0', '2016-03-12 17:45:18');
INSERT INTO `catalog_files` VALUES ('162', '20', 'DSC02043.JPG', '0', '2016-03-12 17:45:18');
INSERT INTO `catalog_files` VALUES ('163', '20', 'DSC02048.JPG', '0', '2016-03-12 17:45:18');
INSERT INTO `catalog_files` VALUES ('164', '20', 'DSC02042.JPG', '0', '2016-03-12 17:45:19');
INSERT INTO `catalog_files` VALUES ('165', '20', 'DSC02052.JPG', '0', '2016-03-12 17:45:19');
INSERT INTO `catalog_files` VALUES ('166', '20', 'DSC02053.JPG', '0', '2016-03-12 17:45:20');
INSERT INTO `catalog_files` VALUES ('167', '21', 'DSC00682.JPG', '0', '2016-03-12 17:46:14');
INSERT INTO `catalog_files` VALUES ('168', '21', 'DSC00683.JPG', '0', '2016-03-12 17:46:14');
INSERT INTO `catalog_files` VALUES ('169', '21', 'DSC00697.JPG', '0', '2016-03-12 17:46:15');
INSERT INTO `catalog_files` VALUES ('170', '21', 'DSC00677.JPG', '0', '2016-03-12 17:46:15');
INSERT INTO `catalog_files` VALUES ('171', '21', 'DSC00698.JPG', '0', '2016-03-12 17:46:16');
INSERT INTO `catalog_files` VALUES ('172', '21', 'DSC00692.JPG', '0', '2016-03-12 17:46:16');
INSERT INTO `catalog_files` VALUES ('173', '21', 'DSC00704.JPG', '0', '2016-03-12 17:46:17');
INSERT INTO `catalog_files` VALUES ('174', '21', 'DSC00713.JPG', '0', '2016-03-12 17:46:17');
INSERT INTO `catalog_files` VALUES ('175', '21', 'DSC00715.JPG', '0', '2016-03-12 17:46:18');
INSERT INTO `catalog_files` VALUES ('176', '21', 'DSC00716.JPG', '0', '2016-03-12 17:46:18');
INSERT INTO `catalog_files` VALUES ('177', '21', 'DSC00718.JPG', '0', '2016-03-12 17:46:19');
INSERT INTO `catalog_files` VALUES ('178', '22', 'DSC00144.JPG', '0', '2016-03-12 17:47:25');
INSERT INTO `catalog_files` VALUES ('179', '22', 'DSC00134.JPG', '0', '2016-03-12 17:47:25');
INSERT INTO `catalog_files` VALUES ('180', '22', 'DSC00141.JPG', '0', '2016-03-12 17:47:26');
INSERT INTO `catalog_files` VALUES ('181', '22', 'DSC00146.JPG', '0', '2016-03-12 17:47:26');
INSERT INTO `catalog_files` VALUES ('182', '22', 'DSC00136.JPG', '0', '2016-03-12 17:47:27');
INSERT INTO `catalog_files` VALUES ('183', '22', 'DSC00142.JPG', '0', '2016-03-12 17:47:27');
INSERT INTO `catalog_files` VALUES ('184', '23', 'DSC01382.JPG', '0', '2016-03-12 17:47:56');
INSERT INTO `catalog_files` VALUES ('185', '23', 'DSC01383.JPG', '0', '2016-03-12 17:47:57');
INSERT INTO `catalog_files` VALUES ('186', '23', 'DSC01375.JPG', '0', '2016-03-12 17:47:57');
INSERT INTO `catalog_files` VALUES ('187', '23', 'DSC01390.JPG', '0', '2016-03-12 17:47:58');
INSERT INTO `catalog_files` VALUES ('188', '23', 'DSC01345.JPG', '0', '2016-03-12 17:47:58');
INSERT INTO `catalog_files` VALUES ('189', '23', 'DSC01386.JPG', '0', '2016-03-12 17:47:59');
INSERT INTO `catalog_files` VALUES ('190', '23', 'DSC01391.JPG', '0', '2016-03-12 17:47:59');
INSERT INTO `catalog_files` VALUES ('191', '23', 'DSC01393.JPG', '0', '2016-03-12 17:47:59');
INSERT INTO `catalog_files` VALUES ('192', '23', 'DSC01401.JPG', '0', '2016-03-12 17:48:00');
INSERT INTO `catalog_files` VALUES ('193', '25', 'DSC00295.JPG', '0', '2016-03-12 17:48:41');
INSERT INTO `catalog_files` VALUES ('194', '25', 'DSC00292.JPG', '0', '2016-03-12 17:48:41');
INSERT INTO `catalog_files` VALUES ('195', '25', 'DSC00296.JPG', '0', '2016-03-12 17:48:42');
INSERT INTO `catalog_files` VALUES ('196', '25', 'DSC00362.JPG', '0', '2016-03-12 17:48:43');
INSERT INTO `catalog_files` VALUES ('197', '25', 'DSC00297.JPG', '0', '2016-03-12 17:48:43');
INSERT INTO `catalog_files` VALUES ('198', '25', 'DSC00291.JPG', '0', '2016-03-12 17:48:43');
INSERT INTO `catalog_files` VALUES ('199', '25', 'DSC00363.JPG', '0', '2016-03-12 17:48:44');
INSERT INTO `catalog_files` VALUES ('200', '25', 'DSC00366.JPG', '0', '2016-03-12 17:48:44');
INSERT INTO `catalog_files` VALUES ('201', '25', 'DSC00367.JPG', '0', '2016-03-12 17:48:45');
INSERT INTO `catalog_files` VALUES ('202', '25', 'DSC00376.JPG', '0', '2016-03-12 17:48:45');
INSERT INTO `catalog_files` VALUES ('203', '26', 'DSC03932.JPG', '0', '2016-03-12 17:56:25');
INSERT INTO `catalog_files` VALUES ('204', '26', 'DSC03943.JPG', '0', '2016-03-12 17:56:25');
INSERT INTO `catalog_files` VALUES ('205', '26', 'DSC03968.JPG', '0', '2016-03-12 17:56:25');
INSERT INTO `catalog_files` VALUES ('206', '26', 'DSC03944.JPG', '0', '2016-03-12 17:56:25');
INSERT INTO `catalog_files` VALUES ('207', '1', 'cat5.jpg', '1', '2016-03-12 18:05:23');

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
