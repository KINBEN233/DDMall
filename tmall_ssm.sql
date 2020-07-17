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

 Date: 17/07/2020 15:54:07
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
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (1, '845378495', 'kinben233');

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 208 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (201, '壁纸', 'exist');
INSERT INTO `category` VALUES (202, '填充', 'exist');
INSERT INTO `category` VALUES (203, '填充', 'exist');
INSERT INTO `category` VALUES (204, '填充', 'exist');
INSERT INTO `category` VALUES (205, '填充', 'exist');
INSERT INTO `category` VALUES (206, '填充', 'exist');
INSERT INTO `category` VALUES (207, '填充', 'exist');
INSERT INTO `category` VALUES (208, '填充', 'exist');

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
INSERT INTO `order_` VALUES (17, '202007072307364245060', '', '', '', '', '', '2020-07-07 23:07:36', '2020-07-07 23:07:39', NULL, NULL, 8, 'waitDelivery');
INSERT INTO `order_` VALUES (18, '202007072328282365136', '', '', '', '', '', '2020-07-07 23:28:28', '2020-07-07 23:28:29', NULL, NULL, 8, 'waitDelivery');

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
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orderitem
-- ----------------------------
INSERT INTO `orderitem` VALUES (8, 6, 9, 8, 1);
INSERT INTO `orderitem` VALUES (12, 6, 10, 8, 2);
INSERT INTO `orderitem` VALUES (13, 6, 11, 8, 3);
INSERT INTO `orderitem` VALUES (14, 6, 12, 8, 1);
INSERT INTO `orderitem` VALUES (15, 6, 13, 8, 1);
INSERT INTO `orderitem` VALUES (16, 6, 14, 8, 1);
INSERT INTO `orderitem` VALUES (17, 6, 15, 8, 1);
INSERT INTO `orderitem` VALUES (18, 6, 16, 8, 1);
INSERT INTO `orderitem` VALUES (19, 6, 17, 8, 1);
INSERT INTO `orderitem` VALUES (20, 6, 18, 8, 1);

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
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES (6, '天野阳菜', '天气之子 diy 数字油画', 29.98, 19.98, 989, 201, '2020-06-21 11:16:27', 'exist');
INSERT INTO `product` VALUES (7, '手机', '四大名著青之一少年版中小学生课外读物儿童文学书', 99.98, 19.98, 99, 208, '2020-07-16 19:02:31', 'exist');
INSERT INTO `product` VALUES (8, 'root', '四大名著青之一少年版中小学生课外读物儿童文学书', 99.98, 19.98, 99, 208, '2020-07-16 19:02:35', 'exist');
INSERT INTO `product` VALUES (9, '填充', '', 99.98, 19.98, 99, 208, '2020-07-16 19:02:37', 'exist');
INSERT INTO `product` VALUES (10, '填充', '', 99.98, 19.98, 99, 208, '2020-07-16 19:02:39', 'exist');
INSERT INTO `product` VALUES (11, '填充', '', 99.98, 19.98, 99, 208, '2020-07-16 19:02:42', 'exist');
INSERT INTO `product` VALUES (12, '填充', '', 99.98, 19.98, 99, 208, '2020-07-16 19:02:44', 'exist');

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
) ENGINE = InnoDB AUTO_INCREMENT = 38 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of productimage
-- ----------------------------
INSERT INTO `productimage` VALUES (29, 6, 'type_single');
INSERT INTO `productimage` VALUES (30, 6, 'type_single');
INSERT INTO `productimage` VALUES (31, 6, 'type_single');
INSERT INTO `productimage` VALUES (32, 6, 'type_single');
INSERT INTO `productimage` VALUES (33, 6, 'type_single');
INSERT INTO `productimage` VALUES (34, 6, 'type_detail');
INSERT INTO `productimage` VALUES (35, 6, 'type_detail');
INSERT INTO `productimage` VALUES (36, 6, 'type_detail');
INSERT INTO `productimage` VALUES (37, 6, 'type_detail');

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
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of property
-- ----------------------------
INSERT INTO `property` VALUES (17, 203, '填充');
INSERT INTO `property` VALUES (18, 203, 'root');
INSERT INTO `property` VALUES (19, 203, 'root');
INSERT INTO `property` VALUES (20, 203, '手机');
INSERT INTO `property` VALUES (21, 203, 'root');
INSERT INTO `property` VALUES (22, 203, '新标日');
INSERT INTO `property` VALUES (23, 203, 'admin');
INSERT INTO `property` VALUES (24, 208, 'root');
INSERT INTO `property` VALUES (25, 208, 'root');
INSERT INTO `property` VALUES (26, 208, '123');
INSERT INTO `property` VALUES (27, 208, 'root');
INSERT INTO `property` VALUES (28, 208, 'root');
INSERT INTO `property` VALUES (29, 208, '填充');
INSERT INTO `property` VALUES (30, 208, '填充');
INSERT INTO `property` VALUES (31, 208, 'root');
INSERT INTO `property` VALUES (32, 208, 'admin');

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
-- Records of review
-- ----------------------------
INSERT INTO `review` VALUES (2, '挺好的', 8, 6, '2020-06-21 14:09:06');
INSERT INTO `review` VALUES (3, '😭', 8, 6, '2020-07-01 17:45:31');
INSERT INTO `review` VALUES (4, 'kele', 8, 6, '2020-07-07 23:28:46');
INSERT INTO `review` VALUES (5, '123', 8, 6, '2020-07-07 23:32:02');
INSERT INTO `review` VALUES (6, 'gf', 8, 6, '2020-07-07 23:32:32');

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

SET FOREIGN_KEY_CHECKS = 1;
