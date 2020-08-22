/*
 Navicat Premium Data Transfer

 Source Server         : test1
 Source Server Type    : MySQL
 Source Server Version : 80019
 Source Host           : localhost:3306
 Source Schema         : tmall_ssm

 Target Server Type    : MySQL
 Target Server Version : 80019
 File Encoding         : 65001

 Date: 22/08/2020 15:41:42
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (1, '845378495', 'kinben233');
INSERT INTO `admin` VALUES (2, 'admin', 'admin');

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 209 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (201, '壁纸', 'exist');
INSERT INTO `category` VALUES (209, '空调', 'exist');

-- ----------------------------
-- Table structure for order_
-- ----------------------------
DROP TABLE IF EXISTS `order_`;
CREATE TABLE `order_`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `orderCode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `post` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `receiver` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mobile` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `userMessage` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createDate` datetime(0) NULL DEFAULT NULL,
  `payDate` datetime(0) NULL DEFAULT NULL,
  `deliveryDate` datetime(0) NULL DEFAULT NULL,
  `confirmDate` datetime(0) NULL DEFAULT NULL,
  `uid` int(0) NULL DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_order_user`(`uid`) USING BTREE,
  CONSTRAINT `fk_order_user` FOREIGN KEY (`uid`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_
-- ----------------------------
INSERT INTO `order_` VALUES (9, '202006211406534107419', '', '', '', '', '', '2020-06-21 14:06:53', '2020-06-21 14:07:00', '2020-06-21 14:07:32', '2020-06-21 14:08:15', 8, 'finish');
INSERT INTO `order_` VALUES (10, '202006291423137709591', '', '', '', '', '', '2020-06-29 14:23:13', '2020-06-29 14:23:16', '2020-06-30 16:39:45', '2020-06-30 16:49:31', 8, 'finish');
INSERT INTO `order_` VALUES (11, '202006301639355486219', '', '', '', '', '', '2020-06-30 16:39:35', '2020-06-30 16:39:38', '2020-06-30 16:39:49', '2020-06-30 16:45:20', 8, 'finish');
INSERT INTO `order_` VALUES (12, '202006301648505439663', '', '', '', '', '', '2020-06-30 16:48:50', '2020-06-30 16:48:52', '2020-06-30 17:05:35', '2020-07-07 23:31:54', 8, 'finish');
INSERT INTO `order_` VALUES (13, '202006301653344066244', '', '', '', '', '', '2020-06-30 16:53:34', '2020-06-30 16:53:35', '2020-06-30 17:05:25', '2020-06-30 17:05:49', 8, 'finish');
INSERT INTO `order_` VALUES (14, '202006301705563621375', '', '', '', '', '', '2020-06-30 17:05:56', '2020-06-30 17:05:58', '2020-06-30 17:06:03', '2020-07-01 16:13:26', 8, 'finish');
INSERT INTO `order_` VALUES (15, '202006301709348119029', '', '', '', '', '', '2020-06-30 17:09:34', '2020-06-30 17:09:36', NULL, NULL, 8, 'waitDelivery');
INSERT INTO `order_` VALUES (16, '202007011613134938199', '', '', '', '', '', '2020-07-01 16:13:13', '2020-07-01 16:13:15', NULL, NULL, 8, 'waitDelivery');
INSERT INTO `order_` VALUES (17, '202007072307364245060', '', '', '', '', '', '2020-07-07 23:07:36', '2020-07-07 23:07:39', '2020-08-14 23:53:50', NULL, 8, 'waitConfirm');
INSERT INTO `order_` VALUES (18, '202007072328282365136', '', '', '', '', '', '2020-07-07 23:28:28', '2020-07-07 23:28:29', '2020-08-12 16:17:29', NULL, 8, 'waitConfirm');

-- ----------------------------
-- Table structure for orderitem
-- ----------------------------
DROP TABLE IF EXISTS `orderitem`;
CREATE TABLE `orderitem`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `pid` int(0) NULL DEFAULT NULL,
  `oid` int(0) NULL DEFAULT NULL,
  `uid` int(0) NULL DEFAULT NULL,
  `number` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_orderitem_user`(`uid`) USING BTREE,
  INDEX `fk_orderitem_product`(`pid`) USING BTREE,
  INDEX `fk_orderitem_order`(`oid`) USING BTREE,
  CONSTRAINT `fk_orderitem_order` FOREIGN KEY (`oid`) REFERENCES `order_` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_orderitem_product` FOREIGN KEY (`pid`) REFERENCES `product` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_orderitem_user` FOREIGN KEY (`uid`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `subTitle` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `originalPrice` float NULL DEFAULT NULL,
  `promotePrice` float NULL DEFAULT NULL,
  `stock` int(0) NULL DEFAULT NULL,
  `cid` int(0) NULL DEFAULT NULL,
  `createDate` datetime(0) NULL DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_product_category`(`cid`) USING BTREE,
  CONSTRAINT `fk_product_category` FOREIGN KEY (`cid`) REFERENCES `category` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for productimage
-- ----------------------------
DROP TABLE IF EXISTS `productimage`;
CREATE TABLE `productimage`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `pid` int(0) NULL DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_productimage_product`(`pid`) USING BTREE,
  CONSTRAINT `fk_productimage_product` FOREIGN KEY (`pid`) REFERENCES `product` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 37 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for property
-- ----------------------------
DROP TABLE IF EXISTS `property`;
CREATE TABLE `property`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `cid` int(0) NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_property_category`(`cid`) USING BTREE,
  CONSTRAINT `fk_property_category` FOREIGN KEY (`cid`) REFERENCES `category` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for propertyvalue
-- ----------------------------
DROP TABLE IF EXISTS `propertyvalue`;
CREATE TABLE `propertyvalue`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `pid` int(0) NULL DEFAULT NULL,
  `ptid` int(0) NULL DEFAULT NULL,
  `value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_propertyvalue_property`(`ptid`) USING BTREE,
  INDEX `fk_propertyvalue_product`(`pid`) USING BTREE,
  CONSTRAINT `fk_propertyvalue_product` FOREIGN KEY (`pid`) REFERENCES `product` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_propertyvalue_property` FOREIGN KEY (`ptid`) REFERENCES `property` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 37 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for review
-- ----------------------------
DROP TABLE IF EXISTS `review`;
CREATE TABLE `review`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `content` varchar(4000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `uid` int(0) NULL DEFAULT NULL,
  `pid` int(0) NULL DEFAULT NULL,
  `createDate` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_review_product`(`pid`) USING BTREE,
  INDEX `fk_review_user`(`uid`) USING BTREE,
  CONSTRAINT `fk_review_product` FOREIGN KEY (`pid`) REFERENCES `product` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_review_user` FOREIGN KEY (`uid`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (8, '845378495', 'z123456789');
INSERT INTO `user` VALUES (9, 'root', '123456');

-- ----------------------------
-- View structure for admin_view
-- ----------------------------
DROP VIEW IF EXISTS `admin_view`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `admin_view` AS select `admin`.`id` AS `id`,`admin`.`name` AS `name`,`admin`.`password` AS `password` from `admin`;

-- ----------------------------
-- View structure for category_view
-- ----------------------------
DROP VIEW IF EXISTS `category_view`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `category_view` AS select `category`.`id` AS `id`,`category`.`name` AS `name`,`category`.`status` AS `status` from `category`;

-- ----------------------------
-- View structure for order_view
-- ----------------------------
DROP VIEW IF EXISTS `order_view`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `order_view` AS select `order_`.`id` AS `id`,`order_`.`orderCode` AS `orderCode`,`order_`.`address` AS `address`,`order_`.`post` AS `post`,`order_`.`receiver` AS `receiver`,`order_`.`mobile` AS `mobile`,`order_`.`userMessage` AS `userMessage`,`order_`.`createDate` AS `createDate`,`order_`.`payDate` AS `payDate`,`order_`.`deliveryDate` AS `deliveryDate`,`order_`.`confirmDate` AS `confirmDate`,`order_`.`uid` AS `uid`,`order_`.`status` AS `status` from `order_`;

-- ----------------------------
-- View structure for orderitem_view
-- ----------------------------
DROP VIEW IF EXISTS `orderitem_view`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `orderitem_view` AS select `orderitem`.`id` AS `id`,`orderitem`.`pid` AS `pid`,`orderitem`.`oid` AS `oid`,`orderitem`.`uid` AS `uid`,`orderitem`.`number` AS `number` from `orderitem`;

-- ----------------------------
-- View structure for product_view
-- ----------------------------
DROP VIEW IF EXISTS `product_view`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `product_view` AS select `product`.`id` AS `id`,`product`.`name` AS `name`,`product`.`subTitle` AS `subTitle`,`product`.`originalPrice` AS `originalPrice`,`product`.`promotePrice` AS `promotePrice`,`product`.`stock` AS `stock`,`product`.`cid` AS `cid`,`product`.`createDate` AS `createDate`,`product`.`status` AS `status` from `product`;

-- ----------------------------
-- View structure for productimage_view
-- ----------------------------
DROP VIEW IF EXISTS `productimage_view`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `productimage_view` AS select `productimage`.`id` AS `id`,`productimage`.`pid` AS `pid`,`productimage`.`type` AS `type` from `productimage`;

-- ----------------------------
-- View structure for property_view
-- ----------------------------
DROP VIEW IF EXISTS `property_view`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `property_view` AS select `property`.`id` AS `id`,`property`.`cid` AS `cid`,`property`.`name` AS `name` from `property`;

-- ----------------------------
-- View structure for propertyvalue_view
-- ----------------------------
DROP VIEW IF EXISTS `propertyvalue_view`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `propertyvalue_view` AS select `propertyvalue`.`id` AS `id`,`propertyvalue`.`pid` AS `pid`,`propertyvalue`.`ptid` AS `ptid`,`propertyvalue`.`value` AS `value` from `propertyvalue`;

-- ----------------------------
-- View structure for review_view
-- ----------------------------
DROP VIEW IF EXISTS `review_view`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `review_view` AS select `review`.`id` AS `id`,`review`.`content` AS `content`,`review`.`uid` AS `uid`,`review`.`pid` AS `pid`,`review`.`createDate` AS `createDate` from `review`;

-- ----------------------------
-- View structure for user_view
-- ----------------------------
DROP VIEW IF EXISTS `user_view`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `user_view` AS select `user`.`id` AS `id`,`user`.`name` AS `name`,`user`.`password` AS `password` from `user`;

SET FOREIGN_KEY_CHECKS = 1;
