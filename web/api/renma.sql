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

 Date: 03/12/2019 13:47:47
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for cy_advert
-- ----------------------------
DROP TABLE IF EXISTS `cy_advert`;
CREATE TABLE `cy_advert`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) NULL DEFAULT 1 COMMENT '1-图片 2-视频',
  `imageUrl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片对应的链接地址',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件地址',
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '状态 0-未使用 1-使用中',
  `createTime` int(11) NULL DEFAULT NULL COMMENT '创建时间',
  `title` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '标题',
  `rank` int(4) NULL DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '广告内容' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cy_advert
-- ----------------------------
INSERT INTO `cy_advert` VALUES (2, 2, 'http://www.baidu.com', '/files/attach/file/20191101/1572601633.png', 1, 1572834254, '三生三世', 8);
INSERT INTO `cy_advert` VALUES (3, 1, 'http://www.baidu.com', '/files/attach/file/20191101/1572601633.png', 1, 1572834284, '三生三世2', 9);

-- ----------------------------
-- Table structure for cy_catalog
-- ----------------------------
DROP TABLE IF EXISTS `cy_catalog`;
CREATE TABLE `cy_catalog`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pid` int(4) NULL DEFAULT 0 COMMENT '父级id 0-一级目录',
  `createTime` int(11) NULL DEFAULT NULL,
  `rule` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '规则 所在控制器、方法',
  `rank` int(4) NULL DEFAULT 0 COMMENT '排序 大到小',
  `showed` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1-显示',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 38 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '目录结构表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cy_catalog
-- ----------------------------
INSERT INTO `cy_catalog` VALUES (1, '权限功能', 0, 1561365326, 'rule', 9, 1);
INSERT INTO `cy_catalog` VALUES (2, '角色', 1, 1561365326, 'role', 7, 1);
INSERT INTO `cy_catalog` VALUES (3, '目录功能', 1, 1561365326, 'catalog', 4, 1);
INSERT INTO `cy_catalog` VALUES (4, '用户模块', 0, 2019, 'member', 4, 1);
INSERT INTO `cy_catalog` VALUES (5, '订单模块', 0, 1561445961, 'order', 3, 1);
INSERT INTO `cy_catalog` VALUES (6, '商品模块', 0, 1561446136, 'product', 3, 1);
INSERT INTO `cy_catalog` VALUES (13, '店铺模块', 0, 1561452444, 'shop', 2, 1);
INSERT INTO `cy_catalog` VALUES (19, '优惠券', 15, 1572834451, 'coupon', 0, 1);
INSERT INTO `cy_catalog` VALUES (15, '内容模块', 0, 1572588811, 'content', 8, 1);
INSERT INTO `cy_catalog` VALUES (16, '首页logo', 15, 1572588862, 'logo-content', 0, 1);
INSERT INTO `cy_catalog` VALUES (17, '广告内容', 15, 1572588922, 'advert', 0, 1);
INSERT INTO `cy_catalog` VALUES (18, '商品分类', 15, 1572589268, 'category', 9, 1);
INSERT INTO `cy_catalog` VALUES (20, '店铺信息', 13, 1572837153, 'shop-success', 0, 1);
INSERT INTO `cy_catalog` VALUES (21, '店铺审核', 13, 1572837178, 'shop-check', 0, 1);
INSERT INTO `cy_catalog` VALUES (22, '优选商品', 15, 1572855506, 'good-product', 0, 1);
INSERT INTO `cy_catalog` VALUES (23, '商品信息', 6, 1572867332, 'product-list', 0, 1);
INSERT INTO `cy_catalog` VALUES (24, '商品组团', 6, 1572868884, 'product-group', 0, 1);
INSERT INTO `cy_catalog` VALUES (25, '订单信息', 5, 1572868910, 'order-list', 0, 1);
INSERT INTO `cy_catalog` VALUES (26, '组团信息', 4, 1572868997, 'group-list', 0, 1);
INSERT INTO `cy_catalog` VALUES (27, '用户信息', 4, 1572869020, 'user-list', 9, 1);
INSERT INTO `cy_catalog` VALUES (28, '优惠券使用', 4, 1572869050, 'coupon-use', 0, 1);
INSERT INTO `cy_catalog` VALUES (29, '用户地址', 4, 1572869097, 'user-address', 0, 1);
INSERT INTO `cy_catalog` VALUES (30, '订单物流', 5, 1572869144, 'order-logistics', 0, 1);
INSERT INTO `cy_catalog` VALUES (31, '用户分享', 4, 1572869185, 'user-share', 0, 1);
INSERT INTO `cy_catalog` VALUES (32, '质保商品', 5, 1572869254, 'quality-product', 0, 1);
INSERT INTO `cy_catalog` VALUES (33, '关于我们', 15, 1572869306, 'about-us', 0, 1);
INSERT INTO `cy_catalog` VALUES (34, '用户反馈', 4, 1572869334, 'user-feedback', 0, 1);
INSERT INTO `cy_catalog` VALUES (35, '用户购物车', 4, 1572869476, 'user-shop-cart', 0, 1);
INSERT INTO `cy_catalog` VALUES (36, '会员充值', 15, 1574150853, 'member-remark', 0, 1);
INSERT INTO `cy_catalog` VALUES (37, '客服联系', 15, 1574151010, 'service', 0, 1);

-- ----------------------------
-- Table structure for cy_category
-- ----------------------------
DROP TABLE IF EXISTS `cy_category`;
CREATE TABLE `cy_category`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(4) NULL DEFAULT 0 COMMENT '父级id',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分类名称',
  `rank` int(4) NULL DEFAULT 0 COMMENT '排序',
  `createTime` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 54 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '问题类型分类  两级' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cy_category
-- ----------------------------
INSERT INTO `cy_category` VALUES (50, 0, '零件', 3, 1572598507);
INSERT INTO `cy_category` VALUES (53, 50, '螺丝帽', 3, 1574143559);
INSERT INTO `cy_category` VALUES (52, 50, '千斤顶', 2, 1572598706);

-- ----------------------------
-- Table structure for cy_coupon
-- ----------------------------
DROP TABLE IF EXISTS `cy_coupon`;
CREATE TABLE `cy_coupon`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `money` decimal(10, 2) NULL DEFAULT NULL COMMENT '优惠金额',
  `least` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '起步价',
  `number` int(11) NULL DEFAULT NULL COMMENT '数量',
  `createTime` int(11) NULL DEFAULT NULL,
  `remark` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '优惠券描述',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '优惠券' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cy_coupon
-- ----------------------------
INSERT INTO `cy_coupon` VALUES (1, 'fefed', 9000.00, 0.00, 1000, 1572836975, 'csdfcscfdcfdfd');
INSERT INTO `cy_coupon` VALUES (2, '测试', 100.00, 180.00, 1000, 1572837032, '优惠券 消费金额慢180才能使用');

-- ----------------------------
-- Table structure for cy_good_product
-- ----------------------------
DROP TABLE IF EXISTS `cy_good_product`;
CREATE TABLE `cy_good_product`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `productId` int(11) NULL DEFAULT NULL COMMENT '商品id',
  `rank` int(4) NULL DEFAULT 0 COMMENT '排序',
  `createTime` int(11) NULL DEFAULT NULL COMMENT '时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '优选商品' ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for cy_group_product
-- ----------------------------
DROP TABLE IF EXISTS `cy_group_product`;
CREATE TABLE `cy_group_product`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `productId` int(5) NULL DEFAULT NULL COMMENT '商品id',
  `number` int(2) NULL DEFAULT NULL COMMENT '组团人数',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '组团价格',
  `remark` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '组团说明',
  `createTime` int(11) NULL DEFAULT NULL COMMENT '添加时间',
  `rank` int(4) NULL DEFAULT NULL COMMENT '排序',
  `groupTime` int(2) NOT NULL DEFAULT 1 COMMENT '组团有效时间 天',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '组团商品' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cy_group_product
-- ----------------------------
INSERT INTO `cy_group_product` VALUES (1, 1, 3, 121.00, 'cdscddcd', 1582804260, 6, 1);

-- ----------------------------
-- Table structure for cy_logo
-- ----------------------------
DROP TABLE IF EXISTS `cy_logo`;
CREATE TABLE `cy_logo`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `createTime` int(11) NULL DEFAULT NULL,
  `status` tinyint(1) NULL DEFAULT 0 COMMENT '状态 1-当前使用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'logo滚动内容' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cy_logo
-- ----------------------------
INSERT INTO `cy_logo` VALUES (1, 'ffff', 1572590265, 0);
INSERT INTO `cy_logo` VALUES (2, 'fsdfdsfdscsxcc是否第三十', 1572590323, 0);
INSERT INTO `cy_logo` VALUES (3, '是才呈现出', 1572590389, 0);
INSERT INTO `cy_logo` VALUES (4, '是才呈现出', 1572590445, 0);
INSERT INTO `cy_logo` VALUES (5, '是才呈现出的', 1572590537, 1);

-- ----------------------------
-- Table structure for cy_member
-- ----------------------------
DROP TABLE IF EXISTS `cy_member`;
CREATE TABLE `cy_member`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nickname` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '昵称',
  `name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `avatar` varchar(70) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像地址',
  `sex` tinyint(1) NOT NULL DEFAULT 0 COMMENT '性别 1-男 2-女',
  `birthday` char(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生日',
  `work` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业',
  `phone` char(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话',
  `identity` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证',
  `integral` int(6) NULL DEFAULT NULL COMMENT '积分',
  `member` tinyint(1) NULL DEFAULT 0 COMMENT '会员状态 1-是 0-不是',
  `memberTime` int(11) NULL DEFAULT NULL COMMENT '成为会员的时间',
  `inviteCode` char(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邀请码',
  `inviterCode` char(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邀请人的邀请码',
  `createTime` int(11) NULL DEFAULT NULL COMMENT '创建时间',
  `openId` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户微信账号的openId',
  `province` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '省',
  `city` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '市',
  `area` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地区',
  `password` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cy_member
-- ----------------------------
INSERT INTO `cy_member` VALUES (1, 'dscd', 'vfv', NULL, 0, NULL, NULL, NULL, NULL, NULL, 0, NULL, 'ddDCSDF5', NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for cy_member_log
-- ----------------------------
DROP TABLE IF EXISTS `cy_member_log`;
CREATE TABLE `cy_member_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NULL DEFAULT NULL,
  `beginTime` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '开始时间',
  `endTime` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '结束时间',
  `createTime` int(11) NULL DEFAULT NULL,
  `orderId` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '成员开通会员记录' ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for cy_order
-- ----------------------------
DROP TABLE IF EXISTS `cy_order`;
CREATE TABLE `cy_order`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderNumber` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单号',
  `uid` int(11) NOT NULL COMMENT '用户uid',
  `productId` int(11) NULL DEFAULT NULL COMMENT '商品Id',
  `productTitle` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品名称',
  `totalPrice` decimal(10, 2) NULL DEFAULT NULL COMMENT '订单总价',
  `reducePrice` decimal(10, 2) NULL DEFAULT NULL COMMENT '订单优惠卷优惠价格',
  `payPrice` decimal(10, 2) NULL DEFAULT NULL COMMENT '实际支付价格',
  `coupon` int(5) NULL DEFAULT NULL COMMENT '优惠券Id',
  `number` int(5) NULL DEFAULT 1 COMMENT '商品数量',
  `extInfo` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '其他信息',
  `status` int(1) NULL DEFAULT NULL COMMENT '订单状态 1-支付成功 0-未支付',
  `createTime` int(11) NULL DEFAULT NULL COMMENT '订单时间',
  `payType` int(1) NULL DEFAULT 1 COMMENT '支付类型  0-其他 1-微信',
  `paySign` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付签名 回调验证',
  `ip` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '下单ip',
  `finishTime` int(11) NULL DEFAULT NULL COMMENT '完成时间',
  `type` tinyint(1) NULL DEFAULT 0 COMMENT '付款类型 1-充值 2-买商品',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址Id',
  `integral` int(11) NULL DEFAULT NULL COMMENT '积分消费',
  `remark` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '订单备注',
  `productType` tinyint(1) NULL DEFAULT 1 COMMENT '1-商品购买 2-组团 购买',
  `evaluate` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '订单评价   支付成功并且完成时间存在',
  `typeStatus` tinyint(1) NULL DEFAULT NULL COMMENT '订单类型状态 0-代付款 1-待接单 2-已接单 3-待评价 4-待售后',
  `evalTime` int(11) NOT NULL DEFAULT 0 COMMENT '订单评价时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cy_order
-- ----------------------------
INSERT INTO `cy_order` VALUES (2, 'RM1575342637841082222222', 1, 1, '的定时多所多多', 100.00, 0.00, 100.00, 0, 1, '', 0, 1575342637, 1, 'EF302739AD1B100CD4479BD28425A069', '127.0.0.1', NULL, 1, '0', 0, NULL, 1, NULL, 0, 0);
INSERT INTO `cy_order` VALUES (3, 'RM1575342784372266', 1, 1, '的定时多所多多', 100.00, 0.00, 100.00, 0, 1, '', 0, 1575342784, 1, 'ED53E5A9CEBFEFAF53C42482068C8713', '127.0.0.1', NULL, 1, '0', 0, NULL, 1, NULL, 0, 0);

-- ----------------------------
-- Table structure for cy_order_logistics
-- ----------------------------
DROP TABLE IF EXISTS `cy_order_logistics`;
CREATE TABLE `cy_order_logistics`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderId` int(11) NULL DEFAULT NULL COMMENT '订单Id',
  `logistics` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '物流号',
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '物流名称',
  `createTime` int(11) NULL DEFAULT NULL COMMENT '发送时间',
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '完成状态 1-完成 0-未完成',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单物流' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cy_order_logistics
-- ----------------------------
INSERT INTO `cy_order_logistics` VALUES (1, 1, '韵达', '123456', 1575273608, 0);

-- ----------------------------
-- Table structure for cy_product
-- ----------------------------
DROP TABLE IF EXISTS `cy_product`;
CREATE TABLE `cy_product`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
  `catPid` int(5) NULL DEFAULT NULL COMMENT '一级分类',
  `catCid` int(5) NULL DEFAULT NULL COMMENT '二级分类',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '价格',
  `voltage` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电压',
  `mileage` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '续航里程',
  `sex` char(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '性别使用 0-通用 1-男 2-女',
  `headMsg` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '封面展示 图片',
  `image` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '图片',
  `tradeAddress` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '交易地点',
  `createTime` int(11) NULL DEFAULT NULL,
  `brand` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '品牌名称',
  `introduce` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '详细介绍',
  `type` tinyint(1) NULL DEFAULT 0 COMMENT '商品类型 1-维修 2-新车 3-二手车',
  `uid` int(11) NULL DEFAULT NULL COMMENT '用户id',
  `number` int(11) NULL DEFAULT 1 COMMENT '库存',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cy_product
-- ----------------------------
INSERT INTO `cy_product` VALUES (1, '的定时多所多多', 50, 52, 100.00, '111', '222', '0', 'CDCDCDC', 'a:4:{i:0;s:37:\"http://lck.hzlyzhenzhi.com/api/bg.jpg\";i:1;s:37:\"http://lck.hzlyzhenzhi.com/api/bg.jpg\";i:2;s:37:\"http://lck.hzlyzhenzhi.com/api/bg.jpg\";i:3;s:37:\"http://lck.hzlyzhenzhi.com/api/bg.jpg\";}', 'DSSCDXCCSDSD', 1582804360, 'xxx', 'dfdfdcvdvvcvdv', 0, 1, 1);

-- ----------------------------
-- Table structure for cy_quality_product
-- ----------------------------
DROP TABLE IF EXISTS `cy_quality_product`;
CREATE TABLE `cy_quality_product`  (
  `id` int(11) NOT NULL,
  `uid` int(11) NULL DEFAULT NULL,
  `productId` int(11) NULL DEFAULT NULL COMMENT '商品Id',
  `catId` int(5) NULL DEFAULT NULL COMMENT '分类Id',
  `brand` int(5) NULL DEFAULT NULL COMMENT '品牌',
  `buyTime` int(11) NULL DEFAULT NULL COMMENT '购买日期',
  `gyTime` int(11) NULL DEFAULT NULL COMMENT '商品钢印日期',
  `barCode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '条形码',
  `createTime` int(11) NULL DEFAULT NULL COMMENT '上传时间',
  `productName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '质保商品名称',
  `after` tinyint(1) NULL DEFAULT 0 COMMENT '1-申请售后',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '质保商品' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for cy_role
-- ----------------------------
DROP TABLE IF EXISTS `cy_role`;
CREATE TABLE `cy_role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createTime` int(11) NULL DEFAULT NULL,
  `createUser` int(5) NULL DEFAULT NULL COMMENT '创建人',
  `createPower` tinyint(1) NULL DEFAULT 0 COMMENT '编辑角色权限 1-有 0-无',
  `realPass` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户角色表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cy_role
-- ----------------------------
INSERT INTO `cy_role` VALUES (1, 'admin', '25b6e0de03803595e069456b4b37fd8c', 1561365326, 0, 1, 'cyAdmin');

-- ----------------------------
-- Table structure for cy_role_catalog
-- ----------------------------
DROP TABLE IF EXISTS `cy_role_catalog`;
CREATE TABLE `cy_role_catalog`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roleId` int(11) NOT NULL COMMENT '角色id',
  `cataId` int(11) NOT NULL COMMENT '目录id',
  `createTime` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 65 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色权限表' ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of cy_role_catalog
-- ----------------------------
INSERT INTO `cy_role_catalog` VALUES (1, 1, 1, 1561365326);
INSERT INTO `cy_role_catalog` VALUES (2, 1, 2, 1561365326);
INSERT INTO `cy_role_catalog` VALUES (3, 1, 3, 1561365326);
INSERT INTO `cy_role_catalog` VALUES (5, 1, 13, 1561452444);
INSERT INTO `cy_role_catalog` VALUES (6, 1, 4, 1561452444);
INSERT INTO `cy_role_catalog` VALUES (7, 1, 5, 1561452444);
INSERT INTO `cy_role_catalog` VALUES (8, 1, 6, 1561452444);
INSERT INTO `cy_role_catalog` VALUES (42, 1, 15, 1572588811);
INSERT INTO `cy_role_catalog` VALUES (43, 1, 16, 1572588862);
INSERT INTO `cy_role_catalog` VALUES (44, 1, 17, 1572588922);
INSERT INTO `cy_role_catalog` VALUES (45, 1, 18, 1572589268);
INSERT INTO `cy_role_catalog` VALUES (46, 1, 19, 1572834451);
INSERT INTO `cy_role_catalog` VALUES (47, 1, 20, 1572837153);
INSERT INTO `cy_role_catalog` VALUES (48, 1, 21, 1572837178);
INSERT INTO `cy_role_catalog` VALUES (49, 1, 22, 1572855506);
INSERT INTO `cy_role_catalog` VALUES (50, 1, 23, 1572867332);
INSERT INTO `cy_role_catalog` VALUES (51, 1, 24, 1572868884);
INSERT INTO `cy_role_catalog` VALUES (52, 1, 25, 1572868910);
INSERT INTO `cy_role_catalog` VALUES (53, 1, 26, 1572868997);
INSERT INTO `cy_role_catalog` VALUES (54, 1, 27, 1572869020);
INSERT INTO `cy_role_catalog` VALUES (55, 1, 28, 1572869050);
INSERT INTO `cy_role_catalog` VALUES (56, 1, 29, 1572869097);
INSERT INTO `cy_role_catalog` VALUES (57, 1, 30, 1572869144);
INSERT INTO `cy_role_catalog` VALUES (58, 1, 31, 1572869185);
INSERT INTO `cy_role_catalog` VALUES (59, 1, 32, 1572869254);
INSERT INTO `cy_role_catalog` VALUES (60, 1, 33, 1572869306);
INSERT INTO `cy_role_catalog` VALUES (61, 1, 34, 1572869334);
INSERT INTO `cy_role_catalog` VALUES (62, 1, 35, 1572869476);
INSERT INTO `cy_role_catalog` VALUES (63, 1, 36, 1574150853);
INSERT INTO `cy_role_catalog` VALUES (64, 1, 37, 1574151010);

-- ----------------------------
-- Table structure for cy_shop
-- ----------------------------
DROP TABLE IF EXISTS `cy_shop`;
CREATE TABLE `cy_shop`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '店铺名',
  `phone` char(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话',
  `shopTime` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '营业时间',
  `video` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '店铺视频',
  `image` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '店铺图片',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '详细地址',
  `introduce` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '店铺介绍',
  `status` tinyint(1) NULL DEFAULT NULL COMMENT '店铺状态 1-申请成功 -1申请失败 0-待审核',
  `createTime` int(11) NULL DEFAULT NULL,
  `headImage` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '店铺头图',
  `checkTime` int(11) NULL DEFAULT NULL COMMENT '审核时间',
  `province` char(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '省',
  `city` char(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '市',
  `area` char(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地区',
  `uid` int(11) NULL DEFAULT NULL COMMENT '会员id',
  `checkRemark` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '审核理由',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商家店铺' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cy_shop
-- ----------------------------
INSERT INTO `cy_shop` VALUES (2, 'oathYc2', '15828043607', '08:00-19:00', 'http://www.baidu.com', 'http://www.baidu.comhttp://www.baidu.com\r\nhttp://www.baidu.com\r\n', '牛市口路81号', '一个测试', 1, 1572849041, 'http://www.baidu.com', 1572850510, '四川省', '成都市', '锦江区', NULL, NULL);

-- ----------------------------
-- Table structure for cy_shop_cart
-- ----------------------------
DROP TABLE IF EXISTS `cy_shop_cart`;
CREATE TABLE `cy_shop_cart`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NULL DEFAULT NULL,
  `productId` int(11) NULL DEFAULT NULL,
  `createTime` int(11) NULL DEFAULT NULL,
  `number` int(3) NULL DEFAULT 1 COMMENT '商品数量',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户购物车' ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of cy_shop_cart
-- ----------------------------
INSERT INTO `cy_shop_cart` VALUES (1, 1, 1, 1572805624, 1);

-- ----------------------------
-- Table structure for cy_shop_message
-- ----------------------------
DROP TABLE IF EXISTS `cy_shop_message`;
CREATE TABLE `cy_shop_message`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '内容',
  `type` tinyint(1) NULL DEFAULT 0 COMMENT '1-关于我们  2-客服联系 3-会员充值说明',
  `createTime` int(11) NULL DEFAULT NULL COMMENT '时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商城信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cy_shop_message
-- ----------------------------
INSERT INTO `cy_shop_message` VALUES (1, '第三方的范德萨颠三倒四', 1, 1572937985);
INSERT INTO `cy_shop_message` VALUES (2, '大幅度发的说法的发大幅度', 3, 1574150873);
INSERT INTO `cy_shop_message` VALUES (3, '的方法第三方的发发发', 2, 1574151020);

-- ----------------------------
-- Table structure for cy_user_address
-- ----------------------------
DROP TABLE IF EXISTS `cy_user_address`;
CREATE TABLE `cy_user_address`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` char(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'app用户唯一识别码',
  `province` char(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '省份',
  `city` char(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '市',
  `area` char(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地区',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '详细地址',
  `default` tinyint(1) NULL DEFAULT 0 COMMENT '默认地址 0-否 1-是',
  `createTime` int(11) NULL DEFAULT NULL,
  `name` char(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `phone` char(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话',
  `label` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标签 家 公司，，，',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户收货地址' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cy_user_address
-- ----------------------------
INSERT INTO `cy_user_address` VALUES (1, '1', 'sichuan', 'chengdu', 'jingjiang', 'niushihou', 1, 158240623, 'oathYc', '15828043607', NULL);

-- ----------------------------
-- Table structure for cy_user_coupon
-- ----------------------------
DROP TABLE IF EXISTS `cy_user_coupon`;
CREATE TABLE `cy_user_coupon`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NULL DEFAULT NULL,
  `couponId` int(11) NULL DEFAULT NULL COMMENT '优惠券Id',
  `orderId` int(11) NULL DEFAULT NULL COMMENT '用于那个订单',
  `createTime` int(11) NULL DEFAULT NULL COMMENT '使用时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户使用优惠卷' ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of cy_user_coupon
-- ----------------------------
INSERT INTO `cy_user_coupon` VALUES (1, 1, 1, 1, 158260435);

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
  `status` tinyint(1) NULL DEFAULT NULL COMMENT '状态 0-组团中 1-组团成功 2组团失败 ',
  `createTime` int(11) NULL DEFAULT NULL COMMENT '创建时间',
  `finishTime` int(11) NULL DEFAULT NULL COMMENT '组团成功时间',
  `orderId` int(11) NULL DEFAULT NULL COMMENT '对应的订单id',
  `userGroupId` int(11) NULL DEFAULT NULL COMMENT '同一组组团标识   发起人创建组团生成记录的id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户组团' ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of cy_user_group
-- ----------------------------
INSERT INTO `cy_user_group` VALUES (1, 1, 1, 1, 1, 0, 1582415265, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for cy_user_push
-- ----------------------------
DROP TABLE IF EXISTS `cy_user_push`;
CREATE TABLE `cy_user_push`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NULL DEFAULT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `createTime` int(11) NULL DEFAULT NULL,
  `type` tinyint(1) NULL DEFAULT NULL COMMENT '1-意见反馈',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '内容提交 反馈' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cy_user_push
-- ----------------------------
INSERT INTO `cy_user_push` VALUES (1, 1, 'dsssffdcd', 1596201233, 1);

SET FOREIGN_KEY_CHECKS = 1;
