/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : renma

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2019-12-25 14:53:57
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
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='广告内容';

-- ----------------------------
-- Records of cy_advert
-- ----------------------------
INSERT INTO `cy_advert` VALUES ('2', '2', '/pages/goodsinfo/index?id=1', 'https://lck.hzlyzhenzhi.com/files/attach/file/20191217/1576549399123049.mp4', '1', '1576549404', '三生三世', '8');
INSERT INTO `cy_advert` VALUES ('3', '1', '/pages/goodsinfo/index?id=1', 'https://lck.hzlyzhenzhi.com/files/attach/file/20191211/1576073586892436.png', '1', '1576073594', '三生三世2', '9');

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
) ENGINE=MyISAM AUTO_INCREMENT=43 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='目录结构表';

-- ----------------------------
-- Records of cy_catalog
-- ----------------------------
INSERT INTO `cy_catalog` VALUES ('1', '权限功能', '0', '1561365326', 'rule', '9', '1');
INSERT INTO `cy_catalog` VALUES ('2', '角色', '1', '1561365326', 'role', '7', '1');
INSERT INTO `cy_catalog` VALUES ('3', '目录功能', '1', '1561365326', 'catalog', '4', '1');
INSERT INTO `cy_catalog` VALUES ('4', '用户模块', '0', '2019', 'member', '4', '1');
INSERT INTO `cy_catalog` VALUES ('5', '订单模块', '0', '1561445961', 'order', '3', '1');
INSERT INTO `cy_catalog` VALUES ('6', '商品模块', '0', '1561446136', 'product', '3', '1');
INSERT INTO `cy_catalog` VALUES ('13', '店铺模块', '0', '1561452444', 'shop', '2', '1');
INSERT INTO `cy_catalog` VALUES ('19', '优惠券', '15', '1572834451', 'coupon', '0', '1');
INSERT INTO `cy_catalog` VALUES ('15', '内容模块', '0', '1572588811', 'content', '8', '1');
INSERT INTO `cy_catalog` VALUES ('16', '首页logo', '15', '1572588862', 'logo-content', '0', '1');
INSERT INTO `cy_catalog` VALUES ('17', '广告内容', '15', '1572588922', 'advert', '0', '1');
INSERT INTO `cy_catalog` VALUES ('18', '商品分类', '15', '1572589268', 'category', '9', '1');
INSERT INTO `cy_catalog` VALUES ('20', '店铺信息', '13', '1572837153', 'shop-success', '0', '1');
INSERT INTO `cy_catalog` VALUES ('21', '店铺审核', '13', '1572837178', 'shop-check', '0', '1');
INSERT INTO `cy_catalog` VALUES ('22', '优选商品', '15', '1572855506', 'good-product', '0', '1');
INSERT INTO `cy_catalog` VALUES ('23', '商品信息', '6', '1572867332', 'product-list', '0', '1');
INSERT INTO `cy_catalog` VALUES ('24', '商品组团', '6', '1572868884', 'product-group', '0', '1');
INSERT INTO `cy_catalog` VALUES ('25', '订单信息', '5', '1572868910', 'order-list', '0', '1');
INSERT INTO `cy_catalog` VALUES ('26', '组团信息', '4', '1572868997', 'group-list', '0', '1');
INSERT INTO `cy_catalog` VALUES ('27', '用户信息', '4', '1572869020', 'user-list', '0', '1');
INSERT INTO `cy_catalog` VALUES ('28', '优惠券使用', '4', '1572869050', 'coupon-use', '0', '1');
INSERT INTO `cy_catalog` VALUES ('29', '用户地址', '4', '1572869097', 'user-address', '0', '1');
INSERT INTO `cy_catalog` VALUES ('30', '订单物流', '5', '1572869144', 'order-logistics', '0', '1');
INSERT INTO `cy_catalog` VALUES ('31', '用户分享', '4', '1572869185', 'user-share', '0', '1');
INSERT INTO `cy_catalog` VALUES ('32', '质保商品', '5', '1572869254', 'quality-product', '0', '1');
INSERT INTO `cy_catalog` VALUES ('33', '关于我们', '15', '1572869306', 'about-us', '0', '1');
INSERT INTO `cy_catalog` VALUES ('34', '用户反馈', '4', '1572869334', 'user-feedback', '0', '1');
INSERT INTO `cy_catalog` VALUES ('35', '用户购物车', '4', '1572869476', 'user-shop-cart', '0', '1');
INSERT INTO `cy_catalog` VALUES ('36', '客服联系', '15', '1574151575', 'service', '0', '1');
INSERT INTO `cy_catalog` VALUES ('37', '会员充值', '15', '1574151614', 'member-remark', '0', '1');
INSERT INTO `cy_catalog` VALUES ('38', '积分规则', '15', '1575534323', 'integral-rule', '0', '1');
INSERT INTO `cy_catalog` VALUES ('39', '会员优惠说明', '15', '1576658036', 'member-desc', '0', '1');
INSERT INTO `cy_catalog` VALUES ('40', '维修师审核', '4', '1576658251', 'repair-check', '0', '1');
INSERT INTO `cy_catalog` VALUES ('42', '订单售后', '5', '1576916677', 'order-after', '0', '1');

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
) ENGINE=MyISAM AUTO_INCREMENT=53 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='问题类型分类  两级';

-- ----------------------------
-- Records of cy_category
-- ----------------------------
INSERT INTO `cy_category` VALUES ('50', '0', '零件', '3', '1572598507');
INSERT INTO `cy_category` VALUES ('52', '50', '千斤顶', '2', '1572598706');

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
INSERT INTO `cy_coupon` VALUES ('1', 'fefed', '30', '60', '1000', '1572836975', '');
INSERT INTO `cy_coupon` VALUES ('2', '测试', '100', '180', '1000', '1572837032', '优惠券 消费金额慢180才能使用');
INSERT INTO `cy_coupon` VALUES ('3', '优惠', '5', '25', '500', '1573892354', null);
INSERT INTO `cy_coupon` VALUES ('4', '优惠2', '12', '50', '700', '1578765123', null);
INSERT INTO `cy_coupon` VALUES ('5', '减5', '5', '10', '300', '2147483647', '满10减5');
INSERT INTO `cy_coupon` VALUES ('6', '减5q', '5', '10', '300', '2147483647', '满10减5');
INSERT INTO `cy_coupon` VALUES ('7', '减5w', '5', '10', '300', '2147483647', '满10减5');
INSERT INTO `cy_coupon` VALUES ('8', '减5e', '5', '10', '300', '2147483647', '满10减5');
INSERT INTO `cy_coupon` VALUES ('9', '减5r', '5', '10', '300', '2147483647', '满10减5');
INSERT INTO `cy_coupon` VALUES ('10', '减5t', '5', '10', '300', '2147483647', '满10减5');
INSERT INTO `cy_coupon` VALUES ('11', '减5y', '5', '10', '300', '2147483647', '满10减5');

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
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='优选商品';

-- ----------------------------
-- Records of cy_good_product
-- ----------------------------
INSERT INTO `cy_good_product` VALUES ('1', '3', '8', '1587654321');
INSERT INTO `cy_good_product` VALUES ('2', '2', '5', '1587654321');
INSERT INTO `cy_good_product` VALUES ('3', '4', '9', '1587654321');

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
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='组团商品';

-- ----------------------------
-- Records of cy_group_product
-- ----------------------------
INSERT INTO `cy_group_product` VALUES ('1', '1', '4', '1.00', '四人组团 优惠多多', '1576549049', '9', '1');
INSERT INTO `cy_group_product` VALUES ('2', '2', '4', '1.00', '组团更多优惠', '1576549219', '12', '1');
INSERT INTO `cy_group_product` VALUES ('3', '3', '4', '0.01', '组团购买 优惠大', '1576549265', '13', '1');

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
INSERT INTO `cy_logo` VALUES ('1', 'ffff', '1572590265', '0');
INSERT INTO `cy_logo` VALUES ('2', 'fsdfdsfdscsxcc是否第三十', '1572590323', '0');
INSERT INTO `cy_logo` VALUES ('3', '是才呈现出', '1572590389', '0');
INSERT INTO `cy_logo` VALUES ('4', '是才呈现出', '1572590445', '0');
INSERT INTO `cy_logo` VALUES ('5', '是才呈现出的', '1572590537', '1');

-- ----------------------------
-- Table structure for cy_member
-- ----------------------------
DROP TABLE IF EXISTS `cy_member`;
CREATE TABLE `cy_member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nickname` varchar(40) DEFAULT NULL COMMENT '昵称',
  `name` varchar(40) DEFAULT NULL COMMENT '姓名',
  `avatar` varchar(70) DEFAULT NULL COMMENT '头像地址',
  `sex` tinyint(1) NOT NULL DEFAULT '0' COMMENT '性别 1-男 2-女',
  `birthday` char(12) DEFAULT NULL COMMENT '生日',
  `work` char(20) DEFAULT NULL COMMENT '职业',
  `phone` char(12) DEFAULT NULL COMMENT '电话',
  `identity` char(19) DEFAULT NULL COMMENT '身份证',
  `integral` int(6) DEFAULT NULL COMMENT '积分',
  `member` tinyint(1) DEFAULT '0' COMMENT '会员状态 1-是 0-不是',
  `memberTime` int(11) DEFAULT NULL COMMENT '成为会员的时间',
  `inviteCode` char(8) DEFAULT NULL COMMENT '邀请码',
  `inviterCode` char(8) DEFAULT NULL COMMENT '邀请人的邀请码',
  `createTime` int(11) DEFAULT NULL COMMENT '创建时间',
  `openId` varchar(50) DEFAULT NULL COMMENT '用户微信账号的openId',
  `province` varchar(40) DEFAULT NULL COMMENT '省',
  `city` varchar(40) DEFAULT NULL COMMENT '市',
  `area` varchar(50) DEFAULT NULL COMMENT '地区',
  `password` varchar(80) DEFAULT NULL COMMENT '密码',
  `memberLevel` tinyint(1) DEFAULT NULL,
  `repair` tinyint(1) DEFAULT '0' COMMENT '维修师身份  0-不是 1-是 -1 审核中',
  `repairName` varchar(255) DEFAULT NULL COMMENT '维修师姓名',
  `repairPhone` char(12) DEFAULT NULL COMMENT '维修师电话',
  `repairMoney` decimal(10,2) DEFAULT '0.00' COMMENT '会员维修师金额',
  `repairTotalMoney` decimal(10,2) DEFAULT '0.00' COMMENT '总金额',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户信息';

-- ----------------------------
-- Records of cy_member
-- ----------------------------
INSERT INTO `cy_member` VALUES ('1', 'oathYc', '1111', '50', '0', null, null, null, null, '24', '1', null, 'ddDCSDF5', null, null, null, null, null, null, 'e10adc3949ba59abbe56e057f20f883e', null, '1', '去去去', '15828043607', '0.00', '0.00');
INSERT INTO `cy_member` VALUES ('2', 'oathYc2', 'cy2', '', '1', '', '', '12345678987', '', null, '0', null, 'ddDCSDFT', 'ddDCSDF5', null, '', '', '', '', 'e10adc3949ba59abbe56e057f20f883e', null, '0', null, null, '0.00', '0.00');
INSERT INTO `cy_member` VALUES ('32', '谨严', null, 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eqSCmBAfiaH7zgG69aPRaCIicTqi', '0', null, null, null, null, null, '0', null, 'L76GEI5O', null, '1576136839', 'oAi5t5V4uqDkEHzsfpnDLOq2H65o', 'Shanghai', 'Baoshan', 'China', null, null, '0', null, null, '0.00', '0.00');
INSERT INTO `cy_member` VALUES ('31', '刘海威', null, 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIhdUPEzoVqBTFvcQOp8Ricr6BLI', '0', null, null, null, null, '100', '1', null, 'WXO9D3IN', null, '1575650915', 'oAi5t5YhsSSLaPXNWar9WGhjxIZQ', 'Sichuan', 'Yaan', 'China', null, null, '0', null, null, '0.00', '0.00');
INSERT INTO `cy_member` VALUES ('30', 'zoz', null, 'https://wx.qlogo.cn/mmopen/vi_32/qvGwCZSz78T0hUben8dNlAD5QISX943jqYmqd', '0', null, null, null, null, '300', '1', null, 'EZMCZRBK', null, '1575648439', 'oAi5t5fPyFny93R7iP44EDYCBZ8I', 'Sichuan', 'Nanchong', 'China', null, null, '0', null, null, '0.00', '0.00');
INSERT INTO `cy_member` VALUES ('28', '曹二振宇车行', null, 'https://wx.qlogo.cn/mmopen/vi_32/6ddU5Tfuu4bZLx7XfJKDY2GR3LA6mmOCXZCwt', '0', null, null, null, null, null, '1', null, '4MMLK9L2', null, '1575434837', 'oAi5t5Rb9TSFmCmm51D-v2XSBkdQ', '', '', '', null, null, '-1', '122388383838', '122388383838', '0.00', '0.00');
INSERT INTO `cy_member` VALUES ('27', '镜月圆', null, 'https://wx.qlogo.cn/mmopen/vi_32/QQicqq0Cy6pIKFibIZRDclCS4KfDCnWfmxCx0', '0', null, null, null, null, null, '0', null, 'J8IPHG1A', null, '1575355153', 'oAi5t5YwP2QSKNan4bK1c4EoGyi8', 'Sichuan', 'Chengdu', 'China', null, null, '0', null, null, '0.00', '0.00');
INSERT INTO `cy_member` VALUES ('29', 'A     团子', '', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJ07KNR7tkiadeqoUYYBTAUibeQ5', '0', '', '', '', '', '400', '1', null, '7UVO875O', null, '1575609233', 'oAi5t5baGu0TZ5n0UWglpJEthmS0', 'Shanghai', 'Baoshan', 'China', null, null, '-1', '13262862846', '13262862846', '0.00', '0.00');
INSERT INTO `cy_member` VALUES ('26', 'just', '10', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKgJqcLv9icYYQkAX9Kx01icCgc6', '0', '19', '', '', '', '102', '1', null, 'KOO9SK7O', null, '1575347823', 'oAi5t5YLgo6T9Wu6lCLJ3Y8da-Zs', 'Sichuan', 'Chengdu', 'China', null, null, '1', '1', '1', '0.00', '0.00');
INSERT INTO `cy_member` VALUES ('25', 'い烬', null, 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLq8ERSl7Z2EsIVpEe69xY7fr0ic', '0', null, null, null, null, '998600', '1', null, 'OQQ8GMYT', null, '1575268587', 'oAi5t5bJ9pwX_Nc7C5skWtVJkygg', 'Sichuan', 'Nanchong', 'China', null, null, '0', null, null, '0.00', '0.00');
INSERT INTO `cy_member` VALUES ('33', 'Jeckson李', '1111111', 'https://wx.qlogo.cn/mmopen/vi_32/fCtPKN2Xxv483FNS6wqib9HbwdcmbkJWI8R8U', '0', '4444', '学生', '111111111111', '1111111111111', '0', '1', null, 'RN5NZKBT', null, '1576555091', 'oAi5t5Q6XIESpq8wypzG5sVZOAG0', '', '', 'Ecuador', null, null, '-1', '1111111', '1111111', '0.00', '0.00');
INSERT INTO `cy_member` VALUES ('34', '爱吃小鱼干', 'xx', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKFoeclhwwzMAcDFwB2QZH18fMLg', '0', 'xxxxxx', 'ddadw', '13698744789', '510251125514752', null, '1', null, 'OPPSQCSH', null, '1576562472', 'oAi5t5U5Im-gDD6Hs1gm7Pmnzu48', '', '', 'Andorra', null, null, '-1', '13667899876', '13667899876', '0.00', '0.00');
INSERT INTO `cy_member` VALUES ('35', '有成', null, 'https://wx.qlogo.cn/mmopen/vi_32/RuMqzS6wUjNiaODN5QeicdFaLVC0uPt0AGdM1', '0', null, null, null, null, '0', '1', null, 'SLO72CKO', null, '1576583138', 'oAi5t5dS8_IWd6LhV-CC1FTovA18', 'Chongqing', 'Jiulongpo', 'China', null, null, '-1', '18723470002', '18723470002', '0.00', '0.00');
INSERT INTO `cy_member` VALUES ('36', '', null, 'https://wx.qlogo.cn/mmopen/vi_32/1ZWialr0ic85ewZ32mmYicGedjYhbB9ricKrx', '0', null, null, null, null, '76002', '1', null, '3R1086EO', null, '1577111340', 'oAi5t5VCSbUdJDYTubOiAULhwiEg', 'Guangdong', 'Jieyang', 'China', null, '3', '1', '18666556566', '18666556566', '55.00', '100.00');

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
) ENGINE=MyISAM AUTO_INCREMENT=109 DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='成员开通会员记录';

-- ----------------------------
-- Records of cy_member_log
-- ----------------------------
INSERT INTO `cy_member_log` VALUES ('1', '25', '1575216000', '31104000', '1575285649', '30');
INSERT INTO `cy_member_log` VALUES ('2', '25', '1575302400', '31104000', '1575347563', '64');
INSERT INTO `cy_member_log` VALUES ('3', '25', '1575302400', '31104000', '1575349466', '65');
INSERT INTO `cy_member_log` VALUES ('4', '25', '1575302400', '31104000', '1575354261', '69');
INSERT INTO `cy_member_log` VALUES ('5', '25', '1575302400', '31104000', '1575355062', '70');
INSERT INTO `cy_member_log` VALUES ('6', '25', '1575302400', '31104000', '1575355069', '71');
INSERT INTO `cy_member_log` VALUES ('7', '26', '1575302400', '31104000', '1575378180', '72');
INSERT INTO `cy_member_log` VALUES ('8', '26', '1575302400', '31104000', '1575378189', '73');
INSERT INTO `cy_member_log` VALUES ('9', '26', '1575302400', '31104000', '1575378848', '74');
INSERT INTO `cy_member_log` VALUES ('10', '26', '1575302400', '31104000', '1575381473', '76');
INSERT INTO `cy_member_log` VALUES ('11', '26', '1575302400', '31104000', '1575381475', '77');
INSERT INTO `cy_member_log` VALUES ('12', '28', '1575388800', '31104000', '1575434857', '78');
INSERT INTO `cy_member_log` VALUES ('13', '28', '1575388800', '31104000', '1575434858', '79');
INSERT INTO `cy_member_log` VALUES ('14', '28', '1575388800', '31104000', '1575434868', '80');
INSERT INTO `cy_member_log` VALUES ('15', '28', '1575388800', '31104000', '1575434881', '81');
INSERT INTO `cy_member_log` VALUES ('16', '28', '1575388800', '31104000', '1575434998', '82');
INSERT INTO `cy_member_log` VALUES ('17', '28', '1575388800', '31104000', '1575438429', '83');
INSERT INTO `cy_member_log` VALUES ('18', '28', '1575388800', '31104000', '1575438475', '84');
INSERT INTO `cy_member_log` VALUES ('19', '26', '1575388800', '31104000', '1575445888', '85');
INSERT INTO `cy_member_log` VALUES ('20', '26', '1575388800', '31104000', '1575445890', '86');
INSERT INTO `cy_member_log` VALUES ('21', '26', '1575388800', '31104000', '1575445890', '87');
INSERT INTO `cy_member_log` VALUES ('22', '26', '1575388800', '31104000', '1575445920', '88');
INSERT INTO `cy_member_log` VALUES ('23', '25', '1575388800', '31104000', '1575454230', '89');
INSERT INTO `cy_member_log` VALUES ('24', '25', '1575388800', '31104000', '1575454231', '90');
INSERT INTO `cy_member_log` VALUES ('25', '25', '1575475200', '31104000', '1575550106', '92');
INSERT INTO `cy_member_log` VALUES ('26', '25', '1575475200', '31104000', '1575550636', '93');
INSERT INTO `cy_member_log` VALUES ('27', '25', '1575475200', '2592000', '1575553288', '94');
INSERT INTO `cy_member_log` VALUES ('28', '29', '1575561600', '31104000', '1575609372', '102');
INSERT INTO `cy_member_log` VALUES ('29', '29', '1575561600', '31104000', '1575609374', '103');
INSERT INTO `cy_member_log` VALUES ('30', '29', '1575561600', '7776000', '1575609378', '104');
INSERT INTO `cy_member_log` VALUES ('31', '25', '1575590400', '31104000', '1575637016', '107');
INSERT INTO `cy_member_log` VALUES ('32', '29', '1575590400', '28512000', '1575653500', '108');
INSERT INTO `cy_member_log` VALUES ('33', '29', '1575590400', '28512000', '1575653501', '109');
INSERT INTO `cy_member_log` VALUES ('34', '29', '1575590400', '28512000', '1575653506', '110');
INSERT INTO `cy_member_log` VALUES ('35', '29', '1575590400', '28512000', '1575655396', '111');
INSERT INTO `cy_member_log` VALUES ('36', '25', '1575676800', '31104000', '1575691182', '121');
INSERT INTO `cy_member_log` VALUES ('37', '25', '1575648000', '28512000', '1575708920', '125');
INSERT INTO `cy_member_log` VALUES ('38', '30', '1575648000', '28512000', '1575714294', '126');
INSERT INTO `cy_member_log` VALUES ('39', '30', '1575648000', '28512000', '1575714296', '127');
INSERT INTO `cy_member_log` VALUES ('40', '30', '1575648000', '28512000', '1575714297', '128');
INSERT INTO `cy_member_log` VALUES ('41', '30', '1575648000', '28512000', '1575714298', '129');
INSERT INTO `cy_member_log` VALUES ('42', '29', '1575734400', '7776000', '1575817925', '132');
INSERT INTO `cy_member_log` VALUES ('43', '31', '1575820800', '7776000', '1575872636', '133');
INSERT INTO `cy_member_log` VALUES ('44', '31', '1575820800', '31104000', '1575872638', '134');
INSERT INTO `cy_member_log` VALUES ('45', '31', '1575820800', '7776000', '1575872642', '135');
INSERT INTO `cy_member_log` VALUES ('46', '31', '1575820800', '28512000', '1575872647', '136');
INSERT INTO `cy_member_log` VALUES ('47', '30', '1575907200', '28512000', '1575959170', '147');
INSERT INTO `cy_member_log` VALUES ('48', '25', '1575993600', '31104000', '1576030133', '148');
INSERT INTO `cy_member_log` VALUES ('49', '25', '1575993600', '31104000', '1576030140', '149');
INSERT INTO `cy_member_log` VALUES ('50', '25', '1575993600', '31104000', '1576030141', '150');
INSERT INTO `cy_member_log` VALUES ('51', '25', '1575993600', '31104000', '1576030432', '151');
INSERT INTO `cy_member_log` VALUES ('52', '25', '1575993600', '31104000', '1576030432', '152');
INSERT INTO `cy_member_log` VALUES ('53', '25', '1575993600', '31104000', '1576030690', '153');
INSERT INTO `cy_member_log` VALUES ('54', '25', '1575993600', '31104000', '1576030740', '154');
INSERT INTO `cy_member_log` VALUES ('55', '33', '1575993600', '1607097600', '1576034007', '155');
INSERT INTO `cy_member_log` VALUES ('56', '34', '1575993600', '1604505600', '1576034060', '156');
INSERT INTO `cy_member_log` VALUES ('57', '35', '1575993600', '1607097600', '1576034081', '157');
INSERT INTO `cy_member_log` VALUES ('58', '25', '1575993600', '1607097600', '1576034132', '158');
INSERT INTO `cy_member_log` VALUES ('59', '31', '1575993600', '1604505600', '1576042985', '159');
INSERT INTO `cy_member_log` VALUES ('60', '25', '1607097600', '1638201600', '1576075531', '163');
INSERT INTO `cy_member_log` VALUES ('61', '1', '1576080000', '1607184000', '1576136528', '174');
INSERT INTO `cy_member_log` VALUES ('62', '28', '1576080000', '1583856000', '1576136924', '176');
INSERT INTO `cy_member_log` VALUES ('63', '28', '1576080000', '1604592000', '1576136930', '177');
INSERT INTO `cy_member_log` VALUES ('64', '26', '1576080000', '1604592000', '1576138553', '179');
INSERT INTO `cy_member_log` VALUES ('65', '26', '1576080000', '1583856000', '1576138553', '180');
INSERT INTO `cy_member_log` VALUES ('66', '26', '1576080000', '1583856000', '1576138553', '181');
INSERT INTO `cy_member_log` VALUES ('67', '26', '1604592000', '1612368000', '1576138577', '182');
INSERT INTO `cy_member_log` VALUES ('68', '28', '1604592000', '1612368000', '1576139553', '183');
INSERT INTO `cy_member_log` VALUES ('69', '28', '1612368000', '1643472000', '1576139560', '184');
INSERT INTO `cy_member_log` VALUES ('70', '28', '1643472000', '1671984000', '1576139564', '185');
INSERT INTO `cy_member_log` VALUES ('71', '29', '1576080000', '1607184000', '1576139794', '187');
INSERT INTO `cy_member_log` VALUES ('72', '29', '1607184000', '1638288000', '1576147404', '202');
INSERT INTO `cy_member_log` VALUES ('73', '29', '1638288000', '1669392000', '1576147407', '203');
INSERT INTO `cy_member_log` VALUES ('74', '29', '1669392000', '1700496000', '1576202198', '220');
INSERT INTO `cy_member_log` VALUES ('75', '29', '1700496000', '1731600000', '1576202200', '221');
INSERT INTO `cy_member_log` VALUES ('76', '25', '1638201600', '1669305600', '1576460548', '222');
INSERT INTO `cy_member_log` VALUES ('77', '25', '1669305600', '1700409600', '1576460548', '223');
INSERT INTO `cy_member_log` VALUES ('78', '25', '1700409600', '1731513600', '1576460553', '224');
INSERT INTO `cy_member_log` VALUES ('79', '25', '1731513600', '1762617600', '1576460556', '225');
INSERT INTO `cy_member_log` VALUES ('80', '25', '1762617600', '1793721600', '1576460556', '226');
INSERT INTO `cy_member_log` VALUES ('81', '25', '1793721600', '1824825600', '1576460556', '227');
INSERT INTO `cy_member_log` VALUES ('82', '25', '1824825600', '1832601600', '1576460561', '228');
INSERT INTO `cy_member_log` VALUES ('83', '25', '1832601600', '1840377600', '1576460561', '229');
INSERT INTO `cy_member_log` VALUES ('84', '25', '1840377600', '1848153600', '1576460561', '230');
INSERT INTO `cy_member_log` VALUES ('85', '25', '1848153600', '1855929600', '1576460562', '231');
INSERT INTO `cy_member_log` VALUES ('86', '25', '1855929600', '1863705600', '1576460562', '232');
INSERT INTO `cy_member_log` VALUES ('87', '25', '1863705600', '1871481600', '1576460562', '233');
INSERT INTO `cy_member_log` VALUES ('88', '25', '1871481600', '1879257600', '1576460562', '234');
INSERT INTO `cy_member_log` VALUES ('89', '25', '1879257600', '1887033600', '1576460562', '235');
INSERT INTO `cy_member_log` VALUES ('90', '25', '1887033600', '1915545600', '1576460563', '236');
INSERT INTO `cy_member_log` VALUES ('91', '25', '1915545600', '1944057600', '1576460563', '237');
INSERT INTO `cy_member_log` VALUES ('92', '25', '1944057600', '1972569600', '1576460563', '238');
INSERT INTO `cy_member_log` VALUES ('93', '25', '1972569600', '2001081600', '1576460563', '239');
INSERT INTO `cy_member_log` VALUES ('94', '25', '2001081600', '2029593600', '1576460564', '240');
INSERT INTO `cy_member_log` VALUES ('95', '25', '2029593600', '2058105600', '1576460564', '241');
INSERT INTO `cy_member_log` VALUES ('96', '25', '2058105600', '2065881600', '1576460564', '242');
INSERT INTO `cy_member_log` VALUES ('97', '25', '2065881600', '2096985600', '1576460564', '243');
INSERT INTO `cy_member_log` VALUES ('98', '25', '2096985600', '2128089600', '1576460566', '244');
INSERT INTO `cy_member_log` VALUES ('99', '25', '2128089600', '-2135773696', '1576460567', '245');
INSERT INTO `cy_member_log` VALUES ('100', '36', '1577145600', '1605657600', '1577194807', '398');
INSERT INTO `cy_member_log` VALUES ('101', '36', '1577145600', '1605657600', '1577194811', '399');
INSERT INTO `cy_member_log` VALUES ('102', '36', '1577145600', '1605657600', '1577194812', '400');
INSERT INTO `cy_member_log` VALUES ('103', '36', '1577145600', '1605657600', '1577194821', '401');
INSERT INTO `cy_member_log` VALUES ('104', '36', '1605657600', '1634169600', '1577195924', '402');
INSERT INTO `cy_member_log` VALUES ('105', '36', '1634169600', '1641945600', '1577196092', '403');
INSERT INTO `cy_member_log` VALUES ('106', '36', '1641945600', '1670457600', '1577196123', '404');
INSERT INTO `cy_member_log` VALUES ('107', '36', '1670457600', '1673049600', '1577196130', '405');
INSERT INTO `cy_member_log` VALUES ('108', '36', '1673049600', '1680825600', '1577196288', '406');

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
  `status` int(1) DEFAULT NULL COMMENT '订单状态 1-支付成功 0-支付失败',
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
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=407 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='订单记录表';

-- ----------------------------
-- Records of cy_order
-- ----------------------------
INSERT INTO `cy_order` VALUES ('1', 'ren158252013225', '1', '1', '测试', '190.00', '90.00', '100.00', '0', '1', null, '1', '1582312458', '1', null, null, null, '0', '1', '0', null, '1', 'cece', '4', '1572804659', null, null, '0', null, null, null, null, null);
INSERT INTO `cy_order` VALUES ('284', 'RM1576891395196162', '35', '1', '购物车购买', '100.00', '0.00', '100.00', '0', '1', '', '0', '1576891395', '1', '8C7BBF11F8CEC9C5810F43FC7399721F', '183.227.56.94', null, '2', '79', '0', '', '1', null, '0', null, null, null, '0', null, null, null, null, null);
INSERT INTO `cy_order` VALUES ('283', 'RM1576891324628763', '35', '1', '购物车购买', '100.00', '0.00', '100.00', '0', '1', '', '0', '1576891324', '1', '05B58C919B8245B3EE6FDA67AA91A965', '183.227.56.94', null, '2', '78', '0', '', '1', null, '0', null, null, null, '0', null, null, null, null, null);
INSERT INTO `cy_order` VALUES ('6', 'RM1574740489323385', '0', '1', 'ceshi', '100.00', '0.00', '100.00', '0', '1', '', '0', '1574740489', '1', null, null, null, '2', '15', '0', 'null', '1', null, '0', null, null, null, '0', null, null, null, null, null);
INSERT INTO `cy_order` VALUES ('7', 'RM1574740500800792', '0', '1', 'ceshi', '100.00', '0.00', '100.00', '0', '1', '', '0', '1574740500', '1', null, null, null, '2', '15', '0', 'null', '1', null, '0', null, null, null, '0', null, null, null, null, null);
INSERT INTO `cy_order` VALUES ('8', 'RM1574740543551482', '0', '1', 'ceshi', '100.00', '0.00', '100.00', '0', '1', '', '0', '1574740543', '1', null, null, null, '2', '15', '0', 'null', '1', null, '0', null, null, null, '0', null, null, null, null, null);
INSERT INTO `cy_order` VALUES ('9', 'RM1574740623896905', '0', '1', 'ceshi', '100.00', '0.00', '100.00', '0', '1', '', '0', '1574740623', '1', null, null, null, '2', '15', '0', 'null', '1', null, '0', null, null, null, '0', null, null, null, null, null);
INSERT INTO `cy_order` VALUES ('10', 'RM1574740675832973', '0', '1', 'ceshi', '100.00', '0.00', '100.00', '0', '1', '', '0', '1574740675', '1', null, null, null, '2', '15', '0', 'null', '1', null, '0', null, null, null, '0', null, null, null, null, null);
INSERT INTO `cy_order` VALUES ('11', 'RM1574740709127522', '0', '1', 'ceshi', '100.00', '0.00', '100.00', '0', '1', '', '0', '1574740709', '1', null, null, null, '2', '15', '0', 'null', '1', null, '0', null, null, null, '0', null, null, null, null, null);
INSERT INTO `cy_order` VALUES ('12', 'RM1574740717444857', '0', '1', 'ceshi', '100.00', '0.00', '100.00', '0', '1', '', '0', '1574740717', '1', null, null, null, '2', '15', '0', 'null', '1', null, '0', null, null, null, '0', null, null, null, null, null);
INSERT INTO `cy_order` VALUES ('13', 'RM1574740743497554', '0', '1', 'ceshi', '100.00', '0.00', '100.00', '0', '1', '', '0', '1574740743', '1', null, null, null, '2', '15', '0', 'null', '1', null, '0', null, null, null, '0', null, null, null, null, null);
INSERT INTO `cy_order` VALUES ('14', 'RM1574740877475753', '0', '1', 'ceshi', '100.00', '0.00', '100.00', '0', '1', '', '0', '1574740877', '1', null, null, null, '2', '15', '0', 'null', '1', null, '0', null, null, null, '0', null, null, null, null, null);
INSERT INTO `cy_order` VALUES ('15', 'RM1574740928909157', '0', '1', 'ceshi', '100.00', '0.00', '100.00', '0', '1', '', '0', '1574740928', '1', null, null, null, '2', '15', '0', 'null', '1', null, '0', null, null, null, '0', null, null, null, null, null);
INSERT INTO `cy_order` VALUES ('16', 'RM1574745968867881', '0', '1', 'ceshi', '100.00', '0.00', '100.00', '0', '1', '', '0', '1574745968', '1', null, null, null, '2', '15', '0', 'null', '1', null, '0', null, null, null, '0', null, null, null, null, null);
INSERT INTO `cy_order` VALUES ('17', 'RM1575037880678518', '0', '2', 'ceshi2', '100.00', '0.00', '100.00', '0', '1', '', '0', '1575037880', '1', null, null, null, '2', '19', '0', 'null', '1', null, '0', null, null, null, '0', null, null, null, null, null);
INSERT INTO `cy_order` VALUES ('67', 'RM1575352963369449', '33', '5', 'ceshi5', '0.01', '0.00', '0.01', '0', '1', '', '1', '1575352963', '1', '8DD5E500DE5B1477309F4ED971ABB81D', '117.175.131.162', '1575353815', '2', '19', '0', 'null', '1', '111', '4', '1575559759', 's:61:\"http://lck.hzlyzhenzhi.com/files/attach/file5de9224d8d75a.png\";', 's:0:\"\";', '0', null, null, null, null, null);
INSERT INTO `cy_order` VALUES ('68', 'RM1575353879675388', '33', '6', 'ceshi6', '0.01', '0.00', '0.01', '0', '1', '', '1', '1575353879', '1', 'CF08C9A904D8397186681B7510DB9D5A', '117.175.131.162', '1575353886', '2', '19', '0', 'null', '1', '2222', '2', '1575356747', null, null, '0', null, null, null, null, null);
INSERT INTO `cy_order` VALUES ('75', 'RM1575379289777359', '26', '5', 'ceshi5', '0.01', '0.00', '0.01', '0', '1', '', '-1', '1575379289', '1', '197340B21E0EF78E000ED0BCAD6A3C98', '221.237.148.47', '1575379305', '2', '22', '0', 'null', '1', null, '1', null, null, null, '0', null, null, null, null, null);
INSERT INTO `cy_order` VALUES ('348', 'RM1577039752433033', '29', '1', '购物车购买', '0.00', '0.00', '0.00', '0', '1', '1-1', '-1', '1577039752', '1', null, null, '1577039752', '2', '42', '0', '', '3', null, '1', null, null, null, '0', null, null, null, null, null);
INSERT INTO `cy_order` VALUES ('116', 'RM1575684168910093', '33', '10', '购物车购买', '0.00', '0.00', '0.00', '0', '1', '', '1', '1575684168', '1', null, null, '1575684168', '2', '20', '0', '', '1', null, '1', null, null, null, '0', null, null, null, null, null);
INSERT INTO `cy_order` VALUES ('115', 'RM1575684133225587', '33', '10', '购物车购买', '0.00', '0.00', '0.00', '0', '1', '', '1', '1575684133', '1', null, null, '1575684133', '2', '20', '0', null, '1', null, '1', null, null, null, '0', null, null, null, null, null);
INSERT INTO `cy_order` VALUES ('112', 'RM1575683751267745', '33', '10', '购物车购买', '0.00', '0.00', '0.00', '0', '2', '', '1', '1575683751', '1', null, null, '1575683751', '1', '19', '0', null, '1', null, '1', null, null, null, '0', null, null, null, null, null);
INSERT INTO `cy_order` VALUES ('114', 'RM1575684100464893', '33', '10', '购物车购买', '0.00', '0.00', '0.00', '0', '1', '', '1', '1575684100', '1', null, null, '1575684100', '1', '19', '0', null, '1', null, '1', null, null, null, '0', null, null, null, null, null);
INSERT INTO `cy_order` VALUES ('105', 'RM1575630756900356', '33', '9', '购物车购买', '0.00', '0.00', '0.00', '0', '1', '', '1', '1575630756', '1', null, null, '1575630756', '2', 'undefined', '0', '', '1', null, '1', null, null, null, '0', null, null, null, null, null);
INSERT INTO `cy_order` VALUES ('120', 'RM1575684950450180', '33', '10', '购物车购买', '0.00', '0.00', '0.00', '0', '1', '', '1', '1575684950', '1', null, null, '1575684950', '2', '20', '0', '', '1', null, '1', null, null, null, '0', null, null, null, null, null);
INSERT INTO `cy_order` VALUES ('262', 'RM1576765526932108', '35', '3', 'ceshi3', '300.00', '0.00', '300.00', '0', '3', '', '1', '1576765526', '1', '25B2D34112114F1EAA1800ED8D65B3F7', '183.227.56.172', null, '2', '67', '0', '', '1', null, '1', null, null, null, '0', null, null, null, null, null);
INSERT INTO `cy_order` VALUES ('261', 'RM1576765503884894', '35', '3', 'ceshi3', '100.00', '0.00', '100.00', '0', '1', '', '1', '1576765503', '1', '1F2D4758D466FC313CA51B652F9B3C32', '183.227.56.172', null, '2', '67', '0', '', '1', null, '1', null, null, null, '0', null, null, null, null, null);
INSERT INTO `cy_order` VALUES ('260', 'RM1576765495998930', '35', '3', 'ceshi3', '100.00', '0.00', '100.00', '0', '1', '', '1', '1576765495', '1', 'AF428654A5BB861437925410BE8C6DB7', '183.227.56.172', null, '2', '67', '0', '', '1', null, '1', null, null, null, '0', null, null, null, null, null);
INSERT INTO `cy_order` VALUES ('126', 'RM1575714294294682', '30', '0', '会员开通', '20.00', null, '20.00', null, '1', null, '0', '1575714294', '1', '31D4F6836A7B2A20D42116167C30D986', '171.217.98.244', null, '1', null, null, null, '1', null, '0', null, null, null, '0', null, null, null, null, null);
INSERT INTO `cy_order` VALUES ('127', 'RM1575714296403822', '30', '0', '会员开通', '20.00', null, '20.00', null, '1', null, '0', '1575714296', '1', '4B024427FCD4A287C85A16F89F4581B7', '171.217.98.244', null, '1', null, null, null, '1', null, '0', null, null, null, '0', null, null, null, null, null);
INSERT INTO `cy_order` VALUES ('128', 'RM1575714297416689', '30', '0', '会员开通', '20.00', null, '20.00', null, '1', null, '0', '1575714297', '1', 'D22DB59DDC6489AF65F8ED53666E0639', '171.217.98.244', null, '1', null, null, null, '1', null, '0', null, null, null, '0', null, null, null, null, null);
INSERT INTO `cy_order` VALUES ('129', 'RM1575714298671269', '30', '0', '会员开通', '20.00', null, '20.00', null, '1', null, '0', '1575714298', '1', '7349BB066D281ACF18D0612D40C04454', '171.217.98.244', null, '1', null, null, null, '1', null, '0', null, null, null, '0', null, null, null, null, null);
INSERT INTO `cy_order` VALUES ('259', 'RM1576764846772170', '35', '3', 'ceshi3', '100.00', '0.00', '100.00', '0', '1', '', '1', '1576764846', '1', '11330F9943923028681250DE8A29C70F', '183.227.56.172', null, '2', '67', '0', '', '1', null, '1', null, null, null, '0', null, null, null, null, null);
INSERT INTO `cy_order` VALUES ('138', 'RM1575948444930637', '30', '3', 'ceshi3', '100.00', '0.00', '100.00', '0', '1', '', '0', '1575948444', '1', '88BED37936970B5CE304E7493C14CBCF', '171.217.98.244', null, '2', '32', '0', '', '1', null, '0', null, null, null, '0', null, null, null, null, null);
INSERT INTO `cy_order` VALUES ('139', 'RM1575948445520131', '30', '3', 'ceshi3', '100.00', '0.00', '100.00', '0', '1', '', '0', '1575948445', '1', 'ADA279C2B480BF968709C5A0660DB28E', '171.217.98.244', null, '2', '32', '0', '', '1', null, '0', null, null, null, '0', null, null, null, null, null);
INSERT INTO `cy_order` VALUES ('140', 'RM1575948446665357', '30', '3', 'ceshi3', '100.00', '0.00', '100.00', '0', '1', '', '0', '1575948446', '1', '59D5A07970F33541FBF0B08FDC1436C1', '171.217.98.244', null, '2', '32', '0', '', '1', null, '0', null, null, null, '0', null, null, null, null, null);
INSERT INTO `cy_order` VALUES ('141', 'RM1575948447330206', '30', '3', 'ceshi3', '100.00', '0.00', '100.00', '0', '1', '', '0', '1575948447', '1', '3B08D89781F7A163500BAEBA224D3804', '171.217.98.244', null, '2', '32', '0', '', '1', null, '0', null, null, null, '0', null, null, null, null, null);
INSERT INTO `cy_order` VALUES ('142', 'RM1575948447693552', '30', '3', 'ceshi3', '100.00', '0.00', '100.00', '0', '1', '', '0', '1575948447', '1', '702799A8E1CBE894F0F49B7D6F87DB78', '171.217.98.244', null, '2', '32', '0', '', '1', null, '0', null, null, null, '0', null, null, null, null, null);
INSERT INTO `cy_order` VALUES ('143', 'RM1575948480616405', '30', '5', 'ceshi5', '0.01', '0.00', '0.01', '0', '1', '', '1', '1575948480', '1', 'D34C9B4C449771BC540B523DA8B2CEF1', '171.217.98.244', '1575950536', '2', '32', '0', '', '1', null, '1', null, null, null, '0', null, null, null, null, null);
INSERT INTO `cy_order` VALUES ('144', 'RM1575948707309609', '33', '5', 'ceshi5', '0.01', '0.00', '0.01', '0', '1', '', '-1', '1575948707', '1', 'E527ACBD32AD490A0C1CF86FF5130F26', '171.221.254.102', '1575950762', '2', '41', '0', '', '1', null, '1', null, null, null, '0', null, null, null, null, null);
INSERT INTO `cy_order` VALUES ('145', 'RM1575949921169278', '30', '5', 'ceshi5', '0.01', '0.00', '0.01', '0', '1', '', '1', '1575949921', '1', '02007106B45814F625D5DA955DEE0293', '171.217.98.244', '1575949931', '2', '32', '0', '', '1', '别扭扭捏捏', '4', '1575959228', 's:0:\"\";', 's:0:\"\";', '0', null, null, null, null, null);
INSERT INTO `cy_order` VALUES ('146', 'RM1575959145610145', '30', '1', '购物车购买', '100.00', '0.00', '100.00', '0', '1', '', '0', '1575959145', '1', 'DA84CA25489063CEFDD83A0C0DCF4286', '117.136.64.82', null, '2', '32', '0', '', '1', null, '0', null, null, null, '0', null, null, null, null, null);
INSERT INTO `cy_order` VALUES ('147', 'RM1575959170245168', '30', '0', '会员开通', '20.00', null, '20.00', null, '1', null, '0', '1575959170', '1', 'C2B625526768D93D085B6213CA26F3A2', '117.136.64.82', null, '1', null, null, null, '1', null, '0', null, null, null, '0', null, null, null, null, null);
INSERT INTO `cy_order` VALUES ('258', 'RM1576755875828666', '35', '1', '购物车购买', '100.00', '0.00', '100.00', '0', '1', '', '1', '1576755875', '1', '79025ABD939A19C8F2E9B2125CCF42F9', '183.227.56.172', null, '2', '67', '0', '', '1', null, '1', null, null, null, '0', null, null, null, null, null);
INSERT INTO `cy_order` VALUES ('150', 'RM1576030141874382', '33', '0', '会员开通', '0.01', null, '0.01', null, '1', null, '1', '1576030141', '1', '00DFA0374E8C5196264F26B9134F857F', '171.221.254.102', '1576030147', '1', null, null, null, '1', null, '1', null, null, null, '0', null, null, null, null, null);
INSERT INTO `cy_order` VALUES ('152', 'RM1576030432955916', '33', '0', '会员开通', '0.01', null, '0.01', null, '1', null, '1', '1576030432', '1', '36B37E4ED0AE71932D4259D190F42D08', '171.221.254.102', '1576030437', '1', null, null, null, '1', null, '1', null, null, null, '0', null, null, null, null, null);
INSERT INTO `cy_order` VALUES ('154', 'RM1576030740158846', '33', '0', '会员开通', '0.01', null, '0.01', null, '1', null, '1', '1576030740', '1', '6CD758ED8847183166FFD49CF029B1FE', '171.221.254.102', '1576030745', '1', null, null, null, '1', null, '1', null, null, null, '0', null, null, null, null, null);
INSERT INTO `cy_order` VALUES ('156', 'RM1576034060153469', '30', '0', '会员开通', '0.01', null, '0.01', null, '1', null, '1', '1576034060', '1', 'FD72D088BBB7028696F9B9E8C1A400F6', '139.207.21.140', '1576034068', '1', null, null, null, '1', null, '1', null, null, null, '0', null, null, null, null, null);
INSERT INTO `cy_order` VALUES ('157', 'RM1576034081313488', '33', '0', '会员开通', '0.01', null, '0.01', null, '1', null, '1', '1576034081', '1', 'CCD715285F5FAA51BD618960AF47C848', '171.221.254.102', '1576034087', '1', null, null, null, '1', null, '1', null, null, null, '0', null, null, null, null, null);
INSERT INTO `cy_order` VALUES ('158', 'RM1576034132869727', '33', '0', '会员开通', '0.01', null, '0.01', null, '1', null, '1', '1576034132', '1', '982675C595EC99D602FF748A2B8C9422', '171.221.254.102', '1576034145', '1', null, null, null, '1', null, '1', null, null, null, '0', null, null, null, null, null);
INSERT INTO `cy_order` VALUES ('159', 'RM1576042985681193', '31', '0', '会员开通', '0.01', null, '0.01', null, '1', null, '1', '1576042985', '1', '4C4B11E7016135F614F89FDEA1C7C17F', '221.237.148.235', '1576042994', '1', null, null, null, '1', null, '1', null, null, null, '0', null, null, null, null, null);
INSERT INTO `cy_order` VALUES ('347', 'RM1577023927201592', '29', '1', '购物车购买', '0.00', '0.00', '0.00', '0', '1', '1-1', '1', '1577023927', '1', null, null, '1577023927', '2', '42', '0', '', '3', null, '1', null, null, null, '0', null, null, null, null, null);
INSERT INTO `cy_order` VALUES ('282', 'RM1576891263730627', '35', '1', '购物车购买', '100.00', '0.00', '100.00', '0', '1', '', '0', '1576891263', '1', '96D6888E3665D8B70A1C0D856B50C281', '183.227.56.94', null, '2', '77', '0', '', '1', null, '0', null, null, null, '0', null, null, null, null, null);
INSERT INTO `cy_order` VALUES ('281', 'RM1576891120541184', '35', '1', '购物车购买', '100.00', '0.00', '100.00', '0', '1', '', '0', '1576891120', '1', 'F8DC298A819FF38B08DE645F6F76DA27', '183.227.56.94', null, '2', '76', '0', '', '1', null, '0', null, null, null, '0', null, null, null, null, null);
INSERT INTO `cy_order` VALUES ('280', 'RM1576891055485838', '35', '1', '购物车购买', '100.00', '0.00', '100.00', '0', '1', '', '0', '1576891055', '1', 'B64B4F2DD06E06811AECE2E956AEE889', '183.227.56.94', null, '2', '75', '0', '', '1', null, '0', null, null, null, '0', null, null, null, null, null);
INSERT INTO `cy_order` VALUES ('279', 'RM1576890718489369', '35', '1', '购物车购买', '100.00', '0.00', '100.00', '0', '1', '', '0', '1576890718', '1', '607419C71017C479D40697780874D7CA', '183.227.56.94', null, '2', '74', '0', '', '1', null, '0', null, null, null, '0', null, null, null, null, null);
INSERT INTO `cy_order` VALUES ('278', 'RM1576890675986972', '35', '1', '购物车购买', '100.00', '0.00', '100.00', '0', '1', '', '0', '1576890675', '1', 'B2BAB8CC6F96386D5C902DA70769DE84', '183.227.56.94', null, '2', '73', '0', '', '1', null, '0', null, null, null, '0', null, null, null, null, null);
INSERT INTO `cy_order` VALUES ('271', 'RM1576864564891716', '26', '2', 'ceshi2', '100.00', '0.00', '100.00', '0', '1', '', '1', '1576864564', '1', '03D69414A6C264DA8523E45D3A55801E', '112.67.84.40', '1576927821', '2', '22', '0', '', '1', null, '1', null, null, null, '0', null, null, null, null, null);
INSERT INTO `cy_order` VALUES ('346', 'RM1577023927975871', '29', '1', '购物车购买', '0.00', '0.00', '0.00', '0', '1', '1-1', '1', '1577023927', '1', null, null, '1577023927', '2', '42', '0', '', '3', null, '1', null, null, null, '0', null, null, null, null, null);
INSERT INTO `cy_order` VALUES ('345', 'RM1577023926588718', '29', '1', '购物车购买', '0.00', '0.00', '0.00', '0', '1', '1-1', '1', '1577023926', '1', null, null, '1577023926', '2', '42', '0', '', '3', null, '1', null, null, null, '0', null, null, null, null, null);
INSERT INTO `cy_order` VALUES ('344', 'RM1577023926988658', '29', '1', '购物车购买', '0.00', '0.00', '0.00', '0', '1', '1-1', '1', '1577023926', '1', null, null, '1577023926', '2', '42', '0', '', '3', null, '1', null, null, null, '0', null, null, null, null, null);
INSERT INTO `cy_order` VALUES ('343', 'RM1577023925886847', '29', '1', '购物车购买', '0.00', '0.00', '0.00', '0', '1', '1-1', '-1', '1577023925', '1', null, null, '1577023925', '2', '42', '0', '', '3', null, '1', null, null, null, '0', null, null, null, null, null);
INSERT INTO `cy_order` VALUES ('342', 'RM1577023918384375', '29', '1', '购物车购买', '0.00', '0.00', '0.00', '0', '1', '1-1', '1', '1577023918', '1', null, null, '1577023918', '2', '42', '0', '', '3', null, '1', null, null, null, '0', null, null, null, null, null);
INSERT INTO `cy_order` VALUES ('205', 'RM1576147705533988', '29', '6', 'ceshi6', '0.01', '0.00', '0.01', '0', '1', '', '1', '1576147705', '1', '72E026C9706B064C17FF7577A283ACE8', '121.230.80.218', '1576147719', '2', '42', '0', '', '1', null, '1', null, null, null, '0', null, null, null, null, null);
INSERT INTO `cy_order` VALUES ('199', 'RM1576146814639811', '29', '11', '多少', '0.00', '0.00', '0.00', '0', '1', '\'address-江苏省泰州市兴化市,phone-12334421334NaN', '1', '1576146814', '1', null, null, '1576146814', '2', '0', '0', 'undefined', '1', null, '1', null, null, null, '0', null, null, null, null, null);
INSERT INTO `cy_order` VALUES ('277', 'RM1576890198769227', '35', '1', '购物车购买', '100.00', '0.00', '100.00', '0', '1', '', '0', '1576890198', '1', 'C427FBEBAC92F3F3B120D74C798B10D4', '183.227.56.94', null, '2', '72', '0', '', '1', null, '0', null, null, null, '0', null, null, null, null, null);
INSERT INTO `cy_order` VALUES ('190', 'RM1576146352989701', '29', '11', '多少', '0.00', '0.00', '0.00', '0', '1', '\'address-江苏省泰州市兴化市,phone-12345678901NaN', '1', '1576146352', '1', null, null, '1576146352', '2', '0', '0', 'undefined', '1', null, '1', null, null, null, '0', null, null, null, null, null);
INSERT INTO `cy_order` VALUES ('191', 'RM1576146357284464', '29', '11', '多少', '0.00', '0.00', '0.00', '0', '1', '\'address-江苏省泰州市兴化市,phone-12345678901NaN', '1', '1576146357', '1', null, null, '1576146357', '2', '0', '0', 'undefined', '1', null, '1', null, null, null, '0', null, null, null, null, null);
INSERT INTO `cy_order` VALUES ('192', 'RM1576146358889255', '29', '11', '多少', '0.00', '0.00', '0.00', '0', '1', '\'address-江苏省泰州市兴化市,phone-12345678901NaN', '1', '1576146358', '1', null, null, '1576146358', '2', '0', '0', 'undefined', '1', null, '1', null, null, null, '0', null, null, null, null, null);
INSERT INTO `cy_order` VALUES ('193', 'RM1576146358652597', '29', '11', '多少', '0.00', '0.00', '0.00', '0', '1', '\'address-江苏省泰州市兴化市,phone-12345678901NaN', '1', '1576146358', '1', null, null, '1576146358', '2', '0', '0', 'undefined', '1', null, '1', null, null, null, '0', null, null, null, null, null);
INSERT INTO `cy_order` VALUES ('194', 'RM1576146358408397', '29', '11', '多少', '0.00', '0.00', '0.00', '0', '1', '\'address-江苏省泰州市兴化市,phone-12345678901NaN', '1', '1576146358', '1', null, null, '1576146358', '2', '0', '0', 'undefined', '1', null, '1', null, null, null, '0', null, null, null, null, null);
INSERT INTO `cy_order` VALUES ('195', 'RM1576146359493167', '29', '11', '多少', '0.00', '0.00', '0.00', '0', '1', '\'address-江苏省泰州市兴化市,phone-12345678901NaN', '1', '1576146359', '1', null, null, '1576146359', '2', '0', '0', 'undefined', '1', null, '1', null, null, null, '0', null, null, null, null, null);
INSERT INTO `cy_order` VALUES ('197', 'RM1576146417336439', '29', '9', '1', '1.00', '0.00', '1.00', '0', '1', '\'address-江苏省泰州市兴化市,phone-12098765431NaN', '1', '1576146417', '1', 'C76551C8C9FFA1401FBC4EF09D3122DF', '121.230.80.218', '1576146427', '2', '0', '0', 'undefined', '1', null, '1', null, null, null, '0', null, null, null, null, null);
INSERT INTO `cy_order` VALUES ('203', 'RM1576147407230028', '29', '0', '会员续费', '0.01', null, '0.01', null, '1', null, '1', '1576147407', '1', 'CD7A627F40816E278699E93EBC9E0068', '121.230.80.218', '1576147415', '1', null, null, null, '1', null, '1', null, null, null, '0', null, null, null, null, null);
INSERT INTO `cy_order` VALUES ('204', 'RM1576147576127923', '29', '9', '1', '1.00', '0.00', '1.00', '0', '1', '\'address-江苏省泰州市兴化市,phone-112333333333NaN', '1', '1576147576', '1', '112A2B30FBDCF0BC37F7A3F80F00D10E', '121.230.80.218', '1576147588', '2', '0', '0', 'undefined', '1', null, '1', null, null, null, '0', null, null, null, null, null);
INSERT INTO `cy_order` VALUES ('285', 'RM1576891515159434', '35', '1', '购物车购买', '100.00', '0.00', '100.00', '0', '1', '', '0', '1576891515', '1', 'DD4E397C0A8AA29E965BC8B222335974', '183.227.56.94', null, '2', '80', '0', '', '1', null, '0', null, null, null, '0', null, null, null, null, null);
INSERT INTO `cy_order` VALUES ('286', 'RM1576891804634407', '35', '40', '购物车购买', '100.00', '1.00', '99.00', '0', '2', '', '0', '1576891804', '1', 'BFF9D2F8D0F95FC23DF231741AB31C49', '183.227.56.94', null, '2', '81', '1', '', '1', null, '0', null, null, null, '0', null, null, null, null, null);
INSERT INTO `cy_order` VALUES ('287', 'RM1576892196253701', '35', '40', '购物车购买', '100.00', '1.00', '99.00', '0', '2', '', '0', '1576892196', '1', 'ED78E8B09717743FFE79908F846298B3', '183.227.56.94', null, '2', '83', '1', '', '1', null, '0', null, null, null, '0', null, null, null, null, null);
INSERT INTO `cy_order` VALUES ('288', 'RM1576892458222859', '35', '40', '购物车购买', '100.00', '1.00', '99.00', '0', '2', '', '0', '1576892458', '1', '33A43B3BDEB580E52850E6DCD05EF475', '183.227.56.94', null, '2', '84', '1', '', '1', null, '0', null, null, null, '0', null, null, null, null, null);
INSERT INTO `cy_order` VALUES ('289', 'RM1576892744731884', '35', '40', '购物车购买', '100.00', '1.00', '114.00', '0', '2', '', '0', '1576892744', '1', '5FA8E60D946EEB547FEF85FABB31C6FC', '183.227.56.94', null, '2', '85', '1', '', '1', null, '0', null, null, null, '15', null, null, null, null, null);
INSERT INTO `cy_order` VALUES ('290', 'RM1576893349438250', '35', '40', '购物车购买', '100.00', '0.00', '120.00', '0', '2', '', '0', '1576893349', '1', '93C74C239BB08E5091C835F91312833B', '183.227.56.94', null, '2', '86', '0', '', '1', null, '0', null, null, null, '20', null, null, null, null, null);
INSERT INTO `cy_order` VALUES ('291', 'RM1576894342634916', '35', '40', '购物车购买', '0.00', '1.00', '14.00', '0', '2', '', '0', '1576894342', '1', 'B2330748A8F3EA3446F257BE5A8F3BAF', '183.227.56.94', null, '2', '87', '1', '', '1', null, '0', null, null, null, '15', null, null, null, null, null);
INSERT INTO `cy_order` VALUES ('292', 'RM1576894371992242', '35', '40', '购物车购买', '0.00', '0.00', '20.00', '0', '2', '', '0', '1576894371', '1', '55DE5FD01162BB81B022C614D92877C6', '183.227.56.94', null, '2', '88', '0', '', '1', null, '0', null, null, null, '20', null, null, null, null, null);
INSERT INTO `cy_order` VALUES ('293', 'RM1576894919973892', '35', '40', '购物车购买', '0.00', '0.00', '20.00', '0', '2', '', '0', '1576894919', '1', '196252BC9A75C87A838CBE5E6BFABF9A', '183.227.56.94', null, '2', '89', '0', '', '1', null, '0', null, null, null, '20', null, null, null, null, null);
INSERT INTO `cy_order` VALUES ('294', 'RM1576895196311615', '35', '2', '购物车购买', '200.00', '0.00', '220.00', '0', '2', '', '0', '1576895196', '1', 'F2BEF25C50ACF4549C585F82F22BFA67', '183.227.56.94', null, '2', '91', '0', '', '1', null, '0', null, null, null, '20', null, null, null, null, null);
INSERT INTO `cy_order` VALUES ('295', 'RM1576895373616458', '35', '2', '购物车购买', '200.00', '0.00', '220.00', '0', '2', '', '0', '1576895373', '1', '52ED5C2EC2AED20CA3EE8DE1ABDC41DE', '183.227.56.94', null, '2', '92', '0', '', '1', null, '0', null, null, null, '20', null, null, null, null, null);
INSERT INTO `cy_order` VALUES ('296', 'RM1576895384311321', '35', '2', '购物车购买', '200.00', '1.00', '214.00', '0', '2', '', '0', '1576895384', '1', 'E296F4B565E4272F3BFEC690C5E99A74', '183.227.56.94', null, '2', '92', '1', '', '1', null, '0', null, null, null, '15', null, null, null, null, null);
INSERT INTO `cy_order` VALUES ('297', 'RM1576896025374745', '35', '2', '购物车购买', '200.00', '50.00', '165.00', '0', '2', '', '0', '1576896025', '1', 'EF403219A0D2BCBB0B61D6B5DFF2C542', '183.227.56.94', null, '2', '93', '50', '', '1', null, '0', null, null, null, '15', null, null, null, null, null);
INSERT INTO `cy_order` VALUES ('299', 'RM1576896532333229', '35', '2', '购物车购买', '200.00', '0.00', '220.00', '0', '2', '', '0', '1576896532', '1', '00CBAD5EF2109990CC558D70F173DDFC', '183.227.56.94', null, '2', '93', '0', '', '1', null, '0', null, null, null, '20', null, null, null, null, null);
INSERT INTO `cy_order` VALUES ('300', 'RM1576896769593132', '35', '3', 'ceshi3', '100.00', '0.00', '100.00', '0', '1', '', '0', '1576896769', '1', 'D3A11230E0F207EA716D86A8D2503494', '183.227.56.94', null, '2', '93', '0', '', '1', null, '0', null, null, null, '0', null, null, null, null, null);
INSERT INTO `cy_order` VALUES ('301', 'RM1576896856303938', '35', '3', 'ceshi3', '100.00', '0.00', '110.00', '0', '1', '', '0', '1576896856', '1', '9BFDE4BBED7ADE16B63B4BBBFF35F256', '183.227.56.94', null, '2', '93', '0', '', '1', null, '0', null, null, null, '10', null, null, null, null, null);
INSERT INTO `cy_order` VALUES ('302', 'RM1576896916899821', '35', '3', 'ceshi3', '100.00', '50.00', '55.00', '0', '1', '', '0', '1576896916', '1', 'B1090EC233E43686DA31C6DC4809CAF2', '183.227.56.94', null, '2', '93', '50', '', '1', null, '0', null, null, null, '5', null, null, null, null, null);
INSERT INTO `cy_order` VALUES ('303', 'RM1576901615879357', '35', '2', '购物车购买', '200.00', '0.00', '220.00', '0', '2', '', '0', '1576901615', '1', '7FA0E5EA4342457A2411154CEF1DC4D3', '183.227.56.94', null, '2', '96', '0', '', '1', null, '0', null, null, null, '20', null, null, null, null, null);
INSERT INTO `cy_order` VALUES ('304', 'RM1576901801138623', '35', '2', '购物车购买', '200.00', '80.00', '132.00', '1', '2', '', '0', '1576901801', '1', '2869C292B7CA5EE373609201809B635E', '183.227.56.94', null, '2', '97', '50', '', '1', null, '0', null, null, null, '12', null, null, null, null, null);
INSERT INTO `cy_order` VALUES ('305', 'RM1576902058367309', '35', '2', '购物车购买', '200.00', '80.00', '135.00', '1', '2', '', '0', '1576902058', '1', 'C85EDADED04E02ECA9F797D5D74DF129', '183.227.56.94', null, '2', '98', '50', '', '1', null, '0', null, null, null, '15', null, null, null, null, null);
INSERT INTO `cy_order` VALUES ('306', 'RM1576902353217348', '35', '2', '购物车购买', '200.00', '80.00', '135.00', '1', '2', '', '0', '1576902353', '1', '221FC1794FD31D50ACB6B5AA58235C24', '183.227.56.94', null, '2', '99', '50', '', '1', null, '0', null, null, null, '15', null, null, null, null, null);
INSERT INTO `cy_order` VALUES ('307', 'RM1576902356746436', '35', '2', '购物车购买', '200.00', '80.00', '135.00', '1', '2', '', '0', '1576902356', '1', '76FD6D14533E8314748483FF5404FE21', '183.227.56.94', null, '2', '99', '50', '', '1', null, '0', null, null, null, '15', null, null, null, null, null);
INSERT INTO `cy_order` VALUES ('308', 'RM1576902358653560', '35', '2', '购物车购买', '200.00', '80.00', '135.00', '1', '2', '', '0', '1576902358', '1', 'CEDD8D2276D199A6044F27C3AE85481C', '183.227.56.94', null, '2', '99', '50', '', '1', null, '0', null, null, null, '15', null, null, null, null, null);
INSERT INTO `cy_order` VALUES ('309', 'RM1576903556603591', '35', '2', '购物车购买', '200.00', '80.00', '135.00', '1', '2', '', '0', '1576903556', '1', 'C2E12ED133225304CF476E7C375528E0', '183.227.56.94', null, '2', '103', '50', '', '1', null, '0', null, null, null, '15', null, null, null, null, null);
INSERT INTO `cy_order` VALUES ('310', 'RM1576903616983281', '35', '3', 'ceshi3', '100.00', '80.00', '25.00', '1', '1', '', '0', '1576903616', '1', '6B244C63A6782688ABC6BCEA24AF6A27', '183.227.56.94', null, '2', '103', '50', '', '1', null, '0', null, null, null, '5', null, null, null, null, null);
INSERT INTO `cy_order` VALUES ('313', 'RM1576907980553034', '26', '20', '还是试试看', '0.10', '0.00', '0.10', '0', '1', '', '1', '1576907980', '1', '82BC1B8D0CCFBDA4A7E1C73CFB02FCA9', '121.58.37.8', '1576917235', '2', '120', '0', '', '1', null, '1', null, null, null, '0', null, null, null, null, null);
INSERT INTO `cy_order` VALUES ('329', 'RM1576927634280665', '33', '20', '还是试试看', '0.10', '0.00', '0.11', '0', '1', '', '1', '1576927634', '1', '8665481BD5137AEC07BC114E127EE3EB', '118.133.209.174', '1576927653', '2', '119', '0', '', '1', null, '1', null, null, null, '0', null, null, null, '3', null);
INSERT INTO `cy_order` VALUES ('351', 'RM1577111897259934', '26', '7', '1', '2.00', '0.00', '2.00', '0', '1', '\'address-四川省成都市金牛区新泉路33号,phone-18121394387NaN', '1', '1577111897', '1', '8D885DE6860259F3716C1A6EDC615746', '171.210.125.254', '1577111905', '2', '0', '0', 'undefined', '1', null, '2', null, null, null, '0', '26', null, '1577111941', '1', null);
INSERT INTO `cy_order` VALUES ('318', 'RM1576908600475887', '33', '20', '还是试试看', '0.10', '0.00', '0.10', '0', '1', '', '1', '1576908600', '1', 'A0FEBE249A16A8D8EF3F79D0756D0B43', '58.16.228.118', '1576917856', '2', '119', '0', '', '1', null, '1', null, null, null, '0', null, null, null, null, null);
INSERT INTO `cy_order` VALUES ('319', 'RM1576908838925447', '35', '2', '购物车购买', '200.00', '80.00', '132.00', '1', '2', '', '0', '1576908838', '1', 'C18B11B8F44CB4C53C5DAA631CFB19CE', '183.227.56.94', null, '2', '121', '50', '', '1', null, '0', null, null, null, '12', null, null, null, null, null);
INSERT INTO `cy_order` VALUES ('320', 'RM1576909159399435', '33', '20', '还是试试看', '0.10', '0.00', '0.11', '0', '1', '', '1', '1576909159', '1', '16A63946300D186419514647BC94AD42', '58.16.228.118', '1576918419', '2', '119', '0', '', '1', null, '1', null, null, null, '0', null, null, null, null, null);
INSERT INTO `cy_order` VALUES ('321', 'RM1576911343262850', '33', '20', '还是试试看', '0.10', '0.00', '0.10', '0', '1', '', '1', '1576911343', '1', 'C17F7A5F3AB770E38B4FE276877B71B6', '58.16.228.118', '1576916999', '2', '119', '0', '', '1', null, '1', null, null, null, '0', null, null, null, null, null);
INSERT INTO `cy_order` VALUES ('322', 'RM1576911663648130', '33', '20', '还是试试看', '0.10', '0.00', '0.10', '0', '1', '', '1', '1576911663', '1', 'D0766EE61A8AC4F712BE0643FB9817FC', '118.133.209.174', '1576915532', '2', '119', '0', '', '1', null, '1', null, null, null, '0', null, null, null, null, null);
INSERT INTO `cy_order` VALUES ('323', 'RM1576912331700908', '33', '20', '还是试试看', '0.10', '0.00', '0.10', '0', '1', '', '1', '1576912331', '1', 'B9887B7C34CAB838023A60ECC709213B', '118.133.209.174', '1576916195', '2', '119', '0', '', '1', null, '1', null, null, null, '0', null, null, null, null, null);
INSERT INTO `cy_order` VALUES ('324', 'RM1576913762410751', '33', '20', '还是试试看', '0.10', '0.00', '0.10', '0', '1', '', '1', '1576913762', '1', '817E5B5CBBBC6C1F1559FC9D02BE686C', '118.133.209.174', '1576915826', '2', '119', '0', '', '1', null, '1', null, null, null, '0', null, null, null, null, null);
INSERT INTO `cy_order` VALUES ('332', 'RM1576929789970815', '1', '2', '购物车购买', '200.00', '12.00', '200.00', '0', '2', '2-1,3-1', '2', '1576929789', '1', '38F55B9849E69FD67CE4EB0893F98869', '183.222.21.253', null, '2', '46', '12', null, '3', null, '0', null, null, null, '12', null, null, null, null, null);
INSERT INTO `cy_order` VALUES ('331', 'RM1576929433665571', '26', '20', '还是试试看', '0.10', '0.00', '0.11', '0', '1', '', '1', '1576929433', '1', '44362ACDA4FD2647EBE240083A5E1C6C', '121.58.37.8', '1576929443', '2', '120', '0', '', '1', null, '2', null, null, null, '0', '26', null, '1576929764', '3', null);
INSERT INTO `cy_order` VALUES ('326', 'RM1576915396674238', '33', '20', '还是试试看', '0.10', '0.00', '0.10', '0', '1', '', '1', '1576915396', '1', 'F25B15289A0924BBD5DB497DFC939843', '118.133.209.174', '1576915418', '2', '119', '0', '', '1', null, '2', null, null, null, '0', '33', null, '1576919421', null, null);
INSERT INTO `cy_order` VALUES ('333', 'RM15769297899708152', '1', '2', 'ceshi2', '100.00', '0.00', '100.00', '0', '1', '2-1,3-1', '1', '1576929789', '1', null, null, '1576930141', '2', '46', '0', '购物车购买', '1', null, '1', null, null, null, '6', null, null, null, '2', null);
INSERT INTO `cy_order` VALUES ('334', 'RM15769297899708153', '1', '3', 'ceshi3', '100.00', '0.00', '100.00', '0', '1', '2-1,3-1', '1', '1576929789', '1', null, null, '1576930141', '2', '46', '0', '购物车购买', '1', null, '1', null, null, null, '6', null, null, null, '2', null);
INSERT INTO `cy_order` VALUES ('335', 'RM1576931752712250', '35', '3', 'ceshi3', '100.00', '50.00', '55.00', '0', '1', '', '0', '1576931752', '1', '66470DBDD94D4BFE6BA0C5A395DF27C3', '183.227.56.94', null, '2', '122', '50', '', '1', null, '0', null, null, null, '5', null, null, null, '2', null);
INSERT INTO `cy_order` VALUES ('336', 'RM1576932715180647', '35', '20', '还是试试看', '0.10', '50.00', '0.00', '0', '1', '', '1', '1576932715', '1', null, null, '1576932715', '2', '122', '50', '', '1', null, '1', null, null, null, '0', null, null, null, '3', null);
INSERT INTO `cy_order` VALUES ('337', 'RM1576932720143251', '35', '20', '还是试试看', '0.10', '50.00', '0.00', '0', '1', '', '1', '1576932720', '1', null, null, '1576932720', '2', '122', '50', '', '1', null, '1', null, null, null, '0', null, null, null, '3', null);
INSERT INTO `cy_order` VALUES ('338', 'RM1576932726535566', '35', '20', '还是试试看', '0.10', '50.00', '0.00', '0', '1', '', '1', '1576932726', '1', null, null, '1576932726', '2', '122', '50', '', '1', null, '1', null, null, null, '0', null, null, null, '3', null);
INSERT INTO `cy_order` VALUES ('339', 'RM1576932729818768', '35', '20', '还是试试看', '0.10', '50.00', '0.00', '0', '1', '', '1', '1576932729', '1', null, null, '1576932729', '2', '122', '50', '', '1', null, '1', null, null, null, '0', null, null, null, '3', null);
INSERT INTO `cy_order` VALUES ('340', 'RM1576932795620471', '35', '20', '还是试试看', '0.10', '0.00', '0.11', '0', '1', '', '1', '1576932795', '1', '1C4D04FC0E7562FA5DC97F60D18A08B6', '183.227.56.94', '1576932831', '2', '122', '0', '', '1', null, '1', null, null, null, '0', null, null, null, '3', null);
INSERT INTO `cy_order` VALUES ('402', 'RM1577195924796138', '36', '0', '会员续费', '0.01', null, '0.01', null, '1', null, '1', '1577195924', '1', '346CFC36030A6A28FC9EE78302765616', '116.24.89.247', '1577195948', '1', null, null, null, '1', null, '1', null, null, null, '0', null, null, null, null, null);
INSERT INTO `cy_order` VALUES ('395', 'RM1577181112323813', '36', '13', '1', '2.00', '0.00', '2.00', '0', '1', '\'address-广东省深圳市龙岗区龙翔大道8033号,phone-18666212314NaN', '1', '1577181112', '1', '0C1C14E67C8CEA2EC21D8E297BF0DEF4', '113.118.8.45', '1577181130', '2', '0', '0', 'undefined', '1', null, '2', null, null, null, '0', '36', null, '1577200080', '1', null);
INSERT INTO `cy_order` VALUES ('383', 'RM1577147857438999', '29', '11', '多少', '0.00', '0.00', '0.00', '0', '1', '\'address-江苏省泰州市兴化市,phone-11111222222NaN', '1', '1577147857', '1', null, null, '1577147857', '2', '0', '0', 'undefined', '1', null, '1', null, null, null, '0', null, null, null, '1', null);
INSERT INTO `cy_order` VALUES ('384', 'RM1577147881368914', '28', '11', '测试产品', '100000.00', '0.00', '100000.00', '0', '1', '\'address-江苏省泰州市兴化市,phone-2288273737383NaN', '1', '1577147881', '1', '31045A390F4F13B8DB787A92EE87E4A8', '117.94.24.229', null, '2', '0', '0', 'undefined', '1', null, '1', null, null, null, '0', null, null, null, '1', null);
INSERT INTO `cy_order` VALUES ('385', 'RM1577151392200442', '36', '11', 'ceshi3', '100.00', '0.00', '100.00', '0', '1', '', '1', '1577151392', '1', '4AB93412EC369CDE6B372B9FEA7CCF70', '113.118.8.45', null, '2', '127', '0', '', '1', null, '2', null, null, null, '0', '36', null, '1577168128', '1', null);
INSERT INTO `cy_order` VALUES ('386', 'RM1577151929687693', '36', '11', 'ceshi3', '200.00', '0.00', '220.00', '0', '2', '', '1', '1577151929', '1', 'BF26514FDE910F1A17229ACE818967E1', '113.118.8.45', null, '2', '127', '0', '', '1', null, '2', null, null, null, '20', '36', null, '1577169152', '1', null);
INSERT INTO `cy_order` VALUES ('387', 'RM1577161417161708', '36', '11', 'ceshi3', '100.00', '0.00', '105.00', '0', '1', '', '1', '1577161417', '1', '5CDC7B75F5EC71088F7A9741D4A0F68E', '113.118.8.45', null, '2', '127', '0', '', '1', null, '2', null, null, null, '5', '36', null, '1577163904', '1', null);
INSERT INTO `cy_order` VALUES ('388', 'RM1577161560412302', '36', '11', 'ceshi3', '100.00', '50.00', '55.00', '0', '1', '', '1', '1577161560', '1', '28535404F166F10B95CE96BC0E308B49', '113.118.8.45', null, '2', '127', '50', '', '1', null, '2', null, null, null, '5', '36', null, '1577163253', '1', null);
INSERT INTO `cy_order` VALUES ('389', 'RM1577161574683494', '36', '11', 'ceshi3', '100.00', '50.00', '60.00', '0', '1', '', '1', '1577161574', '1', '9D82AE487E02F743EC44D14528B17356', '113.118.8.45', null, '2', '127', '50', '', '1', null, '3', null, null, null, '10', '36', 'https://lck.hzlyzhenzhi.com/files/attach/file5e01ce6bc1ee8.jpg', '1577163235', '1', '1577197588');
INSERT INTO `cy_order` VALUES ('390', 'RM1577161640586739', '36', '11', 'ceshi3', '100.00', '50.00', '55.00', '0', '1', '', '1', '1577161640', '1', 'C6593A8810A12F9C1796393BD95FB802', '113.118.8.45', null, '2', '127', '50', '', '1', null, '3', null, null, null, '5', '36', null, '1577163102', '1', null);
INSERT INTO `cy_order` VALUES ('391', 'RM1577161649684751', '36', '11', 'ceshi3', '100.00', '0.00', '110.00', '0', '1', '', '1', '1577161649', '1', '04133CED9857EB0161FDB9A494730498', '113.118.8.45', null, '2', '127', '0', '', '1', null, '3', null, null, null, '10', '36', null, '1577162943', '1', null);
INSERT INTO `cy_order` VALUES ('392', 'RM1577161662638206', '36', '11', 'ceshi3', '100.00', '30.00', '80.00', '1', '1', '', '1', '1577161662', '1', '1BDDAC601FB7D0737026BBE85EFA4CEE', '113.118.8.45', null, '2', '127', '0', '', '1', null, '3', null, null, null, '10', '36', null, '1577163175', '1', null);

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
INSERT INTO `cy_order_logistics` VALUES ('1', '68', '韵达', '123456789', '1575355392', '0');
INSERT INTO `cy_order_logistics` VALUES ('2', '67', '韵达', '33333', '1575356859', '0');
INSERT INTO `cy_order_logistics` VALUES ('3', '145', '韵达', '123456789', '1575951079', '1');

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
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='商品';

-- ----------------------------
-- Records of cy_product
-- ----------------------------
INSERT INTO `cy_product` VALUES ('2', 'ceshi2', '50', '52', '100.00', '100', '200', '0', 'http://lck.hzlyzhenzhi.com/api/bg.jpg', 'a:4:{i:0;s:37:\"http://lck.hzlyzhenzhi.com/api/bg.jpg\";i:1;s:37:\"http://lck.hzlyzhenzhi.com/api/bg.jpg\";i:2;s:37:\"http://lck.hzlyzhenzhi.com/api/bg.jpg\";i:3;s:37:\"http://lck.hzlyzhenzhi.com/api/bg.jpg\";}\0', '测试地址', '1589123423', '零件', '知道你的事草泥马草泥马性能明显你小内存虚拟财产那些年	', '2', '1', '200', '1576657865', '1', null, null);
INSERT INTO `cy_product` VALUES ('3', 'ceshi3', '50', '52', '100.00', '100', '200', '0', 'http://lck.hzlyzhenzhi.com/api/bg.jpg', 'a:4:{i:0;s:37:\"http://lck.hzlyzhenzhi.com/api/bg.jpg\";i:1;s:37:\"http://lck.hzlyzhenzhi.com/api/bg.jpg\";i:2;s:37:\"http://lck.hzlyzhenzhi.com/api/bg.jpg\";i:3;s:37:\"http://lck.hzlyzhenzhi.com/api/bg.jpg\";}\0', '测试地址', '1589123423', '零件', '知道你的事草泥马草泥马性能明显你小内存虚拟财产那些年	', '2', '1', '300', '1576225727', '1', null, null);
INSERT INTO `cy_product` VALUES ('4', 'ceshi4', '50', '52', '100.00', '100', '200', '1', 'http://lck.hzlyzhenzhi.com/api/bg.jpg', 'a:4:{i:0;s:37:\"http://lck.hzlyzhenzhi.com/api/bg.jpg\";i:1;s:37:\"http://lck.hzlyzhenzhi.com/api/bg.jpg\";i:2;s:37:\"http://lck.hzlyzhenzhi.com/api/bg.jpg\";i:3;s:37:\"http://lck.hzlyzhenzhi.com/api/bg.jpg\";}\0', '测试地址', '1589123423', '零件', '知道你的事草泥马草泥马性能明显你小内存虚拟财产那些年	', '1', '1', '400', '1576657749', '1', null, null);
INSERT INTO `cy_product` VALUES ('25', '11', '0', '0', '1111.00', 'undefined', '11', '0', 'https://lck.hzlyzhenzhi.com/files/attach/file5e02e517147de.jpg', 's:62:\"https://lck.hzlyzhenzhi.com/files/attach/file5e02e52b59093.jpg\";', '11', '1577248046', '11', '11', '3', '36', '11111', null, '0', 'null', '11');
INSERT INTO `cy_product` VALUES ('7', '1', '50', '52', '2.00', '5', '6', '0', 'http://lck.hzlyzhenzhi.com/files/attach/file5def9c98161a6.png', 's:61:\"http://lck.hzlyzhenzhi.com/files/attach/file5def9cbbb7184.png\";', '8', '1575984323', '4', '7', '1', '25', '3', '1576225727', '1', null, null);
INSERT INTO `cy_product` VALUES ('8', '1', '50', '52', '2.00', '5', '6', '0', 'http://lck.hzlyzhenzhi.com/files/attach/file5df0d2c88c71d.png', 's:61:\"http://lck.hzlyzhenzhi.com/files/attach/file5df0d2bcf3709.png\";', '888', '1576063715', '4', '7', '1', '25', '3', '1576225727', '1', null, null);
INSERT INTO `cy_product` VALUES ('9', '1', '50', '52', '1.00', '4', '5', '0', 'http://lck.hzlyzhenzhi.com/files/attach/file5df0d6a53c8e2.jpg', 's:61:\"http://lck.hzlyzhenzhi.com/files/attach/file5df0d6c1b05c4.jpg\";', '7', '1576064711', '3', '6', '1', '25', '2', '1576225727', '1', null, null);
INSERT INTO `cy_product` VALUES ('10', '测试产品', '50', '52', '100000.00', '100', '100', '0', 'http://lck.hzlyzhenzhi.com/files/attach/file5df0d77a1e8c3.jpg', 's:61:\"http://lck.hzlyzhenzhi.com/files/attach/file5df0d79e3faf4.jpg\";', '成都', '1576064929', '测试', '陈', '1', '25', '100', '1576225727', '1', null, null);
INSERT INTO `cy_product` VALUES ('11', '多少', '50', '52', '0.00', '现在', '小点声', '0', 'http://lck.hzlyzhenzhi.com/files/attach/file5df0e02bed9c8.jpg', 's:61:\"http://lck.hzlyzhenzhi.com/files/attach/file5df0e05aa207c.jpg\";', '的地方', '1576067167', '小点声', '方法不能', '1', '30', '0', '1576225727', '1', null, null);
INSERT INTO `cy_product` VALUES ('12', '111', '50', '52', '222.00', '55', '66', '0', 'http://lck.hzlyzhenzhi.com/files/attach/file5df0e824c5f79.png', 's:123:\"http://lck.hzlyzhenzhi.com/files/attach/file5df0e83f3d78f.png,http://lck.hzlyzhenzhi.com/files/attach/file5df0e8433997c.png\";', '2222', '1576069195', '44', '111', '1', '25', '333', '1576225727', '1', null, null);
INSERT INTO `cy_product` VALUES ('13', '1', '50', '52', '2.00', '5', '6', '0', 'http://lck.hzlyzhenzhi.com/files/attach/file5df0e99ce39d6.png', 's:61:\"http://lck.hzlyzhenzhi.com/files/attach/file5df0e9b044fd4.png\";', '8', '1576069554', '4', '7', '1', '25', '3', '1576225727', '1', null, null);
INSERT INTO `cy_product` VALUES ('14', '1', '50', '52', '2.00', '5', '6', '0', 'http://lck.hzlyzhenzhi.com/files/attach/file5df0ea7d7a6e1.png', 's:123:\"http://lck.hzlyzhenzhi.com/files/attach/file5df0ea906f1c8.png,http://lck.hzlyzhenzhi.com/files/attach/file5df0ea9314fd6.png\";', '99', '1576069791', '4', '78', '1', '25', '3', '1576225727', '1', null, null);
INSERT INTO `cy_product` VALUES ('15', '1', '50', '52', '1.00', '40', '60', '0', 'http://lck.hzlyzhenzhi.com/files/attach/file5df0f1b06068c.jpg', 's:123:\"http://lck.hzlyzhenzhi.com/files/attach/file5df0f1d1d16fc.jpg,http://lck.hzlyzhenzhi.com/files/attach/file5df0f1db5ad4b.jpg\";', '成都', '1576071645', '接口', '厚', '1', '25', '20', '1576225727', '1', null, null);
INSERT INTO `cy_product` VALUES ('16', 'ces222', '50', '52', '111.00', '44', '555', '0', 'http://lck.hzlyzhenzhi.com/files/attach/file5df0f23db0f11.jpg', 's:123:\"http://lck.hzlyzhenzhi.com/files/attach/file5df0f24eb88d3.png,http://lck.hzlyzhenzhi.com/files/attach/file5df0f254b73d4.png\";', 'xa', '1576071767', '33', 'ss', '1', '25', '112', '1576225727', '1', null, null);
INSERT INTO `cy_product` VALUES ('17', 'ceshi', '50', '52', '100.00', '100', '1200', '0', 'http://lck.hzlyzhenzhi.com/files/attach/file5df0ea906f1c8.png', 's:129:\"[\"http://lck.hzlyzhenzhi.com/files/attach/file5df0ea906f1c8.png\",\"http://lck.hzlyzhenzhi.com/files/attach/file5df0ea9314fd6.png\"]\";', '成都市天府大道', '1576072839', '零件', null, '0', '25', '100', '1576225727', '1', null, null);
INSERT INTO `cy_product` VALUES ('18', 'ceshi', '50', '52', '100.00', '100', '1200', '0', 'http://lck.hzlyzhenzhi.com/files/attach/file5df0ea906f1c8.png', 's:129:\"[\"http://lck.hzlyzhenzhi.com/files/attach/file5df0ea906f1c8.png\",\"http://lck.hzlyzhenzhi.com/files/attach/file5df0ea9314fd6.png\"]\";', '成都市天府大道', '1576072882', '零件', null, '0', '25', '100', '1576225727', '1', null, null);
INSERT INTO `cy_product` VALUES ('19', 'ceshi', '50', '52', '100.00', '100', '1200', '0', 'http://lck.hzlyzhenzhi.com/files/attach/file5df0ea906f1c8.png', 's:129:\"[\'http://lck.hzlyzhenzhi.com/files/attach/file5df0ea906f1c8.png\',\'http://lck.hzlyzhenzhi.com/files/attach/file5df0ea9314fd6.png\']\";', '成都市天府大道', '1576072902', '零件', null, '0', '25', '100', '1576225727', '1', null, null);
INSERT INTO `cy_product` VALUES ('26', '表标题', '0', '0', '60.00', 'undefined', '1000', '0', 'https://lck.hzlyzhenzhi.com/files/attach/file5e030602c79a1.png', 's:125:\"https://lck.hzlyzhenzhi.com/files/attach/file5e0305f9e2d1d.jpg,https://lck.hzlyzhenzhi.com/files/attach/file5e0305fe0b977.jpg\";', '交易地址', '1577256456', '品牌名字', '商品介绍', '3', '36', '59', null, '0', 'null', '18666212333');
INSERT INTO `cy_product` VALUES ('24', '标题', '0', '0', '60.00', 'undefined', '1000', '0', 'https://lck.hzlyzhenzhi.com/files/attach/file5e02bd253409b.jpg', 's:62:\"https://lck.hzlyzhenzhi.com/files/attach/file5e02bd48d8c3a.jpg\";', '成都', '1577237838', '品牌', '1', '1', '36', '59', null, '0', 'null', '1');

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
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='质保商品';

-- ----------------------------
-- Records of cy_quality_product
-- ----------------------------
INSERT INTO `cy_quality_product` VALUES ('1', '35', '3', '52', null, '1582804267', '1582406159', '12345qwer', '1582759625', '千斤顶', '1', '261', null, null, null, null, null);
INSERT INTO `cy_quality_product` VALUES ('2', '35', '1', '52', '0', '1589123423', '2019', '212', '1574261983', 'ceshi', '1', '260', null, null, null, null, null);
INSERT INTO `cy_quality_product` VALUES ('3', '35', '2', '52', null, '1589123423', null, null, null, null, '1', null, null, null, null, null, null);

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
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='维修师体现记录';

-- ----------------------------
-- Records of cy_repair_return
-- ----------------------------
INSERT INTO `cy_repair_return` VALUES ('1', '36', '12.00', '1', '1577197388', '1577199588');
INSERT INTO `cy_repair_return` VALUES ('2', '36', '22.00', '1', '1577197588', '1577198588');
INSERT INTO `cy_repair_return` VALUES ('3', '36', '45.00', '0', '1577200689', null);
INSERT INTO `cy_repair_return` VALUES ('4', '36', '45.00', '0', '1577200740', null);
INSERT INTO `cy_repair_return` VALUES ('5', '36', '1.00', '0', '1577251868', null);
INSERT INTO `cy_repair_return` VALUES ('6', '36', '2.00', '0', '1577251894', null);
INSERT INTO `cy_repair_return` VALUES ('7', '36', '1.00', '0', '1577251921', null);

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
) ENGINE=MyISAM AUTO_INCREMENT=70 DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='角色权限表';

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
INSERT INTO `cy_role_catalog` VALUES ('69', '1', '42', '1576916677');

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
INSERT INTO `cy_search` VALUES ('1', '1', '100', '1576220347', '电压');
INSERT INTO `cy_search` VALUES ('2', '1', '200', '1576220357', '电压');
INSERT INTO `cy_search` VALUES ('3', '2', '125', '1576220364', '续航里程');
INSERT INTO `cy_search` VALUES ('4', '2', '400', '1576220372', '续航里程');

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
INSERT INTO `cy_shop` VALUES ('2', 'oathYc2', '15828043607', '08:00-19:00', '', 'http://www.baidu.comhttp://www.baidu.com\r\nhttp://www.baidu.com\r\n', '牛市口路81号', '一个测试', '1', '1572849041', 'http://lck.hzlyzhenzhi.com/api/bg.jpg', '1572850510', '四川省', '成都市', '锦江区', '1', null);
INSERT INTO `cy_shop` VALUES ('3', '测试1', '15828043608', '08:00-20:00', null, null, '天府大道32号', null, '1', '1587654321', 'http://lck.hzlyzhenzhi.com/api/bg.jpg', '1587676676', '四川省', '成都市', '武侯区', '1', null);
INSERT INTO `cy_shop` VALUES ('4', 'oathYc22', '15828043607', '08:00-19:00', '', 'http://www.baidu.comhttp://www.baidu.com\r\nhttp://www.baidu.com\r\n', '天府大道45号', '一个测试', '1', '1572849041', 'http://lck.hzlyzhenzhi.com/api/bg.jpg', '1572850510', '四川省', '成都市', '武侯区', '1', '');
INSERT INTO `cy_shop` VALUES ('5', '测试12', '15828043608', '08:00-20:00', '', '', '天府大道33号', '', '1', '1587654321', 'http://lck.hzlyzhenzhi.com/api/bg.jpg', '1587676676', '四川省', '成都市', '武侯区', '1', '');
INSERT INTO `cy_shop` VALUES ('6', 'oathYc23', '15828043607', '08:00-19:00', '', 'http://www.baidu.comhttp://www.baidu.com\r\nhttp://www.baidu.com\r\n', '天府大道99号', '一个测试', '1', '1572849041', 'http://lck.hzlyzhenzhi.com/api/bg.jpg', '1572850510', '四川省', '成都市', '武侯区', '1', '');
INSERT INTO `cy_shop` VALUES ('7', '测试14', '15828043608', '08:00-20:00', '', '', '天府大道39号', '', '1', '1587654321', 'http://lck.hzlyzhenzhi.com/api/bg.jpg', '1587676676', '四川省', '成都市', '武侯区', '1', '');

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
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=119 DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='用户购物车';

-- ----------------------------
-- Records of cy_shop_cart
-- ----------------------------
INSERT INTO `cy_shop_cart` VALUES ('53', '1', '5', '1576593031', '1');
INSERT INTO `cy_shop_cart` VALUES ('116', '26', '4', '1576930078', '1');
INSERT INTO `cy_shop_cart` VALUES ('3', '1', '4', '1562456528', '1');
INSERT INTO `cy_shop_cart` VALUES ('6', '27', '1', '1575355231', '1');
INSERT INTO `cy_shop_cart` VALUES ('33', '29', '7', '1576148983', '1');
INSERT INTO `cy_shop_cart` VALUES ('34', '29', '3', '1576158015', '1');
INSERT INTO `cy_shop_cart` VALUES ('19', '25', '3', '1575684797', '1');
INSERT INTO `cy_shop_cart` VALUES ('118', '36', '3', '1577175947', '2');
INSERT INTO `cy_shop_cart` VALUES ('57', '1', '7', '1576668887', '1');
INSERT INTO `cy_shop_cart` VALUES ('25', '30', '3', '1575948432', '1');
INSERT INTO `cy_shop_cart` VALUES ('38', '1', '1', '1576562380', '1');
INSERT INTO `cy_shop_cart` VALUES ('73', '35', '1', '1576895309', '1');
INSERT INTO `cy_shop_cart` VALUES ('105', '34', '3', '1576928669', '1');
INSERT INTO `cy_shop_cart` VALUES ('42', '35', '5', '1576591191', '1');
INSERT INTO `cy_shop_cart` VALUES ('114', '33', '4', '1576929064', '1');
INSERT INTO `cy_shop_cart` VALUES ('110', '35', '3', '1576928895', '1');
INSERT INTO `cy_shop_cart` VALUES ('117', '26', '7', '1576930093', '1');
INSERT INTO `cy_shop_cart` VALUES ('115', '35', '2', '1576929098', '1');
INSERT INTO `cy_shop_cart` VALUES ('106', '34', '2', '1576928678', '1');
INSERT INTO `cy_shop_cart` VALUES ('87', '33', '0', '1576903031', '1');
INSERT INTO `cy_shop_cart` VALUES ('103', '34', '1', '1576928558', '1');

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
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='商城信息';

-- ----------------------------
-- Records of cy_shop_message
-- ----------------------------
INSERT INTO `cy_shop_message` VALUES ('1', '关于我们说明', '1', '1574151692', null);
INSERT INTO `cy_shop_message` VALUES ('2', '客服联系说明		大神就科尼塞克奶茶店萨克才能多斯拉克才能登录看成你多斯拉克才能打卢克你弄错的离开时才能多斯拉克才能打卢克才能登录商城呢登录数', '2', '1576496167', 'https://lck.hzlyzhenzhi.com/files/attach/images/20191216/1576496154353118.jpg');
INSERT INTO `cy_shop_message` VALUES ('3', '会员充值说明', '3', '1574151655', null);
INSERT INTO `cy_shop_message` VALUES ('4', '积分规则 积分兑换优惠券 优惠券抵扣商品金额', '4', '1575534362', 'https://lck.hzlyzhenzhi.com/files/attach/images/20191205/1575534357809599.jpg');
INSERT INTO `cy_shop_message` VALUES ('5', '花费100元/年，预计省200元/年', '5', '1576658066', null);

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
) ENGINE=MyISAM AUTO_INCREMENT=129 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户收货地址';

-- ----------------------------
-- Records of cy_user_address
-- ----------------------------
INSERT INTO `cy_user_address` VALUES ('11', '1', 'null', 'null', '122', '2222', '0', '1574140418', 'test', '123456', null);
INSERT INTO `cy_user_address` VALUES ('14', '1', 'null', 'null', '66', '7', '0', '1574141022', '44', '55', null);
INSERT INTO `cy_user_address` VALUES ('15', '1', 'null', 'null', '四川省成都市武侯区', '天府五街', '0', '1574478156', '测试的', '18011654', '公司');
INSERT INTO `cy_user_address` VALUES ('18', 'undefined', 'null', 'null', 'sad', 'null', '0', '1574751019', 'sadas', 'asd', '家');
INSERT INTO `cy_user_address` VALUES ('32', '30', 'null', 'null', '四川省成都市金牛区金府路799号', '金府国际', '1', '1575788562', 'null', '15984817250', '家');
INSERT INTO `cy_user_address` VALUES ('41', '25', 'null', 'null', '3', '4', '1', '1575890981', '1', '2', '家');
INSERT INTO `cy_user_address` VALUES ('71', '33', '山西省', '长治市', '发发发', '发发发', '0', '1576866499', '啦啦啦啦', '13124671483', '046200');
INSERT INTO `cy_user_address` VALUES ('23', '1', 'null', 'null', 'null', 'null', '0', '1575455208', 'null', 'null', '家');
INSERT INTO `cy_user_address` VALUES ('24', '30', 'null', 'null', 'null', 'null', '0', '1575648821', '不让人不饿女', 'null', '家');
INSERT INTO `cy_user_address` VALUES ('25', '30', 'null', 'null', '不仅仅', 'null', '0', '1575648846', 'null', '15984817350', '家');
INSERT INTO `cy_user_address` VALUES ('26', '30', 'null', 'null', '不仅仅', 'null', '0', '1575648846', 'null', '15984817350', '家');
INSERT INTO `cy_user_address` VALUES ('33', '31', 'null', 'null', '四川省成都市金牛区北一巷1号', 'null', '0', '1575790185', '哈哈', '12584865558', '家');
INSERT INTO `cy_user_address` VALUES ('34', '31', 'null', 'null', '四川省成都市金牛区北一巷1号', 'null', '0', '1575790186', '哈哈', '12584865558', '家');
INSERT INTO `cy_user_address` VALUES ('44', '28', 'null', 'null', '江苏省泰州市兴化市', 'null', '0', '1576139656', '经济', '1122333333', '家');
INSERT INTO `cy_user_address` VALUES ('45', 'undefined', '广东省', '广州市', '新港中路397号', '新港中路397号', '0', '1576508094', '张三', '020-81167888', '510000');
INSERT INTO `cy_user_address` VALUES ('46', 'undefined', '内蒙古自治区', '呼伦贝尔市', '副驾驶', '副驾驶', '0', '1576508170', '斤斤计较', '13124671483', '021500');
INSERT INTO `cy_user_address` VALUES ('47', 'undefined', '山西省', '长治市', '发发发', '发发发', '1', '1576508509', '啦啦啦啦', '13124671483', '046200');
INSERT INTO `cy_user_address` VALUES ('48', '1', '广东省', '广州市', '新港中路397号', '新港中路397号', '0', '1576593104', '张三', '020-81167888', '510000');
INSERT INTO `cy_user_address` VALUES ('49', '1', '广东省', '广州市', '新港中路397号', '新港中路397号', '0', '1576593122', '张三', '020-81167888', '510000');
INSERT INTO `cy_user_address` VALUES ('50', '1', '广东省', '广州市', '新港中路397号', '新港中路397号', '1', '1576594209', '张三', '020-81167888', '510000');
INSERT INTO `cy_user_address` VALUES ('51', '33', '广东省', '广州市', '新港中路397号', '新港中路397号', '0', '1576664417', '张三', '020-81167888', '510000');
INSERT INTO `cy_user_address` VALUES ('52', '33', '广东省', '广州市', '新港中路397号', '新港中路397号', '0', '1576665027', '张三', '020-81167888', '510000');
INSERT INTO `cy_user_address` VALUES ('54', '33', '广东省', '广州市', '新港中路397号', '新港中路397号', '0', '1576677501', '张三', '020-81167888', '510000');
INSERT INTO `cy_user_address` VALUES ('55', '33', '广东省', '广州市', '新港中路397号', '新港中路397号', '0', '1576677510', '张三', '020-81167888', '510000');
INSERT INTO `cy_user_address` VALUES ('56', '33', '广东省', '广州市', '新港中路397号', '新港中路397号', '0', '1576677644', '张三', '020-81167888', '510000');
INSERT INTO `cy_user_address` VALUES ('57', '33', '广东省', '广州市', '新港中路397号', '新港中路397号', '0', '1576754446', '张三', '020-81167888', '510000');
INSERT INTO `cy_user_address` VALUES ('58', '33', '广东省', '广州市', '新港中路397号', '新港中路397号', '0', '1576754454', '张三', '020-81167888', '510000');
INSERT INTO `cy_user_address` VALUES ('59', '35', '广东省', '广州市', '新港中路397号', '新港中路397号', '0', '1576754505', '张三', '020-81167888', '510000');
INSERT INTO `cy_user_address` VALUES ('60', '34', '广东省', '广州市', '新港中路397号', '新港中路397号', '0', '1576754556', '张三', '020-81167888', '510000');
INSERT INTO `cy_user_address` VALUES ('61', '34', '广东省', '广州市', '新港中路397号', '新港中路397号', '0', '1576754632', '张三', '020-81167888', '510000');
INSERT INTO `cy_user_address` VALUES ('62', '34', '广东省', '广州市', '新港中路397号', '新港中路397号', '0', '1576754635', '张三', '020-81167888', '510000');
INSERT INTO `cy_user_address` VALUES ('63', '34', '广东省', '广州市', '新港中路397号', '新港中路397号', '0', '1576754643', '张三', '020-81167888', '510000');
INSERT INTO `cy_user_address` VALUES ('64', '34', '广东省', '广州市', '新港中路397号', '新港中路397号', '0', '1576754681', '张三', '020-81167888', '510000');
INSERT INTO `cy_user_address` VALUES ('65', '34', '广东省', '广州市', '新港中路397号', '新港中路397号', '0', '1576754734', '张三', '020-81167888', '510000');
INSERT INTO `cy_user_address` VALUES ('66', '35', '广东省', '广州市', '新港中路397号', '新港中路397号', '0', '1576755278', '张三', '020-81167888', '510000');
INSERT INTO `cy_user_address` VALUES ('67', '35', '广东省', '广州市', '新港中路397号', '新港中路397号', '0', '1576755525', '张三', '020-81167888', '510000');
INSERT INTO `cy_user_address` VALUES ('68', '34', '广东省', '广州市', '新港中路397号', '新港中路397号', '0', '1576848661', '张三', '020-81167888', '510000');
INSERT INTO `cy_user_address` VALUES ('69', '34', '广东省', '广州市', '新港中路397号', '新港中路397号', '0', '1576848677', '张三', '020-81167888', '510000');
INSERT INTO `cy_user_address` VALUES ('70', '34', '广东省', '广州市', '新港中路397号', '新港中路397号', '1', '1576848890', '张三', '020-81167888', '510000');
INSERT INTO `cy_user_address` VALUES ('72', '35', '广东省', '广州市', '新港中路397号', '新港中路397号', '0', '1576890195', '张三', '020-81167888', '510000');
INSERT INTO `cy_user_address` VALUES ('73', '35', '广东省', '广州市', '新港中路397号', '新港中路397号', '0', '1576890671', '张三', '020-81167888', '510000');
INSERT INTO `cy_user_address` VALUES ('74', '35', '广东省', '广州市', '新港中路397号', '新港中路397号', '0', '1576890715', '张三', '020-81167888', '510000');
INSERT INTO `cy_user_address` VALUES ('75', '35', '广东省', '广州市', '新港中路397号', '新港中路397号', '0', '1576891051', '张三', '020-81167888', '510000');
INSERT INTO `cy_user_address` VALUES ('76', '35', '广东省', '广州市', '新港中路397号', '新港中路397号', '0', '1576891117', '张三', '020-81167888', '510000');
INSERT INTO `cy_user_address` VALUES ('77', '35', '广东省', '广州市', '新港中路397号', '新港中路397号', '0', '1576891260', '张三', '020-81167888', '510000');
INSERT INTO `cy_user_address` VALUES ('78', '35', '广东省', '广州市', '新港中路397号', '新港中路397号', '0', '1576891321', '张三', '020-81167888', '510000');
INSERT INTO `cy_user_address` VALUES ('79', '35', '广东省', '广州市', '新港中路397号', '新港中路397号', '0', '1576891393', '张三', '020-81167888', '510000');
INSERT INTO `cy_user_address` VALUES ('80', '35', '广东省', '广州市', '新港中路397号', '新港中路397号', '0', '1576891513', '张三', '020-81167888', '510000');
INSERT INTO `cy_user_address` VALUES ('81', '35', '广东省', '广州市', '新港中路397号', '新港中路397号', '0', '1576891798', '张三', '020-81167888', '510000');
INSERT INTO `cy_user_address` VALUES ('82', '35', '广东省', '广州市', '新港中路397号', '新港中路397号', '0', '1576891803', '张三', '020-81167888', '510000');
INSERT INTO `cy_user_address` VALUES ('83', '35', '广东省', '广州市', '新港中路397号', '新港中路397号', '0', '1576892194', '张三', '020-81167888', '510000');
INSERT INTO `cy_user_address` VALUES ('84', '35', '广东省', '广州市', '新港中路397号', '新港中路397号', '0', '1576892457', '张三', '020-81167888', '510000');
INSERT INTO `cy_user_address` VALUES ('85', '35', '广东省', '广州市', '新港中路397号', '新港中路397号', '0', '1576892741', '张三', '020-81167888', '510000');
INSERT INTO `cy_user_address` VALUES ('86', '35', '广东省', '广州市', '新港中路397号', '新港中路397号', '0', '1576893347', '张三', '020-81167888', '510000');
INSERT INTO `cy_user_address` VALUES ('87', '35', '广东省', '广州市', '新港中路397号', '新港中路397号', '0', '1576894340', '张三', '020-81167888', '510000');
INSERT INTO `cy_user_address` VALUES ('88', '35', '广东省', '广州市', '新港中路397号', '新港中路397号', '0', '1576894369', '张三', '020-81167888', '510000');
INSERT INTO `cy_user_address` VALUES ('89', '35', '广东省', '广州市', '新港中路397号', '新港中路397号', '0', '1576894916', '张三', '020-81167888', '510000');
INSERT INTO `cy_user_address` VALUES ('90', '35', '广东省', '广州市', '新港中路397号', '新港中路397号', '0', '1576895188', '张三', '020-81167888', '510000');
INSERT INTO `cy_user_address` VALUES ('91', '35', '广东省', '广州市', '新港中路397号', '新港中路397号', '0', '1576895194', '张三', '020-81167888', '510000');
INSERT INTO `cy_user_address` VALUES ('92', '35', '广东省', '广州市', '新港中路397号', '新港中路397号', '0', '1576895371', '张三', '020-81167888', '510000');
INSERT INTO `cy_user_address` VALUES ('93', '35', '广东省', '广州市', '新港中路397号', '新港中路397号', '0', '1576896023', '张三', '020-81167888', '510000');
INSERT INTO `cy_user_address` VALUES ('94', '26', 'null', 'null', '海南省三亚市海棠区藤海街', '三楼', '0', '1576896274', '小周', '15984817250', '家');
INSERT INTO `cy_user_address` VALUES ('95', '26', '北京市', '北京市', '我们的', '我们的', '0', '1576896327', '用扫帚', '15984817250', '100010');
INSERT INTO `cy_user_address` VALUES ('96', '35', '广东省', '广州市', '新港中路397号', '新港中路397号', '0', '1576901611', '张三', '020-81167888', '510000');
INSERT INTO `cy_user_address` VALUES ('97', '35', '广东省', '广州市', '新港中路397号', '新港中路397号', '0', '1576901798', '张三', '020-81167888', '510000');
INSERT INTO `cy_user_address` VALUES ('98', '35', '广东省', '广州市', '新港中路397号', '新港中路397号', '0', '1576902047', '张三', '020-81167888', '510000');
INSERT INTO `cy_user_address` VALUES ('99', '35', '广东省', '广州市', '新港中路397号', '新港中路397号', '0', '1576902349', '张三', '020-81167888', '510000');
INSERT INTO `cy_user_address` VALUES ('100', '35', '广东省', '广州市', '新港中路397号', '新港中路397号', '0', '1576902554', '张三', '020-81167888', '510000');
INSERT INTO `cy_user_address` VALUES ('101', '35', '广东省', '广州市', '新港中路397号', '新港中路397号', '0', '1576902902', '张三', '020-81167888', '510000');
INSERT INTO `cy_user_address` VALUES ('102', '35', '广东省', '广州市', '新港中路397号', '新港中路397号', '0', '1576903015', '张三', '020-81167888', '510000');
INSERT INTO `cy_user_address` VALUES ('103', '35', '广东省', '广州市', '新港中路397号', '新港中路397号', '0', '1576903554', '张三', '020-81167888', '510000');
INSERT INTO `cy_user_address` VALUES ('104', '35', '广东省', '广州市', '新港中路397号', '新港中路397号', '0', '1576903792', '张三', '020-81167888', '510000');
INSERT INTO `cy_user_address` VALUES ('105', '35', '广东省', '广州市', '新港中路397号', '新港中路397号', '0', '1576903815', '张三', '020-81167888', '510000');
INSERT INTO `cy_user_address` VALUES ('106', '35', '广东省', '广州市', '新港中路397号', '新港中路397号', '0', '1576903821', '张三', '020-81167888', '510000');
INSERT INTO `cy_user_address` VALUES ('107', '33', '广东省', '广州市', '新港中路397号', '新港中路397号', '0', '1576904272', '张三', '020-81167888', '510000');
INSERT INTO `cy_user_address` VALUES ('108', '33', '广东省', '广州市', '新港中路397号', '新港中路397号', '0', '1576904281', '张三', '020-81167888', '510000');
INSERT INTO `cy_user_address` VALUES ('109', '33', '广东省', '广州市', '新港中路397号', '新港中路397号', '0', '1576904305', '张三', '020-81167888', '510000');
INSERT INTO `cy_user_address` VALUES ('110', '33', '广东省', '广州市', '新港中路397号', '新港中路397号', '0', '1576904313', '张三', '020-81167888', '510000');
INSERT INTO `cy_user_address` VALUES ('111', '33', '广东省', '广州市', '新港中路397号', '新港中路397号', '0', '1576904319', '张三', '020-81167888', '510000');
INSERT INTO `cy_user_address` VALUES ('112', '33', '广东省', '广州市', '新港中路397号', '新港中路397号', '0', '1576904325', '张三', '020-81167888', '510000');
INSERT INTO `cy_user_address` VALUES ('113', '33', '广东省', '广州市', '新港中路397号', '新港中路397号', '0', '1576904338', '张三', '020-81167888', '510000');
INSERT INTO `cy_user_address` VALUES ('114', '33', '广东省', '广州市', '新港中路397号', '新港中路397号', '0', '1576904669', '张三', '020-81167888', '510000');
INSERT INTO `cy_user_address` VALUES ('115', '33', '广东省', '广州市', '新港中路397号', '新港中路397号', '0', '1576905056', '张三', '020-81167888', '510000');
INSERT INTO `cy_user_address` VALUES ('116', '33', '广东省', '广州市', '新港中路397号', '新港中路397号', '0', '1576905943', '张三', '020-81167888', '510000');
INSERT INTO `cy_user_address` VALUES ('117', '33', '广东省', '广州市', '新港中路397号', '新港中路397号', '0', '1576906053', '张三', '020-81167888', '510000');
INSERT INTO `cy_user_address` VALUES ('118', '33', '广东省', '广州市', '新港中路397号', '新港中路397号', '0', '1576907236', '张三', '020-81167888', '510000');
INSERT INTO `cy_user_address` VALUES ('119', '33', '山西省', '长治市', '发发发', '发发发', '1', '1576907697', '啦啦啦啦', '13124671483', '046200');
INSERT INTO `cy_user_address` VALUES ('120', '26', '北京市', '北京市', '我们的', '我们的', '0', '1576907931', '用扫帚', '15984817250', '100010');
INSERT INTO `cy_user_address` VALUES ('121', '35', '广东省', '广州市', '新港中路397号', '新港中路397号', '0', '1576908836', '张三', '020-81167888', '510000');
INSERT INTO `cy_user_address` VALUES ('122', '35', '广东省', '广州市', '新港中路397号', '新港中路397号', '1', '1576909305', '张三', '020-81167888', '510000');
INSERT INTO `cy_user_address` VALUES ('123', '26', '北京市', '北京市', '我们的', '我们的', '1', '1577111895', '用扫帚', '15984817250', '100010');
INSERT INTO `cy_user_address` VALUES ('125', '36', '广东省', '广州市', '新港中路397号', '新港中路397号', '0', '1577116076', '张三', '020-81167888', '510000');
INSERT INTO `cy_user_address` VALUES ('128', '36', '广东省', '广州市', '新港中路397号', '新港中路397号', '1', '1577183392', '张三', '020-81167888', '510000');
INSERT INTO `cy_user_address` VALUES ('127', '36', '广东省', '广州市', '新港中路397号', '新港中路397号', '0', '1577149935', '张三', '020-81167888', '510000');

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
) ENGINE=MyISAM AUTO_INCREMENT=46 DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='用户使用优惠卷';

-- ----------------------------
-- Records of cy_user_coupon
-- ----------------------------
INSERT INTO `cy_user_coupon` VALUES ('1', '25', '1', null, '1575555449', '0');
INSERT INTO `cy_user_coupon` VALUES ('2', '25', '1', null, '1575691120', '0');
INSERT INTO `cy_user_coupon` VALUES ('3', '31', '3', null, '1576042994', '0');
INSERT INTO `cy_user_coupon` VALUES ('4', '31', '5', null, '1576042994', '0');
INSERT INTO `cy_user_coupon` VALUES ('5', '31', '6', null, '1576042994', '0');
INSERT INTO `cy_user_coupon` VALUES ('6', '31', '7', null, '1576042994', '0');
INSERT INTO `cy_user_coupon` VALUES ('7', '31', '8', null, '1576042994', '0');
INSERT INTO `cy_user_coupon` VALUES ('8', '31', '9', null, '1576042994', '0');
INSERT INTO `cy_user_coupon` VALUES ('9', '29', '3', null, '1576147415', '0');
INSERT INTO `cy_user_coupon` VALUES ('10', '29', '5', null, '1576147415', '0');
INSERT INTO `cy_user_coupon` VALUES ('11', '29', '6', null, '1576147415', '0');
INSERT INTO `cy_user_coupon` VALUES ('12', '29', '7', null, '1576147415', '0');
INSERT INTO `cy_user_coupon` VALUES ('13', '29', '8', null, '1576147415', '0');
INSERT INTO `cy_user_coupon` VALUES ('14', '29', '9', null, '1576147415', '0');
INSERT INTO `cy_user_coupon` VALUES ('15', '33', '11', null, '1576735474', '0');
INSERT INTO `cy_user_coupon` VALUES ('16', '33', '11', null, '1576736145', '0');
INSERT INTO `cy_user_coupon` VALUES ('17', '35', '1', null, '1576754121', '0');
INSERT INTO `cy_user_coupon` VALUES ('18', '35', '1', null, '1576754122', '0');
INSERT INTO `cy_user_coupon` VALUES ('19', '35', '1', null, '1576897490', '0');
INSERT INTO `cy_user_coupon` VALUES ('20', '35', '1', null, '1576897835', '0');
INSERT INTO `cy_user_coupon` VALUES ('21', '35', '1', '304', '1576901802', '0');
INSERT INTO `cy_user_coupon` VALUES ('22', '35', '1', '305', '1576902059', '0');
INSERT INTO `cy_user_coupon` VALUES ('23', '35', '1', '306', '1576902354', '0');
INSERT INTO `cy_user_coupon` VALUES ('24', '35', '1', '308', '1576902360', '0');
INSERT INTO `cy_user_coupon` VALUES ('25', '35', '1', '307', '1576902360', '0');
INSERT INTO `cy_user_coupon` VALUES ('26', '35', '1', '309', '1576903557', '0');
INSERT INTO `cy_user_coupon` VALUES ('27', '35', '1', '310', '1576903617', '0');
INSERT INTO `cy_user_coupon` VALUES ('28', '33', '11', '311', '1576907700', '0');
INSERT INTO `cy_user_coupon` VALUES ('29', '33', '11', '312', '1576907705', '0');
INSERT INTO `cy_user_coupon` VALUES ('30', '35', '1', '319', '1576908839', '0');
INSERT INTO `cy_user_coupon` VALUES ('31', '33', '11', '327', '1576917118', '0');
INSERT INTO `cy_user_coupon` VALUES ('32', '33', '11', '328', '1576917145', '0');
INSERT INTO `cy_user_coupon` VALUES ('33', '36', '1', null, '1577152780', '0');
INSERT INTO `cy_user_coupon` VALUES ('34', '36', '1', null, '1577152801', '0');
INSERT INTO `cy_user_coupon` VALUES ('35', '36', '1', '392', '1577161663', '0');
INSERT INTO `cy_user_coupon` VALUES ('36', '36', '1', '393', '1577161669', '0');
INSERT INTO `cy_user_coupon` VALUES ('37', '36', '1', '397', '1577183513', '0');
INSERT INTO `cy_user_coupon` VALUES ('38', '36', '1', null, '1577183974', '0');
INSERT INTO `cy_user_coupon` VALUES ('39', '36', '1', null, '1577183981', '0');
INSERT INTO `cy_user_coupon` VALUES ('40', '36', '3', null, '1577195948', '0');
INSERT INTO `cy_user_coupon` VALUES ('41', '36', '5', null, '1577195948', '0');
INSERT INTO `cy_user_coupon` VALUES ('42', '36', '6', null, '1577195948', '0');
INSERT INTO `cy_user_coupon` VALUES ('43', '36', '7', null, '1577195948', '0');
INSERT INTO `cy_user_coupon` VALUES ('44', '36', '8', null, '1577195948', '0');
INSERT INTO `cy_user_coupon` VALUES ('45', '36', '9', null, '1577195948', '0');

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
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='用户组团';

-- ----------------------------
-- Records of cy_user_group
-- ----------------------------
INSERT INTO `cy_user_group` VALUES ('1', '35', '1', '1', '35', '0', '1582460123', null, '258', '1');
INSERT INTO `cy_user_group` VALUES ('2', '33', '1', '0', '35', '0', '1582635412', null, '258', '1');
INSERT INTO `cy_user_group` VALUES ('3', '35', '2', '1', '35', '1', '1582460123', null, '258', '1');
INSERT INTO `cy_user_group` VALUES ('4', '33', '2', '0', '35', '1', '1582635412', null, '258', '1');
INSERT INTO `cy_user_group` VALUES ('5', '35', '3', '1', '35', '2', '1582460123', null, '258', '1');
INSERT INTO `cy_user_group` VALUES ('6', '33', '3', '0', '35', '2', '1582635412', null, '258', '1');

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
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cy_user_integral
-- ----------------------------
INSERT INTO `cy_user_integral` VALUES ('1', '33', '12', '购买商品赠送', '1572809234', '2');
INSERT INTO `cy_user_integral` VALUES ('2', '33', '24', '优惠券抵扣', '1582345678', '1');
INSERT INTO `cy_user_integral` VALUES ('3', '33', '1000000', '积分兑换优惠卷', '1576735474', '1');
INSERT INTO `cy_user_integral` VALUES ('4', '33', '999700', '积分兑换优惠卷', '1576736145', '1');
INSERT INTO `cy_user_integral` VALUES ('5', '35', '10000', '积分兑换优惠卷', '1576754121', '1');
INSERT INTO `cy_user_integral` VALUES ('6', '35', '9000', '积分兑换优惠卷', '1576754122', '1');
INSERT INTO `cy_user_integral` VALUES ('7', '35', '8000', '积分兑换优惠卷', '1576897490', '1');
INSERT INTO `cy_user_integral` VALUES ('8', '35', '7000', '积分兑换优惠卷', '1576897835', '1');
INSERT INTO `cy_user_integral` VALUES ('9', '33', '0', '购买商品赠送', '1576915418', '2');
INSERT INTO `cy_user_integral` VALUES ('10', '33', '0', '购买商品赠送', '1576915532', '2');
INSERT INTO `cy_user_integral` VALUES ('11', '33', '0', '购买商品赠送', '1576915826', '2');
INSERT INTO `cy_user_integral` VALUES ('12', '33', '0', '购买商品赠送', '1576916195', '2');
INSERT INTO `cy_user_integral` VALUES ('13', '33', '0', '购买商品赠送', '1576916999', '2');
INSERT INTO `cy_user_integral` VALUES ('14', '26', '0', '购买商品赠送', '1576917235', '2');
INSERT INTO `cy_user_integral` VALUES ('15', '33', '0', '购买商品赠送', '1576917856', '2');
INSERT INTO `cy_user_integral` VALUES ('16', '33', '0', '购买商品赠送', '1576918419', '2');
INSERT INTO `cy_user_integral` VALUES ('17', '33', '0', '购买商品赠送', '1576927653', '2');
INSERT INTO `cy_user_integral` VALUES ('18', '26', '100', '购买商品赠送', '1576927821', '2');
INSERT INTO `cy_user_integral` VALUES ('19', '26', '0', '购买商品赠送', '1576929443', '2');
INSERT INTO `cy_user_integral` VALUES ('20', '35', '0', '购买商品赠送', '1576932831', '2');
INSERT INTO `cy_user_integral` VALUES ('21', '26', '2', '购买商品赠送', '1577111905', '2');
INSERT INTO `cy_user_integral` VALUES ('22', '36', '80000', '积分兑换优惠卷', '1577152780', '1');
INSERT INTO `cy_user_integral` VALUES ('23', '36', '79000', '积分兑换优惠卷', '1577152801', '1');
INSERT INTO `cy_user_integral` VALUES ('24', '36', '2', '购买商品赠送', '1577181130', '2');
INSERT INTO `cy_user_integral` VALUES ('25', '36', '1000', '积分兑换优惠卷', '1577183974', '1');
INSERT INTO `cy_user_integral` VALUES ('26', '36', '1000', '积分兑换优惠卷', '1577183981', '1');
INSERT INTO `cy_user_integral` VALUES ('27', '36', '0', '购买商品赠送', '1577195948', '2');

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
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='内容提交 反馈';

-- ----------------------------
-- Records of cy_user_push
-- ----------------------------
INSERT INTO `cy_user_push` VALUES ('1', '25', '111', '1575548883', '1', 's:123:\"http://lck.hzlyzhenzhi.com/files/attach/file5de8f7c652707.png,http://lck.hzlyzhenzhi.com/files/attach/file5de8f7cb711d9.png\";');
INSERT INTO `cy_user_push` VALUES ('2', '25', '111', '1575892016', '1', 's:0:\"\";');
INSERT INTO `cy_user_push` VALUES ('3', '30', '古古惑惑', '1575959858', '1', 's:0:\"\";');
INSERT INTO `cy_user_push` VALUES ('4', '30', '古古惑惑', '1575959859', '1', 's:0:\"\";');
INSERT INTO `cy_user_push` VALUES ('5', '30', '古古惑惑', '1575959860', '1', 's:0:\"\";');
INSERT INTO `cy_user_push` VALUES ('6', '26', '测试', '1576866038', '1', 's:0:\"\";');
INSERT INTO `cy_user_push` VALUES ('7', '26', '测试', '1576866038', '1', 's:0:\"\";');
