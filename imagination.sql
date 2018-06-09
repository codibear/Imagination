/*
Navicat MySQL Data Transfer

Source Server         : j2ee
Source Server Version : 50717
Source Host           : 127.0.0.1:3306
Source Database       : imagination

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2018-06-09 10:43:46
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('123456', '123456');

-- ----------------------------
-- Table structure for bancom
-- ----------------------------
DROP TABLE IF EXISTS `bancom`;
CREATE TABLE `bancom` (
  `companyid` int(11) NOT NULL,
  `companyinfo` text,
  `comaccount` varchar(255) NOT NULL,
  `compassword` varchar(255) NOT NULL,
  `comcerti` varchar(255) NOT NULL,
  `comname` varchar(255) DEFAULT NULL,
  `borndate` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bancom
-- ----------------------------

-- ----------------------------
-- Table structure for bancus
-- ----------------------------
DROP TABLE IF EXISTS `bancus`;
CREATE TABLE `bancus` (
  `userid` int(11) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `userpwd` varchar(255) DEFAULT NULL,
  `nickname` varchar(255) DEFAULT NULL,
  `usermotto` varchar(255) DEFAULT NULL,
  `userinfo` varchar(255) DEFAULT NULL,
  `usercerti` varchar(255) DEFAULT NULL,
  `careuser` varchar(255) DEFAULT NULL,
  `caretopic` varchar(255) DEFAULT NULL,
  `comments` varchar(255) DEFAULT NULL,
  `productid` varchar(255) DEFAULT NULL,
  `prolike` varchar(255) DEFAULT NULL,
  `prodislike` varchar(255) DEFAULT NULL,
  `update` datetime DEFAULT CURRENT_TIMESTAMP,
  `lastlogin` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bancus
-- ----------------------------
INSERT INTO `bancus` VALUES ('11', '2918584111@qq.com', '111111', 'jiayiwei', '231', null, '130221199404101241', null, null, null, null, null, null, '2018-05-25 10:12:47', null);
INSERT INTO `bancus` VALUES ('10', 'zhangsan@qq.com', '123456', 'zxcz', 'zxczx', null, '130221199404101241', null, null, null, null, null, null, '2018-05-25 10:13:42', null);
INSERT INTO `bancus` VALUES ('12', 'zhangsan@qq.com', '123456', '12', '1231', null, '130221199404101241', null, null, null, null, null, null, '2018-05-25 10:14:58', null);
INSERT INTO `bancus` VALUES ('13', 'zhangsan@qq.com', '123456', '213', '123', null, '130221199404101241', null, null, null, null, null, null, '2018-05-25 10:15:47', null);
INSERT INTO `bancus` VALUES ('14', 'zhangsan@qq.com', '123456', '123', '123', null, '130221199404101241', null, null, null, null, null, null, '2018-05-25 10:41:33', null);
INSERT INTO `bancus` VALUES ('15', 'zhangsan@qq.com', '123456', '132', '231', null, '130221199404101241', null, null, null, null, null, null, '2018-05-25 10:43:03', null);
INSERT INTO `bancus` VALUES ('16', 'zhangsan@qq.com', '123456', '123', '123', null, '130221199404101241', null, null, null, null, null, null, '2018-05-25 11:11:49', null);
INSERT INTO `bancus` VALUES ('18', 'shangjia@qq.com', '123456', 'zxcz', '123456', null, '130221199404101241', null, null, null, null, null, null, '2018-05-25 11:14:13', null);
INSERT INTO `bancus` VALUES ('19', 'shangjia@qq.com', '123456', '123', '123', null, '130221199404101241', null, null, null, null, null, null, '2018-05-25 11:15:10', null);
INSERT INTO `bancus` VALUES ('25', 'shangjia@qq.com', '111111', 'daxiong', '你是电你时光', null, '130221199404101241', null, null, null, null, null, null, '2018-06-09 06:08:35', null);
INSERT INTO `bancus` VALUES ('25', 'shangjia@qq.com', '111111', 'daxiong', '你是电你时光', null, '130221199404101241', null, null, null, null, null, null, '2018-06-09 06:08:35', null);

-- ----------------------------
-- Table structure for comculture
-- ----------------------------
DROP TABLE IF EXISTS `comculture`;
CREATE TABLE `comculture` (
  `comcultureid` int(11) NOT NULL AUTO_INCREMENT,
  `companyid` int(11) DEFAULT NULL,
  `contents` text,
  `image` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`comcultureid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comculture
-- ----------------------------

-- ----------------------------
-- Table structure for company
-- ----------------------------
DROP TABLE IF EXISTS `company`;
CREATE TABLE `company` (
  `companyid` int(11) NOT NULL AUTO_INCREMENT,
  `companyinfo` text,
  `comaccount` varchar(255) NOT NULL,
  `compassword` varchar(255) NOT NULL,
  `comcerti` varchar(255) NOT NULL,
  `comname` varchar(255) DEFAULT NULL,
  `borndate` datetime DEFAULT CURRENT_TIMESTAMP,
  `lastlogin` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`companyid`),
  UNIQUE KEY `company_comaccount_uindex` (`comaccount`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of company
-- ----------------------------
INSERT INTO `company` VALUES ('8', ' 我们是一个nb的互联网公司', 'shangjia@qq.com', '111111', '123', '腾讯ab', '2018-06-08 13:45:54', '2018-06-08 13:45:54');
INSERT INTO `company` VALUES ('9', ' 也是一个nb的公司', 'zhangsan@qq.com', '123456', '123', '腾讯', '2018-06-08 13:46:36', '2018-06-08 13:46:36');

-- ----------------------------
-- Table structure for customer
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer` (
  `userid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `userpwd` varchar(255) DEFAULT NULL,
  `nickname` varchar(255) DEFAULT NULL,
  `usermotto` varchar(255) DEFAULT NULL,
  `userinfo` varchar(255) DEFAULT NULL,
  `usercerti` varchar(255) DEFAULT NULL,
  `careuser` varchar(255) DEFAULT NULL,
  `caretopic` varchar(255) DEFAULT NULL,
  `comments` varchar(255) DEFAULT NULL,
  `productid` varchar(255) DEFAULT NULL,
  `prolike` varchar(255) DEFAULT NULL,
  `prodislike` varchar(255) DEFAULT NULL,
  `update` datetime DEFAULT CURRENT_TIMESTAMP,
  `lastlogin` datetime DEFAULT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of customer
-- ----------------------------
INSERT INTO `customer` VALUES ('24', 'zhangsan@qq.com', '123456', 'xiaoxiong', '你时光你是点', '摄动法了恐惧感', '130221199404101241', null, null, null, '0,44,45,46,47', '0,43', '0,43', '2018-06-08 13:45:13', '2018-06-09 10:24:08');

-- ----------------------------
-- Table structure for imag
-- ----------------------------
DROP TABLE IF EXISTS `imag`;
CREATE TABLE `imag` (
  `imaid` int(11) NOT NULL AUTO_INCREMENT,
  `imaname` varchar(255) NOT NULL,
  `userid` int(11) DEFAULT NULL,
  `praisenum` int(11) DEFAULT '0',
  `imatime` datetime DEFAULT CURRENT_TIMESTAMP,
  `imalike` varchar(255) DEFAULT NULL,
  `imadislike` varchar(255) DEFAULT NULL,
  `imabrief` varchar(255) NOT NULL,
  `imacontent` text NOT NULL,
  `imaphoto` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`imaid`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of imag
-- ----------------------------
INSERT INTO `imag` VALUES ('42', 'dfg', '24', '0', '2018-06-09 09:33:05', null, null, 'fdg', '<p>请编写详细信息</p>', '/imaimg/20180609_093305_285.jpg');

-- ----------------------------
-- Table structure for procomment
-- ----------------------------
DROP TABLE IF EXISTS `procomment`;
CREATE TABLE `procomment` (
  `procomid` int(11) NOT NULL AUTO_INCREMENT,
  `productid` int(11) DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  `comments` text,
  `comlike` varchar(255) DEFAULT NULL,
  `comdislike` varchar(255) DEFAULT NULL,
  `borndate` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`procomid`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of procomment
-- ----------------------------
INSERT INTO `procomment` VALUES ('12', '43', '24', '<p>哇，好棒的页面哦</p><p><span style=\"background-color: rgb(255, 255, 0);\">摄动法</span></p>', null, null, '2018-06-08 13:55:21');
INSERT INTO `procomment` VALUES ('13', '48', '24', '<p>大师傅士大夫</p>', null, null, '2018-06-09 09:47:21');

-- ----------------------------
-- Table structure for produ
-- ----------------------------
DROP TABLE IF EXISTS `produ`;
CREATE TABLE `produ` (
  `productid` int(11) NOT NULL AUTO_INCREMENT,
  `productname` varchar(30) NOT NULL,
  `productbrief` varchar(255) DEFAULT NULL,
  `productsaw` int(11) DEFAULT '0',
  `productbuy` int(11) DEFAULT '0',
  `productest` text,
  `productimg` varchar(255) DEFAULT NULL,
  `userid` varchar(255) DEFAULT NULL,
  `companyid` int(11) NOT NULL,
  `price` double DEFAULT NULL,
  `prolike` varchar(255) DEFAULT NULL,
  `prodislike` varchar(255) DEFAULT NULL,
  `borndate` datetime DEFAULT CURRENT_TIMESTAMP,
  `score` varchar(255) DEFAULT '5',
  `scoreid` varchar(255) DEFAULT '0',
  PRIMARY KEY (`productid`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of produ
-- ----------------------------
INSERT INTO `produ` VALUES ('43', '一个创意征询', '一个创意征询', '0', '0', null, '/product/20180608_135012_518.jpg', null, '8', null, 'null,24', '0,24', '2018-06-08 13:50:12', ',43,43', ',24,24');
INSERT INTO `produ` VALUES ('44', '这是一个产品', '这是一个产品', '0', '0', null, '/product/20180608_135119_182.jpg', '0,24', '8', '1234', null, null, '2018-06-08 13:51:19', '0', '0');
INSERT INTO `produ` VALUES ('47', 'ready player one', 'degsfg', '0', '0', null, '/product/20180609_073934_399.jpg', null, '8', '1123', null, null, '2018-06-09 07:39:34', '0', '0');
INSERT INTO `produ` VALUES ('48', 'dfg', 'dfsg', '0', '0', null, '/product/20180609_093347_141.jpg', null, '8', null, null, '0', '2018-06-09 09:33:47', '5,4,3,2,5,5,2,3,3', '0,24,24,24,24,24,24,24,24');

-- ----------------------------
-- Table structure for productdetail
-- ----------------------------
DROP TABLE IF EXISTS `productdetail`;
CREATE TABLE `productdetail` (
  `productid` int(11) NOT NULL,
  `detailid` int(11) NOT NULL AUTO_INCREMENT,
  `content` text,
  `borndate` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`detailid`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of productdetail
-- ----------------------------
INSERT INTO `productdetail` VALUES ('43', '20', '<p>请编写详细信息</p><p>这是一个创意编辑</p><table class=\"table table-bordered\"><tbody><tr><td><br></td><td><br></td><td><br></td></tr><tr><td><br></td><td><br></td><td><br></td></tr><tr><td><br></td><td><br></td><td><br></td></tr></tbody></table><p><br></p>', '2018-06-08 13:50:40');
INSERT INTO `productdetail` VALUES ('44', '21', '<p>请编写详细信息</p><p><span style=\"background-color: rgb(255, 255, 0);\"><span style=\"font-family: &quot;Times New Roman&quot;;\">商品</span><span style=\"font-family: &quot;Times New Roman&quot;;\">啊</span></span></p><p><a href=\"http://baidu.com\" target=\"_blank\">士大夫撒</a><span style=\"background-color: rgb(255, 255, 0);\"><span style=\"font-family: &quot;Times New Roman&quot;;\"><br></span></span></p>', '2018-06-08 13:52:15');
INSERT INTO `productdetail` VALUES ('45', '22', '<p>请编写详细信息</p>', '2018-06-08 22:48:39');
INSERT INTO `productdetail` VALUES ('46', '23', '<p>请编写详细信息</p>', '2018-06-08 22:49:00');
INSERT INTO `productdetail` VALUES ('47', '24', '<p>请编写详细信息</p>', '2018-06-09 07:39:41');
INSERT INTO `productdetail` VALUES ('48', '25', '<p>请编写详细信息</p>', '2018-06-09 09:34:06');

-- ----------------------------
-- Table structure for purchase
-- ----------------------------
DROP TABLE IF EXISTS `purchase`;
CREATE TABLE `purchase` (
  `purchaseid` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) DEFAULT NULL,
  `productid` int(11) DEFAULT NULL,
  `borndate` datetime DEFAULT CURRENT_TIMESTAMP,
  `state` int(11) DEFAULT '0',
  `proname` varchar(50) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `sell` int(11) DEFAULT '0',
  `companyid` int(11) DEFAULT NULL,
  PRIMARY KEY (`purchaseid`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of purchase
-- ----------------------------
INSERT INTO `purchase` VALUES ('11', '24', '44', '2018-06-09 00:02:16', '1', '这是一个产品', 'HeBei Province', '1', '8');
INSERT INTO `purchase` VALUES ('12', '24', '45', '2018-06-09 00:42:48', '1', 'ready player one', 'HeBei Province', '0', '9');
INSERT INTO `purchase` VALUES ('13', '24', '46', '2018-06-09 00:43:00', '0', 'dsf', 'HeBei Province', '0', '9');
INSERT INTO `purchase` VALUES ('14', '24', '47', '2018-06-09 07:39:55', '1', 'ready player one', 'HeBei Province', '2', '8');

-- ----------------------------
-- Table structure for userdetail
-- ----------------------------
DROP TABLE IF EXISTS `userdetail`;
CREATE TABLE `userdetail` (
  `userdetid` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `postcode` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`userdetid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of userdetail
-- ----------------------------
INSERT INTO `userdetail` VALUES ('4', '24', '15612565965', 'HeBei Province', '063000');
