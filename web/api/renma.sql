/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50726
Source Host           : localhost:3306
Source Database       : renma

Target Server Type    : MYSQL
Target Server Version : 50726
File Encoding         : 65001

Date: 2020-03-16 16:14:16
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
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='广告内容';

-- ----------------------------
-- Records of cy_advert
-- ----------------------------
INSERT INTO `cy_advert` VALUES ('19', '2', '', 'https://lck.hzlyzhenzhi.com/files/attach/file/20200311/1583903915828835.mp4', '1', '1583903919', '', '0', '0');

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
) ENGINE=MyISAM AUTO_INCREMENT=61 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='目录结构表';

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
INSERT INTO `cy_catalog` VALUES ('51', '地区限制', '15', '1582617796', 'area-check', '1', '1');
INSERT INTO `cy_catalog` VALUES ('52', '刷新金额', '15', '1582686647', 'flush-money', '1', '1');
INSERT INTO `cy_catalog` VALUES ('53', '图片设置', '15', '1582795062', 'set-image', '1', '1');
INSERT INTO `cy_catalog` VALUES ('54', '活动规则', '15', '1582855079', 'activity-rule', '1', '1');
INSERT INTO `cy_catalog` VALUES ('55', '会员充值设置', '15', '1583153962', 'member-recharge', '1', '1');
INSERT INTO `cy_catalog` VALUES ('56', '反馈微信电话', '15', '1583373430', 'option-phone', '0', '1');
INSERT INTO `cy_catalog` VALUES ('57', '筛选设置', '15', '1583376056', 'search-set', '0', '1');
INSERT INTO `cy_catalog` VALUES ('58', '用户收藏', '4', '1583566454', 'user-collect', '0', '1');
INSERT INTO `cy_catalog` VALUES ('59', '提现手续费', '15', '1583570994', 'return-money', '0', '1');
INSERT INTO `cy_catalog` VALUES ('60', '用户提现', '4', '1583658571', 'user-return', '0', '1');

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
  `image` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=79 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='问题类型分类  两级';

-- ----------------------------
-- Records of cy_category
-- ----------------------------
INSERT INTO `cy_category` VALUES ('75', '0', '天能电池', '0', '1583904218', '');
INSERT INTO `cy_category` VALUES ('73', '0', '真空胎', '0', '1583904166', null);
INSERT INTO `cy_category` VALUES ('74', '0', '头盔', '0', '1583904182', null);
INSERT INTO `cy_category` VALUES ('76', '0', '雨衣', '0', '1583904231', null);
INSERT INTO `cy_category` VALUES ('77', '0', '充电器', '0', '1583904257', null);

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
  `day` int(11) DEFAULT '7' COMMENT '有效期',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='优惠券';

-- ----------------------------
-- Records of cy_coupon
-- ----------------------------
INSERT INTO `cy_coupon` VALUES ('14', '数量有限', '1', '100', '0', '1584093562', '快抢', '2');

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
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='优选商品';

-- ----------------------------
-- Records of cy_good_product
-- ----------------------------
INSERT INTO `cy_good_product` VALUES ('10', '69', '0', '1583907812');

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
) ENGINE=MyISAM AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='组团商品规则分类';

-- ----------------------------
-- Records of cy_group_category
-- ----------------------------
INSERT INTO `cy_group_category` VALUES ('29', '5', '40km', '0.01', '1579501227');
INSERT INTO `cy_group_category` VALUES ('30', '6', '以旧换新', '1999.00', '1580194799');
INSERT INTO `cy_group_category` VALUES ('31', '8', '团购测试', '2.00', '1583908054');

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
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='组团商品';

-- ----------------------------
-- Records of cy_group_product
-- ----------------------------
INSERT INTO `cy_group_product` VALUES ('8', '69', '2', '2.00', '每邀请一个好友团购交易成功返现1元，邀请2位好友全额返还0元购', '1583908054', null, '1', '1');

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
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='logo滚动内容';

-- ----------------------------
-- Records of cy_logo
-- ----------------------------
INSERT INTO `cy_logo` VALUES ('6', '欢迎使用仁马二手车', '1579500771', '0');
INSERT INTO `cy_logo` VALUES ('7', '仁马在线·安心出行', '1580186656', '0');
INSERT INTO `cy_logo` VALUES ('8', '上门服务时间7：00-19:00', '1583900793', '1');

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
  `pushNumber` int(11) DEFAULT '0' COMMENT '推送次数',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=169 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='用户信息';

-- ----------------------------
-- Records of cy_member
-- ----------------------------
INSERT INTO `cy_member` VALUES ('49', '小倩', null, 'https://wx.qlogo.cn/mmopen/vi_32/63CbeSL3Jlysf4Gt08alOOXnWr2dDfmxNMuzGggDVh2XFVncH8N0gvjBYfT4dmdcjeZLOAic4cibicKpOVaLQDf3g/132', '0', null, null, null, null, null, '1', null, 'SCS8NOW', null, '1579492781', 'oAi5t5frE65JowTLgMfS1mE4yJhI', 'Dusseldorf', '', '', null, '1', '0', null, null, '0.00', '0.00', '0.00', '0');
INSERT INTO `cy_member` VALUES ('50', '杰锅锅', '', 'https://wx.qlogo.cn/mmopen/vi_32/3peVc9cwjia7W0v0Bk5rhwLWlNqY2YhvM42VHLhtWqAxyXhOw29Szl8lrbxs0w5b6EK8My5CicnvNunZt8BdeLWQ/132', '0', null, null, '', null, '902', '1', null, 'LG9LPPC1', 'DG0UO5YP', '1579492812', 'oAi5t5YSFcd7XUTFbJIE55J0kyKA', 'Sichuan', 'Chengdu', 'China', null, '4', '1', '杰', '18383397420', '6.01', '6.01', '9.00', '72');
INSERT INTO `cy_member` VALUES ('116', 'just', null, 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKgJqcLv9icYYQkAX9Kx01icCgc6SHYty7tib4YHbkvOWdwCF6sWuyI7yJvsFPFicOXYP8IoCth0gZ1PA/132', '0', null, null, null, null, '14', '1', null, 'GBHNYAJQ', null, '1582812844', 'oAi5t5YLgo6T9Wu6lCLJ3Y8da-Zs', 'Sichuan', 'Chengdu', 'China', null, '4', '1', '110', '110', '38.00', '38.00', '17.00', '53');
INSERT INTO `cy_member` VALUES ('52', '王昌栋', '张屇噷', 'https://wx.qlogo.cn/mmopen/vi_32/4kF5cFK9MN4pczl7aPcVengfA5MzbkF3X2Xug7fU0xKHycZyvdZibyJRGFk13fRMcVibvayiazVWFyFPIMFqOH5WA/132', '1', 'JpJ0teiq', 'CG5CmyWN', '48ObiXzz', 'gtpaXrbT', null, '1', null, 'SH8K1P4L', null, '1579498423', 'oAi5t5bzdCgPZxWVRqdfTzVQ05Ek', 'Guangdong', 'Guangzhou', 'China', null, '1', '-1', 'Iod2m9Qp', 'Iod2m9Qp', '0.00', '0.00', '0.00', '0');
INSERT INTO `cy_member` VALUES ('53', '清新', '杨屯谙', 'https://wx.qlogo.cn/mmopen/vi_32/PiajxSqBRaEIqeTy52CxJ7qpMDJ1mD3QZ7WLmtzC0F9ATjYjO221cBcjDLZUw5mrYG8fricTDyBlB9u6JCknBzSQ/132', '1', 'sE9KPY0g', 'GpsU64lA', 'sE9KPY0g', 'SDAqW1nv', null, '1', null, 'FW9LKBNZ', null, '1579498943', 'oAi5t5TYFdNzBNDx0NLODj4bghbg', 'SDAqW1nv', 'O6ocVIkY', 'GpsU64lA', null, '1', '0', null, null, '0.00', '0.00', '0.00', '0');
INSERT INTO `cy_member` VALUES ('54', '超_越梦想', null, null, '0', null, null, null, null, null, '1', null, 'K79SK1B3', null, '1579498944', 'oAi5t5RvXmEimkgS_2Hsa-tRrEVE', 'Shandong', 'Yantai', 'China', null, '1', '0', null, null, '0.00', '0.00', '0.00', '0');
INSERT INTO `cy_member` VALUES ('55', 'oathYc', null, 'https://wx.qlogo.cn/mmopen/vi_32/CH4aLHuWoDAEozfsy05yFqtqsPE1eUk8OZS8DHuLGTibSE03I3ZhQ5U08OT3g8JX19aTkCSHAoqexfJC6pzakPg/132', '0', null, null, null, null, '10002', '1', null, '0XAT5IFR', 'LG9LPPC1', '1579499988', 'oAi5t5dw2rKUG070zWHecTilXFwc', 'Sichuan', 'Leshan', 'China', null, '1', '1', '15828043607', '15828043607', '0.00', '0.00', '5.40', '0');
INSERT INTO `cy_member` VALUES ('56', '给自己一个微笑', '陈五弻', 'https://wx.qlogo.cn/mmopen/vi_32/4kF5cFK9MN4pczl7aPcVegdzIfk5HkWbOIsicdmxhHk9Ie6QvPt3YUOhuEULD5bicLXp3JHRfsmUhBYpoCxGqibuw/132', '1', 'ppB5khVW', 'ppB5khVW', 'Y6Ptoqlf', 'oJdSuSnS', null, '1', null, 'S2I4JLA', null, '1579505520', 'oAi5t5fZBuoOl9w1Dqehh4JkN51k', 'Munich', '', '', null, '1', '-1', 'AtbNIZok', 'AtbNIZok', '0.00', '0.00', '0.00', '0');
INSERT INTO `cy_member` VALUES ('57', '蓝色妖姬', null, 'https://wx.qlogo.cn/mmopen/vi_32/PiajxSqBRaEJnoxdxGC1PMosyYs3Hz6zNuj1NY5k9TXpxmKrA9iarHqSzK8DGD2hyhaRDZnhG09HY8QMbpOIGTdg/132', '0', null, null, null, null, null, '1', null, 'NVZH1ADH', null, '1579509087', 'oAi5t5eCNN0NXyIcpJ-fhlG_wxjs', 'Guangdong', 'Shenzhen', 'China', null, '1', '0', null, null, '0.00', '0.00', '0.00', '0');
INSERT INTO `cy_member` VALUES ('58', '辛福', null, null, '0', null, null, null, null, null, '1', null, '4SQV3JN2', null, '1579509088', 'oAi5t5Rey1P-uBPwoX5tvuRNzmzQ', 'Anhui', 'Xuancheng', 'China', null, '1', '0', null, null, '0.00', '0.00', '0.00', '0');
INSERT INTO `cy_member` VALUES ('59', 'zoz', null, 'https://wx.qlogo.cn/mmopen/vi_32/qvGwCZSz78T0hUben8dNlAD5QISX943jqYmqd6sa03KAjd0pFx3V5FcrlqR9LQO9xjGY5fvx7jhyMx1sRX2TTQ/132', '0', null, null, null, null, '14', '1', null, 'OMOAGBVZ', null, '1579521848', 'oAi5t5fPyFny93R7iP44EDYCBZ8I', 'Sichuan', 'Nanchong', 'China', null, '3', '0', null, null, '0.00', '0.00', '5.00', '0');
INSERT INTO `cy_member` VALUES ('60', '天天', null, 'https://wx.qlogo.cn/mmopen/vi_32/6VQJYbUukjIr2wlwQERKCJoUJ2UUhJliaib3TrhkPibrbic8Z0p3VIJdhHW7N6NdRgZFeZ7cncaVVZLmDY7LHPcdIQ/132', '0', null, null, null, null, '0', '1', null, 'TLPZ7F', null, '1579522684', 'oAi5t5d16QR_SZiyu60NJNZYEOEs', 'Sichuan', 'Nanchong', 'China', null, '1', '0', null, null, '0.00', '0.00', '0.00', '0');
INSERT INTO `cy_member` VALUES ('61', '踏上了电商这条不归路', null, 'https://wx.qlogo.cn/mmopen/vi_32/DUMm6HEjlUngWviayyBNtI66nVQ0OWCjTUEPoBeSyicmbjqmytjgVXkA7QflmvEpZhdbGUb1ZIBIgjljBHuqlFJw/132', '0', null, null, null, null, '0', '1', null, 'UEPOUMZ3', null, '1579523216', 'oAi5t5QYftijLhYiVKRNuua6_0R0', '四川', '成都', '中国', null, '1', '0', null, null, '0.00', '0.00', '0.00', '0');
INSERT INTO `cy_member` VALUES ('62', '銧着脚&追梦', null, 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKDFibebCF8qfjUg5eKbhDq5Qydicw0BShbs1EPGVScrPobfGLoN2AJzcgHV7LibpXwsToVGJy93sjZQ/132', '0', null, null, null, null, '0', '1', null, 'QJTP4R1L', null, '1579524027', 'oAi5t5Z-ZYoXRzCut-aOFhERAaxE', 'Jiangsu', 'Suzhou', 'China', null, '3', '0', null, null, '0.00', '0.00', '1.00', '0');
INSERT INTO `cy_member` VALUES ('63', '阳阳', null, 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLdpHJaL5mZBfZOVnnUpaXX8YI5m23ibUOneC7nL7ovkGZHO9iafwOdjPHZKW9AloxX6YGlmS7KoZGg/132', '0', null, null, null, null, '0', '1', null, 'AXDPQ381', null, '1579524041', 'oAi5t5cNitkqmDQ68AaYFcfqV8Ms', '什未林', '', '德国', null, '1', '0', null, null, '0.00', '0.00', '0.00', '0');
INSERT INTO `cy_member` VALUES ('64', '狗蛋', null, 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIZ3amFLGeQhdu5tfNEMwytXEo5zSa0Uu9mszaiaiaibewLrCIZlDuHTK8bUGibliaKrdvPib6TLsBuoeyQ/132', '0', null, null, null, null, null, '1', null, 'NOYDSTOR', null, '1579589622', 'oAi5t5YSMourlNuCIXxP4R8EtV6g', '', '', '', null, '1', '0', null, null, '0.00', '0.00', '0.00', '0');
INSERT INTO `cy_member` VALUES ('115', '黄佳怡', null, null, '0', null, null, null, null, null, '1', null, '58E7W78M', null, '1582810123', 'oAi5t5fYliOH8fqkWdQlpHCI9yn4', '', '', '', null, '1', '0', null, null, '0.00', '0.00', '0.00', '0');
INSERT INTO `cy_member` VALUES ('65', 'A     团子', '', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJ07KNR7tkiadeqoUYYBTAUibeQ52wjRYWUbIlNS7c2YoUGAWeCznCP1l0G6IlCtCWx2ch11znm2ibwQ/132', '0', null, null, '', null, '0', '1', null, 'K7UW07HI', 'K7UW07HI', '1579644305', 'oAi5t5baGu0TZ5n0UWglpJEthmS0', '上海', '宝山', '中国', null, '3', '1', '曹振', '13262862846', '25.02', '25.02', '3.00', '69');
INSERT INTO `cy_member` VALUES ('66', '赖秉竹', null, 'https://wx.qlogo.cn/mmhead/F2e8RTbP02YibrwNk4NUPS3D1rqgUKIU1CZ4vMazSDkw/132', '0', null, null, null, null, null, '1', null, '6V624FPT', null, '1579663271', 'oAi5t5f42S09c9n5MLzGohpGS7RU', '', '', '', null, '1', '0', null, null, '0.00', '0.00', '0.00', '0');
INSERT INTO `cy_member` VALUES ('67', '曹二振宇车行', null, 'https://wx.qlogo.cn/mmopen/vi_32/6ddU5Tfuu4bZLx7XfJKDY2GR3LA6mmOCXZCwt25KJk13YbngOPJtWpP2lW73e3yMzdLE8gCN3BQ1wA1DgwBr5Q/132', '0', null, null, null, null, '5', '1', null, 'YFNENTCD', null, '1579697329', 'oAi5t5Rb9TSFmCmm51D-v2XSBkdQ', '', '', '', null, '1', '0', null, null, '0.00', '0.00', '0.99', '0');
INSERT INTO `cy_member` VALUES ('68', '郑崇海', null, 'https://wx.qlogo.cn/mmhead/ykn76iaG5WXBgmChLicT9u9hl4IuaGtfb5zS6iaOiaCTA2U/132', '0', null, null, null, null, null, '1', null, '7KS4YZM8', null, '1579825712', 'oAi5t5Zl6apt7ojr4oPx_c3ZGzOI', '', '', '', null, '1', '0', null, null, '0.00', '0.00', '0.00', '0');
INSERT INTO `cy_member` VALUES ('69', '谨严', null, 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eqSCmBAfiaH7zgG69aPRaCIicTqibEOsTVABt0juKUSEd53LVp5feKK4ov3bN7PmiahM2vrhlGia6wqAUA/132', '0', null, null, null, null, '11', '1', null, 'TRCZYM1F', 'K7UW07HI', '1580185518', 'oAi5t5V4uqDkEHzsfpnDLOq2H65o', 'Shanghai', 'Baoshan', 'China', null, '1', '1', '13651622883', '13651622883', '0.00', '0.00', '0.00', '0');
INSERT INTO `cy_member` VALUES ('70', '魏剑帆', '吴箻惟', 'https://wx.qlogo.cn/mmopen/vi_32/WhoLIb4HZtsnbo4gjwY2NoD4asKIpIJVQ8x3OGjwAWbptTNs8jrMnYeKTobr7GAzU2r6dticVJcfhjv0gW7bDTQ/132', '1', '7J374PdC', 'Ph2PTIKY', '7J374PdC', '6v7XApIM', null, '1', null, 'FXNEKBW', null, '1580820326', 'oAi5t5W5hZb7cx7eNoZ_t7VcRyeU', 'Guangdong', 'Guangzhou', 'China', null, '1', '-1', '89NhLhRT', '89NhLhRT', '0.00', '0.00', '0.00', '0');
INSERT INTO `cy_member` VALUES ('71', '10.11', '陈渌諟', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKCTcfyS2FibqswwmrKtR8iatrD7kWr1qoCxs0ejBgnlG4ZvicA88lJ2iaaicjvRMia9BEmLFHMuH8DM6wA/132', '1', 'upArJtqE', 'NryQtCMh', 'ldWVOwEW', 'xXyJzJdK', null, '1', null, 'G6RMM7T', null, '1580889556', 'oAi5t5XcQKqkpNDf0oTLIIYpHfMY', 'N4Gd41Gy', 'FqVbnk5c', 'upArJtqE', null, '1', '-1', '吴栚窂', 'oQo8HcK0', '0.00', '0.00', '0.00', '0');
INSERT INTO `cy_member` VALUES ('72', '张景昌', null, 'https://wx.qlogo.cn/mmhead/1XNXLKWJ763L38lrfkFib1q4TVoaEN6qaHVudGeWmDpA/132', '0', null, null, null, null, null, '1', null, 'G0UHOM4N', null, '1580954604', 'oAi5t5a860u8Z9kVv2buEYQn8o7Y', '', '', '', null, '1', '0', null, null, '0.00', '0.00', '0.00', '0');
INSERT INTO `cy_member` VALUES ('73', 'rdgztest_BRDOGY', null, 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKxqOFPRvW2d4yN7SVnGKSkW5EC2b6KEX961tPGwiab7dv7tbBicvhiben75Jkj4X6picfrRic0YeemqXA/132', '0', null, null, null, null, null, '1', null, '7IRUISF4', null, '1580973456', 'oAi5t5VV_Mhphlo5c_QB5Hn_Pqpo', '', '', '', null, '1', '0', null, null, '0.00', '0.00', '0.00', '0');
INSERT INTO `cy_member` VALUES ('74', '蔡依茂', null, 'https://wx.qlogo.cn/mmhead/539HRfwmGg9H4wqmUnxwvBIhDXJ9ic4r0PPuKY3pgru4/132', '0', null, null, null, null, null, '1', null, 'EZWL4JKV', null, '1581045597', 'oAi5t5dDK9I9oLLy0YD7yt4AgE1I', '', '', '', null, '1', '0', null, null, '0.00', '0.00', '0.00', '0');
INSERT INTO `cy_member` VALUES ('75', '叶庭玮', null, 'https://wx.qlogo.cn/mmhead/I38E0TqMh5WQlicwzPhdHHiaHEUKGwVoTFeLTCQ54CXOQ/132', '0', null, null, null, null, null, '1', null, '0UBUKKHT', null, '1581128503', 'oAi5t5cCPsXEcfagtm7OlD98nEoU', '', '', '', null, '1', '0', null, null, '0.00', '0.00', '0.00', '0');
INSERT INTO `cy_member` VALUES ('141', '刘雅琪', null, 'https://wx.qlogo.cn/mmhead/l9wBIj25RSIYlPTnn3LJQtvc6MtvYQic0MoR91agezsw/132', '0', null, null, null, null, null, '1', null, 'P36PZKSL', null, '1583202761', 'oAi5t5fNjsuBhnyoaUdftm1-fc30', '', '', '', null, '1', '0', null, null, '0.00', '0.00', '0.00', '0');
INSERT INTO `cy_member` VALUES ('76', '女～王', null, 'https://wx.qlogo.cn/mmopen/vi_32/IcoAKrsX2WMZibcsYqDOMp9XIzHCELpvDVGals2ZfSXTuhURPiamO4UUyoUAsT0zBWibXaVV9mXIMI0Nw8Gmqb7aw/132', '0', null, null, null, null, null, '1', null, '4T50UME', null, '1581761009', 'oAi5t5Wm-s9TDPphPgRUWJkybgZg', '', '', '', null, '1', '0', null, null, '0.00', '0.00', '0.00', '0');
INSERT INTO `cy_member` VALUES ('77', 'Mou', null, 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83ep8DTheBUJqs8Uoe05MF19OBTxXib0MoOXwNDCdo3kNDgXdJ61sDSBAfCL80KGf9Pc1xsyE6icj1ppA/132', '0', null, null, null, null, '0', '1', null, 'YT99GBFZ', null, '1581784106', 'oAi5t5QF3T9ORnGgLjXRN7-zPW7s', '江苏', '苏州', '中国', null, '1', '0', null, null, '0.00', '0.00', '0.00', '0');
INSERT INTO `cy_member` VALUES ('78', '大白兔奶糖', null, 'https://wx.qlogo.cn/mmopen/vi_32/vThEe4sKQCP5wewoyCBnzgBcSTuG5ibolp5Mu9LwflcdUsqBOXIFPMDUEBbBpQA9930htuAIRuibtJMeBFd0ZXkQ/132', '0', null, null, null, null, null, '1', null, '5FRVWSZ', null, '1581836179', 'oAi5t5Xy1ku1F_7WPw8oqDoX3e_s', '', '', '阿尔巴尼亚', null, '1', '0', null, null, '0.00', '0.00', '0.00', '0');
INSERT INTO `cy_member` VALUES ('79', '可儿', null, 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLwDu2moUY41elqAkzUlmmskLPA7R0W7icIGZnKYiaNZ95SFpoHvQ6Decr5nJKjbvJbRHrm19Nyibr7g/132', '0', null, null, null, null, null, '1', null, '4PE5HKVE', null, '1581860674', 'oAi5t5TonhD9HOOgwS8qle3PzscA', '四川', '成都', '中国', null, '1', '0', null, null, '0.00', '0.00', '0.00', '0');
INSERT INTO `cy_member` VALUES ('80', '黎士杰', null, 'https://wx.qlogo.cn/mmhead/32gGuykjribtCQ3MaRohOPC2GmX6j1QzBkeeQI4D4bM4/132', '0', null, null, null, null, null, '1', null, '3NSVJN8K', null, '1581908657', 'oAi5t5QjMK4kFemEwt4Zu-CtG3dw', '', '', '', null, '1', '0', null, null, '0.00', '0.00', '0.00', '0');
INSERT INTO `cy_member` VALUES ('81', '归期', null, null, '0', null, null, null, null, '0', '1', null, 'EKIX4LWX', null, '1581924156', 'oAi5t5WnPMAGmlLOomyWRBZEwlOU', '', '', 'China', null, '1', '0', null, null, '0.00', '0.00', '0.00', '0');
INSERT INTO `cy_member` VALUES ('82', '众', null, 'https://wx.qlogo.cn/mmopen/vi_32/9VD6PArsqTxpTexkpkjCfcuJSUSXoTaTwEicuJ6jqvNCR0seXtY2XB1op1k1lDEcK6ENqchUJjFOPCELmic4Uaew/132', '0', null, null, null, null, '0', '1', null, 'YAVQOPF0', null, '1581924337', 'oAi5t5a_wQQ--u5cJ0qYB5-68AB0', '四川', '', '中国', null, '1', '0', null, null, '0.00', '0.00', '0.00', '0');
INSERT INTO `cy_member` VALUES ('83', '蒾纞', null, 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJQUzaBMzzqm12iasga9zibvhnLAAiaSW0z7iactgptiaHFiaMM2VTpM2Y62uTtMoGRFE32QSwQCMvgT7Eg/132', '0', null, null, null, null, '0', '1', null, 'RHI492RC', null, '1581924801', 'oAi5t5Q8ijJL3vXcnOAvBalKNUws', 'Sichuan', 'Chengdu', 'China', null, '1', '0', null, null, '0.00', '0.00', '0.00', '0');
INSERT INTO `cy_member` VALUES ('84', '望归', null, 'https://wx.qlogo.cn/mmopen/vi_32/lCzicXSicPnYkzdIs0zZYKCFibzJcqHhydtiaH28GOLRBzzoOsYxib0ibqTSXWMc8YGVGCCTgDY1sciapUTicA28HCE0LQ/132', '0', null, null, null, null, null, '1', null, 'KQ71PTYW', null, '1581954488', 'oAi5t5VeD1EsBYPBBfxmua4Rz1XA', 'Sichuan', 'Nanchong', 'China', null, '1', '0', null, null, '0.00', '0.00', '0.00', '0');
INSERT INTO `cy_member` VALUES ('85', '林晓薇', null, 'https://wx.qlogo.cn/mmhead/fDUgH9bFtIT8LG5zXXiczfQf2Po4a2CqaDsCzM38jPAs/132', '0', null, null, null, null, null, '1', null, 'PEEFER93', null, '1581999540', 'oAi5t5b5os9XMM0xA6QG1zLC-BhM', '', '', '', null, '1', '0', null, null, '0.00', '0.00', '0.00', '0');
INSERT INTO `cy_member` VALUES ('86', '李雅筑', null, 'https://wx.qlogo.cn/mmhead/Yh2DkZXR1ky3Nbm1sLmcCCZdmUzypgJnXcF5I223Vd0/132', '0', null, null, null, null, null, '1', null, 'NKWV9CI6', null, '1582079620', 'oAi5t5Sa7IPuyNwzc0MiWiwzJcjE', '', '', '', null, '1', '0', null, null, '0.00', '0.00', '0.00', '0');
INSERT INTO `cy_member` VALUES ('87', '叶维生', null, 'https://wx.qlogo.cn/mmhead/2Yl1E5HKicsYOTnibJaZCzcslKVjjzWBuS5aMB0LLTFVk/132', '0', null, null, null, null, null, '1', null, 'P07UH41', null, '1582409950', 'oAi5t5YhM0xNhef0OMr-LJbhuEJQ', '', '', '', null, '1', '0', null, null, '0.00', '0.00', '0.00', '0');
INSERT INTO `cy_member` VALUES ('88', '吴台刚', null, null, '0', null, null, null, null, null, '1', null, 'WK6ZUH47', null, '1582410207', 'oAi5t5eQjcJbwa8GnxqM2YOJldIk', '', '', '', null, '1', '0', null, null, '0.00', '0.00', '0.00', '0');
INSERT INTO `cy_member` VALUES ('89', '杨凯珠', null, 'https://wx.qlogo.cn/mmhead/ndiboYMXoszJ762tXW8ac8rsEM6KVM2r3AqmtWvGmjiaY/132', '0', null, null, null, null, null, '1', null, 'RB0B7ET2', null, '1582419105', 'oAi5t5SEUx5jcut_Cm7scyV90IWE', '', '', '', null, '1', '0', null, null, '0.00', '0.00', '0.00', '0');
INSERT INTO `cy_member` VALUES ('90', '李国勇', null, null, '0', null, null, null, null, null, '1', null, 'Y5I6YVWM', null, '1582491709', 'oAi5t5U5aCIZPdNOO_x0CI8HQ03M', '', '', '', null, '1', '0', null, null, '0.00', '0.00', '0.00', '0');
INSERT INTO `cy_member` VALUES ('91', '陈孟颖', null, null, '0', null, null, null, null, null, '1', null, 'AJA871FS', null, '1582495494', 'oAi5t5aJstq9qys44WFkmDLHKrq4', '', '', '', null, '1', '0', null, null, '0.00', '0.00', '0.00', '0');
INSERT INTO `cy_member` VALUES ('92', '母笑阳', null, null, '0', null, null, null, null, null, '1', null, '16O5M7ST', null, '1582522363', 'oAi5t5YY5tRjQ4NDiC5WN70a9upc', 'Hebei', 'Baoding', 'China', null, '1', '0', null, null, '0.00', '0.00', '0.00', '0');
INSERT INTO `cy_member` VALUES ('93', '张玮喜', null, null, '0', null, null, null, null, null, '1', null, 'LVXFI77T', null, '1582535020', 'oAi5t5cLKYH9ARbxiDZ0p01HivH8', '', '', '', null, '1', '0', null, null, '0.00', '0.00', '0.00', '0');
INSERT INTO `cy_member` VALUES ('94', '彭宜洁', null, null, '0', null, null, null, null, null, '1', null, 'I1YMPDF7', null, '1582550234', 'oAi5t5SdHbRO-lPAT783Ena2WC70', '', '', '', null, '1', '0', null, null, '0.00', '0.00', '0.00', '0');
INSERT INTO `cy_member` VALUES ('95', '吕佳欣', null, 'https://wx.qlogo.cn/mmhead/IVKfmLbEo51HDYibNElmSgYN8SicC7hzgOuffHa4RkdSo/132', '0', null, null, null, null, null, '1', null, 'BHJW9KLL', null, '1582562458', 'oAi5t5S7mLipUKv67OhK8kzPzOw0', '', '', '', null, '1', '0', null, null, '0.00', '0.00', '0.00', '0');
INSERT INTO `cy_member` VALUES ('96', '林姿莹', null, null, '0', null, null, null, null, null, '1', null, 'RXRCQ78', null, '1582562935', 'oAi5t5UvCy5psdi-uzDpqq0-lJjc', '', '', '', null, '1', '0', null, null, '0.00', '0.00', '0.00', '0');
INSERT INTO `cy_member` VALUES ('97', '吴洁政', null, null, '0', null, null, null, null, null, '1', null, 'K37WS3V0', null, '1582569509', 'oAi5t5f2OtuN1acrNIEBWvACzvrQ', '', '', '', null, '1', '0', null, null, '0.00', '0.00', '0.00', '0');
INSERT INTO `cy_member` VALUES ('98', '魏柏伦', null, 'https://wx.qlogo.cn/mmhead/P3cxrKeRC8x4J3z0ep82w3oSDRKblSuBK3CaBya0XdE/132', '0', null, null, null, null, null, '1', null, 'FLGUYRDW', null, '1582582748', 'oAi5t5czdaA8gSXJmYeG0PRml-18', '', '', '', null, '1', '0', null, null, '0.00', '0.00', '0.00', '0');
INSERT INTO `cy_member` VALUES ('99', '田园风光，，，', null, 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKkxDZfIYkr5P4Q2d2S3ua3jj5CPuia0UTK04SEPPFmHcWmZdib1VRRROdqto74rYYrDvAibiaSZrscqQ/132', '0', null, null, null, null, null, '1', null, 'TNLSL9ZM', 'K7UW07HI', '1582608338', 'oAi5t5ZFCQ5WCvBeYjxT5XY9eURM', '江苏', '泰州', '中国', null, '1', '0', null, null, '0.00', '0.00', '0.00', '0');
INSERT INTO `cy_member` VALUES ('100', '黄姿妤', null, null, '0', null, null, null, null, null, '1', null, 'UOX1GXBU', null, '1582654532', 'oAi5t5VyPGVbqK886bnNA0_5mKsE', '', '', '', null, '1', '0', null, null, '0.00', '0.00', '0.00', '0');
INSERT INTO `cy_member` VALUES ('101', '黄初清', null, null, '0', null, null, null, null, null, '1', null, 'SQLPUM6', null, '1582665443', 'oAi5t5epOfpibA5Nh4jN6656SPX8', '', '', '', null, '1', '0', null, null, '0.00', '0.00', '0.00', '0');
INSERT INTO `cy_member` VALUES ('102', '洪宗翰', null, 'https://wx.qlogo.cn/mmhead/mC2uWafZOBcyCmhDf5MHmmE0Rup8JnxAAMA7j4gPXrg/132', '0', null, null, null, null, null, '1', null, 'T1QUHM4Y', null, '1582668310', 'oAi5t5Ua8hA9iova3CTGkkmnRkbY', '', '', '', null, '3', '0', null, null, '0.00', '0.00', '0.00', '0');
INSERT INTO `cy_member` VALUES ('103', '林韦梦', null, null, '0', null, null, null, null, null, '1', null, 'HVB8FSH', null, '1582699346', 'oAi5t5Tb6V-GmQrKyi9QhPTVVVwM', '', '', '', null, '1', '0', null, null, '0.00', '0.00', '0.00', '0');
INSERT INTO `cy_member` VALUES ('104', '杨家源', null, null, '0', null, null, null, null, null, '1', null, 'GYAZ0ZBT', null, '1582707305', 'oAi5t5WFPTByhQ9XZzFOk1kAzORY', '', '', '', null, '1', '0', null, null, '0.00', '0.00', '0.00', '0');
INSERT INTO `cy_member` VALUES ('105', '张子芸', null, null, '0', null, null, null, null, null, '1', null, 'K5YIRBAH', null, '1582712400', 'oAi5t5dDe5MsgLCP009uaG_1cvnk', '', '', '', null, '1', '0', null, null, '0.00', '0.00', '0.00', '0');
INSERT INTO `cy_member` VALUES ('106', '杜琼慧', null, null, '0', null, null, null, null, null, '1', null, 'DNATFDND', null, '1582759327', 'oAi5t5eOUwhfUEcQi3FV9mW1NOYg', '', '', '', null, '1', '0', null, null, '0.00', '0.00', '0.00', '0');
INSERT INTO `cy_member` VALUES ('107', '程建宏', null, 'https://wx.qlogo.cn/mmhead/gnblKVdgwPVJuCc8YJJywoibGBcvespjib7E0mtH1Vo38/132', '0', null, null, null, null, null, '1', null, 'VHEQK4IC', null, '1582768397', 'oAi5t5e4o4jy9hLkl0wOXNt_Yijg', '', '', '', null, '1', '0', null, null, '0.00', '0.00', '0.00', '0');
INSERT INTO `cy_member` VALUES ('108', '王宜臻', null, null, '0', null, null, null, null, null, '1', null, 'VCLEUPVB', null, '1582769180', 'oAi5t5Wtp2hpV-a3yZuIxzXZpD4A', '', '', '', null, '1', '0', null, null, '0.00', '0.00', '0.00', '0');
INSERT INTO `cy_member` VALUES ('109', '陈君启', null, null, '0', null, null, null, null, null, '1', null, 'ROGJMDAH', null, '1582770034', 'oAi5t5cWU0Vpmv5TBYtrslBqOAb0', '', '', '', null, '1', '0', null, null, '0.00', '0.00', '0.00', '0');
INSERT INTO `cy_member` VALUES ('110', '郭浩兴', null, null, '0', null, null, null, null, null, '1', null, 'L2L8AJ1X', null, '1582778017', 'oAi5t5doLrizP8LFWXskzbq_5Sak', '', '', '', null, '1', '0', null, null, '0.00', '0.00', '0.00', '0');
INSERT INTO `cy_member` VALUES ('158', '杨俊霖', null, null, '0', null, null, null, null, null, '1', null, 'IO7C9GCX', null, '1583816155', 'oAi5t5bK5rxnPuI0Xbn1gPi7tIJw', '', '', '', null, '3', '0', null, null, '0.00', '0.00', '0.00', '0');
INSERT INTO `cy_member` VALUES ('111', '邱婷婷', null, null, '0', null, null, null, null, null, '1', null, '2XXQ64DX', null, '1582787174', 'oAi5t5VJypMBFTyDIllT8907GZsY', '', '', '', null, '1', '0', null, null, '0.00', '0.00', '0.00', '0');
INSERT INTO `cy_member` VALUES ('112', '陈佳蓉', null, null, '0', null, null, null, null, null, '1', null, 'FERGFSDC', null, '1582788610', 'oAi5t5UVFCzpaVyPZ0S5AY-0q59s', '', '', '', null, '1', '0', null, null, '0.00', '0.00', '0.00', '0');
INSERT INTO `cy_member` VALUES ('113', '王玮婷', null, null, '0', null, null, null, null, null, '1', null, 'DQUGP5NP', null, '1582789888', 'oAi5t5a9vKqNDvzCz99uXjqwhTfE', '', '', '', null, '1', '0', null, null, '0.00', '0.00', '0.00', '0');
INSERT INTO `cy_member` VALUES ('114', '李佳莹', null, null, '0', null, null, null, null, null, '1', null, 'DYT4ASHV', null, '1582804749', 'oAi5t5Z7fsx6oQoNkutYv43iG7Hk', '', '', '', null, '1', '0', null, null, '0.00', '0.00', '0.00', '0');
INSERT INTO `cy_member` VALUES ('117', '张雅启', null, null, '0', null, null, null, null, null, '1', null, '57RXB5B', null, '1582814208', 'oAi5t5e9psXTbsa4Z_ggD-OSzIXw', '', '', '', null, '1', '0', null, null, '0.00', '0.00', '0.00', '0');
INSERT INTO `cy_member` VALUES ('118', '简婉如', null, null, '0', null, null, null, null, null, '1', null, 'ITBQCJ1V', null, '1582817002', 'oAi5t5Q1smG-6Po7FbQP7vhc6MiM', '', '', '', null, '1', '0', null, null, '0.00', '0.00', '0.00', '0');
INSERT INTO `cy_member` VALUES ('119', '杜巧清', null, null, '0', null, null, null, null, null, '1', null, 'AIU9PJWW', null, '1582817517', 'oAi5t5foSZDNSkFK_s-vEapPk6E4', '', '', '', null, '1', '0', null, null, '0.00', '0.00', '0.00', '0');
INSERT INTO `cy_member` VALUES ('120', '曾立伟', null, null, '0', null, null, null, null, null, '1', null, 'LMRTGEJF', null, '1582835655', 'oAi5t5QcuRXedfoaW69MaNKQPL2I', '', '', '', null, '1', '0', null, null, '0.00', '0.00', '0.00', '0');
INSERT INTO `cy_member` VALUES ('121', '刘子云', null, null, '0', null, null, null, null, null, '1', null, 'DDCTZEOQ', null, '1582836003', 'oAi5t5bJujVTCcxSQkuk991NKUcw', '', '', '', null, '1', '0', null, null, '0.00', '0.00', '0.00', '0');
INSERT INTO `cy_member` VALUES ('122', '陈柔云', null, null, '0', null, null, null, null, null, '1', null, 'B2YQAJD', null, '1582838122', 'oAi5t5TclFKQ5Utbnrt59ZXNw_4A', '', '', '', null, '1', '0', null, null, '0.00', '0.00', '0.00', '0');
INSERT INTO `cy_member` VALUES ('123', '杜家瑜', null, 'https://wx.qlogo.cn/mmhead/vt10oB6QF5mTXWprWicBq1CysnyF0PKEVz7wibPTYIn6w/132', '0', null, null, null, null, null, '1', null, 'NRKTD1JS', null, '1582845117', 'oAi5t5f2j-TAbF1FBYWSsaKrrSr8', '', '', '', null, '1', '0', null, null, '0.00', '0.00', '0.00', '0');
INSERT INTO `cy_member` VALUES ('124', '范育德', null, null, '0', null, null, null, null, null, '1', null, 'GR99BC7C', null, '1582845501', 'oAi5t5QC7qhDUaFgszzOS6F_rmNI', '', '', '', null, '1', '0', null, null, '0.00', '0.00', '0.00', '0');
INSERT INTO `cy_member` VALUES ('125', '陈明翰', null, null, '0', null, null, null, null, null, '1', null, 'G8O9EQOA', null, '1582862257', 'oAi5t5QAg7WG3Gq141ydqFZm-Bas', '', '', '', null, '1', '0', null, null, '0.00', '0.00', '0.00', '0');
INSERT INTO `cy_member` VALUES ('126', '王嘉娥', null, null, '0', null, null, null, null, null, '1', null, '04QLOMOS', null, '1582919867', 'oAi5t5SKYg-jxLkAGaMwvHMl6yW0', '', '', '', null, '1', '0', null, null, '0.00', '0.00', '0.00', '0');
INSERT INTO `cy_member` VALUES ('127', '蔡宜珍', null, null, '0', null, null, null, null, null, '1', null, '5FR9WIPE', null, '1582928942', 'oAi5t5TPkTPD-19poGTE2gDxM73c', '', '', '', null, '1', '0', null, null, '0.00', '0.00', '0.00', '0');
INSERT INTO `cy_member` VALUES ('128', '陈俊杰', null, null, '0', null, null, null, null, null, '1', null, 'PJ91MMPB', null, '1582929783', 'oAi5t5bbqY3utUi37Bn-qRQzXa48', '', '', '', null, '1', '0', null, null, '0.00', '0.00', '0.00', '0');
INSERT INTO `cy_member` VALUES ('129', '林雅婷', null, null, '0', null, null, null, null, null, '1', null, '05S61N5K', null, '1582940581', 'oAi5t5VuuE0hYVhzchOXVEP7JaRE', '', '', '', null, '1', '0', null, null, '0.00', '0.00', '0.00', '0');
INSERT INTO `cy_member` VALUES ('130', '李仕珮', null, null, '0', null, null, null, null, null, '1', null, 'MOKQV5D7', null, '1582946817', 'oAi5t5cnECXS_-QxxUHV6Ebsm_6U', '', '', '', null, '1', '0', null, null, '0.00', '0.00', '0.00', '0');
INSERT INTO `cy_member` VALUES ('131', '何静宜', null, null, '0', null, null, null, null, null, '1', null, 'DT2LT46W', null, '1582948994', 'oAi5t5Smx-SukhelHrZVF-qsPwws', '', '', '', null, '1', '0', null, null, '0.00', '0.00', '0.00', '0');
INSERT INTO `cy_member` VALUES ('132', '黄士勋', null, null, '0', null, null, null, null, null, '1', null, 'U6T8OCIP', null, '1582950093', 'oAi5t5QfZtOb7VBr2rTctQ0UEsaU', '', '', '', null, '1', '0', null, null, '0.00', '0.00', '0.00', '0');
INSERT INTO `cy_member` VALUES ('133', '꧁꫞꯭相꯭信꯭明꯭天꯭꫞꧂', null, 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJxIgjyNWjMWIAjYia2tRs9gUJT70BRw70wgNUQfuDDDzJQTtCic0QUoTKX8AOaEWy41zO0QfnicvjFQ/132', '0', null, null, null, null, null, '1', null, 'LQLEFQ0I', null, '1582994124', 'oAi5t5U4_MT7QZuizD0NQ783tK6s', '四川', '南充', '中国', null, '1', '0', null, null, '0.00', '0.00', '0.00', '0');
INSERT INTO `cy_member` VALUES ('134', '曾绿蕙', null, null, '0', null, null, null, null, null, '1', null, '55J9VCI9', null, '1583013585', 'oAi5t5evn37Eq9EbnaPIWjCZpxJE', '', '', '', null, '1', '0', null, null, '0.00', '0.00', '0.00', '0');
INSERT INTO `cy_member` VALUES ('135', '袁俊宏', null, 'https://wx.qlogo.cn/mmhead/Aia5pFwBiaGeatR2wUYBqN6OqpXpXQV7j9BDY6wq8vODE/132', '0', null, null, null, null, null, '1', null, 'AY3VS8Y0', null, '1583014573', 'oAi5t5XVUDxCruXkF0KAMOe9adug', '', '', '', null, '1', '0', null, null, '0.00', '0.00', '0.00', '0');
INSERT INTO `cy_member` VALUES ('136', '林志玮', null, null, '0', null, null, null, null, null, '1', null, '4LHKCBR6', null, '1583035056', 'oAi5t5SEL1siP3MJlxcIsjN8WvmA', '', '', '', null, '1', '0', null, null, '0.00', '0.00', '0.00', '0');
INSERT INTO `cy_member` VALUES ('137', '谢欣颖', null, null, '0', null, null, null, null, null, '1', null, 'KK63188H', null, '1583035120', 'oAi5t5YVXHmDtDyVFc0eXLq2MnLU', '', '', '', null, '1', '0', null, null, '0.00', '0.00', '0.00', '0');
INSERT INTO `cy_member` VALUES ('138', '林淑幸', null, null, '0', null, null, null, null, null, '1', null, 'S80267ME', null, '1583035896', 'oAi5t5VzqOIz9Fj1S9Yvc9kyu52o', '', '', '', null, '1', '0', null, null, '0.00', '0.00', '0.00', '0');
INSERT INTO `cy_member` VALUES ('139', '王杰君', null, 'https://wx.qlogo.cn/mmhead/2K78s7d8KV30engiadM0MFNibRRcLiaVVYZgPmhlNRbYQE/132', '0', null, null, null, null, null, '1', null, 'N3IZQGKB', null, '1583048511', 'oAi5t5fKtU9668THFfJ9xpbz0niY', '', '', '', null, '1', '0', null, null, '0.00', '0.00', '0.00', '0');
INSERT INTO `cy_member` VALUES ('140', '李建彰', null, 'https://wx.qlogo.cn/mmhead/yrWxvefQvkGARe0HZq0fNq3XcgoKbOfG1GCkx99NXjE/132', '0', null, null, null, null, null, '1', null, 'Y25Y0QY', null, '1583074760', 'oAi5t5ZM-pyyvP7FIiKJ4V6XKsv0', '', '', '', null, '1', '0', null, null, '0.00', '0.00', '0.00', '0');
INSERT INTO `cy_member` VALUES ('142', '梁淑芬', null, null, '0', null, null, null, null, null, '1', null, 'HG9XXOA', null, '1583252572', 'oAi5t5ZKonC5jXG6_M2Ya5HjP3ZQ', '', '', '', null, '1', '0', null, null, '0.00', '0.00', '0.00', '0');
INSERT INTO `cy_member` VALUES ('143', '许尚伯', null, 'https://wx.qlogo.cn/mmhead/KfHWN0ibutn9cLkYl4UGsDOZF55SdOFhIlWzBrD9iaLyQ/132', '0', null, null, null, null, null, '1', null, '7AZRUYJG', null, '1583261845', 'oAi5t5Q9EnKG4Tlw9n_HJIGPo_b4', '', '', '', null, '1', '0', null, null, '0.00', '0.00', '0.00', '0');
INSERT INTO `cy_member` VALUES ('144', '许俊来', null, 'https://wx.qlogo.cn/mmhead/c7icMyZFV8t3uicRbVd6NVicLS1nueu7QgActp90IvQXBM/132', '0', null, null, null, null, null, '1', null, '9A0PM3DA', null, '1583289209', 'oAi5t5X4g-sKVZW7oLJPr8RMUlrM', '', '', '', null, '1', '0', null, null, '0.00', '0.00', '0.00', '0');
INSERT INTO `cy_member` VALUES ('145', '陈雅惠', null, 'https://wx.qlogo.cn/mmhead/99lQgDiaYrEYeQ7oZIH0aJT4WUDibjKmprFCr20Giao5nM/132', '0', null, null, null, null, null, '1', null, 'XO1CWYVD', null, '1583447155', 'oAi5t5VNl1VldGlObA8HqNzz7MHQ', '', '', '', null, '1', '0', null, null, '0.00', '0.00', '0.00', '0');
INSERT INTO `cy_member` VALUES ('146', '林嘉宜', null, null, '0', null, null, null, null, null, '1', null, 'KA2G9AY', null, '1583475189', 'oAi5t5eFU2RYk5y0eg0qyi_CGQdQ', '', '', '', null, '1', '0', null, null, '0.00', '0.00', '0.00', '0');
INSERT INTO `cy_member` VALUES ('147', '哦豁', null, 'https://wx.qlogo.cn/mmopen/vi_32/QE9A6x4Cq4j1ibxV0Iicwt8hibgDia7iaNEzZ0xibibUiaaibHI2BMzJaWATIZmiamib55v0pmcKOiawa2BJia4dqniaecy8Kibrw/132', '0', null, null, null, null, null, '1', null, 'N8I9EBO0', 'K7UW07HI', '1583489646', 'oAi5t5UD6sdWQbBJ68cx1PWVvki4', '', '', '', null, '1', '0', null, null, '0.00', '0.00', '0.00', '0');
INSERT INTO `cy_member` VALUES ('148', '陈姵旺', null, null, '0', null, null, null, null, null, '1', null, 'QIQ1OB79', null, '1583499188', 'oAi5t5YARRQFlK9G9F3AlYXeZbIM', '', '', '', null, '1', '0', null, null, '0.00', '0.00', '0.00', '0');
INSERT INTO `cy_member` VALUES ('149', '陈政谕', null, null, '0', null, null, null, null, null, '1', null, 'UL3OQNUX', null, '1583528671', 'oAi5t5YChKLptrXZX-Se655tloVY', '', '', '', null, '1', '0', null, null, '0.00', '0.00', '0.00', '0');
INSERT INTO `cy_member` VALUES ('150', '林冠帆', null, null, '0', null, null, null, null, null, '1', null, '0ZSKU6JZ', null, '1583614368', 'oAi5t5UTCdnTm7umFADxlajGP0cM', '', '', '', null, '1', '0', null, null, '0.00', '0.00', '0.00', '0');
INSERT INTO `cy_member` VALUES ('151', '黄家昆', null, null, '0', null, null, null, null, null, '1', null, 'DAZ9OJ0H', null, '1583631996', 'oAi5t5b7u31GDVRDW5vazLv9bW3I', '', '', '', null, '1', '0', null, null, '0.00', '0.00', '0.00', '0');
INSERT INTO `cy_member` VALUES ('152', '廖秋扬', null, null, '0', null, null, null, null, null, '1', null, '7C7SSWJV', null, '1583662770', 'oAi5t5TbSY_yXu-c6aAEofk10kXw', '', '', '', null, '1', '0', null, null, '0.00', '0.00', '0.00', '0');
INSERT INTO `cy_member` VALUES ('153', 'rdgztest_ZUIHDE', null, 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJ3FwyE9b5tNCn1YMKZia3iaI0UIxXxmj9Hzf1XR5XGibgqys9mFMsYnjiaEYONbyzOnvtXMe3Sh4YSDQ/132', '0', null, null, null, null, null, '1', null, 'KIAP93OE', null, '1583670053', 'oAi5t5QOZRhKS8txGYLSvIWqq34k', '', '', '', null, '1', '0', null, null, '0.00', '0.00', '0.00', '0');
INSERT INTO `cy_member` VALUES ('154', '张淑慧', null, null, '0', null, null, null, null, null, '1', null, 'S134X1RB', null, '1583671854', 'oAi5t5aILj-WKzWpswwAyAzKpvGM', '', '', '', null, '1', '0', null, null, '0.00', '0.00', '0.00', '0');
INSERT INTO `cy_member` VALUES ('155', '陈惠群', null, null, '0', null, null, null, null, null, '1', null, 'GP1XB7L5', null, '1583695671', 'oAi5t5bXWQWhQY0FbWbrBeJH_Rl4', '', '', '', null, '1', '0', null, null, '0.00', '0.00', '0.00', '0');
INSERT INTO `cy_member` VALUES ('156', '陈诗昌', null, null, '0', null, null, null, null, null, '1', null, '11MFSNED', null, '1583709470', 'oAi5t5W1BElZ2XcQJahshXovKwGY', '', '', '', null, '1', '0', null, null, '0.00', '0.00', '0.00', '0');
INSERT INTO `cy_member` VALUES ('157', '刘雅婷', null, null, '0', null, null, null, null, null, '1', null, '81RW76MC', null, '1583710248', 'oAi5t5eIpvU40Msm2KNonWjw5D40', '', '', '', null, '1', '0', null, null, '0.00', '0.00', '0.00', '0');
INSERT INTO `cy_member` VALUES ('159', '毛毛雨', null, 'https://wx.qlogo.cn/mmopen/vi_32/ctI2ictkuicWmPYUHq2LOib24eTwzcfRTBfH8s3aiabNJuCavb5u4gGMxcXpwLPrsLLQXKicpOrU0hlrl87wGUFovqA/132', '0', null, null, null, null, null, '1', null, '68IDB49', null, '1583824023', 'oAi5t5XEs1eUr8pWp39sr75wfO5g', '四川', '成都', '中国', null, '1', '0', null, null, '0.00', '0.00', '0.00', '0');
INSERT INTO `cy_member` VALUES ('160', '吴俊贤', null, null, '0', null, null, null, null, null, '1', null, 'BU9SRJT', null, '1583869058', 'oAi5t5bP5ZRl1euQTb8LAAzdj6pk', '', '', '', null, '1', '0', null, null, '0.00', '0.00', '0.00', '0');
INSERT INTO `cy_member` VALUES ('161', '陈家梦', null, null, '0', null, null, null, null, null, '1', null, 'RSOO4PT', null, '1583879132', 'oAi5t5Vgzo196CqNe5TYPd5l8AFM', '', '', '', null, '1', '0', null, null, '0.00', '0.00', '0.00', '0');
INSERT INTO `cy_member` VALUES ('162', '王名吟', null, null, '0', null, null, null, null, null, '1', null, 'J8Z983HC', null, '1583880612', 'oAi5t5QWpTGXAFv8-0xm8APcneJI', '', '', '', null, '1', '0', null, null, '0.00', '0.00', '0.00', '0');
INSERT INTO `cy_member` VALUES ('163', '苏碧绮', null, 'https://wx.qlogo.cn/mmhead/oz6ooeIZaHUUgXkppow7ftEMicvu9SbiaWbx9HwYXBtrA/132', '0', null, null, null, null, null, '1', null, '2NAC9UN5', null, '1583886682', 'oAi5t5XCNVr8EFaxvpTWEchbindE', '', '', '', null, '1', '0', null, null, '0.00', '0.00', '0.00', '0');
INSERT INTO `cy_member` VALUES ('164', '杨文男', null, 'https://wx.qlogo.cn/mmhead/Ocp1MvSMHzXadeiaib1H9PX9ec6maz7kpts6xL2YO6ficc/132', '0', null, null, null, null, null, '1', null, 'WP6SPU83', null, '1583928920', 'oAi5t5SGV1Mlu63uRmixWngE68WI', '', '', '', null, '1', '0', null, null, '0.00', '0.00', '0.00', '0');
INSERT INTO `cy_member` VALUES ('165', '李佳蓉', null, null, '0', null, null, null, null, null, '1', null, '86IJOGQY', null, '1583957546', 'oAi5t5Tjs5tRCmZcsEWXGDyUWW2o', '', '', '', null, '1', '0', null, null, '0.00', '0.00', '0.00', '0');
INSERT INTO `cy_member` VALUES ('166', '王吉泰', null, 'https://wx.qlogo.cn/mmhead/8ia5xnEwqe9YPECTQFxsprGCYY3dibTvYxaxwRBNBbics8/132', '0', null, null, null, null, null, '1', null, 'TAZS65LS', null, '1583973258', 'oAi5t5RLuN7fwLHrVhTWSBseKssM', '', '', '', null, '1', '0', null, null, '0.00', '0.00', '0.00', '0');
INSERT INTO `cy_member` VALUES ('167', '刘海威', null, null, '0', null, null, null, null, null, '1', null, 'QOR5HUOW', null, '1583996436', 'oAi5t5YhsSSLaPXNWar9WGhjxIZQ', 'Sichuan', 'Yaan', 'China', null, '1', '0', null, null, '0.00', '0.00', '0.00', '0');
INSERT INTO `cy_member` VALUES ('168', '王佳仪', null, null, '0', null, null, null, null, null, '1', null, '7ZT4JJKE', null, '1584049753', 'oAi5t5bM01OcNFbh_WBPCxMeJcr4', '', '', '', null, '1', '0', null, null, '0.00', '0.00', '0.00', '0');

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
) ENGINE=MyISAM AUTO_INCREMENT=2648 DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='成员开通会员记录';

-- ----------------------------
-- Records of cy_member_log
-- ----------------------------
INSERT INTO `cy_member_log` VALUES ('2501', '49', '1579492781', '1611028781', '1579492781', '2918');
INSERT INTO `cy_member_log` VALUES ('2502', '50', '1579492812', '1611028812', '1579492812', '2919');
INSERT INTO `cy_member_log` VALUES ('2503', '51', '1579492940', '1611028940', '1579492940', '2920');
INSERT INTO `cy_member_log` VALUES ('2504', '52', '1579498423', '1611034423', '1579498423', '2921');
INSERT INTO `cy_member_log` VALUES ('2505', '53', '1579498943', '1611034943', '1579498943', '2922');
INSERT INTO `cy_member_log` VALUES ('2506', '54', '1579498944', '1611034944', '1579498944', '2923');
INSERT INTO `cy_member_log` VALUES ('2507', '55', '1579499988', '1611035988', '1579499988', '2924');
INSERT INTO `cy_member_log` VALUES ('2508', '56', '1579505520', '1611041520', '1579505520', '2929');
INSERT INTO `cy_member_log` VALUES ('2509', '57', '1579509087', '1611045087', '1579509087', '2930');
INSERT INTO `cy_member_log` VALUES ('2510', '58', '1579509088', '1611045088', '1579509088', '2931');
INSERT INTO `cy_member_log` VALUES ('2511', '59', '1579521848', '1611057848', '1579521848', '2932');
INSERT INTO `cy_member_log` VALUES ('2512', '60', '1579522684', '1611058684', '1579522684', '2935');
INSERT INTO `cy_member_log` VALUES ('2513', '61', '1579523216', '1611059216', '1579523216', '2937');
INSERT INTO `cy_member_log` VALUES ('2514', '62', '1579524027', '1611060027', '1579524027', '2939');
INSERT INTO `cy_member_log` VALUES ('2515', '63', '1579524041', '1611060041', '1579524041', '2940');
INSERT INTO `cy_member_log` VALUES ('2516', '64', '1579589622', '1611125622', '1579589622', '2946');
INSERT INTO `cy_member_log` VALUES ('2517', '65', '1579644305', '1611180305', '1579644305', '2953');
INSERT INTO `cy_member_log` VALUES ('2518', '66', '1579663271', '1611199271', '1579663271', '2954');
INSERT INTO `cy_member_log` VALUES ('2519', '67', '1579697329', '1611233329', '1579697329', '2956');
INSERT INTO `cy_member_log` VALUES ('2520', '68', '1579825712', '1611361712', '1579825712', '2965');
INSERT INTO `cy_member_log` VALUES ('2521', '69', '1580185518', '1611721518', '1580185518', '2966');
INSERT INTO `cy_member_log` VALUES ('2522', '51', '1611028940', '1642132940', '1580568409', '2975');
INSERT INTO `cy_member_log` VALUES ('2523', '62', '1611060027', '1642164027', '1580568592', '2976');
INSERT INTO `cy_member_log` VALUES ('2524', '51', '1642132940', '1649908940', '1580626308', '2978');
INSERT INTO `cy_member_log` VALUES ('2525', '51', '1649908940', '1652500940', '1580639510', '2979');
INSERT INTO `cy_member_log` VALUES ('2526', '51', '1652500940', '1681012940', '1580639781', '2980');
INSERT INTO `cy_member_log` VALUES ('2527', '70', '1580820326', '1612356326', '1580820326', '2986');
INSERT INTO `cy_member_log` VALUES ('2528', '51', '1681012940', '1683604940', '1580822127', '2988');
INSERT INTO `cy_member_log` VALUES ('2529', '51', '1683604940', '1686196940', '1580882706', '2993');
INSERT INTO `cy_member_log` VALUES ('2530', '51', '1686196940', '1717300940', '1580882986', '2994');
INSERT INTO `cy_member_log` VALUES ('2531', '71', '1580889556', '1612425556', '1580889556', '2995');
INSERT INTO `cy_member_log` VALUES ('2532', '72', '1580954604', '1612490604', '1580954604', '3003');
INSERT INTO `cy_member_log` VALUES ('2533', '73', '1580973456', '1612509456', '1580973456', '3016');
INSERT INTO `cy_member_log` VALUES ('2534', '74', '1581045597', '1612581597', '1581045597', '3019');
INSERT INTO `cy_member_log` VALUES ('2535', '75', '1581128503', '1612664503', '1581128503', '3022');
INSERT INTO `cy_member_log` VALUES ('2536', '59', '1611057848', '1613649848', '1581433658', '3026');
INSERT INTO `cy_member_log` VALUES ('2537', '59', '1613649848', '1616241848', '1581526932', '3038');
INSERT INTO `cy_member_log` VALUES ('2538', '76', '1581761009', '1613297009', '1581761009', '3058');
INSERT INTO `cy_member_log` VALUES ('2539', '77', '1581784106', '1613320106', '1581784106', '3061');
INSERT INTO `cy_member_log` VALUES ('2540', '78', '1581836179', '1613372179', '1581836179', '3064');
INSERT INTO `cy_member_log` VALUES ('2541', '79', '1581860674', '1613396674', '1581860674', '3068');
INSERT INTO `cy_member_log` VALUES ('2542', '80', '1581908657', '1613444657', '1581908657', '3071');
INSERT INTO `cy_member_log` VALUES ('2543', '81', '1581924156', '1613460156', '1581924156', '3075');
INSERT INTO `cy_member_log` VALUES ('2544', '82', '1581924337', '1613460337', '1581924337', '3077');
INSERT INTO `cy_member_log` VALUES ('2545', '83', '1581924801', '1613460801', '1581924801', '3079');
INSERT INTO `cy_member_log` VALUES ('2546', '84', '1581954488', '1613490488', '1581954488', '3081');
INSERT INTO `cy_member_log` VALUES ('2547', '85', '1581999540', '1613535540', '1581999540', '3083');
INSERT INTO `cy_member_log` VALUES ('2548', '86', '1582079620', '1613615620', '1582079620', '3091');
INSERT INTO `cy_member_log` VALUES ('2549', '87', '1582409950', '1613945950', '1582409950', '3102');
INSERT INTO `cy_member_log` VALUES ('2550', '88', '1582410207', '1613946207', '1582410207', '3103');
INSERT INTO `cy_member_log` VALUES ('2551', '89', '1582419105', '1613955105', '1582419105', '3105');
INSERT INTO `cy_member_log` VALUES ('2552', '90', '1582491709', '1614027709', '1582491709', '3113');
INSERT INTO `cy_member_log` VALUES ('2553', '91', '1582495494', '1614031494', '1582495494', '3114');
INSERT INTO `cy_member_log` VALUES ('2554', '92', '1582522363', '1614058363', '1582522363', '3116');
INSERT INTO `cy_member_log` VALUES ('2555', '51', '1717300940', '1719892940', '1582531444', '3117');
INSERT INTO `cy_member_log` VALUES ('2556', '93', '1582535020', '1614071020', '1582535020', '3122');
INSERT INTO `cy_member_log` VALUES ('2557', '94', '1582550234', '1614086234', '1582550234', '3123');
INSERT INTO `cy_member_log` VALUES ('2558', '95', '1582562458', '1614098458', '1582562458', '3126');
INSERT INTO `cy_member_log` VALUES ('2559', '96', '1582562935', '1614098935', '1582562935', '3127');
INSERT INTO `cy_member_log` VALUES ('2560', '97', '1582569509', '1614105509', '1582569509', '3128');
INSERT INTO `cy_member_log` VALUES ('2561', '98', '1582582748', '1614118748', '1582582748', '3129');
INSERT INTO `cy_member_log` VALUES ('2562', '99', '1582608338', '1614144338', '1582608338', '3136');
INSERT INTO `cy_member_log` VALUES ('2563', '100', '1582654532', '1614190532', '1582654532', '3140');
INSERT INTO `cy_member_log` VALUES ('2564', '101', '1582665444', '1614201444', '1582665444', '3141');
INSERT INTO `cy_member_log` VALUES ('2565', '102', '1582668310', '1614204310', '1582668310', '3142');
INSERT INTO `cy_member_log` VALUES ('2566', '102', '1614204310', '1616796310', '1582668346', '3143');
INSERT INTO `cy_member_log` VALUES ('2567', '102', '1616796310', '1647900310', '1582668349', '3144');
INSERT INTO `cy_member_log` VALUES ('2568', '103', '1582699346', '1614235346', '1582699346', '3155');
INSERT INTO `cy_member_log` VALUES ('2569', '104', '1582707305', '1614243305', '1582707305', '3156');
INSERT INTO `cy_member_log` VALUES ('2570', '105', '1582712400', '1614248400', '1582712400', '3157');
INSERT INTO `cy_member_log` VALUES ('2571', '106', '1582759327', '1614295327', '1582759327', '3171');
INSERT INTO `cy_member_log` VALUES ('2572', '107', '1582768397', '1614304397', '1582768397', '3172');
INSERT INTO `cy_member_log` VALUES ('2573', '108', '1582769180', '1614305180', '1582769180', '3173');
INSERT INTO `cy_member_log` VALUES ('2574', '109', '1582770034', '1614306034', '1582770034', '3174');
INSERT INTO `cy_member_log` VALUES ('2575', '110', '1582778017', '1614314017', '1582778017', '3176');
INSERT INTO `cy_member_log` VALUES ('2576', '111', '1582787174', '1614323174', '1582787174', '3177');
INSERT INTO `cy_member_log` VALUES ('2577', '112', '1582788610', '1614324610', '1582788610', '3178');
INSERT INTO `cy_member_log` VALUES ('2578', '113', '1582789888', '1614325888', '1582789888', '3179');
INSERT INTO `cy_member_log` VALUES ('2579', '114', '1582804749', '1614340749', '1582804749', '3181');
INSERT INTO `cy_member_log` VALUES ('2580', '115', '1582810123', '1614346123', '1582810123', '3182');
INSERT INTO `cy_member_log` VALUES ('2581', '116', '1582812844', '1614348844', '1582812844', '3183');
INSERT INTO `cy_member_log` VALUES ('2582', '117', '1582814208', '1614350208', '1582814208', '3184');
INSERT INTO `cy_member_log` VALUES ('2583', '118', '1582817002', '1614353002', '1582817002', '3185');
INSERT INTO `cy_member_log` VALUES ('2584', '119', '1582817517', '1614353517', '1582817517', '3186');
INSERT INTO `cy_member_log` VALUES ('2585', '120', '1582835655', '1614371655', '1582835655', '3187');
INSERT INTO `cy_member_log` VALUES ('2586', '121', '1582836003', '1614372003', '1582836003', '3188');
INSERT INTO `cy_member_log` VALUES ('2587', '122', '1582838122', '1614374122', '1582838122', '3189');
INSERT INTO `cy_member_log` VALUES ('2588', '123', '1582845117', '1614381117', '1582845117', '3190');
INSERT INTO `cy_member_log` VALUES ('2589', '124', '1582845501', '1614381501', '1582845501', '3191');
INSERT INTO `cy_member_log` VALUES ('2590', '125', '1582862257', '1614398257', '1582862257', '3193');
INSERT INTO `cy_member_log` VALUES ('2591', '126', '1582919867', '1614455867', '1582919867', '3194');
INSERT INTO `cy_member_log` VALUES ('2592', '127', '1582928942', '1614464942', '1582928942', '3195');
INSERT INTO `cy_member_log` VALUES ('2593', '128', '1582929783', '1614465783', '1582929783', '3196');
INSERT INTO `cy_member_log` VALUES ('2594', '129', '1582940581', '1614476581', '1582940581', '3198');
INSERT INTO `cy_member_log` VALUES ('2595', '130', '1582946817', '1614482817', '1582946817', '3199');
INSERT INTO `cy_member_log` VALUES ('2596', '131', '1582948994', '1614484994', '1582948994', '3200');
INSERT INTO `cy_member_log` VALUES ('2597', '132', '1582950093', '1614486093', '1582950093', '3201');
INSERT INTO `cy_member_log` VALUES ('2598', '133', '1582994124', '1614530124', '1582994124', '3202');
INSERT INTO `cy_member_log` VALUES ('2599', '134', '1583013585', '1614549585', '1583013585', '3203');
INSERT INTO `cy_member_log` VALUES ('2600', '135', '1583014573', '1614550573', '1583014573', '3204');
INSERT INTO `cy_member_log` VALUES ('2601', '136', '1583035056', '1614571056', '1583035056', '3206');
INSERT INTO `cy_member_log` VALUES ('2602', '137', '1583035120', '1614571120', '1583035120', '3207');
INSERT INTO `cy_member_log` VALUES ('2603', '138', '1583035896', '1614571896', '1583035896', '3208');
INSERT INTO `cy_member_log` VALUES ('2604', '139', '1583048511', '1614584511', '1583048511', '3209');
INSERT INTO `cy_member_log` VALUES ('2605', '140', '1583074760', '1614610760', '1583074760', '3210');
INSERT INTO `cy_member_log` VALUES ('2606', '141', '1583202761', '1614738761', '1583202761', '3214');
INSERT INTO `cy_member_log` VALUES ('2607', '142', '1583252572', '1614788572', '1583252572', '3216');
INSERT INTO `cy_member_log` VALUES ('2608', '143', '1583261845', '1614797845', '1583261845', '3217');
INSERT INTO `cy_member_log` VALUES ('2609', '144', '1583289209', '1614825209', '1583289209', '3219');
INSERT INTO `cy_member_log` VALUES ('2610', '50', '1611028812', '1642132812', '1583333279', '3230');
INSERT INTO `cy_member_log` VALUES ('2611', '50', '1642132812', '1673236812', '1583333286', '3231');
INSERT INTO `cy_member_log` VALUES ('2612', '116', '1614348844', '1645452844', '1583405768', '3233');
INSERT INTO `cy_member_log` VALUES ('2613', '116', '1645452844', '1676556844', '1583405773', '3234');
INSERT INTO `cy_member_log` VALUES ('2614', '65', '1611180305', '1642284305', '1583409095', '3235');
INSERT INTO `cy_member_log` VALUES ('2615', '65', '1642284305', '1673388305', '1583409887', '3236');
INSERT INTO `cy_member_log` VALUES ('2616', '65', '1673388305', '1704492305', '1583409893', '3237');
INSERT INTO `cy_member_log` VALUES ('2617', '145', '1583447155', '1614551155', '1583447155', '3238');
INSERT INTO `cy_member_log` VALUES ('2618', '146', '1583475189', '1614579189', '1583475189', '3240');
INSERT INTO `cy_member_log` VALUES ('2619', '147', '1583489646', '1614593646', '1583489646', '3242');
INSERT INTO `cy_member_log` VALUES ('2620', '148', '1583499188', '1614603188', '1583499188', '3243');
INSERT INTO `cy_member_log` VALUES ('2621', '149', '1583528671', '1614632671', '1583528671', '3244');
INSERT INTO `cy_member_log` VALUES ('2622', '150', '1583614368', '1614718368', '1583614368', '3247');
INSERT INTO `cy_member_log` VALUES ('2623', '151', '1583631996', '1614735996', '1583631996', '3248');
INSERT INTO `cy_member_log` VALUES ('2624', '152', '1583662770', '1614766770', '1583662770', '3250');
INSERT INTO `cy_member_log` VALUES ('2625', '153', '1583670053', '1614774053', '1583670053', '3251');
INSERT INTO `cy_member_log` VALUES ('2626', '154', '1583671854', '1614775854', '1583671854', '3253');
INSERT INTO `cy_member_log` VALUES ('2627', '155', '1583695671', '1614799671', '1583695671', '3254');
INSERT INTO `cy_member_log` VALUES ('2628', '156', '1583709470', '1614813470', '1583709470', '3255');
INSERT INTO `cy_member_log` VALUES ('2629', '157', '1583710248', '1614814248', '1583710248', '3256');
INSERT INTO `cy_member_log` VALUES ('2630', '158', '1583816155', '1614920155', '1583816155', '3262');
INSERT INTO `cy_member_log` VALUES ('2631', '158', '1614920155', '1646024155', '1583816269', '3263');
INSERT INTO `cy_member_log` VALUES ('2632', '158', '1646024155', '1677128155', '1583816272', '3264');
INSERT INTO `cy_member_log` VALUES ('2633', '158', '1677128155', '1708232155', '1583816275', '3265');
INSERT INTO `cy_member_log` VALUES ('2634', '159', '1583824023', '1614928023', '1583824023', '3272');
INSERT INTO `cy_member_log` VALUES ('2635', '160', '1583869058', '1614973058', '1583869058', '3282');
INSERT INTO `cy_member_log` VALUES ('2636', '161', '1583879132', '1614983132', '1583879132', '3283');
INSERT INTO `cy_member_log` VALUES ('2637', '162', '1583880612', '1614984612', '1583880612', '3284');
INSERT INTO `cy_member_log` VALUES ('2638', '163', '1583886682', '1614990682', '1583886682', '3285');
INSERT INTO `cy_member_log` VALUES ('2639', '65', '1704492305', '1735596305', '1583924539', '3313');
INSERT INTO `cy_member_log` VALUES ('2640', '65', '1735596305', '1766700305', '1583924542', '3314');
INSERT INTO `cy_member_log` VALUES ('2641', '65', '1766700305', '1797804305', '1583924551', '3315');
INSERT INTO `cy_member_log` VALUES ('2642', '164', '1583928920', '1615032920', '1583928920', '3321');
INSERT INTO `cy_member_log` VALUES ('2643', '165', '1583957546', '1615061546', '1583957546', '3327');
INSERT INTO `cy_member_log` VALUES ('2644', '166', '1583973258', '1615077258', '1583973258', '3328');
INSERT INTO `cy_member_log` VALUES ('2645', '167', '1583996436', '1615100436', '1583996436', '3340');
INSERT INTO `cy_member_log` VALUES ('2646', '116', '1676556844', '1707660844', '1584027254', '3363');
INSERT INTO `cy_member_log` VALUES ('2647', '168', '1584049753', '1615153753', '1584049753', '3366');

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
  `moneyType` tinyint(1) DEFAULT NULL COMMENT '金额来源 1-组团 2-余额提现',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=47 DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='会员金额记录';

-- ----------------------------
-- Records of cy_member_money_record
-- ----------------------------
INSERT INTO `cy_member_money_record` VALUES ('8', '59', '3078', '1.00', '1', '1581926329', '1');
INSERT INTO `cy_member_money_record` VALUES ('7', '59', '3080', '1.00', '1', '1581926319', '1');
INSERT INTO `cy_member_money_record` VALUES ('6', '51', '3060', '1.00', '1', '1581865239', '1');
INSERT INTO `cy_member_money_record` VALUES ('9', '59', '3076', '1.00', '1', '1581926337', '1');
INSERT INTO `cy_member_money_record` VALUES ('10', '51', '3074', '1.00', '1', '1581926344', '1');
INSERT INTO `cy_member_money_record` VALUES ('11', '51', '3073', '1.00', '1', '1581926356', '1');
INSERT INTO `cy_member_money_record` VALUES ('12', '51', '3072', '1.00', '1', '1581926378', '1');
INSERT INTO `cy_member_money_record` VALUES ('13', '51', '3090', '1.00', '1', '1582041043', '1');
INSERT INTO `cy_member_money_record` VALUES ('14', '51', '3088', '1.00', '1', '1582041051', '1');
INSERT INTO `cy_member_money_record` VALUES ('15', '51', '3089', '1.00', '1', '1582041056', '1');
INSERT INTO `cy_member_money_record` VALUES ('16', '62', '3087', '1.00', '1', '1582041063', '1');
INSERT INTO `cy_member_money_record` VALUES ('17', '59', '3086', '1.00', '1', '1582041069', '1');
INSERT INTO `cy_member_money_record` VALUES ('18', '59', '3085', '1.00', '1', '1582041076', '1');
INSERT INTO `cy_member_money_record` VALUES ('19', '50', '3120', '1.00', '1', '1582531840', '1');
INSERT INTO `cy_member_money_record` VALUES ('20', '50', '3119', '1.00', '1', '1582531844', '1');
INSERT INTO `cy_member_money_record` VALUES ('21', '50', '3118', '1.00', '1', '1582531844', '1');
INSERT INTO `cy_member_money_record` VALUES ('22', '50', '3139', '1.00', '1', '1582636252', '1');
INSERT INTO `cy_member_money_record` VALUES ('23', '50', '3138', '1.00', '1', '1582636292', '1');
INSERT INTO `cy_member_money_record` VALUES ('24', '50', '4', '200.20', '2', '1582806543', '2');
INSERT INTO `cy_member_money_record` VALUES ('25', '55', '7', '1.20', '2', '1583659007', '2');
INSERT INTO `cy_member_money_record` VALUES ('26', '55', '5', '1.20', '2', '1583659051', '2');
INSERT INTO `cy_member_money_record` VALUES ('27', '55', '6', '1.20', '2', '1583659177', '2');
INSERT INTO `cy_member_money_record` VALUES ('28', '67', '3290', '1.00', '1', '1583909433', '1');
INSERT INTO `cy_member_money_record` VALUES ('29', '67', '3289', '1.00', '1', '1583909442', '1');
INSERT INTO `cy_member_money_record` VALUES ('30', '67', '13', '1.01', '2', '1583909602', '2');
INSERT INTO `cy_member_money_record` VALUES ('31', '65', '3317', '1.00', '1', '1583926767', '1');
INSERT INTO `cy_member_money_record` VALUES ('32', '116', '14', '5.00', '2', '1583993683', '2');
INSERT INTO `cy_member_money_record` VALUES ('33', '116', '3339', '1.00', '1', '1583996311', '1');
INSERT INTO `cy_member_money_record` VALUES ('34', '116', '3338', '1.00', '1', '1583996323', '1');
INSERT INTO `cy_member_money_record` VALUES ('35', '116', '3393', '1.00', '1', '1584078669', '1');
INSERT INTO `cy_member_money_record` VALUES ('36', '116', '3392', '1.00', '1', '1584078683', '1');
INSERT INTO `cy_member_money_record` VALUES ('37', '116', '3414', '1.00', '1', '1584089455', '1');
INSERT INTO `cy_member_money_record` VALUES ('38', '116', '3413', '1.00', '1', '1584089460', '1');
INSERT INTO `cy_member_money_record` VALUES ('39', '65', '3408', '1.00', '1', '1584089634', '1');
INSERT INTO `cy_member_money_record` VALUES ('40', '116', '3418', '1.00', '1', '1584090408', '1');
INSERT INTO `cy_member_money_record` VALUES ('41', '116', '3417', '1.00', '1', '1584090414', '1');
INSERT INTO `cy_member_money_record` VALUES ('42', '116', '3422', '1.00', '1', '1584092052', '1');
INSERT INTO `cy_member_money_record` VALUES ('43', '116', '3421', '1.00', '1', '1584092063', '1');
INSERT INTO `cy_member_money_record` VALUES ('44', '65', '3425', '1.00', '1', '1584093295', '1');
INSERT INTO `cy_member_money_record` VALUES ('45', '116', '3449', '1.00', '1', '1584172843', '1');
INSERT INTO `cy_member_money_record` VALUES ('46', '116', '3448', '1.00', '1', '1584172847', '1');

-- ----------------------------
-- Table structure for cy_member_recharge
-- ----------------------------
DROP TABLE IF EXISTS `cy_member_recharge`;
CREATE TABLE `cy_member_recharge` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `remark` text COMMENT '描述',
  `upload` int(4) DEFAULT NULL COMMENT '上传商品个数',
  `oldPrice` decimal(10,2) DEFAULT NULL COMMENT '原价',
  `price` decimal(10,2) DEFAULT NULL COMMENT '当前价格',
  `createTime` int(11) DEFAULT NULL COMMENT '创建时间',
  `level` tinyint(1) DEFAULT '1' COMMENT '会员等级',
  `rank` int(3) DEFAULT NULL COMMENT '排序值',
  `month` int(3) DEFAULT NULL COMMENT '月数',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='会员充值设置';

-- ----------------------------
-- Records of cy_member_recharge
-- ----------------------------
INSERT INTO `cy_member_recharge` VALUES ('1', '年费会员Ⅳ级', '专享券，免服务费，消费返积分，可发布30个商品', '30', '199.00', '0.40', '1583903294', '4', '1', '12');
INSERT INTO `cy_member_recharge` VALUES ('2', '年费会员Ⅲ级', '专享券，免服务费，消费返积分，可发布18个商品', '18', '98.00', '0.30', '1583903312', '3', '2', '12');
INSERT INTO `cy_member_recharge` VALUES ('3', '年费会员Ⅱ级', '专享券，免服务费，消费返积分，可发布6个商品', '6', '58.00', '0.20', '1583903330', '2', '3', '12');
INSERT INTO `cy_member_recharge` VALUES ('4', '年费会员Ⅰ级', '专享券，免服务费，消费返积分，可发布1个商品', '1', '36.00', '0.10', '1583903353', '1', '4', '12');

-- ----------------------------
-- Table structure for cy_member_return
-- ----------------------------
DROP TABLE IF EXISTS `cy_member_return`;
CREATE TABLE `cy_member_return` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `money` decimal(10,2) DEFAULT NULL COMMENT '提现金额',
  `fee` decimal(10,2) DEFAULT NULL COMMENT '提现手续费',
  `totalMoney` decimal(10,2) DEFAULT NULL COMMENT '总费用',
  `status` tinyint(1) DEFAULT '0' COMMENT '状态 0-申请中 1-已提现',
  `createTime` int(11) DEFAULT NULL COMMENT '提现时间',
  `orderNumber` varchar(80) DEFAULT NULL COMMENT '订单号',
  `successTime` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cy_member_return
-- ----------------------------
INSERT INTO `cy_member_return` VALUES ('4', '55', '1.00', '0.20', '1.20', '0', '1583587962', 'RenmaReturn1583587962', '1583588962');
INSERT INTO `cy_member_return` VALUES ('5', '55', '1.00', '0.40', '1.20', '1', '1583593754', 'RenmaReturn1583593754', '1583659051');
INSERT INTO `cy_member_return` VALUES ('6', '55', '10.00', '0.10', '1.20', '1', '1583593941', 'RenmaReturn1583593941', '1583659177');
INSERT INTO `cy_member_return` VALUES ('7', '55', '1.00', '0.05', '1.20', '1', '1583594914', 'RenmaReturn1583594914', '1583659007');
INSERT INTO `cy_member_return` VALUES ('8', '55', '1.00', '0.05', '1.20', '1', '1583594944', 'RenmaReturn1583594944', '1583658665');
INSERT INTO `cy_member_return` VALUES ('9', '55', '4.00', '0.04', '4.04', '0', '1583662838', 'RenmaReturn1583662838', null);
INSERT INTO `cy_member_return` VALUES ('10', '50', '2.00', '0.02', '2.02', '0', '1583664224', 'RenmaReturn1583664224', null);
INSERT INTO `cy_member_return` VALUES ('11', '50', '1.00', '0.01', '1.01', '0', '1583664310', 'RenmaReturn1583664310', null);
INSERT INTO `cy_member_return` VALUES ('12', '50', '1.00', '0.01', '1.01', '0', '1583664386', 'RenmaReturn1583664386', null);
INSERT INTO `cy_member_return` VALUES ('13', '67', '1.00', '0.01', '1.01', '1', '1583909540', 'RenmaReturn1583909540', '1583909602');
INSERT INTO `cy_member_return` VALUES ('14', '116', '5.00', '0.00', '5.00', '1', '1583993631', 'RenmaReturn1583993631', '1583993683');
INSERT INTO `cy_member_return` VALUES ('15', '65', '2.00', '0.00', '2.00', '0', '1584092302', 'RenmaReturn1584092302', null);

-- ----------------------------
-- Table structure for cy_order
-- ----------------------------
DROP TABLE IF EXISTS `cy_order`;
CREATE TABLE `cy_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderNumber` varchar(80) NOT NULL COMMENT '订单号',
  `uid` int(11) NOT NULL COMMENT '用户uid',
  `productId` int(11) DEFAULT NULL COMMENT '商品Id',
  `catPriceId` int(11) NOT NULL DEFAULT '0' COMMENT '货品ID',
  `productTitle` varchar(255) DEFAULT NULL COMMENT '商品名称',
  `totalPrice` decimal(10,2) DEFAULT NULL COMMENT '订单总价',
  `productInfo` text COMMENT '商品规格信息',
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
  `typeStatus` tinyint(1) DEFAULT '0' COMMENT '0-代付款 1-待接单 2-已接单 3-待评价 4-待售后 5-已评价（已完成）',
  `evalTime` int(11) DEFAULT NULL COMMENT '评价时间',
  `evalImage` text COMMENT '图片',
  `evalVideo` text COMMENT '视频',
  `serverFee` decimal(10,2) DEFAULT '0.00' COMMENT '服务费',
  `repairUid` int(11) DEFAULT NULL COMMENT '维修师id',
  `repairImg` varchar(255) DEFAULT NULL COMMENT '维修图片',
  `repairTime` int(11) DEFAULT NULL COMMENT '接单时间',
  `proType` tinyint(1) DEFAULT NULL COMMENT '商品类型 1-维修 2-新车 3-二手车',
  `repairSuccess` int(11) DEFAULT NULL COMMENT '维修师完成时间',
  `returnRemark` text COMMENT '退款说明',
  `returnTime` int(11) DEFAULT NULL COMMENT '退款申请时间',
  `returnSuccess` int(11) DEFAULT NULL COMMENT '完成时间',
  `refuseRemark` text COMMENT '拒绝理由',
  `oldFee` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=3451 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='订单记录表';

-- ----------------------------
-- Records of cy_order
-- ----------------------------
INSERT INTO `cy_order` VALUES ('3287', 'RM1583908629281521', '67', '69', '53', '测试', '1.00', '测试 (规格：以旧换新) x 1', '0.00', '1.00', '0', '1', '{\"location\":{\"lng\":120.138512,\"lat\":32.787922},\"address\":\"江苏省泰州市兴化市西戚村(泰州市兴化市)公路边修车子的\",\"phone\":\"18914519681\",\"name\":\"曹井之\",\"image\":[\"https://lck.hzlyzhenzhi.com/files/attach/file5e6887042070e.jpg\"],\"productImage\":\"https://lck.hzlyzhenzhi.com/files/attach/images/20200311/1583906911136630.jpg\",\"videoSrcPre\":[\"https://lck.hzlyzhenzhi.com/files/attach/file5e68871075f03.mp4\"],\"remark\":\"\"}', '1', '1583908629', '1', 'E7511D5E1FE3637DA80F241C2D42EE12', '49.85.16.255', '1583908636', '2', '612', '0', '', '1', 'vgh', '5', '1583908917', 's:0:\"\";', 's:0:\"\";', '0.00', '65', 'https://lck.hzlyzhenzhi.com/files/attach/file5e688787e595e.jpg', '1583908694', '1', '1583908744', null, null, null, null, '8.00');
INSERT INTO `cy_order` VALUES ('3288', 'RMZT158390900221465', '67', '69', '31', '测试', '2.00', '测试 (规格：团购测试) x 1', null, '2.00', null, '1', null, '1', '1583909002', '1', '91F4671765DDA4E6DFE98D522A72525D', '49.85.16.255', '1583909008', '2', '613', null, '用户组团购买商品', '2', '用户默认好评', '5', '1584083949', null, null, '0.00', '65', 'https://lck.hzlyzhenzhi.com/files/attach/file5e688a478c9e9.jpg', '1583909419', '1', '1583909447', null, null, null, null, null);
INSERT INTO `cy_order` VALUES ('3289', 'RMZT158390928970887', '65', '69', '31', '测试', '2.00', '测试 (规格：团购测试) x 1', null, '2.00', null, '1', null, '1', '1583909289', '1', '5320263FCB1798F40C63C0E652055341', '49.85.16.255', '1583909294', '2', '614', null, '用户组团购买商品', '2', '抓紧', '5', '1583930973', 's:0:\"\";', 's:0:\"\";', '0.00', '65', 'https://lck.hzlyzhenzhi.com/files/attach/file5e688a42051ec.jpg', '1583909417', '1', '1583909442', null, null, null, null, null);
INSERT INTO `cy_order` VALUES ('3290', 'RMZT158390935528219', '69', '69', '31', '测试', '2.00', '测试 (规格：团购测试) x 1', null, '2.00', null, '1', null, '1', '1583909355', '1', 'DC67A08FEA786C2375829882182FCD1F', '49.85.16.255', '1583909361', '2', '615', null, '用户组团购买商品', '2', '用户默认好评', '5', '1584083949', null, null, '0.00', '65', 'https://lck.hzlyzhenzhi.com/files/attach/file5e688a38ddd5d.jpg', '1583909414', '1', '1583909433', null, null, null, null, null);
INSERT INTO `cy_order` VALUES ('3291', 'RM1583909643775246', '67', '69', '53', '测试', '1.00', '测试 (规格：以旧换新) x 1', '0.00', '1.00', '0', '1', '{\"location\":{\"lng\":120.138512,\"lat\":32.787922},\"address\":\"江苏省泰州市兴化市西戚村(泰州市兴化市)公路边修车子的\",\"phone\":\"18914519681\",\"name\":\"曹井之\",\"image\":[],\"productImage\":\"https://lck.hzlyzhenzhi.com/files/attach/images/20200311/1583906911136630.jpg\",\"videoSrcPre\":[],\"remark\":\"\"}', '-2', '1583909643', '1', 'A03C4AA72F8E8A1AD27CC6F69AC7E603', '49.85.16.255', '1583909649', '2', '616', '0', '', '1', null, '1', null, null, null, '0.00', null, null, null, '1', null, '1', '1583909939', '1583910131', null, '8.00');
INSERT INTO `cy_order` VALUES ('3292', 'RM1583909670915068', '69', '69', '53', '测试', '1.00', '测试 (规格：以旧换新) x 1', '0.00', '1.00', '0', '1', '{\"location\":{\"lng\":120.138512,\"lat\":32.787922},\"address\":\"江苏省泰州市兴化市西戚村(泰州市兴化市)\",\"phone\":\"13651622883\",\"name\":\"倩倩\",\"image\":[],\"productImage\":\"https://lck.hzlyzhenzhi.com/files/attach/images/20200311/1583906911136630.jpg\",\"videoSrcPre\":[],\"remark\":\"\"}', '-2', '1583909670', '1', '7CDF67ECD5F249CFFA9131B85A3E3D40', '49.85.16.255', '1583909675', '2', '617', '0', '', '1', null, '1', null, null, null, '0.00', null, null, null, '1', null, '1', '1583909964', '1583910121', null, '8.00');
INSERT INTO `cy_order` VALUES ('3293', 'RMZT158390984094788', '69', '69', '31', '测试', '2.00', '测试 (规格：团购测试) x 1', null, '2.00', null, '1', null, '-2', '1583909840', '1', 'F1857626D86CCA36E79796283CC49326', '49.85.16.255', '1583909844', '2', '618', null, '用户组团购买商品', '2', null, '1', null, null, null, '0.00', null, null, null, '1', null, '1', '1583909960', '1583910034', null, null);
INSERT INTO `cy_order` VALUES ('3294', 'RM1583909881577858', '67', '69', '53', '测试', '1.00', '测试 (规格：以旧换新) x 1', '0.00', '1.00', '0', '1', '{\"location\":{\"lng\":120.138512,\"lat\":32.787922},\"address\":\"江苏省泰州市兴化市西戚村(泰州市兴化市)公路边修车子的\",\"phone\":\"18914519681\",\"name\":\"曹井之\",\"image\":[],\"productImage\":\"https://lck.hzlyzhenzhi.com/files/attach/images/20200311/1583906911136630.jpg\",\"videoSrcPre\":[],\"remark\":\"\"}', '-2', '1583909881', '1', '3B10D750D205502012D7CA5AB48692BA', '49.85.16.255', '1583909886', '2', '619', '0', '', '1', null, '1', null, null, null, '0.00', null, null, null, '1', null, '1', '1583909934', '1583910026', null, '8.00');
INSERT INTO `cy_order` VALUES ('3302', 'RM1583912488175591', '65', '70', '55', '测试', '1.00', '测试 (规格：白色) x 1', '0.00', '1.00', '0', '1', '{\"location\":{\"lng\":120.150757,\"lat\":33.114761},\"address\":\"江苏省泰州市兴化市农业示范园连接线同济公路桥(泰州市兴化市)\",\"phone\":\"13262862846\",\"name\":\"曹振\",\"image\":[],\"videoSrcPre\":[],\"productImage\":\"\"}', '1', '1583912488', '1', '98AB4E0E62E6B06591946F4114F60467', '122.96.42.73', '1583912492', '2', '627', '0', '', '1', 'Kj', '5', '1583930966', 's:0:\"\";', 's:0:\"\";', '0.00', '65', 'https://lck.hzlyzhenzhi.com/files/attach/file5e68cdfcbad59.jpg', '1583914734', '2', '1583926781', null, null, null, null, '8.00');
INSERT INTO `cy_order` VALUES ('3297', 'RM1583911581497153', '65', '69', '53', '测试', '1.00', '测试 (规格：以旧换新) x 1', '0.00', '1.00', '0', '1', '{\"location\":{\"lng\":119.901733,\"lat\":33.08633},\"address\":\"江苏省泰州市兴化市村道N08\",\"phone\":\"13262862846\",\"name\":\"曹振\",\"image\":[],\"productImage\":\"https://lck.hzlyzhenzhi.com/files/attach/images/20200311/1583906911136630.jpg\",\"videoSrcPre\":[],\"remark\":\"\"}', '1', '1583911581', '1', '11FBCF523250DCAB0CA5F60F08E69B62', '122.96.42.73', '1583911605', '2', '622', '0', '', '1', null, '1', null, null, null, '0.00', null, null, null, '1', null, null, null, null, null, '8.00');
INSERT INTO `cy_order` VALUES ('3298', 'RM1583911771748978', '65', '70', '55', '测试', '1.00', '测试 (规格：白色) x 1', '0.00', '1.00', '0', '1', '{\"location\":{\"lng\":120.138512,\"lat\":32.787922},\"address\":\"江苏省泰州市兴化市村道N08西戚村(泰州市兴化市)\",\"phone\":\"13262862846\",\"name\":\"曹振\",\"image\":[],\"videoSrcPre\":[],\"productImage\":\"\"}', '1', '1583911771', '1', '31A1A6F111BABCF0B30DF917F67EE6B5', '122.96.42.73', '1583911776', '2', '623', '0', '', '1', null, '1', null, null, null, '0.00', null, null, null, '2', null, null, null, null, null, '8.00');
INSERT INTO `cy_order` VALUES ('3300', 'RM1583912367244820', '65', '69', '53', '测试', '1.00', '测试 (规格：以旧换新) x 1', '0.00', '1.00', '0', '1', '{\"location\":{\"lng\":120.150757,\"lat\":33.114761},\"address\":\"江苏省泰州市兴化市农业示范园连接线\",\"phone\":\"13262862846\",\"name\":\"曹振\",\"image\":[],\"productImage\":\"https://lck.hzlyzhenzhi.com/files/attach/images/20200311/1583906911136630.jpg\",\"videoSrcPre\":[],\"remark\":\"\"}', '1', '1583912367', '1', '590BB441225BAF8FCDDD8553B4D9A49E', '122.96.42.73', '1583912375', '2', '625', '0', '', '1', null, '1', null, null, null, '0.00', null, null, null, '1', null, null, null, null, null, '8.00');
INSERT INTO `cy_order` VALUES ('3301', 'RM1583912409168396', '65', '70', '55', '测试', '1.00', '测试 (规格：白色) x 1', '0.00', '1.00', '0', '1', '{\"location\":{\"lng\":120.159264,\"lat\":32.897251},\"address\":\"江苏省泰州市兴化市新张线\",\"phone\":\"13262862846\",\"name\":\"曹振\",\"image\":[],\"videoSrcPre\":[],\"productImage\":\"\"}', '1', '1583912409', '1', '5BFE082C4834FE8C55945E51B00E5877', '122.96.42.73', '1583912418', '2', '626', '0', '', '1', null, '1', null, null, null, '0.00', null, null, null, '2', null, null, null, null, null, '8.00');
INSERT INTO `cy_order` VALUES ('3306', 'RM1583917895372471', '50', '70', '55', '测试', '1.00', '测试 (规格：白色) x 1', '1.00', '0.00', '0', '1', '{\"location\":{\"lng\":104.064873,\"lat\":30.546954},\"address\":\"四川省成都市武侯区英华南路299号吉泰路(成都市武侯区)\",\"phone\":\"18383397521\",\"name\":\"杰\",\"image\":[],\"videoSrcPre\":[],\"productImage\":\"\"}', '1', '1583917895', '1', null, null, '1583917895', '2', '631', '100', '', '1', null, '1', null, null, null, '0.00', null, null, null, '2', null, null, null, null, null, '8.00');
INSERT INTO `cy_order` VALUES ('3329', 'RM1583978200827810', '50', '69', '53', '测试', '1.00', '测试 (规格：以旧换新) x 1', '1.00', '0.00', '0', '1', '{\"location\":{\"lng\":104.062296,\"lat\":30.549022},\"address\":\"四川省成都市武侯区天府二街269号\",\"phone\":\"18383397524\",\"name\":\"刘小明\",\"image\":[],\"productImage\":\"https://lck.hzlyzhenzhi.com/files/attach/images/20200311/1583906911136630.jpg\",\"videoSrcPre\":[],\"remark\":\"\"}', '1', '1583978200', '1', null, null, '1583978200', '2', '648', '100', '', '1', null, '1', null, null, null, '0.00', null, null, null, '1', null, null, null, null, null, '8.00');
INSERT INTO `cy_order` VALUES ('3308', 'RM1583918318969612', '50', '70', '55', '测试', '1.00', '测试 (规格：白色) x 1', '1.00', '0.00', '0', '1', '{\"location\":{\"lng\":103.640114,\"lat\":29.828447},\"address\":\"四川省乐山市夹江县迎宾街夹江县土门邮政代办所\",\"phone\":\"18383397542\",\"name\":\"明\",\"image\":[],\"videoSrcPre\":[],\"productImage\":\"\"}', '1', '1583918318', '1', null, null, '1583918318', '2', '633', '100', '', '1', null, '1', null, null, null, '0.00', null, null, null, '2', null, null, null, null, null, '8.00');
INSERT INTO `cy_order` VALUES ('3309', 'RM1583919472285133', '50', '70', '55', '测试', '1.00', '测试 (规格：白色) x 1', '1.00', '0.00', '0', '1', '{\"location\":{\"lng\":104.06527,\"lat\":30.56885},\"address\":\"四川省成都市武侯区天府大道北段1700号\",\"phone\":\"18383397452\",\"name\":\"小红\",\"image\":[],\"videoSrcPre\":[],\"productImage\":\"\"}', '1', '1583919472', '1', null, null, '1583919472', '2', '634', '100', '', '1', null, '1', null, null, null, '0.00', null, null, null, '2', null, null, null, null, null, '8.00');
INSERT INTO `cy_order` VALUES ('3310', 'RM1583919561485410', '50', '70', '55', '测试', '1.00', '测试 (规格：白色) x 1', '1.00', '0.00', '0', '1', '{\"location\":{\"lng\":104.06527,\"lat\":30.56885},\"address\":\"四川省成都市武侯区天府大道北段1700号\",\"phone\":\"18383397420\",\"name\":\"小芳\",\"image\":[],\"videoSrcPre\":[],\"productImage\":\"\"}', '1', '1583919561', '1', null, null, '1583919561', '2', '635', '100', '', '1', null, '1', null, null, null, '0.00', null, null, null, '2', null, null, null, null, null, '8.00');
INSERT INTO `cy_order` VALUES ('3311', 'RM1583919621515397', '50', '70', '55', '测试', '1.00', '测试 (规格：白色) x 1', '1.00', '0.00', '0', '1', '{\"location\":{\"lng\":104.06527,\"lat\":30.56885},\"address\":\"四川省成都市武侯区天府大道北段1700号\",\"phone\":\"18383397541\",\"name\":\"明哲\",\"image\":[],\"videoSrcPre\":[],\"productImage\":\"\"}', '1', '1583919621', '1', null, null, '1583919621', '2', '636', '100', '', '1', '用户默认好评', '5', '1584286167', null, null, '0.00', '50', 'https://lck.hzlyzhenzhi.com/files/attach/file5e6b8584d0194.jpg', '1583938154', '2', '1584104837', null, null, null, null, '8.00');
INSERT INTO `cy_order` VALUES ('3312', 'RM1583919656519650', '50', '69', '53', '测试', '1.00', '测试 (规格：以旧换新) x 1', '1.00', '0.00', '0', '1', '{\"location\":{\"lng\":104.06527,\"lat\":30.56885},\"address\":\"四川省成都市武侯区天府大道北段1700号\",\"phone\":\"18383397540\",\"name\":\"毛毛\",\"image\":[],\"productImage\":\"https://lck.hzlyzhenzhi.com/files/attach/images/20200311/1583906911136630.jpg\",\"videoSrcPre\":[],\"remark\":\"\"}', '1', '1583919656', '1', null, null, '1583919656', '2', '637', '100', '', '1', null, '2', null, null, null, '0.00', '50', null, '1583937937', '1', null, null, null, null, null, '8.00');
INSERT INTO `cy_order` VALUES ('3343', 'RM1583997512294174', '65', '69', '53', '测试', '1.00', '测试 (规格：以旧换新) x 1', '0.00', '1.00', '0', '1', '{\"location\":{\"lng\":119.901733,\"lat\":33.08633},\"address\":\"江苏省泰州市兴化市村道N08\",\"phone\":\"13262862846\",\"name\":\"曹振\",\"image\":[],\"productImage\":\"https://lck.hzlyzhenzhi.com/files/attach/images/20200311/1583906911136630.jpg\",\"videoSrcPre\":[],\"remark\":\"\"}', '1', '1583997512', '1', 'BEC3D9609A6C60ACDF12E02206917E6F', '122.96.42.73', '1583997516', '2', '660', '0', '', '1', null, '1', null, null, null, '0.00', null, null, null, '1', null, null, null, null, null, '8.00');
INSERT INTO `cy_order` VALUES ('3316', 'RMZT158392629455525', '65', '69', '31', '测试', '2.00', '测试 (规格：团购测试) x 1', null, '2.00', null, '1', null, '-2', '1583926294', '1', 'E4AF50F8A8268A26B97397C85A11A67F', '122.96.42.73', '1583926299', '2', '638', null, '用户组团购买商品', '2', null, '1', null, null, null, '0.00', null, null, null, '1', null, '1', '1583926315', '1583927986', null, null);
INSERT INTO `cy_order` VALUES ('3317', 'RMZT158392670378274', '67', '69', '31', '测试', '2.00', '测试 (规格：团购测试) x 1', null, '2.00', null, '1', null, '1', '1583926703', '1', 'A9B8736A3706FF109C72CB6EB646C4B5', '49.85.16.255', '1583926708', '2', '639', null, '用户组团购买商品', '2', '用户默认好评', '5', '1584104433', null, null, '0.00', '65', 'https://lck.hzlyzhenzhi.com/files/attach/file5e68cdef54e72.jpg', '1583926745', '1', '1583926767', null, null, null, null, null);
INSERT INTO `cy_order` VALUES ('3318', 'RM1583927623658135', '69', '69', '53', '测试', '1.00', '测试 (规格：以旧换新) x 1', '0.00', '1.00', '0', '1', '{\"location\":{\"lng\":120.138512,\"lat\":32.787922},\"address\":\"江苏省泰州市兴化市西戚村(泰州市兴化市)\",\"phone\":\"13651622883\",\"name\":\"倩倩\",\"image\":[],\"productImage\":\"https://lck.hzlyzhenzhi.com/files/attach/images/20200311/1583906911136630.jpg\",\"videoSrcPre\":[],\"remark\":\"\"}', '1', '1583927623', '1', '18E066B97BB0F56128DA4ABAE2B055A9', '49.85.16.255', '1583927628', '2', '640', '0', '', '1', '用户默认好评', '5', '1584104433', null, null, '0.00', '65', 'https://lck.hzlyzhenzhi.com/files/attach/file5e68d16a6ca09.jpg', '1583927648', '1', '1583927675', null, null, null, null, '8.00');
INSERT INTO `cy_order` VALUES ('3319', 'RM1583927802617368', '69', '70', '55', '测试', '1.00', '测试 (规格：白色) x 1', '0.00', '1.00', '0', '1', '{\"location\":{\"lng\":120.138512,\"lat\":32.787922},\"address\":\"江苏省泰州市兴化市西戚村(泰州市兴化市)\",\"phone\":\"13651622883\",\"name\":\"倩倩\",\"image\":[],\"videoSrcPre\":[],\"productImage\":\"\"}', '1', '1583927802', '1', 'A41C65E1DE8DC5B947FF9038EAF4CD66', '49.85.16.255', '1583927807', '2', '641', '0', '', '1', '嗯、嗯', '5', '1584093403', 's:62:\"https://lck.hzlyzhenzhi.com/files/attach/file5e6b58c705749.jpg\";', 's:62:\"https://lck.hzlyzhenzhi.com/files/attach/file5e6b58d71b145.mp4\";', '0.00', '65', 'https://lck.hzlyzhenzhi.com/files/attach/file5e68d2173e92f.jpg', '1583927822', '2', '1583927831', null, null, null, null, '8.00');
INSERT INTO `cy_order` VALUES ('3320', 'RM1583927862972554', '69', '69', '53', '测试', '1.00', '测试 (规格：以旧换新) x 1', '0.00', '1.00', '0', '1', '{\"location\":{\"lng\":120.138512,\"lat\":32.787922},\"address\":\"江苏省泰州市兴化市西戚村(泰州市兴化市)\",\"phone\":\"13651622883\",\"name\":\"倩倩\",\"image\":[],\"productImage\":\"https://lck.hzlyzhenzhi.com/files/attach/images/20200311/1583906911136630.jpg\",\"videoSrcPre\":[],\"remark\":\"\"}', '-2', '1583927862', '1', '634B94FA3B9C16DF300E555AB40502D1', '49.85.16.255', '1583927869', '2', '642', '0', '', '1', null, '1', null, null, null, '0.00', null, null, null, '1', null, '1', '1583927888', '1583927977', null, '8.00');
INSERT INTO `cy_order` VALUES ('3321', 'RM1583928920363483', '164', '0', '0', '注册小程序赠送会员', '0.00', null, null, '0.00', null, '1', null, '1', '1583928920', '1', null, null, null, '1', null, null, null, '1', null, '0', null, null, null, '0.00', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cy_order` VALUES ('3322', 'RM1583936463296742', '50', '69', '53', '测试', '1.00', '测试 (规格：以旧换新) x 1', '1.00', '0.00', '0', '1', '{\"location\":{\"lng\":103.96489,\"lat\":30.64167},\"address\":\"四川省成都市武侯区永康路\",\"phone\":\"18383397524\",\"name\":\"杰锅\",\"image\":[],\"productImage\":\"https://lck.hzlyzhenzhi.com/files/attach/images/20200311/1583906911136630.jpg\",\"videoSrcPre\":[],\"remark\":\"\"}', '1', '1583936463', '1', null, null, '1583936463', '2', '643', '100', '', '1', '用户默认好评', '5', '1584110859', null, null, '0.00', '50', 'https://lck.hzlyzhenzhi.com/files/attach/file5e68f94f09061.jpg', '1583937840', '1', '1583937871', null, null, null, null, '8.00');
INSERT INTO `cy_order` VALUES ('3323', 'RM1583939833267451', '50', '70', '55', '测试', '1.00', '测试 (规格：白色) x 1', '1.00', '0.00', '0', '1', '{\"location\":{\"lng\":103.965012,\"lat\":30.631479},\"address\":\"四川省成都市武侯区金兴北路陆坝村(成都市武侯区)\",\"phone\":\"18383397524\",\"name\":\"阿飞\",\"image\":[],\"videoSrcPre\":[],\"productImage\":\"\"}', '1', '1583939833', '1', null, null, '1583939833', '2', '644', '100', '', '1', null, '1', null, null, null, '0.00', null, null, null, '2', null, null, null, null, null, '8.00');
INSERT INTO `cy_order` VALUES ('3324', 'RM1583941088439373', '50', '69', '54', '测试', '2.00', '测试 (规格：团购测试) x 1', '2.00', '0.00', '0', '1', '{\"location\":{\"lng\":103.97232,\"lat\":30.6434},\"address\":\"四川省成都市武侯区九金街与永康路交叉口西北角蓝光金双楠二期\",\"phone\":\"18383397546\",\"name\":\"林\",\"image\":[],\"productImage\":\"https://lck.hzlyzhenzhi.com/files/attach/images/20200311/1583906911136630.jpg\",\"videoSrcPre\":[],\"remark\":\"\"}', '1', '1583941088', '1', null, null, '1583941088', '2', '645', '200', '', '1', null, '1', null, null, null, '0.00', null, null, null, '1', null, null, null, null, null, '8.00');
INSERT INTO `cy_order` VALUES ('3325', 'RM1583941540341709', '50', '70', '55', '测试', '1.00', '测试 (规格：白色) x 1', '1.00', '0.00', '0', '1', '{\"location\":{\"lng\":103.96489,\"lat\":30.64167},\"address\":\"四川省成都市武侯区永康路\",\"phone\":\"18383397542\",\"name\":\"杰\",\"image\":[],\"videoSrcPre\":[],\"productImage\":\"\"}', '1', '1583941540', '1', null, null, '1583941540', '2', '646', '100', '', '1', null, '1', null, null, null, '0.00', null, null, null, '2', null, null, null, null, null, '8.00');
INSERT INTO `cy_order` VALUES ('3326', 'RM1583941610664421', '50', '70', '55', '测试', '1.00', '测试 (规格：白色) x 1', '1.00', '0.00', '0', '1', '{\"location\":{\"lng\":103.97232,\"lat\":30.6434},\"address\":\"四川省成都市武侯区九金街与永康路交叉口西北角蓝光金双楠二期\",\"phone\":\"18383397546\",\"name\":\"林\",\"image\":[],\"videoSrcPre\":[],\"productImage\":\"\"}', '1', '1583941610', '1', null, null, '1583941610', '2', '647', '100', '', '1', null, '1', null, null, null, '0.00', null, null, null, '2', null, null, null, null, null, '8.00');
INSERT INTO `cy_order` VALUES ('3327', 'RM1583957546817805', '165', '0', '0', '注册小程序赠送会员', '0.00', null, null, '0.00', null, '1', null, '1', '1583957546', '1', null, null, null, '1', null, null, null, '1', null, '0', null, null, null, '0.00', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cy_order` VALUES ('3328', 'RM1583973258921355', '166', '0', '0', '注册小程序赠送会员', '0.00', null, null, '0.00', null, '1', null, '1', '1583973258', '1', null, null, null, '1', null, null, null, '1', null, '0', null, null, null, '0.00', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cy_order` VALUES ('3330', 'RM1583978277476047', '50', '70', '55', '测试', '1.00', '测试 (规格：白色) x 1', '1.00', '0.00', '0', '1', '{\"location\":{\"lng\":104.06527,\"lat\":30.56885},\"address\":\"四川省成都市武侯区天府大道北段1700号\",\"phone\":\"18383397542\",\"name\":\"小芳\",\"image\":[],\"videoSrcPre\":[],\"productImage\":\"\"}', '1', '1583978277', '1', null, null, '1583978277', '2', '649', '100', '', '1', null, '1', null, null, null, '0.00', null, null, null, '2', null, null, null, null, null, '8.00');
INSERT INTO `cy_order` VALUES ('3333', 'RM1583992644184339', '116', '70', '55', '测试', '1.00', '测试 (规格：白色) x 1', '0.00', '1.00', '0', '1', '{\"location\":{\"lng\":116.41637,\"lat\":39.92855},\"address\":\"北京市北京市东城区124348\",\"phone\":\"13378942282\",\"name\":\"暴风科技\",\"image\":[],\"videoSrcPre\":[],\"productImage\":\"\"}', '1', '1583992644', '1', '161BDD04DFB83220ECEDBD6EECB608D9', '171.217.96.51', '1583992649', '2', '652', '0', '', '1', null, '1', null, null, null, '0.00', null, null, null, '2', null, null, null, null, null, '8.00');
INSERT INTO `cy_order` VALUES ('3334', 'RM1583994136463903', '116', '69', '54', '测试', '2.00', '测试 (规格：团购测试) x 1', '0.00', '2.00', '0', '1', '{\"location\":{\"lng\":116.41637,\"lat\":39.92855},\"address\":\"北京市北京市东城区124348\",\"phone\":\"13378942282\",\"name\":\"暴风科技\",\"image\":[],\"productImage\":\"https://lck.hzlyzhenzhi.com/files/attach/images/20200311/1583906911136630.jpg\",\"videoSrcPre\":[],\"remark\":\"\"}', '1', '1583994136', '1', 'B064B303493723F631D1AE307E2E8762', '171.217.96.51', '1583994140', '2', '653', '0', '', '1', null, '1', null, null, null, '0.00', null, null, null, '1', null, null, null, null, null, '8.00');
INSERT INTO `cy_order` VALUES ('3339', 'RMZT158399618127514', '55', '69', '31', '测试', '2.00', '测试 (规格：团购测试) x 1', null, '2.00', null, '1', null, '1', '1583996181', '1', 'E6039F843C95DF4312CF471578FB61EA', '118.112.56.63', '1583996188', '2', '658', null, '用户组团购买商品', '2', '用户默认好评', '5', '1584174275', null, null, '0.00', '116', 'https://lck.hzlyzhenzhi.com/files/attach/file5e69dd975e4e2.jpg', '1583996294', '1', '1583996311', null, null, null, null, null);
INSERT INTO `cy_order` VALUES ('3337', 'RMZT158399601580289', '116', '69', '31', '测试', '2.00', '测试 (规格：团购测试) x 1', null, '2.00', null, '1', null, '1', '1583996015', '1', 'CC12C50CC6D82590470B9935784F619A', '171.217.96.51', '1583996019', '2', '656', null, '用户组团购买商品', '2', '用户默认好评', '5', '1584172008', null, null, '0.00', '116', 'https://lck.hzlyzhenzhi.com/files/attach/file5e69dd9d75b53.jpg', '1583996297', '1', '1583996317', null, null, null, null, null);
INSERT INTO `cy_order` VALUES ('3338', 'RMZT158399611339000', '59', '69', '31', '测试', '2.00', '测试 (规格：团购测试) x 1', null, '2.00', null, '1', null, '1', '1583996113', '1', 'E4B227D94AA7400A74322A8E52F8FC29', '139.207.122.10', '1583996120', '2', '657', null, '用户组团购买商品', '2', '用户默认好评', '5', '1584172658', null, null, '0.00', '116', 'https://lck.hzlyzhenzhi.com/files/attach/file5e69dda308b3e.jpg', '1583996303', '1', '1583996323', null, null, null, null, null);
INSERT INTO `cy_order` VALUES ('3340', 'RM1583996436317152', '167', '0', '0', '注册小程序赠送会员', '0.00', null, null, '0.00', null, '1', null, '1', '1583996436', '1', null, null, null, '1', null, null, null, '1', null, '0', null, null, null, '0.00', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cy_order` VALUES ('3342', 'RM1583996722580212', '50', '69', '53', '测试', '1.00', '测试 (规格：以旧换新) x 1', '1.00', '0.00', '0', '1', '{\"location\":{\"lng\":104.064873,\"lat\":30.546954},\"address\":\"四川省成都市武侯区英华南路299号\",\"phone\":\"18383397540\",\"name\":\"杰\",\"image\":[],\"productImage\":\"https://lck.hzlyzhenzhi.com/files/attach/images/20200311/1583906911136630.jpg\",\"videoSrcPre\":[],\"remark\":\"\"}', '1', '1583996722', '1', null, null, '1583996722', '2', '659', '100', '', '1', null, '1', null, null, null, '0.00', null, null, null, '1', null, null, null, null, null, '8.00');
INSERT INTO `cy_order` VALUES ('3344', 'RM1583997574329591', '65', '69', '53', '测试', '1.00', '测试 (规格：以旧换新) x 1', '0.00', '1.00', '0', '1', '{\"location\":{\"lng\":120.142448,\"lat\":32.785301},\"address\":\"江苏省泰州市兴化市村道N08东戚村(泰州市兴化市)\",\"phone\":\"13262862846\",\"name\":\"曹振\",\"image\":[],\"productImage\":\"https://lck.hzlyzhenzhi.com/files/attach/images/20200311/1583906911136630.jpg\",\"videoSrcPre\":[],\"remark\":\"\"}', '1', '1583997574', '1', 'BE39F3042385D2DB886D406822E59FF9', '122.96.42.73', '1583997580', '2', '661', '0', '', '1', null, '1', null, null, null, '0.00', null, null, null, '1', null, null, null, null, null, '8.00');
INSERT INTO `cy_order` VALUES ('3346', 'RM1583998731853436', '67', '69', '53', '测试', '1.00', '测试 (规格：以旧换新) x 1', '0.00', '1.00', '0', '1', '{\"location\":{\"lng\":120.138512,\"lat\":32.787922},\"address\":\"江苏省泰州市兴化市西戚村小刀电动车专卖店(振宇车行)\",\"phone\":\"13262862846\",\"name\":\"曹振\",\"image\":[],\"productImage\":\"https://lck.hzlyzhenzhi.com/files/attach/images/20200311/1583906911136630.jpg\",\"videoSrcPre\":[],\"remark\":\"\"}', '1', '1583998731', '1', '599A601AA0BD4482A8BF2E60D13C2643', '49.85.16.255', '1583998738', '2', '663', '0', '', '1', null, '1', null, null, null, '0.00', null, null, null, '1', null, null, null, null, null, '8.00');
INSERT INTO `cy_order` VALUES ('3347', 'RM1583998879610439', '50', '70', '55', '测试', '1.00', '测试 (规格：白色) x 1', '1.00', '0.00', '0', '1', '{\"location\":{\"lng\":120.138512,\"lat\":32.787922},\"address\":\"江苏省泰州市兴化市西戚村\",\"phone\":\"18383397540\",\"name\":\"杰\",\"image\":[],\"videoSrcPre\":[],\"productImage\":\"\"}', '1', '1583998879', '1', null, null, '1583998879', '2', '664', '100', '', '1', null, '1', null, null, null, '0.00', null, null, null, '2', null, null, null, null, null, '8.00');
INSERT INTO `cy_order` VALUES ('3348', 'RM1584000375902335', '50', '69', '53', '测试', '1.00', '测试 (规格：以旧换新) x 1', '1.00', '0.00', '0', '1', '{\"location\":{\"lng\":104.064873,\"lat\":30.546954},\"address\":\"四川省成都市武侯区英华南路299号\",\"phone\":\"18383397540\",\"name\":\"杰\",\"image\":[],\"productImage\":\"https://lck.hzlyzhenzhi.com/files/attach/images/20200311/1583906911136630.jpg\",\"videoSrcPre\":[],\"remark\":\"\"}', '1', '1584000375', '1', null, null, '1584000375', '2', '665', '100', '', '1', null, '1', null, null, null, '0.00', null, null, null, '1', null, null, null, null, null, '8.00');
INSERT INTO `cy_order` VALUES ('3350', 'RM1584001378284116', '65', '69', '53', '测试', '1.00', '测试 (规格：以旧换新) x 1', '0.00', '1.00', '0', '1', '{\"location\":{\"lng\":120.150757,\"lat\":33.114761},\"address\":\"江苏省泰州市兴化市农业示范园连接线同济公路桥(泰州市兴化市)\",\"phone\":\"13262862846\",\"name\":\"曹振\",\"image\":[],\"productImage\":\"https://lck.hzlyzhenzhi.com/files/attach/images/20200311/1583906911136630.jpg\",\"videoSrcPre\":[],\"remark\":\"\"}', '1', '1584001378', '1', '181263C4D06C1EBC58747DCB6517DD02', '122.96.42.73', '1584001387', '2', '667', '0', '', '1', null, '1', null, null, null, '0.00', null, null, null, '1', null, null, null, null, null, '8.00');
INSERT INTO `cy_order` VALUES ('3354', 'RM1584005150385071', '50', '70', '55', '测试', '1.00', '测试 (规格：白色) x 1', '1.00', '0.00', '0', '1', '{\"location\":{\"lng\":104.062889,\"lat\":30.547029},\"address\":\"四川省成都市武侯区云华路成都腾讯大厦B座(成都市武侯区)\",\"phone\":\"18383397540\",\"name\":\"杰\",\"image\":[],\"videoSrcPre\":[],\"productImage\":\"\"}', '1', '1584005150', '1', null, null, '1584005150', '2', '672', '100', '', '1', null, '1', null, null, null, '0.00', null, null, null, '2', null, null, null, null, null, '8.00');
INSERT INTO `cy_order` VALUES ('3355', 'RM1584005671742023', '50', '70', '55', '测试', '1.00', '测试 (规格：白色) x 1', '1.00', '0.00', '0', '1', '{\"location\":{\"lng\":104.064873,\"lat\":30.546954},\"address\":\"四川省成都市武侯区英华南路299号\",\"phone\":\"18383397540\",\"name\":\"杰\",\"image\":[],\"videoSrcPre\":[],\"productImage\":\"\"}', '1', '1584005671', '1', null, null, '1584005671', '2', '673', '100', '', '1', null, '1', null, null, null, '0.00', null, null, null, '2', null, null, null, null, null, '8.00');
INSERT INTO `cy_order` VALUES ('3356', 'RM1584006871668380', '50', '70', '55', '测试', '1.00', '测试 (规格：白色) x 1', '1.00', '0.00', '0', '1', '{\"location\":{\"lng\":104.064873,\"lat\":30.546954},\"address\":\"四川省成都市武侯区英华南路299号\",\"phone\":\"18383397526\",\"name\":\"刘\",\"image\":[],\"videoSrcPre\":[],\"productImage\":\"\"}', '1', '1584006871', '1', null, null, '1584006871', '2', '674', '100', '', '1', null, '1', null, null, null, '0.00', null, null, null, '2', null, null, null, null, null, '8.00');
INSERT INTO `cy_order` VALUES ('3357', 'RM1584007128896557', '50', '70', '55', '测试', '1.00', '测试 (规格：白色) x 1', '1.00', '0.00', '0', '1', '{\"location\":{\"lng\":120.150757,\"lat\":33.114761},\"address\":\"江苏省泰州市兴化市农业示范园连接线\",\"phone\":\"18383397560\",\"name\":\"杰\",\"image\":[],\"videoSrcPre\":[],\"productImage\":\"\"}', '1', '1584007128', '1', null, null, '1584007128', '2', '675', '100', '', '1', null, '1', null, null, null, '0.00', null, null, null, '2', null, null, null, null, null, '8.00');
INSERT INTO `cy_order` VALUES ('3358', 'RM1584025338810208', '50', '70', '55', '测试', '1.00', '测试 (规格：白色) x 1', '1.00', '0.00', '0', '1', '{\"location\":{\"lat\":30.64436069399659,\"lng\":103.96975876207313},\"address\":\"四川省成都市武侯区永康路蓝光金双楠二期(成都市武侯区)\",\"phone\":\"18383397540\",\"name\":\"杰\",\"image\":[],\"videoSrcPre\":[],\"productImage\":\"\"}', '1', '1584025338', '1', null, null, '1584025338', '2', '679', '100', '', '1', null, '1', null, null, null, '0.00', null, null, null, '2', null, null, null, null, null, '8.00');
INSERT INTO `cy_order` VALUES ('3359', 'RM1584025463548272', '50', '70', '55', '测试', '1.00', '测试 (规格：白色) x 1', '0.00', '1.00', '0', '1', '{\"location\":{\"lat\":32.772953033447266,\"lng\":120.1286849975586},\"address\":\"江苏省泰州市兴化市农业示范园连接线\",\"phone\":\"18383397524\",\"name\":\"杰\",\"image\":[],\"videoSrcPre\":[],\"productImage\":\"\"}', '1', '1584025463', '1', '92997421EB5F8E383FC3436BE396A104', '223.85.182.255', '1584025473', '2', '680', '0', '', '1', null, '1', null, null, null, '0.00', null, null, null, '2', null, null, null, null, null, '8.00');
INSERT INTO `cy_order` VALUES ('3360', 'RM1584025667271142', '50', '70', '55', '测试', '1.00', '测试 (规格：白色) x 1', '1.00', '0.00', '0', '1', '{\"location\":{\"lat\":30.64242,\"lng\":104.04311},\"address\":\"四川省成都市\",\"phone\":\"18383397450\",\"name\":\"街\",\"image\":[],\"videoSrcPre\":[],\"productImage\":\"\"}', '1', '1584025667', '1', null, null, '1584025667', '2', '681', '100', '', '1', null, '1', null, null, null, '0.00', null, null, null, '2', null, null, null, null, null, '8.00');
INSERT INTO `cy_order` VALUES ('3361', 'RM1584025870860177', '50', '70', '55', '测试', '1.00', '测试 (规格：白色) x 1', '1.00', '0.00', '0', '1', '{\"location\":{\"lat\":30.64569091796875,\"lng\":103.96914672851565},\"address\":\"四川省成都市武侯区机投桥街道九康四路248号3Q便利\",\"phone\":\"18383397650\",\"name\":\"刘\",\"image\":[],\"videoSrcPre\":[],\"productImage\":\"\"}', '1', '1584025870', '1', null, null, '1584025870', '2', '682', '100', '', '1', null, '1', null, null, null, '0.00', null, null, null, '2', null, null, null, null, null, '8.00');
INSERT INTO `cy_order` VALUES ('3362', 'RM1584026111386863', '116', '70', '55', '测试', '1.00', '测试 (规格：白色) x 1', '0.00', '1.00', '0', '1', '{\"location\":{\"lat\":31.07954978942871,\"lng\":106.19081115722656},\"address\":\"四川省南充市蓬安县镇山庙\",\"phone\":\"110\",\"name\":\"110\",\"image\":[],\"videoSrcPre\":[],\"productImage\":\"\"}', '1', '1584026111', '1', '2A044B52DAFCE952B835CB4C78CC5740', '171.92.151.177', '1584026115', '2', '683', '0', '', '1', null, '1', null, null, null, '0.00', null, null, null, '2', null, null, null, null, null, '8.00');
INSERT INTO `cy_order` VALUES ('3368', 'RM1584056023671055', '65', '70', '55', '测试', '1.00', '测试 (规格：白色) x 1', '0.00', '1.00', '0', '1', '{\"location\":{\"lat\":0,\"lng\":0},\"address\":\"江苏省泰州市兴化市\",\"phone\":\"13262862846\",\"name\":\"曹振\",\"image\":[],\"videoSrcPre\":[],\"productImage\":\"\"}', '1', '1584056023', '1', '8A998E3DC404957A96BC672D1503DF4E', '49.85.16.255', '1584056029', '2', '687', '0', '', '1', null, '1', null, null, null, '0.00', null, null, null, '2', null, null, null, null, null, '8.00');
INSERT INTO `cy_order` VALUES ('3364', 'RM1584027719168556', '116', '69', '53', '测试', '1.00', '测试 (规格：以旧换新) x 1', '0.00', '1.00', '0', '1', '{\"location\":{\"lng\":105.963791,\"lat\":31.563953},\"address\":\"四川省南充市蓬安县锦屏山\",\"phone\":\"15984817250\",\"name\":\"亲爱的\",\"image\":[],\"productImage\":\"https://lck.hzlyzhenzhi.com/files/attach/images/20200311/1583906911136630.jpg\",\"videoSrcPre\":[],\"remark\":\"\"}', '1', '1584027719', '1', '9D0E1FEFB15C1764E074A3A8711F1CF8', '171.92.151.177', '1584027723', '2', '684', '0', '', '1', null, '1', null, null, null, '0.00', null, null, null, '1', null, null, null, null, null, '8.00');
INSERT INTO `cy_order` VALUES ('3365', 'RM1584027785993285', '116', '70', '55', '测试', '1.00', '测试 (规格：白色) x 1', '0.00', '1.00', '0', '1', '{\"location\":{\"lat\":31.03618049621582,\"lng\":106.36106872558594},\"address\":\"四川省南充市蓬安县锦屏山\",\"phone\":\"110\",\"name\":\"110\",\"image\":[],\"videoSrcPre\":[],\"productImage\":\"\"}', '1', '1584027785', '1', '99BC3D13335C1A9E3D0EBEED9CF9D0F0', '171.92.151.177', '1584027789', '2', '685', '0', '', '1', null, '1', null, null, null, '0.00', null, null, null, '2', null, null, null, null, null, '8.00');
INSERT INTO `cy_order` VALUES ('3366', 'RM1584049753531661', '168', '0', '0', '注册小程序赠送会员', '0.00', null, null, '0.00', null, '1', null, '1', '1584049753', '1', null, null, null, '1', null, null, null, '1', null, '0', null, null, null, '0.00', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cy_order` VALUES ('3367', 'RM1584055598858171', '65', '69', '53', '测试', '1.00', '测试 (规格：以旧换新) x 1', '0.00', '1.00', '0', '1', '{\"location\":{\"lng\":120.138512,\"lat\":32.787922},\"address\":\"江苏省泰州市兴化市西戚村小刀电动车专卖店(振宇车行)\",\"phone\":\"13262862846\",\"name\":\"曹振\",\"image\":[],\"productImage\":\"https://lck.hzlyzhenzhi.com/files/attach/images/20200311/1583906911136630.jpg\",\"videoSrcPre\":[],\"remark\":\"\"}', '1', '1584055598', '1', 'F06E36F49A15590A7CF0824EEB7E7BCA', '49.85.16.255', '1584055603', '2', '686', '0', '', '1', null, '1', null, null, null, '0.00', null, null, null, '1', null, null, null, null, null, '8.00');
INSERT INTO `cy_order` VALUES ('3369', 'RM1584056371359043', '65', '70', '55', '测试', '1.00', '测试 (规格：白色) x 1', '0.00', '1.00', '0', '1', '{\"location\":{\"lat\":32.78953606968979,\"lng\":120.13536898172504},\"address\":\"江苏省泰州市兴化市西戚村(泰州市兴化市)\",\"phone\":\"13262862846\",\"name\":\"曹振\",\"image\":[],\"videoSrcPre\":[],\"productImage\":\"\"}', '1', '1584056371', '1', '50E6FE380AF32B5961E39BE05D36C906', '122.96.42.73', '1584056375', '2', '688', '0', '', '1', null, '1', null, null, null, '0.00', null, null, null, '2', null, null, null, null, null, '8.00');
INSERT INTO `cy_order` VALUES ('3370', 'RM1584057331463876', '65', '70', '55', '测试', '1.00', '测试 (规格：白色) x 1', '0.00', '1.00', '0', '1', '{\"location\":{\"lat\":32.759339842065266,\"lng\":120.12576134463941},\"address\":\"江苏省泰州市兴化市352省道352省道(泰州市兴化市)\",\"phone\":\"13262862846\",\"name\":\"曹振\",\"image\":[],\"videoSrcPre\":[],\"productImage\":\"\"}', '1', '1584057331', '1', '87B0ADB803EA45F563C2BD4F74A3ECA5', '122.96.42.73', '1584057336', '2', '689', '0', '', '1', null, '1', null, null, null, '0.00', null, null, null, '2', null, null, null, null, null, '8.00');
INSERT INTO `cy_order` VALUES ('3371', 'RM1584057510934890', '65', '70', '55', '测试', '1.00', '测试 (规格：白色) x 1', '0.00', '1.00', '0', '1', '{\"location\":{\"lat\":32.75545130274316,\"lng\":120.12008018885147},\"address\":\"江苏省泰州市兴化市物流大道兴化戴南不锈钢现代物流园(泰州市兴化市)\",\"phone\":\"13262862846\",\"name\":\"曹振\",\"image\":[],\"videoSrcPre\":[],\"productImage\":\"\"}', '1', '1584057510', '1', '3032C12041CCE89FE9F56014B488183C', '122.96.42.73', '1584057516', '2', '690', '0', '', '1', null, '1', null, null, null, '0.00', null, null, null, '2', null, null, null, null, null, '8.00');
INSERT INTO `cy_order` VALUES ('3372', 'RM1584057960838563', '65', '70', '55', '测试', '1.00', '测试 (规格：白色) x 1', '0.00', '1.00', '0', '1', '{\"location\":{\"lat\":32.7609994553763,\"lng\":120.13370339167581},\"address\":\"江苏省泰州市兴化市352省道352省道(泰州市兴化市)\",\"phone\":\"13262862846\",\"name\":\"曹振\",\"image\":[],\"videoSrcPre\":[],\"productImage\":\"\"}', '1', '1584057960', '1', '28CB9EC376D650B4A811DFDB6CBFB246', '122.96.42.73', '1584057965', '2', '691', '0', '', '1', null, '1', null, null, null, '0.00', null, null, null, '2', null, null, null, null, null, '8.00');
INSERT INTO `cy_order` VALUES ('3373', 'RM1584058253540060', '65', '70', '55', '测试', '1.00', '测试 (规格：白色) x 1', '0.00', '1.00', '0', '1', '{\"location\":{\"lat\":32.77048568756435,\"lng\":120.12922665785042},\"address\":\"江苏省泰州市兴化市荻戴线荻戴线(泰州市兴化市)\",\"phone\":\"13262862846\",\"name\":\"曹振\",\"image\":[],\"videoSrcPre\":[],\"productImage\":\"\"}', '1', '1584058253', '1', '3C95EF8FB69AC6D35575F6EFCF17184B', '122.96.42.73', '1584058259', '2', '692', '0', '', '1', null, '1', null, null, null, '0.00', null, null, null, '2', null, null, null, null, null, '8.00');
INSERT INTO `cy_order` VALUES ('3374', 'RM1584058617983067', '65', '70', '55', '测试', '1.00', '测试 (规格：白色) x 1', '0.00', '1.00', '0', '1', '{\"location\":{\"lat\":32.773548801785935,\"lng\":120.15490365000119},\"address\":\"江苏省泰州市兴化市农业示范园连接线同济公路桥(泰州市兴化市)\",\"phone\":\"13262862846\",\"name\":\"曹振\",\"image\":[],\"videoSrcPre\":[],\"productImage\":\"\"}', '1', '1584058617', '1', '4A3263BF8638DE112E6376183E76FBC1', '122.96.42.73', '1584058621', '2', '693', '0', '', '1', null, '1', null, null, null, '0.00', null, null, null, '2', null, null, null, null, null, '8.00');
INSERT INTO `cy_order` VALUES ('3375', 'RM1584058843965198', '65', '70', '55', '测试', '1.00', '测试 (规格：白色) x 1', '0.00', '1.00', '0', '1', '{\"location\":{\"lat\":32.77718966247903,\"lng\":120.14873295596114},\"address\":\"江苏省泰州市兴化市新张线新张线(泰州市兴化市)\",\"phone\":\"13262862846\",\"name\":\"曹振\",\"image\":[],\"videoSrcPre\":[],\"productImage\":\"\"}', '1', '1584058843', '1', '3E09B002F5BE1BFC58C393EA0B844421', '122.96.42.73', '1584058848', '2', '694', '0', '', '1', null, '1', null, null, null, '0.00', null, null, null, '2', null, null, null, null, null, '8.00');
INSERT INTO `cy_order` VALUES ('3376', 'RM1584059029694194', '65', '70', '55', '测试', '1.00', '测试 (规格：白色) x 1', '0.00', '1.00', '0', '1', '{\"location\":{\"lat\":32.787803079992514,\"lng\":120.14464216988323},\"address\":\"江苏省泰州市兴化市村道N08东戚村(泰州市兴化市)\",\"phone\":\"13262862846\",\"name\":\"曹振\",\"image\":[],\"videoSrcPre\":[],\"productImage\":\"\"}', '1', '1584059029', '1', '12AF4BAA88FF168DBB7319C4146994C7', '122.96.42.73', '1584059033', '2', '695', '0', '', '1', null, '1', null, null, null, '0.00', null, null, null, '2', null, null, null, null, null, '8.00');
INSERT INTO `cy_order` VALUES ('3377', 'RM1584059351152212', '65', '70', '55', '测试', '1.00', '测试 (规格：白色) x 1', '0.00', '1.00', '0', '1', '{\"location\":{\"lat\":32.787677585077866,\"lng\":120.13775542884112},\"address\":\"江苏省泰州市兴化市西戚村(泰州市兴化市)\",\"phone\":\"13262862846\",\"name\":\"曹振\",\"image\":[],\"videoSrcPre\":[],\"productImage\":\"\"}', '1', '1584059351', '1', 'C7606C4E115C435D29574DEE0812A3E3', '122.96.42.73', '1584059356', '2', '696', '0', '', '1', null, '1', null, null, null, '0.00', null, null, null, '2', null, null, null, null, null, '8.00');
INSERT INTO `cy_order` VALUES ('3378', 'RM1584059464996067', '65', '70', '55', '测试', '1.00', '测试 (规格：白色) x 1', '0.00', '1.00', '0', '1', '{\"location\":{\"lat\":32.787017483813976,\"lng\":120.13892673562967},\"address\":\"江苏省泰州市兴化市村道N08西戚村(泰州市兴化市)\",\"phone\":\"13262862846\",\"name\":\"曹振\",\"image\":[],\"videoSrcPre\":[],\"productImage\":\"\"}', '1', '1584059464', '1', '7F3BA91833C0D8EB5FE651CA2831FB31', '122.96.42.73', '1584059468', '2', '697', '0', '', '1', null, '1', null, null, null, '0.00', null, null, null, '2', null, null, null, null, null, '8.00');
INSERT INTO `cy_order` VALUES ('3379', 'RM1584059564298722', '65', '70', '55', '测试', '1.00', '测试 (规格：白色) x 1', '0.00', '1.00', '0', '1', '{\"location\":{\"lat\":32.78486157882027,\"lng\":120.13790058643791},\"address\":\"江苏省泰州市兴化市村道N08西戚村(泰州市兴化市)\",\"phone\":\"13262862846\",\"name\":\"曹振\",\"image\":[],\"videoSrcPre\":[],\"productImage\":\"\"}', '1', '1584059564', '1', '2881E84BEC8F58894616F59450C0F9FC', '122.96.42.73', '1584059569', '2', '698', '0', '', '1', null, '1', null, null, null, '0.00', null, null, null, '2', null, null, null, null, null, '8.00');
INSERT INTO `cy_order` VALUES ('3380', 'RM1584059648889014', '65', '70', '55', '测试', '1.00', '测试 (规格：白色) x 1', '0.00', '1.00', '0', '1', '{\"location\":{\"lat\":32.78607765294093,\"lng\":120.13628535788223},\"address\":\"江苏省泰州市兴化市西戚村(泰州市兴化市)\",\"phone\":\"13262862846\",\"name\":\"曹振\",\"image\":[],\"videoSrcPre\":[],\"productImage\":\"\"}', '1', '1584059648', '1', 'D6FA08E041C96824506C908ADDD6F2DF', '122.96.42.73', '1584059653', '2', '699', '0', '', '1', null, '1', null, null, null, '0.00', null, null, null, '2', null, null, null, null, null, '8.00');
INSERT INTO `cy_order` VALUES ('3388', 'RM1584077938748576', '116', '69', '53', '电动车电池', '1.00', '电动车电池 (规格：以旧换新) x 1', '0.00', '1.00', '0', '1', '{\"location\":{\"lat\":31.03618049621582,\"lng\":106.36106872558594},\"address\":\"四川省南充市蓬安县锦屏山\",\"phone\":\"110\",\"name\":\"110\",\"image\":[],\"productImage\":\"https://lck.hzlyzhenzhi.com/files/attach/images/20200311/1583906911136630.jpg\",\"videoSrcPre\":[],\"remark\":\"\"}', '1', '1584077938', '1', 'A9D567C6421B9FF10D46F3EBA2CA8173', '182.144.113.216', '1584077941', '2', '706', '0', '', '1', '用户默认好评', '5', '1584258251', null, null, '0.00', '116', 'https://lck.hzlyzhenzhi.com/files/attach/file5e6b1f677c89f.jpg', '1584078052', '1', '1584078695', null, null, null, null, '8.00');
INSERT INTO `cy_order` VALUES ('3383', 'RM1584068641334326', '50', '69', '54', '电动车电池', '2.00', '电动车电池 (规格：团购测试) x 1', '2.00', '0.00', '0', '1', '{\"location\":{\"lat\":30.547300339,\"lng\":104.065132141},\"address\":\"四川省成都市武侯区高新区英华南路299号福年广场福年广场-T1写字楼\",\"phone\":\"18383397540\",\"name\":\"杰\",\"image\":[],\"productImage\":\"https://lck.hzlyzhenzhi.com/files/attach/images/20200311/1583906911136630.jpg\",\"videoSrcPre\":[],\"remark\":\"\"}', '1', '1584068641', '1', null, null, '1584068641', '2', '701', '200', '', '1', null, '2', null, null, null, '0.00', '116', null, '1584078653', '1', null, null, null, null, null, '8.00');
INSERT INTO `cy_order` VALUES ('3384', 'RM1584068764333416', '50', '69', '54', '电动车电池', '2.00', '电动车电池 (规格：团购测试) x 1', '2.00', '0.00', '0', '1', '{\"location\":{\"lat\":39.90374,\"lng\":116.397827},\"address\":\"北京市东城区东长安街天安门广场\",\"phone\":\"18383396541\",\"name\":\"刘\",\"image\":[],\"productImage\":\"https://lck.hzlyzhenzhi.com/files/attach/images/20200311/1583906911136630.jpg\",\"videoSrcPre\":[],\"remark\":\"\"}', '1', '1584068764', '1', null, null, '1584068764', '2', '702', '200', '', '1', null, '2', null, null, null, '0.00', '50', null, '1584077436', '1', null, null, null, null, null, '8.00');
INSERT INTO `cy_order` VALUES ('3385', 'RM1584071495841185', '69', '70', '55', '电动车', '1.00', '电动车 (规格：白色) x 1', '0.00', '1.00', '0', '1', '{\"location\":{\"lat\":32.787147386998456,\"lng\":120.13843200369902},\"address\":\"江苏省泰州市兴化市西戚村(泰州市兴化市)\",\"phone\":\"13651622883\",\"name\":\"曹振\",\"image\":[],\"videoSrcPre\":[],\"productImage\":\"\"}', '1', '1584071495', '1', '17F6BBB51992C64BBE5501BFD68C635F', '223.104.147.183', '1584071501', '2', '703', '0', '', '1', null, '2', null, null, null, '0.00', '116', null, '1584115150', '2', null, null, null, null, null, '8.00');
INSERT INTO `cy_order` VALUES ('3389', 'RMZT158407798857668', '116', '69', '31', '电动车电池', '2.00', '电动车电池 (规格：团购测试) x 1', null, '2.00', null, '1', null, '1', '1584077988', '1', '8038545714ADB1B250C389BE7F86E5A7', '182.144.113.216', '1584077993', '2', '707', null, '用户组团购买商品', '2', '用户默认好评', '5', '1584258251', null, null, '0.00', '116', 'https://lck.hzlyzhenzhi.com/files/attach/file5e6b1f61c39a8.jpg', '1584078025', '1', '1584078690', null, null, null, null, null);
INSERT INTO `cy_order` VALUES ('3390', 'RMZT158407831655704', '116', '69', '31', '电动车电池', '2.00', '电动车电池 (规格：团购测试) x 1', null, '2.00', null, '1', null, '1', '1584078316', '1', '56E2A18C8621498803EB49EF9D99DACD', '182.144.113.216', '1584078321', '2', '708', null, '用户组团购买商品', '2', '用户默认好评', '5', '1584258251', null, null, '0.00', '116', 'https://lck.hzlyzhenzhi.com/files/attach/file5e6b1f5321f1a.jpg', '1584078350', '1', '1584078675', null, null, null, null, null);
INSERT INTO `cy_order` VALUES ('3391', 'RM1584078435626088', '50', '69', '54', '电动车电池', '2.00', '电动车电池 (规格：团购测试) x 1', '2.00', '0.00', '0', '1', '{\"location\":{\"lat\":30.548034937316125,\"lng\":104.06477877877856},\"address\":\"四川省成都市武侯区高新区英华南路299号福年广场花样年福年广场T2\",\"phone\":\"18383397540\",\"name\":\"杰锅\",\"image\":[],\"productImage\":\"https://lck.hzlyzhenzhi.com/files/attach/images/20200311/1583906911136630.jpg\",\"videoSrcPre\":[],\"remark\":\"\"}', '1', '1584078435', '1', null, null, '1584078435', '2', '709', '200', '', '1', null, '2', null, null, null, '0.00', '50', null, '1584078446', '1', null, null, null, null, null, '8.00');
INSERT INTO `cy_order` VALUES ('3392', 'RMZT158407849689938', '59', '69', '31', '电动车电池', '2.00', '电动车电池 (规格：团购测试) x 1', null, '2.00', null, '1', null, '1', '1584078496', '1', 'B49155E17B1FE68B26058382DF19904F', '139.207.153.212', '1584078502', '2', '710', null, '用户组团购买商品', '2', '用户默认好评', '5', '1584258251', null, null, '0.00', '116', 'https://lck.hzlyzhenzhi.com/files/attach/file5e6b1f5aa79c2.jpg', '1584078647', '1', '1584078683', null, null, null, null, null);
INSERT INTO `cy_order` VALUES ('3393', 'RMZT158407858629321', '50', '69', '31', '电动车电池', '2.00', '电动车电池 (规格：团购测试) x 1', null, '2.00', null, '1', null, '1', '1584078586', '1', '8BFA2E0B559F9C7E26CF62AB168D9040', '117.136.62.29', '1584078592', '2', '711', null, '用户组团购买商品', '2', '用户默认好评', '5', '1584258251', null, null, '0.00', '116', 'https://lck.hzlyzhenzhi.com/files/attach/file5e6b1f4d4ccdf.jpg', '1584078645', '1', '1584078669', null, null, null, null, null);
INSERT INTO `cy_order` VALUES ('3394', 'RMZT158407956171880', '116', '69', '31', '电动车电池', '2.00', '电动车电池 (规格：团购测试) x 1', null, '2.00', null, '1', '{\"address\":\"四川省南充市蓬安县锦屏山\",\"phone\":\"110\",\"name\":\"110\"}', '1', '1584079561', '1', 'E131BDD3A45077161502D3F5DCAA3823', '182.144.113.216', '1584079565', '2', '712', null, '用户组团购买商品', '2', '用户默认好评', '5', '1584286167', null, null, '0.00', '50', 'https://lck.hzlyzhenzhi.com/files/attach/file5e6b8577ac724.jpg', '1584104814', '1', '1584104823', null, null, null, null, null);
INSERT INTO `cy_order` VALUES ('3409', 'RMZT158408800919428', '67', '69', '31', '电动车电池', '2.00', '电动车电池 (规格：团购测试) x 1', null, '2.00', null, '1', '{\"location\":{\"lat\":32.78948484541354,\"lng\":120.13557719008374},\"address\":\"江苏省泰州市兴化市西戚村(泰州市兴化市)\",\"phone\":\"13262862846\",\"name\":\"操作\"}', '-1', '1584088009', '1', 'A1AA94310B651AB0BE52EABAD38BD551', '49.85.16.255', '1584088016', '2', '733', null, '用户组团购买商品', '2', null, '1', null, null, null, '0.00', null, null, null, '1', null, '1', '1584088059', null, null, null);
INSERT INTO `cy_order` VALUES ('3441', 'RMZT158416152630476', '65', '69', '31', '电动车电池', '2.00', '电动车电池 (规格：团购测试) x 1', null, '2.00', null, '1', '{\"location\":{\"lat\":32.789438728549804,\"lng\":120.13562811568947},\"address\":\"江苏省泰州市兴化市西戚村(泰州市兴化市)\",\"phone\":\"13262862846\",\"name\":\"曹振\"}', '-2', '1584161526', '1', '2DDB24554B2BE7DA00E646E77BE582FE', '49.85.16.255', '1584161530', '2', '765', null, '用户组团购买商品', '2', null, '1', null, null, null, '0.00', null, null, null, '1', null, '2', '1584162172', '1584162270', null, null);
INSERT INTO `cy_order` VALUES ('3397', 'RMZT158408211192930', '116', '69', '31', '电动车电池', '2.00', '电动车电池 (规格：团购测试) x 1', null, '2.00', null, '1', '{\"location\":{\"lat\":31.03618049621582,\"lng\":106.36106872558594},\"address\":\"四川省南充市蓬安县锦屏山\",\"phone\":\"11\",\"name\":\"11\"}', '1', '1584082111', '1', 'A79E8D3998CB22A4D4096B9077CD2A04', '182.144.113.216', '1584082117', '2', '721', null, '用户组团购买商品', '2', null, '2', null, null, null, '0.00', '116', null, '1584082131', '1', null, null, null, null, null, null);
INSERT INTO `cy_order` VALUES ('3398', 'RMZT158408231062150', '62', '69', '31', '电动车电池', '2.00', '电动车电池 (规格：团购测试) x 1', null, '2.00', null, '1', null, '0', '1584082310', '1', 'DAC1A3E8933BB656AF59A41E533A38DB', '49.94.218.182', null, '2', '722', null, '用户组团购买商品', '2', null, '0', null, null, null, '0.00', null, null, null, '1', null, null, null, null, null, null);
INSERT INTO `cy_order` VALUES ('3440', 'RMZT158416147089740', '116', '69', '31', '电动车电池', '2.00', '电动车电池 (规格：团购测试) x 1', null, '2.00', null, '1', '{\"location\":{\"lat\":30.715607163200676,\"lng\":104.04785471468172},\"address\":\"四川省成都市金牛区新泉路33号兴元绿洲(成都市金牛区新泉路33号)\",\"phone\":\"110\",\"name\":\"110\"}', '-1', '1584161470', '1', '2F8A2222B775E3688FD412A76211D20F', '171.92.74.218', '1584161474', '2', '764', null, '用户组团购买商品', '2', null, '1', null, null, null, '0.00', null, null, null, '1', null, '555', '1584172278', null, null, null);
INSERT INTO `cy_order` VALUES ('3404', 'RM1584086354871038', '65', '69', '53', '电动车电池', '1.00', '电动车电池 (规格：以旧换新) x 1', '0.00', '1.00', '0', '1', '{\"location\":{\"lat\":32.79531777293525,\"lng\":120.18174210724737},\"address\":\"江苏省盐城市东台市广唐线广唐线(盐城市东台市)\",\"phone\":\"13262862846\",\"name\":\"曹振\",\"image\":[],\"productImage\":\"https://lck.hzlyzhenzhi.com/files/attach/images/20200311/1583906911136630.jpg\",\"videoSrcPre\":[],\"remark\":\"\"}', '1', '1584086354', '1', '6A27918AFF820575699917C66C408954', '122.96.40.174', '1584086359', '2', '728', '0', '', '1', '用户默认好评', '5', '1584286167', null, null, '0.00', '50', 'https://lck.hzlyzhenzhi.com/files/attach/file5e6b84ff876cd.jpg', '1584104605', '1', '1584104703', null, null, null, null, '8.00');
INSERT INTO `cy_order` VALUES ('3405', 'RM1584086378322128', '65', '70', '55', '电动车', '1.00', '电动车 (规格：白色) x 1', '0.00', '1.00', '0', '1', '{\"location\":{\"lat\":32.795362865517326,\"lng\":120.18178034022081},\"address\":\"江苏省盐城市东台市广唐线广唐线(盐城市东台市)\",\"phone\":\"13262862846\",\"name\":\"曹振\",\"image\":[],\"videoSrcPre\":[],\"productImage\":\"\"}', '1', '1584086378', '1', '093693CC5DCC75639FEDE8A93D5391B8', '122.96.40.174', '1584086386', '2', '729', '0', '', '1', null, '2', null, null, null, '0.00', '65', null, '1584092246', '2', null, null, null, null, null, '8.00');
INSERT INTO `cy_order` VALUES ('3406', 'RMZT158408641219617', '65', '69', '31', '电动车电池', '2.00', '电动车电池 (规格：团购测试) x 1', null, '2.00', null, '1', '{\"location\":{\"lat\":32.79535810815287,\"lng\":120.18178045412971},\"address\":\"江苏省盐城市东台市广唐线广唐线(盐城市东台市)\",\"phone\":\"13262862846\",\"name\":\"曹振\"}', '-1', '1584086412', '1', 'FFF874B9FC35F4E94B3783E9931B5F72', '122.96.40.174', '1584086416', '2', '730', null, '用户组团购买商品', '2', null, '1', null, null, null, '0.00', null, null, null, '1', null, '2', '1584086503', null, null, null);
INSERT INTO `cy_order` VALUES ('3408', 'RMZT158408792813715', '69', '69', '31', '电动车电池', '2.00', '电动车电池 (规格：团购测试) x 1', null, '2.00', null, '1', '{\"location\":{\"lat\":32.78950813717222,\"lng\":120.13555470042495},\"address\":\"江苏省泰州市兴化市西戚村(泰州市兴化市)\",\"phone\":\"13262865846\",\"name\":\"上班\"}', '1', '1584087928', '1', 'BBE5E08628500662EA2BE36EF077D224', '49.85.16.255', '1584087933', '2', '732', null, '用户组团购买商品', '2', '刚刚好', '5', '1584089659', 's:0:\"\";', 's:0:\"\";', '0.00', '65', 'https://lck.hzlyzhenzhi.com/files/attach/file5e6b4a2208257.jpg', '1584089617', '1', '1584089634', null, null, null, null, null);
INSERT INTO `cy_order` VALUES ('3412', 'RMZT158408926143478', '116', '69', '31', '电动车电池', '2.00', '电动车电池 (规格：团购测试) x 1', null, '2.00', null, '1', '{\"location\":{\"lat\":30.717937920442914,\"lng\":104.04359957582452},\"address\":\"四川省成都市金牛区星汉北路28号金府国际(成都市金牛区金府路777号)\",\"phone\":\"110\",\"name\":\"110\"}', '1', '1584089261', '1', '52F98766D199333CFC161B2146E87168', '221.237.148.97', '1584089266', '2', '736', null, '用户组团购买商品', '2', '用户默认好评', '5', '1584286167', null, null, '0.00', '116', 'https://lck.hzlyzhenzhi.com/files/attach/file5e6b497a56a0c.jpg', '1584089446', '1', '1584089466', null, null, null, null, null);
INSERT INTO `cy_order` VALUES ('3413', 'RMZT158408929620542', '65', '69', '31', '电动车电池', '2.00', '电动车电池 (规格：团购测试) x 1', null, '2.00', null, '1', '{\"location\":{\"lat\":32.789529883598924,\"lng\":120.13543107008502},\"address\":\"江苏省泰州市兴化市西戚村(泰州市兴化市)\",\"phone\":\"13262862846\",\"name\":\"曹振\"}', '1', '1584089296', '1', 'CC73D7671BB90B73253060542F79B8E4', '49.85.16.255', '1584089301', '2', '737', null, '用户组团购买商品', '2', '用户默认好评', '5', '1584286167', null, null, '0.00', '116', 'https://lck.hzlyzhenzhi.com/files/attach/file5e6b497498c3f.jpg', '1584089448', '1', '1584089460', null, null, null, null, null);
INSERT INTO `cy_order` VALUES ('3414', 'RMZT158408933120754', '59', '69', '31', '电动车电池', '2.00', '电动车电池 (规格：团购测试) x 1', null, '2.00', null, '1', '{\"location\":{\"lat\":30.715775,\"lng\":104.04787},\"address\":\"四川省成都市金牛区新泉路33号兴元绿洲(成都市金牛区新泉路33号)\",\"phone\":\"15984817250\",\"name\":\"周\"}', '1', '1584089331', '1', 'E8BA27F4E64CB7C2006172B9FE2F2B21', '171.92.96.196', '1584089338', '2', '738', null, '用户组团购买商品', '2', '用户默认好评', '5', '1584286167', null, null, '0.00', '116', 'https://lck.hzlyzhenzhi.com/files/attach/file5e6b496f443f4.jpg', '1584089444', '1', '1584089455', null, null, null, null, null);
INSERT INTO `cy_order` VALUES ('3415', 'RM1584089386660943', '69', '69', '53', '电动车电池', '1.00', '电动车电池 (规格：以旧换新) x 1', '0.00', '1.00', '0', '1', '{\"location\":{\"lat\":32.78949328064749,\"lng\":120.13558156201987},\"address\":\"江苏省泰州市兴化市西戚村(泰州市兴化市)\",\"phone\":\"13262862846\",\"name\":\"在想\",\"image\":[],\"productImage\":\"https://lck.hzlyzhenzhi.com/files/attach/images/20200311/1583906911136630.jpg\",\"videoSrcPre\":[],\"remark\":\"\"}', '1', '1584089386', '1', 'AB4963A261DC219B56EE8F1A8AF90140', '49.85.16.255', '1584089391', '2', '739', '0', '', '1', '规划', '5', '1584089478', 's:0:\"\";', 's:0:\"\";', '0.00', '65', 'https://lck.hzlyzhenzhi.com/files/attach/file5e6b494d5f79e.jpg', '1584089410', '1', '1584089421', null, null, null, null, '8.00');
INSERT INTO `cy_order` VALUES ('3416', 'RMZT158409022392900', '116', '69', '31', '电动车电池', '2.00', '电动车电池 (规格：团购测试) x 1', null, '2.00', null, '1', '{\"location\":{\"lat\":30.718036901573125,\"lng\":104.04339846744402},\"address\":\"四川省成都市金牛区星汉北路28号爱悦酒店(成都市金牛区星汉北路28号)\",\"phone\":\"110\",\"name\":\"110\"}', '1', '1584090223', '1', 'B955FB756800CB82805D493F789185C5', '221.237.148.97', '1584090227', '2', '740', null, '用户组团购买商品', '2', '用户默认好评', '5', '1584286167', null, null, '0.00', '116', 'https://lck.hzlyzhenzhi.com/files/attach/file5e6b4d34d7f11.jpg', '1584090402', '1', '1584090421', null, null, null, null, null);
INSERT INTO `cy_order` VALUES ('3417', 'RMZT158409030813131', '65', '69', '31', '电动车电池', '2.00', '电动车电池 (规格：团购测试) x 1', null, '2.00', null, '1', '{\"location\":{\"lat\":32.78954068286826,\"lng\":120.13538071274766},\"address\":\"江苏省泰州市兴化市西戚村(泰州市兴化市)\",\"phone\":\"13262862846\",\"name\":\"曹振\"}', '1', '1584090308', '1', '311AC924AAA0B784002DF55F1FD8321C', '49.85.16.255', '1584090313', '2', '741', null, '用户组团购买商品', '2', '用户默认好评', '5', '1584286167', null, null, '0.00', '116', 'https://lck.hzlyzhenzhi.com/files/attach/file5e6b4d2e31f26.jpg', '1584090400', '1', '1584090414', null, null, null, null, null);
INSERT INTO `cy_order` VALUES ('3418', 'RMZT158409031431789', '59', '69', '31', '电动车电池', '2.00', '电动车电池 (规格：团购测试) x 1', null, '2.00', null, '1', '{\"location\":{\"lat\":30.715767,\"lng\":104.04787},\"address\":\"四川省成都市金牛区新泉路33号兴元绿洲(成都市金牛区新泉路33号)\",\"phone\":\"15984817250\",\"name\":\"周\"}', '1', '1584090314', '1', 'FFBDFFF04E06F623FB66F27C773AB29C', '171.92.96.196', '1584090321', '2', '742', null, '用户组团购买商品', '2', '用户默认好评', '5', '1584286167', null, null, '0.00', '116', 'https://lck.hzlyzhenzhi.com/files/attach/file5e6b4d28823b1.jpg', '1584090398', '1', '1584090408', null, null, null, null, null);
INSERT INTO `cy_order` VALUES ('3419', 'RM1584091370385499', '65', '73', '56', '测试', '1.00', '测试 (规格：黑色) x 1', '0.00', '1.00', '0', '1', '{\"location\":{\"lat\":32.789548036227195,\"lng\":120.1353775968467},\"address\":\"江苏省泰州市兴化市西戚村(泰州市兴化市)\",\"phone\":\"13262862846\",\"name\":\"曹振\",\"image\":[],\"productImage\":\"https://lck.hzlyzhenzhi.com/files/attach/images/20200128/1580188851192524.jpg\",\"videoSrcPre\":[],\"remark\":\"\"}', '1', '1584091370', '1', '095F5B693B9B43D87D357B7EC560112F', '49.85.16.255', '1584091375', '2', '743', '0', '', '1', '睡觉吧', '5', '1584092074', 's:0:\"\";', 's:0:\"\";', '0.00', '65', 'https://lck.hzlyzhenzhi.com/files/attach/file5e6b5105d4c0d.jpg', '1584091387', '1', '1584091398', null, null, null, null, '8.00');
INSERT INTO `cy_order` VALUES ('3420', 'RMZT158409192935096', '116', '69', '31', '电动车电池', '2.00', '电动车电池 (规格：团购测试) x 1', null, '2.00', null, '1', '{\"location\":{\"lat\":30.717978217531765,\"lng\":104.0434866692663},\"address\":\"四川省成都市金牛区星汉北路28号爱悦酒店(成都市金牛区星汉北路28号)\",\"phone\":\"10\",\"name\":\"10\"}', '1', '1584091929', '1', '64216A713CDBFCDB536D2BCBAFF5ED18', '221.237.148.97', '1584091933', '2', '744', null, '用户组团购买商品', '2', '用户默认好评', '5', '1584286167', null, null, '0.00', '116', 'https://lck.hzlyzhenzhi.com/files/attach/file5e6b539962b2c.jpg', '1584092045', '1', '1584092057', null, null, null, null, null);
INSERT INTO `cy_order` VALUES ('3421', 'RMZT158409196999929', '65', '69', '31', '电动车电池', '2.00', '电动车电池 (规格：团购测试) x 1', null, '2.00', null, '1', '{\"location\":{\"lat\":32.78951009064361,\"lng\":120.13550886010862},\"address\":\"江苏省泰州市兴化市西戚村(泰州市兴化市)\",\"phone\":\"13262862846\",\"name\":\"曹振\"}', '1', '1584091969', '1', '889AA3F934AF4CF8E5B4F83AB5FB0BF0', '49.85.16.255', '1584091975', '2', '745', null, '用户组团购买商品', '2', '用户默认好评', '5', '1584286167', null, null, '0.00', '116', 'https://lck.hzlyzhenzhi.com/files/attach/file5e6b539f3249c.jpg', '1584092043', '1', '1584092063', null, null, null, null, null);
INSERT INTO `cy_order` VALUES ('3422', 'RMZT158409198392415', '59', '69', '31', '电动车电池', '2.00', '电动车电池 (规格：团购测试) x 1', null, '2.00', null, '1', '{\"location\":{\"lat\":30.715792,\"lng\":104.04786},\"address\":\"四川省成都市金牛区新泉路33号兴元绿洲(成都市金牛区新泉路33号)\",\"phone\":\"15984725636\",\"name\":\"周\"}', '1', '1584091983', '1', '17E123D6E7BAA7F49D6111337662F3A5', '171.92.96.196', '1584091989', '2', '746', null, '用户组团购买商品', '2', '用户默认好评', '5', '1584286167', null, null, '0.00', '116', 'https://lck.hzlyzhenzhi.com/files/attach/file5e6b539424151.jpg', '1584092041', '1', '1584092052', null, null, null, null, null);
INSERT INTO `cy_order` VALUES ('3430', 'RM1584106485886312', '65', '69', '53', '电动车电池', '1.00', '电动车电池 (规格：以旧换新) x 1', '0.24', '0.76', '0', '1', '{\"location\":{\"lat\":32.78943636582488,\"lng\":120.13558288513937},\"address\":\"江苏省泰州市兴化市西戚村(泰州市兴化市)\",\"phone\":\"13262862846\",\"name\":\"曹振\",\"image\":[\"https://lck.hzlyzhenzhi.com/files/attach/file5e6b8be15e11e.jpg\"],\"productImage\":\"https://lck.hzlyzhenzhi.com/files/attach/images/20200311/1583906911136630.jpg\",\"videoSrcPre\":[\"https://lck.hzlyzhenzhi.com/files/attach/file5e6b8bea5896a.mp4\"],\"remark\":\"\"}', '-1', '1584106485', '1', 'BE067585F540A2AB502C6EEFDDEC7E76', '49.85.16.255', '1584106490', '2', '754', '24', '', '1', null, '1', null, null, null, '0.00', null, null, null, '1', null, '1', '1584106602', null, null, '8.00');
INSERT INTO `cy_order` VALUES ('3424', 'RMZT158409281325585', '65', '69', '31', '电动车电池', '2.00', '电动车电池 (规格：团购测试) x 1', null, '2.00', null, '1', '{\"location\":{\"lat\":32.789526282719535,\"lng\":120.13552551702884},\"address\":\"江苏省泰州市兴化市西戚村(泰州市兴化市)\",\"phone\":\"13262862846\",\"name\":\"曹振\"}', '-1', '1584092813', '1', '85ADBD201E59185ECB439136B819C7F8', '49.85.16.255', '1584092819', '2', '748', null, '用户组团购买商品', '2', null, '1', null, null, null, '0.00', null, null, null, '1', null, '18', '1584092842', null, null, null);
INSERT INTO `cy_order` VALUES ('3425', 'RMZT158409301092833', '69', '69', '31', '电动车电池', '2.00', '电动车电池 (规格：团购测试) x 1', null, '2.00', null, '1', '{\"location\":{\"lat\":32.78950044619244,\"lng\":120.13547153827838},\"address\":\"江苏省泰州市兴化市西戚村(泰州市兴化市)\",\"phone\":\"1346785757\",\"name\":\"你在\"}', '1', '1584093010', '1', '8E8D34FC36CD72C1462E90AA2A722F70', '49.85.16.255', '1584093014', '2', '749', null, '用户组团购买商品', '2', '今后', '5', '1584093342', 's:0:\"\";', 's:0:\"\";', '0.00', '65', 'https://lck.hzlyzhenzhi.com/files/attach/file5e6b586f6910f.jpg', '1584093259', '1', '1584093295', null, null, null, null, null);
INSERT INTO `cy_order` VALUES ('3426', 'RMZT158409303933178', '67', '69', '31', '电动车电池', '2.00', '电动车电池 (规格：团购测试) x 1', null, '2.00', null, '1', '{\"location\":{\"lat\":32.78951315683735,\"lng\":120.13550426380151},\"address\":\"江苏省泰州市兴化市西戚村(泰州市兴化市)\",\"phone\":\"13264644\",\"name\":\"这些\"}', '-1', '1584093039', '1', 'E791ED8D2BFD8C487E7CF3561F0F887D', '49.85.16.255', '1584093044', '2', '750', null, '用户组团购买商品', '2', null, '1', null, null, null, '0.00', null, null, null, '1', null, '15', '1584095150', null, null, null);
INSERT INTO `cy_order` VALUES ('3435', 'RMZT158410995362901', '116', '69', '31', '电动车电池', '2.00', '电动车电池 (规格：团购测试) x 1', null, '2.00', null, '1', '{\"location\":{\"lat\":30.715507389921214,\"lng\":104.04788832823327},\"address\":\"四川省成都市金牛区新泉路33号兴元绿洲(成都市金牛区新泉路33号)\",\"phone\":\"110\",\"name\":\"110\"}', '-2', '1584109953', '1', 'A91AD941D7214DFCA0278A8287D590F3', '171.92.96.196', '1584109958', '2', '759', null, '用户组团购买商品', '2', null, '1', null, null, null, '0.00', null, null, null, '1', null, '1', '1584110740', '1584161950', null, null);
INSERT INTO `cy_order` VALUES ('3443', 'RMZT158416214296904', '116', '69', '31', '电动车电池', '2.00', '电动车电池 (规格：团购测试) x 1', null, '2.00', null, '1', '{\"location\":{\"lat\":30.71551415074106,\"lng\":104.04790067138103},\"address\":\"四川省成都市金牛区新泉路33号兴元绿洲(成都市金牛区新泉路33号)\",\"phone\":\"110\",\"name\":\"110\"}', '1', '1584162142', '1', '83C5A9F1BB8465863C108A531C916731', '171.92.74.218', '1584162146', '2', '770', null, '用户组团购买商品', '2', null, '1', null, null, null, '0.00', null, null, null, '1', null, null, null, null, null, null);
INSERT INTO `cy_order` VALUES ('3442', 'RMZT158416159445629', '59', '69', '31', '电动车电池', '2.00', '电动车电池 (规格：团购测试) x 1', null, '2.00', null, '1', '{\"location\":{\"lat\":30.715748,\"lng\":104.04781},\"address\":\"四川省成都市金牛区新泉路33号兴元绿洲(成都市金牛区新泉路33号)\",\"phone\":\"10\",\"name\":\"110\"}', '-2', '1584161594', '1', 'D8A55EA9FAC21C84F3BFC755B6C525E1', '171.92.96.196', '1584161601', '2', '766', null, '用户组团购买商品', '2', null, '1', null, null, null, '0.00', null, null, null, '1', null, '10', '1584161637', '1584161941', null, null);
INSERT INTO `cy_order` VALUES ('3446', 'RMZT158417252341636', '116', '69', '31', '电动车电池', '2.00', '电动车电池 (规格：团购测试) x 1', null, '2.00', null, '1', '{\"location\":{\"lat\":30.71790087935832,\"lng\":104.04360403021073},\"address\":\"四川省成都市金牛区星汉北路28号爱悦酒店(成都市金牛区星汉北路28号)\",\"phone\":\"10\",\"name\":\"110\"}', '-2', '1584172523', '1', 'EE4163A1BF711EBF0C007F91BA4E9517', '221.237.148.97', '1584172527', '2', '773', null, '用户组团购买商品', '2', null, '1', null, null, null, '0.00', null, null, null, '1', null, '1', '1584172799', '1584172822', null, null);
INSERT INTO `cy_order` VALUES ('3439', 'RMZT158411534981320', '116', '69', '31', '电动车电池', '2.00', '电动车电池 (规格：团购测试) x 1', null, '2.00', null, '1', '{\"location\":{\"lat\":30.71549607034232,\"lng\":104.0479074859808},\"address\":\"四川省成都市金牛区新泉路33号兴元绿洲(成都市金牛区新泉路33号)\",\"phone\":\"110\",\"name\":\"110\"}', '1', '1584115349', '1', 'A4ADB7F3A99CECB06BF6277B2DEF79D6', '171.92.96.196', '1584115354', '2', '763', null, '用户组团购买商品', '2', null, '1', null, null, null, '0.00', null, null, null, '1', null, null, null, null, null, null);
INSERT INTO `cy_order` VALUES ('3444', 'RMZT158416226148312', '59', '69', '31', '电动车电池', '2.00', '电动车电池 (规格：团购测试) x 1', null, '2.00', null, '1', '{\"location\":{\"lat\":30.715763,\"lng\":104.047874},\"address\":\"四川省成都市金牛区新泉路33号兴元绿洲(成都市金牛区新泉路33号)\",\"phone\":\"110\",\"name\":\"110\"}', '1', '1584162261', '1', 'E58E958D7CE335266CA68F1D0153B3CF', '171.92.96.196', '1584162322', '2', '771', null, '用户组团购买商品', '2', null, '1', null, null, null, '0.00', null, null, null, '1', null, null, null, null, null, null);
INSERT INTO `cy_order` VALUES ('3445', 'RM1584168724874542', '65', '73', '56', '测试', '1.00', '测试 (规格：黑色) x 1', '0.00', '1.00', '0', '1', '{\"location\":{\"lat\":32.79090768102481,\"lng\":120.13543363129388},\"address\":\"江苏省泰州市兴化市朱家村(泰州市兴化市)\",\"phone\":\"13262832846\",\"name\":\"渣男\",\"image\":[],\"productImage\":\"https://lck.hzlyzhenzhi.com/files/attach/images/20200128/1580188851192524.jpg\",\"videoSrcPre\":[],\"remark\":\"\"}', '-1', '1584168724', '1', '2FF1BE04DBCC942CF56829C3CAAC1547', '122.96.41.155', '1584168729', '2', '772', '0', '', '1', null, '1', null, null, null, '0.00', null, null, null, '1', null, '1', '1584173293', null, null, '8.00');
INSERT INTO `cy_order` VALUES ('3447', 'RMZT158417257547441', '59', '69', '31', '电动车电池', '2.00', '电动车电池 (规格：团购测试) x 1', null, '2.00', null, '1', '{\"location\":{\"lat\":30.717802,\"lng\":104.04334},\"address\":\"四川省成都市金牛区金府路799号金府国际(成都市金牛区金府路777号)\",\"phone\":\"110\",\"name\":\"110\"}', '-2', '1584172575', '1', 'A32CE060E36A98EA1EC0A9F58E1A9742', '221.237.148.97', '1584172587', '2', '774', null, '用户组团购买商品', '2', null, '1', null, null, null, '0.00', null, null, null, '1', null, '1', '1584172609', '1584172740', null, null);
INSERT INTO `cy_order` VALUES ('3448', 'RMZT158417258660107', '65', '69', '31', '电动车电池', '2.00', '电动车电池 (规格：团购测试) x 1', null, '2.00', null, '1', '{\"location\":{\"lat\":32.7894689593459,\"lng\":120.13567163393988},\"address\":\"江苏省泰州市兴化市西戚村(泰州市兴化市)\",\"phone\":\"13262862846\",\"name\":\"曹振\"}', '1', '1584172586', '1', '549E1A89E331002E9240944B68A10774', '122.96.41.155', '1584172590', '2', '775', null, '用户组团购买商品', '2', '用户默认好评', '5', '1584346233', null, null, '0.00', '116', 'https://lck.hzlyzhenzhi.com/files/attach/file5e6c8f2f71bae.jpg', '1584172833', '1', '1584172847', null, null, null, null, null);
INSERT INTO `cy_order` VALUES ('3449', 'RMZT158417264362744', '59', '69', '31', '电动车电池', '2.00', '电动车电池 (规格：团购测试) x 1', null, '2.00', null, '1', '{\"location\":{\"lat\":30.717749,\"lng\":104.04337},\"address\":\"四川省成都市金牛区金府路799号金府国际(成都市金牛区金府路777号)\",\"phone\":\"110\",\"name\":\"110\"}', '1', '1584172643', '1', '78CF294197871D06135A5EF18BCCA3E0', '221.237.148.97', '1584172652', '2', '776', null, '用户组团购买商品', '2', '用户默认好评', '5', '1584346233', null, null, '0.00', '116', 'https://lck.hzlyzhenzhi.com/files/attach/file5e6c8f2b4d5d8.jpg', '1584172831', '1', '1584172843', null, null, null, null, null);
INSERT INTO `cy_order` VALUES ('3450', 'RMZT158417335071581', '65', '69', '31', '电动车电池', '2.00', '电动车电池 (规格：团购测试) x 1', null, '2.00', null, '1', '{\"location\":{\"lat\":32.78945709037425,\"lng\":120.13557285428392},\"address\":\"江苏省泰州市兴化市西戚村(泰州市兴化市)\",\"phone\":\"13262862846\",\"name\":\"曹振\"}', '-1', '1584173350', '1', 'A15ED380BFF653B7F1CF016F45A017EC', '122.96.41.155', '1584173355', '2', '777', null, '用户组团购买商品', '2', null, '1', null, null, null, '0.00', null, null, null, '1', null, '1', '1584173583', null, null, null);

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
  `headImgs` text COMMENT '图片轮播',
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
  `serverFee` decimal(10,2) DEFAULT '0.00',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=76 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='商品';

-- ----------------------------
-- Records of cy_product
-- ----------------------------
INSERT INTO `cy_product` VALUES ('70', '电动车', '0', '0', '1.00', '60V', '30', '0', 'https://lck.hzlyzhenzhi.com/files/attach/images/20200128/1580188851202292.jpg', 'a:3:{i:0;s:75:\"https://lck.hzlyzhenzhi.com/files/attach/file/20200311/1583910399139126.jpg\";i:1;s:75:\"https://lck.hzlyzhenzhi.com/files/attach/file/20200311/1583910399733390.jpg\";i:2;s:75:\"https://lck.hzlyzhenzhi.com/files/attach/file/20200311/1583910399597022.jpg\";}', 'a:12:{i:0;s:75:\"https://lck.hzlyzhenzhi.com/files/attach/file/20200311/1583910399131264.jpg\";i:1;s:75:\"https://lck.hzlyzhenzhi.com/files/attach/file/20200311/1583910399173848.jpg\";i:2;s:75:\"https://lck.hzlyzhenzhi.com/files/attach/file/20200311/1583910399548870.jpg\";i:3;s:75:\"https://lck.hzlyzhenzhi.com/files/attach/file/20200311/1583910399106340.jpg\";i:4;s:75:\"https://lck.hzlyzhenzhi.com/files/attach/file/20200311/1583910399528817.jpg\";i:5;s:75:\"https://lck.hzlyzhenzhi.com/files/attach/file/20200311/1583910399325492.jpg\";i:6;s:75:\"https://lck.hzlyzhenzhi.com/files/attach/file/20200311/1583910399691305.jpg\";i:7;s:75:\"https://lck.hzlyzhenzhi.com/files/attach/file/20200311/1583910400195966.jpg\";i:8;s:75:\"https://lck.hzlyzhenzhi.com/files/attach/file/20200311/1583910400717813.jpg\";i:9;s:75:\"https://lck.hzlyzhenzhi.com/files/attach/file/20200311/1583910400129943.jpg\";i:10;s:75:\"https://lck.hzlyzhenzhi.com/files/attach/file/20200311/1583910400139466.jpg\";i:11;s:75:\"https://lck.hzlyzhenzhi.com/files/attach/file/20200311/1583910400355571.jpg\";}', '', '1583910451', '小刀', '大品牌值得信赖', '2', '999999', '0', null, '1', '大品牌值得信赖', '', 'https://lck.hzlyzhenzhi.com', '8.00');
INSERT INTO `cy_product` VALUES ('72', '出售', '0', '0', '88.00', '72V', '40', '0', 'https://lck.hzlyzhenzhi.com/files/attach/file5e6b4addcac48.jpg', 'a:1:{i:0;s:62:\"https://lck.hzlyzhenzhi.com/files/attach/file5e6b4addcac48.jpg\";}', 'a:1:{i:0;s:62:\"https://lck.hzlyzhenzhi.com/files/attach/file5e6b4b24a835b.jpg\";}', '是数不胜数姐姐', '1584089894', '新日', '时间还是感动', '3', '69', '1', null, '0', '下半辈子你做什么', '13262862846', null, '0.00');
INSERT INTO `cy_product` VALUES ('73', '测试', '75', '0', '1.00', '0', '0', '0', 'https://lck.hzlyzhenzhi.com/files/attach/images/20200128/1580188851192524.jpg', 'a:2:{i:0;s:75:\"https://lck.hzlyzhenzhi.com/files/attach/file/20200313/1584090667566857.jpg\";i:1;s:75:\"https://lck.hzlyzhenzhi.com/files/attach/file/20200313/1584090667114774.jpg\";}', 'a:8:{i:0;s:75:\"https://lck.hzlyzhenzhi.com/files/attach/file/20200313/1584090667114774.jpg\";i:1;s:75:\"https://lck.hzlyzhenzhi.com/files/attach/file/20200313/1584090667129430.jpg\";i:2;s:75:\"https://lck.hzlyzhenzhi.com/files/attach/file/20200313/1584090667517672.jpg\";i:3;s:75:\"https://lck.hzlyzhenzhi.com/files/attach/file/20200313/1584090667861065.jpg\";i:4;s:75:\"https://lck.hzlyzhenzhi.com/files/attach/file/20200313/1584090667452048.jpg\";i:5;s:75:\"https://lck.hzlyzhenzhi.com/files/attach/file/20200313/1584090668912273.jpg\";i:6;s:75:\"https://lck.hzlyzhenzhi.com/files/attach/file/20200313/1584090668469864.jpg\";i:7;s:75:\"https://lck.hzlyzhenzhi.com/files/attach/file/20200313/1584090668135464.jpg\";}', '', '1584090714', '急速上门', '上门服务', '1', '999999', '0', null, '0', '快速服务', '', 'https://lck.hzlyzhenzhi.com/files/attach/file/20200313/1584090597734036.mp4', '8.00');
INSERT INTO `cy_product` VALUES ('74', '爸爸', '0', '0', '23939.00', '48V', '60公里', '0', 'https://lck.hzlyzhenzhi.com/files/attach/file5e6b50b10f9a4.jpg', 'a:1:{i:0;s:62:\"https://lck.hzlyzhenzhi.com/files/attach/file5e6b50b10f9a4.jpg\";}', 'a:1:{i:0;s:62:\"https://lck.hzlyzhenzhi.com/files/attach/file5e6b50a80d47b.jpg\";}', '是不是就是', '1584091314', '爱玛', '是黑色金属', '3', '65', '1', null, '0', '不准备睡觉啊', '132738837638', null, '0.00');
INSERT INTO `cy_product` VALUES ('75', 'dianchi', '75', '0', '123.00', '60V', '40', '0', 'https://lck.hzlyzhenzhi.com/files/attach/images/20200121/1579589977137770.png', 'a:1:{i:0;s:75:\"https://lck.hzlyzhenzhi.com/files/attach/file/20200119/1579439052246658.jpg\";}', 'a:1:{i:0;s:75:\"https://lck.hzlyzhenzhi.com/files/attach/file/20200103/1578030431104184.jpg\";}', '靖江区', '1584106874', '电汇', '电池', '1', '999999', '122', null, '0', '电池', '123456789', 'https://lck.hzlyzhenzhi.com/files/attach/file/20200103/1578032905442323.mp4', '0.00');
INSERT INTO `cy_product` VALUES ('69', '电动车电池', '74', '0', '1.00', '60V', '40', '0', 'https://lck.hzlyzhenzhi.com/files/attach/images/20200311/1583906911136630.jpg', 'a:3:{i:0;s:75:\"https://lck.hzlyzhenzhi.com/files/attach/file/20200311/1583907335110355.jpg\";i:1;s:75:\"https://lck.hzlyzhenzhi.com/files/attach/file/20200311/1583907335836150.jpg\";i:2;s:75:\"https://lck.hzlyzhenzhi.com/files/attach/file/20200311/1583907335745869.jpg\";}', 'a:14:{i:0;s:75:\"https://lck.hzlyzhenzhi.com/files/attach/file/20200311/1583907335449251.jpg\";i:1;s:75:\"https://lck.hzlyzhenzhi.com/files/attach/file/20200311/1583907335745869.jpg\";i:2;s:75:\"https://lck.hzlyzhenzhi.com/files/attach/file/20200311/1583907336134982.jpg\";i:3;s:75:\"https://lck.hzlyzhenzhi.com/files/attach/file/20200311/1583907337895706.jpg\";i:4;s:75:\"https://lck.hzlyzhenzhi.com/files/attach/file/20200311/1583907337575550.jpg\";i:5;s:75:\"https://lck.hzlyzhenzhi.com/files/attach/file/20200311/1583907338159733.jpg\";i:6;s:75:\"https://lck.hzlyzhenzhi.com/files/attach/file/20200311/1583907338789202.jpg\";i:7;s:75:\"https://lck.hzlyzhenzhi.com/files/attach/file/20200311/1583907338105793.jpg\";i:8;s:75:\"https://lck.hzlyzhenzhi.com/files/attach/file/20200311/1583907339632782.jpg\";i:9;s:75:\"https://lck.hzlyzhenzhi.com/files/attach/file/20200311/1583907339585447.jpg\";i:10;s:75:\"https://lck.hzlyzhenzhi.com/files/attach/file/20200311/1583907339101740.jpg\";i:11;s:75:\"https://lck.hzlyzhenzhi.com/files/attach/file/20200311/1583907339492972.jpg\";i:12;s:75:\"https://lck.hzlyzhenzhi.com/files/attach/file/20200311/1583907339554206.jpg\";i:13;s:75:\"https://lck.hzlyzhenzhi.com/files/attach/file/20200311/1583907339361983.jpg\";}', '', '1583907394', '天能', '天能电池，大品牌值得信赖', '1', '999999', '0', null, '1', '天能电池，大品牌值得信赖', '', 'https://lck.hzlyzhenzhi.com/files/attach/file/20200311/1583907642739242.mp4', '8.00');

-- ----------------------------
-- Table structure for cy_product_category
-- ----------------------------
DROP TABLE IF EXISTS `cy_product_category`;
CREATE TABLE `cy_product_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `productId` int(11) DEFAULT NULL COMMENT '商品id',
  `cateDesc` varchar(80) DEFAULT NULL COMMENT '分类描述',
  `price` decimal(10,2) DEFAULT NULL COMMENT '价格',
  `number` int(11) DEFAULT '0' COMMENT '库存',
  `createTime` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=58 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='商品颜色';

-- ----------------------------
-- Records of cy_product_category
-- ----------------------------
INSERT INTO `cy_product_category` VALUES ('23', '33', 'L', '1.00', '0', '1579498139');
INSERT INTO `cy_product_category` VALUES ('24', '33', 'x', '1.00', '0', '1579498139');
INSERT INTO `cy_product_category` VALUES ('30', '34', 'l', '2.00', '0', '1579750638');
INSERT INTO `cy_product_category` VALUES ('29', '33', 'm', '100.00', '27', '1579749173');
INSERT INTO `cy_product_category` VALUES ('27', '34', 'x', '0.01', '0', '1579502796');
INSERT INTO `cy_product_category` VALUES ('28', '34', 'm', '0.01', '28', '1579502796');
INSERT INTO `cy_product_category` VALUES ('39', '38', '蓝色', '1.00', '50', '1580802469');
INSERT INTO `cy_product_category` VALUES ('38', '38', '绿色', '1.00', '50', '1580802469');
INSERT INTO `cy_product_category` VALUES ('42', '36', '灰色', '1.00', '49', '1580802665');
INSERT INTO `cy_product_category` VALUES ('43', '35', '黑色裸车（不含电池）', '2199.00', '35', '1580804984');
INSERT INTO `cy_product_category` VALUES ('37', '35', '白色裸车（不含电池）', '2199.00', '9', '1580800984');
INSERT INTO `cy_product_category` VALUES ('40', '43', '灰色', '1.00', '16', '1580802534');
INSERT INTO `cy_product_category` VALUES ('44', '47', '1', '100.00', '9', '1580957575');
INSERT INTO `cy_product_category` VALUES ('45', '47', '2', '100.00', '5', '1580957575');
INSERT INTO `cy_product_category` VALUES ('49', '50', '绿色', '10.00', '10', '1581523792');
INSERT INTO `cy_product_category` VALUES ('48', '48', '1', '2.00', '0', '1580959448');
INSERT INTO `cy_product_category` VALUES ('50', '50', '蓝色', '8.00', '10', '1581523792');
INSERT INTO `cy_product_category` VALUES ('51', '50', '红色', '6.00', '10', '1581523792');
INSERT INTO `cy_product_category` VALUES ('55', '70', '白色', '1.00', '123', '1583910451');
INSERT INTO `cy_product_category` VALUES ('53', '69', '以旧换新', '1.00', '26', '1583907931');
INSERT INTO `cy_product_category` VALUES ('54', '69', '团购测试', '2.00', '14', '1583907931');
INSERT INTO `cy_product_category` VALUES ('56', '73', '黑色', '1.00', '198', '1584090739');
INSERT INTO `cy_product_category` VALUES ('57', '75', '黑色', '111.00', '12', '1584106874');

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
) ENGINE=MyISAM AUTO_INCREMENT=224 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='质保商品';

-- ----------------------------
-- Records of cy_quality_product
-- ----------------------------
INSERT INTO `cy_quality_product` VALUES ('44', '50', '34', '0', '0', '1579502837', null, '', '1579502843', '电动摩托车挡雨棚新款2019电瓶车防晒挡风罩加厚保暖车棚遮阳伞篷', '1', '2927', null, '{\"image\":[],\"videoSrcPre\":[]}', '杰', '18383397521', '四川省成都市武侯区武侯祠大街264号', '{\"lng\":104.04312,\"lat\":30.64243}', null, null, null, '1579503860', '');
INSERT INTO `cy_quality_product` VALUES ('45', '51', '33', '0', '0', '1579595077', null, '', '1579595084', '二手摩托车', '2', '2951', '51', '{\"image\":[\"https://lck.hzlyzhenzhi.com/files/attach/file5e26b5bcdfe1e.jpg\"],\"videoSrcPre\":[]}', '暴风科技', '13378942282', '北京市北京市东城区124348', '{\"lng\":116.41637,\"lat\":39.92855}', '1579595271', 'https://lck.hzlyzhenzhi.com/files/attach/file5e26b62559888.jpg', '1579595301', '1579595204', '110');
INSERT INTO `cy_quality_product` VALUES ('46', '62', '33', '0', '0', '1579755841', null, '', '1579755846', '二手摩托车', '1', '2959', null, '{\"image\":[\"https://lck.hzlyzhenzhi.com/files/attach/file5e2933661f5cf.jpg\"],\"videoSrcPre\":[]}', '质保测试', '18912640855', '江苏省苏州市相城区澄和路1218号', '{\"lng\":120.63091,\"lat\":31.37974}', null, null, null, '1579758450', '质保测试');
INSERT INTO `cy_quality_product` VALUES ('47', '51', '33', '0', '0', '1579778425', null, '', '1579778431', '二手摩托车', '0', '2961', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cy_quality_product` VALUES ('48', '51', '33', '0', '0', '1579783537', null, '', '1579783543', '二手摩托车', '0', '2963', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cy_quality_product` VALUES ('49', '60', '33', '0', '0', '1579783580', null, '', '1579783594', '二手摩托车', '0', '2964', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cy_quality_product` VALUES ('50', '65', '33', '0', '0', '1580192887', null, '', '1580192894', '二手摩托车', '0', '2968', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cy_quality_product` VALUES ('51', '65', '34', '0', '0', '1580193341', null, '', '1580193666', '电动摩托车挡雨棚新款2019电瓶车防晒挡风罩加厚保暖车棚遮阳伞篷', '0', '2970', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cy_quality_product` VALUES ('52', '65', '33', '0', '0', '1580193901', null, '', '1580193908', '二手摩托车', '2', '2971', '65', '{\"image\":[\"https://lck.hzlyzhenzhi.com/files/attach/file5e2fe681244e3.jpg\"],\"videoSrcPre\":[]}', '曹振', '13262862846', '江苏省泰州市兴化市江苏省泰州市兴化市张郭镇唐刘乡西戚村小刀电动车', '{\"lng\":120.138512,\"lat\":32.787922}', '1580197568', 'https://lck.hzlyzhenzhi.com/files/attach/file5e2fe78ebfda0.jpg', '1580197774', '1580197526', '');
INSERT INTO `cy_quality_product` VALUES ('53', '65', '34', '0', '0', '1580195949', null, '', '1580195954', '电动摩托车挡雨棚新款2019电瓶车防晒挡风罩加厚保暖车棚遮阳伞篷', '0', '2973', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cy_quality_product` VALUES ('54', '65', '33', '0', '0', '1580565373', null, '', '1580565380', '二手摩托车', '0', '2974', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cy_quality_product` VALUES ('55', '65', '34', '0', '0', '1580609775', null, '', '1580609782', '电动摩托车挡雨棚新款2019电瓶车防晒挡风罩加厚保暖车棚遮阳伞篷', '0', '2977', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cy_quality_product` VALUES ('56', '65', '33', '0', '0', '1580773059', null, '', '1580773067', '二手摩托车', '0', '2982', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cy_quality_product` VALUES ('57', '62', '33', '0', '0', '1580808761', null, '', '1580808767', '二手摩托车', '0', '2983', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cy_quality_product` VALUES ('58', '51', '33', '0', '0', '1580821415', null, '', '1580821421', '二手摩托车', '0', '2987', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cy_quality_product` VALUES ('59', '51', '34', '0', '0', '1580898295', null, '', '1580898301', '电动摩托车挡雨棚新款2019电瓶车防晒挡风罩加厚保暖车棚遮阳伞篷', '0', '3002', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cy_quality_product` VALUES ('60', '69', '43', '0', '0', '1580956311', null, '', '1580956367', '二手电动车', '0', '3004', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cy_quality_product` VALUES ('61', '65', '33', '0', '0', '1580960614', null, '', '1580960619', '二手摩托车', '0', '3008', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cy_quality_product` VALUES ('62', '65', '33', '0', '0', '1580960840', null, '', '1580960843', '二手摩托车', '0', '3009', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cy_quality_product` VALUES ('63', '65', '33', '0', '0', '1580961158', null, '', '1580961163', '二手摩托车', '0', '3010', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cy_quality_product` VALUES ('64', '65', '33', '0', '0', '1580961420', null, '', '1580961430', '二手摩托车', '0', '3011', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cy_quality_product` VALUES ('65', '65', '33', '0', '0', '1580963848', null, '', '1580963854', '二手摩托车', '0', '3012', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cy_quality_product` VALUES ('66', '65', '33', '0', '0', '1580964394', null, '', '1580964398', '二手摩托车', '0', '3014', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cy_quality_product` VALUES ('67', '51', '34', '0', '0', '1581489202', null, '', '1581489208', '电动摩托车挡雨棚新款2019电瓶车防晒挡风罩加厚保暖车棚遮阳伞篷', '1', '3028', null, '{\"image\":[\"https://lck.hzlyzhenzhi.com/files/attach/file5e476d8ce60cd.png\"],\"videoSrcPre\":[]}', 'wr', '15858565856', '江苏省苏州市姑苏区馨泓路', '{\"lng\":120.581863,\"lat\":31.30604}', null, null, null, '1581739412', '');
INSERT INTO `cy_quality_product` VALUES ('68', '59', '34', '0', '0', '1581524055', null, '', '1581524068', '电动摩托车挡雨棚新款2019电瓶车防晒挡风罩加厚保暖车棚遮阳伞篷', '0', '3029', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cy_quality_product` VALUES ('69', '59', '34', '0', '0', '1581524522', null, '', '1581524533', '电动摩托车挡雨棚新款2019电瓶车防晒挡风罩加厚保暖车棚遮阳伞篷', '2', '3030', '51', '{\"image\":[\"https://lck.hzlyzhenzhi.com/files/attach/file5e4426ed9a08e.jpg\"],\"videoSrcPre\":[]}', '。', '18618404746', '四川省成都市金牛区金府国际(成都市金牛区金府路777号)', '{\"lng\":104.037096,\"lat\":30.714697}', '1581524768', 'https://lck.hzlyzhenzhi.com/files/attach/file5e4427544cdf6.jpg', '1581524820', '1581524721', '110');
INSERT INTO `cy_quality_product` VALUES ('70', '59', '34', '0', '0', '1581524935', null, '', '1581524948', '电动摩托车挡雨棚新款2019电瓶车防晒挡风罩加厚保暖车棚遮阳伞篷', '0', '3031', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cy_quality_product` VALUES ('71', '65', '43', '0', '0', '1581731472', null, '', '1581731481', '二手电动车', '0', '3047', null, null, 'test', '18912652525', '测试地址', null, null, null, null, null, null);
INSERT INTO `cy_quality_product` VALUES ('72', '51', '34', '0', '0', '1581758240', null, '', '1581758246', '电动摩托车挡雨棚新款2019电瓶车防晒挡风罩加厚保暖车棚遮阳伞篷', '0', '3055', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cy_quality_product` VALUES ('73', '51', '33', '0', '0', '1581783712', null, '', '1581783717', '二手摩托车', '0', '3059', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cy_quality_product` VALUES ('74', '62', '33', '0', '0', '1581783808', null, '', '1581783815', '二手摩托车', '0', '3060', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cy_quality_product` VALUES ('75', '77', '33', '0', '0', '1581784142', null, '', '1581784148', '二手摩托车', '0', '3062', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cy_quality_product` VALUES ('76', '65', '43', '0', '0', '1581815690', null, '', '1581815698', '二手电动车', '0', '3063', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cy_quality_product` VALUES ('77', '51', '43', '0', '0', '1581871273', null, '', '1581871279', '二手电动车', '0', '3069', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cy_quality_product` VALUES ('78', '65', '43', '0', '0', '1581908364', null, '', '1581908372', '二手电动车', '0', '3070', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cy_quality_product` VALUES ('79', '51', '33', '0', '0', '1581923676', null, '', '1581923683', '二手摩托车', '0', '3072', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cy_quality_product` VALUES ('80', '62', '33', '0', '0', '1581923809', null, '', '1581923814', '二手摩托车', '0', '3073', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cy_quality_product` VALUES ('81', '59', '33', '0', '0', '1581923985', null, '', '1581923992', '二手摩托车', '0', '3074', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cy_quality_product` VALUES ('82', '81', '33', '0', '0', '1581924174', null, '', '1581924178', '二手摩托车', '0', '3076', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cy_quality_product` VALUES ('83', '82', '33', '0', '0', '1581924431', null, '', '1581924437', '二手摩托车', '0', '3078', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cy_quality_product` VALUES ('84', '83', '33', '0', '0', '1581925051', null, '', '1581925060', '二手摩托车', '0', '3080', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cy_quality_product` VALUES ('85', '65', '43', '0', '0', '1581993210', null, '', '1581993216', '二手电动车', '0', '3082', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cy_quality_product` VALUES ('86', '59', '33', '0', '0', '1582037677', null, '', '1582037686', '二手摩托车', '0', '3085', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cy_quality_product` VALUES ('87', '51', '33', '0', '0', '1582037727', null, '', '1582037732', '二手摩托车', '0', '3086', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cy_quality_product` VALUES ('88', '62', '33', '0', '0', '1582038012', null, '', '1582038017', '二手摩托车', '0', '3087', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cy_quality_product` VALUES ('89', '51', '33', '0', '0', '1582038318', null, '', '1582038323', '二手摩托车', '0', '3088', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cy_quality_product` VALUES ('90', '62', '33', '0', '0', '1582038578', null, '', '1582038583', '二手摩托车', '0', '3089', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cy_quality_product` VALUES ('91', '59', '33', '0', '0', '1582040880', null, '', '1582040889', '二手摩托车', '0', '3090', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cy_quality_product` VALUES ('92', '65', '43', '0', '0', '1582081459', null, '', '1582081465', '二手电动车', '0', '3092', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cy_quality_product` VALUES ('93', '51', '34', '0', '0', '1582089000', null, '', '1582089006', '电动摩托车挡雨棚新款2019电瓶车防晒挡风罩加厚保暖车棚遮阳伞篷', '0', '3093', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cy_quality_product` VALUES ('94', '51', '34', '0', '0', '1582089285', null, '', '1582089292', '电动摩托车挡雨棚新款2019电瓶车防晒挡风罩加厚保暖车棚遮阳伞篷', '0', '3094', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cy_quality_product` VALUES ('95', '65', '43', '0', '0', '1582157499', null, '', '1582157505', '二手电动车', '0', '3095', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cy_quality_product` VALUES ('96', '65', '43', '0', '0', '1582243929', null, '', '1582243939', '二手电动车', '0', '3096', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cy_quality_product` VALUES ('97', '65', '43', '0', '0', '1582326858', null, '', '1582326866', '二手电动车', '0', '3097', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cy_quality_product` VALUES ('98', '50', '34', '0', '0', '1582385424', null, '', '1582385435', '电动摩托车挡雨棚新款2019电瓶车防晒挡风罩加厚保暖车棚遮阳伞篷', '1', '3101', null, '{\"image\":[],\"videoSrcPre\":[]}', '是', '18383397526', '四川省成都市武侯区武侯祠大街264号', '{\"lng\":104.04312,\"lat\":30.64243}', null, null, null, '1582395331', '');
INSERT INTO `cy_quality_product` VALUES ('99', '65', '43', '0', '0', '1582414479', null, '', '1582414486', '二手电动车', '0', '3104', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cy_quality_product` VALUES ('100', '51', '34', '0', '0', '1582436822', null, '', '1582436827', '电动摩托车挡雨棚新款2019电瓶车防晒挡风罩加厚保暖车棚遮阳伞篷', '0', '3106', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cy_quality_product` VALUES ('101', '50', '33', '0', '0', '1582451435', null, '', '1582451445', '二手摩托车', '0', '3108', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cy_quality_product` VALUES ('102', '50', '33', '0', '0', '1582451519', null, '', '1582451525', '二手摩托车', '0', '3109', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cy_quality_product` VALUES ('103', '50', '33', '0', '0', '1582475419', null, '', '1582475438', '二手摩托车', '0', '3111', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cy_quality_product` VALUES ('104', '50', '34', '0', '0', '1582475552', null, '', '1582475561', '电动摩托车挡雨棚新款2019电瓶车防晒挡风罩加厚保暖车棚遮阳伞篷', '0', '3112', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cy_quality_product` VALUES ('105', '65', '43', '0', '0', '1582497504', null, '', '1582497510', '二手电动车', '0', '3115', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cy_quality_product` VALUES ('106', '51', '33', '0', '0', '1582531544', null, '', '1582531576', '二手摩托车', '0', '3118', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cy_quality_product` VALUES ('107', '50', '33', '0', '0', '1582531632', null, '', '1582531638', '二手摩托车', '0', '3119', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cy_quality_product` VALUES ('108', '62', '33', '0', '0', '1582531656', null, '', '1582531661', '二手摩托车', '0', '3120', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cy_quality_product` VALUES ('109', '50', '33', '0', '0', '1582531832', null, '', '1582531839', '二手摩托车', '0', '3121', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cy_quality_product` VALUES ('110', '50', '33', '0', '0', '1582561163', null, '', '1582561171', '二手摩托车', '0', '3125', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cy_quality_product` VALUES ('111', '65', '43', '0', '0', '1582586658', null, '', '1582586664', '二手电动车', '0', '3130', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cy_quality_product` VALUES ('112', '50', '33', '0', '0', '1582594719', null, '', '1582594725', '二手摩托车', '0', '3131', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cy_quality_product` VALUES ('113', '50', '33', '0', '0', '1582595231', null, '', '1582595238', '二手摩托车', '0', '3132', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cy_quality_product` VALUES ('114', '50', '33', '0', '0', '1582595399', null, '', '1582595405', '二手摩托车', '0', '3133', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cy_quality_product` VALUES ('115', '50', '33', '0', '0', '1582595800', null, '', '1582595806', '二手摩托车', '0', '3134', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cy_quality_product` VALUES ('116', '50', '33', '0', '0', '1582596121', null, '', '1582596128', '二手摩托车', '0', '3135', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cy_quality_product` VALUES ('117', '51', '33', '0', '0', '1582635933', null, '', '1582635938', '二手摩托车', '0', '3137', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cy_quality_product` VALUES ('118', '50', '33', '0', '0', '1582636026', null, '', '1582636030', '二手摩托车', '0', '3138', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cy_quality_product` VALUES ('119', '62', '33', '0', '0', '1582636063', null, '', '1582636067', '二手摩托车', '0', '3139', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cy_quality_product` VALUES ('120', '65', '43', '0', '0', '1582695132', null, '', '1582695137', '二手电动车', '0', '3145', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cy_quality_product` VALUES ('121', '51', '33', '0', '0', '1582719440', null, '', '1582719448', '二手摩托车', '1', '3158', null, '{\"image\":[\"https://lck.hzlyzhenzhi.com/files/attach/file5e56658521d60.jpg\"],\"videoSrcPre\":[]}', '暴风科技', '13378942282', '北京市北京市东城区124348', '{\"lng\":116.41637,\"lat\":39.92855}', null, null, null, '1582720391', '');
INSERT INTO `cy_quality_product` VALUES ('122', '62', '33', '0', '0', '1582720007', null, '', '1582720011', '二手摩托车', '0', '3159', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cy_quality_product` VALUES ('123', '50', '33', '0', '0', '1582720030', null, '', '1582720036', '二手摩托车', '0', '3160', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cy_quality_product` VALUES ('124', '65', '43', '0', '0', '1582756474', null, '', '1582756480', '二手电动车', '0', '3170', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cy_quality_product` VALUES ('125', '65', '43', '0', '0', '1582847281', null, '', '1582847288', '二手电动车', '0', '3192', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cy_quality_product` VALUES ('126', '65', '43', '0', '0', '1582930945', null, '', '1582930952', '二手电动车', '0', '3197', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cy_quality_product` VALUES ('127', '65', '43', '0', '0', '1583019560', null, '', '1583019565', '二手电动车', '0', '3205', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cy_quality_product` VALUES ('128', '65', '43', '0', '0', '1583133570', null, '', '1583133576', '二手电动车', '0', '3211', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cy_quality_product` VALUES ('129', '65', '43', '0', '0', '1583193465', null, '', '1583193472', '二手电动车', '0', '3213', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cy_quality_product` VALUES ('130', '65', '43', '0', '0', '1583279354', null, '', '1583279364', '二手电动车', '0', '3218', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cy_quality_product` VALUES ('131', '69', '43', '0', '0', '1583328734', null, '', '1583328740', '二手电动车', '0', '3229', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cy_quality_product` VALUES ('132', '65', '43', '0', '0', '1583365044', null, '', '1583365051', '二手电动车', '0', '3232', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cy_quality_product` VALUES ('133', '65', '43', '0', '0', '1583464819', null, '', '1583464825', '二手电动车', '0', '3239', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cy_quality_product` VALUES ('134', '69', '43', '0', '0', '1583484169', null, '', '1583484175', '二手电动车', '0', '3241', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cy_quality_product` VALUES ('135', '116', '33', '0', '0', '1583661306', null, '', '1583661311', '二手摩托车', '0', '3249', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cy_quality_product` VALUES ('136', '116', '34', '0', '0', '1583743065', null, '', '1583743070', '电动摩托车挡雨棚新款2019电瓶车防晒挡风罩加厚保暖车棚遮阳伞篷', '0', '3258', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cy_quality_product` VALUES ('137', '116', '34', '0', '0', '1583743472', null, '', '1583743477', '电动摩托车挡雨棚新款2019电瓶车防晒挡风罩加厚保暖车棚遮阳伞篷', '0', '3259', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cy_quality_product` VALUES ('138', '116', '42', '0', '0', '1583745886', null, '', '1583745890', '摩托车', '0', '3260', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cy_quality_product` VALUES ('139', '50', '34', '67', '0', '1583846782', null, '', '1583846789', '电动摩托车挡雨棚新款2019电瓶车防晒挡风罩加厚保暖车棚遮阳伞篷', '0', '3281', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cy_quality_product` VALUES ('140', '67', '69', '0', '0', '1583908629', null, '', '1583908636', '测试', '2', '3287', '65', '{\"image\":[],\"videoSrcPre\":[]}', '曹井之', '18914519681', '江苏省泰州市兴化市西戚村(泰州市兴化市)公路边修车子的', '{\"lng\":120.138512,\"lat\":32.787922}', '1583908870', 'https://lck.hzlyzhenzhi.com/files/attach/file5e68881801dff.jpg', '1583908888', '1583908819', '');
INSERT INTO `cy_quality_product` VALUES ('141', '67', '69', '0', '0', '1583909002', null, '', '1583909008', '测试', '0', '3288', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cy_quality_product` VALUES ('142', '65', '69', '0', '0', '1583909289', null, '', '1583909294', '测试', '0', '3289', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cy_quality_product` VALUES ('143', '69', '69', '0', '0', '1583909355', null, '', '1583909361', '测试', '0', '3290', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cy_quality_product` VALUES ('144', '67', '69', '0', '0', '1583909643', null, '', '1583909649', '测试', '0', '3291', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cy_quality_product` VALUES ('145', '69', '69', '0', '0', '1583909670', null, '', '1583909675', '测试', '0', '3292', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cy_quality_product` VALUES ('146', '69', '69', '0', '0', '1583909840', null, '', '1583909844', '测试', '0', '3293', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cy_quality_product` VALUES ('147', '67', '69', '0', '0', '1583909881', null, '', '1583909886', '测试', '0', '3294', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cy_quality_product` VALUES ('148', '65', '69', '0', '0', '1583911581', null, '', '1583911605', '测试', '0', '3297', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cy_quality_product` VALUES ('149', '65', '70', '0', '0', '1583911771', null, '', '1583911776', '测试', '0', '3298', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cy_quality_product` VALUES ('150', '65', '69', '0', '0', '1583912367', null, '', '1583912375', '测试', '0', '3300', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cy_quality_product` VALUES ('151', '65', '70', '0', '0', '1583912409', null, '', '1583912418', '测试', '0', '3301', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cy_quality_product` VALUES ('152', '65', '70', '0', '0', '1583912488', null, '', '1583912492', '测试', '0', '3302', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cy_quality_product` VALUES ('153', '65', '69', '0', '0', '1583926294', null, '', '1583926299', '测试', '0', '3316', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cy_quality_product` VALUES ('154', '67', '69', '0', '0', '1583926703', null, '', '1583926708', '测试', '0', '3317', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cy_quality_product` VALUES ('155', '69', '69', '0', '0', '1583927623', null, '', '1583927628', '测试', '0', '3318', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cy_quality_product` VALUES ('156', '69', '70', '0', '0', '1583927802', null, '', '1583927807', '测试', '0', '3319', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cy_quality_product` VALUES ('157', '69', '69', '0', '0', '1583927862', null, '', '1583927869', '测试', '0', '3320', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cy_quality_product` VALUES ('158', '116', '70', '0', '0', '1583992644', null, '', '1583992649', '测试', '0', '3333', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cy_quality_product` VALUES ('159', '116', '69', '0', '0', '1583994136', null, '', '1583994140', '测试', '0', '3334', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cy_quality_product` VALUES ('160', '116', '69', '0', '0', '1583996015', null, '', '1583996019', '测试', '0', '3337', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cy_quality_product` VALUES ('161', '59', '69', '0', '0', '1583996113', null, '', '1583996120', '测试', '0', '3338', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cy_quality_product` VALUES ('162', '55', '69', '0', '0', '1583996181', null, '', '1583996188', '测试', '0', '3339', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cy_quality_product` VALUES ('163', '65', '69', '0', '0', '1583997512', null, '', '1583997516', '测试', '0', '3343', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cy_quality_product` VALUES ('164', '65', '69', '0', '0', '1583997574', null, '', '1583997580', '测试', '0', '3344', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cy_quality_product` VALUES ('165', '67', '69', '0', '0', '1583998731', null, '', '1583998738', '测试', '0', '3346', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cy_quality_product` VALUES ('166', '65', '69', '0', '0', '1584001378', null, '', '1584001388', '测试', '0', '3350', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cy_quality_product` VALUES ('167', '50', '70', '0', '0', '1584025463', null, '', '1584025473', '测试', '1', '3359', null, '{\"image\":[\"https://lck.hzlyzhenzhi.com/files/attach/file5e6b1a2d5a545.jpg\"],\"videoSrcPre\":[]}', '杰', '18383397524', '四川省成都市武侯区天府大道北段1656环球中心E5区', '[object Object]', null, null, null, '1584077371', '请尽快维修');
INSERT INTO `cy_quality_product` VALUES ('168', '116', '70', '0', '0', '1584026111', null, '', '1584026115', '测试', '0', '3362', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cy_quality_product` VALUES ('169', '116', '69', '0', '0', '1584027719', null, '', '1584027723', '测试', '0', '3364', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cy_quality_product` VALUES ('170', '116', '70', '0', '0', '1584027785', null, '', '1584027789', '测试', '0', '3365', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cy_quality_product` VALUES ('171', '65', '69', '0', '0', '1584055598', null, '', '1584055603', '测试', '0', '3367', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cy_quality_product` VALUES ('172', '65', '70', '0', '0', '1584056023', null, '', '1584056029', '测试', '0', '3368', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cy_quality_product` VALUES ('173', '65', '70', '0', '0', '1584056371', null, '', '1584056375', '测试', '0', '3369', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cy_quality_product` VALUES ('174', '65', '70', '0', '0', '1584057331', null, '', '1584057336', '测试', '0', '3370', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cy_quality_product` VALUES ('175', '65', '70', '0', '0', '1584057510', null, '', '1584057516', '测试', '0', '3371', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cy_quality_product` VALUES ('176', '65', '70', '0', '0', '1584057960', null, '', '1584057965', '测试', '0', '3372', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cy_quality_product` VALUES ('177', '65', '70', '0', '0', '1584058253', null, '', '1584058259', '测试', '0', '3373', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cy_quality_product` VALUES ('178', '65', '70', '0', '0', '1584058617', null, '', '1584058622', '测试', '0', '3374', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cy_quality_product` VALUES ('179', '65', '70', '0', '0', '1584058843', null, '', '1584058848', '测试', '0', '3375', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cy_quality_product` VALUES ('180', '65', '70', '0', '0', '1584059029', null, '', '1584059034', '测试', '0', '3376', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cy_quality_product` VALUES ('181', '65', '70', '0', '0', '1584059351', null, '', '1584059356', '测试', '0', '3377', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cy_quality_product` VALUES ('182', '65', '70', '0', '0', '1584059464', null, '', '1584059468', '测试', '0', '3378', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cy_quality_product` VALUES ('183', '65', '70', '0', '0', '1584059564', null, '', '1584059569', '测试', '0', '3379', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cy_quality_product` VALUES ('184', '65', '70', '0', '0', '1584059648', null, '', '1584059653', '测试', '0', '3380', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cy_quality_product` VALUES ('185', '69', '70', '0', '0', '1584071495', null, '', '1584071501', '电动车', '0', '3385', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cy_quality_product` VALUES ('186', '116', '69', '0', '0', '1584077938', null, '', '1584077941', '电动车电池', '0', '3388', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cy_quality_product` VALUES ('187', '116', '69', '0', '0', '1584077988', null, '', '1584077993', '电动车电池', '0', '3389', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cy_quality_product` VALUES ('188', '116', '69', '0', '0', '1584078316', null, '', '1584078321', '电动车电池', '0', '3390', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cy_quality_product` VALUES ('189', '59', '69', '0', '0', '1584078496', null, '', '1584078502', '电动车电池', '0', '3392', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cy_quality_product` VALUES ('190', '50', '69', '0', '0', '1584078586', null, '', '1584078592', '电动车电池', '0', '3393', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cy_quality_product` VALUES ('191', '116', '69', '0', '0', '1584079561', null, '', '1584079565', '电动车电池', '0', '3394', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cy_quality_product` VALUES ('192', '116', '69', '0', '0', '1584082111', null, '', '1584082117', '电动车电池', '0', '3397', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cy_quality_product` VALUES ('193', '65', '69', '0', '0', '1584086354', null, '', '1584086359', '电动车电池', '0', '3404', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cy_quality_product` VALUES ('194', '65', '70', '0', '0', '1584086378', null, '', '1584086386', '电动车', '0', '3405', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cy_quality_product` VALUES ('195', '65', '69', '0', '0', '1584086412', null, '', '1584086416', '电动车电池', '0', '3406', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cy_quality_product` VALUES ('196', '69', '69', '0', '0', '1584087928', null, '', '1584087933', '电动车电池', '0', '3408', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cy_quality_product` VALUES ('197', '67', '69', '0', '0', '1584088009', null, '', '1584088016', '电动车电池', '0', '3409', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cy_quality_product` VALUES ('198', '116', '69', '0', '0', '1584089261', null, '', '1584089266', '电动车电池', '0', '3412', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cy_quality_product` VALUES ('199', '65', '69', '0', '0', '1584089296', null, '', '1584089301', '电动车电池', '0', '3413', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cy_quality_product` VALUES ('200', '59', '69', '0', '0', '1584089331', null, '', '1584089338', '电动车电池', '0', '3414', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cy_quality_product` VALUES ('201', '69', '69', '0', '0', '1584089386', null, '', '1584089391', '电动车电池', '0', '3415', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cy_quality_product` VALUES ('202', '116', '69', '0', '0', '1584090223', null, '', '1584090227', '电动车电池', '0', '3416', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cy_quality_product` VALUES ('203', '65', '69', '0', '0', '1584090308', null, '', '1584090313', '电动车电池', '0', '3417', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cy_quality_product` VALUES ('204', '59', '69', '0', '0', '1584090314', null, '', '1584090321', '电动车电池', '0', '3418', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cy_quality_product` VALUES ('205', '116', '69', '0', '0', '1584091929', null, '', '1584091933', '电动车电池', '0', '3420', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cy_quality_product` VALUES ('206', '65', '69', '0', '0', '1584091969', null, '', '1584091975', '电动车电池', '0', '3421', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cy_quality_product` VALUES ('207', '59', '69', '0', '0', '1584091983', null, '', '1584091989', '电动车电池', '0', '3422', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cy_quality_product` VALUES ('208', '65', '69', '0', '0', '1584092813', null, '', '1584092819', '电动车电池', '0', '3424', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cy_quality_product` VALUES ('209', '69', '69', '0', '0', '1584093010', null, '', '1584093014', '电动车电池', '0', '3425', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cy_quality_product` VALUES ('210', '67', '69', '0', '0', '1584093039', null, '', '1584093044', '电动车电池', '0', '3426', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cy_quality_product` VALUES ('211', '65', '69', '0', '0', '1584106485', null, '', '1584106490', '电动车电池', '0', '3430', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cy_quality_product` VALUES ('212', '116', '69', '0', '0', '1584109953', null, '', '1584109958', '电动车电池', '0', '3435', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cy_quality_product` VALUES ('213', '116', '69', '0', '0', '1584115349', null, '', '1584115354', '电动车电池', '0', '3439', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cy_quality_product` VALUES ('214', '116', '69', '0', '0', '1584161470', null, '', '1584161474', '电动车电池', '0', '3440', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cy_quality_product` VALUES ('215', '65', '69', '0', '0', '1584161526', null, '', '1584161530', '电动车电池', '0', '3441', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cy_quality_product` VALUES ('216', '59', '69', '0', '0', '1584161594', null, '', '1584161601', '电动车电池', '0', '3442', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cy_quality_product` VALUES ('217', '116', '69', '0', '0', '1584162142', null, '', '1584162146', '电动车电池', '0', '3443', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cy_quality_product` VALUES ('218', '59', '69', '0', '0', '1584162261', null, '', '1584162322', '电动车电池', '0', '3444', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cy_quality_product` VALUES ('219', '116', '69', '0', '0', '1584172523', null, '', '1584172528', '电动车电池', '0', '3446', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cy_quality_product` VALUES ('220', '59', '69', '0', '0', '1584172575', null, '', '1584172587', '电动车电池', '0', '3447', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cy_quality_product` VALUES ('221', '65', '69', '0', '0', '1584172586', null, '', '1584172590', '电动车电池', '0', '3448', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cy_quality_product` VALUES ('222', '59', '69', '0', '0', '1584172643', null, '', '1584172652', '电动车电池', '0', '3449', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `cy_quality_product` VALUES ('223', '65', '69', '0', '0', '1584173350', null, '', '1584173355', '电动车电池', '0', '3450', null, null, null, null, null, null, null, null, null, null, null);

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
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='维修师体现记录';

-- ----------------------------
-- Records of cy_repair_return
-- ----------------------------
INSERT INTO `cy_repair_return` VALUES ('12', '50', '1.00', '0', '1583462261', null, '1', null);

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
) ENGINE=MyISAM AUTO_INCREMENT=88 DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='角色权限表';

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
INSERT INTO `cy_role_catalog` VALUES ('78', '1', '51', '1582617796');
INSERT INTO `cy_role_catalog` VALUES ('79', '1', '52', '1582686647');
INSERT INTO `cy_role_catalog` VALUES ('80', '1', '53', '1582795062');
INSERT INTO `cy_role_catalog` VALUES ('81', '1', '54', '1582855080');
INSERT INTO `cy_role_catalog` VALUES ('82', '1', '55', '1583153962');
INSERT INTO `cy_role_catalog` VALUES ('83', '1', '56', '1583373430');
INSERT INTO `cy_role_catalog` VALUES ('84', '1', '57', '1583376056');
INSERT INTO `cy_role_catalog` VALUES ('85', '1', '58', '1583566454');
INSERT INTO `cy_role_catalog` VALUES ('86', '1', '59', '1583570994');
INSERT INTO `cy_role_catalog` VALUES ('87', '1', '60', '1583658571');

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
  `rank` int(4) DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='筛选内容';

-- ----------------------------
-- Records of cy_search
-- ----------------------------
INSERT INTO `cy_search` VALUES ('12', '1', '36V', '1583481580', '电压', '0');
INSERT INTO `cy_search` VALUES ('13', '1', '48V', '1583481597', '电压', '0');
INSERT INTO `cy_search` VALUES ('14', '1', '60V', '1583481615', '电压', '0');
INSERT INTO `cy_search` VALUES ('15', '1', '72V', '1583481631', '电压', '0');
INSERT INTO `cy_search` VALUES ('16', '2', '10', '1583481656', '续航里程', '0');
INSERT INTO `cy_search` VALUES ('17', '2', '20', '1583481667', '续航里程', '0');
INSERT INTO `cy_search` VALUES ('18', '2', '30', '1583481677', '续航里程', '0');
INSERT INTO `cy_search` VALUES ('19', '2', '40', '1583481688', '续航里程', '0');
INSERT INTO `cy_search` VALUES ('20', '3', '小刀', '1583481705', '品牌', '0');
INSERT INTO `cy_search` VALUES ('21', '3', '新日', '1583481722', '品牌', '0');
INSERT INTO `cy_search` VALUES ('22', '3', '雅迪', '1583481735', '品牌', '0');
INSERT INTO `cy_search` VALUES ('23', '3', '爱玛', '1583481751', '品牌', '0');
INSERT INTO `cy_search` VALUES ('24', '1', '96V', '1583663378', '电压', '0');
INSERT INTO `cy_search` VALUES ('1', '1', '全部', '1583736459', '电压', '99');
INSERT INTO `cy_search` VALUES ('2', '2', '全部', '1583736480', '续航里程', '99');
INSERT INTO `cy_search` VALUES ('3', '3', '全部', '1583736490', '品牌', '99');
INSERT INTO `cy_search` VALUES ('28', '2', '60公里', '1584090957', '续航里程', null);

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
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='商家店铺';

-- ----------------------------
-- Records of cy_shop
-- ----------------------------
INSERT INTO `cy_shop` VALUES ('10', '雅迪(人民南路辅路店)', '15984817250', '', 'https://lck.hzlyzhenzhi.com', '', '四川省南充市顺庆区人民南路267号附近', '雅迪电动车是雅迪科技集团有限公司旗下电动车品牌。 [1]  连续六年入选中国轻工业百强企业（荣膺中国轻工业电动自行车行业十强企业第一名）；连续十二年高端销量领先 [2]  ；荣获中国行业企业信息中心官方颁发“2012年度电动车销售量、销售额、市场占有率的三项第一”；是行业唯一一家产品覆盖5大洲，畅销77 [3]  个国家的品牌。', '1', '1579590019', 'https://lck.hzlyzhenzhi.com/files/attach/images/20200121/1579589977137770.png', null, '四川', '南充', '顺庆', '999999', null);
INSERT INTO `cy_shop` VALUES ('20', '测试', '18882337880', '08:00-21.00', 'https://lck.hzlyzhenzhi.com', '', '星汉北路', '0001', '1', '1583141510', 'https://lck.hzlyzhenzhi.com/files/attach/images/20200128/1580188397601067.jpg', null, '四川省', '成都市', '金牛区', '999999', null);
INSERT INTO `cy_shop` VALUES ('13', '小刀电动车专卖店（振宇车行））', '13262862846', '7：00-6：00', 'https://lck.hzlyzhenzhi.com/files/attach/file/20200128/1580198114140468.mp4', '', '江苏省泰州市兴化市张郭镇西戚村小刀电动车专卖店（振宇车行）', '小刀电动车专卖仁马电动车售后服务部', '1', '1580198151', 'https://lck.hzlyzhenzhi.com/files/attach/images/20200128/1580186505528817.jpg', null, '江苏省', '泰州市兴化市', '张郭镇西戚村', '999999', null);
INSERT INTO `cy_shop` VALUES ('19', '好迪高新店', '18383394572', '', 'https://lck.hzlyzhenzhi.com', '', '天府三街吉泰路', '每一辆绿源电动车均采用先进工艺精心雕琢细节', '1', '1583067454', 'https://lck.hzlyzhenzhi.com/files/attach/images/20200301/1583067419749914.jpg', null, '四川省', '成都市', '高新区', '999999', null);
INSERT INTO `cy_shop` VALUES ('15', 'Just 的店铺', '18912640640', '08:00-24:00', 'https://lck.hzlyzhenzhi.com', '', '人名路100号', '超级好的店铺', '1', '1580890914', 'https://lck.hzlyzhenzhi.com/files/attach/images/20200121/1579589977137770.png', null, '四川省', '南充市', '顺庆区', '999999', null);
INSERT INTO `cy_shop` VALUES ('16', '小刀电动车专卖店', '132628628646', '08:00-24:00', 'https://lck.hzlyzhenzhi.com/files/attach/file/20200206/1580959096264860.mp4', '', '江苏省兴化市张郭镇西戚村小刀电动车专卖店(振宇车行）', '132154686', '1', '1580959147', 'https://lck.hzlyzhenzhi.com/files/attach/images/20200206/1580959087669187.jpg', null, '江苏省', '兴化市', '张郭镇', '999999', null);
INSERT INTO `cy_shop` VALUES ('17', '江苏省苏州市姑苏区店铺', '18912640640', '08:00-24:00', 'https://lck.hzlyzhenzhi.com', '', '猜想二村48幢', '苏州市姑苏区二手车店铺', '1', '1580965638', 'https://lck.hzlyzhenzhi.com/files/attach/images/20200121/1579589977137770.png', null, '江苏省', '苏州市', '姑苏区', '999999', null);
INSERT INTO `cy_shop` VALUES ('18', '小刀电动车专卖店', '13262862846', '', 'https://lck.hzlyzhenzhi.com/files/attach/file/20200103/1578030378917050.gif', '', '江苏省泰州市兴化市张郭镇西戚村小刀电动车专卖店（振宇车行）', '专业', '1', '1582722045', 'https://lck.hzlyzhenzhi.com/files/attach/images/20200128/1580188851192524.jpg', null, '江苏省', '泰州市兴化市', '江苏省泰州市兴化市张郭镇西戚村', '999999', null);
INSERT INTO `cy_shop` VALUES ('22', '小刀电动车专卖店', '13262862846', '07:00-19:30', 'https://lck.hzlyzhenzhi.com', '', '张郭镇西戚村小刀电动车专卖店（振宇车行）', '国民好车，小刀电动车，没电也能跑的电动车', '1', '1583150328', 'https://lck.hzlyzhenzhi.com/files/attach/images/20200128/1580186505528817.jpg', null, '江苏省', '泰州市', '兴化市', '999999', null);
INSERT INTO `cy_shop` VALUES ('23', '电动车店铺', '15828043607', '08::00-20:00', 'https://lck.hzlyzhenzhi.com', '', '桂溪街道100号', '电动车店铺', '1', '1583224894', 'https://lck.hzlyzhenzhi.com/files/attach/images/20200128/1580188397113608.jpg', null, '四川省', '成都市', '武侯区', '999999', null);
INSERT INTO `cy_shop` VALUES ('24', '二手车维修', '15828043607', '08:00-20:00', 'https://lck.hzlyzhenzhi.com', '', '香年广场1栋', '二手车维修', '1', '1583224973', 'https://lck.hzlyzhenzhi.com/files/attach/images/20200301/1583067419749914.jpg', null, '四川省', '成都市', '武侯区', '999999', null);

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
) ENGINE=MyISAM AUTO_INCREMENT=160 DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='用户购物车';

-- ----------------------------
-- Records of cy_shop_cart
-- ----------------------------
INSERT INTO `cy_shop_cart` VALUES ('152', '62', '43', '1580894586', '1', '40');
INSERT INTO `cy_shop_cart` VALUES ('146', '51', '41', '1580738381', '30', '0');
INSERT INTO `cy_shop_cart` VALUES ('148', '51', '35', '1580822141', '1', '43');
INSERT INTO `cy_shop_cart` VALUES ('149', '62', '33', '1580822617', '1', '29');
INSERT INTO `cy_shop_cart` VALUES ('150', '62', '34', '1580822624', '1', '28');
INSERT INTO `cy_shop_cart` VALUES ('151', '62', '35', '1580822631', '1', '43');

-- ----------------------------
-- Table structure for cy_shop_message
-- ----------------------------
DROP TABLE IF EXISTS `cy_shop_message`;
CREATE TABLE `cy_shop_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text COMMENT '内容',
  `type` int(3) DEFAULT '0' COMMENT '1-关于我们  2-客服联系 3-会员充值说明 4-积分规则 5-会员优惠说明 11-地区设置 12-刷新金额 13-购物车背景图 14-积分明细背景图 15-邀请朋友圈背景图 16-邀请有奖背景图 17-维修师背景图 18-活动规则',
  `createTime` int(11) DEFAULT NULL COMMENT '时间',
  `image` varchar(255) DEFAULT NULL COMMENT '图片',
  `phone` varchar(40) DEFAULT NULL COMMENT '联系电话',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='商城信息';

-- ----------------------------
-- Records of cy_shop_message
-- ----------------------------
INSERT INTO `cy_shop_message` VALUES ('6', '24小时不间断提供有关业务咨询、业务受理和投诉建议等专业服务。', '2', '1583915587', 'https://lck.hzlyzhenzhi.com/files/attach/images/20200120/1579502678122365.jpg', '13262862846');
INSERT INTO `cy_shop_message` VALUES ('7', '会员消费返积分，每消费一元返一个积分，不足一元的部分则不返现积分，积分可当现金使用，积分可和所有优惠活动一起使用，100积分等于1元', '4', '1583901055', 'https://lck.hzlyzhenzhi.com/files/attach/images/20200128/1580187129768805.jpg', null);
INSERT INTO `cy_shop_message` VALUES ('8', '仁马是一家新零售，新服务网络公司', '1', '1583900866', null, '13262862846');
INSERT INTO `cy_shop_message` VALUES ('9', '充值页面', '3', '1580639731', null, null);
INSERT INTO `cy_shop_message` VALUES ('10', '花费0.03元/天，每年预计可省1000元', '5', '1583324518', null, null);
INSERT INTO `cy_shop_message` VALUES ('11', '120.1355190000-32.7894920000-1000000', '11', '1584097045', null, null);
INSERT INTO `cy_shop_message` VALUES ('12', '0.01', '12', '1582686656', null, null);
INSERT INTO `cy_shop_message` VALUES ('14', '积分抵现', '14', '1583481322', 'https://lck.hzlyzhenzhi.com/files/attach/images/20200128/1580187129768805.jpg', null);
INSERT INTO `cy_shop_message` VALUES ('16', '邀请好友返积分', '16', '1583325609', 'https://lck.hzlyzhenzhi.com/files/attach/images/20200128/1580187129768805.jpg', null);
INSERT INTO `cy_shop_message` VALUES ('18', '邀请好友使用仁马软件，被邀请的好友将成为您的下线，您可获得下线一年的消费积分，积分可在平台直接当现金使用，如积分比较多使用不完，可联系客服到指定线下门店兑换现金', '18', '1583902970', null, null);
INSERT INTO `cy_shop_message` VALUES ('19', '购物车背景图片', '13', '1583149875', 'https://lck.hzlyzhenzhi.com/files/attach/images/20200128/1580188851192524.jpg', null);
INSERT INTO `cy_shop_message` VALUES ('20', '维修师', '17', '1582869585', 'https://lck.hzlyzhenzhi.com/files/attach/images/20200228/1582869572885120.png', null);
INSERT INTO `cy_shop_message` VALUES ('21', '邀请码背景图', '15', '1582870029', 'https://lck.hzlyzhenzhi.com/files/attach/images/20200228/1582870017119245.png', null);
INSERT INTO `cy_shop_message` VALUES ('23', '0', '20', '1583662833', null, null);
INSERT INTO `cy_shop_message` VALUES ('22', '13262862846', '19', '1583816711', null, '13262862846');

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
) ENGINE=MyISAM AUTO_INCREMENT=778 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户收货地址';

-- ----------------------------
-- Records of cy_user_address
-- ----------------------------
INSERT INTO `cy_user_address` VALUES ('397', '49', 'null', 'null', 'null', 'null', '0', '1580897031', 'null', 'null', '学校');
INSERT INTO `cy_user_address` VALUES ('263', 'null', 'null', 'null', 'null', 'null', '0', '1579492963', 'null', 'null', '学校');
INSERT INTO `cy_user_address` VALUES ('266', 'null', 'null', 'null', 'null', 'null', '0', '1579498605', 'null', 'null', '学校');
INSERT INTO `cy_user_address` VALUES ('368', '53', 'null', 'null', 'null', 'null', '0', '1580782766', 'null', 'null', '学校');
INSERT INTO `cy_user_address` VALUES ('269', 'null', 'null', 'null', 'null', 'null', '0', '1579499169', 'null', 'null', '学校');
INSERT INTO `cy_user_address` VALUES ('270', '50', '四川省', '成都市', '武侯区', '天府二街269号', '0', '1579501273', '杰', '18383397521', '');
INSERT INTO `cy_user_address` VALUES ('271', '51', '北京市', '北京市', '东城区', '124348', '0', '1579501336', '暴风科技', '13378942282', '');
INSERT INTO `cy_user_address` VALUES ('272', '50', '四川省', '成都市', '武侯区', '天府二街269号', '0', '1579502837', '杰', '18383397526', '');
INSERT INTO `cy_user_address` VALUES ('273', '51', '四川省', '成都市', '武侯区', '武侯祠大街264号', '0', '1579503279', '杰', '18383397543', '');
INSERT INTO `cy_user_address` VALUES ('313', '56', 'null', 'null', 'null', 'null', '0', '1579777868', 'null', 'null', '学校');
INSERT INTO `cy_user_address` VALUES ('276', 'null', 'null', 'null', 'null', 'null', '0', '1579505750', 'null', 'null', '学校');
INSERT INTO `cy_user_address` VALUES ('374', '57', 'null', 'null', 'null', 'null', '0', '1580820549', 'null', 'null', '学校');
INSERT INTO `cy_user_address` VALUES ('279', 'null', 'null', 'null', 'null', 'null', '0', '1579509314', 'null', 'null', '学校');
INSERT INTO `cy_user_address` VALUES ('280', '59', '四川省', '成都市', '金牛区', '金府国际(成都市金牛区金府路777号)', '0', '1579521864', '。', '18618404746', '');
INSERT INTO `cy_user_address` VALUES ('281', '50', '四川省', '成都市', '武侯区', '九金街86号', '0', '1579522411', '杰', '18383397523', '');
INSERT INTO `cy_user_address` VALUES ('282', '60', '四川省', '南充市', '顺庆区', '人民南路(南充市顺庆区)', '0', '1579522736', '.蒲', '17746733507', '');
INSERT INTO `cy_user_address` VALUES ('283', '61', '四川省', '宜宾市', '长宁县', '308省道(旧)', '1', '1579523258', '曾杰', '13540894123', '');
INSERT INTO `cy_user_address` VALUES ('284', '62', '江苏省', '苏州市', '姑苏区', '干将西路', '0', '1579524097', '1835824236', '吴某人', '');
INSERT INTO `cy_user_address` VALUES ('285', '63', '江西省', '赣州市', '于都县', ' 龙景嘉园', '1', '1579524134', '杨女士', '13207970554', '');
INSERT INTO `cy_user_address` VALUES ('286', '62', '江苏省', '苏州市', '姑苏区', '干将西路', '0', '1579524274', '吴某', '1865362255', '');
INSERT INTO `cy_user_address` VALUES ('287', '62', '江苏省', '苏州市', '姑苏区', '干将西路', '0', '1579524805', '吴亚丁', '18912640643', '');
INSERT INTO `cy_user_address` VALUES ('288', '55', '四川省', '成都市', '锦江区', '锦江区水碾河路6号33栋', '0', '1579578006', '余超', '15828043607', '');
INSERT INTO `cy_user_address` VALUES ('291', 'null', 'null', 'null', 'null', 'null', '0', '1579589527', 'null', 'null', '学校');
INSERT INTO `cy_user_address` VALUES ('294', 'null', 'null', 'null', 'null', 'null', '0', '1579589666', 'null', 'null', '学校');
INSERT INTO `cy_user_address` VALUES ('296', '58', 'null', 'null', 'null', 'null', '0', '1579589955', 'null', 'null', '学校');
INSERT INTO `cy_user_address` VALUES ('297', 'null', 'null', 'null', 'null', 'null', '0', '1579589967', 'null', 'null', '学校');
INSERT INTO `cy_user_address` VALUES ('300', 'null', 'null', 'null', 'null', 'null', '0', '1579592361', 'null', 'null', '学校');
INSERT INTO `cy_user_address` VALUES ('301', '51', '北京市', '北京市', '东城区', '124348', '0', '1579593829', '暴风科技', '13378942282', '');
INSERT INTO `cy_user_address` VALUES ('302', '59', '四川省', '成都市', '金牛区', '金府国际(成都市金牛区金府路777号)', '0', '1579593903', '。', '18618404746', '');
INSERT INTO `cy_user_address` VALUES ('303', '50', '四川省', '成都市', '武侯区', '吉泰路', '0', '1579593945', '杰', '18383397523', '');
INSERT INTO `cy_user_address` VALUES ('304', '60', '四川省', '南充市', '顺庆区', '人民南路(南充市顺庆区)', '0', '1579594151', '.蒲', '17746733507', '');
INSERT INTO `cy_user_address` VALUES ('305', '51', '北京市', '北京市', '东城区', '124348', '0', '1579595076', '暴风科技', '13378942282', '');
INSERT INTO `cy_user_address` VALUES ('306', '51', '北京市', '北京市', '东城区', '124348', '0', '1579595115', '暴风科技', '13378942282', '');
INSERT INTO `cy_user_address` VALUES ('307', '51', '江苏省', '苏州市', '相城区', '阳澄湖东路8号', '0', '1579669560', '吴某某', '18912645465', '');
INSERT INTO `cy_user_address` VALUES ('308', '51', '江苏省', '苏州市', '姑苏区', '十梓街338号', '0', '1579705179', '吴某某', '18912640645', '');
INSERT INTO `cy_user_address` VALUES ('309', '62', '江苏省', '苏州市', '姑苏区', '干将西路', '0', '1579705376', '吴某人', '18912640642', '');
INSERT INTO `cy_user_address` VALUES ('310', '62', '江苏省', '苏州市', '相城区', '澄和路1218号', '0', '1579755841', '吴某', '18912640658', '');
INSERT INTO `cy_user_address` VALUES ('311', '51', '江苏省', '苏州市', '相城区', '阳澄湖东路8号', '0', '1579772532', '1', '1', '');
INSERT INTO `cy_user_address` VALUES ('314', 'null', 'null', 'null', 'null', 'null', '0', '1579777880', 'null', 'null', '学校');
INSERT INTO `cy_user_address` VALUES ('315', '51', '北京市', '北京市', '东城区', '124348', '0', '1579778425', '暴风科技', '13378942282', '');
INSERT INTO `cy_user_address` VALUES ('316', '59', '四川省', '成都市', '金牛区', '金府国际(成都市金牛区金府路777号)', '0', '1579779885', '。', '18618404746', '');
INSERT INTO `cy_user_address` VALUES ('317', '59', '四川省', '成都市', '金牛区', '金府国际(成都市金牛区金府路777号)', '0', '1579779889', '。', '18618404746', '');
INSERT INTO `cy_user_address` VALUES ('318', '51', '北京市', '北京市', '东城区', '124348', '0', '1579779948', '暴风科技', '13378942282', '');
INSERT INTO `cy_user_address` VALUES ('319', '62', '江苏省', '苏州市', '姑苏区', '干将西路1122号', '0', '1579780041', '预谋', '18912648555', '');
INSERT INTO `cy_user_address` VALUES ('320', '62', '江苏省', '苏州市', '姑苏区', '干将西路', '0', '1579782390', '预谋', '18912648666', '');
INSERT INTO `cy_user_address` VALUES ('321', '62', '江苏省', '苏州市', '姑苏区', '干将西路', '0', '1579782525', '预谋', '18912648666', '');
INSERT INTO `cy_user_address` VALUES ('322', '62', '江苏省', '苏州市', '姑苏区', '干将西路', '0', '1579782792', '预谋', '18912648666', '');
INSERT INTO `cy_user_address` VALUES ('323', '60', '四川省', '南充市', '顺庆区', '人民南路(南充市顺庆区)', '0', '1579783499', '.蒲', '17746733507', '');
INSERT INTO `cy_user_address` VALUES ('324', '60', '四川省', '南充市', '顺庆区', '人民南路(南充市顺庆区)', '0', '1579783501', '.蒲', '17746733507', '');
INSERT INTO `cy_user_address` VALUES ('325', '60', '四川省', '南充市', '顺庆区', '人民南路(南充市顺庆区)', '0', '1579783503', '.蒲', '17746733507', '');
INSERT INTO `cy_user_address` VALUES ('326', '51', '北京市', '北京市', '东城区', '124348', '0', '1579783537', '暴风科技', '13378942282', '');
INSERT INTO `cy_user_address` VALUES ('327', '60', '四川省', '南充市', '顺庆区', '人民南路(南充市顺庆区)', '0', '1579783579', '.蒲', '17746733507', '');
INSERT INTO `cy_user_address` VALUES ('328', '59', '四川省', '成都市', '金牛区', '金府国际(成都市金牛区金府路777号)', '0', '1579783660', '。', '18618404746', '');
INSERT INTO `cy_user_address` VALUES ('329', '59', '四川省', '成都市', '金牛区', '金府国际(成都市金牛区金府路777号)', '0', '1579783662', '。', '18618404746', '');
INSERT INTO `cy_user_address` VALUES ('330', '59', '四川省', '成都市', '金牛区', '金府国际(成都市金牛区金府路777号)', '0', '1579783720', '。', '18618404746', '');
INSERT INTO `cy_user_address` VALUES ('331', '59', '四川省', '成都市', '金牛区', '金府国际(成都市金牛区金府路777号)', '0', '1579783722', '。', '18618404746', '');
INSERT INTO `cy_user_address` VALUES ('332', '59', '四川省', '成都市', '金牛区', '金府国际(成都市金牛区金府路777号)', '0', '1579783725', '。', '18618404746', '');
INSERT INTO `cy_user_address` VALUES ('333', '59', '四川省', '成都市', '金牛区', '金府国际(成都市金牛区金府路777号)', '0', '1579783734', '。', '18618404746', '');
INSERT INTO `cy_user_address` VALUES ('334', '60', '四川省', '南充市', '顺庆区', '人民南路(南充市顺庆区)', '0', '1579783756', '.蒲', '17746733507', '');
INSERT INTO `cy_user_address` VALUES ('335', '60', '四川省', '南充市', '顺庆区', '人民南路(南充市顺庆区)', '0', '1579783757', '.蒲', '17746733507', '');
INSERT INTO `cy_user_address` VALUES ('336', '60', '四川省', '南充市', '顺庆区', '人民南路(南充市顺庆区)', '0', '1579783758', '.蒲', '17746733507', '');
INSERT INTO `cy_user_address` VALUES ('337', '60', '四川省', '南充市', '顺庆区', '人民南路(南充市顺庆区)', '0', '1579783758', '.蒲', '17746733507', '');
INSERT INTO `cy_user_address` VALUES ('338', '60', '四川省', '南充市', '顺庆区', '人民南路(南充市顺庆区)', '0', '1579783759', '.蒲', '17746733507', '');
INSERT INTO `cy_user_address` VALUES ('339', '60', '四川省', '南充市', '顺庆区', '人民南路(南充市顺庆区)', '0', '1579783760', '.蒲', '17746733507', '');
INSERT INTO `cy_user_address` VALUES ('340', '60', '四川省', '南充市', '顺庆区', '人民南路(南充市顺庆区)', '0', '1579783760', '.蒲', '17746733507', '');
INSERT INTO `cy_user_address` VALUES ('341', '60', '四川省', '南充市', '顺庆区', '人民南路(南充市顺庆区)', '0', '1579783760', '.蒲', '17746733507', '');
INSERT INTO `cy_user_address` VALUES ('342', '60', '四川省', '南充市', '顺庆区', '人民南路(南充市顺庆区)', '0', '1579783762', '.蒲', '17746733507', '');
INSERT INTO `cy_user_address` VALUES ('343', '62', '江苏省', '苏州市', '姑苏区', '干将西路', '0', '1579783786', '语音', '18912635225', '');
INSERT INTO `cy_user_address` VALUES ('344', '59', '四川省', '成都市', '金牛区', '金府国际(成都市金牛区金府路777号)', '0', '1579783793', '。', '18618404746', '');
INSERT INTO `cy_user_address` VALUES ('345', '59', '四川省', '成都市', '金牛区', '金府国际(成都市金牛区金府路777号)', '0', '1579783796', '。', '18618404746', '');
INSERT INTO `cy_user_address` VALUES ('346', '59', '四川省', '成都市', '金牛区', '金府国际(成都市金牛区金府路777号)', '0', '1579783798', '。', '18618404746', '');
INSERT INTO `cy_user_address` VALUES ('347', '59', '四川省', '成都市', '金牛区', '金府国际(成都市金牛区金府路777号)', '0', '1579783801', '。', '18618404746', '');
INSERT INTO `cy_user_address` VALUES ('348', '62', '江苏省', '苏州市', '姑苏区', '干将西路', '0', '1579785702', '许墨', '18916265856', '');
INSERT INTO `cy_user_address` VALUES ('351', 'null', 'null', 'null', 'null', 'null', '0', '1579834438', 'null', 'null', '学校');
INSERT INTO `cy_user_address` VALUES ('352', '65', '江苏省', '泰州市', '兴化市', '江苏省泰州市兴化市张郭镇唐刘乡西戚村小刀电动车', '0', '1580185892', '曹振', '13262862846', '');
INSERT INTO `cy_user_address` VALUES ('353', '65', '江苏省', '泰州市', '兴化市', '江苏省泰州市兴化市张郭镇唐刘乡西戚村小刀电动车', '0', '1580192886', '曹振', '13262862846', '');
INSERT INTO `cy_user_address` VALUES ('354', '65', '江苏省', '泰州市', '兴化市', '江苏省泰州市兴化市张郭镇唐刘乡西戚村小刀电动车', '0', '1580193242', '曹振', '13262862846', '');
INSERT INTO `cy_user_address` VALUES ('355', '65', '江苏省', '泰州市', '兴化市', '江苏省泰州市兴化市张郭镇唐刘乡西戚村小刀电动车', '0', '1580193341', '曹振', '13262862846', '');
INSERT INTO `cy_user_address` VALUES ('356', '65', '江苏省', '泰州市', '兴化市', '江苏省泰州市兴化市张郭镇唐刘乡西戚村小刀电动车', '0', '1580193900', '曹振', '13262862846', '');
INSERT INTO `cy_user_address` VALUES ('357', '65', '江苏省', '泰州市', '兴化市', '江苏省泰州市兴化市张郭镇唐刘乡西戚村小刀电动车', '0', '1580195943', '曹振', '13262862846', '');
INSERT INTO `cy_user_address` VALUES ('358', '65', '江苏省', '泰州市', '兴化市', '江苏省泰州市兴化市张郭镇唐刘乡西戚村小刀电动车', '0', '1580195949', '曹振', '13262862846', '');
INSERT INTO `cy_user_address` VALUES ('359', '65', '江苏省', '泰州市', '兴化市', '江苏省泰州市兴化市张郭镇唐刘乡西戚村小刀电动车', '0', '1580565373', '曹振', '13262862846', '');
INSERT INTO `cy_user_address` VALUES ('360', '65', '江苏省', '泰州市', '兴化市', '江苏省泰州市兴化市张郭镇唐刘乡西戚村小刀电动车', '0', '1580609775', '曹振', '13262862846', '');
INSERT INTO `cy_user_address` VALUES ('363', '52', 'null', 'null', 'FoQxJPue', 'JpJ0teiq', '0', '1580644325', 'gtpaXrbT', 'y8roJ2lT', '学校');
INSERT INTO `cy_user_address` VALUES ('364', 'null', 'null', 'null', 'FoQxJPue', 'JpJ0teiq', '0', '1580644337', '0SGHU1ik', '8J6qsABy', '学校');
INSERT INTO `cy_user_address` VALUES ('365', '65', '江苏省', '泰州市', '兴化市', '江苏省泰州市兴化市张郭镇唐刘乡西戚村小刀电动车', '0', '1580687938', '曹振', '13262862846', '');
INSERT INTO `cy_user_address` VALUES ('366', '65', '江苏省', '泰州市', '兴化市', '江苏省泰州市兴化市张郭镇唐刘乡西戚村小刀电动车', '0', '1580773059', '曹振', '13262862846', '');
INSERT INTO `cy_user_address` VALUES ('369', 'null', 'null', 'null', 'null', 'null', '0', '1580782778', 'null', 'null', '学校');
INSERT INTO `cy_user_address` VALUES ('370', '62', '江苏省', '苏州市', '姑苏区', '干将西路', '0', '1580808761', '测试导航', '18912640643', '');
INSERT INTO `cy_user_address` VALUES ('371', '51', '江苏省', '苏州市', '姑苏区', '十梓街338号', '0', '1580810775', '测试测试', '18912640643', '');
INSERT INTO `cy_user_address` VALUES ('372', '51', '江苏省', '苏州市', '姑苏区', '十梓街338号', '0', '1580811587', '测试name', '18912640643', '');
INSERT INTO `cy_user_address` VALUES ('375', 'null', 'null', 'null', 'null', 'null', '0', '1580820561', 'null', 'null', '学校');
INSERT INTO `cy_user_address` VALUES ('376', '51', '北京市', '北京市', '东城区', '124348', '0', '1580821414', '暴风科技', '13378942282', '');
INSERT INTO `cy_user_address` VALUES ('377', '51', '江苏省', '苏州市', '姑苏区', '十梓街338号', '0', '1580826894', '吴某某', '18912640643', '');
INSERT INTO `cy_user_address` VALUES ('378', '51', '江苏省', '苏州市', '姑苏区', '十梓街338号', '0', '1580827325', '嗯嗯嗯', '18912640643', '');
INSERT INTO `cy_user_address` VALUES ('379', '51', '江苏省', '苏州市', '姑苏区', '十梓街338号', '0', '1580827532', '发发发', '18912640643', '');
INSERT INTO `cy_user_address` VALUES ('380', '65', '江苏省', '泰州市', '兴化市', '江苏省泰州市兴化市张郭镇唐刘乡西戚村小刀电动车', '0', '1580864337', '曹振', '13262862846', '');
INSERT INTO `cy_user_address` VALUES ('381', '65', '江苏省', '泰州市', '兴化市', '江苏省泰州市兴化市张郭镇唐刘乡西戚村小刀电动车', '0', '1580864341', '曹振', '13262862846', '');
INSERT INTO `cy_user_address` VALUES ('382', '65', '江苏省', '泰州市', '兴化市', '江苏省泰州市兴化市张郭镇唐刘乡西戚村小刀电动车', '0', '1580864355', '曹振', '13262862846', '');
INSERT INTO `cy_user_address` VALUES ('383', '65', '江苏省', '泰州市', '兴化市', '江苏省泰州市兴化市张郭镇唐刘乡西戚村小刀电动车', '0', '1580864366', '曹振', '13262862846', '');
INSERT INTO `cy_user_address` VALUES ('384', '65', '江苏省', '泰州市', '兴化市', '江苏省泰州市兴化市张郭镇唐刘乡西戚村小刀电动车', '0', '1580864391', '曹振', '13262862846', '');
INSERT INTO `cy_user_address` VALUES ('385', '51', '江苏省', '苏州市', '姑苏区', '十梓街338号', '0', '1580876269', 'wu', '18912640643', '');
INSERT INTO `cy_user_address` VALUES ('386', '51', '江苏省', '苏州市', '姑苏区', '十梓街338号', '0', '1580882039', '吴某某', '18912640643', '');
INSERT INTO `cy_user_address` VALUES ('388', '71', 'null', 'null', 'null', 'null', '0', '1580889782', 'null', 'null', '学校');
INSERT INTO `cy_user_address` VALUES ('389', 'null', 'null', 'null', 'null', 'null', '0', '1580889794', 'null', 'null', '学校');
INSERT INTO `cy_user_address` VALUES ('390', '51', '北京市', '北京市', '东城区', '124348', '0', '1580891690', '暴风科技', '13378942282', '');
INSERT INTO `cy_user_address` VALUES ('391', '51', '江苏省', '苏州市', '姑苏区', '十梓街338号', '0', '1580895325', '吴某', '18912640643', '');
INSERT INTO `cy_user_address` VALUES ('392', '51', '江苏省', '苏州市', '姑苏区', '十梓街338号', '0', '1580895748', 'www', '18912640643', '');
INSERT INTO `cy_user_address` VALUES ('393', '51', '江苏省', '苏州市', '姑苏区', '十梓街338号', '0', '1580895875', '吴某', '18912640643', '');
INSERT INTO `cy_user_address` VALUES ('394', '51', '江苏省', '苏州市', '姑苏区', '十梓街338号', '0', '1580896038', '吴某', '18912640643', '');
INSERT INTO `cy_user_address` VALUES ('395', '62', '江苏省', '苏州市', '姑苏区', '干将西路', '0', '1580896179', '呜哇哇', '18912648643', '');
INSERT INTO `cy_user_address` VALUES ('398', 'null', 'null', 'null', 'null', 'null', '0', '1580897043', 'null', 'null', '学校');
INSERT INTO `cy_user_address` VALUES ('399', '51', '北京市', '北京市', '东城区', '124348', '0', '1580898295', '暴风科技', '13378942282', '');
INSERT INTO `cy_user_address` VALUES ('400', '69', '江苏省', '泰州市', '兴化市', '西戚村(泰州市兴化市)', '0', '1580956311', '倩倩', '13651622883', '');
INSERT INTO `cy_user_address` VALUES ('401', '65', '江苏省', '泰州市', '兴化市', '江苏省泰州市兴化市张郭镇唐刘乡西戚村小刀电动车', '0', '1580959568', '曹振', '13262862846', '');
INSERT INTO `cy_user_address` VALUES ('402', '69', '江苏省', '泰州市', '兴化市', '西戚村(泰州市兴化市)', '0', '1580959673', '倩倩', '13651622883', '');
INSERT INTO `cy_user_address` VALUES ('403', '67', '江苏省', '泰州市', '兴化市', '西戚村(泰州市兴化市)公路边修车子的', '0', '1580959870', '曹井之', '18914519681', '');
INSERT INTO `cy_user_address` VALUES ('404', '65', '江苏省', '泰州市', '兴化市', '村道N08喻垛村(泰州市兴化市)', '0', '1580960614', '曹振', '13262862846', '');
INSERT INTO `cy_user_address` VALUES ('405', '65', '江苏省', '泰州市', '兴化市', '203县道华庄村(泰州市兴化市)', '0', '1580960839', '曹振', '13262862846', '');
INSERT INTO `cy_user_address` VALUES ('406', '65', '江苏省', '泰州市', '兴化市', '朱家村(泰州市兴化市)j', '0', '1580961158', '曹振', '13262862846', '');
INSERT INTO `cy_user_address` VALUES ('407', '65', '江苏省', '泰州市', '兴化市', '西戚村(泰州市兴化市)民安幸福巷', '0', '1580961419', '曹振', '13262862846', '');
INSERT INTO `cy_user_address` VALUES ('408', '65', '江苏省', '泰州市', '兴化市', '村道N08喻垛村(泰州市兴化市)', '0', '1580963847', '曹振', '13262862846', '');
INSERT INTO `cy_user_address` VALUES ('409', '65', '江苏省', '泰州市', '兴化市', '西戚村(泰州市兴化市)h', '0', '1580964393', '曹振', '13262862846', '');
INSERT INTO `cy_user_address` VALUES ('410', '65', '江苏省', '泰州市', '兴化市', '西戚村(泰州市兴化市)h', '0', '1580964393', '曹振', '13262862846', '');
INSERT INTO `cy_user_address` VALUES ('411', '62', '江苏省', '苏州市', '姑苏区', '干将西路', '0', '1580965751', '预谋', '18912640642', '');
INSERT INTO `cy_user_address` VALUES ('416', '54', 'null', 'null', 'null', 'null', '0', '1580981450', 'null', 'null', '学校');
INSERT INTO `cy_user_address` VALUES ('414', 'null', 'null', 'null', 'null', 'null', '0', '1580966154', 'null', 'null', '学校');
INSERT INTO `cy_user_address` VALUES ('417', 'null', 'null', 'null', 'null', 'null', '0', '1580981462', 'null', 'null', '学校');
INSERT INTO `cy_user_address` VALUES ('418', '51', '四川省', '南充市', '顺庆区', '玉带中路三段', '0', '1580996105', '110', '110', '');
INSERT INTO `cy_user_address` VALUES ('419', '65', '江苏省', '泰州市', '兴化市', '西戚村小刀电动车专卖店(振宇车行)', '0', '1581042687', '曹振', '13262862846', '');
INSERT INTO `cy_user_address` VALUES ('420', '51', '四川省', '南充市', '顺庆区', '玉带中路三段', '0', '1581075294', '110', '110', '');
INSERT INTO `cy_user_address` VALUES ('421', '65', '江苏省', '泰州市', '兴化市', '西戚村小刀电动车专卖店(振宇车行)', '0', '1581122965', '曹振', '13262862846', '');
INSERT INTO `cy_user_address` VALUES ('422', '65', '江苏省', '泰州市', '兴化市', '西戚村小刀电动车专卖店(振宇车行)', '0', '1581213137', '曹振', '13262862846', '');
INSERT INTO `cy_user_address` VALUES ('423', '65', '江苏省', '泰州市', '兴化市', '西戚村小刀电动车专卖店(振宇车行)', '0', '1581298725', '曹振', '13262862846', '');
INSERT INTO `cy_user_address` VALUES ('424', '65', '江苏省', '泰州市', '兴化市', '西戚村小刀电动车专卖店(振宇车行)', '0', '1581379659', '曹振', '13262862846', '');
INSERT INTO `cy_user_address` VALUES ('425', '65', '江苏省', '泰州市', '兴化市', '西戚村小刀电动车专卖店(振宇车行)', '0', '1581475429', '曹振', '13262862846', '');
INSERT INTO `cy_user_address` VALUES ('426', '65', '江苏省', '泰州市', '兴化市', '西戚村小刀电动车专卖店(振宇车行)', '0', '1581475462', '曹振', '13262862846', '');
INSERT INTO `cy_user_address` VALUES ('427', '51', '四川省', '南充市', '顺庆区', '玉带中路三段', '0', '1581489202', '11', '11', '');
INSERT INTO `cy_user_address` VALUES ('428', '59', '四川省', '成都市', '金牛区', '金府国际(成都市金牛区金府路777号)', '0', '1581524055', '。', '18618404746', '');
INSERT INTO `cy_user_address` VALUES ('429', '59', '四川省', '成都市', '金牛区', '金府国际(成都市金牛区金府路777号)', '0', '1581524522', '。', '18618404746', '');
INSERT INTO `cy_user_address` VALUES ('430', '59', '四川省', '成都市', '金牛区', '金府国际(成都市金牛区金府路777号)', '0', '1581524935', '。', '18618404746', '');
INSERT INTO `cy_user_address` VALUES ('431', '59', '四川省', '成都市', '金牛区', '金府国际(成都市金牛区金府路777号)', '0', '1581525445', '。', '18618404746', '');
INSERT INTO `cy_user_address` VALUES ('432', '60', '四川省', '南充市', '顺庆区', '人民南路(南充市顺庆区)', '1', '1581525541', '.蒲', '17746733507', '');
INSERT INTO `cy_user_address` VALUES ('433', '51', '四川省', '南充市', '顺庆区', '玉带中路三段', '0', '1581525555', '1', '41', '');
INSERT INTO `cy_user_address` VALUES ('434', '65', '江苏省', '泰州市', '兴化市', '西戚村小刀电动车专卖店(振宇车行)', '0', '1581525891', '曹振', '13262862846', '');
INSERT INTO `cy_user_address` VALUES ('435', '65', '江苏省', '泰州市', '兴化市', '西戚村小刀电动车专卖店(振宇车行)', '0', '1581525893', '曹振', '13262862846', '');
INSERT INTO `cy_user_address` VALUES ('436', '65', '江苏省', '泰州市', '兴化市', '西戚村小刀电动车专卖店(振宇车行)', '0', '1581525895', '曹振', '13262862846', '');
INSERT INTO `cy_user_address` VALUES ('437', '65', '江苏省', '泰州市', '兴化市', '西戚村小刀电动车专卖店(振宇车行)', '0', '1581525897', '曹振', '13262862846', '');
INSERT INTO `cy_user_address` VALUES ('438', '65', '江苏省', '泰州市', '兴化市', '西戚村小刀电动车专卖店(振宇车行)', '0', '1581525899', '曹振', '13262862846', '');
INSERT INTO `cy_user_address` VALUES ('439', '65', '江苏省', '泰州市', '兴化市', '西戚村小刀电动车专卖店(振宇车行)', '0', '1581525998', '曹振', '13262862846', '');
INSERT INTO `cy_user_address` VALUES ('440', '65', '江苏省', '泰州市', '兴化市', '西戚村小刀电动车专卖店(振宇车行)', '0', '1581526026', '曹振', '13262862846', '');
INSERT INTO `cy_user_address` VALUES ('441', '65', '江苏省', '泰州市', '兴化市', '西戚村小刀电动车专卖店(振宇车行)', '0', '1581526144', '曹振', '13262862846', '');
INSERT INTO `cy_user_address` VALUES ('442', '59', '四川省', '成都市', '金牛区', '金府国际(成都市金牛区金府路777号)', '0', '1581526171', '。', '18618404746', '');
INSERT INTO `cy_user_address` VALUES ('443', '69', '江苏省', '泰州市', '兴化市', '西戚村(泰州市兴化市)', '0', '1581526392', '倩倩', '13651622883', '');
INSERT INTO `cy_user_address` VALUES ('444', '65', '江苏省', '泰州市', '兴化市', '西戚村小刀电动车专卖店(振宇车行)', '0', '1581553009', '曹振', '13262862846', '');
INSERT INTO `cy_user_address` VALUES ('445', '51', '江苏省', '苏州市', '姑苏区', '馨泓路', '0', '1581615078', 'wy', '18912640545', '');
INSERT INTO `cy_user_address` VALUES ('446', '65', '江苏省', '泰州市', '兴化市', '西戚村小刀电动车专卖店(振宇车行)', '0', '1581641190', '曹振', '13262862846', '');
INSERT INTO `cy_user_address` VALUES ('447', '51', '江苏省', '苏州市', '姑苏区', '馨泓路', '0', '1581655286', 'jj', '18912640642', '');
INSERT INTO `cy_user_address` VALUES ('448', '51', '江苏省', '苏州市', '姑苏区', '馨泓路', '0', '1581655544', 'rr', '18912640642', '');
INSERT INTO `cy_user_address` VALUES ('449', '51', '江苏省', '苏州市', '姑苏区', '馨泓路', '0', '1581657079', '阿斯蒂芬', '18912640645', '');
INSERT INTO `cy_user_address` VALUES ('450', '51', '江苏省', '苏州市', '姑苏区', '馨泓路', '0', '1581657277', '阿斯蒂芬', '18912640645', '');
INSERT INTO `cy_user_address` VALUES ('451', '51', '江苏省', '苏州市', '姑苏区', '馨泓路', '0', '1581657325', '阿斯蒂芬', '18912640645', '');
INSERT INTO `cy_user_address` VALUES ('452', '51', '江苏省', '苏州市', '姑苏区', '馨泓路', '0', '1581657369', '阿斯蒂芬', '18912640645', '');
INSERT INTO `cy_user_address` VALUES ('453', '51', '江苏省', '苏州市', '姑苏区', '馨泓路', '0', '1581657576', '阿斯蒂芬', '18912640645', '');
INSERT INTO `cy_user_address` VALUES ('454', '51', '江苏省', '苏州市', '姑苏区', '馨泓路', '0', '1581657654', '阿斯蒂芬', '18912640645', '');
INSERT INTO `cy_user_address` VALUES ('455', '51', '江苏省', '苏州市', '姑苏区', '馨泓路', '0', '1581658099', '111', '18912664545', '');
INSERT INTO `cy_user_address` VALUES ('456', '51', '江苏省', '苏州市', '姑苏区', '馨泓路', '0', '1581658118', '111', '18912664545', '');
INSERT INTO `cy_user_address` VALUES ('457', '51', '江苏省', '苏州市', '姑苏区', '馨泓路', '0', '1581658138', '111', '18912664545', '');
INSERT INTO `cy_user_address` VALUES ('458', '51', '江苏省', '苏州市', '姑苏区', '馨泓路', '0', '1581658257', 'sdf', '18912640215', '');
INSERT INTO `cy_user_address` VALUES ('459', '51', '江苏省', '苏州市', '姑苏区', '馨泓路', '0', '1581658345', 'asf', '18912545458', '');
INSERT INTO `cy_user_address` VALUES ('460', '51', '江苏省', '苏州市', '姑苏区', '馨泓路', '0', '1581658972', 'sfd', '18912640521', '');
INSERT INTO `cy_user_address` VALUES ('461', '51', '江苏省', '苏州市', '姑苏区', '馨泓路', '0', '1581659239', 'qwe', '18585858585', '');
INSERT INTO `cy_user_address` VALUES ('462', '51', '江苏省', '苏州市', '姑苏区', '馨泓路', '0', '1581659729', '11q1', '189165521', '');
INSERT INTO `cy_user_address` VALUES ('463', '51', '江苏省', '苏州市', '姑苏区', '馨泓路', '0', '1581674817', 'sf', '18912640645', '');
INSERT INTO `cy_user_address` VALUES ('464', '51', '江苏省', '苏州市', '姑苏区', '馨泓路', '0', '1581674948', '123', '18912545485', '');
INSERT INTO `cy_user_address` VALUES ('465', '51', '江苏省', '苏州市', '姑苏区', '馨泓路', '0', '1581676664', 'sd', '1891245565', '');
INSERT INTO `cy_user_address` VALUES ('466', '65', '江苏省', '泰州市', '兴化市', '张广线', '0', '1581731472', '曹振', '13262862846', '');
INSERT INTO `cy_user_address` VALUES ('467', '51', '江苏省', '苏州市', '姑苏区', '馨泓路', '0', '1581734363', '九宫格', '18912640545', '');
INSERT INTO `cy_user_address` VALUES ('468', '51', '江苏省', '苏州市', '姑苏区', '馨泓路', '0', '1581734689', '阿斯蒂芬', '1878787447', '');
INSERT INTO `cy_user_address` VALUES ('469', '51', '江苏省', '苏州市', '姑苏区', '馨泓路', '0', '1581734795', '阿斯蒂芬', '18945452525', '');
INSERT INTO `cy_user_address` VALUES ('470', '51', '江苏省', '苏州市', '姑苏区', '馨泓路', '0', '1581735200', '热', '16525252522', '');
INSERT INTO `cy_user_address` VALUES ('471', '51', '江苏省', '苏州市', '姑苏区', '馨泓路', '0', '1581739717', 'asdf', '18585452525', '');
INSERT INTO `cy_user_address` VALUES ('472', '51', '江苏省', '苏州市', '姑苏区', '馨泓路', '0', '1581743447', 'ht', '12565854525', '');
INSERT INTO `cy_user_address` VALUES ('473', '51', '江苏省', '苏州市', '姑苏区', '馨泓路', '0', '1581753113', 'gh', '18912525415', '');
INSERT INTO `cy_user_address` VALUES ('474', '51', '四川省', '南充市', '顺庆区', '玉带中路三段', '0', '1581758240', '1', '111', '');
INSERT INTO `cy_user_address` VALUES ('475', '51', '广东省', '广州市', '海珠区', '新港中路397号', '0', '1581758631', '张三', '020-81167888', '');
INSERT INTO `cy_user_address` VALUES ('476', '51', '江苏省', '苏州市', '姑苏区', '馨泓路', '0', '1581760991', 'qe', '123', '');
INSERT INTO `cy_user_address` VALUES ('477', '51', '四川省', '南充市', '顺庆区', '玉带中路', '0', '1581783712', '我', '1', '');
INSERT INTO `cy_user_address` VALUES ('478', '62', '江苏省', '苏州市', '姑苏区', '干将西路', '0', '1581783808', '需不需要', '18912640642', '');
INSERT INTO `cy_user_address` VALUES ('479', '77', '江苏省', '苏州市', '姑苏区', '干将西路', '1', '1581784142', '王某', '18796653542', '');
INSERT INTO `cy_user_address` VALUES ('480', '65', '江苏省', '泰州市', '兴化市', '西戚村小刀电动车专卖店(振宇车行)', '0', '1581815690', '曹振', '13262862846', '');
INSERT INTO `cy_user_address` VALUES ('481', '51', '江苏省', '苏州市', '姑苏区', '十梓街338号', '0', '1581836611', '呜呜呜与', '88888888', '');
INSERT INTO `cy_user_address` VALUES ('482', '51', '江苏省', '苏州市', '姑苏区', '十梓街338号', '0', '1581841845', 'sssss', '555', '');
INSERT INTO `cy_user_address` VALUES ('483', '51', '江苏省', '苏州市', '姑苏区', '十梓街338号', '0', '1581848675', '123', '123', '');
INSERT INTO `cy_user_address` VALUES ('484', '51', '江苏省', '苏州市', '姑苏区', '十梓街338号', '0', '1581855669', '123', '123', '');
INSERT INTO `cy_user_address` VALUES ('485', '51', '江苏省', '苏州市', '姑苏区', '十梓街338号', '0', '1581856265', '123', '1232', '');
INSERT INTO `cy_user_address` VALUES ('486', '51', '江苏省', '苏州市', '姑苏区', '十梓街338号', '0', '1581857750', 'erwr', '3434', '');
INSERT INTO `cy_user_address` VALUES ('487', '51', '四川省', '南充市', '顺庆区', '人民南路', '0', '1581871273', '11', '41', '');
INSERT INTO `cy_user_address` VALUES ('488', '65', '江苏省', '泰州市', '兴化市', '西戚村小刀电动车专卖店(振宇车行)', '0', '1581908364', '曹振', '13262862846', '');
INSERT INTO `cy_user_address` VALUES ('489', '51', '北京市', '北京市', '东城区', '124348', '0', '1581923676', '暴风科技', '13378942282', '');
INSERT INTO `cy_user_address` VALUES ('490', '62', '江苏省', '苏州市', '姑苏区', '干将西路', '0', '1581923808', '虞姬', '18912640642', '');
INSERT INTO `cy_user_address` VALUES ('491', '59', '四川省', '成都市', '金牛区', '金府国际(成都市金牛区金府路777号)', '0', '1581923985', '。', '18618404746', '');
INSERT INTO `cy_user_address` VALUES ('492', '81', '四川省', '遂宁市', '船山区', '荣兴街', '1', '1581924174', '韦', '18682540995', '');
INSERT INTO `cy_user_address` VALUES ('493', '82', '四川省', '南充市', '嘉陵区', '凹造型122号', '1', '1581924431', '蒲灿', '17383872476', '');
INSERT INTO `cy_user_address` VALUES ('494', '83', '四川省', '成都市', '金堂县', ' 高板街道', '0', '1581924889', '唐', '18302826830', '');
INSERT INTO `cy_user_address` VALUES ('495', '83', '四川省', '成都市', '金堂县', ' 高板街道', '0', '1581924891', '唐', '18302826830', '');
INSERT INTO `cy_user_address` VALUES ('496', '83', '四川省', '成都市', '金堂县', ' 高板街道', '0', '1581924892', '唐', '18302826830', '');
INSERT INTO `cy_user_address` VALUES ('497', '83', '四川省', '成都市', '金堂县', ' 高板街道', '0', '1581924893', '唐', '18302826830', '');
INSERT INTO `cy_user_address` VALUES ('498', '83', '四川省', '成都市', '金堂县', ' 高板街道', '0', '1581924894', '唐', '18302826830', '');
INSERT INTO `cy_user_address` VALUES ('499', '83', '四川省', '成都市', '金堂县', ' 高板街道', '0', '1581924895', '唐', '18302826830', '');
INSERT INTO `cy_user_address` VALUES ('500', '83', '四川省', '成都市', '金堂县', ' 高板街道', '0', '1581924896', '唐', '18302826830', '');
INSERT INTO `cy_user_address` VALUES ('501', '59', '四川省', '成都市', '金牛区', '金府国际(成都市金牛区金府路777号)', '0', '1581924948', '。', '18618404746', '');
INSERT INTO `cy_user_address` VALUES ('502', '59', '四川省', '成都市', '金牛区', '金府国际(成都市金牛区金府路777号)', '0', '1581924950', '。', '18618404746', '');
INSERT INTO `cy_user_address` VALUES ('503', '59', '四川省', '成都市', '金牛区', '金府国际(成都市金牛区金府路777号)', '0', '1581924951', '。', '18618404746', '');
INSERT INTO `cy_user_address` VALUES ('504', '83', '四川省', '成都市', '金堂县', ' 高板街道', '1', '1581925050', '唐', '18302826830', '');
INSERT INTO `cy_user_address` VALUES ('505', '84', '四川省', '南充市', '高坪区', '石圭镇', '0', '1581954594', '黄海棠', '13088267621', '');
INSERT INTO `cy_user_address` VALUES ('506', '84', '四川省', '南充市', '高坪区', '石圭镇', '0', '1581954599', '黄海棠', '13088267621', '');
INSERT INTO `cy_user_address` VALUES ('507', '84', '四川省', '南充市', '高坪区', '石圭镇', '0', '1581954601', '黄海棠', '13088267621', '');
INSERT INTO `cy_user_address` VALUES ('508', '84', '四川省', '南充市', '高坪区', '石圭镇', '1', '1581954603', '黄海棠', '13088267621', '');
INSERT INTO `cy_user_address` VALUES ('509', '65', '江苏省', '泰州市', '兴化市', '西戚村小刀电动车专卖店(振宇车行)', '0', '1581993210', '曹振', '13262862846', '');
INSERT INTO `cy_user_address` VALUES ('510', '59', '四川省', '成都市', '金牛区', '金府国际(成都市金牛区金府路777号)', '0', '1582037046', '。', '18618404746', '');
INSERT INTO `cy_user_address` VALUES ('511', '59', '四川省', '成都市', '金牛区', '金府国际(成都市金牛区金府路777号)', '0', '1582037677', '。', '18618404746', '');
INSERT INTO `cy_user_address` VALUES ('512', '51', '北京市', '北京市', '东城区', '124348', '0', '1582037727', '暴风科技', '13378942282', '');
INSERT INTO `cy_user_address` VALUES ('513', '62', '江苏省', '苏州市', '姑苏区', '干将西路', '0', '1582038012', '逻辑', '18912640642', '');
INSERT INTO `cy_user_address` VALUES ('514', '51', '北京市', '北京市', '东城区', '124348', '0', '1582038318', '暴风科技', '13378942282', '');
INSERT INTO `cy_user_address` VALUES ('515', '62', '江苏省', '苏州市', '姑苏区', '干将西路', '0', '1582038577', '逻辑', '18912540642', '');
INSERT INTO `cy_user_address` VALUES ('516', '59', '四川省', '成都市', '金牛区', '金府国际(成都市金牛区金府路777号)', '0', '1582040261', '。', '18618404746', '');
INSERT INTO `cy_user_address` VALUES ('517', '59', '四川省', '成都市', '金牛区', '金府国际(成都市金牛区金府路777号)', '0', '1582040263', '。', '18618404746', '');
INSERT INTO `cy_user_address` VALUES ('518', '59', '四川省', '成都市', '金牛区', '金府国际(成都市金牛区金府路777号)', '0', '1582040265', '。', '18618404746', '');
INSERT INTO `cy_user_address` VALUES ('519', '59', '四川省', '成都市', '金牛区', '金府国际(成都市金牛区金府路777号)', '0', '1582040283', '。', '18618404746', '');
INSERT INTO `cy_user_address` VALUES ('520', '59', '四川省', '成都市', '金牛区', '金府国际(成都市金牛区金府路777号)', '0', '1582040288', '。', '18618404746', '');
INSERT INTO `cy_user_address` VALUES ('521', '59', '四川省', '成都市', '金牛区', '金府国际(成都市金牛区金府路777号)', '0', '1582040294', '。', '18618404746', '');
INSERT INTO `cy_user_address` VALUES ('522', '59', '四川省', '成都市', '金牛区', '金府国际(成都市金牛区金府路777号)', '0', '1582040880', '。', '18618404746', '');
INSERT INTO `cy_user_address` VALUES ('523', '65', '江苏省', '泰州市', '兴化市', '西戚村小刀电动车专卖店(振宇车行)', '0', '1582081459', '曹振', '13262862846', '');
INSERT INTO `cy_user_address` VALUES ('524', '51', '北京市', '北京市', '东城区', '124348', '0', '1582089000', '暴风科技', '13378942282', '');
INSERT INTO `cy_user_address` VALUES ('525', '51', '北京市', '北京市', '东城区', '124348', '0', '1582089285', '暴风科技', '13378942282', '');
INSERT INTO `cy_user_address` VALUES ('526', '65', '江苏省', '泰州市', '兴化市', '西戚村小刀电动车专卖店(振宇车行)', '0', '1582157499', '曹振', '13262862846', '');
INSERT INTO `cy_user_address` VALUES ('527', '65', '江苏省', '泰州市', '兴化市', '西戚村小刀电动车专卖店(振宇车行)', '0', '1582243929', '曹振', '13262862846', '');
INSERT INTO `cy_user_address` VALUES ('528', '65', '江苏省', '泰州市', '兴化市', '西戚村小刀电动车专卖店(振宇车行)', '0', '1582326858', '曹振', '13262862846', '');
INSERT INTO `cy_user_address` VALUES ('529', '50', '四川省', '成都市', '武侯区', '永康路', '0', '1582351725', '黄杰', '18383397520', '');
INSERT INTO `cy_user_address` VALUES ('530', '50', '四川省', '成都市', '武侯区', '武侯祠大街264号', '0', '1582353427', '黄金', '18383397520', '');
INSERT INTO `cy_user_address` VALUES ('531', '51', '北京市', '北京市', '东城区', '124348', '0', '1582376847', '暴风科技', '13378942282', '');
INSERT INTO `cy_user_address` VALUES ('532', '50', '四川省', '成都市', '武侯区', '武侯祠大街264号', '0', '1582385423', '杰', '18383397524', '');
INSERT INTO `cy_user_address` VALUES ('533', '65', '江苏省', '泰州市', '兴化市', '西戚村小刀电动车专卖店(振宇车行)', '0', '1582414479', '曹振', '13262862846', '');
INSERT INTO `cy_user_address` VALUES ('534', '51', '北京市', '北京市', '东城区', '124348', '0', '1582436822', '暴风科技', '13378942282', '');
INSERT INTO `cy_user_address` VALUES ('535', '50', '四川省', '成都市', '武侯区', '武侯祠大街264号', '0', '1582447066', '收到货', '18383397548', '');
INSERT INTO `cy_user_address` VALUES ('536', '50', '四川省', '成都市', '武侯区', '武侯祠大街264号', '0', '1582451435', '就好', '18208375842', '');
INSERT INTO `cy_user_address` VALUES ('537', '50', '四川省', '成都市', '武侯区', '九金街86号', '0', '1582451518', '杰', '18383397563', '');
INSERT INTO `cy_user_address` VALUES ('538', '50', '四川省', '成都市', '武侯区', '九金街86号', '0', '1582471210', '杰', '18383396514', '');
INSERT INTO `cy_user_address` VALUES ('539', '50', '四川省', '成都市', '武侯区', '武侯祠大街264号', '0', '1582475418', '街', '18383397546', '');
INSERT INTO `cy_user_address` VALUES ('540', '50', '四川省', '成都市', '武侯区', '永康路', '0', '1582475552', '杰', '18383397526', '');
INSERT INTO `cy_user_address` VALUES ('541', '65', '江苏省', '泰州市', '兴化市', '西戚村小刀电动车专卖店(振宇车行)', '0', '1582497504', '曹振', '13262862846', '');
INSERT INTO `cy_user_address` VALUES ('542', '51', '四川省', '南充市', '顺庆区', '玉带中路三段', '0', '1582531544', '1100', '1100', '');
INSERT INTO `cy_user_address` VALUES ('543', '50', '四川省', '成都市', '武侯区', '天府二街269号', '0', '1582531632', '杰克逊', '18383397526', '');
INSERT INTO `cy_user_address` VALUES ('544', '62', '江苏省', '苏州市', '相城区', '澄和路1218号', '0', '1582531656', '预谋', '18912640648', '');
INSERT INTO `cy_user_address` VALUES ('545', '50', '四川省', '成都市', '武侯区', '天府二街269号', '0', '1582531832', '莱顿', '18383394526', '');
INSERT INTO `cy_user_address` VALUES ('546', '50', '四川省', '成都市', '武侯区', '武侯祠大街264号', '0', '1582559570', '撒即可', '18383397541', '');
INSERT INTO `cy_user_address` VALUES ('547', '50', '四川省', '成都市', '武侯区', '九金街86号', '0', '1582561163', '鸡翅', '18383397562', '');
INSERT INTO `cy_user_address` VALUES ('548', '65', '江苏省', '泰州市', '兴化市', '西戚村小刀电动车专卖店(振宇车行)', '0', '1582586658', '曹振', '13262862846', '');
INSERT INTO `cy_user_address` VALUES ('549', '50', '四川省', '成都市', '武侯区', '天府二街269号', '0', '1582594719', '接我', '18383394531', '');
INSERT INTO `cy_user_address` VALUES ('550', '50', '四川省', '成都市', '武侯区', '天府二街269号', '0', '1582595231', '杰', '18383394526', '');
INSERT INTO `cy_user_address` VALUES ('551', '50', '四川省', '成都市', '武侯区', '天府二街269号', '0', '1582595399', '进', '18383394521', '');
INSERT INTO `cy_user_address` VALUES ('552', '50', '四川省', '成都市', '武侯区', '天府二街269号', '0', '1582595799', '咯', '18383397541', '');
INSERT INTO `cy_user_address` VALUES ('553', '50', '四川省', '成都市', '武侯区', '天府二街269号', '0', '1582596121', '鸡翅', '18383394532', '');
INSERT INTO `cy_user_address` VALUES ('554', '51', '四川省', '南充市', '顺庆区', '玉带中路三段', '0', '1582635932', '11', '110', '');
INSERT INTO `cy_user_address` VALUES ('555', '50', '四川省', '成都市', '武侯区', '九金街86号', '0', '1582636026', '接你', '18383397532', '');
INSERT INTO `cy_user_address` VALUES ('556', '62', '江苏省', '苏州市', '相城区', '澄和路1218号', '0', '1582636063', '于某', '13649768591', '');
INSERT INTO `cy_user_address` VALUES ('557', '59', '四川省', '成都市', '金牛区', '金府国际(成都市金牛区金府路777号)', '0', '1582636150', '。', '18618404746', '');
INSERT INTO `cy_user_address` VALUES ('558', '59', '四川省', '成都市', '金牛区', '金府国际(成都市金牛区金府路777号)', '0', '1582636152', '。', '18618404746', '');
INSERT INTO `cy_user_address` VALUES ('559', '65', '江苏省', '泰州市', '兴化市', '西戚村小刀电动车专卖店(振宇车行)', '0', '1582695132', '曹振', '13262862846', '');
INSERT INTO `cy_user_address` VALUES ('560', '51', '北京市', '北京市', '东城区', '124348', '0', '1582719440', '暴风科技', '13378942282', '');
INSERT INTO `cy_user_address` VALUES ('561', '62', '江苏省', '苏州市', '姑苏区', '干将西路', '0', '1582720007', '噢噢噢', '18912640642', '');
INSERT INTO `cy_user_address` VALUES ('562', '50', '四川省', '成都市', '武侯区', '九康环路', '0', '1582720030', '继续', '18383396524', '');
INSERT INTO `cy_user_address` VALUES ('563', '51', '四川省', '南充市', '顺庆区', '人民南路', '1', '1582724405', '110', '110', '');
INSERT INTO `cy_user_address` VALUES ('564', '59', '四川省', '南充市', '顺庆区', '人民南路', '0', '1582724506', '曹总', '1100', '');
INSERT INTO `cy_user_address` VALUES ('565', '65', '江苏省', '泰州市', '兴化市', '西戚村小刀电动车专卖店(振宇车行)', '0', '1582756474', '曹振', '13262862846', '');
INSERT INTO `cy_user_address` VALUES ('566', '50', '四川省', '成都市', '武侯区', '天府大道北段1700号', '0', '1582775333', '操作', '18383397543', '');
INSERT INTO `cy_user_address` VALUES ('567', '50', '四川省', '成都市', '武侯区', '天府大道北段1700号', '0', '1582792692', '撒大', '18383395620', '');
INSERT INTO `cy_user_address` VALUES ('568', '65', '江苏省', '泰州市', '兴化市', '西戚村小刀电动车专卖店(振宇车行)', '0', '1582847281', '曹振', '13262862846', '');
INSERT INTO `cy_user_address` VALUES ('569', '65', '江苏省', '泰州市', '兴化市', '西戚村小刀电动车专卖店(振宇车行)', '0', '1582930945', '曹振', '13262862846', '');
INSERT INTO `cy_user_address` VALUES ('570', '65', '江苏省', '泰州市', '兴化市', '西戚村小刀电动车专卖店(振宇车行)', '0', '1583019560', '曹振', '13262862846', '');
INSERT INTO `cy_user_address` VALUES ('571', '65', '江苏省', '泰州市', '兴化市', '西戚村小刀电动车专卖店(振宇车行)', '0', '1583133570', '曹振', '13262862846', '');
INSERT INTO `cy_user_address` VALUES ('572', '65', '江苏省', '泰州市', '兴化市', '西戚村小刀电动车专卖店(振宇车行)', '0', '1583193465', '曹振', '13262862846', '');
INSERT INTO `cy_user_address` VALUES ('573', '50', '四川省', '成都市', '武侯区', '武侯祠大街264号', '0', '1583242806', '杀绝好的', '18383397520', '');
INSERT INTO `cy_user_address` VALUES ('574', '65', '江苏省', '泰州市', '兴化市', '西戚村小刀电动车专卖店(振宇车行)', '0', '1583279354', '曹振', '13262862846', '');
INSERT INTO `cy_user_address` VALUES ('575', '50', '四川省', '成都市', '武侯区', '英华南路299号', '0', '1583305939', '力图', '18383397541', '');
INSERT INTO `cy_user_address` VALUES ('576', '50', '四川省', '成都市', '武侯区', '天府大道北段1700号', '0', '1583306009', 'sad', '18383397524', '');
INSERT INTO `cy_user_address` VALUES ('577', '50', '四川省', '成都市', '武侯区', '天府大道北段1700号', '0', '1583306050', 'sad', '18383397540', '');
INSERT INTO `cy_user_address` VALUES ('578', '50', '四川省', '成都市', '武侯区', '天府二街269号', '0', '1583306092', '口', '18383397451', '');
INSERT INTO `cy_user_address` VALUES ('579', '50', '四川省', '成都市', '武侯区', '英华南路299号', '0', '1583306311', '给我', '18383395680', '');
INSERT INTO `cy_user_address` VALUES ('580', '50', '四川省', '成都市', '武侯区', '天府大道北段1700号', '0', '1583306356', 'asd', '18383397542', '');
INSERT INTO `cy_user_address` VALUES ('581', '50', '四川省', '成都市', '武侯区', '天府大道北段1700号', '0', '1583306466', 'asd', '18383397540', '');
INSERT INTO `cy_user_address` VALUES ('582', '50', '四川省', '成都市', '武侯区', '天府大道北段1700号', '0', '1583306543', 'sad', '18383397540', '');
INSERT INTO `cy_user_address` VALUES ('583', '50', '四川省', '成都市', '武侯区', '天府大道北段1700号', '0', '1583306573', 'sad', '18383397460', '');
INSERT INTO `cy_user_address` VALUES ('584', '50', '四川省', '成都市', '武侯区', '天府大道北段1700号', '0', '1583306602', 'sdx', '18383397450', '');
INSERT INTO `cy_user_address` VALUES ('585', '69', '江苏省', '泰州市', '兴化市', '西戚村(泰州市兴化市)', '0', '1583326588', '倩倩', '13651622883', '');
INSERT INTO `cy_user_address` VALUES ('586', '69', '江苏省', '泰州市', '兴化市', '西戚村(泰州市兴化市)', '0', '1583328734', '倩倩', '13651622883', '');
INSERT INTO `cy_user_address` VALUES ('587', '65', '江苏省', '泰州市', '兴化市', '西戚村小刀电动车专卖店(振宇车行)', '0', '1583365044', '曹振', '13262862846', '');
INSERT INTO `cy_user_address` VALUES ('588', '65', '江苏省', '泰州市', '兴化市', '西戚村小刀电动车专卖店(振宇车行)', '0', '1583464819', '曹振', '13262862846', '');
INSERT INTO `cy_user_address` VALUES ('589', '69', '江苏省', '泰州市', '兴化市', '西戚村(泰州市兴化市)', '0', '1583484169', '倩倩', '13651622883', '');
INSERT INTO `cy_user_address` VALUES ('590', '116', '四川省', '成都市', '金牛区', '星汉北路28号', '0', '1583661306', '114', '110', '');
INSERT INTO `cy_user_address` VALUES ('591', '50', '四川省', '成都市', '武侯区', '天府大道北段1700号', '0', '1583736328', '阿萨的', '18383397540', '');
INSERT INTO `cy_user_address` VALUES ('592', '116', '北京市', '北京市', '东城区', '124348', '0', '1583743065', '暴风科技', '13378942282', '');
INSERT INTO `cy_user_address` VALUES ('593', '116', '北京市', '北京市', '东城区', '124348', '0', '1583743472', '暴风科技', '13378942282', '');
INSERT INTO `cy_user_address` VALUES ('594', '116', '北京市', '北京市', '东城区', '124348', '0', '1583745886', '暴风科技', '13378942282', '');
INSERT INTO `cy_user_address` VALUES ('595', '116', '北京市', '北京市', '东城区', '124348', '0', '1583746232', '暴风科技', '13378942282', '');
INSERT INTO `cy_user_address` VALUES ('596', '65', '江苏省', '泰州市', '兴化市', '西戚村小刀电动车专卖店(振宇车行)', '0', '1583817112', '曹振', '13262862846', '');
INSERT INTO `cy_user_address` VALUES ('597', '59', '四川省', '成都市', '金牛区', '金府国际(成都市金牛区金府路777号)', '0', '1583823403', '。', '18618404746', '');
INSERT INTO `cy_user_address` VALUES ('598', '59', '四川省', '成都市', '金牛区', '金府国际(成都市金牛区金府路777号)', '0', '1583823679', '。', '18618404746', '');
INSERT INTO `cy_user_address` VALUES ('599', '116', '四川省', '成都市', '金牛区', '三环路', '0', '1583823720', '110', '110', '');
INSERT INTO `cy_user_address` VALUES ('600', '59', '四川省', '成都市', '金牛区', '金府国际(成都市金牛区金府路777号)', '0', '1583823836', '。', '18618404746', '');
INSERT INTO `cy_user_address` VALUES ('601', '59', '四川省', '成都市', '金牛区', '金府国际(成都市金牛区金府路777号)', '0', '1583823932', '。', '18618404746', '');
INSERT INTO `cy_user_address` VALUES ('602', '65', '江苏省', '泰州市', '兴化市', '西戚村小刀电动车专卖店(振宇车行)', '0', '1583824188', '曹振', '13262862846', '');
INSERT INTO `cy_user_address` VALUES ('603', '65', '江苏省', '泰州市', '兴化市', '西戚村小刀电动车专卖店(振宇车行)', '0', '1583824446', '曹振', '13262862846', '');
INSERT INTO `cy_user_address` VALUES ('604', '65', '江苏省', '泰州市', '兴化市', '新张线东戚村(泰州市兴化市)', '0', '1583824474', '曹振', '13262862846', '');
INSERT INTO `cy_user_address` VALUES ('605', '65', '江苏省', '泰州市', '兴化市', '农业示范园连接线', '0', '1583824739', '曹振', '13262862846', '');
INSERT INTO `cy_user_address` VALUES ('606', '65', '江苏省', '泰州市', '兴化市', '农业示范园连接线', '0', '1583824751', '曹振', '13262862846', '');
INSERT INTO `cy_user_address` VALUES ('607', '65', '江苏省', '泰州市', '兴化市', '新张线', '0', '1583824826', '曹振', '13262862846', '');
INSERT INTO `cy_user_address` VALUES ('608', '65', '江苏省', '泰州市', '兴化市', '村道N08', '0', '1583825208', '曹振', '13262862846', '');
INSERT INTO `cy_user_address` VALUES ('609', '50', '四川省', '成都市', '武侯区', '天府大道北段1700号', '0', '1583825379', '萨达是', '18383397542', '');
INSERT INTO `cy_user_address` VALUES ('610', '50', '四川省', '成都市', '武侯区', '永康路', '0', '1583846781', '后期', '18383397526', '');
INSERT INTO `cy_user_address` VALUES ('611', '67', '江苏省', '泰州市', '兴化市', '西戚村(泰州市兴化市)公路边修车子的', '0', '1583908577', '曹井之', '18914519681', '');
INSERT INTO `cy_user_address` VALUES ('612', '67', '江苏省', '泰州市', '兴化市', '西戚村(泰州市兴化市)公路边修车子的', '0', '1583908629', '曹井之', '18914519681', '');
INSERT INTO `cy_user_address` VALUES ('613', '67', '江苏省', '泰州市', '兴化市', '西戚村(泰州市兴化市)公路边修车子的', '0', '1583909002', '曹井之', '18914519681', '');
INSERT INTO `cy_user_address` VALUES ('614', '65', '江苏省', '泰州市', '兴化市', '西戚村小刀电动车专卖店(振宇车行)', '0', '1583909289', '曹振', '13262862846', '');
INSERT INTO `cy_user_address` VALUES ('615', '69', '江苏省', '泰州市', '兴化市', '西戚村(泰州市兴化市)', '0', '1583909354', '倩倩', '13651622883', '');
INSERT INTO `cy_user_address` VALUES ('616', '67', '江苏省', '泰州市', '兴化市', '西戚村(泰州市兴化市)公路边修车子的', '0', '1583909643', '曹井之', '18914519681', '');
INSERT INTO `cy_user_address` VALUES ('617', '69', '江苏省', '泰州市', '兴化市', '西戚村(泰州市兴化市)', '0', '1583909670', '倩倩', '13651622883', '');
INSERT INTO `cy_user_address` VALUES ('618', '69', '江苏省', '泰州市', '兴化市', '西戚村(泰州市兴化市)', '0', '1583909840', '倩倩', '13651622883', '');
INSERT INTO `cy_user_address` VALUES ('619', '67', '江苏省', '泰州市', '兴化市', '西戚村(泰州市兴化市)公路边修车子的', '0', '1583909881', '曹井之', '18914519681', '');
INSERT INTO `cy_user_address` VALUES ('620', '65', '江苏省', '泰州市', '兴化市', '西戚村小刀电动车专卖店(振宇车行)', '0', '1583911182', '曹振', '13262862846', '');
INSERT INTO `cy_user_address` VALUES ('621', '65', '江苏省', '泰州市', '兴化市', '村道N08', '0', '1583911575', '曹振', '13262862846', '');
INSERT INTO `cy_user_address` VALUES ('622', '65', '江苏省', '泰州市', '兴化市', '村道N08', '0', '1583911581', '曹振', '13262862846', '');
INSERT INTO `cy_user_address` VALUES ('623', '65', '江苏省', '泰州市', '兴化市', '村道N08西戚村(泰州市兴化市)', '0', '1583911771', '曹振', '13262862846', '');
INSERT INTO `cy_user_address` VALUES ('624', '65', '江苏省', '泰州市', '兴化市', '村道N08', '0', '1583911952', '曹振', '13262862846', '');
INSERT INTO `cy_user_address` VALUES ('625', '65', '江苏省', '泰州市', '兴化市', '农业示范园连接线', '0', '1583912367', '曹振', '13262862846', '');
INSERT INTO `cy_user_address` VALUES ('626', '65', '江苏省', '泰州市', '兴化市', '新张线', '0', '1583912409', '曹振', '13262862846', '');
INSERT INTO `cy_user_address` VALUES ('627', '65', '江苏省', '泰州市', '兴化市', '农业示范园连接线同济公路桥(泰州市兴化市)', '0', '1583912487', '曹振', '13262862846', '');
INSERT INTO `cy_user_address` VALUES ('628', '65', '江苏省', '泰州市', '兴化市', '农业示范园连接线同济公路桥(泰州市兴化市)', '0', '1583913070', '曹振', '13262862846', '');
INSERT INTO `cy_user_address` VALUES ('629', '65', '江苏省', '泰州市', '兴化市', '农业示范园连接线同济公路桥(泰州市兴化市)', '0', '1583913084', '曹振', '13262862846', '');
INSERT INTO `cy_user_address` VALUES ('630', '65', '江苏省', '泰州市', '兴化市', '农业示范园连接线同济公路桥(泰州市兴化市)', '0', '1583913825', '曹振', '13262862846', '');
INSERT INTO `cy_user_address` VALUES ('631', '50', '四川省', '成都市', '武侯区', '英华南路299号吉泰路(成都市武侯区)', '0', '1583917895', '杰', '18383397521', '');
INSERT INTO `cy_user_address` VALUES ('632', '50', '四川省', '乐山市', '夹江县', '迎宾街夹江县土门邮政代办所', '0', '1583918292', '明', '18383397542', '');
INSERT INTO `cy_user_address` VALUES ('633', '50', '四川省', '乐山市', '夹江县', '迎宾街夹江县土门邮政代办所', '0', '1583918318', '明', '18383397542', '');
INSERT INTO `cy_user_address` VALUES ('634', '50', '四川省', '成都市', '武侯区', '天府大道北段1700号', '0', '1583919471', '小红', '18383397452', '');
INSERT INTO `cy_user_address` VALUES ('635', '50', '四川省', '成都市', '武侯区', '天府大道北段1700号', '0', '1583919561', '小芳', '18383397420', '');
INSERT INTO `cy_user_address` VALUES ('636', '50', '四川省', '成都市', '武侯区', '天府大道北段1700号', '0', '1583919621', '明哲', '18383397541', '');
INSERT INTO `cy_user_address` VALUES ('637', '50', '四川省', '成都市', '武侯区', '天府大道北段1700号', '0', '1583919656', '毛毛', '18383397540', '');
INSERT INTO `cy_user_address` VALUES ('638', '65', '江苏省', '泰州市', '兴化市', '农业示范园连接线同济公路桥(泰州市兴化市)', '0', '1583926294', '曹振', '13262862846', '');
INSERT INTO `cy_user_address` VALUES ('639', '67', '江苏省', '泰州市', '兴化市', '西戚村(泰州市兴化市)公路边修车子的', '0', '1583926703', '曹井之', '18914519681', '');
INSERT INTO `cy_user_address` VALUES ('640', '69', '江苏省', '泰州市', '兴化市', '西戚村(泰州市兴化市)', '0', '1583927623', '倩倩', '13651622883', '');
INSERT INTO `cy_user_address` VALUES ('641', '69', '江苏省', '泰州市', '兴化市', '西戚村(泰州市兴化市)', '0', '1583927802', '倩倩', '13651622883', '');
INSERT INTO `cy_user_address` VALUES ('642', '69', '江苏省', '泰州市', '兴化市', '西戚村(泰州市兴化市)', '0', '1583927862', '倩倩', '13651622883', '');
INSERT INTO `cy_user_address` VALUES ('643', '50', '四川省', '成都市', '武侯区', '永康路', '0', '1583936463', '杰锅', '18383397524', '');
INSERT INTO `cy_user_address` VALUES ('644', '50', '四川省', '成都市', '武侯区', '金兴北路陆坝村(成都市武侯区)', '0', '1583939831', '阿飞', '18383397524', '');
INSERT INTO `cy_user_address` VALUES ('645', '50', '四川省', '成都市', '武侯区', '九金街与永康路交叉口西北角蓝光金双楠二期', '0', '1583941088', '林', '18383397546', '');
INSERT INTO `cy_user_address` VALUES ('646', '50', '四川省', '成都市', '武侯区', '永康路', '0', '1583941540', '杰', '18383397542', '');
INSERT INTO `cy_user_address` VALUES ('647', '50', '四川省', '成都市', '武侯区', '九金街与永康路交叉口西北角蓝光金双楠二期', '0', '1583941609', '林', '18383397546', '');
INSERT INTO `cy_user_address` VALUES ('648', '50', '四川省', '成都市', '武侯区', '天府二街269号', '0', '1583978199', '刘小明', '18383397524', '');
INSERT INTO `cy_user_address` VALUES ('649', '50', '四川省', '成都市', '武侯区', '天府大道北段1700号', '0', '1583978276', '小芳', '18383397542', '');
INSERT INTO `cy_user_address` VALUES ('650', '55', '四川省', '成都市', '锦江区', '锦江区水碾河路6号33栋', '0', '1583983618', '余超', '15828043607', '');
INSERT INTO `cy_user_address` VALUES ('651', '116', '北京市', '北京市', '东城区', '124348', '0', '1583992554', '暴风科技', '13378942282', '');
INSERT INTO `cy_user_address` VALUES ('652', '116', '北京市', '北京市', '东城区', '124348', '0', '1583992644', '暴风科技', '13378942282', '');
INSERT INTO `cy_user_address` VALUES ('653', '116', '北京市', '北京市', '东城区', '124348', '0', '1583994136', '暴风科技', '13378942282', '');
INSERT INTO `cy_user_address` VALUES ('654', '116', '北京市', '北京市', '东城区', '124348', '0', '1583995216', '暴风科技', '13378942282', '');
INSERT INTO `cy_user_address` VALUES ('655', '116', '北京市', '北京市', '东城区', '124348', '0', '1583995241', '暴风科技', '13378942282', '');
INSERT INTO `cy_user_address` VALUES ('656', '116', '北京市', '北京市', '东城区', '124348', '0', '1583996015', '暴风科技', '13378942282', '');
INSERT INTO `cy_user_address` VALUES ('657', '59', '四川省', '成都市', '金牛区', '金府国际(成都市金牛区金府路777号)', '0', '1583996113', '。', '18618404746', '');
INSERT INTO `cy_user_address` VALUES ('658', '55', '四川省', '成都市', '锦江区', '锦江区水碾河路6号33栋', '1', '1583996181', '余超', '15828043607', '');
INSERT INTO `cy_user_address` VALUES ('659', '50', '四川省', '成都市', '武侯区', '英华南路299号', '0', '1583996722', '杰', '18383397540', '');
INSERT INTO `cy_user_address` VALUES ('660', '65', '江苏省', '泰州市', '兴化市', '村道N08', '0', '1583997512', '曹振', '13262862846', '');
INSERT INTO `cy_user_address` VALUES ('661', '65', '江苏省', '泰州市', '兴化市', '村道N08东戚村(泰州市兴化市)', '0', '1583997574', '曹振', '13262862846', '');
INSERT INTO `cy_user_address` VALUES ('662', '67', '江苏省', '泰州市', '兴化市', '西戚村小刀电动车专卖店(振宇车行)', '0', '1583998672', '曹振', '13262862846', '');
INSERT INTO `cy_user_address` VALUES ('663', '67', '江苏省', '泰州市', '兴化市', '西戚村小刀电动车专卖店(振宇车行)', '0', '1583998731', '曹振', '13262862846', '');
INSERT INTO `cy_user_address` VALUES ('664', '50', '江苏省', '泰州市', '兴化市', '西戚村', '0', '1583998878', '杰', '18383397540', '');
INSERT INTO `cy_user_address` VALUES ('665', '50', '四川省', '成都市', '武侯区', '英华南路299号', '0', '1584000375', '杰', '18383397540', '');
INSERT INTO `cy_user_address` VALUES ('666', '50', '四川省', '成都市', '武侯区', '英华南路299号', '0', '1584000382', '杰', '18383397540', '');
INSERT INTO `cy_user_address` VALUES ('667', '65', '江苏省', '泰州市', '兴化市', '农业示范园连接线同济公路桥(泰州市兴化市)', '0', '1584001378', '曹振', '13262862846', '');
INSERT INTO `cy_user_address` VALUES ('668', '50', '四川省', '成都市', '武侯区', '天府大道北段1700号', '0', '1584003191', '杰', '18383397520', '');
INSERT INTO `cy_user_address` VALUES ('669', '50', '四川省', '成都市', '武侯区', '天府大道北段1700号', '0', '1584003370', '撒', '18383397541', '');
INSERT INTO `cy_user_address` VALUES ('670', '50', '四川省', '成都市', '武侯区', '天府大道北段1700号', '0', '1584003425', '嗄是', '18383397520', '');
INSERT INTO `cy_user_address` VALUES ('671', '50', '四川省', '成都市', '武侯区', '英华南路299号', '0', '1584003700', '继续', '18383697520', '');
INSERT INTO `cy_user_address` VALUES ('672', '50', '四川省', '成都市', '武侯区', '云华路成都腾讯大厦B座(成都市武侯区)', '0', '1584005149', '杰', '18383397540', '');
INSERT INTO `cy_user_address` VALUES ('673', '50', '四川省', '成都市', '武侯区', '英华南路299号', '0', '1584005670', '杰', '18383397540', '');
INSERT INTO `cy_user_address` VALUES ('674', '50', '四川省', '成都市', '武侯区', '英华南路299号', '0', '1584006869', '刘', '18383397526', '');
INSERT INTO `cy_user_address` VALUES ('675', '50', '江苏省', '泰州市', '兴化市', '农业示范园连接线', '0', '1584007126', '杰', '18383397560', '');
INSERT INTO `cy_user_address` VALUES ('676', '50', '江苏省', '泰州市', '兴化市', '农业示范园连接线', '0', '1584009268', '杰', '18383397560', '');
INSERT INTO `cy_user_address` VALUES ('677', '50', '江苏省', '泰州市', '兴化市', '农业示范园连接线', '0', '1584009344', '杰', '18383397560', '');
INSERT INTO `cy_user_address` VALUES ('678', '50', null, null, null, '四川省成都市武侯区永康路蓝光金双楠二期(成都市武侯区)', '0', '1584025100', '杰', '18383397524', '');
INSERT INTO `cy_user_address` VALUES ('679', '50', null, null, null, '四川省成都市武侯区永康路蓝光金双楠二期(成都市武侯区)', '0', '1584025337', '杰', '18383397540', '');
INSERT INTO `cy_user_address` VALUES ('680', '50', null, null, null, '江苏省泰州市兴化市农业示范园连接线', '0', '1584025463', '杰', '18383397524', '');
INSERT INTO `cy_user_address` VALUES ('681', '50', null, null, null, '四川省成都市', '0', '1584025667', '街', '18383397450', '');
INSERT INTO `cy_user_address` VALUES ('682', '50', null, null, null, '四川省成都市武侯区机投桥街道九康四路248号3Q便利', '0', '1584025870', '刘', '18383397650', '');
INSERT INTO `cy_user_address` VALUES ('683', '116', null, null, null, '四川省南充市蓬安县镇山庙', '0', '1584026111', '110', '110', '');
INSERT INTO `cy_user_address` VALUES ('684', '116', '四川省', '南充市', '蓬安县', '锦屏山', '0', '1584027719', '亲爱的', '15984817250', '');
INSERT INTO `cy_user_address` VALUES ('685', '116', null, null, null, '四川省南充市蓬安县锦屏山', '0', '1584027785', '110', '110', '');
INSERT INTO `cy_user_address` VALUES ('686', '65', '江苏省', '泰州市', '兴化市', '西戚村小刀电动车专卖店(振宇车行)', '0', '1584055598', '曹振', '13262862846', '');
INSERT INTO `cy_user_address` VALUES ('687', '65', null, null, null, '江苏省泰州市兴化市', '0', '1584056023', '曹振', '13262862846', '');
INSERT INTO `cy_user_address` VALUES ('688', '65', null, null, null, '江苏省泰州市兴化市西戚村(泰州市兴化市)', '0', '1584056371', '曹振', '13262862846', '');
INSERT INTO `cy_user_address` VALUES ('689', '65', null, null, null, '江苏省泰州市兴化市352省道352省道(泰州市兴化市)', '0', '1584057330', '曹振', '13262862846', '');
INSERT INTO `cy_user_address` VALUES ('690', '65', null, null, null, '江苏省泰州市兴化市物流大道兴化戴南不锈钢现代物流园(泰州市兴化市)', '0', '1584057510', '曹振', '13262862846', '');
INSERT INTO `cy_user_address` VALUES ('691', '65', null, null, null, '江苏省泰州市兴化市352省道352省道(泰州市兴化市)', '0', '1584057960', '曹振', '13262862846', '');
INSERT INTO `cy_user_address` VALUES ('692', '65', null, null, null, '江苏省泰州市兴化市荻戴线荻戴线(泰州市兴化市)', '0', '1584058253', '曹振', '13262862846', '');
INSERT INTO `cy_user_address` VALUES ('693', '65', null, null, null, '江苏省泰州市兴化市农业示范园连接线同济公路桥(泰州市兴化市)', '0', '1584058617', '曹振', '13262862846', '');
INSERT INTO `cy_user_address` VALUES ('694', '65', null, null, null, '江苏省泰州市兴化市新张线新张线(泰州市兴化市)', '0', '1584058843', '曹振', '13262862846', '');
INSERT INTO `cy_user_address` VALUES ('695', '65', null, null, null, '江苏省泰州市兴化市村道N08东戚村(泰州市兴化市)', '0', '1584059029', '曹振', '13262862846', '');
INSERT INTO `cy_user_address` VALUES ('696', '65', null, null, null, '江苏省泰州市兴化市西戚村(泰州市兴化市)', '0', '1584059351', '曹振', '13262862846', '');
INSERT INTO `cy_user_address` VALUES ('697', '65', null, null, null, '江苏省泰州市兴化市村道N08西戚村(泰州市兴化市)', '0', '1584059464', '曹振', '13262862846', '');
INSERT INTO `cy_user_address` VALUES ('698', '65', null, null, null, '江苏省泰州市兴化市村道N08西戚村(泰州市兴化市)', '0', '1584059564', '曹振', '13262862846', '');
INSERT INTO `cy_user_address` VALUES ('699', '65', null, null, null, '江苏省泰州市兴化市西戚村(泰州市兴化市)', '0', '1584059648', '曹振', '13262862846', '');
INSERT INTO `cy_user_address` VALUES ('700', '50', null, null, null, '', '0', '1584067856', 'jie', '18383397521', '');
INSERT INTO `cy_user_address` VALUES ('701', '50', null, null, null, '四川省成都市武侯区高新区英华南路299号福年广场福年广场-T1写字楼', '0', '1584068641', '杰', '18383397540', '');
INSERT INTO `cy_user_address` VALUES ('702', '50', null, null, null, '北京市东城区东长安街天安门广场', '0', '1584068764', '刘', '18383396541', '');
INSERT INTO `cy_user_address` VALUES ('703', '69', null, null, null, '江苏省泰州市兴化市西戚村(泰州市兴化市)', '0', '1584071495', '曹振', '13651622883', '');
INSERT INTO `cy_user_address` VALUES ('704', '50', null, null, null, '四川省成都市武侯区天府大道北段1656环球中心E5区', '0', '1584076491', '刘三', '18383397520', '');
INSERT INTO `cy_user_address` VALUES ('705', '50', null, null, null, '四川省成都市武侯区天府大道北段1656环球中心E5区', '0', '1584076546', '刘老四', '18383397526', '');
INSERT INTO `cy_user_address` VALUES ('706', '116', null, null, null, '四川省南充市蓬安县锦屏山', '0', '1584077937', '110', '110', '');
INSERT INTO `cy_user_address` VALUES ('707', '116', null, null, null, '四川省南充市蓬安县莲花村', '0', '1584077988', '110', '401', '');
INSERT INTO `cy_user_address` VALUES ('708', '116', null, null, null, '四川省南充市蓬安县锦屏山', '0', '1584078315', '110', '110', '');
INSERT INTO `cy_user_address` VALUES ('709', '50', null, null, null, '四川省成都市武侯区高新区英华南路299号福年广场花样年福年广场T2', '0', '1584078435', '杰锅', '18383397540', '');
INSERT INTO `cy_user_address` VALUES ('710', '59', '四川省', '成都市', '金牛区', '金府国际(成都市金牛区金府路777号)', '0', '1584078496', '。', '18618404746', '');
INSERT INTO `cy_user_address` VALUES ('711', '50', '四川省', '成都市', '武侯区', '天府二街269号', '0', '1584078586', '杰', '18383397524', '');
INSERT INTO `cy_user_address` VALUES ('712', '116', null, null, null, '四川省南充市蓬安县锦屏山', '0', '1584079560', '110', '110', '');
INSERT INTO `cy_user_address` VALUES ('713', '116', null, null, null, '四川省南充市蓬安县锦屏山', '0', '1584081642', '110', '110', '');
INSERT INTO `cy_user_address` VALUES ('714', '116', null, null, null, '四川省南充市蓬安县锦屏山', '0', '1584081660', '110', '110', '');
INSERT INTO `cy_user_address` VALUES ('715', '116', null, null, null, '四川省成都市金牛区新泉路33号兴元绿洲(成都市金牛区新泉路33号)', '0', '1584081675', '110', '110', '');
INSERT INTO `cy_user_address` VALUES ('716', '116', null, null, null, '四川省成都市金牛区新泉路33号兴元绿洲(成都市金牛区新泉路33号)', '0', '1584081696', '110', '110', '');
INSERT INTO `cy_user_address` VALUES ('717', '50', null, null, null, '四川省成都市武侯区天府大道北段1700号成都环球中心天堂洲际大饭店', '0', '1584081751', '杰', '18383397524', '');
INSERT INTO `cy_user_address` VALUES ('718', '116', null, null, null, '四川省南充市蓬安县锦屏山', '0', '1584081873', '110', '110', '');
INSERT INTO `cy_user_address` VALUES ('719', '50', null, null, null, '四川省成都市武侯区天府大道北段1700号成都环球中心天堂洲际大饭店', '0', '1584081979', '刘', '18383397542', '');
INSERT INTO `cy_user_address` VALUES ('720', '116', null, null, null, '四川省成都市金牛区新泉路33号兴元绿洲(成都市金牛区新泉路33号)', '0', '1584082093', '11', '11', '');
INSERT INTO `cy_user_address` VALUES ('721', '116', null, null, null, '四川省南充市蓬安县锦屏山', '0', '1584082111', '11', '11', '');
INSERT INTO `cy_user_address` VALUES ('722', '62', '江苏省', '苏州市', '相城区', '澄和路1218号', '1', '1584082309', '乌龙特工', '18912640642', '');
INSERT INTO `cy_user_address` VALUES ('723', '116', '江苏省', '苏州市', '相城区', '阳澄湖东路8号', '0', '1584083511', '123', '123', '');
INSERT INTO `cy_user_address` VALUES ('724', '65', null, null, null, '江苏省泰州市兴化市张广线张广线(泰州市兴化市)', '0', '1584085797', '曹振', '13262862846', '');
INSERT INTO `cy_user_address` VALUES ('725', '65', null, null, null, '江苏省泰州市兴化市张广线张广线(泰州市兴化市)', '0', '1584085820', '曹振', '13262862846', '');
INSERT INTO `cy_user_address` VALUES ('726', '65', null, null, null, '江苏省泰州市兴化市张广线张广线(泰州市兴化市)', '0', '1584085908', '曹振', '13262862846', '');
INSERT INTO `cy_user_address` VALUES ('727', '65', '江苏省', '泰州市', '兴化市', '张广线', '0', '1584085930', '曹振', '13262862846', '');
INSERT INTO `cy_user_address` VALUES ('728', '65', null, null, null, '江苏省盐城市东台市广唐线广唐线(盐城市东台市)', '0', '1584086354', '曹振', '13262862846', '');
INSERT INTO `cy_user_address` VALUES ('729', '65', null, null, null, '江苏省盐城市东台市广唐线广唐线(盐城市东台市)', '0', '1584086378', '曹振', '13262862846', '');
INSERT INTO `cy_user_address` VALUES ('730', '65', null, null, null, '江苏省盐城市东台市广唐线广唐线(盐城市东台市)', '0', '1584086412', '曹振', '13262862846', '');
INSERT INTO `cy_user_address` VALUES ('731', '69', null, null, null, '江苏省泰州市兴化市西戚村(泰州市兴化市)', '0', '1584087868', '曹振', '13262862846', '');
INSERT INTO `cy_user_address` VALUES ('732', '69', null, null, null, '江苏省泰州市兴化市西戚村(泰州市兴化市)', '0', '1584087927', '上班', '13262865846', '');
INSERT INTO `cy_user_address` VALUES ('733', '67', null, null, null, '江苏省泰州市兴化市西戚村(泰州市兴化市)', '0', '1584088009', '操作', '13262862846', '');
INSERT INTO `cy_user_address` VALUES ('734', '65', null, null, null, '江苏省泰州市兴化市西戚村(泰州市兴化市)', '0', '1584088906', '曹振', '13262862846', '');
INSERT INTO `cy_user_address` VALUES ('735', '65', null, null, null, '江苏省泰州市兴化市西戚村(泰州市兴化市)', '0', '1584089014', '曹振', '13262862846', '');
INSERT INTO `cy_user_address` VALUES ('736', '116', null, null, null, '四川省成都市金牛区星汉北路28号金府国际(成都市金牛区金府路777号)', '0', '1584089261', '110', '110', '');
INSERT INTO `cy_user_address` VALUES ('737', '65', null, null, null, '江苏省泰州市兴化市西戚村(泰州市兴化市)', '0', '1584089296', '曹振', '13262862846', '');
INSERT INTO `cy_user_address` VALUES ('738', '59', null, null, null, '四川省成都市金牛区新泉路33号兴元绿洲(成都市金牛区新泉路33号)', '0', '1584089331', '周', '15984817250', '');
INSERT INTO `cy_user_address` VALUES ('739', '69', null, null, null, '江苏省泰州市兴化市西戚村(泰州市兴化市)', '0', '1584089386', '在想', '13262862846', '');
INSERT INTO `cy_user_address` VALUES ('740', '116', null, null, null, '四川省成都市金牛区星汉北路28号爱悦酒店(成都市金牛区星汉北路28号)', '0', '1584090223', '110', '110', '');
INSERT INTO `cy_user_address` VALUES ('741', '65', null, null, null, '江苏省泰州市兴化市西戚村(泰州市兴化市)', '0', '1584090308', '曹振', '13262862846', '');
INSERT INTO `cy_user_address` VALUES ('742', '59', null, null, null, '四川省成都市金牛区新泉路33号兴元绿洲(成都市金牛区新泉路33号)', '0', '1584090314', '周', '15984817250', '');
INSERT INTO `cy_user_address` VALUES ('743', '65', null, null, null, '江苏省泰州市兴化市西戚村(泰州市兴化市)', '0', '1584091370', '曹振', '13262862846', '');
INSERT INTO `cy_user_address` VALUES ('744', '116', null, null, null, '四川省成都市金牛区星汉北路28号爱悦酒店(成都市金牛区星汉北路28号)', '0', '1584091929', '10', '10', '');
INSERT INTO `cy_user_address` VALUES ('745', '65', null, null, null, '江苏省泰州市兴化市西戚村(泰州市兴化市)', '0', '1584091969', '曹振', '13262862846', '');
INSERT INTO `cy_user_address` VALUES ('746', '59', null, null, null, '四川省成都市金牛区新泉路33号兴元绿洲(成都市金牛区新泉路33号)', '0', '1584091983', '周', '15984725636', '');
INSERT INTO `cy_user_address` VALUES ('747', '65', null, null, null, '江苏省泰州市兴化市西戚村(泰州市兴化市)', '0', '1584092594', '曹振', '13262862846', '');
INSERT INTO `cy_user_address` VALUES ('748', '65', null, null, null, '江苏省泰州市兴化市西戚村(泰州市兴化市)', '0', '1584092813', '曹振', '13262862846', '');
INSERT INTO `cy_user_address` VALUES ('749', '69', null, null, null, '江苏省泰州市兴化市西戚村(泰州市兴化市)', '1', '1584093009', '你在', '1346785757', '');
INSERT INTO `cy_user_address` VALUES ('750', '67', null, null, null, '江苏省泰州市兴化市西戚村(泰州市兴化市)', '1', '1584093039', '这些', '13264644', '');
INSERT INTO `cy_user_address` VALUES ('751', '65', null, null, null, '江苏省泰州市兴化市新张线喻垛村(泰州市兴化市)', '0', '1584095568', '我们', '13154548549', '');
INSERT INTO `cy_user_address` VALUES ('752', '65', null, null, null, '江苏省泰州市兴化市新张线喻垛村(泰州市兴化市)', '0', '1584095593', '阿花', '12334545466', '');
INSERT INTO `cy_user_address` VALUES ('753', '65', null, null, null, '江苏省泰州市兴化市新张线新张线(泰州市兴化市)', '0', '1584095711', '睡觉睡觉', '132628484946', '');
INSERT INTO `cy_user_address` VALUES ('754', '65', null, null, null, '江苏省泰州市兴化市西戚村(泰州市兴化市)', '0', '1584106485', '曹振', '13262862846', '');
INSERT INTO `cy_user_address` VALUES ('755', '50', null, null, null, '四川省成都市武侯区武侯祠大街264号武侯区人民政府(武侯祠大街南)', '0', '1584106620', '刘', '18383397521', '');
INSERT INTO `cy_user_address` VALUES ('756', '50', null, null, null, '四川省成都市武侯区武侯祠大街264号武侯区人民政府', '0', '1584106810', '杰', '18383397514', '');
INSERT INTO `cy_user_address` VALUES ('757', '50', null, null, null, '四川省成都市武侯区武侯祠大街264号武侯区人民政府(武侯祠大街南)', '0', '1584107127', '杰', '18383397520', '');
INSERT INTO `cy_user_address` VALUES ('758', '50', null, null, null, '四川省成都市武侯区武侯祠大街264号武侯区人民政府', '1', '1584107246', '就', '18383397520', '');
INSERT INTO `cy_user_address` VALUES ('759', '116', null, null, null, '四川省成都市金牛区新泉路33号兴元绿洲(成都市金牛区新泉路33号)', '0', '1584109953', '110', '110', '');
INSERT INTO `cy_user_address` VALUES ('760', '116', null, null, null, '四川省成都市金牛区新泉路33号兴元绿洲(成都市金牛区新泉路33号)', '0', '1584115186', '110', '110', '');
INSERT INTO `cy_user_address` VALUES ('761', '116', null, null, null, '四川省成都市金牛区新泉路33号兴元绿洲(成都市金牛区新泉路33号)', '0', '1584115214', '110', '110', '');
INSERT INTO `cy_user_address` VALUES ('762', '116', null, null, null, '四川省成都市金牛区新泉路33号兴元绿洲(成都市金牛区新泉路33号)', '0', '1584115336', '118', '110', '');
INSERT INTO `cy_user_address` VALUES ('763', '116', null, null, null, '四川省成都市金牛区新泉路33号兴元绿洲(成都市金牛区新泉路33号)', '0', '1584115349', '110', '110', '');
INSERT INTO `cy_user_address` VALUES ('764', '116', null, null, null, '四川省成都市金牛区新泉路33号兴元绿洲(成都市金牛区新泉路33号)', '0', '1584161469', '110', '110', '');
INSERT INTO `cy_user_address` VALUES ('765', '65', null, null, null, '江苏省泰州市兴化市西戚村(泰州市兴化市)', '0', '1584161525', '曹振', '13262862846', '');
INSERT INTO `cy_user_address` VALUES ('766', '59', null, null, null, '四川省成都市金牛区新泉路33号兴元绿洲(成都市金牛区新泉路33号)', '0', '1584161594', '110', '10', '');
INSERT INTO `cy_user_address` VALUES ('767', '59', null, null, null, '四川省成都市金牛区新泉路33号兴元绿洲(成都市金牛区新泉路33号)', '0', '1584162033', '110', '110', '');
INSERT INTO `cy_user_address` VALUES ('768', '59', null, null, null, '四川省成都市金牛区新泉路33号兴元绿洲(成都市金牛区新泉路33号)', '0', '1584162035', '110', '110', '');
INSERT INTO `cy_user_address` VALUES ('769', '59', null, null, null, '四川省成都市金牛区新泉路33号兴元绿洲(成都市金牛区新泉路33号)', '0', '1584162037', '110', '110', '');
INSERT INTO `cy_user_address` VALUES ('770', '116', null, null, null, '四川省成都市金牛区新泉路33号兴元绿洲(成都市金牛区新泉路33号)', '0', '1584162141', '110', '110', '');
INSERT INTO `cy_user_address` VALUES ('771', '59', null, null, null, '四川省成都市金牛区新泉路33号兴元绿洲(成都市金牛区新泉路33号)', '0', '1584162261', '110', '110', '');
INSERT INTO `cy_user_address` VALUES ('772', '65', null, null, null, '江苏省泰州市兴化市朱家村(泰州市兴化市)', '0', '1584168724', '渣男', '13262832846', '');
INSERT INTO `cy_user_address` VALUES ('773', '116', null, null, null, '四川省成都市金牛区星汉北路28号爱悦酒店(成都市金牛区星汉北路28号)', '1', '1584172523', '110', '10', '');
INSERT INTO `cy_user_address` VALUES ('774', '59', null, null, null, '四川省成都市金牛区金府路799号金府国际(成都市金牛区金府路777号)', '0', '1584172575', '110', '110', '');
INSERT INTO `cy_user_address` VALUES ('775', '65', null, null, null, '江苏省泰州市兴化市西戚村(泰州市兴化市)', '0', '1584172585', '曹振', '13262862846', '');
INSERT INTO `cy_user_address` VALUES ('776', '59', null, null, null, '四川省成都市金牛区金府路799号金府国际(成都市金牛区金府路777号)', '1', '1584172643', '110', '110', '');
INSERT INTO `cy_user_address` VALUES ('777', '65', null, null, null, '江苏省泰州市兴化市西戚村(泰州市兴化市)', '1', '1584173350', '曹振', '13262862846', '');

-- ----------------------------
-- Table structure for cy_user_collect
-- ----------------------------
DROP TABLE IF EXISTS `cy_user_collect`;
CREATE TABLE `cy_user_collect` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `productId` int(11) DEFAULT NULL,
  `createTime` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cy_user_collect
-- ----------------------------
INSERT INTO `cy_user_collect` VALUES ('5', '55', '34', '1583566423');
INSERT INTO `cy_user_collect` VALUES ('6', '550', '34', '1583576901');
INSERT INTO `cy_user_collect` VALUES ('10', '50', '60', '1583577557');
INSERT INTO `cy_user_collect` VALUES ('34', '65', '71', '1583925223');

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
  `endTime` int(11) DEFAULT NULL COMMENT '有效时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=289 DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='用户使用优惠卷';

-- ----------------------------
-- Records of cy_user_coupon
-- ----------------------------
INSERT INTO `cy_user_coupon` VALUES ('167', '76', '12', null, '1581761009', '0', null);
INSERT INTO `cy_user_coupon` VALUES ('168', '77', '12', null, '1581784106', '0', null);
INSERT INTO `cy_user_coupon` VALUES ('169', '78', '12', null, '1581836179', '0', null);
INSERT INTO `cy_user_coupon` VALUES ('170', '79', '12', null, '1581860674', '0', null);
INSERT INTO `cy_user_coupon` VALUES ('171', '80', '12', null, '1581908657', '0', null);
INSERT INTO `cy_user_coupon` VALUES ('172', '81', '12', null, '1581924156', '0', null);
INSERT INTO `cy_user_coupon` VALUES ('173', '82', '12', null, '1581924337', '0', null);
INSERT INTO `cy_user_coupon` VALUES ('174', '83', '12', null, '1581924801', '0', null);
INSERT INTO `cy_user_coupon` VALUES ('175', '84', '12', null, '1581954488', '0', null);
INSERT INTO `cy_user_coupon` VALUES ('176', '85', '12', null, '1581999540', '0', null);
INSERT INTO `cy_user_coupon` VALUES ('177', '86', '12', null, '1582079620', '0', null);
INSERT INTO `cy_user_coupon` VALUES ('178', '87', '12', null, '1582409950', '0', null);
INSERT INTO `cy_user_coupon` VALUES ('179', '88', '12', null, '1582410207', '0', null);
INSERT INTO `cy_user_coupon` VALUES ('180', '89', '12', null, '1582419105', '0', null);
INSERT INTO `cy_user_coupon` VALUES ('181', '90', '12', null, '1582491709', '0', null);
INSERT INTO `cy_user_coupon` VALUES ('182', '91', '12', null, '1582495494', '0', null);
INSERT INTO `cy_user_coupon` VALUES ('183', '92', '12', null, '1582522363', '0', null);
INSERT INTO `cy_user_coupon` VALUES ('184', '93', '12', null, '1582535020', '0', null);
INSERT INTO `cy_user_coupon` VALUES ('185', '94', '12', null, '1582550234', '0', null);
INSERT INTO `cy_user_coupon` VALUES ('186', '95', '12', null, '1582562458', '0', null);
INSERT INTO `cy_user_coupon` VALUES ('187', '96', '12', null, '1582562935', '0', null);
INSERT INTO `cy_user_coupon` VALUES ('188', '97', '12', null, '1582569509', '0', null);
INSERT INTO `cy_user_coupon` VALUES ('189', '98', '12', null, '1582582748', '0', null);
INSERT INTO `cy_user_coupon` VALUES ('190', '99', '12', null, '1582608338', '0', null);
INSERT INTO `cy_user_coupon` VALUES ('191', '100', '12', null, '1582654532', '0', null);
INSERT INTO `cy_user_coupon` VALUES ('192', '101', '12', null, '1582665444', '0', null);
INSERT INTO `cy_user_coupon` VALUES ('193', '102', '12', null, '1582668310', '0', null);
INSERT INTO `cy_user_coupon` VALUES ('194', '103', '12', null, '1582699346', '0', null);
INSERT INTO `cy_user_coupon` VALUES ('195', '104', '12', null, '1582707305', '0', null);
INSERT INTO `cy_user_coupon` VALUES ('196', '105', '12', null, '1582712400', '0', null);
INSERT INTO `cy_user_coupon` VALUES ('197', '106', '12', null, '1582759327', '0', null);
INSERT INTO `cy_user_coupon` VALUES ('198', '107', '12', null, '1582768397', '0', null);
INSERT INTO `cy_user_coupon` VALUES ('199', '108', '12', null, '1582769180', '0', null);
INSERT INTO `cy_user_coupon` VALUES ('200', '109', '12', null, '1582770034', '0', null);
INSERT INTO `cy_user_coupon` VALUES ('201', '50', '12', null, '1582771112', '0', null);
INSERT INTO `cy_user_coupon` VALUES ('202', '50', '12', null, '1582771115', '0', null);
INSERT INTO `cy_user_coupon` VALUES ('203', '50', '12', null, '1582771116', '0', null);
INSERT INTO `cy_user_coupon` VALUES ('204', '50', '12', null, '1582771168', '0', null);
INSERT INTO `cy_user_coupon` VALUES ('205', '110', '12', null, '1582778017', '0', null);
INSERT INTO `cy_user_coupon` VALUES ('206', '111', '12', null, '1582787174', '0', null);
INSERT INTO `cy_user_coupon` VALUES ('207', '112', '12', null, '1582788610', '0', null);
INSERT INTO `cy_user_coupon` VALUES ('208', '113', '12', null, '1582789888', '0', null);
INSERT INTO `cy_user_coupon` VALUES ('209', '114', '12', null, '1582804749', '0', null);
INSERT INTO `cy_user_coupon` VALUES ('210', '115', '12', null, '1582810123', '0', null);
INSERT INTO `cy_user_coupon` VALUES ('211', '116', '12', null, '1582812844', '1', null);
INSERT INTO `cy_user_coupon` VALUES ('212', '117', '12', null, '1582814208', '0', null);
INSERT INTO `cy_user_coupon` VALUES ('213', '118', '12', null, '1582817002', '0', null);
INSERT INTO `cy_user_coupon` VALUES ('214', '119', '12', null, '1582817517', '0', null);
INSERT INTO `cy_user_coupon` VALUES ('215', '120', '12', null, '1582835655', '0', null);
INSERT INTO `cy_user_coupon` VALUES ('216', '121', '12', null, '1582836003', '0', null);
INSERT INTO `cy_user_coupon` VALUES ('217', '122', '12', null, '1582838122', '0', null);
INSERT INTO `cy_user_coupon` VALUES ('218', '123', '12', null, '1582845117', '0', null);
INSERT INTO `cy_user_coupon` VALUES ('219', '124', '12', null, '1582845501', '0', null);
INSERT INTO `cy_user_coupon` VALUES ('220', '125', '12', null, '1582862257', '0', null);
INSERT INTO `cy_user_coupon` VALUES ('221', '126', '12', null, '1582919867', '0', null);
INSERT INTO `cy_user_coupon` VALUES ('222', '127', '12', null, '1582928942', '0', null);
INSERT INTO `cy_user_coupon` VALUES ('223', '128', '12', null, '1582929783', '0', null);
INSERT INTO `cy_user_coupon` VALUES ('224', '129', '12', null, '1582940581', '0', null);
INSERT INTO `cy_user_coupon` VALUES ('225', '130', '12', null, '1582946817', '0', null);
INSERT INTO `cy_user_coupon` VALUES ('226', '131', '12', null, '1582948994', '0', null);
INSERT INTO `cy_user_coupon` VALUES ('227', '132', '12', null, '1582950093', '0', null);
INSERT INTO `cy_user_coupon` VALUES ('228', '133', '12', null, '1582994124', '0', null);
INSERT INTO `cy_user_coupon` VALUES ('229', '134', '12', null, '1583013585', '0', null);
INSERT INTO `cy_user_coupon` VALUES ('230', '135', '12', null, '1583014573', '0', null);
INSERT INTO `cy_user_coupon` VALUES ('231', '136', '12', null, '1583035056', '0', null);
INSERT INTO `cy_user_coupon` VALUES ('232', '137', '12', null, '1583035120', '0', null);
INSERT INTO `cy_user_coupon` VALUES ('233', '138', '12', null, '1583035896', '0', null);
INSERT INTO `cy_user_coupon` VALUES ('234', '139', '12', null, '1583048511', '0', null);
INSERT INTO `cy_user_coupon` VALUES ('235', '140', '12', null, '1583074760', '0', null);
INSERT INTO `cy_user_coupon` VALUES ('236', '141', '12', null, '1583202761', '0', null);
INSERT INTO `cy_user_coupon` VALUES ('237', '50', '12', null, '1583247672', '0', null);
INSERT INTO `cy_user_coupon` VALUES ('238', '50', '12', null, '1583247676', '0', null);
INSERT INTO `cy_user_coupon` VALUES ('239', '50', '12', null, '1583247683', '0', null);
INSERT INTO `cy_user_coupon` VALUES ('240', '50', '12', null, '1583247822', '0', null);
INSERT INTO `cy_user_coupon` VALUES ('241', '50', '12', null, '1583248626', '0', null);
INSERT INTO `cy_user_coupon` VALUES ('242', '142', '12', null, '1583252572', '0', null);
INSERT INTO `cy_user_coupon` VALUES ('243', '143', '12', null, '1583261845', '0', null);
INSERT INTO `cy_user_coupon` VALUES ('244', '55', '12', null, '1583288335', '0', '1583893135');
INSERT INTO `cy_user_coupon` VALUES ('249', '50', '12', null, '1583292801', '0', '1583897601');
INSERT INTO `cy_user_coupon` VALUES ('246', '144', '12', null, '1583289209', '0', null);
INSERT INTO `cy_user_coupon` VALUES ('247', '144', '12', null, '1583289223', '0', '1583894023');
INSERT INTO `cy_user_coupon` VALUES ('250', '50', '13', null, '1583292849', '0', '1583897649');
INSERT INTO `cy_user_coupon` VALUES ('251', '50', '12', '3221', '1583306050', '0', null);
INSERT INTO `cy_user_coupon` VALUES ('252', '50', '12', '3222', '1583306092', '0', null);
INSERT INTO `cy_user_coupon` VALUES ('253', '50', '12', '3226', '1583306573', '0', null);
INSERT INTO `cy_user_coupon` VALUES ('254', '50', '12', '3227', '1583306602', '0', null);
INSERT INTO `cy_user_coupon` VALUES ('255', '116', '13', null, '1583307318', '0', '1583912118');
INSERT INTO `cy_user_coupon` VALUES ('256', '116', '12', null, '1583307320', '1', '1583912120');
INSERT INTO `cy_user_coupon` VALUES ('257', '56', '13', null, '1583318799', '0', '1583923599');
INSERT INTO `cy_user_coupon` VALUES ('258', '56', '12', null, '1583318799', '0', '1583923599');
INSERT INTO `cy_user_coupon` VALUES ('259', '52', '13', null, '1583320442', '0', '1583925242');
INSERT INTO `cy_user_coupon` VALUES ('260', '52', '12', null, '1583320442', '0', '1583925242');
INSERT INTO `cy_user_coupon` VALUES ('261', '65', '12', null, '1583324391', '0', '1583929191');
INSERT INTO `cy_user_coupon` VALUES ('262', '65', '13', null, '1583324397', '0', '1583929197');
INSERT INTO `cy_user_coupon` VALUES ('263', '53', '13', null, '1583326420', '0', '1583931220');
INSERT INTO `cy_user_coupon` VALUES ('264', '53', '12', null, '1583326420', '0', '1583931220');
INSERT INTO `cy_user_coupon` VALUES ('265', '145', '12', null, '1583447155', '0', null);
INSERT INTO `cy_user_coupon` VALUES ('266', '145', '12', null, '1583447170', '0', '1584051970');
INSERT INTO `cy_user_coupon` VALUES ('267', '146', '12', null, '1583475189', '0', null);
INSERT INTO `cy_user_coupon` VALUES ('268', '147', '12', null, '1583489646', '0', null);
INSERT INTO `cy_user_coupon` VALUES ('269', '148', '12', null, '1583499188', '0', null);
INSERT INTO `cy_user_coupon` VALUES ('270', '149', '12', null, '1583528671', '0', null);
INSERT INTO `cy_user_coupon` VALUES ('271', '150', '12', null, '1583614368', '0', null);
INSERT INTO `cy_user_coupon` VALUES ('272', '151', '12', null, '1583631996', '0', null);
INSERT INTO `cy_user_coupon` VALUES ('273', '116', '12', '3249', '1583661306', '1', null);
INSERT INTO `cy_user_coupon` VALUES ('274', '152', '12', null, '1583662770', '0', null);
INSERT INTO `cy_user_coupon` VALUES ('275', '153', '12', null, '1583670053', '0', null);
INSERT INTO `cy_user_coupon` VALUES ('276', '154', '12', null, '1583671854', '0', null);
INSERT INTO `cy_user_coupon` VALUES ('277', '155', '12', null, '1583695671', '0', null);
INSERT INTO `cy_user_coupon` VALUES ('278', '156', '12', null, '1583709470', '0', null);
INSERT INTO `cy_user_coupon` VALUES ('279', '157', '12', null, '1583710248', '0', null);
INSERT INTO `cy_user_coupon` VALUES ('280', '158', '12', null, '1583816155', '0', null);
INSERT INTO `cy_user_coupon` VALUES ('281', '158', '12', null, '1583816292', '0', '1584421092');
INSERT INTO `cy_user_coupon` VALUES ('282', '159', '12', null, '1583824023', '0', null);
INSERT INTO `cy_user_coupon` VALUES ('283', '160', '12', null, '1583869058', '0', null);
INSERT INTO `cy_user_coupon` VALUES ('284', '161', '12', null, '1583879132', '0', null);
INSERT INTO `cy_user_coupon` VALUES ('285', '162', '12', null, '1583880612', '0', null);
INSERT INTO `cy_user_coupon` VALUES ('286', '163', '12', null, '1583886682', '0', null);
INSERT INTO `cy_user_coupon` VALUES ('287', '163', '12', null, '1583886697', '0', '1584491497');
INSERT INTO `cy_user_coupon` VALUES ('288', '65', '14', null, '1584093617', '0', '1584266417');

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
  `status` tinyint(1) DEFAULT NULL COMMENT '状态 0-组团中 1-组团成功 2组团失败  -1 退款成功',
  `createTime` int(11) DEFAULT NULL COMMENT '创建时间',
  `finishTime` int(11) DEFAULT NULL COMMENT '组团成功时间',
  `orderId` int(11) DEFAULT NULL COMMENT '对应的订单id',
  `userGroupId` int(11) DEFAULT NULL COMMENT '同一组组团标识   发起人创建组团生成记录的id',
  `catPriceId` int(11) DEFAULT '0' COMMENT '组团分类id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=157 DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='用户组团';

-- ----------------------------
-- Records of cy_user_group
-- ----------------------------
INSERT INTO `cy_user_group` VALUES ('104', '67', '8', '1', '67', '1', '1583909002', '1583909008', '3288', '104', '31');
INSERT INTO `cy_user_group` VALUES ('105', '65', '8', '0', '67', '1', '1583909289', '1583909294', '3289', '104', '31');
INSERT INTO `cy_user_group` VALUES ('106', '69', '8', '0', '67', '1', '1583909355', '1583909361', '3290', '104', '31');
INSERT INTO `cy_user_group` VALUES ('107', '69', '8', '1', '69', '1', '1583909840', '1583909844', '3293', '107', '31');
INSERT INTO `cy_user_group` VALUES ('108', '65', '8', '1', '65', '0', '1583913826', null, '3305', '108', '31');
INSERT INTO `cy_user_group` VALUES ('109', '65', '8', '1', '65', '1', '1583926294', '1583926299', '3316', '109', '31');
INSERT INTO `cy_user_group` VALUES ('110', '67', '8', '0', '65', '1', '1583926703', '1583926708', '3317', '109', '31');
INSERT INTO `cy_user_group` VALUES ('111', '116', '8', '1', '116', '1', '1583996015', '1583996019', '3337', '111', '31');
INSERT INTO `cy_user_group` VALUES ('112', '59', '8', '0', '116', '1', '1583996113', '1583996120', '3338', '111', '31');
INSERT INTO `cy_user_group` VALUES ('113', '55', '8', '0', '116', '1', '1583996181', '1583996188', '3339', '111', '31');
INSERT INTO `cy_user_group` VALUES ('116', '116', '8', '1', '116', '1', '1584077988', '1584077993', '3389', '116', '31');
INSERT INTO `cy_user_group` VALUES ('117', '116', '8', '1', '116', '1', '1584078316', '1584078321', '3390', '117', '31');
INSERT INTO `cy_user_group` VALUES ('118', '59', '8', '0', '116', '1', '1584078496', '1584078502', '3392', '117', '31');
INSERT INTO `cy_user_group` VALUES ('119', '50', '8', '0', '116', '1', '1584078586', '1584078592', '3393', '117', '31');
INSERT INTO `cy_user_group` VALUES ('120', '116', '8', '1', '116', '1', '1584079561', '1584079565', '3394', '120', '31');
INSERT INTO `cy_user_group` VALUES ('121', '116', '8', '1', '116', '0', '1584082093', null, '3396', '121', '31');
INSERT INTO `cy_user_group` VALUES ('122', '116', '8', '1', '116', '1', '1584082111', '1584082117', '3397', '122', '31');
INSERT INTO `cy_user_group` VALUES ('123', '62', '8', '0', '50', '0', '1584082310', null, '3398', '119', '31');
INSERT INTO `cy_user_group` VALUES ('124', '116', '8', '1', '116', '0', '1584083511', null, '3399', '124', '31');
INSERT INTO `cy_user_group` VALUES ('125', '65', '8', '1', '65', '1', '1584086412', '1584086416', '3406', '125', '31');
INSERT INTO `cy_user_group` VALUES ('128', '67', '8', '0', '65', '1', '1584088009', '1584088016', '3409', '125', '31');
INSERT INTO `cy_user_group` VALUES ('127', '69', '8', '0', '65', '1', '1584087928', '1584087933', '3408', '125', '31');
INSERT INTO `cy_user_group` VALUES ('129', '116', '8', '1', '116', '1', '1584089261', '1584089266', '3412', '129', '31');
INSERT INTO `cy_user_group` VALUES ('130', '65', '8', '0', '116', '1', '1584089296', '1584089301', '3413', '129', '31');
INSERT INTO `cy_user_group` VALUES ('131', '59', '8', '0', '116', '1', '1584089331', '1584089338', '3414', '129', '31');
INSERT INTO `cy_user_group` VALUES ('132', '116', '8', '1', '116', '1', '1584090223', '1584090227', '3416', '132', '31');
INSERT INTO `cy_user_group` VALUES ('133', '65', '8', '0', '116', '1', '1584090308', '1584090313', '3417', '132', '31');
INSERT INTO `cy_user_group` VALUES ('134', '59', '8', '0', '116', '1', '1584090314', '1584090321', '3418', '132', '31');
INSERT INTO `cy_user_group` VALUES ('135', '116', '8', '1', '116', '1', '1584091929', '1584091933', '3420', '135', '31');
INSERT INTO `cy_user_group` VALUES ('136', '65', '8', '0', '116', '1', '1584091969', '1584091975', '3421', '135', '31');
INSERT INTO `cy_user_group` VALUES ('137', '59', '8', '0', '116', '1', '1584091983', '1584091989', '3422', '135', '31');
INSERT INTO `cy_user_group` VALUES ('138', '65', '8', '1', '65', '1', '1584092813', '1584092819', '3424', '138', '31');
INSERT INTO `cy_user_group` VALUES ('139', '69', '8', '0', '65', '1', '1584093010', '1584093014', '3425', '138', '31');
INSERT INTO `cy_user_group` VALUES ('140', '67', '8', '0', '65', '1', '1584093039', '1584093044', '3426', '138', '31');
INSERT INTO `cy_user_group` VALUES ('144', '116', '8', '0', '50', '-1', '1584109953', '1584109958', '3435', '119', '31');
INSERT INTO `cy_user_group` VALUES ('145', '116', '8', '1', '116', '0', '1584115336', null, '3438', '145', '31');
INSERT INTO `cy_user_group` VALUES ('146', '116', '8', '1', '116', '1', '1584115349', '1584115354', '3439', '146', '31');
INSERT INTO `cy_user_group` VALUES ('147', '116', '8', '1', '116', '2', '1584161470', '1584161474', '3440', '147', '31');
INSERT INTO `cy_user_group` VALUES ('148', '65', '8', '0', '116', '-1', '1584161526', '1584161530', '3441', '147', '31');
INSERT INTO `cy_user_group` VALUES ('149', '59', '8', '0', '116', '-1', '1584161594', '1584161601', '3442', '147', '31');
INSERT INTO `cy_user_group` VALUES ('150', '116', '8', '0', '65', '1', '1584162142', '1584162146', '3443', '148', '31');
INSERT INTO `cy_user_group` VALUES ('151', '59', '8', '0', '116', '1', '1584162261', '1584162322', '3444', '150', '31');
INSERT INTO `cy_user_group` VALUES ('152', '116', '8', '1', '116', '-1', '1584172523', '1584172527', '3446', '152', '31');
INSERT INTO `cy_user_group` VALUES ('153', '59', '8', '1', '59', '-1', '1584172575', '1584172587', '3447', '153', '31');
INSERT INTO `cy_user_group` VALUES ('154', '65', '8', '0', '116', '1', '1584172586', '1584172590', '3448', '152', '31');
INSERT INTO `cy_user_group` VALUES ('155', '59', '8', '0', '116', '1', '1584172643', '1584172652', '3449', '152', '31');
INSERT INTO `cy_user_group` VALUES ('156', '65', '8', '1', '65', '2', '1584173350', '1584173355', '3450', '156', '31');

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
) ENGINE=MyISAM AUTO_INCREMENT=95 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cy_user_integral
-- ----------------------------
INSERT INTO `cy_user_integral` VALUES ('36', '51', '1', '会员特权：购买商品赠送', '1579595169', '2');
INSERT INTO `cy_user_integral` VALUES ('37', '69', '1', '会员特权：购买商品赠送', '1580956475', '2');
INSERT INTO `cy_user_integral` VALUES ('38', '65', '2', '会员特权：购买商品赠送', '1581524491', '2');
INSERT INTO `cy_user_integral` VALUES ('39', '69', '2', '会员特权：购买商品赠送', '1581526634', '2');
INSERT INTO `cy_user_integral` VALUES ('40', '65', '2', '会员特权：购买商品赠送', '1581526639', '2');
INSERT INTO `cy_user_integral` VALUES ('41', '59', '2', '会员特权：购买商品赠送', '1581526647', '2');
INSERT INTO `cy_user_integral` VALUES ('42', '59', '2', '会员特权：购买商品赠送', '1581526654', '2');
INSERT INTO `cy_user_integral` VALUES ('43', '51', '2', '会员特权：购买商品赠送', '1581526666', '2');
INSERT INTO `cy_user_integral` VALUES ('44', '65', '1', '会员特权：购买商品赠送', '1582723177', '2');
INSERT INTO `cy_user_integral` VALUES ('45', '50', '50', '积分兑换优惠卷', '1582771112', '1');
INSERT INTO `cy_user_integral` VALUES ('46', '50', '50', '积分兑换优惠卷', '1582771115', '1');
INSERT INTO `cy_user_integral` VALUES ('47', '50', '50', '积分兑换优惠卷', '1582771116', '1');
INSERT INTO `cy_user_integral` VALUES ('48', '50', '50', '积分兑换优惠卷', '1582771168', '1');
INSERT INTO `cy_user_integral` VALUES ('49', '65', '1', '会员特权：购买商品赠送', '1583244489', '2');
INSERT INTO `cy_user_integral` VALUES ('50', '50', '50', '积分兑换优惠卷', '1583247672', '1');
INSERT INTO `cy_user_integral` VALUES ('51', '50', '50', '积分兑换优惠卷', '1583247676', '1');
INSERT INTO `cy_user_integral` VALUES ('52', '50', '50', '积分兑换优惠卷', '1583247683', '1');
INSERT INTO `cy_user_integral` VALUES ('53', '50', '50', '积分兑换优惠卷', '1583247822', '1');
INSERT INTO `cy_user_integral` VALUES ('54', '50', '50', '积分兑换优惠卷', '1583248626', '1');
INSERT INTO `cy_user_integral` VALUES ('55', '69', '3', '商品购买抵扣', '1583326653', '1');
INSERT INTO `cy_user_integral` VALUES ('56', '69', '1', '会员特权：购买商品赠送', '1583326689', '2');
INSERT INTO `cy_user_integral` VALUES ('57', '65', '1', '会员特权：购买商品赠送', '1583481430', '2');
INSERT INTO `cy_user_integral` VALUES ('58', '69', '1', '会员特权：购买商品赠送', '1583484249', '2');
INSERT INTO `cy_user_integral` VALUES ('59', '65', '1', '会员特权：购买商品赠送', '1583490989', '2');
INSERT INTO `cy_user_integral` VALUES ('60', '116', '1', '会员特权：购买商品赠送', '1583746269', '2');
INSERT INTO `cy_user_integral` VALUES ('61', '67', '1', '会员特权：购买商品赠送', '1583908744', '2');
INSERT INTO `cy_user_integral` VALUES ('62', '69', '2', '会员特权：购买商品赠送', '1583909433', '2');
INSERT INTO `cy_user_integral` VALUES ('63', '65', '2', '会员特权：购买商品赠送', '1583909442', '2');
INSERT INTO `cy_user_integral` VALUES ('64', '67', '2', '会员特权：购买商品赠送', '1583909447', '2');
INSERT INTO `cy_user_integral` VALUES ('65', '67', '2', '会员特权：购买商品赠送', '1583926767', '2');
INSERT INTO `cy_user_integral` VALUES ('66', '65', '1', '会员特权：购买商品赠送', '1583926781', '2');
INSERT INTO `cy_user_integral` VALUES ('67', '69', '1', '会员特权：购买商品赠送', '1583927675', '2');
INSERT INTO `cy_user_integral` VALUES ('68', '69', '1', '会员特权：购买商品赠送', '1583927831', '2');
INSERT INTO `cy_user_integral` VALUES ('69', '55', '2', '会员特权：购买商品赠送', '1583996311', '2');
INSERT INTO `cy_user_integral` VALUES ('70', '116', '2', '会员特权：购买商品赠送', '1583996317', '2');
INSERT INTO `cy_user_integral` VALUES ('71', '59', '2', '会员特权：购买商品赠送', '1583996323', '2');
INSERT INTO `cy_user_integral` VALUES ('72', '50', '2', '会员特权：购买商品赠送', '1584078669', '2');
INSERT INTO `cy_user_integral` VALUES ('73', '116', '2', '会员特权：购买商品赠送', '1584078675', '2');
INSERT INTO `cy_user_integral` VALUES ('74', '59', '2', '会员特权：购买商品赠送', '1584078683', '2');
INSERT INTO `cy_user_integral` VALUES ('75', '116', '2', '会员特权：购买商品赠送', '1584078690', '2');
INSERT INTO `cy_user_integral` VALUES ('76', '116', '1', '会员特权：购买商品赠送', '1584078695', '2');
INSERT INTO `cy_user_integral` VALUES ('77', '69', '1', '会员特权：购买商品赠送', '1584089421', '2');
INSERT INTO `cy_user_integral` VALUES ('78', '65', '1', '邀请奖励：对方购买商品你获取比例积分', '1584089421', '2');
INSERT INTO `cy_user_integral` VALUES ('79', '59', '2', '会员特权：购买商品赠送', '1584089455', '2');
INSERT INTO `cy_user_integral` VALUES ('80', '65', '2', '会员特权：购买商品赠送', '1584089460', '2');
INSERT INTO `cy_user_integral` VALUES ('81', '116', '2', '会员特权：购买商品赠送', '1584089466', '2');
INSERT INTO `cy_user_integral` VALUES ('82', '69', '2', '会员特权：购买商品赠送', '1584089634', '2');
INSERT INTO `cy_user_integral` VALUES ('83', '65', '2', '邀请奖励：对方购买商品你获取比例积分', '1584089634', '2');
INSERT INTO `cy_user_integral` VALUES ('84', '59', '2', '会员特权：购买商品赠送', '1584090408', '2');
INSERT INTO `cy_user_integral` VALUES ('85', '65', '2', '会员特权：购买商品赠送', '1584090414', '2');
INSERT INTO `cy_user_integral` VALUES ('86', '116', '2', '会员特权：购买商品赠送', '1584090421', '2');
INSERT INTO `cy_user_integral` VALUES ('87', '65', '1', '会员特权：购买商品赠送', '1584091398', '2');
INSERT INTO `cy_user_integral` VALUES ('88', '59', '2', '会员特权：购买商品赠送', '1584092052', '2');
INSERT INTO `cy_user_integral` VALUES ('89', '116', '2', '会员特权：购买商品赠送', '1584092057', '2');
INSERT INTO `cy_user_integral` VALUES ('90', '65', '2', '会员特权：购买商品赠送', '1584092063', '2');
INSERT INTO `cy_user_integral` VALUES ('91', '69', '2', '会员特权：购买商品赠送', '1584093295', '2');
INSERT INTO `cy_user_integral` VALUES ('92', '65', '2', '邀请奖励：对方购买商品你获取比例积分', '1584093295', '2');
INSERT INTO `cy_user_integral` VALUES ('93', '65', '1', '会员特权：购买商品赠送', '1584104703', '2');
INSERT INTO `cy_user_integral` VALUES ('94', '65', '24', '商品购买抵扣', '1584106490', '1');

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
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='内容提交 反馈';

-- ----------------------------
-- Records of cy_user_push
-- ----------------------------
INSERT INTO `cy_user_push` VALUES ('10', '52', 'JpJ0teiq', '1580644213', '1', 's:0:\"\";');
INSERT INTO `cy_user_push` VALUES ('11', '56', '0fASIxWS', '1581859580', '1', 's:0:\"\";');
INSERT INTO `cy_user_push` VALUES ('12', '70', 'Joe9RFim', '1582465292', '1', 's:0:\"\";');
INSERT INTO `cy_user_push` VALUES ('13', '70', '89NhLhRT', '1582465557', '1', 's:0:\"\";');
INSERT INTO `cy_user_push` VALUES ('14', '65', '啊啊啊啊啊\n', '1583151094', '1', 's:0:\"\";');
INSERT INTO `cy_user_push` VALUES ('15', '71', 'upArJtqE', '1583619221', '1', 's:0:\"\";');
INSERT INTO `cy_user_push` VALUES ('16', '71', 'yvlvI0nc', '1583619503', '1', 's:0:\"\";');
INSERT INTO `cy_user_push` VALUES ('17', '53', 'O6ocVIkY', '1584225019', '1', 's:0:\"\";');
INSERT INTO `cy_user_push` VALUES ('18', '53', 'O6ocVIkY', '1584225308', '1', 's:0:\"\";');
