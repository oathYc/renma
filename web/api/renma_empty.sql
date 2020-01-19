/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50726
Source Host           : localhost:3306
Source Database       : renma

Target Server Type    : MYSQL
Target Server Version : 50726
File Encoding         : 65001

Date: 2020-01-19 16:57:12
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for cy_advert
-- ----------------------------
DROP TABLE IF EXISTS `cy_advert`;
CREATE TABLE `cy_advert` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) DEFAULT '1' COMMENT '1-图片 2-视频',
  `imageUrl` varchar(255) DEFAULT NULL COMMENT '图片对应的链接地址',
  `url` varchar(255) DEFAULT NULL COMMENT '文件地址',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态 0-未使用 1-使用中',
  `createTime` int(11) DEFAULT NULL COMMENT '创建时间',
  `title` text COMMENT '标题',
  `rank` int(4) DEFAULT NULL COMMENT '排序',
  `imageType` tinyint(1) DEFAULT '0' COMMENT '1-商品 2-组团 0-其他',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='广告内容';

-- ----------------------------
-- Records of cy_advert
-- ----------------------------

-- ----------------------------
-- Table structure for cy_catalog
-- ----------------------------
DROP TABLE IF EXISTS `cy_catalog`;
CREATE TABLE `cy_catalog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `pid` int(4) DEFAULT '0' COMMENT '父级id 0-一级目录',
  `createTime` int(11) DEFAULT NULL,
  `rule` varchar(255) NOT NULL COMMENT '规则 所在控制器、方法',
  `rank` int(4) DEFAULT '0' COMMENT '排序 大到小',
  `showed` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1-显示',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=51 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='目录结构表';

-- ----------------------------
-- Records of cy_catalog
-- ----------------------------
INSERT INTO `cy_catalog` VALUES ('1', '权限功能', '0', '1561365326', 'rule', '11', '1');
INSERT INTO `cy_catalog` VALUES ('2', '角色', '1', '1561365326', 'role', '7', '1');
INSERT INTO `cy_catalog` VALUES ('3', '目录功能', '1', '1561365326', 'catalog', '4', '1');
INSERT INTO `cy_catalog` VALUES ('4', '会员管理', '0', '2019', 'member', '8', '1');
INSERT INTO `cy_catalog` VALUES ('5', '订单管理', '0', '1561445961', 'order', '4', '1');
INSERT INTO `cy_catalog` VALUES ('6', '商品管理', '0', '1561446136', 'product', '7', '1');
INSERT INTO `cy_catalog` VALUES ('13', '店铺管理', '0', '1561452444', 'shop', '3', '1');
INSERT INTO `cy_catalog` VALUES ('19', '优惠券设置', '15', '1572834451', 'coupon', '4', '1');
INSERT INTO `cy_catalog` VALUES ('15', '基本设置', '0', '1572588811', 'content', '9', '1');
INSERT INTO `cy_catalog` VALUES ('16', '首页logo', '15', '1572588862', 'logo-content', '10', '1');
INSERT INTO `cy_catalog` VALUES ('17', '广告内容', '15', '1572588922', 'advert', '9', '1');
INSERT INTO `cy_catalog` VALUES ('18', '商品分类', '6', '1572589268', 'category', '9', '1');
INSERT INTO `cy_catalog` VALUES ('20', '已添加店铺', '13', '1572837153', 'shop-success', '8', '1');
INSERT INTO `cy_catalog` VALUES ('21', '店铺审核', '13', '1572837178', 'shop-check', '7', '1');
INSERT INTO `cy_catalog` VALUES ('22', '优选商品', '6', '1572855506', 'good-product', '7', '1');
INSERT INTO `cy_catalog` VALUES ('23', '商品信息', '6', '1572867332', 'product-list', '8', '1');
INSERT INTO `cy_catalog` VALUES ('24', '组团商品', '45', '1572868884', 'product-group', '0', '1');
INSERT INTO `cy_catalog` VALUES ('25', '订单信息', '5', '1572868910', 'order-list', '9', '1');
INSERT INTO `cy_catalog` VALUES ('26', '组团信息', '45', '1572868997', 'group-list', '0', '1');
INSERT INTO `cy_catalog` VALUES ('27', '用户信息', '4', '1572869020', 'user-list', '9', '1');
INSERT INTO `cy_catalog` VALUES ('28', '优惠券使用', '4', '1572869050', 'coupon-use', '0', '1');
INSERT INTO `cy_catalog` VALUES ('29', '用户地址', '4', '1572869097', 'user-address', '8', '1');
INSERT INTO `cy_catalog` VALUES ('30', '订单物流', '5', '1572869144', 'order-logistics', '8', '1');
INSERT INTO `cy_catalog` VALUES ('31', '用户分享', '4', '1572869185', 'user-share', '6', '1');
INSERT INTO `cy_catalog` VALUES ('32', '质保商品', '6', '1572869254', 'quality-product', '6', '1');
INSERT INTO `cy_catalog` VALUES ('33', '关于我们', '15', '1572869306', 'about-us', '8', '1');
INSERT INTO `cy_catalog` VALUES ('34', '用户反馈', '4', '1572869334', 'user-feedback', '7', '1');
INSERT INTO `cy_catalog` VALUES ('35', '用户购物车', '4', '1572869476', 'user-shop-cart', '5', '1');
INSERT INTO `cy_catalog` VALUES ('36', '客服联系', '15', '1574151575', 'service', '6', '1');
INSERT INTO `cy_catalog` VALUES ('37', '会员充值', '15', '1574151614', 'member-remark', '3', '1');
INSERT INTO `cy_catalog` VALUES ('38', '积分规则', '15', '1575534323', 'integral-rule', '7', '1');
INSERT INTO `cy_catalog` VALUES ('39', '会员优惠说明', '15', '1576658036', 'member-desc', '5', '1');
INSERT INTO `cy_catalog` VALUES ('40', '维修师审核', '46', '1576658251', 'repair-check', '9', '1');
INSERT INTO `cy_catalog` VALUES ('43', '维修师订单', '46', '1577764530', 'repair-order', '7', '1');
INSERT INTO `cy_catalog` VALUES ('42', '待售后订单', '5', '1576916677', 'order-after', '7', '1');
INSERT INTO `cy_catalog` VALUES ('44', '店铺添加', '13', '1578031645', 'shop-add', '9', '1');
INSERT INTO `cy_catalog` VALUES ('45', '拼团设置', '0', '1578031707', 'group', '6', '1');
INSERT INTO `cy_catalog` VALUES ('46', '维修师栏目', '0', '1578031732', 'repair', '5', '1');
INSERT INTO `cy_catalog` VALUES ('47', '已付款订单', '5', '1578032422', 'had-buy', '0', '1');
INSERT INTO `cy_catalog` VALUES ('48', '已发货订单', '5', '1578032447', 'had-send', '0', '1');
INSERT INTO `cy_catalog` VALUES ('49', '代付款订单', '5', '1578032473', 'need-buy', '0', '1');
INSERT INTO `cy_catalog` VALUES ('50', '维修师提现', '46', '1578034185', 'repair-return', '8', '1');

-- ----------------------------
-- Table structure for cy_category
-- ----------------------------
DROP TABLE IF EXISTS `cy_category`;
CREATE TABLE `cy_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(4) DEFAULT '0' COMMENT '父级id',
  `name` varchar(50) DEFAULT NULL COMMENT '分类名称',
  `rank` int(4) DEFAULT '0' COMMENT '排序',
  `createTime` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=55 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='问题类型分类  两级';

-- ----------------------------
-- Records of cy_category
-- ----------------------------

-- ----------------------------
-- Table structure for cy_coupon
-- ----------------------------
DROP TABLE IF EXISTS `cy_coupon`;
CREATE TABLE `cy_coupon` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `money` int(10) DEFAULT NULL COMMENT '优惠金额',
  `least` int(10) DEFAULT '0' COMMENT '起步价',
  `integral` int(11) DEFAULT NULL COMMENT '数量',
  `createTime` int(11) DEFAULT NULL,
  `remark` text COMMENT '优惠券描述',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='优惠券';

-- ----------------------------
-- Records of cy_coupon
-- ----------------------------

-- ----------------------------
-- Table structure for cy_good_product
-- ----------------------------
DROP TABLE IF EXISTS `cy_good_product`;
CREATE TABLE `cy_good_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `productId` int(11) DEFAULT NULL COMMENT '商品id',
  `rank` int(4) DEFAULT '0' COMMENT '排序',
  `createTime` int(11) DEFAULT NULL COMMENT '时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='优选商品';

-- ----------------------------
-- Records of cy_good_product
-- ----------------------------

-- ----------------------------
-- Table structure for cy_group_category
-- ----------------------------
DROP TABLE IF EXISTS `cy_group_category`;
CREATE TABLE `cy_group_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) DEFAULT NULL COMMENT '组团商品表id',
  `cateDesc` varchar(80) DEFAULT NULL COMMENT '分类描述',
  `price` decimal(10,2) DEFAULT NULL COMMENT '价格',
  `createTime` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='组团商品规则分类';

-- ----------------------------
-- Records of cy_group_category
-- ----------------------------

-- ----------------------------
-- Table structure for cy_group_product
-- ----------------------------
DROP TABLE IF EXISTS `cy_group_product`;
CREATE TABLE `cy_group_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `productId` int(5) DEFAULT NULL COMMENT '商品id',
  `number` int(2) DEFAULT NULL COMMENT '组团人数',
  `price` decimal(10,2) DEFAULT NULL COMMENT '组团价格',
  `remark` text COMMENT '组团说明',
  `createTime` int(11) DEFAULT NULL COMMENT '添加时间',
  `rank` int(4) DEFAULT NULL COMMENT '排序',
  `groupTime` int(2) NOT NULL DEFAULT '1' COMMENT '组团有效时间 天',
  `return` int(11) DEFAULT NULL COMMENT '返现金额',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='组团商品';

-- ----------------------------
-- Records of cy_group_product
-- ----------------------------

-- ----------------------------
-- Table structure for cy_logo
-- ----------------------------
DROP TABLE IF EXISTS `cy_logo`;
CREATE TABLE `cy_logo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text,
  `createTime` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '0' COMMENT '状态 1-当前使用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='logo滚动内容';

-- ----------------------------
-- Records of cy_logo
-- ----------------------------

-- ----------------------------
-- Table structure for cy_member
-- ----------------------------
DROP TABLE IF EXISTS `cy_member`;
CREATE TABLE `cy_member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nickname` varchar(40) CHARACTER SET utf8 DEFAULT NULL COMMENT '昵称',
  `name` varchar(40) CHARACTER SET utf8 DEFAULT NULL COMMENT '姓名',
  `avatar` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '头像地址',
  `sex` tinyint(1) NOT NULL DEFAULT '0' COMMENT '性别 1-男 2-女',
  `birthday` char(12) CHARACTER SET utf8 DEFAULT NULL COMMENT '生日',
  `work` char(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '职业',
  `phone` char(12) CHARACTER SET utf8 DEFAULT NULL COMMENT '电话',
  `identity` char(19) CHARACTER SET utf8 DEFAULT NULL COMMENT '身份证',
  `integral` int(6) DEFAULT NULL COMMENT '积分',
  `member` tinyint(1) DEFAULT '0' COMMENT '会员状态 1-是 0-不是',
  `memberTime` int(11) DEFAULT NULL COMMENT '成为会员的时间',
  `inviteCode` char(8) CHARACTER SET utf8 DEFAULT NULL COMMENT '邀请码',
  `inviterCode` char(8) CHARACTER SET utf8 DEFAULT NULL COMMENT '邀请人的邀请码',
  `createTime` int(11) DEFAULT NULL COMMENT '创建时间',
  `openId` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '用户微信账号的openId',
  `province` varchar(40) CHARACTER SET utf8 DEFAULT NULL COMMENT '省',
  `city` varchar(40) CHARACTER SET utf8 DEFAULT NULL COMMENT '市',
  `area` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '地区',
  `password` varchar(80) CHARACTER SET utf8 DEFAULT NULL COMMENT '密码',
  `memberLevel` tinyint(1) DEFAULT NULL,
  `repair` tinyint(1) DEFAULT '0' COMMENT '维修师身份  0-不是 1-是 -1 审核中',
  `repairName` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '维修师姓名',
  `repairPhone` char(12) CHARACTER SET utf8 DEFAULT NULL COMMENT '维修师电话',
  `repairMoney` decimal(10,2) DEFAULT '0.00' COMMENT '会员维修师金额',
  `repairTotalMoney` decimal(10,2) DEFAULT '0.00' COMMENT '总金额',
  `memberMoney` decimal(10,2) DEFAULT '0.00' COMMENT '会员钱包',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='用户信息';

-- ----------------------------
-- Records of cy_member
-- ----------------------------

-- ----------------------------
-- Table structure for cy_member_log
-- ----------------------------
DROP TABLE IF EXISTS `cy_member_log`;
CREATE TABLE `cy_member_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `beginTime` int(11) DEFAULT NULL COMMENT '开始时间',
  `endTime` int(11) DEFAULT NULL COMMENT '结束时间',
  `createTime` int(11) DEFAULT NULL,
  `orderId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=2501 DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='成员开通会员记录';

-- ----------------------------
-- Records of cy_member_log
-- ----------------------------

-- ----------------------------
-- Table structure for cy_member_money_record
-- ----------------------------
DROP TABLE IF EXISTS `cy_member_money_record`;
CREATE TABLE `cy_member_money_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL COMMENT '用户id',
  `orderId` int(11) DEFAULT NULL COMMENT '订单id',
  `money` decimal(10,2) DEFAULT NULL COMMENT '收入金额',
  `type` tinyint(1) DEFAULT '1' COMMENT '金额状态 1-增加 2-减少',
  `createTime` int(11) DEFAULT NULL,
  `moneyType` tinyint(1) DEFAULT NULL COMMENT '金额来源 1-组团',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='会员金额记录';

-- ----------------------------
-- Records of cy_member_money_record
-- ----------------------------

-- ----------------------------
-- Table structure for cy_order
-- ----------------------------
DROP TABLE IF EXISTS `cy_order`;
CREATE TABLE `cy_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderNumber` varchar(80) NOT NULL COMMENT '订单号',
  `uid` int(11) NOT NULL COMMENT '用户uid',
  `productId` int(11) DEFAULT NULL COMMENT '商品Id',
  `productTitle` varchar(255) DEFAULT NULL COMMENT '商品名称',
  `totalPrice` decimal(10,2) DEFAULT NULL COMMENT '订单总价',
  `reducePrice` decimal(10,2) DEFAULT NULL COMMENT '订单优惠卷优惠价格',
  `payPrice` decimal(10,2) DEFAULT NULL COMMENT '实际支付价格',
  `coupon` int(5) DEFAULT NULL COMMENT '优惠券Id',
  `number` int(5) DEFAULT '1' COMMENT '商品数量',
  `extInfo` text COMMENT '其他信息',
  `status` int(1) DEFAULT NULL COMMENT '订单状态 1-支付成功 0-支付中 -1 退款中 -2 退款成功 -3 退款失败',
  `createTime` int(11) DEFAULT NULL COMMENT '订单时间',
  `payType` int(1) DEFAULT '1' COMMENT '支付类型  0-其他 1-微信',
  `paySign` varchar(255) DEFAULT NULL COMMENT '支付签名 回调验证',
  `ip` char(20) DEFAULT NULL COMMENT '下单ip',
  `finishTime` int(11) DEFAULT NULL COMMENT '完成时间',
  `type` tinyint(1) DEFAULT '0' COMMENT '付款类型 1-充值 2-买商品',
  `address` varchar(255) DEFAULT NULL COMMENT '地址Id',
  `integral` int(11) DEFAULT NULL COMMENT '积分消费',
  `remark` text COMMENT '订单备注',
  `productType` tinyint(1) DEFAULT '1' COMMENT '1-商品购买 2-组团 购买 3-购物车',
  `evaluate` text,
  `typeStatus` tinyint(1) DEFAULT '0' COMMENT '0-代付款 1-待接单 2-已接单 3-待评价 4-待售后',
  `evalTime` int(11) DEFAULT NULL COMMENT '评价时间',
  `evalImage` text COMMENT '图片',
  `evalVideo` text COMMENT '视频',
  `serverFee` int(11) DEFAULT '0' COMMENT '服务费',
  `repairUid` int(11) DEFAULT NULL COMMENT '维修师id',
  `repairImg` varchar(255) DEFAULT NULL COMMENT '维修图片',
  `repairTime` int(11) DEFAULT NULL COMMENT '接单时间',
  `proType` tinyint(1) DEFAULT NULL COMMENT '商品类型 1-维修 2-新车 3-二手车',
  `repairSuccess` int(11) DEFAULT NULL COMMENT '维修师完成时间',
  `returnRemark` text COMMENT '退款说明',
  `returnTime` int(11) DEFAULT NULL COMMENT '退款申请时间',
  `returnSuccess` int(11) DEFAULT NULL COMMENT '完成时间',
  `refuseRemark` text COMMENT '拒绝理由',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=2918 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='订单记录表';

-- ----------------------------
-- Records of cy_order
-- ----------------------------

-- ----------------------------
-- Table structure for cy_order_logistics
-- ----------------------------
DROP TABLE IF EXISTS `cy_order_logistics`;
CREATE TABLE `cy_order_logistics` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderId` int(11) DEFAULT NULL COMMENT '订单Id',
  `logistics` varchar(30) DEFAULT NULL COMMENT '物流号',
  `name` varchar(30) DEFAULT NULL COMMENT '物流名称',
  `createTime` int(11) DEFAULT NULL COMMENT '发送时间',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '完成状态 1-完成 0-未完成',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='订单物流';

-- ----------------------------
-- Records of cy_order_logistics
-- ----------------------------

-- ----------------------------
-- Table structure for cy_product
-- ----------------------------
DROP TABLE IF EXISTS `cy_product`;
CREATE TABLE `cy_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `catPid` int(5) DEFAULT NULL COMMENT '一级分类',
  `catCid` int(5) DEFAULT NULL COMMENT '二级分类',
  `price` decimal(10,2) DEFAULT NULL COMMENT '价格',
  `voltage` varchar(30) DEFAULT NULL COMMENT '电压',
  `mileage` varchar(50) DEFAULT NULL COMMENT '续航里程',
  `sex` char(4) DEFAULT '0' COMMENT '性别使用 0-通用 1-男 2-女',
  `headMsg` varchar(255) DEFAULT NULL COMMENT '封面展示 图片',
  `image` text COMMENT '图片',
  `tradeAddress` varchar(255) DEFAULT NULL COMMENT '交易地点',
  `createTime` int(11) DEFAULT NULL,
  `brand` varchar(80) DEFAULT NULL COMMENT '品牌名称',
  `introduce` text COMMENT '详细介绍',
  `type` tinyint(1) DEFAULT '0' COMMENT '商品类型 1-维修 2-新车 3-二手车',
  `uid` int(11) DEFAULT NULL COMMENT '用户id',
  `number` int(11) DEFAULT '1' COMMENT '库存',
  `flushTime` int(11) DEFAULT NULL COMMENT '刷新时间',
  `zhibao` tinyint(1) DEFAULT '0' COMMENT '质保商品 0-不是 1-是',
  `remark` text COMMENT '商品说明',
  `phone` varchar(20) DEFAULT NULL COMMENT '联系电话',
  `video` varchar(255) DEFAULT NULL COMMENT '商品视频',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='商品';

-- ----------------------------
-- Records of cy_product
-- ----------------------------

-- ----------------------------
-- Table structure for cy_product_category
-- ----------------------------
DROP TABLE IF EXISTS `cy_product_category`;
CREATE TABLE `cy_product_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `productId` int(11) DEFAULT NULL COMMENT '商品id',
  `cateDesc` varchar(80) DEFAULT NULL COMMENT '分类描述',
  `price` decimal(10,2) DEFAULT NULL COMMENT '价格',
  `createTime` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='商品颜色';

-- ----------------------------
-- Records of cy_product_category
-- ----------------------------

-- ----------------------------
-- Table structure for cy_quality_product
-- ----------------------------
DROP TABLE IF EXISTS `cy_quality_product`;
CREATE TABLE `cy_quality_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `productId` int(11) DEFAULT NULL COMMENT '商品Id',
  `catId` int(5) DEFAULT NULL COMMENT '分类Id',
  `brand` int(5) DEFAULT NULL COMMENT '品牌',
  `buyTime` int(11) DEFAULT NULL COMMENT '购买日期',
  `gyTime` int(11) DEFAULT NULL COMMENT '商品钢印日期',
  `barCode` varchar(255) DEFAULT NULL COMMENT '条形码',
  `createTime` int(11) DEFAULT NULL COMMENT '上传时间',
  `productName` varchar(255) DEFAULT NULL COMMENT '质保商品名称',
  `after` tinyint(1) DEFAULT '0' COMMENT '1-申请售后',
  `orderId` int(11) DEFAULT NULL COMMENT '订单id',
  `afterUid` int(11) DEFAULT NULL COMMENT '售后维修师id',
  `afterMsg` varchar(255) DEFAULT NULL COMMENT '维修视频或图片',
  `name` varchar(255) DEFAULT NULL COMMENT '联系姓名',
  `phone` char(12) DEFAULT NULL COMMENT '联系电话 ',
  `address` varchar(255) DEFAULT NULL COMMENT '联系地址',
  `location` varchar(255) DEFAULT NULL COMMENT '经纬度',
  `repairTime` int(11) DEFAULT NULL COMMENT '派单时间',
  `repairImg` varchar(255) DEFAULT NULL COMMENT '完成图片',
  `repairSuccess` int(11) DEFAULT NULL COMMENT '完成时间',
  `afterTime` int(11) DEFAULT NULL COMMENT '申请时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '售后备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=44 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='质保商品';

-- ----------------------------
-- Records of cy_quality_product
-- ----------------------------

-- ----------------------------
-- Table structure for cy_repair_return
-- ----------------------------
DROP TABLE IF EXISTS `cy_repair_return`;
CREATE TABLE `cy_repair_return` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL COMMENT '用户uid',
  `money` decimal(10,2) DEFAULT '0.00' COMMENT '体现金额',
  `status` tinyint(1) DEFAULT '0' COMMENT '状态 0-未提现（待审核） 1-已体现',
  `createTime` int(11) DEFAULT NULL COMMENT '提现时间',
  `checkTime` int(11) DEFAULT NULL COMMENT '平台审核通过时间',
  `type` tinyint(1) DEFAULT '1' COMMENT '1-维修师 2-会员',
  `phone` char(12) DEFAULT NULL COMMENT '提现账号',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='维修师体现记录';

-- ----------------------------
-- Records of cy_repair_return
-- ----------------------------

-- ----------------------------
-- Table structure for cy_role
-- ----------------------------
DROP TABLE IF EXISTS `cy_role`;
CREATE TABLE `cy_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `createTime` int(11) DEFAULT NULL,
  `createUser` int(5) DEFAULT NULL COMMENT '创建人',
  `createPower` tinyint(1) DEFAULT '0' COMMENT '编辑角色权限 1-有 0-无',
  `realPass` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户角色表';

-- ----------------------------
-- Records of cy_role
-- ----------------------------
INSERT INTO `cy_role` VALUES ('1', 'admin', '25b6e0de03803595e069456b4b37fd8c', '1561365326', '0', '1', 'cyAdmin');

-- ----------------------------
-- Table structure for cy_role_catalog
-- ----------------------------
DROP TABLE IF EXISTS `cy_role_catalog`;
CREATE TABLE `cy_role_catalog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roleId` int(11) NOT NULL COMMENT '角色id',
  `cataId` int(11) NOT NULL COMMENT '目录id',
  `createTime` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=78 DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='角色权限表';

-- ----------------------------
-- Records of cy_role_catalog
-- ----------------------------
INSERT INTO `cy_role_catalog` VALUES ('1', '1', '1', '1561365326');
INSERT INTO `cy_role_catalog` VALUES ('2', '1', '2', '1561365326');
INSERT INTO `cy_role_catalog` VALUES ('3', '1', '3', '1561365326');
INSERT INTO `cy_role_catalog` VALUES ('5', '1', '13', '1561452444');
INSERT INTO `cy_role_catalog` VALUES ('6', '1', '4', '1561452444');
INSERT INTO `cy_role_catalog` VALUES ('7', '1', '5', '1561452444');
INSERT INTO `cy_role_catalog` VALUES ('8', '1', '6', '1561452444');
INSERT INTO `cy_role_catalog` VALUES ('42', '1', '15', '1572588811');
INSERT INTO `cy_role_catalog` VALUES ('43', '1', '16', '1572588862');
INSERT INTO `cy_role_catalog` VALUES ('44', '1', '17', '1572588922');
INSERT INTO `cy_role_catalog` VALUES ('45', '1', '18', '1572589268');
INSERT INTO `cy_role_catalog` VALUES ('46', '1', '19', '1572834451');
INSERT INTO `cy_role_catalog` VALUES ('47', '1', '20', '1572837153');
INSERT INTO `cy_role_catalog` VALUES ('48', '1', '21', '1572837178');
INSERT INTO `cy_role_catalog` VALUES ('49', '1', '22', '1572855506');
INSERT INTO `cy_role_catalog` VALUES ('50', '1', '23', '1572867332');
INSERT INTO `cy_role_catalog` VALUES ('51', '1', '24', '1572868884');
INSERT INTO `cy_role_catalog` VALUES ('52', '1', '25', '1572868910');
INSERT INTO `cy_role_catalog` VALUES ('53', '1', '26', '1572868997');
INSERT INTO `cy_role_catalog` VALUES ('54', '1', '27', '1572869020');
INSERT INTO `cy_role_catalog` VALUES ('55', '1', '28', '1572869050');
INSERT INTO `cy_role_catalog` VALUES ('56', '1', '29', '1572869097');
INSERT INTO `cy_role_catalog` VALUES ('57', '1', '30', '1572869144');
INSERT INTO `cy_role_catalog` VALUES ('58', '1', '31', '1572869185');
INSERT INTO `cy_role_catalog` VALUES ('59', '1', '32', '1572869254');
INSERT INTO `cy_role_catalog` VALUES ('60', '1', '33', '1572869306');
INSERT INTO `cy_role_catalog` VALUES ('61', '1', '34', '1572869334');
INSERT INTO `cy_role_catalog` VALUES ('62', '1', '35', '1572869476');
INSERT INTO `cy_role_catalog` VALUES ('63', '1', '36', '1574151575');
INSERT INTO `cy_role_catalog` VALUES ('64', '1', '37', '1574151614');
INSERT INTO `cy_role_catalog` VALUES ('65', '1', '38', '1575534323');
INSERT INTO `cy_role_catalog` VALUES ('66', '1', '39', '1576658036');
INSERT INTO `cy_role_catalog` VALUES ('67', '1', '40', '1576658251');
INSERT INTO `cy_role_catalog` VALUES ('70', '1', '43', '1577764530');
INSERT INTO `cy_role_catalog` VALUES ('69', '1', '42', '1576916677');
INSERT INTO `cy_role_catalog` VALUES ('71', '1', '44', '1578031645');
INSERT INTO `cy_role_catalog` VALUES ('72', '1', '45', '1578031707');
INSERT INTO `cy_role_catalog` VALUES ('73', '1', '46', '1578031732');
INSERT INTO `cy_role_catalog` VALUES ('74', '1', '47', '1578032422');
INSERT INTO `cy_role_catalog` VALUES ('75', '1', '48', '1578032447');
INSERT INTO `cy_role_catalog` VALUES ('76', '1', '49', '1578032473');
INSERT INTO `cy_role_catalog` VALUES ('77', '1', '50', '1578034185');

-- ----------------------------
-- Table structure for cy_search
-- ----------------------------
DROP TABLE IF EXISTS `cy_search`;
CREATE TABLE `cy_search` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) DEFAULT NULL COMMENT '类型 1-电压 2-续航',
  `val` varchar(255) DEFAULT NULL COMMENT '内容',
  `createTime` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL COMMENT '类型',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='筛选内容';

-- ----------------------------
-- Records of cy_search
-- ----------------------------

-- ----------------------------
-- Table structure for cy_shop
-- ----------------------------
DROP TABLE IF EXISTS `cy_shop`;
CREATE TABLE `cy_shop` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '店铺名',
  `phone` char(12) DEFAULT NULL COMMENT '电话',
  `shopTime` char(20) DEFAULT NULL COMMENT '营业时间',
  `video` varchar(255) DEFAULT NULL COMMENT '店铺视频',
  `image` text COMMENT '店铺图片',
  `address` varchar(255) DEFAULT NULL COMMENT '详细地址',
  `introduce` text COMMENT '店铺介绍',
  `status` tinyint(1) DEFAULT NULL COMMENT '店铺状态 1-申请成功 -1申请失败 0-待审核',
  `createTime` int(11) DEFAULT NULL,
  `headImage` varchar(100) DEFAULT NULL COMMENT '店铺头图',
  `checkTime` int(11) DEFAULT NULL COMMENT '审核时间',
  `province` char(40) DEFAULT NULL COMMENT '省',
  `city` char(40) DEFAULT NULL COMMENT '市',
  `area` char(40) DEFAULT NULL COMMENT '地区',
  `uid` int(11) DEFAULT NULL COMMENT '会员id',
  `checkRemark` text COMMENT '审核理由',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='商家店铺';

-- ----------------------------
-- Records of cy_shop
-- ----------------------------

-- ----------------------------
-- Table structure for cy_shop_cart
-- ----------------------------
DROP TABLE IF EXISTS `cy_shop_cart`;
CREATE TABLE `cy_shop_cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `productId` int(11) DEFAULT NULL,
  `createTime` int(11) DEFAULT NULL,
  `number` int(3) DEFAULT '1' COMMENT '数量',
  `catPriceId` int(11) DEFAULT '0' COMMENT '分类价格id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=138 DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='用户购物车';

-- ----------------------------
-- Records of cy_shop_cart
-- ----------------------------

-- ----------------------------
-- Table structure for cy_shop_message
-- ----------------------------
DROP TABLE IF EXISTS `cy_shop_message`;
CREATE TABLE `cy_shop_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text COMMENT '内容',
  `type` tinyint(1) DEFAULT '0' COMMENT '1-关于我们  2-客服联系 3-会员充值说明',
  `createTime` int(11) DEFAULT NULL COMMENT '时间',
  `image` varchar(255) DEFAULT NULL COMMENT '图片',
  `phone` varchar(40) DEFAULT NULL COMMENT '联系电话',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='商城信息';

-- ----------------------------
-- Records of cy_shop_message
-- ----------------------------

-- ----------------------------
-- Table structure for cy_user_address
-- ----------------------------
DROP TABLE IF EXISTS `cy_user_address`;
CREATE TABLE `cy_user_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` char(25) DEFAULT NULL COMMENT 'app用户唯一识别码',
  `province` char(25) DEFAULT NULL COMMENT '省份',
  `city` char(25) DEFAULT NULL COMMENT '市',
  `area` char(25) DEFAULT NULL COMMENT '地区',
  `address` varchar(255) DEFAULT NULL COMMENT '详细地址',
  `default` tinyint(1) DEFAULT '0' COMMENT '默认地址 0-否 1-是',
  `createTime` int(11) DEFAULT NULL,
  `name` char(40) DEFAULT NULL COMMENT '姓名',
  `phone` char(12) DEFAULT NULL COMMENT '电话',
  `label` varchar(30) DEFAULT NULL COMMENT '标签',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=261 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户收货地址';

-- ----------------------------
-- Records of cy_user_address
-- ----------------------------

-- ----------------------------
-- Table structure for cy_user_coupon
-- ----------------------------
DROP TABLE IF EXISTS `cy_user_coupon`;
CREATE TABLE `cy_user_coupon` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `couponId` int(11) DEFAULT NULL COMMENT '优惠券Id',
  `orderId` int(11) DEFAULT NULL COMMENT '用于那个订单',
  `createTime` int(11) DEFAULT NULL COMMENT '使用时间',
  `status` tinyint(1) DEFAULT '0' COMMENT '状态  0 未使用 1-已使用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=167 DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='用户使用优惠卷';

-- ----------------------------
-- Records of cy_user_coupon
-- ----------------------------

-- ----------------------------
-- Table structure for cy_user_group
-- ----------------------------
DROP TABLE IF EXISTS `cy_user_group`;
CREATE TABLE `cy_user_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL COMMENT '用户id',
  `groupId` int(11) DEFAULT NULL COMMENT '组团id',
  `promoter` tinyint(1) DEFAULT '0' COMMENT '发起人 1-是 0不是',
  `promoterUid` int(11) DEFAULT NULL COMMENT '发起人的uid',
  `status` tinyint(1) DEFAULT NULL COMMENT '状态 0-组团中 1-组团成功 2组团失败 ',
  `createTime` int(11) DEFAULT NULL COMMENT '创建时间',
  `finishTime` int(11) DEFAULT NULL COMMENT '组团成功时间',
  `orderId` int(11) DEFAULT NULL COMMENT '对应的订单id',
  `userGroupId` int(11) DEFAULT NULL COMMENT '同一组组团标识   发起人创建组团生成记录的id',
  `catPriceId` int(11) DEFAULT '0' COMMENT '组团分类id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='用户组团';

-- ----------------------------
-- Records of cy_user_group
-- ----------------------------

-- ----------------------------
-- Table structure for cy_user_integral
-- ----------------------------
DROP TABLE IF EXISTS `cy_user_integral`;
CREATE TABLE `cy_user_integral` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `integral` int(11) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL COMMENT '描述',
  `createTime` int(11) DEFAULT NULL,
  `type` tinyint(1) DEFAULT '1' COMMENT '1-减少 2-新增',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cy_user_integral
-- ----------------------------

-- ----------------------------
-- Table structure for cy_user_push
-- ----------------------------
DROP TABLE IF EXISTS `cy_user_push`;
CREATE TABLE `cy_user_push` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `content` text,
  `createTime` int(11) DEFAULT NULL,
  `type` tinyint(1) DEFAULT NULL COMMENT '1-意见反馈',
  `image` text COMMENT '图片',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='内容提交 反馈';

-- ----------------------------
-- Records of cy_user_push
-- ----------------------------
