/*
 Navicat Premium Data Transfer

 Source Server         : locahost
 Source Server Type    : MySQL
 Source Server Version : 50553
 Source Host           : 127.0.0.1:3306
 Source Schema         : renma

 Target Server Type    : MySQL
 Target Server Version : 50553
 File Encoding         : 65001

 Date: 17/03/2020 19:30:45
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for cy_group
-- ----------------------------
DROP TABLE IF EXISTS `cy_group`;
CREATE TABLE `cy_group`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `headImage` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组团图片',
  `productIds` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组团商品id',
  `day` int(1) NOT NULL DEFAULT 1 COMMENT '有效期 天',
  `createTime` int(11) NULL DEFAULT NULL COMMENT '创建时间',
  `number` int(1) NULL DEFAULT 2 COMMENT '人数',
  `rank` int(4) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品组团-改版' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for cy_group_price
-- ----------------------------
DROP TABLE IF EXISTS `cy_group_price`;
CREATE TABLE `cy_group_price`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NULL DEFAULT NULL COMMENT '组团id',
  `productId` int(11) NULL DEFAULT NULL COMMENT '组团商品id',
  `catPriceId` int(11) NULL DEFAULT NULL COMMENT '商品分类id',
  `groupPrice` decimal(10, 2) NULL DEFAULT NULL COMMENT '商户组团价格',
  `createTime` int(11) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '组团分类数据-改版' ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for cy_group_record
-- ----------------------------
DROP TABLE IF EXISTS `cy_group_record`;
CREATE TABLE `cy_group_record`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NULL DEFAULT NULL,
  `createUId` int(11) NULL DEFAULT NULL COMMENT '开团人的uid',
  `userGroupId` int(11) NULL DEFAULT NULL COMMENT '开团人的组团id',
  `createTime` int(11) NULL DEFAULT NULL COMMENT '时间',
  `groupId` int(11) NULL DEFAULT NULL COMMENT '组团id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '组团进入记录表-改版' ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for cy_user_group
-- ----------------------------
DROP TABLE IF EXISTS `cy_user_group`;
CREATE TABLE `cy_user_group`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NULL DEFAULT NULL COMMENT '用户id',
  `groupId` int(11) NULL DEFAULT NULL COMMENT '组团id',
  `promoter` tinyint(1) NULL DEFAULT 0 COMMENT '发起人 1-是 0不是',
  `promoterUid` int(11) NULL DEFAULT NULL COMMENT '发起人的uid',
  `status` tinyint(1) NULL DEFAULT NULL COMMENT '状态 0-待支付 1-开团成功/参团成功-组团人数不够 2-组团成功 -1 退款成功',
  `createTime` int(11) NULL DEFAULT NULL COMMENT '创建时间',
  `finishTime` int(11) NULL DEFAULT NULL COMMENT '组团成功时间',
  `orderId` int(11) NULL DEFAULT NULL COMMENT '对应的订单id',
  `userGroupId` int(11) NULL DEFAULT NULL COMMENT '同一组组团标识   发起人创建组团生成记录的id',
  `catPriceId` int(11) NULL DEFAULT 0 COMMENT '组团分类id',
  `productId` int(11) NULL DEFAULT NULL COMMENT '商品id',
  `type` tinyint(1) NULL DEFAULT 1 COMMENT '1-单独购买 2-开团 3-参团',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 157 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户组团' ROW_FORMAT = Fixed;

SET FOREIGN_KEY_CHECKS = 1;
