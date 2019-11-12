/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50624
Source Host           : localhost:3306
Source Database       : ys_management

Target Server Type    : MYSQL
Target Server Version : 50624
File Encoding         : 65001

Date: 2019-11-12 11:45:32
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for b_account_log
-- ----------------------------
DROP TABLE IF EXISTS `b_account_log`;
CREATE TABLE `b_account_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `order_id` varchar(32) DEFAULT '0' COMMENT '提现或用户充值订单ID',
  `operate_type` smallint(2) NOT NULL COMMENT '操作类型[0:现金充值1:兑换现金2:兑换游戏币3:提现冻结4:提现扣除5:提现解冻6:用户充值7:信用额兑换8:信用额还款 9 客服下分]',
  `account_type` smallint(1) NOT NULL COMMENT '账户类型[0:现金账户1:游戏币账户2:信用账户3:冻结额]',
  `amount` decimal(9,2) NOT NULL DEFAULT '0.00' COMMENT '变动额度',
  `balance` decimal(9,2) NOT NULL DEFAULT '0.00' COMMENT '余额',
  `trader_id` bigint(20) DEFAULT NULL COMMENT '交易人ID',
  `trader` varchar(20) DEFAULT NULL COMMENT '交易人',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '操作时间',
  `market_id` int(11) DEFAULT NULL COMMENT '盘口ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='客服账户流水表';

-- ----------------------------
-- Records of b_account_log
-- ----------------------------
INSERT INTO `b_account_log` VALUES ('1', '126', '1', '9', '0', '10.00', '100.00', null, '1', '2019-10-11 17:10:32', null);
INSERT INTO `b_account_log` VALUES ('2', '126', '123', '0', '0', '100.00', '0.00', null, '1', '2019-10-11 17:15:37', null);
INSERT INTO `b_account_log` VALUES ('3', '126', '134', '0', '0', '105.00', '0.00', null, '1', '2019-10-11 18:40:00', null);
INSERT INTO `b_account_log` VALUES ('4', '127', '12', '0', '0', '100.00', '400.00', null, '1', '2019-10-12 14:22:55', null);
INSERT INTO `b_account_log` VALUES ('6', '1', '20191014112143991572', '4', '1', '50.00', '315.00', null, '0', '2019-10-14 14:55:11', null);
INSERT INTO `b_account_log` VALUES ('7', '129', '20191015161722265149', '3', '3', '50.00', '950.00', null, 'cp1', '2019-10-15 16:17:22', null);
INSERT INTO `b_account_log` VALUES ('8', '129', '20191015163746899346', '3', '3', '60.00', '890.00', null, 'cp1', '2019-10-15 16:37:46', '211');
INSERT INTO `b_account_log` VALUES ('9', '129', '20191015163746899346', '4', '0', '60.00', '830.00', null, 'cp1', '2019-10-15 16:39:46', '211');
INSERT INTO `b_account_log` VALUES ('10', '1', '0', '9', '0', '100.00', '215.00', '129', 'cp1', '2019-10-16 09:44:16', '9');
INSERT INTO `b_account_log` VALUES ('11', '1', '0', '9', '0', '100.00', '215.00', '129', 'cp1', '2019-10-15 09:44:25', '7');
INSERT INTO `b_account_log` VALUES ('12', '1', '0', '9', '0', '10.00', '305.00', '129', 'cp1', '2019-10-16 10:07:37', '9');
INSERT INTO `b_account_log` VALUES ('13', '129', '0', '0', '0', '10.00', '900.00', '1', 'admin', '2019-10-16 10:07:39', '7');
INSERT INTO `b_account_log` VALUES ('14', '1', '20191016102839763470', '3', '3', '10.00', '295.00', null, 'admin', '2019-10-16 10:28:39', '9');
INSERT INTO `b_account_log` VALUES ('15', '131', '0', '9', '0', '1.00', '9999.00', '132', 'kf123', '2019-10-17 14:34:02', '7');
INSERT INTO `b_account_log` VALUES ('16', '132', '0', '0', '0', '1.00', '101.00', '131', 'cpm', '2019-10-18 14:34:09', '7');

-- ----------------------------
-- Table structure for b_cash_order
-- ----------------------------
DROP TABLE IF EXISTS `b_cash_order`;
CREATE TABLE `b_cash_order` (
  `id` varchar(32) NOT NULL COMMENT '订单ID',
  `user_id` bigint(20) NOT NULL COMMENT '申请人',
  `market_id` bigint(20) NOT NULL COMMENT '盘口用户',
  `parent_id` bigint(20) NOT NULL COMMENT '上级id',
  `cash_amount` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '提现金额',
  `balance` decimal(8,2) DEFAULT '0.00' COMMENT '现金余额',
  `state` smallint(1) DEFAULT '0' COMMENT '状态[0:审核中 1:通过待汇款 2:审核未通过 3:提现完成 4 订单取消  5 已打款]',
  `rec_account_type` smallint(1) NOT NULL DEFAULT '0' COMMENT '账户类型[0: 银行卡1:微信2:支付宝]',
  `rec_account_code` varchar(30) NOT NULL COMMENT '账号[对应卡号、微信号或支付宝账号]',
  `rec_bank_name` varchar(10) DEFAULT NULL COMMENT '银行名称[对应选银行卡时填]',
  `rec_open_bank` varchar(50) DEFAULT NULL COMMENT '开户行[对应选银行卡时填]',
  `pay_bank_name` varchar(10) DEFAULT NULL COMMENT '汇款银行名称[当收款为银行时填]',
  `pay_aaccount_code` varchar(30) DEFAULT NULL COMMENT '汇款账号',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '申请日期',
  `pay_time` datetime DEFAULT NULL COMMENT '打款日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='账户提现订单表';

-- ----------------------------
-- Records of b_cash_order
-- ----------------------------
INSERT INTO `b_cash_order` VALUES ('20191012161949467037', '1', '9', '0', '0.00', '365.00', '4', '0', '123456', null, null, null, null, null, '2019-10-12 16:19:49', null);
INSERT INTO `b_cash_order` VALUES ('20191014093653281771', '1', '9', '0', '50.00', '365.00', '3', '0', '123456789', null, null, null, null, null, '2019-10-14 09:36:53', null);
INSERT INTO `b_cash_order` VALUES ('20191014112143991572', '1', '9', '0', '50.00', '365.00', '3', '0', '234343234', 'fsdf', 'fsf', '上帝银行', '88888888888888888', 'fdsfa', '2019-10-14 11:21:44', null);
INSERT INTO `b_cash_order` VALUES ('20191015151251019886', '129', '7', '0', '32.00', '0.00', '1', '0', '11', '11', '1', '4444', '333', '11', '2019-10-15 15:12:51', '2019-10-15 15:38:01');
INSERT INTO `b_cash_order` VALUES ('20191015151329087520', '129', '7', '0', '30.00', '1000.00', '0', '0', '123', '1111', '111', null, null, null, '2019-10-15 15:13:29', null);
INSERT INTO `b_cash_order` VALUES ('20191015161040470742', '129', '7', '0', '50.00', '1000.00', '0', '0', '454444', '33', '22', null, null, null, '2019-10-15 16:10:40', null);
INSERT INTO `b_cash_order` VALUES ('20191015161722265149', '129', '7', '0', '50.00', '1000.00', '1', '0', '111', '11', '11', null, null, null, '2019-10-15 16:17:22', null);
INSERT INTO `b_cash_order` VALUES ('20191015163746899346', '129', '7', '0', '60.00', '950.00', '3', '0', '5555555', '555', '555', '666', '666', null, '2019-10-15 16:37:47', '2019-10-15 16:38:44');
INSERT INTO `b_cash_order` VALUES ('20191016102839763470', '1', '9', '0', '10.00', '305.00', '0', '0', '111', '11', '11', null, null, '11', '2019-10-16 10:28:40', null);

-- ----------------------------
-- Table structure for b_customer_account
-- ----------------------------
DROP TABLE IF EXISTS `b_customer_account`;
CREATE TABLE `b_customer_account` (
  `user_id` bigint(20) NOT NULL COMMENT '对应用户表的ID',
  `credit_balance` decimal(7,2) DEFAULT '0.00' COMMENT '信用余额',
  `cash_balance` decimal(8,2) DEFAULT '0.00' COMMENT '现金余额',
  `game_currency_type` int(2) DEFAULT '0' COMMENT '游戏币类型[对应兑换类型表ID]',
  `game_currency_balance` decimal(9,2) DEFAULT '0.00' COMMENT '游戏币余额',
  `froze_amount` decimal(8,2) DEFAULT '0.00' COMMENT '冻结金额',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '上级Id',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='客服账户信息表';

-- ----------------------------
-- Records of b_customer_account
-- ----------------------------
INSERT INTO `b_customer_account` VALUES ('1', '100.00', '295.00', '0', '50.00', '0.00', '2019-10-12 16:04:05', '2019-10-16 10:07:40', '0');
INSERT INTO `b_customer_account` VALUES ('129', '0.00', '900.00', '0', '0.00', '0.00', '2019-10-15 15:07:30', '2019-10-16 10:07:40', '131');
INSERT INTO `b_customer_account` VALUES ('130', '0.00', '0.00', '0', '0.00', '0.00', '2019-10-15 15:07:37', '2019-10-15 15:08:03', '131');
INSERT INTO `b_customer_account` VALUES ('131', '0.00', '9999.00', '0', '0.00', '0.00', '2019-10-15 15:07:42', '2019-10-16 14:34:09', '1');
INSERT INTO `b_customer_account` VALUES ('132', '100.00', '101.00', '0', '0.00', '0.00', '2019-10-16 14:24:06', '2019-10-16 14:34:09', '131');
INSERT INTO `b_customer_account` VALUES ('134', '0.00', '0.00', '0', '0.00', '0.00', '2019-10-18 11:34:27', '2019-10-18 11:34:27', '129');
INSERT INTO `b_customer_account` VALUES ('135', '12.00', '12.00', '0', '0.00', '0.00', '2019-10-29 20:26:46', '2019-10-29 20:26:46', '131');
INSERT INTO `b_customer_account` VALUES ('136', '14.00', '0.00', '0', '0.00', '0.00', '2019-10-29 20:33:09', '2019-10-29 20:33:09', '135');

-- ----------------------------
-- Table structure for b_exchange_rate
-- ----------------------------
DROP TABLE IF EXISTS `b_exchange_rate`;
CREATE TABLE `b_exchange_rate` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(20) DEFAULT NULL COMMENT '客服ID',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '上级ID',
  `market_id` int(3) DEFAULT NULL COMMENT '盘口ID',
  `roat` decimal(4,2) NOT NULL DEFAULT '1.00' COMMENT 'RMB兑换游戏币比率[以100元可兑换多少游戏币来算，比如可以换120游戏币，比率就是1.2]',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='客服汇率表';

-- ----------------------------
-- Records of b_exchange_rate
-- ----------------------------
INSERT INTO `b_exchange_rate` VALUES ('1', '124', null, '101', '1.23', '2019-10-11 16:00:29', '2019-10-11 16:00:30');
INSERT INTO `b_exchange_rate` VALUES ('2', '125', '1', '101', '1.40', '2019-10-11 16:03:05', '2019-10-11 16:03:05');
INSERT INTO `b_exchange_rate` VALUES ('3', '126', '1', '101', '1.20', '2019-10-11 18:01:28', '2019-10-11 18:01:28');
INSERT INTO `b_exchange_rate` VALUES ('4', '127', '1', '101', '1.20', '2019-10-11 18:18:30', '2019-10-11 18:18:30');
INSERT INTO `b_exchange_rate` VALUES ('5', '128', '1', '101', '1.20', '2019-10-12 14:04:18', '2019-10-12 14:04:18');
INSERT INTO `b_exchange_rate` VALUES ('6', '132', '131', '211', '1.20', '2019-10-16 14:24:07', '2019-10-16 14:24:07');
INSERT INTO `b_exchange_rate` VALUES ('7', '133', '129', '211', '1.20', '2019-10-18 11:29:14', '2019-10-18 11:29:14');
INSERT INTO `b_exchange_rate` VALUES ('8', '134', '129', '211', '1.20', '2019-10-18 11:34:28', '2019-10-18 11:34:28');
INSERT INTO `b_exchange_rate` VALUES ('9', '135', '131', '211', '1.40', '2019-10-29 20:26:46', '2019-10-29 20:26:46');
INSERT INTO `b_exchange_rate` VALUES ('10', '136', '135', '211', '1.20', '2019-10-29 20:33:10', '2019-10-29 20:33:10');

-- ----------------------------
-- Table structure for b_market_info
-- ----------------------------
DROP TABLE IF EXISTS `b_market_info`;
CREATE TABLE `b_market_info` (
  `id` int(3) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `market_name` varchar(50) NOT NULL COMMENT '盘口名称',
  `user_id` bigint(20) DEFAULT NULL COMMENT '管理员ID',
  `app_id` varchar(20) NOT NULL COMMENT '盘口唯一标识[添加时自动生成]',
  `app_secret` varchar(32) NOT NULL COMMENT '盘口密钥',
  `recharge_url` varchar(255) DEFAULT NULL COMMENT '充值接口地址',
  `logo_url` varchar(255) DEFAULT NULL COMMENT '盘口logo地址',
  `app_type` smallint(1) NOT NULL DEFAULT '0' COMMENT '应用类型[0:棋牌 1:彩票 2:其它]',
  `belong` varchar(50) DEFAULT NULL COMMENT '所属人/组织',
  `state` smallint(1) NOT NULL DEFAULT '0' COMMENT '盘口状态[0:未开盘 1:开盘 2:停盘]',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `open_time` datetime DEFAULT NULL COMMENT '开盘日期时间',
  `close_time` datetime DEFAULT NULL COMMENT '停盘日期时间',
  `dep_id` bigint(20) DEFAULT '0' COMMENT '关联 sys_dept的ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='盘口基础信息表';

-- ----------------------------
-- Records of b_market_info
-- ----------------------------
INSERT INTO `b_market_info` VALUES ('5', 'cp平台', null, '6000000409377154', 'c0df75948adf45f8a55bf89ffe8e6ea7', '', null, '1', '', '0', '2019-10-10 17:29:56', '2019-10-16 17:14:42', null, '209');
INSERT INTO `b_market_info` VALUES ('6', 'qp平台', null, '7000000636339315', 'bcfec96d31384f209cb8e4e61afef210', '', null, '0', '', '0', '2019-10-10 17:30:35', '2019-10-15 17:14:45', null, '210');
INSERT INTO `b_market_info` VALUES ('7', 'cp盘口1', null, '6000000791812935', '2578161dbd5c4857975a3cbf07823e84', '', null, '1', '', '0', '2019-10-10 17:31:17', '2019-10-14 17:14:49', null, '211');
INSERT INTO `b_market_info` VALUES ('8', '棋牌盘口1', null, '4000001774812827', '5405086397904fde9ead1cfbee825cfe', '', null, '0', '', '0', '2019-10-10 17:32:49', '2019-10-12 17:14:53', null, '212');
INSERT INTO `b_market_info` VALUES ('9', 'cp盘口2', null, '9000001329868613', '1491610be1c0413aa58970ec9c867eb3', '', null, '1', '', '0', '2019-10-10 17:46:20', '2019-10-06 17:14:58', null, '213');

-- ----------------------------
-- Table structure for b_recharge_order
-- ----------------------------
DROP TABLE IF EXISTS `b_recharge_order`;
CREATE TABLE `b_recharge_order` (
  `id` varchar(32) NOT NULL COMMENT '订单ID',
  `game_user_id` varchar(32) NOT NULL COMMENT '充值用户ID[对应各应用里的用户ID]',
  `game_user_name` varchar(30) NOT NULL COMMENT '充值用户账号[充值时各应用决定传值，登录名或昵称皆可]',
  `user_id` bigint(20) NOT NULL COMMENT '客服ID',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '上级ID',
  `app_id` varchar(20) DEFAULT NULL COMMENT '盘口id',
  `game_currency_type` int(2) DEFAULT NULL COMMENT '游戏币类型[对应兑换类型表ID]',
  `rmb_amount` decimal(8,2) DEFAULT NULL COMMENT 'RBM充值金额',
  `game_amount` int(9) DEFAULT NULL COMMENT '游戏币充值金额',
  `state` smallint(1) DEFAULT NULL COMMENT '充值状态[0:待办1:已入款待充值2:充值完成3:充值失败4:取消]',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '订单时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '处理时间',
  `account` smallint(1) DEFAULT NULL COMMENT '账户类型[0: 银行卡1:微信2:支付宝]',
  `pay_account_code` varbinary(32) DEFAULT NULL COMMENT '充值账号',
  `rec_account_code` varbinary(32) DEFAULT NULL COMMENT '入账账号',
  `remark` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户充值订单信息表';

-- ----------------------------
-- Records of b_recharge_order
-- ----------------------------
INSERT INTO `b_recharge_order` VALUES ('121212', '2', '15', '11', '0', '7', '0', '280.00', '150', '2', '2019-10-09 14:47:26', '2019-10-16 16:21:35', '1', 0x313131313131, 0x323232323232, '发的发');
INSERT INTO `b_recharge_order` VALUES ('123456', '2', '12', '2', '1', '7', '0', '100.00', '100', '2', '2019-10-09 14:45:11', '2019-10-16 16:13:48', '0', 0x33333333333333333333, 0x343434343434343434343434343434, '二位无无若翁热污染无若无若无若翁绕弯儿翁绕弯儿翁热污染无若 ');
INSERT INTO `b_recharge_order` VALUES ('12345678', '3', '13', '1', '1', '7', '0', '50.00', '100', '4', '2019-10-09 14:46:07', '2019-10-16 16:13:50', '2', 0x33333333333333, 0x31313131313131, 'fsfs');
INSERT INTO `b_recharge_order` VALUES ('123456789', '1', '11', '1', '0', '9', '0', '100.00', null, '0', '2019-10-09 11:26:18', '2019-10-16 16:13:52', '1', null, null, null);
INSERT INTO `b_recharge_order` VALUES ('1234567891', '4', '14', '11', '0', '9', '0', '200.00', '200', '4', '2019-10-09 14:46:49', '2019-10-16 16:13:55', '0', '', '', '');
INSERT INTO `b_recharge_order` VALUES ('33333333', '3', '12', '11', '0', '7', '0', '67.00', '1', null, '2019-10-18 16:01:34', '2019-10-18 16:01:34', null, null, null, null);

-- ----------------------------
-- Table structure for b_sys_conf
-- ----------------------------
DROP TABLE IF EXISTS `b_sys_conf`;
CREATE TABLE `b_sys_conf` (
  `id` int(4) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `category` varchar(20) NOT NULL COMMENT '类别',
  `code` varchar(20) NOT NULL COMMENT '编码',
  `name` varchar(20) NOT NULL COMMENT '名称',
  `vale` smallint(2) NOT NULL DEFAULT '0' COMMENT '值',
  `parent_id` int(4) DEFAULT NULL COMMENT '上级ID',
  `state` smallint(1) NOT NULL DEFAULT '1' COMMENT '状态[0:停用 1:开启]',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 COMMENT='系统参数表';

-- ----------------------------
-- Records of b_sys_conf
-- ----------------------------
INSERT INTO `b_sys_conf` VALUES ('1', 'app_type', 'qp', '棋牌', '0', null, '1', '2019-09-29 10:36:51');
INSERT INTO `b_sys_conf` VALUES ('2', 'app_type', 'cp', '彩票', '1', null, '1', '2019-09-29 10:36:51');
INSERT INTO `b_sys_conf` VALUES ('3', 'app_type', 'qt', '其它', '2', null, '1', '2019-09-29 10:36:51');
INSERT INTO `b_sys_conf` VALUES ('4', 'rmb_exchange_type', 'gold', '金币', '0', null, '1', '2019-09-29 10:36:51');
INSERT INTO `b_sys_conf` VALUES ('5', 'rmb_exchange_type', 'score', '积分', '1', null, '1', '2019-09-29 10:36:51');
INSERT INTO `b_sys_conf` VALUES ('6', 'payment_type', 'bank', '银行', '0', null, '1', '2019-09-29 10:36:51');
INSERT INTO `b_sys_conf` VALUES ('7', 'payment_type', 'wx', '微信', '1', null, '1', '2019-09-29 10:36:51');
INSERT INTO `b_sys_conf` VALUES ('8', 'payment_type', 'zfb', '支付宝', '2', null, '1', '2019-09-29 10:36:51');
INSERT INTO `b_sys_conf` VALUES ('9', 'payment_type', 'cft', '财付通', '3', null, '1', '2019-09-29 10:36:52');
INSERT INTO `b_sys_conf` VALUES ('10', 'bank_type', 'PBOC', '中国人民银行', '0', null, '1', '2019-09-29 10:36:52');
INSERT INTO `b_sys_conf` VALUES ('11', 'bank_type', 'ICBC', '中国工商银行', '1', null, '1', '2019-09-29 10:36:52');
INSERT INTO `b_sys_conf` VALUES ('12', 'bank_type', 'CCB', '中国建设银行', '2', null, '1', '2019-09-29 10:36:52');
INSERT INTO `b_sys_conf` VALUES ('13', 'bank_type', 'ABC', '中国农业银行', '3', null, '1', '2019-09-29 10:36:52');
INSERT INTO `b_sys_conf` VALUES ('14', 'bank_type', 'BCM', '中国交通银行', '4', null, '1', '2019-09-29 10:36:52');
INSERT INTO `b_sys_conf` VALUES ('15', 'bank_type', 'CMB', '招商银行', '5', null, '1', '2019-09-29 10:36:52');
INSERT INTO `b_sys_conf` VALUES ('16', 'bank_type', 'CEB', '中国光大银行', '6', null, '1', '2019-09-29 10:36:52');
INSERT INTO `b_sys_conf` VALUES ('17', 'bank_type', 'CMBC', '中国民生银行', '7', null, '1', '2019-09-29 10:36:52');
INSERT INTO `b_sys_conf` VALUES ('18', 'bank_type', 'HXB', '华夏银行', '8', null, '1', '2019-09-29 10:36:52');
INSERT INTO `b_sys_conf` VALUES ('19', 'bank_type', 'PSBC', '中国邮政储蓄银行', '9', null, '1', '2019-09-29 10:36:52');
INSERT INTO `b_sys_conf` VALUES ('20', 'bank_type', 'CGB', '广发银行', '10', null, '1', '2019-09-29 10:36:52');
INSERT INTO `b_sys_conf` VALUES ('21', 'bank_type', 'PAB', '平安银行', '11', null, '1', '2019-09-29 10:36:52');
INSERT INTO `b_sys_conf` VALUES ('22', 'account_type', 'cash', '现金账户', '0', null, '1', '2019-09-29 10:36:53');
INSERT INTO `b_sys_conf` VALUES ('23', 'account_type', 'game', '游戏币账户', '1', null, '1', '2019-09-29 10:36:53');
INSERT INTO `b_sys_conf` VALUES ('24', 'account_type', 'credit', '信用账户', '2', null, '1', '2019-09-29 10:36:53');
INSERT INTO `b_sys_conf` VALUES ('25', 'account_type', 'froze', '冻结额', '3', null, '1', '2019-09-29 10:36:53');
INSERT INTO `b_sys_conf` VALUES ('26', 'account_operate_type', 'cash_recharge', '现金充值', '0', null, '1', '2019-09-29 10:36:53');
INSERT INTO `b_sys_conf` VALUES ('27', 'account_operate_type', 'exch_cash', '兑换现金', '1', null, '1', '2019-09-29 10:36:53');
INSERT INTO `b_sys_conf` VALUES ('28', 'account_operate_type', 'exch_corn', '兑换游戏币', '2', null, '1', '2019-09-29 10:36:53');
INSERT INTO `b_sys_conf` VALUES ('29', 'account_operate_type', 'cash_frozen', '提现冻结', '3', null, '1', '2019-09-29 10:36:53');
INSERT INTO `b_sys_conf` VALUES ('30', 'account_operate_type', 'cash_deduct', '提现扣除', '4', null, '1', '2019-09-29 10:36:53');
INSERT INTO `b_sys_conf` VALUES ('31', 'account_operate_type', 'unfreeze', '提现解冻', '5', null, '1', '2019-09-29 10:36:53');
INSERT INTO `b_sys_conf` VALUES ('32', 'account_operate_type', 'user_recharge', '用户充值', '6', null, '1', '2019-09-29 10:36:53');
INSERT INTO `b_sys_conf` VALUES ('33', 'account_operate_type', 'credit_exch', '信用额兑换', '7', null, '1', '2019-09-29 10:36:53');
INSERT INTO `b_sys_conf` VALUES ('34', 'account_operate_type', 'return_credit', '信用额还款', '8', null, '1', '2019-09-29 10:36:53');
INSERT INTO `b_sys_conf` VALUES ('35', 'recharge_state', 'wait', '待办', '0', null, '1', '2019-09-29 10:36:54');
INSERT INTO `b_sys_conf` VALUES ('36', 'recharge_state', 'doing', '已入款待充值', '1', null, '1', '2019-09-29 10:36:54');
INSERT INTO `b_sys_conf` VALUES ('37', 'recharge_state', 'done', '充值完成', '2', null, '1', '2019-09-29 10:36:54');
INSERT INTO `b_sys_conf` VALUES ('38', 'recharge_state', 'fail', '充值失败', '3', null, '1', '2019-09-29 10:36:54');
INSERT INTO `b_sys_conf` VALUES ('39', 'recharge_state', 'cancle', '取消', '4', null, '1', '2019-09-29 10:36:54');
INSERT INTO `b_sys_conf` VALUES ('40', 'chat_param', 'isForbidden', '是否禁言', '0', null, '1', '2019-09-29 10:36:54');

-- ----------------------------
-- Table structure for b_user_recharge_log
-- ----------------------------
DROP TABLE IF EXISTS `b_user_recharge_log`;
CREATE TABLE `b_user_recharge_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` varchar(32) NOT NULL COMMENT '订单ID',
  `rmb_amount` decimal(8,2) NOT NULL COMMENT '充值RMB金额',
  `game_amount` int(9) NOT NULL COMMENT '游戏币数',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '充值时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户充值流水表';

-- ----------------------------
-- Records of b_user_recharge_log
-- ----------------------------

-- ----------------------------
-- Table structure for b_work_info
-- ----------------------------
DROP TABLE IF EXISTS `b_work_info`;
CREATE TABLE `b_work_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(20) DEFAULT NULL COMMENT '客服ID',
  `state` smallint(1) DEFAULT NULL COMMENT '打卡上下班状态[0:下班1:上班]',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'create_time',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='客服上下班记录表';

-- ----------------------------
-- Records of b_work_info
-- ----------------------------

-- ----------------------------
-- Table structure for check_code
-- ----------------------------
DROP TABLE IF EXISTS `check_code`;
CREATE TABLE `check_code` (
  `id` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '唯一标识',
  `ip` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT 'ip 地址',
  `msg_id` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT 'messageId',
  `phone` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '手机号',
  `check_code` varchar(16) COLLATE utf8_bin DEFAULT NULL COMMENT '验证码',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `expire_at` datetime DEFAULT NULL COMMENT '过期时间',
  `is_use` tinyint(1) DEFAULT NULL COMMENT '是否使用 0 未使用  1 已使用',
  `use_at` datetime DEFAULT NULL COMMENT '使用时间',
  `del_flag` tinyint(1) DEFAULT NULL COMMENT '是否删除 0 未删除  1 已删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='手机验证码表';

-- ----------------------------
-- Records of check_code
-- ----------------------------
INSERT INTO `check_code` VALUES ('dd68ec66f4d647ec81498c94d9d9c343', '0:0:0:0:0:0:0:1', null, '18301403656', 'QCF7', '2019-11-04 19:55:49', '2019-11-04 20:00:49', '0', null, '0');

-- ----------------------------
-- Table structure for city
-- ----------------------------
DROP TABLE IF EXISTS `city`;
CREATE TABLE `city` (
  `cid` int(11) NOT NULL,
  `city` varchar(50) COLLATE utf8_bin NOT NULL,
  `pid` int(11) NOT NULL,
  PRIMARY KEY (`city`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of city
-- ----------------------------
INSERT INTO `city` VALUES ('73', '七台河市', '10');
INSERT INTO `city` VALUES ('279', '万宁市', '24');
INSERT INTO `city` VALUES ('280', '三亚市', '24');
INSERT INTO `city` VALUES ('127', '三明市', '14');
INSERT INTO `city` VALUES ('164', '三门峡市', '17');
INSERT INTO `city` VALUES ('3', '上海市', '3');
INSERT INTO `city` VALUES ('136', '上饶市', '15');
INSERT INTO `city` VALUES ('281', '东方市', '24');
INSERT INTO `city` VALUES ('214', '东莞市', '20');
INSERT INTO `city` VALUES ('147', '东营市', '16');
INSERT INTO `city` VALUES ('352', '中卫市', '30');
INSERT INTO `city` VALUES ('215', '中山市', '20');
INSERT INTO `city` VALUES ('235', '临夏回族自治州', '21');
INSERT INTO `city` VALUES ('16', '临汾市', '6');
INSERT INTO `city` VALUES ('148', '临沂市', '16');
INSERT INTO `city` VALUES ('297', '临沧市', '25');
INSERT INTO `city` VALUES ('282', '临高县', '24');
INSERT INTO `city` VALUES ('50', '丹东市', '8');
INSERT INTO `city` VALUES ('99', '丽水市', '12');
INSERT INTO `city` VALUES ('298', '丽江市', '25');
INSERT INTO `city` VALUES ('379', '乌兰察布市', '32');
INSERT INTO `city` VALUES ('380', '乌海市', '32');
INSERT INTO `city` VALUES ('357', '乌苏市', '31');
INSERT INTO `city` VALUES ('358', '乌鲁木齐市', '31');
INSERT INTO `city` VALUES ('283', '乐东黎族自治县', '24');
INSERT INTO `city` VALUES ('249', '乐山市', '22');
INSERT INTO `city` VALUES ('137', '九江市', '15');
INSERT INTO `city` VALUES ('27', '云林县', '7');
INSERT INTO `city` VALUES ('216', '云浮市', '20');
INSERT INTO `city` VALUES ('359', '五家渠市', '31');
INSERT INTO `city` VALUES ('284', '五指山市', '24');
INSERT INTO `city` VALUES ('110', '亳州市', '13');
INSERT INTO `city` VALUES ('183', '仙桃市', '18');
INSERT INTO `city` VALUES ('74', '伊 春 市', '10');
INSERT INTO `city` VALUES ('360', '伊宁市', '31');
INSERT INTO `city` VALUES ('217', '佛山市', '20');
INSERT INTO `city` VALUES ('75', '佳木斯市', '10');
INSERT INTO `city` VALUES ('285', '保亭黎族苗族自治县', '24');
INSERT INTO `city` VALUES ('5', '保定市', '5');
INSERT INTO `city` VALUES ('299', '保山市', '25');
INSERT INTO `city` VALUES ('165', '信阳市', '17');
INSERT INTO `city` VALUES ('286', '儋州市', '24');
INSERT INTO `city` VALUES ('361', '克拉玛依市', '31');
INSERT INTO `city` VALUES ('111', '六安市', '13');
INSERT INTO `city` VALUES ('270', '六盘水市', '23');
INSERT INTO `city` VALUES ('236', '兰州市', '21');
INSERT INTO `city` VALUES ('381', '兴安盟', '32');
INSERT INTO `city` VALUES ('250', '内江市', '22');
INSERT INTO `city` VALUES ('251', '凉山彝族自治州', '22');
INSERT INTO `city` VALUES ('382', '包头市', '32');
INSERT INTO `city` VALUES ('1', '北京市', '1');
INSERT INTO `city` VALUES ('331', '北海市', '28');
INSERT INTO `city` VALUES ('184', '十堰市', '18');
INSERT INTO `city` VALUES ('86', '南京市', '11');
INSERT INTO `city` VALUES ('252', '南充市', '22');
INSERT INTO `city` VALUES ('332', '南宁市', '28');
INSERT INTO `city` VALUES ('128', '南平市', '14');
INSERT INTO `city` VALUES ('28', '南投县', '7');
INSERT INTO `city` VALUES ('138', '南昌市', '15');
INSERT INTO `city` VALUES ('87', '南通市', '11');
INSERT INTO `city` VALUES ('166', '南阳市', '17');
INSERT INTO `city` VALUES ('362', '博乐市', '31');
INSERT INTO `city` VALUES ('129', '厦门市', '14');
INSERT INTO `city` VALUES ('76', '双鸭山市', '10');
INSERT INTO `city` VALUES ('29', '台东县', '7');
INSERT INTO `city` VALUES ('30', '台中县', '7');
INSERT INTO `city` VALUES ('31', '台中市', '7');
INSERT INTO `city` VALUES ('32', '台北县', '7');
INSERT INTO `city` VALUES ('33', '台北市', '7');
INSERT INTO `city` VALUES ('34', '台南县', '7');
INSERT INTO `city` VALUES ('35', '台南市', '7');
INSERT INTO `city` VALUES ('100', '台州市', '12');
INSERT INTO `city` VALUES ('112', '合肥市', '13');
INSERT INTO `city` VALUES ('139', '吉安市', '15');
INSERT INTO `city` VALUES ('64', '吉林市', '9');
INSERT INTO `city` VALUES ('363', '吐鲁番市', '31');
INSERT INTO `city` VALUES ('17', '吕梁市', '6');
INSERT INTO `city` VALUES ('353', '吴忠市', '30');
INSERT INTO `city` VALUES ('167', '周口市', '17');
INSERT INTO `city` VALUES ('383', '呼伦贝尔市', '32');
INSERT INTO `city` VALUES ('384', '呼和浩特市', '32');
INSERT INTO `city` VALUES ('364', '和田市', '31');
INSERT INTO `city` VALUES ('185', '咸宁市', '18');
INSERT INTO `city` VALUES ('321', '咸阳市', '27');
INSERT INTO `city` VALUES ('365', '哈密市', '31');
INSERT INTO `city` VALUES ('77', '哈尔滨市', '10');
INSERT INTO `city` VALUES ('6', '唐山市', '5');
INSERT INTO `city` VALUES ('168', '商丘市', '17');
INSERT INTO `city` VALUES ('322', '商洛市', '27');
INSERT INTO `city` VALUES ('366', '喀什市', '31');
INSERT INTO `city` VALUES ('36', '嘉义县', '7');
INSERT INTO `city` VALUES ('37', '嘉义市', '7');
INSERT INTO `city` VALUES ('101', '嘉兴市', '12');
INSERT INTO `city` VALUES ('237', '嘉峪关市', '21');
INSERT INTO `city` VALUES ('65', '四平市', '9');
INSERT INTO `city` VALUES ('354', '固原市', '30');
INSERT INTO `city` VALUES ('367', '图木舒克市', '31');
INSERT INTO `city` VALUES ('38', '基隆市', '7');
INSERT INTO `city` VALUES ('368', '塔城市', '31');
INSERT INTO `city` VALUES ('78', '大 庆 市', '10');
INSERT INTO `city` VALUES ('79', '大兴安岭地区', '10');
INSERT INTO `city` VALUES ('18', '大同市', '6');
INSERT INTO `city` VALUES ('300', '大理白族自治州', '25');
INSERT INTO `city` VALUES ('51', '大连市', '8');
INSERT INTO `city` VALUES ('238', '天水市', '21');
INSERT INTO `city` VALUES ('2', '天津市', '2');
INSERT INTO `city` VALUES ('186', '天门市', '18');
INSERT INTO `city` VALUES ('19', '太原市', '6');
INSERT INTO `city` VALUES ('369', '奎屯市', '31');
INSERT INTO `city` VALUES ('149', '威海市', '16');
INSERT INTO `city` VALUES ('200', '娄底市', '19');
INSERT INTO `city` VALUES ('187', '孝感市', '18');
INSERT INTO `city` VALUES ('130', '宁德市', '14');
INSERT INTO `city` VALUES ('102', '宁波市', '12');
INSERT INTO `city` VALUES ('113', '安庆市', '13');
INSERT INTO `city` VALUES ('323', '安康市', '27');
INSERT INTO `city` VALUES ('169', '安阳市', '17');
INSERT INTO `city` VALUES ('271', '安顺市', '23');
INSERT INTO `city` VALUES ('287', '定安县', '24');
INSERT INTO `city` VALUES ('239', '定西市', '21');
INSERT INTO `city` VALUES ('39', '宜兰县', '7');
INSERT INTO `city` VALUES ('253', '宜宾市', '22');
INSERT INTO `city` VALUES ('188', '宜昌市', '18');
INSERT INTO `city` VALUES ('140', '宜春市', '15');
INSERT INTO `city` VALUES ('324', '宝鸡市', '27');
INSERT INTO `city` VALUES ('114', '宣城市', '13');
INSERT INTO `city` VALUES ('115', '宿州市', '13');
INSERT INTO `city` VALUES ('88', '宿迁市', '11');
INSERT INTO `city` VALUES ('40', '屏东县', '7');
INSERT INTO `city` VALUES ('288', '屯昌县', '24');
INSERT INTO `city` VALUES ('345', '山南地区', '29');
INSERT INTO `city` VALUES ('201', '岳阳市', '19');
INSERT INTO `city` VALUES ('333', '崇左市', '28');
INSERT INTO `city` VALUES ('116', '巢湖市', '13');
INSERT INTO `city` VALUES ('254', '巴中市', '22');
INSERT INTO `city` VALUES ('385', '巴彦淖尔市', '32');
INSERT INTO `city` VALUES ('89', '常州市', '11');
INSERT INTO `city` VALUES ('202', '常德市', '19');
INSERT INTO `city` VALUES ('240', '平凉市', '21');
INSERT INTO `city` VALUES ('170', '平顶山市', '17');
INSERT INTO `city` VALUES ('255', '广元市', '22');
INSERT INTO `city` VALUES ('256', '广安市', '22');
INSERT INTO `city` VALUES ('218', '广州市', '20');
INSERT INTO `city` VALUES ('241', '庆阳市', '21');
INSERT INTO `city` VALUES ('370', '库尔勒市', '31');
INSERT INTO `city` VALUES ('7', '廊坊市', '5');
INSERT INTO `city` VALUES ('325', '延安市', '27');
INSERT INTO `city` VALUES ('66', '延边朝鲜族自治州', '9');
INSERT INTO `city` VALUES ('171', '开封市', '17');
INSERT INTO `city` VALUES ('8', '张家口市', '5');
INSERT INTO `city` VALUES ('203', '张家界市', '19');
INSERT INTO `city` VALUES ('242', '张掖市', '21');
INSERT INTO `city` VALUES ('41', '彰化县', '7');
INSERT INTO `city` VALUES ('90', '徐州市', '11');
INSERT INTO `city` VALUES ('301', '德宏傣族景颇族自治州', '25');
INSERT INTO `city` VALUES ('150', '德州市', '16');
INSERT INTO `city` VALUES ('257', '德阳市', '22');
INSERT INTO `city` VALUES ('20', '忻州市', '6');
INSERT INTO `city` VALUES ('204', '怀化市', '19');
INSERT INTO `city` VALUES ('302', '怒江傈傈族自治州', '25');
INSERT INTO `city` VALUES ('303', '思茅市', '25');
INSERT INTO `city` VALUES ('189', '恩施土家族苗族自治州', '18');
INSERT INTO `city` VALUES ('219', '惠州市', '20');
INSERT INTO `city` VALUES ('258', '成都市', '22');
INSERT INTO `city` VALUES ('91', '扬州市', '11');
INSERT INTO `city` VALUES ('9', '承德市', '5');
INSERT INTO `city` VALUES ('141', '抚州市', '15');
INSERT INTO `city` VALUES ('52', '抚顺市', '8');
INSERT INTO `city` VALUES ('346', '拉萨市', '29');
INSERT INTO `city` VALUES ('220', '揭阳市', '20');
INSERT INTO `city` VALUES ('259', '攀枝花市', '22');
INSERT INTO `city` VALUES ('304', '文山壮族苗族自治州', '25');
INSERT INTO `city` VALUES ('289', '文昌市', '24');
INSERT INTO `city` VALUES ('172', '新乡市', '17');
INSERT INTO `city` VALUES ('142', '新余市', '15');
INSERT INTO `city` VALUES ('42', '新竹县', '7');
INSERT INTO `city` VALUES ('43', '新竹市', '7');
INSERT INTO `city` VALUES ('92', '无锡市', '11');
INSERT INTO `city` VALUES ('347', '日喀则地区', '29');
INSERT INTO `city` VALUES ('151', '日照市', '16');
INSERT INTO `city` VALUES ('305', '昆明市', '25');
INSERT INTO `city` VALUES ('371', '昌吉市　', '31');
INSERT INTO `city` VALUES ('290', '昌江黎族自治县', '24');
INSERT INTO `city` VALUES ('348', '昌都地区', '29');
INSERT INTO `city` VALUES ('306', '昭通市', '25');
INSERT INTO `city` VALUES ('21', '晋中市', '6');
INSERT INTO `city` VALUES ('22', '晋城市', '6');
INSERT INTO `city` VALUES ('143', '景德镇市', '15');
INSERT INTO `city` VALUES ('307', '曲靖市', '25');
INSERT INTO `city` VALUES ('23', '朔州市', '6');
INSERT INTO `city` VALUES ('53', '朝阳市', '8');
INSERT INTO `city` VALUES ('54', '本溪市', '8');
INSERT INTO `city` VALUES ('334', '来宾市', '28');
INSERT INTO `city` VALUES ('103', '杭州市', '12');
INSERT INTO `city` VALUES ('67', '松原市', '9');
INSERT INTO `city` VALUES ('349', '林芝地区', '29');
INSERT INTO `city` VALUES ('313', '果洛藏族自治州', '26');
INSERT INTO `city` VALUES ('152', '枣庄市', '16');
INSERT INTO `city` VALUES ('335', '柳州市', '28');
INSERT INTO `city` VALUES ('205', '株洲市', '19');
INSERT INTO `city` VALUES ('336', '桂林市', '28');
INSERT INTO `city` VALUES ('44', '桃园县', '7');
INSERT INTO `city` VALUES ('221', '梅州市', '20');
INSERT INTO `city` VALUES ('337', '梧州市', '28');
INSERT INTO `city` VALUES ('308', '楚雄彝族自治州', '25');
INSERT INTO `city` VALUES ('326', '榆林市', '27');
INSERT INTO `city` VALUES ('243', '武威市', '21');
INSERT INTO `city` VALUES ('190', '武汉市', '18');
INSERT INTO `city` VALUES ('272', '毕节地区', '23');
INSERT INTO `city` VALUES ('206', '永州市', '19');
INSERT INTO `city` VALUES ('327', '汉中市', '27');
INSERT INTO `city` VALUES ('222', '汕头市', '20');
INSERT INTO `city` VALUES ('223', '汕尾市', '20');
INSERT INTO `city` VALUES ('224', '江门市', '20');
INSERT INTO `city` VALUES ('117', '池州市', '13');
INSERT INTO `city` VALUES ('55', '沈阳市', '8');
INSERT INTO `city` VALUES ('10', '沧州市', '5');
INSERT INTO `city` VALUES ('338', '河池市', '28');
INSERT INTO `city` VALUES ('225', '河源市', '20');
INSERT INTO `city` VALUES ('131', '泉州市', '14');
INSERT INTO `city` VALUES ('153', '泰安市', '16');
INSERT INTO `city` VALUES ('93', '泰州市', '11');
INSERT INTO `city` VALUES ('260', '泸州市', '22');
INSERT INTO `city` VALUES ('173', '洛阳市', '17');
INSERT INTO `city` VALUES ('154', '济南市', '16');
INSERT INTO `city` VALUES ('155', '济宁市', '16');
INSERT INTO `city` VALUES ('174', '济源市', '17');
INSERT INTO `city` VALUES ('314', '海东地区', '26');
INSERT INTO `city` VALUES ('315', '海北藏族自治州', '26');
INSERT INTO `city` VALUES ('316', '海南藏族自治州', '26');
INSERT INTO `city` VALUES ('291', '海口市', '24');
INSERT INTO `city` VALUES ('317', '海西蒙古族藏族自治州', '26');
INSERT INTO `city` VALUES ('156', '淄博市', '16');
INSERT INTO `city` VALUES ('118', '淮北市', '13');
INSERT INTO `city` VALUES ('119', '淮南市', '13');
INSERT INTO `city` VALUES ('94', '淮安市', '11');
INSERT INTO `city` VALUES ('226', '深圳市', '20');
INSERT INTO `city` VALUES ('227', '清远市', '20');
INSERT INTO `city` VALUES ('104', '温州市', '12');
INSERT INTO `city` VALUES ('328', '渭南市', '27');
INSERT INTO `city` VALUES ('105', '湖州市', '12');
INSERT INTO `city` VALUES ('207', '湘潭市', '19');
INSERT INTO `city` VALUES ('208', '湘西土家族苗族自治州', '19');
INSERT INTO `city` VALUES ('228', '湛江市', '20');
INSERT INTO `city` VALUES ('120', '滁州市', '13');
INSERT INTO `city` VALUES ('157', '滨州市', '16');
INSERT INTO `city` VALUES ('175', '漯河市', '17');
INSERT INTO `city` VALUES ('132', '漳州市', '14');
INSERT INTO `city` VALUES ('158', '潍坊市', '16');
INSERT INTO `city` VALUES ('191', '潜江市', '18');
INSERT INTO `city` VALUES ('229', '潮州市', '20');
INSERT INTO `city` VALUES ('292', '澄迈县', '24');
INSERT INTO `city` VALUES ('45', '澎湖县', '7');
INSERT INTO `city` VALUES ('391', '澳门特别行政区', '33');
INSERT INTO `city` VALUES ('176', '濮阳市', '17');
INSERT INTO `city` VALUES ('159', '烟台市', '16');
INSERT INTO `city` VALUES ('177', '焦作市', '17');
INSERT INTO `city` VALUES ('80', '牡丹江市', '10');
INSERT INTO `city` VALUES ('339', '玉林市', '28');
INSERT INTO `city` VALUES ('318', '玉树藏族自治州', '26');
INSERT INTO `city` VALUES ('309', '玉溪市', '25');
INSERT INTO `city` VALUES ('230', '珠海市', '20');
INSERT INTO `city` VALUES ('293', '琼中黎族苗族自治县', '24');
INSERT INTO `city` VALUES ('294', '琼海市', '24');
INSERT INTO `city` VALUES ('244', '甘南藏族自治州', '21');
INSERT INTO `city` VALUES ('261', '甘孜藏族自治州', '22');
INSERT INTO `city` VALUES ('68', '白城市', '9');
INSERT INTO `city` VALUES ('69', '白山市', '9');
INSERT INTO `city` VALUES ('295', '白沙黎族自治县', '24');
INSERT INTO `city` VALUES ('245', '白银市', '21');
INSERT INTO `city` VALUES ('340', '百色市', '28');
INSERT INTO `city` VALUES ('209', '益阳市', '19');
INSERT INTO `city` VALUES ('95', '盐城市', '11');
INSERT INTO `city` VALUES ('56', '盘锦市', '8');
INSERT INTO `city` VALUES ('262', '眉山市', '22');
INSERT INTO `city` VALUES ('355', '石嘴山市', '30');
INSERT INTO `city` VALUES ('11', '石家庄市', '5');
INSERT INTO `city` VALUES ('372', '石河子市　', '31');
INSERT INTO `city` VALUES ('192', '神农架林区', '18');
INSERT INTO `city` VALUES ('133', '福州市', '14');
INSERT INTO `city` VALUES ('12', '秦皇岛市', '5');
INSERT INTO `city` VALUES ('373', '米泉市', '31');
INSERT INTO `city` VALUES ('310', '红河哈尼族彝族自治州', '25');
INSERT INTO `city` VALUES ('106', '绍兴市', '12');
INSERT INTO `city` VALUES ('81', '绥 化 市', '10');
INSERT INTO `city` VALUES ('263', '绵阳市', '22');
INSERT INTO `city` VALUES ('160', '聊城市', '16');
INSERT INTO `city` VALUES ('231', '肇庆市', '20');
INSERT INTO `city` VALUES ('264', '自贡市', '22');
INSERT INTO `city` VALUES ('107', '舟山市', '12');
INSERT INTO `city` VALUES ('121', '芜湖市', '13');
INSERT INTO `city` VALUES ('46', '花莲县', '7');
INSERT INTO `city` VALUES ('96', '苏州市', '11');
INSERT INTO `city` VALUES ('47', '苗栗县', '7');
INSERT INTO `city` VALUES ('232', '茂名市', '20');
INSERT INTO `city` VALUES ('193', '荆州市', '18');
INSERT INTO `city` VALUES ('194', '荆门市', '18');
INSERT INTO `city` VALUES ('134', '莆田市', '14');
INSERT INTO `city` VALUES ('161', '莱芜市', '16');
INSERT INTO `city` VALUES ('162', '菏泽市', '16');
INSERT INTO `city` VALUES ('144', '萍乡市', '15');
INSERT INTO `city` VALUES ('57', '营口市', '8');
INSERT INTO `city` VALUES ('58', '葫芦岛市', '8');
INSERT INTO `city` VALUES ('122', '蚌埠市', '13');
INSERT INTO `city` VALUES ('13', '衡水市', '5');
INSERT INTO `city` VALUES ('210', '衡阳市', '19');
INSERT INTO `city` VALUES ('108', '衢州市', '12');
INSERT INTO `city` VALUES ('195', '襄樊市', '18');
INSERT INTO `city` VALUES ('311', '西双版纳傣族自治州', '25');
INSERT INTO `city` VALUES ('319', '西宁市', '26');
INSERT INTO `city` VALUES ('329', '西安市', '27');
INSERT INTO `city` VALUES ('178', '许昌市', '17');
INSERT INTO `city` VALUES ('341', '贵港市', '28');
INSERT INTO `city` VALUES ('273', '贵阳市', '23');
INSERT INTO `city` VALUES ('342', '贺州市', '28');
INSERT INTO `city` VALUES ('265', '资阳市', '22');
INSERT INTO `city` VALUES ('145', '赣州市', '15');
INSERT INTO `city` VALUES ('386', '赤峰市', '32');
INSERT INTO `city` VALUES ('70', '辽源市', '9');
INSERT INTO `city` VALUES ('59', '辽阳市', '8');
INSERT INTO `city` VALUES ('266', '达州市', '22');
INSERT INTO `city` VALUES ('24', '运城市', '6');
INSERT INTO `city` VALUES ('97', '连云港市', '11');
INSERT INTO `city` VALUES ('312', '迪庆藏族自治州', '25');
INSERT INTO `city` VALUES ('71', '通化市', '9');
INSERT INTO `city` VALUES ('387', '通辽市', '32');
INSERT INTO `city` VALUES ('267', '遂宁市', '22');
INSERT INTO `city` VALUES ('274', '遵义市', '23');
INSERT INTO `city` VALUES ('14', '邢台市', '5');
INSERT INTO `city` VALUES ('350', '那曲地区', '29');
INSERT INTO `city` VALUES ('15', '邯郸市', '5');
INSERT INTO `city` VALUES ('211', '邵阳市', '19');
INSERT INTO `city` VALUES ('179', '郑州市', '17');
INSERT INTO `city` VALUES ('212', '郴州市', '19');
INSERT INTO `city` VALUES ('388', '鄂尔多斯市', '32');
INSERT INTO `city` VALUES ('196', '鄂州市', '18');
INSERT INTO `city` VALUES ('246', '酒泉市', '21');
INSERT INTO `city` VALUES ('4', '重庆市', '4');
INSERT INTO `city` VALUES ('109', '金华市', '12');
INSERT INTO `city` VALUES ('247', '金昌市', '21');
INSERT INTO `city` VALUES ('343', '钦州市', '28');
INSERT INTO `city` VALUES ('60', '铁岭市', '8');
INSERT INTO `city` VALUES ('275', '铜仁地区', '23');
INSERT INTO `city` VALUES ('330', '铜川市', '27');
INSERT INTO `city` VALUES ('123', '铜陵市', '13');
INSERT INTO `city` VALUES ('356', '银川市', '30');
INSERT INTO `city` VALUES ('389', '锡林郭勒盟', '32');
INSERT INTO `city` VALUES ('61', '锦州市', '8');
INSERT INTO `city` VALUES ('98', '镇江市', '11');
INSERT INTO `city` VALUES ('72', '长春市', '9');
INSERT INTO `city` VALUES ('213', '长沙市', '19');
INSERT INTO `city` VALUES ('25', '长治市', '6');
INSERT INTO `city` VALUES ('374', '阜康市', '31');
INSERT INTO `city` VALUES ('62', '阜新市', '8');
INSERT INTO `city` VALUES ('124', '阜阳市', '13');
INSERT INTO `city` VALUES ('344', '防城港市', '28');
INSERT INTO `city` VALUES ('233', '阳江市', '20');
INSERT INTO `city` VALUES ('26', '阳泉市', '6');
INSERT INTO `city` VALUES ('375', '阿克苏市', '31');
INSERT INTO `city` VALUES ('376', '阿勒泰市', '31');
INSERT INTO `city` VALUES ('377', '阿图什市', '31');
INSERT INTO `city` VALUES ('268', '阿坝藏族羌族自治州', '22');
INSERT INTO `city` VALUES ('390', '阿拉善盟', '32');
INSERT INTO `city` VALUES ('378', '阿拉尔市', '31');
INSERT INTO `city` VALUES ('351', '阿里地区', '29');
INSERT INTO `city` VALUES ('248', '陇南市', '21');
INSERT INTO `city` VALUES ('296', '陵水黎族自治县', '24');
INSERT INTO `city` VALUES ('197', '随州市', '18');
INSERT INTO `city` VALUES ('269', '雅安市', '22');
INSERT INTO `city` VALUES ('163', '青岛市', '16');
INSERT INTO `city` VALUES ('63', '鞍山市', '8');
INSERT INTO `city` VALUES ('234', '韶关市', '20');
INSERT INTO `city` VALUES ('382', '香港特别行政区', '34');
INSERT INTO `city` VALUES ('125', '马鞍山市', '13');
INSERT INTO `city` VALUES ('180', '驻马店市', '17');
INSERT INTO `city` VALUES ('48', '高雄县', '7');
INSERT INTO `city` VALUES ('49', '高雄市', '7');
INSERT INTO `city` VALUES ('82', '鸡 西 市', '10');
INSERT INTO `city` VALUES ('83', '鹤 岗 市', '10');
INSERT INTO `city` VALUES ('182', '鹤壁市', '17');
INSERT INTO `city` VALUES ('146', '鹰潭市', '15');
INSERT INTO `city` VALUES ('198', '黄冈市', '18');
INSERT INTO `city` VALUES ('320', '黄南藏族自治州', '26');
INSERT INTO `city` VALUES ('126', '黄山市', '13');
INSERT INTO `city` VALUES ('199', '黄石市', '18');
INSERT INTO `city` VALUES ('84', '黑 河 市', '10');
INSERT INTO `city` VALUES ('276', '黔东南苗族侗族自治州', '23');
INSERT INTO `city` VALUES ('277', '黔南布依族苗族自治州', '23');
INSERT INTO `city` VALUES ('278', '黔西南布依族苗族自治州', '23');
INSERT INTO `city` VALUES ('85', '齐齐哈尔市', '10');
INSERT INTO `city` VALUES ('135', '龙岩市', '14');

-- ----------------------------
-- Table structure for config_job_category
-- ----------------------------
DROP TABLE IF EXISTS `config_job_category`;
CREATE TABLE `config_job_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `jobCategory` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '分类名字  （简单上手，在家 躺赚，轻松兼职，极速可做）',
  `status` tinyint(2) DEFAULT '0' COMMENT '状态  0  可用  1 停用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='分类名字  （简单上手，在家 躺赚，轻松兼职，极速可做）';

-- ----------------------------
-- Records of config_job_category
-- ----------------------------
INSERT INTO `config_job_category` VALUES ('1', '简单上手', '0');
INSERT INTO `config_job_category` VALUES ('2', '在家躺赚', '0');
INSERT INTO `config_job_category` VALUES ('3', '轻松兼职', '0');
INSERT INTO `config_job_category` VALUES ('4', '极速可做', '0');

-- ----------------------------
-- Table structure for config_job_label
-- ----------------------------
DROP TABLE IF EXISTS `config_job_label`;
CREATE TABLE `config_job_label` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `lable` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '职位标签（ 0  火爆  1 急聘   2  热门）',
  `status` tinyint(2) DEFAULT '0' COMMENT '状态  0 启用   1  停用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='职位label  标签 热门  急聘  火爆';

-- ----------------------------
-- Records of config_job_label
-- ----------------------------
INSERT INTO `config_job_label` VALUES ('1', '热门', '0');
INSERT INTO `config_job_label` VALUES ('2', '急聘', '0');
INSERT INTO `config_job_label` VALUES ('3', '火爆', '0');

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table` (
  `table_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) COLLATE utf8_croatian_ci DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) COLLATE utf8_croatian_ci DEFAULT '' COMMENT '表描述',
  `class_name` varchar(100) COLLATE utf8_croatian_ci DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) COLLATE utf8_croatian_ci DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `package_name` varchar(100) COLLATE utf8_croatian_ci DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) COLLATE utf8_croatian_ci DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) COLLATE utf8_croatian_ci DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) COLLATE utf8_croatian_ci DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) COLLATE utf8_croatian_ci DEFAULT NULL COMMENT '生成功能作者',
  `options` varchar(1000) COLLATE utf8_croatian_ci DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) COLLATE utf8_croatian_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_croatian_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8_croatian_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_croatian_ci COMMENT='代码生成业务表';

-- ----------------------------
-- Records of gen_table
-- ----------------------------

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column` (
  `column_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` varchar(64) COLLATE utf8_croatian_ci DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) COLLATE utf8_croatian_ci DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) COLLATE utf8_croatian_ci DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) COLLATE utf8_croatian_ci DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) COLLATE utf8_croatian_ci DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) COLLATE utf8_croatian_ci DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) COLLATE utf8_croatian_ci DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) COLLATE utf8_croatian_ci DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) COLLATE utf8_croatian_ci DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) COLLATE utf8_croatian_ci DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) COLLATE utf8_croatian_ci DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) COLLATE utf8_croatian_ci DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) COLLATE utf8_croatian_ci DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) COLLATE utf8_croatian_ci DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) COLLATE utf8_croatian_ci DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) COLLATE utf8_croatian_ci DEFAULT '' COMMENT '字典类型',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) COLLATE utf8_croatian_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_croatian_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_croatian_ci COMMENT='代码生成业务表字段';

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------

-- ----------------------------
-- Table structure for job_position
-- ----------------------------
DROP TABLE IF EXISTS `job_position`;
CREATE TABLE `job_position` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `companyId` bigint(20) DEFAULT NULL COMMENT '公司ID',
  `kfId` bigint(20) DEFAULT NULL COMMENT '客服ID',
  `title` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '职位标题',
  `type` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '类型 （长期可做  短期 ）',
  `cleanType` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '结算方式（300元/天）',
  `needPeople` int(11) DEFAULT '0' COMMENT '招聘人数',
  `hasPeople` int(11) DEFAULT '0' COMMENT '已录取人数',
  `reportPeople` int(11) DEFAULT '0' COMMENT '报名人数',
  `money` varchar(255) COLLATE utf8_bin DEFAULT '0' COMMENT '薪资',
  `jobRequired` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '工作要求（兼职  性别）',
  `taskType` int(11) DEFAULT NULL COMMENT '任务类型（服务员  收银员,关联jobTitledetail 的id ）',
  `workflow` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '工作流程',
  `jobDetail` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '职位详情',
  `address` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '工作详细地点',
  `location` int(11) DEFAULT NULL COMMENT '位置  关联city 表的id',
  `lable` tinyint(2) DEFAULT NULL COMMENT '职位标签（ 0  火爆  1 急聘   2  热门）',
  `category` tinyint(2) DEFAULT NULL COMMENT '职位分类  （1 简单  2 躺赚 3 轻松   4 极速 关联 config_job_category 的ID）',
  `publishTime` datetime DEFAULT NULL COMMENT '发布时间',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  `updateTime` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `index_2` (`companyId`),
  KEY `index_1` (`taskType`,`location`,`category`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='职位信息';

-- ----------------------------
-- Records of job_position
-- ----------------------------
INSERT INTO `job_position` VALUES ('1', '1', '1', '急聘 传单员', '长期可做', '日结', '9999', '50', '15', '200/天', '和复活节但是', '29', '法沙发沙发', '会发生考核方式客户反馈是否开始疯狂撒谎合肥发挥后发双方开始发生', '北京市海淀区', '1', '1', '1', '2019-11-06 15:04:08', '2019-11-06 15:04:13', '2019-11-06 15:04:17');
INSERT INTO `job_position` VALUES ('2', '1', '1', '急聘 美工', '长期可做', '日结', '9999', '50', '15', '200/天', '和复活节但是', '29', '法沙发沙发', '会发生考核方式客户反馈是否开始疯狂撒谎合肥发挥后发双方开始发生', '北京市海淀区', '1', '1', '1', '2019-11-06 15:04:08', '2019-11-06 15:04:13', '2019-11-06 15:04:17');
INSERT INTO `job_position` VALUES ('3', '1', '1', '直聘 理发师', '长期可做', '日结', '9999', '50', '15', '300/天', '和复活节但是', '28', '法沙发沙发', '会发生考核方式客户反馈是否开始疯狂撒谎合肥发挥后发双方开始发生', '北京市海淀区', '2', '1', '2', '2019-11-06 15:04:08', '2019-11-06 15:04:13', '2019-11-06 15:04:17');
INSERT INTO `job_position` VALUES ('4', '1', '1', '急聘 普工', '长期可做', '日结', '9999', '50', '15', '300/天', '和复活节但是', '28', '法沙发沙发', '会发生考核方式客户反馈是否开始疯狂撒谎合肥发挥后发双方开始发生', '北京市海淀区', '2', '1', '2', '2019-11-06 15:04:08', '2019-11-06 15:04:13', '2019-11-06 15:04:17');
INSERT INTO `job_position` VALUES ('5', '1', '1', '急聘 传单员', '长期可做', '日结', '9999', '50', '15', '250/天', '和复活节但是', '27', '法沙发沙发', '会发生考核方式客户反馈是否开始疯狂撒谎合肥发挥后发双方开始发生', '北京市海淀区', '3', '1', '3', '2019-10-30 15:04:08', '2019-11-06 15:04:13', '2019-11-06 15:04:17');
INSERT INTO `job_position` VALUES ('6', '1', '1', '急聘 传菜员', '长期可做', '日结', '9999', '50', '15', '300/天', '和复活节但是', '27', '法沙发沙发', '会发生考核方式客户反馈是否开始疯狂撒谎合肥发挥后发双方开始发生', '北京市海淀区', '3', '1', '3', '2019-10-31 15:04:08', '2019-11-06 15:04:13', '2019-11-06 15:04:17');
INSERT INTO `job_position` VALUES ('7', '1', '1', '急聘 理发师', '长期可做', '日结', '9999', '50', '15', '350/天', '和复活节但是', '26', '法沙发沙发', '会发生考核方式客户反馈是否开始疯狂撒谎合肥发挥后发双方开始发生', '北京市海淀区', '4', '1', '4', '2019-11-01 15:04:08', '2019-11-06 15:04:13', '2019-11-06 15:04:17');
INSERT INTO `job_position` VALUES ('8', '1', '1', '急聘 客服', '长期可做', '日结', '9999', '50', '15', '300/天', '和复活节但是', '26', '法沙发沙发', '会发生考核方式客户反馈是否开始疯狂撒谎合肥发挥后发双方开始发生', '北京市海淀区', '4', '1', '4', '2019-11-02 15:04:08', '2019-11-06 15:04:13', '2019-11-06 15:04:17');
INSERT INTO `job_position` VALUES ('9', '1', '1', '急聘 翻译', '长期可做', '日结', '9999', '50', '15', '200/天', '和复活节但是', '25', '法沙发沙发', '会发生考核方式客户反馈是否开始疯狂撒谎合肥发挥后发双方开始发生', '北京市海淀区', '5', '1', '1', '2019-11-03 15:04:08', '2019-11-06 15:04:13', '2019-11-06 15:04:17');
INSERT INTO `job_position` VALUES ('10', '1', '1', '急聘 文员', '长期可做', '日结', '9999', '50', '15', '300/天', '和复活节但是', '25', '法沙发沙发', '会发生考核方式客户反馈是否开始疯狂撒谎合肥发挥后发双方开始发生', '北京市海淀区', '5', '1', '1', '2019-11-06 15:04:08', '2019-11-06 15:04:13', '2019-11-06 15:04:17');
INSERT INTO `job_position` VALUES ('11', '1', '1', '急聘 促销', '长期可做', '日结', '9999', '50', '15', '300/天', '和复活节但是', '24', '法沙发沙发', '会发生考核方式客户反馈是否开始疯狂撒谎合肥发挥后发双方开始发生', '北京市海淀区', '6', '1', '3', '2019-11-05 15:04:08', '2019-11-06 15:04:13', '2019-11-06 15:04:17');
INSERT INTO `job_position` VALUES ('12', '1', '1', '急聘 传单员', '长期可做', '日结', '9999', '50', '15', '300/天', '和复活节但是', '24', '法沙发沙发', '会发生考核方式客户反馈是否开始疯狂撒谎合肥发挥后发双方开始发生', '北京市海淀区', '6', '1', '4', '2019-11-04 15:04:08', '2019-11-06 15:04:13', '2019-11-06 15:04:17');

-- ----------------------------
-- Table structure for job_title
-- ----------------------------
DROP TABLE IF EXISTS `job_title`;
CREATE TABLE `job_title` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '职位标签（一级）',
  `status` tinyint(2) DEFAULT '0' COMMENT '是否删除（ 0 为删除   1  已删除）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='一级职位表';

-- ----------------------------
-- Records of job_title
-- ----------------------------
INSERT INTO `job_title` VALUES ('1', '体力达人', '0');
INSERT INTO `job_title` VALUES ('2', '室内推荐', '0');
INSERT INTO `job_title` VALUES ('3', '专业推荐', '0');
INSERT INTO `job_title` VALUES ('4', '特色职业', '0');
INSERT INTO `job_title` VALUES ('5', '简单易做', '0');
INSERT INTO `job_title` VALUES ('6', '跑腿办事', '0');
INSERT INTO `job_title` VALUES ('7', '演艺达人', '0');
INSERT INTO `job_title` VALUES ('8', '优秀青年', '0');

-- ----------------------------
-- Table structure for job_title_detail
-- ----------------------------
DROP TABLE IF EXISTS `job_title_detail`;
CREATE TABLE `job_title_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT NULL COMMENT '关联job_title表的ID',
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `status` tinyint(2) DEFAULT '0' COMMENT '是否删除  0 未删除 1  已删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='详细职业表';

-- ----------------------------
-- Records of job_title_detail
-- ----------------------------
INSERT INTO `job_title_detail` VALUES ('1', '1', '普工', '0');
INSERT INTO `job_title_detail` VALUES ('2', '1', '餐饮工', '0');
INSERT INTO `job_title_detail` VALUES ('3', '1', '服务员', '0');
INSERT INTO `job_title_detail` VALUES ('4', '1', '安保', '0');
INSERT INTO `job_title_detail` VALUES ('5', '1', '会展执行', '0');
INSERT INTO `job_title_detail` VALUES ('6', '1', '快递配送', '0');
INSERT INTO `job_title_detail` VALUES ('7', '2', '话务客服', '0');
INSERT INTO `job_title_detail` VALUES ('8', '2', '促销导购', '0');
INSERT INTO `job_title_detail` VALUES ('9', '2', '文员', '0');
INSERT INTO `job_title_detail` VALUES ('10', '2', '展会协助', '0');
INSERT INTO `job_title_detail` VALUES ('11', '2', '销售', '0');
INSERT INTO `job_title_detail` VALUES ('12', '3', '司机代驾', '0');
INSERT INTO `job_title_detail` VALUES ('13', '3', '技师技工', '0');
INSERT INTO `job_title_detail` VALUES ('14', '3', '美容美发', '0');
INSERT INTO `job_title_detail` VALUES ('15', '3', '月嫂阿姨', '0');
INSERT INTO `job_title_detail` VALUES ('16', '3', '在线老师', '0');
INSERT INTO `job_title_detail` VALUES ('17', '4', '普工', '0');
INSERT INTO `job_title_detail` VALUES ('18', '4', '家教导师', '0');
INSERT INTO `job_title_detail` VALUES ('19', '4', '客服', '0');
INSERT INTO `job_title_detail` VALUES ('20', '4', '健身教练', '0');
INSERT INTO `job_title_detail` VALUES ('21', '4', '翻译', '0');
INSERT INTO `job_title_detail` VALUES ('22', '4', '婚礼主持', '0');
INSERT INTO `job_title_detail` VALUES ('23', '4', '摄影摄像', '0');
INSERT INTO `job_title_detail` VALUES ('24', '4', '旅游导游', '0');
INSERT INTO `job_title_detail` VALUES ('25', '4', '美工设计', '0');
INSERT INTO `job_title_detail` VALUES ('26', '4', '创意策划', '0');
INSERT INTO `job_title_detail` VALUES ('27', '4', '财务会计', '0');
INSERT INTO `job_title_detail` VALUES ('28', '4', '软件开发', '0');
INSERT INTO `job_title_detail` VALUES ('29', '5', '传单派发', '0');
INSERT INTO `job_title_detail` VALUES ('30', '5', '低碳拉访', '0');
INSERT INTO `job_title_detail` VALUES ('31', '5', '打包分拣', '0');
INSERT INTO `job_title_detail` VALUES ('32', '5', '充场', '0');
INSERT INTO `job_title_detail` VALUES ('33', '5', '问卷调查', '0');
INSERT INTO `job_title_detail` VALUES ('34', '5', '审核录入', '0');
INSERT INTO `job_title_detail` VALUES ('35', '5', '保洁', '0');
INSERT INTO `job_title_detail` VALUES ('36', '6', '挂号排队', '0');
INSERT INTO `job_title_detail` VALUES ('37', '6', '送餐', '0');
INSERT INTO `job_title_detail` VALUES ('38', '6', '宠物寄养', '0');
INSERT INTO `job_title_detail` VALUES ('39', '6', '车票代购', '0');
INSERT INTO `job_title_detail` VALUES ('40', '7', '礼仪模特', '0');
INSERT INTO `job_title_detail` VALUES ('41', '7', '群众演员', '0');
INSERT INTO `job_title_detail` VALUES ('42', '7', '演出', '0');
INSERT INTO `job_title_detail` VALUES ('43', '7', '主播', '0');
INSERT INTO `job_title_detail` VALUES ('44', '8', '志愿者', '0');
INSERT INTO `job_title_detail` VALUES ('45', '8', '救生员', '0');
INSERT INTO `job_title_detail` VALUES ('46', '8', '实习生', '0');
INSERT INTO `job_title_detail` VALUES ('47', '8', '社会义工', '0');

-- ----------------------------
-- Table structure for provincial
-- ----------------------------
DROP TABLE IF EXISTS `provincial`;
CREATE TABLE `provincial` (
  `pid` int(11) NOT NULL AUTO_INCREMENT,
  `provincial` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='省份';

-- ----------------------------
-- Records of provincial
-- ----------------------------
INSERT INTO `provincial` VALUES ('1', '北京市');
INSERT INTO `provincial` VALUES ('2', '天津市');
INSERT INTO `provincial` VALUES ('3', '上海市');
INSERT INTO `provincial` VALUES ('4', '重庆市');
INSERT INTO `provincial` VALUES ('5', '河北省');
INSERT INTO `provincial` VALUES ('6', '山西省');
INSERT INTO `provincial` VALUES ('7', '台湾省');
INSERT INTO `provincial` VALUES ('8', '辽宁省');
INSERT INTO `provincial` VALUES ('9', '吉林省');
INSERT INTO `provincial` VALUES ('10', '黑龙江省');
INSERT INTO `provincial` VALUES ('11', '江苏省');
INSERT INTO `provincial` VALUES ('12', '浙江省');
INSERT INTO `provincial` VALUES ('13', '安徽省');
INSERT INTO `provincial` VALUES ('14', '福建省');
INSERT INTO `provincial` VALUES ('15', '江西省');
INSERT INTO `provincial` VALUES ('16', '山东省');
INSERT INTO `provincial` VALUES ('17', '河南省');
INSERT INTO `provincial` VALUES ('18', '湖北省');
INSERT INTO `provincial` VALUES ('19', '湖南省');
INSERT INTO `provincial` VALUES ('20', '广东省');
INSERT INTO `provincial` VALUES ('21', '甘肃省');
INSERT INTO `provincial` VALUES ('22', '四川省');
INSERT INTO `provincial` VALUES ('23', '贵州省');
INSERT INTO `provincial` VALUES ('24', '海南省');
INSERT INTO `provincial` VALUES ('25', '云南省');
INSERT INTO `provincial` VALUES ('26', '青海省');
INSERT INTO `provincial` VALUES ('27', '陕西省');
INSERT INTO `provincial` VALUES ('28', '广西壮族自治区');
INSERT INTO `provincial` VALUES ('29', '西藏自治区');
INSERT INTO `provincial` VALUES ('30', '宁夏回族自治区');
INSERT INTO `provincial` VALUES ('31', '新疆维吾尔自治区');
INSERT INTO `provincial` VALUES ('32', '内蒙古自治区');
INSERT INTO `provincial` VALUES ('33', '澳门特别行政区');
INSERT INTO `provincial` VALUES ('34', '香港特别行政区');

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `blob_data` blob,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `QRTZ_BLOB_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars` (
  `sched_name` varchar(120) NOT NULL,
  `calendar_name` varchar(200) NOT NULL,
  `calendar` blob NOT NULL,
  PRIMARY KEY (`sched_name`,`calendar_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `cron_expression` varchar(200) NOT NULL,
  `time_zone_id` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `QRTZ_CRON_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers` (
  `sched_name` varchar(120) NOT NULL,
  `entry_id` varchar(95) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `instance_name` varchar(200) NOT NULL,
  `fired_time` bigint(13) NOT NULL,
  `sched_time` bigint(13) NOT NULL,
  `priority` int(11) NOT NULL,
  `state` varchar(16) NOT NULL,
  `job_name` varchar(200) DEFAULT NULL,
  `job_group` varchar(200) DEFAULT NULL,
  `is_nonconcurrent` varchar(1) DEFAULT NULL,
  `requests_recovery` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`sched_name`,`entry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details` (
  `sched_name` varchar(120) NOT NULL,
  `job_name` varchar(200) NOT NULL,
  `job_group` varchar(200) NOT NULL,
  `description` varchar(250) DEFAULT NULL,
  `job_class_name` varchar(250) NOT NULL,
  `is_durable` varchar(1) NOT NULL,
  `is_nonconcurrent` varchar(1) NOT NULL,
  `is_update_data` varchar(1) NOT NULL,
  `requests_recovery` varchar(1) NOT NULL,
  `job_data` blob,
  PRIMARY KEY (`sched_name`,`job_name`,`job_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks` (
  `sched_name` varchar(120) NOT NULL,
  `lock_name` varchar(40) NOT NULL,
  PRIMARY KEY (`sched_name`,`lock_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------
INSERT INTO `qrtz_locks` VALUES ('RuoyiScheduler', 'STATE_ACCESS');
INSERT INTO `qrtz_locks` VALUES ('RuoyiScheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  PRIMARY KEY (`sched_name`,`trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state` (
  `sched_name` varchar(120) NOT NULL,
  `instance_name` varchar(200) NOT NULL,
  `last_checkin_time` bigint(13) NOT NULL,
  `checkin_interval` bigint(13) NOT NULL,
  PRIMARY KEY (`sched_name`,`instance_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------
INSERT INTO `qrtz_scheduler_state` VALUES ('RuoyiScheduler', 'LAPTOP-SKTPM1781573529246245', '1573530329194', '15000');

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `repeat_count` bigint(7) NOT NULL,
  `repeat_interval` bigint(12) NOT NULL,
  `times_triggered` bigint(10) NOT NULL,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `QRTZ_SIMPLE_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `str_prop_1` varchar(512) DEFAULT NULL,
  `str_prop_2` varchar(512) DEFAULT NULL,
  `str_prop_3` varchar(512) DEFAULT NULL,
  `int_prop_1` int(11) DEFAULT NULL,
  `int_prop_2` int(11) DEFAULT NULL,
  `long_prop_1` bigint(20) DEFAULT NULL,
  `long_prop_2` bigint(20) DEFAULT NULL,
  `dec_prop_1` decimal(13,4) DEFAULT NULL,
  `dec_prop_2` decimal(13,4) DEFAULT NULL,
  `bool_prop_1` varchar(1) DEFAULT NULL,
  `bool_prop_2` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `QRTZ_SIMPROP_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `job_name` varchar(200) NOT NULL,
  `job_group` varchar(200) NOT NULL,
  `description` varchar(250) DEFAULT NULL,
  `next_fire_time` bigint(13) DEFAULT NULL,
  `prev_fire_time` bigint(13) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `trigger_state` varchar(16) NOT NULL,
  `trigger_type` varchar(8) NOT NULL,
  `start_time` bigint(13) NOT NULL,
  `end_time` bigint(13) DEFAULT NULL,
  `calendar_name` varchar(200) DEFAULT NULL,
  `misfire_instr` smallint(2) DEFAULT NULL,
  `job_data` blob,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  KEY `sched_name` (`sched_name`,`job_name`,`job_group`),
  CONSTRAINT `QRTZ_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
  `config_id` int(5) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) COLLATE utf8_croatian_ci DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) COLLATE utf8_croatian_ci DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) COLLATE utf8_croatian_ci DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) COLLATE utf8_croatian_ci DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) COLLATE utf8_croatian_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_croatian_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8_croatian_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_croatian_ci COMMENT='参数配置表';

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES ('1', '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES ('2', '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '初始化密码 123456');
INSERT INTO `sys_config` VALUES ('3', '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '深色主题theme-dark，浅色主题theme-light');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '盘口id',
  `parent_id` bigint(20) DEFAULT '0' COMMENT '父盘口id',
  `ancestors` varchar(50) COLLATE utf8_croatian_ci DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) COLLATE utf8_croatian_ci DEFAULT '' COMMENT '盘口名称',
  `order_num` int(4) DEFAULT '0' COMMENT '显示顺序',
  `leader` varchar(20) COLLATE utf8_croatian_ci DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) COLLATE utf8_croatian_ci DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) COLLATE utf8_croatian_ci DEFAULT NULL COMMENT '邮箱',
  `status` char(1) COLLATE utf8_croatian_ci DEFAULT '0' COMMENT '盘口状态（0正常 1停用）',
  `del_flag` char(1) COLLATE utf8_croatian_ci DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) COLLATE utf8_croatian_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_croatian_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=214 DEFAULT CHARSET=utf8 COLLATE=utf8_croatian_ci COMMENT='盘口表';

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES ('100', '0', '0', '银商系统', '0', '某些人', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2019-09-20 15:32:35');
INSERT INTO `sys_dept` VALUES ('101', '100', '0,100', '银商管理中心', '1', '某些人', '15888888888', 'ry@qq.com', '2', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2019-10-08 20:20:03');
INSERT INTO `sys_dept` VALUES ('102', '100', '0,100', '奖多多盘口', '2', '某些人', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2019-09-17 11:35:33');
INSERT INTO `sys_dept` VALUES ('200', '100', '0,100', 'vpn盘口', '3', '某人', '18888888888', null, '0', '0', 'admin', '2019-09-20 15:06:17', '', null);
INSERT INTO `sys_dept` VALUES ('206', '100', '0,100', '测试盘口', '0', null, null, null, '1', '2', 'admin', '2019-10-08 16:29:54', 'admin', '2019-10-08 18:31:28');
INSERT INTO `sys_dept` VALUES ('207', '100', '0,100', '测试盘口2', '0', null, null, null, '2', '2', 'admin', '2019-10-08 16:59:43', 'admin', '2019-10-08 17:27:20');
INSERT INTO `sys_dept` VALUES ('208', '206', '0,100,206', '测试盘口1', '0', null, null, null, '2', '2', 'admin', '2019-10-08 20:24:38', 'admin', '2019-10-08 20:25:05');
INSERT INTO `sys_dept` VALUES ('209', '100', '0,100', 'cp平台', '0', null, null, null, '1', '0', 'admin', '2019-10-10 17:29:53', 'admin', '2019-10-10 17:31:25');
INSERT INTO `sys_dept` VALUES ('210', '100', '0,100', 'qp平台', '0', null, null, null, '1', '0', 'admin', '2019-10-10 17:30:32', 'admin', '2019-10-10 17:32:23');
INSERT INTO `sys_dept` VALUES ('211', '209', '0,100,209', 'cp盘口1', '0', null, null, null, '1', '0', 'admin', '2019-10-10 17:31:14', '', null);
INSERT INTO `sys_dept` VALUES ('212', '210', '0,100,210', '棋牌盘口1', '0', null, null, null, '1', '0', 'admin', '2019-10-10 17:32:47', '', null);
INSERT INTO `sys_dept` VALUES ('213', '209', '0,100,209', 'cp盘口2', '0', null, null, null, '1', '0', 'admin', '2019-10-10 17:46:18', '', null);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data` (
  `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(4) DEFAULT '0' COMMENT '字典排序',
  `dict_label` varchar(100) COLLATE utf8_croatian_ci DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) COLLATE utf8_croatian_ci DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) COLLATE utf8_croatian_ci DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) COLLATE utf8_croatian_ci DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) COLLATE utf8_croatian_ci DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) COLLATE utf8_croatian_ci DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) COLLATE utf8_croatian_ci DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) COLLATE utf8_croatian_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_croatian_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8_croatian_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`)
) ENGINE=InnoDB AUTO_INCREMENT=125 DEFAULT CHARSET=utf8 COLLATE=utf8_croatian_ci COMMENT='字典数据表';

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES ('1', '1', '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '性别男');
INSERT INTO `sys_dict_data` VALUES ('2', '2', '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '性别女');
INSERT INTO `sys_dict_data` VALUES ('3', '3', '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '性别未知');
INSERT INTO `sys_dict_data` VALUES ('4', '1', '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '显示菜单');
INSERT INTO `sys_dict_data` VALUES ('5', '2', '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES ('6', '1', '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES ('7', '2', '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '停用状态');
INSERT INTO `sys_dict_data` VALUES ('8', '1', '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES ('9', '2', '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '停用状态');
INSERT INTO `sys_dict_data` VALUES ('10', '1', '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '默认分组');
INSERT INTO `sys_dict_data` VALUES ('11', '2', '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统分组');
INSERT INTO `sys_dict_data` VALUES ('12', '1', '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统默认是');
INSERT INTO `sys_dict_data` VALUES ('13', '2', '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统默认否');
INSERT INTO `sys_dict_data` VALUES ('14', '1', '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知');
INSERT INTO `sys_dict_data` VALUES ('15', '2', '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '公告');
INSERT INTO `sys_dict_data` VALUES ('16', '1', '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES ('17', '2', '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '关闭状态');
INSERT INTO `sys_dict_data` VALUES ('18', '1', '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '新增操作');
INSERT INTO `sys_dict_data` VALUES ('19', '2', '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '修改操作');
INSERT INTO `sys_dict_data` VALUES ('20', '3', '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '删除操作');
INSERT INTO `sys_dict_data` VALUES ('21', '4', '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '授权操作');
INSERT INTO `sys_dict_data` VALUES ('22', '5', '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '导出操作');
INSERT INTO `sys_dict_data` VALUES ('23', '6', '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '导入操作');
INSERT INTO `sys_dict_data` VALUES ('24', '7', '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '强退操作');
INSERT INTO `sys_dict_data` VALUES ('25', '8', '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '生成操作');
INSERT INTO `sys_dict_data` VALUES ('26', '9', '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '清空操作');
INSERT INTO `sys_dict_data` VALUES ('27', '1', '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES ('28', '2', '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '停用状态');
INSERT INTO `sys_dict_data` VALUES ('100', '0', '系统用户', '0', 'sys_user_level', null, null, 'Y', '0', 'admin', '2019-09-23 22:05:53', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('101', '1', '盘口管理员', '1', 'sys_user_level', null, null, 'Y', '0', 'admin', '2019-09-23 22:06:07', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('102', '2', '盘口代理', '2', 'sys_user_level', null, null, 'Y', '0', 'admin', '2019-09-23 22:06:31', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('103', '3', '盘口客服', '3', 'sys_user_level', null, null, 'Y', '0', 'admin', '2019-09-23 22:06:44', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('104', '1', '未开盘', '0', 'b_market_status', null, null, 'Y', '0', 'admin', '2019-10-08 15:55:07', '', null, '0 未开盘 1 开盘 2 停盘');
INSERT INTO `sys_dict_data` VALUES ('105', '2', '开盘', '1', 'b_market_status', null, null, 'Y', '0', 'admin', '2019-10-08 15:55:25', '', null, '0 未开盘 1 开盘 2 停盘');
INSERT INTO `sys_dict_data` VALUES ('106', '3', '停盘', '2', 'b_market_status', null, null, 'Y', '0', 'admin', '2019-10-08 15:55:57', '', null, '0 未开盘 1 开盘 2 停盘');
INSERT INTO `sys_dict_data` VALUES ('107', '1', '棋牌', '0', 'b_market_type', null, null, 'Y', '0', 'admin', '2019-10-08 16:56:26', '', null, '0 棋牌 1 彩票 2 其它');
INSERT INTO `sys_dict_data` VALUES ('108', '2', '彩票', '1', 'b_market_type', null, null, 'Y', '0', 'admin', '2019-10-08 16:56:45', '', null, '0 棋牌 1 彩票 2 其它');
INSERT INTO `sys_dict_data` VALUES ('109', '3', '其它', '2', 'b_market_type', '', '', 'Y', '0', 'admin', '2019-10-08 16:56:58', 'admin', '2019-10-08 16:57:11', '0 棋牌 1 彩票 2 其它');
INSERT INTO `sys_dict_data` VALUES ('110', '1', '待处理', '0', 'b_order_status', '', 'warning', 'Y', '0', 'admin', '2019-10-09 14:23:20', 'admin', '2019-10-09 15:17:32', '0 待办 1 已入款待充值 2 充值完成 3 充值失败 4 取消');
INSERT INTO `sys_dict_data` VALUES ('111', '2', '充值中', '1', 'b_order_status', '', 'success', 'Y', '0', 'admin', '2019-10-09 14:23:39', 'admin', '2019-10-09 15:18:25', '0 待办 1 已入款待充值 2 充值完成 3 充值失败 4 取消');
INSERT INTO `sys_dict_data` VALUES ('112', '3', '充值完成', '2', 'b_order_status', '', 'primary', 'Y', '0', 'admin', '2019-10-09 14:24:16', 'admin', '2019-10-09 15:18:31', '0 待办 1 已入款待充值 2 充值完成 3 充值失败 4 取消');
INSERT INTO `sys_dict_data` VALUES ('113', '4', '充值失败', '3', 'b_order_status', '', 'danger', 'Y', '0', 'admin', '2019-10-09 14:24:47', 'admin', '2019-10-09 15:17:41', '0 待办 1 已入款待充值 2 充值完成 3 充值失败 4 取消');
INSERT INTO `sys_dict_data` VALUES ('114', '5', '取消', '4', 'b_order_status', '', 'info', 'Y', '0', 'admin', '2019-10-09 14:25:27', 'admin', '2019-10-09 15:18:15', '0 待办 1 已入款待充值 2 充值完成 3 充值失败 4 取消');
INSERT INTO `sys_dict_data` VALUES ('115', '1', '银行卡', '0', 'b_pay_type', '', 'info', 'Y', '0', 'admin', '2019-10-09 14:40:10', 'admin', '2019-10-09 15:15:41', '0 银行卡 1 微信 2 支付宝');
INSERT INTO `sys_dict_data` VALUES ('116', '2', '微信', '1', 'b_pay_type', '', 'info', 'Y', '0', 'admin', '2019-10-09 14:40:29', 'admin', '2019-10-09 15:18:58', '0 银行卡 1 微信 2 支付宝');
INSERT INTO `sys_dict_data` VALUES ('117', '3', '支付宝', '2', 'b_pay_type', '', 'info', 'Y', '0', 'admin', '2019-10-09 14:41:04', 'admin', '2019-10-09 15:19:04', '0 银行卡 1 微信 2 支付宝');
INSERT INTO `sys_dict_data` VALUES ('118', '1', '金币', '0', 'b_exchange_type', null, null, 'Y', '0', 'admin', '2019-10-11 16:13:34', '', null, '0 金币 1 积分');
INSERT INTO `sys_dict_data` VALUES ('119', '2', '积分', '1', 'b_exchange_type', null, null, 'Y', '0', 'admin', '2019-10-11 16:13:56', '', null, '0 金币 1 积分');
INSERT INTO `sys_dict_data` VALUES ('120', '1', '申请中', '0', 'b_cashOrder_status', null, null, 'Y', '0', 'admin', '2019-10-12 17:02:19', '', null, '状态[0:审核中 1:通过待汇款 2:审核未通过 3:提现完成 4 订单取消]');
INSERT INTO `sys_dict_data` VALUES ('121', '2', '待汇款', '1', 'b_cashOrder_status', null, null, 'Y', '0', 'admin', '2019-10-12 17:02:46', '', null, '状态[0:审核中 1:通过待汇款 2:审核未通过 3:提现完成 4 订单取消]');
INSERT INTO `sys_dict_data` VALUES ('122', '3', '未通过', '2', 'b_cashOrder_status', null, null, 'Y', '0', 'admin', '2019-10-12 17:03:03', '', null, '状态[0:审核中 1:通过待汇款 2:审核未通过 3:提现完成 4 订单取消]');
INSERT INTO `sys_dict_data` VALUES ('123', '4', '提现完成', '3', 'b_cashOrder_status', null, null, 'Y', '0', 'admin', '2019-10-12 17:03:24', '', null, '状态[0:审核中 1:通过待汇款 2:审核未通过 3:提现完成 4 订单取消]');
INSERT INTO `sys_dict_data` VALUES ('124', '5', '订单取消', '4', 'b_cashOrder_status', null, null, 'Y', '0', 'admin', '2019-10-12 17:03:42', '', null, '状态[0:审核中 1:通过待汇款 2:审核未通过 3:提现完成 4 订单取消]');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type` (
  `dict_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) COLLATE utf8_croatian_ci DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) COLLATE utf8_croatian_ci DEFAULT '' COMMENT '字典类型',
  `status` char(1) COLLATE utf8_croatian_ci DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) COLLATE utf8_croatian_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_croatian_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8_croatian_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`),
  UNIQUE KEY `dict_type` (`dict_type`)
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8 COLLATE=utf8_croatian_ci COMMENT='字典类型表';

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES ('1', '用户性别', 'sys_user_sex', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '用户性别列表');
INSERT INTO `sys_dict_type` VALUES ('2', '菜单状态', 'sys_show_hide', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES ('3', '系统开关', 'sys_normal_disable', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统开关列表');
INSERT INTO `sys_dict_type` VALUES ('4', '任务状态', 'sys_job_status', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '任务状态列表');
INSERT INTO `sys_dict_type` VALUES ('5', '任务分组', 'sys_job_group', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '任务分组列表');
INSERT INTO `sys_dict_type` VALUES ('6', '系统是否', 'sys_yes_no', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统是否列表');
INSERT INTO `sys_dict_type` VALUES ('7', '通知类型', 'sys_notice_type', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知类型列表');
INSERT INTO `sys_dict_type` VALUES ('8', '通知状态', 'sys_notice_status', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知状态列表');
INSERT INTO `sys_dict_type` VALUES ('9', '操作类型', 'sys_oper_type', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '操作类型列表');
INSERT INTO `sys_dict_type` VALUES ('10', '系统状态', 'sys_common_status', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '登录状态列表');
INSERT INTO `sys_dict_type` VALUES ('100', '用户类型', 'sys_user_level', '0', 'admin', '2019-09-21 18:39:43', 'admin', '2019-09-21 18:40:12', '用户等级');
INSERT INTO `sys_dict_type` VALUES ('101', '盘口状态', 'b_market_status', '0', 'admin', '2019-10-08 15:53:57', '', null, '0 未开盘 1 开盘 2 停盘');
INSERT INTO `sys_dict_type` VALUES ('102', '盘口类型', 'b_market_type', '0', 'admin', '2019-10-08 16:55:39', '', null, '0 棋牌 1 彩票 2 其它');
INSERT INTO `sys_dict_type` VALUES ('103', '订单充值状态', 'b_order_status', '0', 'admin', '2019-10-09 14:22:24', '', null, '0 待办 1 已入款待充值 2 充值完成 3 充值失败 4 取消');
INSERT INTO `sys_dict_type` VALUES ('104', '账户类型', 'b_pay_type', '0', 'admin', '2019-10-09 14:39:26', '', null, '0 银行卡 1 微信 2 支付宝');
INSERT INTO `sys_dict_type` VALUES ('105', '虚拟币类型', 'b_exchange_type', '0', 'admin', '2019-10-11 16:12:55', '', null, '0 金币 1 积分');
INSERT INTO `sys_dict_type` VALUES ('106', '提现订单状态', 'b_cashOrder_status', '0', 'admin', '2019-10-12 17:01:53', '', null, '状态[0:审核中 1:通过待汇款 2:审核未通过 3:提现完成 4 订单取消]');

-- ----------------------------
-- Table structure for sys_ip_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_ip_config`;
CREATE TABLE `sys_ip_config` (
  `id` int(4) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `ip` varchar(50) NOT NULL COMMENT 'ip',
  `status` tinyint(1) NOT NULL COMMENT '状态 0：允许 1：禁止',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `remark` varchar(1000) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='ip过滤';

-- ----------------------------
-- Records of sys_ip_config
-- ----------------------------
INSERT INTO `sys_ip_config` VALUES ('17', '192.168.1.27', '0', '', '2019-09-17 11:22:14', '', '2019-09-17 11:22:28', null);
INSERT INTO `sys_ip_config` VALUES ('18', '127.0.0.1', '0', '', '2019-09-17 11:23:29', '', '2019-09-17 11:23:35', null);

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job` (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL DEFAULT '' COMMENT '任务组名',
  `method_name` varchar(500) DEFAULT '' COMMENT '任务方法',
  `method_params` varchar(50) DEFAULT NULL COMMENT '方法参数',
  `cron_expression` varchar(255) DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`,`job_name`,`job_group`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='定时任务调度表';

-- ----------------------------
-- Records of sys_job
-- ----------------------------

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log` (
  `job_log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL COMMENT '任务组名',
  `method_name` varchar(500) DEFAULT NULL COMMENT '任务方法',
  `method_params` varchar(50) DEFAULT NULL COMMENT '方法参数',
  `job_message` varchar(500) DEFAULT NULL COMMENT '日志信息',
  `status` char(1) DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) DEFAULT '' COMMENT '异常信息',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='定时任务调度日志表';

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor` (
  `info_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `login_name` varchar(50) COLLATE utf8_croatian_ci DEFAULT '' COMMENT '登录账号',
  `ipaddr` varchar(50) COLLATE utf8_croatian_ci DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) COLLATE utf8_croatian_ci DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) COLLATE utf8_croatian_ci DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) COLLATE utf8_croatian_ci DEFAULT '' COMMENT '操作系统',
  `status` char(1) COLLATE utf8_croatian_ci DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) COLLATE utf8_croatian_ci DEFAULT '' COMMENT '提示消息',
  `login_time` datetime DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1072 DEFAULT CHARSET=utf8 COLLATE=utf8_croatian_ci COMMENT='系统访问记录';

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES ('100', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2019-09-17 11:23:39');
INSERT INTO `sys_logininfor` VALUES ('101', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2019-09-17 11:23:43');
INSERT INTO `sys_logininfor` VALUES ('102', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-17 11:23:45');
INSERT INTO `sys_logininfor` VALUES ('103', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-17 11:27:44');
INSERT INTO `sys_logininfor` VALUES ('104', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-17 11:32:01');
INSERT INTO `sys_logininfor` VALUES ('105', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-18 16:28:49');
INSERT INTO `sys_logininfor` VALUES ('106', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-18 17:29:01');
INSERT INTO `sys_logininfor` VALUES ('107', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-19 15:26:41');
INSERT INTO `sys_logininfor` VALUES ('108', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-19 15:57:49');
INSERT INTO `sys_logininfor` VALUES ('109', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-20 14:26:30');
INSERT INTO `sys_logininfor` VALUES ('110', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-09-20 14:41:01');
INSERT INTO `sys_logininfor` VALUES ('111', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-20 14:41:54');
INSERT INTO `sys_logininfor` VALUES ('112', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-09-20 14:45:15');
INSERT INTO `sys_logininfor` VALUES ('113', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-20 14:45:19');
INSERT INTO `sys_logininfor` VALUES ('114', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-20 15:05:08');
INSERT INTO `sys_logininfor` VALUES ('115', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-20 15:13:10');
INSERT INTO `sys_logininfor` VALUES ('116', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-20 15:15:56');
INSERT INTO `sys_logininfor` VALUES ('117', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-20 15:18:25');
INSERT INTO `sys_logininfor` VALUES ('118', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-20 15:31:04');
INSERT INTO `sys_logininfor` VALUES ('119', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-20 17:03:43');
INSERT INTO `sys_logininfor` VALUES ('120', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-20 17:34:22');
INSERT INTO `sys_logininfor` VALUES ('121', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-20 17:36:39');
INSERT INTO `sys_logininfor` VALUES ('122', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-20 17:45:41');
INSERT INTO `sys_logininfor` VALUES ('123', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-20 17:47:57');
INSERT INTO `sys_logininfor` VALUES ('124', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-20 17:59:07');
INSERT INTO `sys_logininfor` VALUES ('125', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-20 18:09:16');
INSERT INTO `sys_logininfor` VALUES ('126', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-20 18:15:46');
INSERT INTO `sys_logininfor` VALUES ('127', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-20 18:16:30');
INSERT INTO `sys_logininfor` VALUES ('128', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-20 20:18:38');
INSERT INTO `sys_logininfor` VALUES ('129', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-20 20:27:34');
INSERT INTO `sys_logininfor` VALUES ('130', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-20 20:31:13');
INSERT INTO `sys_logininfor` VALUES ('131', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-20 20:33:34');
INSERT INTO `sys_logininfor` VALUES ('132', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-20 20:36:08');
INSERT INTO `sys_logininfor` VALUES ('133', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-20 20:38:01');
INSERT INTO `sys_logininfor` VALUES ('134', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-20 20:41:13');
INSERT INTO `sys_logininfor` VALUES ('135', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-20 20:42:49');
INSERT INTO `sys_logininfor` VALUES ('136', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-20 20:43:14');
INSERT INTO `sys_logininfor` VALUES ('137', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-20 20:43:40');
INSERT INTO `sys_logininfor` VALUES ('138', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-20 20:45:31');
INSERT INTO `sys_logininfor` VALUES ('139', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-20 20:50:13');
INSERT INTO `sys_logininfor` VALUES ('140', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-20 20:56:47');
INSERT INTO `sys_logininfor` VALUES ('141', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-20 21:05:45');
INSERT INTO `sys_logininfor` VALUES ('142', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-20 21:07:36');
INSERT INTO `sys_logininfor` VALUES ('143', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-20 21:10:54');
INSERT INTO `sys_logininfor` VALUES ('144', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-20 21:13:20');
INSERT INTO `sys_logininfor` VALUES ('145', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-20 21:14:29');
INSERT INTO `sys_logininfor` VALUES ('146', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-20 21:16:37');
INSERT INTO `sys_logininfor` VALUES ('147', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-20 21:17:37');
INSERT INTO `sys_logininfor` VALUES ('148', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-20 21:18:49');
INSERT INTO `sys_logininfor` VALUES ('149', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-21 17:34:45');
INSERT INTO `sys_logininfor` VALUES ('150', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-21 18:01:34');
INSERT INTO `sys_logininfor` VALUES ('151', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-21 18:22:13');
INSERT INTO `sys_logininfor` VALUES ('152', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-21 18:24:19');
INSERT INTO `sys_logininfor` VALUES ('153', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-09-21 18:27:48');
INSERT INTO `sys_logininfor` VALUES ('154', 'ry', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '用户已封禁，请联系管理员', '2019-09-21 18:27:55');
INSERT INTO `sys_logininfor` VALUES ('155', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-21 18:28:02');
INSERT INTO `sys_logininfor` VALUES ('156', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2019-09-21 20:26:11');
INSERT INTO `sys_logininfor` VALUES ('157', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2019-09-21 20:26:14');
INSERT INTO `sys_logininfor` VALUES ('158', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-21 20:26:16');
INSERT INTO `sys_logininfor` VALUES ('159', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-21 21:25:13');
INSERT INTO `sys_logininfor` VALUES ('160', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-21 21:26:20');
INSERT INTO `sys_logininfor` VALUES ('161', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-21 21:27:11');
INSERT INTO `sys_logininfor` VALUES ('162', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-23 17:59:47');
INSERT INTO `sys_logininfor` VALUES ('163', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-09-23 18:01:34');
INSERT INTO `sys_logininfor` VALUES ('164', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '用户不存在/密码错误', '2019-09-23 18:01:40');
INSERT INTO `sys_logininfor` VALUES ('165', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-23 18:01:46');
INSERT INTO `sys_logininfor` VALUES ('166', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-09-23 18:01:50');
INSERT INTO `sys_logininfor` VALUES ('167', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-23 18:01:53');
INSERT INTO `sys_logininfor` VALUES ('168', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-09-23 18:05:07');
INSERT INTO `sys_logininfor` VALUES ('169', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-23 18:05:14');
INSERT INTO `sys_logininfor` VALUES ('170', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-09-23 18:05:24');
INSERT INTO `sys_logininfor` VALUES ('171', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-23 18:07:24');
INSERT INTO `sys_logininfor` VALUES ('172', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-09-23 18:07:26');
INSERT INTO `sys_logininfor` VALUES ('173', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-23 18:07:39');
INSERT INTO `sys_logininfor` VALUES ('174', 'ry', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-23 18:12:39');
INSERT INTO `sys_logininfor` VALUES ('175', 'ry', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-09-23 18:13:08');
INSERT INTO `sys_logininfor` VALUES ('176', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-23 21:43:34');
INSERT INTO `sys_logininfor` VALUES ('177', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-09-23 21:49:01');
INSERT INTO `sys_logininfor` VALUES ('178', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-23 21:49:14');
INSERT INTO `sys_logininfor` VALUES ('179', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-23 21:51:15');
INSERT INTO `sys_logininfor` VALUES ('180', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '密码输入错误1次', '2019-09-23 21:56:39');
INSERT INTO `sys_logininfor` VALUES ('181', 'amdin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '用户不存在/密码错误', '2019-09-23 21:56:48');
INSERT INTO `sys_logininfor` VALUES ('182', 'amdin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '用户不存在/密码错误', '2019-09-23 21:56:51');
INSERT INTO `sys_logininfor` VALUES ('183', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2019-09-23 21:57:15');
INSERT INTO `sys_logininfor` VALUES ('184', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '密码输入错误1次', '2019-09-23 21:57:18');
INSERT INTO `sys_logininfor` VALUES ('185', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-23 21:57:26');
INSERT INTO `sys_logininfor` VALUES ('186', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-23 21:59:12');
INSERT INTO `sys_logininfor` VALUES ('187', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-23 22:03:32');
INSERT INTO `sys_logininfor` VALUES ('188', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-23 22:19:38');
INSERT INTO `sys_logininfor` VALUES ('189', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-09-23 22:24:21');
INSERT INTO `sys_logininfor` VALUES ('190', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-23 22:24:31');
INSERT INTO `sys_logininfor` VALUES ('191', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-09-23 22:24:41');
INSERT INTO `sys_logininfor` VALUES ('192', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-23 22:24:56');
INSERT INTO `sys_logininfor` VALUES ('193', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-09-23 22:25:33');
INSERT INTO `sys_logininfor` VALUES ('194', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-23 22:25:40');
INSERT INTO `sys_logininfor` VALUES ('195', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-09-23 22:26:21');
INSERT INTO `sys_logininfor` VALUES ('196', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-23 22:26:40');
INSERT INTO `sys_logininfor` VALUES ('197', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-09-23 22:46:10');
INSERT INTO `sys_logininfor` VALUES ('198', '奖多多', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '密码输入错误1次', '2019-09-23 22:46:20');
INSERT INTO `sys_logininfor` VALUES ('199', '奖多多', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-23 22:46:26');
INSERT INTO `sys_logininfor` VALUES ('200', '奖多多', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-09-23 22:47:35');
INSERT INTO `sys_logininfor` VALUES ('201', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-23 22:47:46');
INSERT INTO `sys_logininfor` VALUES ('202', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-24 14:51:55');
INSERT INTO `sys_logininfor` VALUES ('203', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-24 15:28:18');
INSERT INTO `sys_logininfor` VALUES ('204', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-24 16:17:23');
INSERT INTO `sys_logininfor` VALUES ('205', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2019-09-24 16:57:42');
INSERT INTO `sys_logininfor` VALUES ('206', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-24 16:57:45');
INSERT INTO `sys_logininfor` VALUES ('207', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-24 17:05:28');
INSERT INTO `sys_logininfor` VALUES ('208', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-24 17:07:30');
INSERT INTO `sys_logininfor` VALUES ('209', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2019-09-24 21:28:59');
INSERT INTO `sys_logininfor` VALUES ('210', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-24 21:29:02');
INSERT INTO `sys_logininfor` VALUES ('211', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-24 21:36:57');
INSERT INTO `sys_logininfor` VALUES ('212', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-24 21:40:07');
INSERT INTO `sys_logininfor` VALUES ('213', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-24 21:46:01');
INSERT INTO `sys_logininfor` VALUES ('214', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-24 21:46:56');
INSERT INTO `sys_logininfor` VALUES ('215', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-24 21:47:51');
INSERT INTO `sys_logininfor` VALUES ('216', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-24 21:51:58');
INSERT INTO `sys_logininfor` VALUES ('217', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-24 21:56:01');
INSERT INTO `sys_logininfor` VALUES ('218', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2019-09-24 21:57:40');
INSERT INTO `sys_logininfor` VALUES ('219', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-24 21:57:45');
INSERT INTO `sys_logininfor` VALUES ('220', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-24 22:50:55');
INSERT INTO `sys_logininfor` VALUES ('221', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-24 22:57:13');
INSERT INTO `sys_logininfor` VALUES ('222', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-25 10:51:37');
INSERT INTO `sys_logininfor` VALUES ('223', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-09-25 10:51:53');
INSERT INTO `sys_logininfor` VALUES ('224', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-25 10:52:03');
INSERT INTO `sys_logininfor` VALUES ('225', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-25 10:54:52');
INSERT INTO `sys_logininfor` VALUES ('226', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-25 10:57:41');
INSERT INTO `sys_logininfor` VALUES ('227', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-25 10:58:51');
INSERT INTO `sys_logininfor` VALUES ('228', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-25 11:00:31');
INSERT INTO `sys_logininfor` VALUES ('229', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-09-25 11:15:10');
INSERT INTO `sys_logininfor` VALUES ('230', '奖多多', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-25 11:15:16');
INSERT INTO `sys_logininfor` VALUES ('231', '奖多多', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-09-25 11:31:47');
INSERT INTO `sys_logininfor` VALUES ('232', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-25 11:31:53');
INSERT INTO `sys_logininfor` VALUES ('233', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-25 11:53:00');
INSERT INTO `sys_logininfor` VALUES ('234', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-25 11:55:18');
INSERT INTO `sys_logininfor` VALUES ('235', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-25 12:00:57');
INSERT INTO `sys_logininfor` VALUES ('236', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-25 12:04:00');
INSERT INTO `sys_logininfor` VALUES ('237', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-25 12:05:20');
INSERT INTO `sys_logininfor` VALUES ('238', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-25 14:11:16');
INSERT INTO `sys_logininfor` VALUES ('239', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-25 14:14:40');
INSERT INTO `sys_logininfor` VALUES ('240', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2019-09-25 14:51:53');
INSERT INTO `sys_logininfor` VALUES ('241', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-25 14:51:58');
INSERT INTO `sys_logininfor` VALUES ('242', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-25 14:55:21');
INSERT INTO `sys_logininfor` VALUES ('243', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '密码输入错误1次', '2019-09-25 14:58:34');
INSERT INTO `sys_logininfor` VALUES ('244', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-25 14:58:40');
INSERT INTO `sys_logininfor` VALUES ('245', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-25 15:01:00');
INSERT INTO `sys_logininfor` VALUES ('246', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-25 15:02:44');
INSERT INTO `sys_logininfor` VALUES ('247', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-25 15:04:13');
INSERT INTO `sys_logininfor` VALUES ('248', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-25 15:07:13');
INSERT INTO `sys_logininfor` VALUES ('249', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-25 15:08:21');
INSERT INTO `sys_logininfor` VALUES ('250', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2019-09-25 15:09:31');
INSERT INTO `sys_logininfor` VALUES ('251', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-25 15:09:35');
INSERT INTO `sys_logininfor` VALUES ('252', 'rjt', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '用户不存在/密码错误', '2019-09-25 15:24:51');
INSERT INTO `sys_logininfor` VALUES ('253', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-25 15:26:39');
INSERT INTO `sys_logininfor` VALUES ('254', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-25 15:27:22');
INSERT INTO `sys_logininfor` VALUES ('255', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-25 15:29:16');
INSERT INTO `sys_logininfor` VALUES ('256', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-25 15:31:47');
INSERT INTO `sys_logininfor` VALUES ('257', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-25 16:21:28');
INSERT INTO `sys_logininfor` VALUES ('258', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-25 16:23:32');
INSERT INTO `sys_logininfor` VALUES ('259', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '密码输入错误1次', '2019-09-25 16:25:03');
INSERT INTO `sys_logininfor` VALUES ('260', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '密码输入错误2次', '2019-09-25 16:25:06');
INSERT INTO `sys_logininfor` VALUES ('261', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-25 16:25:11');
INSERT INTO `sys_logininfor` VALUES ('262', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-25 16:26:10');
INSERT INTO `sys_logininfor` VALUES ('263', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-25 16:30:54');
INSERT INTO `sys_logininfor` VALUES ('264', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-09-25 16:34:37');
INSERT INTO `sys_logininfor` VALUES ('265', '奖多多', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-25 16:34:43');
INSERT INTO `sys_logininfor` VALUES ('266', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-25 16:37:42');
INSERT INTO `sys_logininfor` VALUES ('267', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-25 16:41:13');
INSERT INTO `sys_logininfor` VALUES ('268', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-25 16:42:24');
INSERT INTO `sys_logininfor` VALUES ('269', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-25 16:56:00');
INSERT INTO `sys_logininfor` VALUES ('270', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-09-25 16:56:07');
INSERT INTO `sys_logininfor` VALUES ('271', 'vpn01', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-25 16:56:13');
INSERT INTO `sys_logininfor` VALUES ('272', 'vpn01', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-09-25 17:00:55');
INSERT INTO `sys_logininfor` VALUES ('273', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-25 17:01:01');
INSERT INTO `sys_logininfor` VALUES ('274', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-09-25 17:01:48');
INSERT INTO `sys_logininfor` VALUES ('275', '奖多多', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-25 17:01:55');
INSERT INTO `sys_logininfor` VALUES ('276', '奖多多', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-25 17:04:45');
INSERT INTO `sys_logininfor` VALUES ('277', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-25 17:42:41');
INSERT INTO `sys_logininfor` VALUES ('278', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-09-25 17:43:32');
INSERT INTO `sys_logininfor` VALUES ('279', '奖多多', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '用户不存在/密码错误', '2019-09-25 17:43:39');
INSERT INTO `sys_logininfor` VALUES ('280', '奖多多', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-25 17:43:44');
INSERT INTO `sys_logininfor` VALUES ('281', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-25 17:52:54');
INSERT INTO `sys_logininfor` VALUES ('282', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-25 17:57:21');
INSERT INTO `sys_logininfor` VALUES ('283', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-25 18:02:10');
INSERT INTO `sys_logininfor` VALUES ('284', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-25 18:05:19');
INSERT INTO `sys_logininfor` VALUES ('285', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-09-25 18:05:29');
INSERT INTO `sys_logininfor` VALUES ('286', '奖多多', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-25 18:05:35');
INSERT INTO `sys_logininfor` VALUES ('287', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-25 18:11:53');
INSERT INTO `sys_logininfor` VALUES ('288', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2019-09-25 18:15:03');
INSERT INTO `sys_logininfor` VALUES ('289', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-25 18:15:06');
INSERT INTO `sys_logininfor` VALUES ('290', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-25 18:19:21');
INSERT INTO `sys_logininfor` VALUES ('291', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-25 19:13:38');
INSERT INTO `sys_logininfor` VALUES ('292', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-25 19:19:17');
INSERT INTO `sys_logininfor` VALUES ('293', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-25 19:21:35');
INSERT INTO `sys_logininfor` VALUES ('294', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-25 19:28:01');
INSERT INTO `sys_logininfor` VALUES ('295', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-25 19:28:39');
INSERT INTO `sys_logininfor` VALUES ('296', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-25 19:33:23');
INSERT INTO `sys_logininfor` VALUES ('297', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-25 19:53:07');
INSERT INTO `sys_logininfor` VALUES ('298', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-25 20:40:50');
INSERT INTO `sys_logininfor` VALUES ('299', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-25 20:48:24');
INSERT INTO `sys_logininfor` VALUES ('300', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-25 20:52:33');
INSERT INTO `sys_logininfor` VALUES ('301', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-25 20:55:32');
INSERT INTO `sys_logininfor` VALUES ('302', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-25 20:57:07');
INSERT INTO `sys_logininfor` VALUES ('303', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-25 21:04:32');
INSERT INTO `sys_logininfor` VALUES ('304', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-25 21:05:21');
INSERT INTO `sys_logininfor` VALUES ('305', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-25 21:08:33');
INSERT INTO `sys_logininfor` VALUES ('306', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-25 21:09:41');
INSERT INTO `sys_logininfor` VALUES ('307', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-25 21:11:26');
INSERT INTO `sys_logininfor` VALUES ('308', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2019-09-25 21:13:50');
INSERT INTO `sys_logininfor` VALUES ('309', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-25 21:13:53');
INSERT INTO `sys_logininfor` VALUES ('310', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-25 21:17:18');
INSERT INTO `sys_logininfor` VALUES ('311', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-25 21:24:57');
INSERT INTO `sys_logininfor` VALUES ('312', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-25 21:27:01');
INSERT INTO `sys_logininfor` VALUES ('313', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-25 21:29:03');
INSERT INTO `sys_logininfor` VALUES ('314', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-25 21:45:48');
INSERT INTO `sys_logininfor` VALUES ('315', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-25 21:47:23');
INSERT INTO `sys_logininfor` VALUES ('316', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-25 21:49:42');
INSERT INTO `sys_logininfor` VALUES ('317', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-25 21:52:00');
INSERT INTO `sys_logininfor` VALUES ('318', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-25 21:53:40');
INSERT INTO `sys_logininfor` VALUES ('319', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-25 21:57:31');
INSERT INTO `sys_logininfor` VALUES ('320', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-25 21:58:44');
INSERT INTO `sys_logininfor` VALUES ('321', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-25 22:04:44');
INSERT INTO `sys_logininfor` VALUES ('322', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-25 22:06:33');
INSERT INTO `sys_logininfor` VALUES ('323', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-25 22:08:35');
INSERT INTO `sys_logininfor` VALUES ('324', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-25 22:21:36');
INSERT INTO `sys_logininfor` VALUES ('325', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-25 22:43:40');
INSERT INTO `sys_logininfor` VALUES ('326', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-25 22:48:40');
INSERT INTO `sys_logininfor` VALUES ('327', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-25 23:01:05');
INSERT INTO `sys_logininfor` VALUES ('328', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-25 23:03:25');
INSERT INTO `sys_logininfor` VALUES ('329', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-25 23:05:59');
INSERT INTO `sys_logininfor` VALUES ('330', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-25 23:08:14');
INSERT INTO `sys_logininfor` VALUES ('331', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-25 23:12:16');
INSERT INTO `sys_logininfor` VALUES ('332', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-25 23:15:02');
INSERT INTO `sys_logininfor` VALUES ('333', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-25 23:22:14');
INSERT INTO `sys_logininfor` VALUES ('334', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-25 23:24:07');
INSERT INTO `sys_logininfor` VALUES ('335', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-25 23:26:03');
INSERT INTO `sys_logininfor` VALUES ('336', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2019-09-25 23:26:59');
INSERT INTO `sys_logininfor` VALUES ('337', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-25 23:27:03');
INSERT INTO `sys_logininfor` VALUES ('338', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-25 23:31:09');
INSERT INTO `sys_logininfor` VALUES ('339', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '密码输入错误1次', '2019-09-25 23:38:44');
INSERT INTO `sys_logininfor` VALUES ('340', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2019-09-25 23:38:49');
INSERT INTO `sys_logininfor` VALUES ('341', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-25 23:38:52');
INSERT INTO `sys_logininfor` VALUES ('342', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-25 23:42:49');
INSERT INTO `sys_logininfor` VALUES ('343', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-25 23:44:23');
INSERT INTO `sys_logininfor` VALUES ('344', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-25 23:47:06');
INSERT INTO `sys_logininfor` VALUES ('345', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-25 23:52:17');
INSERT INTO `sys_logininfor` VALUES ('346', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-25 23:54:24');
INSERT INTO `sys_logininfor` VALUES ('347', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-25 23:55:56');
INSERT INTO `sys_logininfor` VALUES ('348', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-25 23:56:59');
INSERT INTO `sys_logininfor` VALUES ('349', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-26 10:57:01');
INSERT INTO `sys_logininfor` VALUES ('350', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-26 11:04:38');
INSERT INTO `sys_logininfor` VALUES ('351', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-26 11:05:21');
INSERT INTO `sys_logininfor` VALUES ('352', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-26 11:06:25');
INSERT INTO `sys_logininfor` VALUES ('353', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-26 11:07:52');
INSERT INTO `sys_logininfor` VALUES ('354', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-26 11:10:08');
INSERT INTO `sys_logininfor` VALUES ('355', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-26 11:12:14');
INSERT INTO `sys_logininfor` VALUES ('356', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-26 11:18:07');
INSERT INTO `sys_logininfor` VALUES ('357', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-26 11:19:07');
INSERT INTO `sys_logininfor` VALUES ('358', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-26 11:21:01');
INSERT INTO `sys_logininfor` VALUES ('359', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-26 11:26:34');
INSERT INTO `sys_logininfor` VALUES ('360', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-26 11:31:31');
INSERT INTO `sys_logininfor` VALUES ('361', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-26 11:36:01');
INSERT INTO `sys_logininfor` VALUES ('362', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-26 11:40:52');
INSERT INTO `sys_logininfor` VALUES ('363', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2019-09-26 11:43:15');
INSERT INTO `sys_logininfor` VALUES ('364', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-26 11:43:17');
INSERT INTO `sys_logininfor` VALUES ('365', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-26 11:44:44');
INSERT INTO `sys_logininfor` VALUES ('366', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-26 12:00:17');
INSERT INTO `sys_logininfor` VALUES ('367', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2019-09-26 12:02:40');
INSERT INTO `sys_logininfor` VALUES ('368', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-26 12:02:42');
INSERT INTO `sys_logininfor` VALUES ('369', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-26 12:10:41');
INSERT INTO `sys_logininfor` VALUES ('370', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-26 12:12:37');
INSERT INTO `sys_logininfor` VALUES ('371', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-26 12:21:10');
INSERT INTO `sys_logininfor` VALUES ('372', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-26 12:22:49');
INSERT INTO `sys_logininfor` VALUES ('373', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-26 14:32:21');
INSERT INTO `sys_logininfor` VALUES ('374', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-26 14:35:30');
INSERT INTO `sys_logininfor` VALUES ('375', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-26 14:37:58');
INSERT INTO `sys_logininfor` VALUES ('376', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-26 14:39:54');
INSERT INTO `sys_logininfor` VALUES ('377', 'cc', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-26 14:42:16');
INSERT INTO `sys_logininfor` VALUES ('378', 'cc', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-09-26 14:42:22');
INSERT INTO `sys_logininfor` VALUES ('379', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-26 14:42:34');
INSERT INTO `sys_logininfor` VALUES ('380', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-26 14:43:27');
INSERT INTO `sys_logininfor` VALUES ('381', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-26 14:48:19');
INSERT INTO `sys_logininfor` VALUES ('382', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-09-26 14:48:47');
INSERT INTO `sys_logininfor` VALUES ('383', 'cc', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-26 14:48:54');
INSERT INTO `sys_logininfor` VALUES ('384', 'cc', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-09-26 14:49:01');
INSERT INTO `sys_logininfor` VALUES ('385', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-26 14:49:10');
INSERT INTO `sys_logininfor` VALUES ('386', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-09-26 14:50:23');
INSERT INTO `sys_logininfor` VALUES ('387', 'pyd', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-26 14:50:30');
INSERT INTO `sys_logininfor` VALUES ('388', 'pyd', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-09-26 14:50:40');
INSERT INTO `sys_logininfor` VALUES ('389', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-26 15:03:56');
INSERT INTO `sys_logininfor` VALUES ('390', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-26 15:10:44');
INSERT INTO `sys_logininfor` VALUES ('391', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-26 15:16:57');
INSERT INTO `sys_logininfor` VALUES ('392', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-26 15:19:12');
INSERT INTO `sys_logininfor` VALUES ('393', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-26 15:21:23');
INSERT INTO `sys_logininfor` VALUES ('394', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2019-09-26 15:23:14');
INSERT INTO `sys_logininfor` VALUES ('395', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-26 15:23:17');
INSERT INTO `sys_logininfor` VALUES ('396', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-26 15:24:31');
INSERT INTO `sys_logininfor` VALUES ('397', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-26 15:25:46');
INSERT INTO `sys_logininfor` VALUES ('398', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2019-09-26 15:27:09');
INSERT INTO `sys_logininfor` VALUES ('399', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-26 15:27:12');
INSERT INTO `sys_logininfor` VALUES ('400', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-26 15:31:17');
INSERT INTO `sys_logininfor` VALUES ('401', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-26 15:33:42');
INSERT INTO `sys_logininfor` VALUES ('402', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-26 15:38:05');
INSERT INTO `sys_logininfor` VALUES ('403', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-26 15:58:36');
INSERT INTO `sys_logininfor` VALUES ('404', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-26 16:45:08');
INSERT INTO `sys_logininfor` VALUES ('405', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-26 16:58:17');
INSERT INTO `sys_logininfor` VALUES ('406', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-26 16:59:54');
INSERT INTO `sys_logininfor` VALUES ('407', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-26 17:03:48');
INSERT INTO `sys_logininfor` VALUES ('408', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-26 17:05:36');
INSERT INTO `sys_logininfor` VALUES ('409', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-26 17:06:58');
INSERT INTO `sys_logininfor` VALUES ('410', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-26 17:08:56');
INSERT INTO `sys_logininfor` VALUES ('411', '奖多多02', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '用户不存在/密码错误', '2019-09-26 17:38:10');
INSERT INTO `sys_logininfor` VALUES ('412', '奖多多02', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '用户不存在/密码错误', '2019-09-26 17:38:15');
INSERT INTO `sys_logininfor` VALUES ('413', '奖多多01', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-26 17:38:20');
INSERT INTO `sys_logininfor` VALUES ('414', '奖多多01', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-09-26 17:39:03');
INSERT INTO `sys_logininfor` VALUES ('415', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-26 17:39:11');
INSERT INTO `sys_logininfor` VALUES ('416', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-09-26 17:39:42');
INSERT INTO `sys_logininfor` VALUES ('417', '奖多多01', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-26 17:39:59');
INSERT INTO `sys_logininfor` VALUES ('418', '奖多多01', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-09-26 17:40:19');
INSERT INTO `sys_logininfor` VALUES ('419', '奖多多', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '密码输入错误1次', '2019-09-26 17:40:27');
INSERT INTO `sys_logininfor` VALUES ('420', '奖多多', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '密码输入错误2次', '2019-09-26 17:40:34');
INSERT INTO `sys_logininfor` VALUES ('421', '奖多多', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2019-09-26 17:40:36');
INSERT INTO `sys_logininfor` VALUES ('422', '奖多多', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-26 17:40:40');
INSERT INTO `sys_logininfor` VALUES ('423', '奖多多', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-09-26 17:41:13');
INSERT INTO `sys_logininfor` VALUES ('424', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-26 17:41:21');
INSERT INTO `sys_logininfor` VALUES ('425', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-26 18:06:37');
INSERT INTO `sys_logininfor` VALUES ('426', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-26 18:11:52');
INSERT INTO `sys_logininfor` VALUES ('427', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-26 18:12:47');
INSERT INTO `sys_logininfor` VALUES ('428', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-26 18:14:57');
INSERT INTO `sys_logininfor` VALUES ('429', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-26 18:17:18');
INSERT INTO `sys_logininfor` VALUES ('430', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-26 18:21:36');
INSERT INTO `sys_logininfor` VALUES ('431', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-08 10:29:23');
INSERT INTO `sys_logininfor` VALUES ('432', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2019-10-08 11:16:52');
INSERT INTO `sys_logininfor` VALUES ('433', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-08 11:16:57');
INSERT INTO `sys_logininfor` VALUES ('434', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-08 14:08:13');
INSERT INTO `sys_logininfor` VALUES ('435', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-08 14:10:46');
INSERT INTO `sys_logininfor` VALUES ('436', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-08 14:12:56');
INSERT INTO `sys_logininfor` VALUES ('437', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2019-10-08 14:14:26');
INSERT INTO `sys_logininfor` VALUES ('438', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-08 14:14:29');
INSERT INTO `sys_logininfor` VALUES ('439', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2019-10-08 14:18:49');
INSERT INTO `sys_logininfor` VALUES ('440', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-08 14:18:53');
INSERT INTO `sys_logininfor` VALUES ('441', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2019-10-08 14:35:39');
INSERT INTO `sys_logininfor` VALUES ('442', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2019-10-08 14:35:45');
INSERT INTO `sys_logininfor` VALUES ('443', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '密码输入错误1次', '2019-10-08 14:35:52');
INSERT INTO `sys_logininfor` VALUES ('444', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-08 14:36:29');
INSERT INTO `sys_logininfor` VALUES ('445', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2019-10-08 14:57:44');
INSERT INTO `sys_logininfor` VALUES ('446', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-08 14:57:49');
INSERT INTO `sys_logininfor` VALUES ('447', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-08 15:01:09');
INSERT INTO `sys_logininfor` VALUES ('448', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-08 15:09:19');
INSERT INTO `sys_logininfor` VALUES ('449', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-08 15:13:58');
INSERT INTO `sys_logininfor` VALUES ('450', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-08 15:20:36');
INSERT INTO `sys_logininfor` VALUES ('451', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2019-10-08 15:22:14');
INSERT INTO `sys_logininfor` VALUES ('452', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-08 15:22:17');
INSERT INTO `sys_logininfor` VALUES ('453', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2019-10-08 15:26:53');
INSERT INTO `sys_logininfor` VALUES ('454', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-08 15:26:58');
INSERT INTO `sys_logininfor` VALUES ('455', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-08 15:31:14');
INSERT INTO `sys_logininfor` VALUES ('456', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-08 15:41:58');
INSERT INTO `sys_logininfor` VALUES ('457', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-08 15:57:39');
INSERT INTO `sys_logininfor` VALUES ('458', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-08 16:00:24');
INSERT INTO `sys_logininfor` VALUES ('459', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-08 16:08:12');
INSERT INTO `sys_logininfor` VALUES ('460', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2019-10-08 16:12:01');
INSERT INTO `sys_logininfor` VALUES ('461', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-08 16:12:05');
INSERT INTO `sys_logininfor` VALUES ('462', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-08 16:13:39');
INSERT INTO `sys_logininfor` VALUES ('463', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-08 16:14:59');
INSERT INTO `sys_logininfor` VALUES ('464', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-08 16:16:16');
INSERT INTO `sys_logininfor` VALUES ('465', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-08 16:18:06');
INSERT INTO `sys_logininfor` VALUES ('466', 'rjg', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-10-08 16:18:12');
INSERT INTO `sys_logininfor` VALUES ('467', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '密码输入错误1次', '2019-10-08 16:18:21');
INSERT INTO `sys_logininfor` VALUES ('468', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '密码输入错误2次', '2019-10-08 16:18:25');
INSERT INTO `sys_logininfor` VALUES ('469', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-08 16:18:32');
INSERT INTO `sys_logininfor` VALUES ('470', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-08 16:21:16');
INSERT INTO `sys_logininfor` VALUES ('471', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-08 16:22:06');
INSERT INTO `sys_logininfor` VALUES ('472', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-08 16:29:10');
INSERT INTO `sys_logininfor` VALUES ('473', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-08 16:35:34');
INSERT INTO `sys_logininfor` VALUES ('474', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-08 16:37:46');
INSERT INTO `sys_logininfor` VALUES ('475', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-08 16:42:25');
INSERT INTO `sys_logininfor` VALUES ('476', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-08 16:47:23');
INSERT INTO `sys_logininfor` VALUES ('477', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-08 16:47:32');
INSERT INTO `sys_logininfor` VALUES ('478', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-08 16:48:15');
INSERT INTO `sys_logininfor` VALUES ('479', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-08 16:49:11');
INSERT INTO `sys_logininfor` VALUES ('480', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-08 16:52:32');
INSERT INTO `sys_logininfor` VALUES ('481', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-08 16:57:52');
INSERT INTO `sys_logininfor` VALUES ('482', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-08 16:58:25');
INSERT INTO `sys_logininfor` VALUES ('483', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-08 16:59:21');
INSERT INTO `sys_logininfor` VALUES ('484', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-08 17:00:47');
INSERT INTO `sys_logininfor` VALUES ('485', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-08 17:02:42');
INSERT INTO `sys_logininfor` VALUES ('486', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-08 17:04:40');
INSERT INTO `sys_logininfor` VALUES ('487', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-08 17:08:59');
INSERT INTO `sys_logininfor` VALUES ('488', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '密码输入错误1次', '2019-10-08 17:09:26');
INSERT INTO `sys_logininfor` VALUES ('489', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-08 17:09:36');
INSERT INTO `sys_logininfor` VALUES ('490', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-08 17:09:50');
INSERT INTO `sys_logininfor` VALUES ('491', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2019-10-08 17:18:39');
INSERT INTO `sys_logininfor` VALUES ('492', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-08 17:18:44');
INSERT INTO `sys_logininfor` VALUES ('493', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-08 17:33:03');
INSERT INTO `sys_logininfor` VALUES ('494', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-08 17:34:04');
INSERT INTO `sys_logininfor` VALUES ('495', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-08 17:34:51');
INSERT INTO `sys_logininfor` VALUES ('496', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-08 17:39:05');
INSERT INTO `sys_logininfor` VALUES ('497', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-08 17:40:20');
INSERT INTO `sys_logininfor` VALUES ('498', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-08 17:45:20');
INSERT INTO `sys_logininfor` VALUES ('499', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-08 17:46:46');
INSERT INTO `sys_logininfor` VALUES ('500', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-10-08 17:47:50');
INSERT INTO `sys_logininfor` VALUES ('501', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-08 17:48:00');
INSERT INTO `sys_logininfor` VALUES ('502', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-08 17:49:08');
INSERT INTO `sys_logininfor` VALUES ('503', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-08 17:51:56');
INSERT INTO `sys_logininfor` VALUES ('504', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-08 17:52:52');
INSERT INTO `sys_logininfor` VALUES ('505', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-08 17:57:26');
INSERT INTO `sys_logininfor` VALUES ('506', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-08 18:00:20');
INSERT INTO `sys_logininfor` VALUES ('507', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-08 18:02:23');
INSERT INTO `sys_logininfor` VALUES ('508', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-08 18:29:30');
INSERT INTO `sys_logininfor` VALUES ('509', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-08 18:31:10');
INSERT INTO `sys_logininfor` VALUES ('510', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-08 20:02:28');
INSERT INTO `sys_logininfor` VALUES ('511', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-08 20:09:53');
INSERT INTO `sys_logininfor` VALUES ('512', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-08 20:10:54');
INSERT INTO `sys_logininfor` VALUES ('513', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-08 20:14:43');
INSERT INTO `sys_logininfor` VALUES ('514', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-08 20:17:21');
INSERT INTO `sys_logininfor` VALUES ('515', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-08 20:19:29');
INSERT INTO `sys_logininfor` VALUES ('516', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-08 20:22:09');
INSERT INTO `sys_logininfor` VALUES ('517', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-08 20:24:07');
INSERT INTO `sys_logininfor` VALUES ('518', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-09 10:00:37');
INSERT INTO `sys_logininfor` VALUES ('519', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-09 11:00:02');
INSERT INTO `sys_logininfor` VALUES ('520', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-09 11:14:08');
INSERT INTO `sys_logininfor` VALUES ('521', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '密码输入错误1次', '2019-10-09 11:30:21');
INSERT INTO `sys_logininfor` VALUES ('522', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-09 11:30:31');
INSERT INTO `sys_logininfor` VALUES ('523', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-09 11:48:04');
INSERT INTO `sys_logininfor` VALUES ('524', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-09 12:07:18');
INSERT INTO `sys_logininfor` VALUES ('525', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-09 14:18:28');
INSERT INTO `sys_logininfor` VALUES ('526', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-09 14:33:27');
INSERT INTO `sys_logininfor` VALUES ('527', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-09 14:35:29');
INSERT INTO `sys_logininfor` VALUES ('528', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-09 14:38:13');
INSERT INTO `sys_logininfor` VALUES ('529', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-09 14:42:49');
INSERT INTO `sys_logininfor` VALUES ('530', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-09 14:56:10');
INSERT INTO `sys_logininfor` VALUES ('531', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-09 14:57:09');
INSERT INTO `sys_logininfor` VALUES ('532', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-09 14:58:19');
INSERT INTO `sys_logininfor` VALUES ('533', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-09 14:59:36');
INSERT INTO `sys_logininfor` VALUES ('534', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-09 15:07:16');
INSERT INTO `sys_logininfor` VALUES ('535', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-09 15:13:05');
INSERT INTO `sys_logininfor` VALUES ('536', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-09 15:16:38');
INSERT INTO `sys_logininfor` VALUES ('537', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-09 15:19:36');
INSERT INTO `sys_logininfor` VALUES ('538', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-09 15:44:33');
INSERT INTO `sys_logininfor` VALUES ('539', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-09 15:49:49');
INSERT INTO `sys_logininfor` VALUES ('540', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-09 15:53:11');
INSERT INTO `sys_logininfor` VALUES ('541', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-09 16:13:29');
INSERT INTO `sys_logininfor` VALUES ('542', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-09 16:15:08');
INSERT INTO `sys_logininfor` VALUES ('543', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-09 16:50:55');
INSERT INTO `sys_logininfor` VALUES ('544', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-09 16:52:44');
INSERT INTO `sys_logininfor` VALUES ('545', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-09 17:57:27');
INSERT INTO `sys_logininfor` VALUES ('546', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-10 10:34:52');
INSERT INTO `sys_logininfor` VALUES ('547', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-10 10:37:20');
INSERT INTO `sys_logininfor` VALUES ('548', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-10 11:25:12');
INSERT INTO `sys_logininfor` VALUES ('549', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-10 11:27:11');
INSERT INTO `sys_logininfor` VALUES ('550', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-10 11:52:38');
INSERT INTO `sys_logininfor` VALUES ('551', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-10 13:56:43');
INSERT INTO `sys_logininfor` VALUES ('552', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-10 14:02:11');
INSERT INTO `sys_logininfor` VALUES ('553', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-10 14:05:06');
INSERT INTO `sys_logininfor` VALUES ('554', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-10 14:09:01');
INSERT INTO `sys_logininfor` VALUES ('555', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-10 14:12:27');
INSERT INTO `sys_logininfor` VALUES ('556', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-10 14:15:09');
INSERT INTO `sys_logininfor` VALUES ('557', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-10 14:37:28');
INSERT INTO `sys_logininfor` VALUES ('558', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2019-10-10 15:12:33');
INSERT INTO `sys_logininfor` VALUES ('559', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-10 15:12:38');
INSERT INTO `sys_logininfor` VALUES ('560', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-10 15:31:20');
INSERT INTO `sys_logininfor` VALUES ('561', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-10 15:54:46');
INSERT INTO `sys_logininfor` VALUES ('562', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-10 15:58:45');
INSERT INTO `sys_logininfor` VALUES ('563', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-10 16:32:11');
INSERT INTO `sys_logininfor` VALUES ('564', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-10 17:23:54');
INSERT INTO `sys_logininfor` VALUES ('565', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-10-10 17:34:36');
INSERT INTO `sys_logininfor` VALUES ('566', '18301403333', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-10 17:35:05');
INSERT INTO `sys_logininfor` VALUES ('567', '18301403333', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-10-10 17:35:33');
INSERT INTO `sys_logininfor` VALUES ('568', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-10 17:35:43');
INSERT INTO `sys_logininfor` VALUES ('569', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-10-10 17:38:02');
INSERT INTO `sys_logininfor` VALUES ('570', '18301403333', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-10 17:38:14');
INSERT INTO `sys_logininfor` VALUES ('571', '18301403333', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-10-10 17:38:26');
INSERT INTO `sys_logininfor` VALUES ('572', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-10 17:38:38');
INSERT INTO `sys_logininfor` VALUES ('573', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-10-10 17:39:10');
INSERT INTO `sys_logininfor` VALUES ('574', '18301403333', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-10 17:39:19');
INSERT INTO `sys_logininfor` VALUES ('575', '18301403333', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-10-10 17:39:41');
INSERT INTO `sys_logininfor` VALUES ('576', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-10 17:39:51');
INSERT INTO `sys_logininfor` VALUES ('577', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-10-10 17:49:49');
INSERT INTO `sys_logininfor` VALUES ('578', 'cp2', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-10 17:49:58');
INSERT INTO `sys_logininfor` VALUES ('579', 'cp2', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-10-10 17:50:15');
INSERT INTO `sys_logininfor` VALUES ('580', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-10 17:50:22');
INSERT INTO `sys_logininfor` VALUES ('581', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-10-10 17:52:03');
INSERT INTO `sys_logininfor` VALUES ('582', 'cp1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-10 17:52:16');
INSERT INTO `sys_logininfor` VALUES ('583', 'cp1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-10-10 17:52:36');
INSERT INTO `sys_logininfor` VALUES ('584', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-10 17:52:50');
INSERT INTO `sys_logininfor` VALUES ('585', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-10-10 17:57:35');
INSERT INTO `sys_logininfor` VALUES ('586', 'cp1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-10 17:57:50');
INSERT INTO `sys_logininfor` VALUES ('587', 'cp1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-10-10 17:58:27');
INSERT INTO `sys_logininfor` VALUES ('588', 'cp2', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-10 17:58:46');
INSERT INTO `sys_logininfor` VALUES ('589', 'cp2', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-10-10 17:58:59');
INSERT INTO `sys_logininfor` VALUES ('590', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-10 17:59:14');
INSERT INTO `sys_logininfor` VALUES ('591', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-10-10 17:59:51');
INSERT INTO `sys_logininfor` VALUES ('592', 'cp2', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-10 18:00:04');
INSERT INTO `sys_logininfor` VALUES ('593', 'cp2', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-10-10 18:00:16');
INSERT INTO `sys_logininfor` VALUES ('594', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-10 18:00:25');
INSERT INTO `sys_logininfor` VALUES ('595', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-10-10 18:04:03');
INSERT INTO `sys_logininfor` VALUES ('596', 'cp1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-10 18:04:18');
INSERT INTO `sys_logininfor` VALUES ('597', 'cp1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-10-10 18:04:31');
INSERT INTO `sys_logininfor` VALUES ('598', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-10 18:04:39');
INSERT INTO `sys_logininfor` VALUES ('599', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-10 18:37:29');
INSERT INTO `sys_logininfor` VALUES ('600', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2019-10-10 18:58:20');
INSERT INTO `sys_logininfor` VALUES ('601', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-10 18:58:23');
INSERT INTO `sys_logininfor` VALUES ('602', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-10 20:09:03');
INSERT INTO `sys_logininfor` VALUES ('603', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-10 20:29:39');
INSERT INTO `sys_logininfor` VALUES ('604', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-11 11:06:40');
INSERT INTO `sys_logininfor` VALUES ('605', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-10-11 11:09:27');
INSERT INTO `sys_logininfor` VALUES ('606', '1234', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '用户不存在/密码错误', '2019-10-11 11:09:35');
INSERT INTO `sys_logininfor` VALUES ('607', '1234', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '用户不存在/密码错误', '2019-10-11 11:09:42');
INSERT INTO `sys_logininfor` VALUES ('608', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-11 11:09:55');
INSERT INTO `sys_logininfor` VALUES ('609', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-11 11:13:59');
INSERT INTO `sys_logininfor` VALUES ('610', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-10-11 11:14:48');
INSERT INTO `sys_logininfor` VALUES ('611', '123', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '用户不存在/密码错误', '2019-10-11 11:15:13');
INSERT INTO `sys_logininfor` VALUES ('612', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2019-10-11 11:17:56');
INSERT INTO `sys_logininfor` VALUES ('613', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-11 11:18:00');
INSERT INTO `sys_logininfor` VALUES ('614', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-10-11 11:21:07');
INSERT INTO `sys_logininfor` VALUES ('615', '123', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '用户不存在/密码错误', '2019-10-11 11:21:21');
INSERT INTO `sys_logininfor` VALUES ('616', '123', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '用户不存在/密码错误', '2019-10-11 11:34:00');
INSERT INTO `sys_logininfor` VALUES ('617', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-11 11:37:31');
INSERT INTO `sys_logininfor` VALUES ('618', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-10-11 11:38:47');
INSERT INTO `sys_logininfor` VALUES ('619', '1234', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-11 11:38:59');
INSERT INTO `sys_logininfor` VALUES ('620', '1234', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-10-11 11:39:03');
INSERT INTO `sys_logininfor` VALUES ('621', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-11 11:39:12');
INSERT INTO `sys_logininfor` VALUES ('622', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-11 14:01:00');
INSERT INTO `sys_logininfor` VALUES ('623', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-10-11 14:07:09');
INSERT INTO `sys_logininfor` VALUES ('624', '12', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-11 14:07:19');
INSERT INTO `sys_logininfor` VALUES ('625', '12', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-10-11 14:07:31');
INSERT INTO `sys_logininfor` VALUES ('626', '123', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-11 14:08:15');
INSERT INTO `sys_logininfor` VALUES ('627', '123', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-10-11 14:08:26');
INSERT INTO `sys_logininfor` VALUES ('628', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-11 14:08:38');
INSERT INTO `sys_logininfor` VALUES ('629', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-10-11 14:09:25');
INSERT INTO `sys_logininfor` VALUES ('630', 'kf1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-11 14:09:38');
INSERT INTO `sys_logininfor` VALUES ('631', 'kf1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-10-11 14:09:42');
INSERT INTO `sys_logininfor` VALUES ('632', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-11 14:09:52');
INSERT INTO `sys_logininfor` VALUES ('633', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-10-11 14:10:17');
INSERT INTO `sys_logininfor` VALUES ('634', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-11 14:10:26');
INSERT INTO `sys_logininfor` VALUES ('635', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-10-11 14:10:37');
INSERT INTO `sys_logininfor` VALUES ('636', 'kf1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-11 14:10:46');
INSERT INTO `sys_logininfor` VALUES ('637', 'kf1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-10-11 14:10:57');
INSERT INTO `sys_logininfor` VALUES ('638', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-11 14:11:04');
INSERT INTO `sys_logininfor` VALUES ('639', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-11 14:39:05');
INSERT INTO `sys_logininfor` VALUES ('640', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-11 14:45:13');
INSERT INTO `sys_logininfor` VALUES ('641', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-11 14:47:04');
INSERT INTO `sys_logininfor` VALUES ('642', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-11 14:50:18');
INSERT INTO `sys_logininfor` VALUES ('643', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-11 14:54:28');
INSERT INTO `sys_logininfor` VALUES ('644', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-11 15:02:31');
INSERT INTO `sys_logininfor` VALUES ('645', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-11 15:25:01');
INSERT INTO `sys_logininfor` VALUES ('646', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-11 15:26:19');
INSERT INTO `sys_logininfor` VALUES ('647', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-11 15:28:29');
INSERT INTO `sys_logininfor` VALUES ('648', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2019-10-11 15:31:22');
INSERT INTO `sys_logininfor` VALUES ('649', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-11 15:31:27');
INSERT INTO `sys_logininfor` VALUES ('650', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-11 15:39:16');
INSERT INTO `sys_logininfor` VALUES ('651', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-11 15:41:29');
INSERT INTO `sys_logininfor` VALUES ('652', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-11 15:56:41');
INSERT INTO `sys_logininfor` VALUES ('653', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-11 15:59:28');
INSERT INTO `sys_logininfor` VALUES ('654', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-11 16:02:31');
INSERT INTO `sys_logininfor` VALUES ('655', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-11 16:17:33');
INSERT INTO `sys_logininfor` VALUES ('656', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '密码输入错误1次', '2019-10-11 16:21:51');
INSERT INTO `sys_logininfor` VALUES ('657', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-11 16:21:59');
INSERT INTO `sys_logininfor` VALUES ('658', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-11 17:12:29');
INSERT INTO `sys_logininfor` VALUES ('659', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-11 17:34:14');
INSERT INTO `sys_logininfor` VALUES ('660', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-11 18:10:24');
INSERT INTO `sys_logininfor` VALUES ('661', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-11 18:14:21');
INSERT INTO `sys_logininfor` VALUES ('662', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-11 18:17:31');
INSERT INTO `sys_logininfor` VALUES ('663', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-11 18:23:08');
INSERT INTO `sys_logininfor` VALUES ('664', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-11 18:38:16');
INSERT INTO `sys_logininfor` VALUES ('665', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-11 18:57:56');
INSERT INTO `sys_logininfor` VALUES ('666', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-11 19:28:59');
INSERT INTO `sys_logininfor` VALUES ('667', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-11 19:33:42');
INSERT INTO `sys_logininfor` VALUES ('668', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2019-10-12 10:05:03');
INSERT INTO `sys_logininfor` VALUES ('669', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-12 10:05:06');
INSERT INTO `sys_logininfor` VALUES ('670', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-12 10:16:35');
INSERT INTO `sys_logininfor` VALUES ('671', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-12 10:22:16');
INSERT INTO `sys_logininfor` VALUES ('672', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-12 10:28:54');
INSERT INTO `sys_logininfor` VALUES ('673', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-12 11:10:59');
INSERT INTO `sys_logininfor` VALUES ('674', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-12 13:45:41');
INSERT INTO `sys_logininfor` VALUES ('675', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-12 14:03:31');
INSERT INTO `sys_logininfor` VALUES ('676', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-12 14:19:42');
INSERT INTO `sys_logininfor` VALUES ('677', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-12 14:22:00');
INSERT INTO `sys_logininfor` VALUES ('678', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-12 14:24:57');
INSERT INTO `sys_logininfor` VALUES ('679', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-12 14:40:04');
INSERT INTO `sys_logininfor` VALUES ('680', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-12 15:04:35');
INSERT INTO `sys_logininfor` VALUES ('681', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-12 15:12:47');
INSERT INTO `sys_logininfor` VALUES ('682', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-12 15:29:19');
INSERT INTO `sys_logininfor` VALUES ('683', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-12 15:31:31');
INSERT INTO `sys_logininfor` VALUES ('684', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-12 15:38:28');
INSERT INTO `sys_logininfor` VALUES ('685', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-12 15:41:00');
INSERT INTO `sys_logininfor` VALUES ('686', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-12 15:46:02');
INSERT INTO `sys_logininfor` VALUES ('687', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-12 15:54:54');
INSERT INTO `sys_logininfor` VALUES ('688', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2019-10-12 16:04:51');
INSERT INTO `sys_logininfor` VALUES ('689', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-12 16:04:54');
INSERT INTO `sys_logininfor` VALUES ('690', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-12 16:08:15');
INSERT INTO `sys_logininfor` VALUES ('691', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-12 16:11:13');
INSERT INTO `sys_logininfor` VALUES ('692', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-12 16:17:54');
INSERT INTO `sys_logininfor` VALUES ('693', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-12 16:18:53');
INSERT INTO `sys_logininfor` VALUES ('694', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-12 16:26:45');
INSERT INTO `sys_logininfor` VALUES ('695', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-12 16:32:33');
INSERT INTO `sys_logininfor` VALUES ('696', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-12 16:41:42');
INSERT INTO `sys_logininfor` VALUES ('697', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-12 16:56:20');
INSERT INTO `sys_logininfor` VALUES ('698', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-12 17:11:43');
INSERT INTO `sys_logininfor` VALUES ('699', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-12 17:32:15');
INSERT INTO `sys_logininfor` VALUES ('700', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-14 09:33:08');
INSERT INTO `sys_logininfor` VALUES ('701', 'system', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '用户不存在/密码错误', '2019-10-14 10:23:45');
INSERT INTO `sys_logininfor` VALUES ('702', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-14 10:23:55');
INSERT INTO `sys_logininfor` VALUES ('703', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-14 10:26:52');
INSERT INTO `sys_logininfor` VALUES ('704', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-14 10:27:52');
INSERT INTO `sys_logininfor` VALUES ('705', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-14 10:35:37');
INSERT INTO `sys_logininfor` VALUES ('706', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-14 10:37:14');
INSERT INTO `sys_logininfor` VALUES ('707', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-14 10:38:28');
INSERT INTO `sys_logininfor` VALUES ('708', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-14 10:52:14');
INSERT INTO `sys_logininfor` VALUES ('709', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-14 10:56:44');
INSERT INTO `sys_logininfor` VALUES ('710', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-14 10:59:01');
INSERT INTO `sys_logininfor` VALUES ('711', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-14 11:09:49');
INSERT INTO `sys_logininfor` VALUES ('712', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-14 11:12:03');
INSERT INTO `sys_logininfor` VALUES ('713', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-14 11:13:47');
INSERT INTO `sys_logininfor` VALUES ('714', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-14 11:15:45');
INSERT INTO `sys_logininfor` VALUES ('715', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-14 11:17:35');
INSERT INTO `sys_logininfor` VALUES ('716', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-14 11:18:29');
INSERT INTO `sys_logininfor` VALUES ('717', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-14 11:20:41');
INSERT INTO `sys_logininfor` VALUES ('718', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-14 11:28:14');
INSERT INTO `sys_logininfor` VALUES ('719', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-14 11:35:41');
INSERT INTO `sys_logininfor` VALUES ('720', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-14 11:39:40');
INSERT INTO `sys_logininfor` VALUES ('721', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-14 11:44:45');
INSERT INTO `sys_logininfor` VALUES ('722', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-14 11:46:27');
INSERT INTO `sys_logininfor` VALUES ('723', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-14 11:47:13');
INSERT INTO `sys_logininfor` VALUES ('724', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-14 14:24:55');
INSERT INTO `sys_logininfor` VALUES ('725', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-14 14:30:11');
INSERT INTO `sys_logininfor` VALUES ('726', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2019-10-14 14:31:10');
INSERT INTO `sys_logininfor` VALUES ('727', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-14 14:31:14');
INSERT INTO `sys_logininfor` VALUES ('728', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-14 14:33:05');
INSERT INTO `sys_logininfor` VALUES ('729', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-14 14:46:49');
INSERT INTO `sys_logininfor` VALUES ('730', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-14 14:52:47');
INSERT INTO `sys_logininfor` VALUES ('731', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-10-14 16:20:25');
INSERT INTO `sys_logininfor` VALUES ('732', 'cpm', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-14 16:20:33');
INSERT INTO `sys_logininfor` VALUES ('733', 'cpm', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-10-14 16:21:34');
INSERT INTO `sys_logininfor` VALUES ('734', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-14 16:21:45');
INSERT INTO `sys_logininfor` VALUES ('735', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-10-14 16:24:37');
INSERT INTO `sys_logininfor` VALUES ('736', 'cpm', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-14 16:24:46');
INSERT INTO `sys_logininfor` VALUES ('737', 'cpm', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-10-14 16:25:48');
INSERT INTO `sys_logininfor` VALUES ('738', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-14 16:25:55');
INSERT INTO `sys_logininfor` VALUES ('739', 'cpm', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2019-10-15 09:46:58');
INSERT INTO `sys_logininfor` VALUES ('740', 'cpm', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-15 09:47:02');
INSERT INTO `sys_logininfor` VALUES ('741', 'cpm', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-10-15 09:47:33');
INSERT INTO `sys_logininfor` VALUES ('742', 'cp1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-15 09:47:46');
INSERT INTO `sys_logininfor` VALUES ('743', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-15 10:35:03');
INSERT INTO `sys_logininfor` VALUES ('744', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-15 14:49:55');
INSERT INTO `sys_logininfor` VALUES ('745', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-10-15 15:06:18');
INSERT INTO `sys_logininfor` VALUES ('746', 'cp1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-15 15:06:34');
INSERT INTO `sys_logininfor` VALUES ('747', 'cp1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-10-15 15:08:47');
INSERT INTO `sys_logininfor` VALUES ('748', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-15 15:08:56');
INSERT INTO `sys_logininfor` VALUES ('749', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-10-15 15:10:03');
INSERT INTO `sys_logininfor` VALUES ('750', 'cp1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2019-10-15 15:10:11');
INSERT INTO `sys_logininfor` VALUES ('751', 'cp1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-15 15:10:15');
INSERT INTO `sys_logininfor` VALUES ('752', 'cp1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-15 15:12:37');
INSERT INTO `sys_logininfor` VALUES ('753', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-15 15:15:28');
INSERT INTO `sys_logininfor` VALUES ('754', 'cp1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-15 15:15:47');
INSERT INTO `sys_logininfor` VALUES ('755', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-10-15 15:16:11');
INSERT INTO `sys_logininfor` VALUES ('756', 'cpm', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-15 15:16:20');
INSERT INTO `sys_logininfor` VALUES ('757', 'cpm', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-10-15 15:17:09');
INSERT INTO `sys_logininfor` VALUES ('758', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-15 15:17:23');
INSERT INTO `sys_logininfor` VALUES ('759', 'cp1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-10-15 15:21:41');
INSERT INTO `sys_logininfor` VALUES ('760', 'cp1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-15 15:21:49');
INSERT INTO `sys_logininfor` VALUES ('761', 'cp1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-10-15 15:25:13');
INSERT INTO `sys_logininfor` VALUES ('762', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-15 15:25:21');
INSERT INTO `sys_logininfor` VALUES ('763', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-10-15 15:26:30');
INSERT INTO `sys_logininfor` VALUES ('764', 'cp1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-15 15:26:37');
INSERT INTO `sys_logininfor` VALUES ('765', 'cp1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-15 15:31:35');
INSERT INTO `sys_logininfor` VALUES ('766', 'cp1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2019-10-15 15:33:07');
INSERT INTO `sys_logininfor` VALUES ('767', 'cp1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-15 15:33:10');
INSERT INTO `sys_logininfor` VALUES ('768', 'cp1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-15 15:37:50');
INSERT INTO `sys_logininfor` VALUES ('769', 'cp1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-15 15:42:14');
INSERT INTO `sys_logininfor` VALUES ('770', 'cp1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-15 15:55:28');
INSERT INTO `sys_logininfor` VALUES ('771', 'cpm', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-15 15:55:49');
INSERT INTO `sys_logininfor` VALUES ('772', 'cpm', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-10-15 15:56:31');
INSERT INTO `sys_logininfor` VALUES ('773', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-15 15:56:40');
INSERT INTO `sys_logininfor` VALUES ('774', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-10-15 15:58:34');
INSERT INTO `sys_logininfor` VALUES ('775', 'cpm', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-15 15:58:41');
INSERT INTO `sys_logininfor` VALUES ('776', 'cpm', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-15 16:00:47');
INSERT INTO `sys_logininfor` VALUES ('777', 'cpm', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-10-15 16:01:30');
INSERT INTO `sys_logininfor` VALUES ('778', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-15 16:01:37');
INSERT INTO `sys_logininfor` VALUES ('779', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-10-15 16:02:21');
INSERT INTO `sys_logininfor` VALUES ('780', 'cpm', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-15 16:02:37');
INSERT INTO `sys_logininfor` VALUES ('781', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-15 16:03:00');
INSERT INTO `sys_logininfor` VALUES ('782', 'cpm', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-10-15 16:04:10');
INSERT INTO `sys_logininfor` VALUES ('783', 'cpm', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2019-10-15 16:05:44');
INSERT INTO `sys_logininfor` VALUES ('784', 'cpm', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-15 16:05:47');
INSERT INTO `sys_logininfor` VALUES ('785', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-15 16:07:04');
INSERT INTO `sys_logininfor` VALUES ('786', 'cpm', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-10-15 16:09:29');
INSERT INTO `sys_logininfor` VALUES ('787', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-15 16:09:38');
INSERT INTO `sys_logininfor` VALUES ('788', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-10-15 16:10:14');
INSERT INTO `sys_logininfor` VALUES ('789', 'cp1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-15 16:10:23');
INSERT INTO `sys_logininfor` VALUES ('790', 'cp1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-15 16:15:19');
INSERT INTO `sys_logininfor` VALUES ('791', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-15 16:17:50');
INSERT INTO `sys_logininfor` VALUES ('792', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-15 16:36:34');
INSERT INTO `sys_logininfor` VALUES ('793', 'cp1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-15 16:37:13');
INSERT INTO `sys_logininfor` VALUES ('794', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-15 16:51:17');
INSERT INTO `sys_logininfor` VALUES ('795', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-15 16:58:48');
INSERT INTO `sys_logininfor` VALUES ('796', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-15 17:06:59');
INSERT INTO `sys_logininfor` VALUES ('797', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-15 17:09:20');
INSERT INTO `sys_logininfor` VALUES ('798', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-15 17:15:37');
INSERT INTO `sys_logininfor` VALUES ('799', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-15 17:19:40');
INSERT INTO `sys_logininfor` VALUES ('800', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-15 17:25:12');
INSERT INTO `sys_logininfor` VALUES ('801', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-15 17:29:48');
INSERT INTO `sys_logininfor` VALUES ('802', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-15 17:31:26');
INSERT INTO `sys_logininfor` VALUES ('803', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-15 17:34:42');
INSERT INTO `sys_logininfor` VALUES ('804', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-15 17:37:26');
INSERT INTO `sys_logininfor` VALUES ('805', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-15 17:46:52');
INSERT INTO `sys_logininfor` VALUES ('806', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-15 18:40:26');
INSERT INTO `sys_logininfor` VALUES ('807', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-15 18:42:14');
INSERT INTO `sys_logininfor` VALUES ('808', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-15 18:43:16');
INSERT INTO `sys_logininfor` VALUES ('809', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-15 18:47:58');
INSERT INTO `sys_logininfor` VALUES ('810', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-16 09:40:56');
INSERT INTO `sys_logininfor` VALUES ('811', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-16 09:42:38');
INSERT INTO `sys_logininfor` VALUES ('812', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-16 09:43:36');
INSERT INTO `sys_logininfor` VALUES ('813', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-16 10:06:18');
INSERT INTO `sys_logininfor` VALUES ('814', 'cpm', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-16 14:22:15');
INSERT INTO `sys_logininfor` VALUES ('815', 'cpm', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-10-16 14:30:27');
INSERT INTO `sys_logininfor` VALUES ('816', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-16 14:30:36');
INSERT INTO `sys_logininfor` VALUES ('817', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-10-16 14:32:43');
INSERT INTO `sys_logininfor` VALUES ('818', 'cpm', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-16 14:32:53');
INSERT INTO `sys_logininfor` VALUES ('819', 'cpm', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-16 14:42:24');
INSERT INTO `sys_logininfor` VALUES ('820', 'cpm', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-16 14:44:39');
INSERT INTO `sys_logininfor` VALUES ('821', 'cpm', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-10-16 14:45:09');
INSERT INTO `sys_logininfor` VALUES ('822', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-16 14:45:18');
INSERT INTO `sys_logininfor` VALUES ('823', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-16 15:24:50');
INSERT INTO `sys_logininfor` VALUES ('824', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-10-16 15:32:51');
INSERT INTO `sys_logininfor` VALUES ('825', 'cpm', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-16 15:32:59');
INSERT INTO `sys_logininfor` VALUES ('826', 'cpm', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-16 17:06:19');
INSERT INTO `sys_logininfor` VALUES ('827', 'cpm', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-16 17:11:31');
INSERT INTO `sys_logininfor` VALUES ('828', 'cpm', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2019-10-16 17:12:28');
INSERT INTO `sys_logininfor` VALUES ('829', 'cpm', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-16 17:12:31');
INSERT INTO `sys_logininfor` VALUES ('830', 'cpm', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2019-10-16 17:15:18');
INSERT INTO `sys_logininfor` VALUES ('831', 'cpm', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2019-10-16 17:15:21');
INSERT INTO `sys_logininfor` VALUES ('832', 'cpm', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-16 17:15:26');
INSERT INTO `sys_logininfor` VALUES ('833', 'cpm', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-17 10:22:15');
INSERT INTO `sys_logininfor` VALUES ('834', 'cpm', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-17 10:38:51');
INSERT INTO `sys_logininfor` VALUES ('835', 'cpm', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-17 13:39:41');
INSERT INTO `sys_logininfor` VALUES ('836', 'cpm', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-17 13:40:41');
INSERT INTO `sys_logininfor` VALUES ('837', 'cpm', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-17 13:54:17');
INSERT INTO `sys_logininfor` VALUES ('838', 'cpm', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-17 13:55:33');
INSERT INTO `sys_logininfor` VALUES ('839', 'cpm', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-17 14:07:48');
INSERT INTO `sys_logininfor` VALUES ('840', 'cpm', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-17 14:20:30');
INSERT INTO `sys_logininfor` VALUES ('841', 'cpm', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-17 14:22:16');
INSERT INTO `sys_logininfor` VALUES ('842', 'cpm', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-17 14:26:25');
INSERT INTO `sys_logininfor` VALUES ('843', 'cpm', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-17 15:14:14');
INSERT INTO `sys_logininfor` VALUES ('844', 'cpm', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-17 15:25:01');
INSERT INTO `sys_logininfor` VALUES ('845', 'cpm', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-17 15:57:20');
INSERT INTO `sys_logininfor` VALUES ('846', 'cpm', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-17 16:00:43');
INSERT INTO `sys_logininfor` VALUES ('847', 'cpm', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-17 16:04:44');
INSERT INTO `sys_logininfor` VALUES ('848', 'cpm', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2019-10-17 16:10:07');
INSERT INTO `sys_logininfor` VALUES ('849', 'cpm', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-17 16:10:10');
INSERT INTO `sys_logininfor` VALUES ('850', 'cpm', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-17 16:14:21');
INSERT INTO `sys_logininfor` VALUES ('851', 'cpm', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-17 16:18:07');
INSERT INTO `sys_logininfor` VALUES ('852', 'cpm', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-17 16:21:00');
INSERT INTO `sys_logininfor` VALUES ('853', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-17 18:11:50');
INSERT INTO `sys_logininfor` VALUES ('854', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-18 10:12:08');
INSERT INTO `sys_logininfor` VALUES ('855', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-10-18 10:15:50');
INSERT INTO `sys_logininfor` VALUES ('856', 'cpm', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-18 10:16:02');
INSERT INTO `sys_logininfor` VALUES ('857', 'cpm', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-10-18 10:23:37');
INSERT INTO `sys_logininfor` VALUES ('858', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-18 10:23:44');
INSERT INTO `sys_logininfor` VALUES ('859', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-10-18 10:27:51');
INSERT INTO `sys_logininfor` VALUES ('860', 'cpm', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-18 10:28:01');
INSERT INTO `sys_logininfor` VALUES ('861', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-18 10:34:57');
INSERT INTO `sys_logininfor` VALUES ('862', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-10-18 10:50:33');
INSERT INTO `sys_logininfor` VALUES ('863', 'cpm', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-18 10:50:53');
INSERT INTO `sys_logininfor` VALUES ('864', 'cp1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-18 10:54:39');
INSERT INTO `sys_logininfor` VALUES ('865', 'cp1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-10-18 10:55:03');
INSERT INTO `sys_logininfor` VALUES ('866', 'cpm', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-18 10:55:10');
INSERT INTO `sys_logininfor` VALUES ('867', 'cpm', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-10-18 10:55:32');
INSERT INTO `sys_logininfor` VALUES ('868', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-18 10:55:39');
INSERT INTO `sys_logininfor` VALUES ('869', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-10-18 10:55:58');
INSERT INTO `sys_logininfor` VALUES ('870', 'cp1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-18 10:56:05');
INSERT INTO `sys_logininfor` VALUES ('871', 'cp1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-18 11:25:06');
INSERT INTO `sys_logininfor` VALUES ('872', 'cp1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-18 11:32:45');
INSERT INTO `sys_logininfor` VALUES ('873', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2019-10-18 14:01:13');
INSERT INTO `sys_logininfor` VALUES ('874', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-18 14:01:15');
INSERT INTO `sys_logininfor` VALUES ('875', 'cpm', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-18 15:21:15');
INSERT INTO `sys_logininfor` VALUES ('876', 'cpm', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-18 15:29:37');
INSERT INTO `sys_logininfor` VALUES ('877', 'cp1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-18 16:38:01');
INSERT INTO `sys_logininfor` VALUES ('878', 'cp1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-10-18 16:39:33');
INSERT INTO `sys_logininfor` VALUES ('879', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-18 16:39:44');
INSERT INTO `sys_logininfor` VALUES ('880', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-18 16:41:56');
INSERT INTO `sys_logininfor` VALUES ('881', 'cp1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-18 16:43:32');
INSERT INTO `sys_logininfor` VALUES ('882', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2019-10-18 18:15:28');
INSERT INTO `sys_logininfor` VALUES ('883', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-18 18:15:33');
INSERT INTO `sys_logininfor` VALUES ('884', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-18 18:27:12');
INSERT INTO `sys_logininfor` VALUES ('885', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-18 18:28:24');
INSERT INTO `sys_logininfor` VALUES ('886', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-18 18:29:09');
INSERT INTO `sys_logininfor` VALUES ('887', 'cpm', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-21 10:22:21');
INSERT INTO `sys_logininfor` VALUES ('888', 'cpm', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-21 10:23:49');
INSERT INTO `sys_logininfor` VALUES ('889', 'cpm', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-21 10:34:18');
INSERT INTO `sys_logininfor` VALUES ('890', 'cpm', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-21 10:35:36');
INSERT INTO `sys_logininfor` VALUES ('891', 'cpm', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-21 10:37:20');
INSERT INTO `sys_logininfor` VALUES ('892', 'cpm', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-21 10:38:45');
INSERT INTO `sys_logininfor` VALUES ('893', 'cpm', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-21 10:42:53');
INSERT INTO `sys_logininfor` VALUES ('894', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2019-10-21 12:08:47');
INSERT INTO `sys_logininfor` VALUES ('895', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2019-10-21 12:08:49');
INSERT INTO `sys_logininfor` VALUES ('896', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-21 12:08:54');
INSERT INTO `sys_logininfor` VALUES ('897', 'cpm', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-21 14:08:58');
INSERT INTO `sys_logininfor` VALUES ('898', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-21 14:23:36');
INSERT INTO `sys_logininfor` VALUES ('899', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-10-21 14:26:34');
INSERT INTO `sys_logininfor` VALUES ('900', 'cpm', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-21 14:26:41');
INSERT INTO `sys_logininfor` VALUES ('901', 'cpm', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-10-21 14:26:48');
INSERT INTO `sys_logininfor` VALUES ('902', 'cp1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-21 14:26:55');
INSERT INTO `sys_logininfor` VALUES ('903', 'cp1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-21 14:29:29');
INSERT INTO `sys_logininfor` VALUES ('904', 'cp1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-21 14:30:54');
INSERT INTO `sys_logininfor` VALUES ('905', 'cp1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-21 14:32:36');
INSERT INTO `sys_logininfor` VALUES ('906', 'cp1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-21 14:36:22');
INSERT INTO `sys_logininfor` VALUES ('907', 'cp1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-21 14:39:04');
INSERT INTO `sys_logininfor` VALUES ('908', 'cp1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-21 14:43:05');
INSERT INTO `sys_logininfor` VALUES ('909', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-21 16:44:19');
INSERT INTO `sys_logininfor` VALUES ('910', 'cpm', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-21 17:31:33');
INSERT INTO `sys_logininfor` VALUES ('911', 'cpm', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-10-21 17:31:39');
INSERT INTO `sys_logininfor` VALUES ('912', 'cp1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-21 17:31:46');
INSERT INTO `sys_logininfor` VALUES ('913', 'cp1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-10-21 17:31:54');
INSERT INTO `sys_logininfor` VALUES ('914', 'cpm', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-21 17:32:01');
INSERT INTO `sys_logininfor` VALUES ('915', 'cpm', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-10-21 17:37:09');
INSERT INTO `sys_logininfor` VALUES ('916', 'cp1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-21 17:37:18');
INSERT INTO `sys_logininfor` VALUES ('917', 'cpm', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-22 14:47:54');
INSERT INTO `sys_logininfor` VALUES ('918', 'cpm', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-10-22 14:48:02');
INSERT INTO `sys_logininfor` VALUES ('919', 'cp1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2019-10-22 14:48:09');
INSERT INTO `sys_logininfor` VALUES ('920', 'cp1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-22 14:48:12');
INSERT INTO `sys_logininfor` VALUES ('921', 'cp1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-10-22 14:48:27');
INSERT INTO `sys_logininfor` VALUES ('922', 'cpm', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-22 14:48:35');
INSERT INTO `sys_logininfor` VALUES ('923', 'cpm', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-10-22 14:50:09');
INSERT INTO `sys_logininfor` VALUES ('924', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-22 14:50:19');
INSERT INTO `sys_logininfor` VALUES ('925', 'cpm', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-22 17:25:19');
INSERT INTO `sys_logininfor` VALUES ('926', 'cpm', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2019-10-24 13:49:19');
INSERT INTO `sys_logininfor` VALUES ('927', 'cpm', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-24 13:49:23');
INSERT INTO `sys_logininfor` VALUES ('928', 'cpm', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-24 15:45:46');
INSERT INTO `sys_logininfor` VALUES ('929', 'cpm', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-10-24 15:46:06');
INSERT INTO `sys_logininfor` VALUES ('930', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-24 15:46:15');
INSERT INTO `sys_logininfor` VALUES ('931', 'cp1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-28 10:09:31');
INSERT INTO `sys_logininfor` VALUES ('932', 'cp1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-10-28 10:17:28');
INSERT INTO `sys_logininfor` VALUES ('933', 'cpm', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-28 10:17:36');
INSERT INTO `sys_logininfor` VALUES ('934', 'cpm', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-28 10:44:56');
INSERT INTO `sys_logininfor` VALUES ('935', 'cpm', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-28 10:45:57');
INSERT INTO `sys_logininfor` VALUES ('936', 'cpm', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-28 10:47:38');
INSERT INTO `sys_logininfor` VALUES ('937', 'cpm', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-10-28 10:47:50');
INSERT INTO `sys_logininfor` VALUES ('938', 'cpm', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-28 10:47:58');
INSERT INTO `sys_logininfor` VALUES ('939', 'cpm', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-28 10:48:46');
INSERT INTO `sys_logininfor` VALUES ('940', 'cpm', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-28 10:49:22');
INSERT INTO `sys_logininfor` VALUES ('941', 'cpm', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-28 10:54:11');
INSERT INTO `sys_logininfor` VALUES ('942', 'cpm', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-28 10:56:18');
INSERT INTO `sys_logininfor` VALUES ('943', 'cpm', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2019-10-28 11:07:07');
INSERT INTO `sys_logininfor` VALUES ('944', 'cpm', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-28 11:07:10');
INSERT INTO `sys_logininfor` VALUES ('945', 'cpm', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-28 11:07:59');
INSERT INTO `sys_logininfor` VALUES ('946', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-28 11:40:56');
INSERT INTO `sys_logininfor` VALUES ('947', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-10-28 11:41:09');
INSERT INTO `sys_logininfor` VALUES ('948', 'cpm', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-28 11:41:16');
INSERT INTO `sys_logininfor` VALUES ('949', 'cpm', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-28 11:45:38');
INSERT INTO `sys_logininfor` VALUES ('950', 'cp1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-28 11:48:39');
INSERT INTO `sys_logininfor` VALUES ('951', 'cp1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-28 14:26:54');
INSERT INTO `sys_logininfor` VALUES ('952', 'cp1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-28 14:28:41');
INSERT INTO `sys_logininfor` VALUES ('953', 'cp1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-28 14:30:02');
INSERT INTO `sys_logininfor` VALUES ('954', 'cp1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-28 14:30:57');
INSERT INTO `sys_logininfor` VALUES ('955', 'cp1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-28 14:33:59');
INSERT INTO `sys_logininfor` VALUES ('956', 'cp1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-28 14:35:10');
INSERT INTO `sys_logininfor` VALUES ('957', 'cp1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-28 15:26:37');
INSERT INTO `sys_logininfor` VALUES ('958', 'cp1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-28 15:27:25');
INSERT INTO `sys_logininfor` VALUES ('959', 'cp1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-28 15:35:07');
INSERT INTO `sys_logininfor` VALUES ('960', 'cp1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-28 15:35:57');
INSERT INTO `sys_logininfor` VALUES ('961', 'cp1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-28 15:41:20');
INSERT INTO `sys_logininfor` VALUES ('962', 'cp1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-28 15:43:05');
INSERT INTO `sys_logininfor` VALUES ('963', 'cp1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-28 15:43:41');
INSERT INTO `sys_logininfor` VALUES ('964', 'cp1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-28 15:45:41');
INSERT INTO `sys_logininfor` VALUES ('965', 'cp1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-28 15:48:11');
INSERT INTO `sys_logininfor` VALUES ('966', 'cp1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-28 15:49:05');
INSERT INTO `sys_logininfor` VALUES ('967', 'cp1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-10-28 15:49:43');
INSERT INTO `sys_logininfor` VALUES ('968', 'cp1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2019-10-28 15:50:04');
INSERT INTO `sys_logininfor` VALUES ('969', 'cp1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-28 15:50:08');
INSERT INTO `sys_logininfor` VALUES ('970', 'cp1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-28 15:57:35');
INSERT INTO `sys_logininfor` VALUES ('971', 'cp1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-28 16:00:47');
INSERT INTO `sys_logininfor` VALUES ('972', 'cp1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-28 16:18:19');
INSERT INTO `sys_logininfor` VALUES ('973', 'cp1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-28 18:02:13');
INSERT INTO `sys_logininfor` VALUES ('974', 'cp1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-28 18:44:01');
INSERT INTO `sys_logininfor` VALUES ('975', 'cp1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-28 18:47:31');
INSERT INTO `sys_logininfor` VALUES ('976', 'cpm', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-28 18:49:30');
INSERT INTO `sys_logininfor` VALUES ('977', 'cpm', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-28 18:50:42');
INSERT INTO `sys_logininfor` VALUES ('978', 'cpm', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-10-28 18:50:47');
INSERT INTO `sys_logininfor` VALUES ('979', 'cp1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-28 18:50:53');
INSERT INTO `sys_logininfor` VALUES ('980', 'cp1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-28 18:55:49');
INSERT INTO `sys_logininfor` VALUES ('981', 'cp1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-28 19:29:05');
INSERT INTO `sys_logininfor` VALUES ('982', 'cp1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-29 09:45:25');
INSERT INTO `sys_logininfor` VALUES ('983', 'cp1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-29 09:47:43');
INSERT INTO `sys_logininfor` VALUES ('984', 'cp1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-29 09:49:13');
INSERT INTO `sys_logininfor` VALUES ('985', 'cp1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-29 09:50:52');
INSERT INTO `sys_logininfor` VALUES ('986', 'cp1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-29 09:54:21');
INSERT INTO `sys_logininfor` VALUES ('987', 'cp1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-29 09:55:31');
INSERT INTO `sys_logininfor` VALUES ('988', 'cp1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-29 09:57:25');
INSERT INTO `sys_logininfor` VALUES ('989', 'cp1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2019-10-29 10:00:27');
INSERT INTO `sys_logininfor` VALUES ('990', 'cp1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-29 10:00:30');
INSERT INTO `sys_logininfor` VALUES ('991', 'cp1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-29 10:15:02');
INSERT INTO `sys_logininfor` VALUES ('992', 'cp1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-29 10:20:44');
INSERT INTO `sys_logininfor` VALUES ('993', 'cp1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-29 12:17:34');
INSERT INTO `sys_logininfor` VALUES ('994', 'cp1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-29 12:39:04');
INSERT INTO `sys_logininfor` VALUES ('995', 'cp1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-29 12:40:34');
INSERT INTO `sys_logininfor` VALUES ('996', 'cp1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-29 12:43:58');
INSERT INTO `sys_logininfor` VALUES ('997', 'cp1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-10-29 12:44:09');
INSERT INTO `sys_logininfor` VALUES ('998', 'cp1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-29 12:44:16');
INSERT INTO `sys_logininfor` VALUES ('999', 'cp1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-29 12:53:19');
INSERT INTO `sys_logininfor` VALUES ('1000', 'cp1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-29 13:34:06');
INSERT INTO `sys_logininfor` VALUES ('1001', 'cp1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-10-29 13:36:02');
INSERT INTO `sys_logininfor` VALUES ('1002', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-29 13:36:11');
INSERT INTO `sys_logininfor` VALUES ('1003', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-10-29 13:36:15');
INSERT INTO `sys_logininfor` VALUES ('1004', 'cp1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-29 13:36:20');
INSERT INTO `sys_logininfor` VALUES ('1005', 'cp1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-29 13:37:38');
INSERT INTO `sys_logininfor` VALUES ('1006', 'cp1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-29 13:38:43');
INSERT INTO `sys_logininfor` VALUES ('1007', 'cp1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-29 13:45:44');
INSERT INTO `sys_logininfor` VALUES ('1008', 'cp1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-29 16:03:10');
INSERT INTO `sys_logininfor` VALUES ('1009', 'cp1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2019-10-29 16:09:44');
INSERT INTO `sys_logininfor` VALUES ('1010', 'cp1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2019-10-29 16:09:49');
INSERT INTO `sys_logininfor` VALUES ('1011', 'cp1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2019-10-29 16:09:53');
INSERT INTO `sys_logininfor` VALUES ('1012', 'cp1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-29 16:09:57');
INSERT INTO `sys_logininfor` VALUES ('1013', 'cp1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-29 16:13:13');
INSERT INTO `sys_logininfor` VALUES ('1014', 'cp1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-29 16:14:50');
INSERT INTO `sys_logininfor` VALUES ('1015', 'cp1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-29 16:16:33');
INSERT INTO `sys_logininfor` VALUES ('1016', 'cp1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-29 16:19:38');
INSERT INTO `sys_logininfor` VALUES ('1017', 'cp1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-29 16:41:39');
INSERT INTO `sys_logininfor` VALUES ('1018', 'cp1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-29 16:48:46');
INSERT INTO `sys_logininfor` VALUES ('1019', 'cp1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-29 16:52:29');
INSERT INTO `sys_logininfor` VALUES ('1020', 'cp1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-29 16:54:25');
INSERT INTO `sys_logininfor` VALUES ('1021', 'cp1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-29 17:03:51');
INSERT INTO `sys_logininfor` VALUES ('1022', 'cp1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-29 17:05:40');
INSERT INTO `sys_logininfor` VALUES ('1023', 'cp1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2019-10-29 17:07:40');
INSERT INTO `sys_logininfor` VALUES ('1024', 'cp1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-29 17:07:44');
INSERT INTO `sys_logininfor` VALUES ('1025', 'cp1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-29 17:16:21');
INSERT INTO `sys_logininfor` VALUES ('1026', 'cp1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-29 17:19:59');
INSERT INTO `sys_logininfor` VALUES ('1027', 'cp1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-29 17:22:03');
INSERT INTO `sys_logininfor` VALUES ('1028', 'cp1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-29 17:24:14');
INSERT INTO `sys_logininfor` VALUES ('1029', 'cp1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-29 17:26:09');
INSERT INTO `sys_logininfor` VALUES ('1030', 'cp1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-29 17:30:13');
INSERT INTO `sys_logininfor` VALUES ('1031', 'cp1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-29 20:21:15');
INSERT INTO `sys_logininfor` VALUES ('1032', 'cp1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-29 20:22:18');
INSERT INTO `sys_logininfor` VALUES ('1033', 'cp1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-10-29 20:24:25');
INSERT INTO `sys_logininfor` VALUES ('1034', 'cpm', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2019-10-29 20:24:31');
INSERT INTO `sys_logininfor` VALUES ('1035', 'cpm', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-29 20:24:34');
INSERT INTO `sys_logininfor` VALUES ('1036', 'cpm', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-10-29 20:27:35');
INSERT INTO `sys_logininfor` VALUES ('1037', 'll11', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-29 20:27:43');
INSERT INTO `sys_logininfor` VALUES ('1038', 'll11', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-10-29 20:27:50');
INSERT INTO `sys_logininfor` VALUES ('1039', 'cpm', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-29 20:27:57');
INSERT INTO `sys_logininfor` VALUES ('1040', 'cpm', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-10-29 20:28:50');
INSERT INTO `sys_logininfor` VALUES ('1041', 'll11', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-29 20:29:03');
INSERT INTO `sys_logininfor` VALUES ('1042', 'll11', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-10-29 20:32:13');
INSERT INTO `sys_logininfor` VALUES ('1043', 'll11', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-29 20:32:35');
INSERT INTO `sys_logininfor` VALUES ('1044', 'll11', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-10-29 20:33:55');
INSERT INTO `sys_logininfor` VALUES ('1045', 'll11', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '密码输入错误1次', '2019-10-29 20:34:12');
INSERT INTO `sys_logininfor` VALUES ('1046', 'll11', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-29 20:34:18');
INSERT INTO `sys_logininfor` VALUES ('1047', 'cpm', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-30 10:13:38');
INSERT INTO `sys_logininfor` VALUES ('1048', 'cpm', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-10-30 10:13:51');
INSERT INTO `sys_logininfor` VALUES ('1049', 'cp1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2019-10-30 10:13:58');
INSERT INTO `sys_logininfor` VALUES ('1050', 'cp1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-30 10:14:02');
INSERT INTO `sys_logininfor` VALUES ('1051', 'cp1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-10-30 10:16:02');
INSERT INTO `sys_logininfor` VALUES ('1052', 'cp1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-30 10:16:20');
INSERT INTO `sys_logininfor` VALUES ('1053', 'cp1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-30 10:40:09');
INSERT INTO `sys_logininfor` VALUES ('1054', 'cp1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-30 10:45:20');
INSERT INTO `sys_logininfor` VALUES ('1055', 'cp1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-30 11:00:17');
INSERT INTO `sys_logininfor` VALUES ('1056', 'cp1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-30 11:10:16');
INSERT INTO `sys_logininfor` VALUES ('1057', 'cp1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-30 11:11:53');
INSERT INTO `sys_logininfor` VALUES ('1058', 'cp1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-30 11:14:28');
INSERT INTO `sys_logininfor` VALUES ('1059', 'cp1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-30 11:19:23');
INSERT INTO `sys_logininfor` VALUES ('1060', 'cp1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-30 11:21:04');
INSERT INTO `sys_logininfor` VALUES ('1061', 'cp1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-30 11:41:47');
INSERT INTO `sys_logininfor` VALUES ('1062', 'cp1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-30 11:44:42');
INSERT INTO `sys_logininfor` VALUES ('1063', 'cp1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-30 11:45:46');
INSERT INTO `sys_logininfor` VALUES ('1064', 'cp1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-30 11:47:55');
INSERT INTO `sys_logininfor` VALUES ('1065', 'cp1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-30 11:52:20');
INSERT INTO `sys_logininfor` VALUES ('1066', 'cp1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-30 13:52:15');
INSERT INTO `sys_logininfor` VALUES ('1067', 'cp1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-30 14:15:51');
INSERT INTO `sys_logininfor` VALUES ('1068', 'cp1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-30 14:18:18');
INSERT INTO `sys_logininfor` VALUES ('1069', 'cp1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-30 14:20:34');
INSERT INTO `sys_logininfor` VALUES ('1070', 'cp1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-10-30 14:22:45');
INSERT INTO `sys_logininfor` VALUES ('1071', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-11-12 11:32:11');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) COLLATE utf8_croatian_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) DEFAULT '0' COMMENT '父菜单ID',
  `order_num` int(4) DEFAULT '0' COMMENT '显示顺序',
  `url` varchar(200) COLLATE utf8_croatian_ci DEFAULT '#' COMMENT '请求地址',
  `target` varchar(20) COLLATE utf8_croatian_ci DEFAULT '' COMMENT '打开方式（menuItem页签 menuBlank新窗口）',
  `menu_type` char(1) COLLATE utf8_croatian_ci DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) COLLATE utf8_croatian_ci DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `perms` varchar(100) COLLATE utf8_croatian_ci DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) COLLATE utf8_croatian_ci DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) COLLATE utf8_croatian_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_croatian_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8_croatian_ci DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2045 DEFAULT CHARSET=utf8 COLLATE=utf8_croatian_ci COMMENT='菜单权限表';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', '系统管理', '0', '1', '#', '', 'M', '0', '', 'fa fa-gear', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统管理目录');
INSERT INTO `sys_menu` VALUES ('2', '系统监控', '0', '2', '#', '', 'M', '0', '', 'fa fa-video-camera', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统监控目录');
INSERT INTO `sys_menu` VALUES ('3', '系统工具', '0', '3', '#', '', 'M', '0', '', 'fa fa-bars', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统工具目录');
INSERT INTO `sys_menu` VALUES ('100', '用户管理', '1', '1', '/system/user', '', 'C', '0', 'system:user:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '用户管理菜单');
INSERT INTO `sys_menu` VALUES ('101', '角色管理', '1', '2', '/system/role', '', 'C', '0', 'system:role:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '角色管理菜单');
INSERT INTO `sys_menu` VALUES ('102', '菜单管理', '1', '3', '/system/menu', '', 'C', '0', 'system:menu:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '菜单管理菜单');
INSERT INTO `sys_menu` VALUES ('103', '盘口管理', '1', '4', '/system/dept', 'menuItem', 'C', '0', 'system:dept:view', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2019-09-20 14:50:38', '部门管理菜单');
INSERT INTO `sys_menu` VALUES ('104', '岗位管理', '1', '5', '/system/post', '', 'C', '0', 'system:post:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '岗位管理菜单');
INSERT INTO `sys_menu` VALUES ('105', '字典管理', '1', '6', '/system/dict', '', 'C', '0', 'system:dict:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '字典管理菜单');
INSERT INTO `sys_menu` VALUES ('106', '参数设置', '1', '7', '/system/config', '', 'C', '0', 'system:config:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '参数设置菜单');
INSERT INTO `sys_menu` VALUES ('107', '通知公告', '1', '8', '/system/notice', '', 'C', '0', 'system:notice:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知公告菜单');
INSERT INTO `sys_menu` VALUES ('108', '日志管理', '1', '9', '#', '', 'M', '0', '', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '日志管理菜单');
INSERT INTO `sys_menu` VALUES ('109', '在线用户', '2', '1', '/monitor/online', '', 'C', '0', 'monitor:online:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '在线用户菜单');
INSERT INTO `sys_menu` VALUES ('110', '定时任务', '2', '2', '/monitor/job', '', 'C', '0', 'monitor:job:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '定时任务菜单');
INSERT INTO `sys_menu` VALUES ('111', '数据监控', '2', '3', '/monitor/data', '', 'C', '0', 'monitor:data:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '数据监控菜单');
INSERT INTO `sys_menu` VALUES ('112', '服务监控', '2', '3', '/monitor/server', '', 'C', '0', 'monitor:server:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '服务监控菜单');
INSERT INTO `sys_menu` VALUES ('113', '表单构建', '3', '1', '/tool/build', '', 'C', '0', 'tool:build:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '表单构建菜单');
INSERT INTO `sys_menu` VALUES ('114', '代码生成', '3', '2', '/tool/gen', '', 'C', '0', 'tool:gen:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '代码生成菜单');
INSERT INTO `sys_menu` VALUES ('115', '系统接口', '3', '3', '/tool/swagger', '', 'C', '0', 'tool:swagger:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统接口菜单');
INSERT INTO `sys_menu` VALUES ('500', '操作日志', '108', '1', '/monitor/operlog', '', 'C', '0', 'monitor:operlog:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '操作日志菜单');
INSERT INTO `sys_menu` VALUES ('501', '登录日志', '108', '2', '/monitor/logininfor', '', 'C', '0', 'monitor:logininfor:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '登录日志菜单');
INSERT INTO `sys_menu` VALUES ('1000', '用户查询', '100', '1', '#', '', 'F', '0', 'system:user:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1001', '用户新增', '100', '2', '#', '', 'F', '0', 'system:user:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1002', '用户修改', '100', '3', '#', '', 'F', '0', 'system:user:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1003', '用户删除', '100', '4', '#', '', 'F', '0', 'system:user:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1004', '用户导出', '100', '5', '#', '', 'F', '0', 'system:user:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1005', '用户导入', '100', '6', '#', '', 'F', '0', 'system:user:import', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1006', '重置密码', '100', '7', '#', '', 'F', '0', 'system:user:resetPwd', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1007', '角色查询', '101', '1', '#', '', 'F', '0', 'system:role:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1008', '角色新增', '101', '2', '#', '', 'F', '0', 'system:role:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1009', '角色修改', '101', '3', '#', '', 'F', '0', 'system:role:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1010', '角色删除', '101', '4', '#', '', 'F', '0', 'system:role:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1011', '角色导出', '101', '5', '#', '', 'F', '0', 'system:role:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1012', '菜单查询', '102', '1', '#', '', 'F', '0', 'system:menu:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1013', '菜单新增', '102', '2', '#', '', 'F', '0', 'system:menu:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1014', '菜单修改', '102', '3', '#', '', 'F', '0', 'system:menu:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1015', '菜单删除', '102', '4', '#', '', 'F', '0', 'system:menu:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1016', '盘口查询', '103', '1', '#', 'menuItem', 'F', '0', 'system:dept:list', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2019-09-20 14:51:46', '');
INSERT INTO `sys_menu` VALUES ('1017', '盘口新增', '103', '2', '#', 'menuItem', 'F', '0', 'system:dept:add', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2019-09-20 14:52:12', '');
INSERT INTO `sys_menu` VALUES ('1018', '盘口修改', '103', '3', '#', 'menuItem', 'F', '0', 'system:dept:edit', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2019-09-20 14:52:25', '');
INSERT INTO `sys_menu` VALUES ('1019', '盘口删除', '103', '4', '#', 'menuItem', 'F', '0', 'system:dept:remove', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2019-09-20 14:52:36', '');
INSERT INTO `sys_menu` VALUES ('1020', '岗位查询', '104', '1', '#', '', 'F', '0', 'system:post:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1021', '岗位新增', '104', '2', '#', '', 'F', '0', 'system:post:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1022', '岗位修改', '104', '3', '#', '', 'F', '0', 'system:post:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1023', '岗位删除', '104', '4', '#', '', 'F', '0', 'system:post:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1024', '岗位导出', '104', '5', '#', '', 'F', '0', 'system:post:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1025', '字典查询', '105', '1', '#', '', 'F', '0', 'system:dict:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1026', '字典新增', '105', '2', '#', '', 'F', '0', 'system:dict:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1027', '字典修改', '105', '3', '#', '', 'F', '0', 'system:dict:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1028', '字典删除', '105', '4', '#', '', 'F', '0', 'system:dict:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1029', '字典导出', '105', '5', '#', '', 'F', '0', 'system:dict:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1030', '参数查询', '106', '1', '#', '', 'F', '0', 'system:config:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1031', '参数新增', '106', '2', '#', '', 'F', '0', 'system:config:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1032', '参数修改', '106', '3', '#', '', 'F', '0', 'system:config:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1033', '参数删除', '106', '4', '#', '', 'F', '0', 'system:config:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1034', '参数导出', '106', '5', '#', '', 'F', '0', 'system:config:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1035', '公告查询', '107', '1', '#', '', 'F', '0', 'system:notice:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1036', '公告新增', '107', '2', '#', '', 'F', '0', 'system:notice:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1037', '公告修改', '107', '3', '#', '', 'F', '0', 'system:notice:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1038', '公告删除', '107', '4', '#', '', 'F', '0', 'system:notice:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1039', '操作查询', '500', '1', '#', '', 'F', '0', 'monitor:operlog:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1040', '操作删除', '500', '2', '#', '', 'F', '0', 'monitor:operlog:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1041', '详细信息', '500', '3', '#', '', 'F', '0', 'monitor:operlog:detail', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1042', '日志导出', '500', '4', '#', '', 'F', '0', 'monitor:operlog:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1043', '登录查询', '501', '1', '#', '', 'F', '0', 'monitor:logininfor:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1044', '登录删除', '501', '2', '#', '', 'F', '0', 'monitor:logininfor:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1045', '日志导出', '501', '3', '#', '', 'F', '0', 'monitor:logininfor:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1046', '在线查询', '109', '1', '#', '', 'F', '0', 'monitor:online:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1047', '批量强退', '109', '2', '#', '', 'F', '0', 'monitor:online:batchForceLogout', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1048', '单条强退', '109', '3', '#', '', 'F', '0', 'monitor:online:forceLogout', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1049', '任务查询', '110', '1', '#', '', 'F', '0', 'monitor:job:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1050', '任务新增', '110', '2', '#', '', 'F', '0', 'monitor:job:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1051', '任务修改', '110', '3', '#', '', 'F', '0', 'monitor:job:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1052', '任务删除', '110', '4', '#', '', 'F', '0', 'monitor:job:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1053', '状态修改', '110', '5', '#', '', 'F', '0', 'monitor:job:changeStatus', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1054', '任务详细', '110', '6', '#', '', 'F', '0', 'monitor:job:detail', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1055', '任务导出', '110', '7', '#', '', 'F', '0', 'monitor:job:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1056', '生成查询', '114', '1', '#', '', 'F', '0', 'tool:gen:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1057', '生成修改', '114', '2', '#', '', 'F', '0', 'tool:gen:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1058', '生成删除', '114', '3', '#', '', 'F', '0', 'tool:gen:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1059', '预览代码', '114', '4', '#', '', 'F', '0', 'tool:gen:preview', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1060', '生成代码', '114', '5', '#', '', 'F', '0', 'tool:gen:code', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('2001', '上班系统', '0', '5', '#', 'menuItem', 'M', '0', null, 'fa fa-fax', 'rjg', '2019-09-23 21:55:54', '', null, '');
INSERT INTO `sys_menu` VALUES ('2002', '开始上班', '2001', '1', '/goDie', 'menuBlank', 'C', '0', null, '#', 'admin', '2019-09-23 21:58:25', '', null, '');
INSERT INTO `sys_menu` VALUES ('2003', '兑换设置', '1', '10', '/toConfigure/bConf', 'menuItem', 'C', '0', 'toConfigure:bConf:view', '#', 'admin', '2019-10-08 16:06:06', '', null, '');
INSERT INTO `sys_menu` VALUES ('2004', '客服汇率', '1', '11', '/toConfigure/bExchangeRate', 'menuItem', 'C', '0', 'toConfigure:bExchangeRate:view', '#', 'admin', '2019-10-08 16:07:57', '', null, '');
INSERT INTO `sys_menu` VALUES ('2005', '查询', '2003', '1', '#', 'menuItem', 'F', '0', 'toConfigure:bConf:list', '#', 'admin', '2019-10-08 16:10:50', '', null, '');
INSERT INTO `sys_menu` VALUES ('2006', '新增', '2003', '2', '#', 'menuItem', 'F', '0', 'toConfigure:bConf:add', '#', 'admin', '2019-10-08 16:11:14', '', null, '');
INSERT INTO `sys_menu` VALUES ('2007', '编辑', '2003', '3', '#', 'menuItem', 'F', '0', 'toConfigure:bConf:edit', '#', 'admin', '2019-10-08 16:11:43', '', null, '');
INSERT INTO `sys_menu` VALUES ('2008', '删除', '2003', '4', '#', 'menuItem', 'F', '0', 'toConfigure:bConf:remove', '#', 'admin', '2019-10-08 16:12:20', '', null, '');
INSERT INTO `sys_menu` VALUES ('2009', '查询', '2004', '1', '#', 'menuItem', 'F', '0', 'toConfigure:bExchangeRate:list', '#', 'admin', '2019-10-08 16:13:05', '', null, '');
INSERT INTO `sys_menu` VALUES ('2010', '新增', '2004', '2', '#', 'menuItem', 'F', '0', 'toConfigure:bExchangeRate:add', '#', 'admin', '2019-10-08 16:13:24', '', null, '');
INSERT INTO `sys_menu` VALUES ('2011', '编辑', '2004', '3', '#', 'menuItem', 'F', '0', 'toConfigure:bExchangeRate:edit', '#', 'admin', '2019-10-08 16:13:43', '', null, '');
INSERT INTO `sys_menu` VALUES ('2012', '删除', '2004', '4', '#', 'menuItem', 'F', '0', 'toConfigure:bExchangeRate:remove', '#', 'admin', '2019-10-08 16:14:01', '', null, '');
INSERT INTO `sys_menu` VALUES ('2013', '订单管理', '0', '4', '#', 'menuItem', 'M', '0', '', 'fa fa-cart-plus', 'admin', '2019-10-09 10:28:46', 'admin', '2019-10-09 10:28:58', '');
INSERT INTO `sys_menu` VALUES ('2014', '充值订单管理', '2013', '1', '/order/bRechargeOrder', 'menuItem', 'C', '0', 'order:bRechargeOrder:view', '#', 'admin', '2019-10-09 10:31:19', '', null, '');
INSERT INTO `sys_menu` VALUES ('2015', '提现订单管理', '2013', '2', '/order/bCashOrder', 'menuItem', 'C', '0', 'order:bCashOrder:view', '#', 'admin', '2019-10-09 18:08:49', '', null, '');
INSERT INTO `sys_menu` VALUES ('2017', '提款申请', '0', '6', '#', 'menuItem', 'M', '0', null, 'fa fa-fire-extinguisher', 'admin', '2019-10-10 15:16:17', '', null, '');
INSERT INTO `sys_menu` VALUES ('2018', '申请提款', '2017', '1', '/order/bCashOrderApply', 'menuItem', 'C', '0', 'order:bCashOrderApply:view', '#', 'admin', '2019-10-10 15:19:20', '', null, '');
INSERT INTO `sys_menu` VALUES ('2019', '查询', '2014', '1', '#', 'menuItem', 'F', '0', 'order:bRechargeOrder:list', '#', 'admin', '2019-10-10 15:20:22', '', null, '');
INSERT INTO `sys_menu` VALUES ('2020', '添加', '2014', '2', '#', 'menuItem', 'F', '0', 'order:bRechargeOrder:add', '#', 'admin', '2019-10-10 15:26:24', '', null, '');
INSERT INTO `sys_menu` VALUES ('2021', '修改 （状态改变）', '2014', '3', '#', 'menuItem', 'F', '0', 'order:bRechargeOrder:edit', '#', 'admin', '2019-10-10 15:27:22', '', null, '');
INSERT INTO `sys_menu` VALUES ('2022', '删除', '2014', '4', '#', 'menuItem', 'F', '0', 'order:bRechargeOrder:remove', '#', 'admin', '2019-10-10 15:27:55', '', null, '');
INSERT INTO `sys_menu` VALUES ('2023', '添加', '2018', '1', '#', 'menuItem', 'F', '0', 'order:bCashOrderApply:add', '#', 'admin', '2019-10-10 18:01:14', '', null, '');
INSERT INTO `sys_menu` VALUES ('2024', '客服管理', '0', '7', '#', 'menuItem', 'M', '0', null, 'fa fa-user-circle-o', 'admin', '2019-10-10 20:12:15', '', null, '');
INSERT INTO `sys_menu` VALUES ('2025', '客服列表', '2024', '1', '/kf/bCustomerAccount', 'menuItem', 'C', '0', 'kf:bCustomerAccount:view', '#', 'admin', '2019-10-10 20:15:46', '', null, '');
INSERT INTO `sys_menu` VALUES ('2026', '查询', '2025', '1', '#', 'menuItem', 'F', '0', 'kf:bCustomerAccount:list', '#', 'admin', '2019-10-11 16:06:32', '', null, '');
INSERT INTO `sys_menu` VALUES ('2027', '保存', '2025', '2', '#', 'menuItem', 'F', '0', 'kf:bCustomerAccount:add', '#', 'admin', '2019-10-11 16:07:09', '', null, '');
INSERT INTO `sys_menu` VALUES ('2028', '修改', '2025', '3', '#', 'menuItem', 'F', '0', 'kf:bCustomerAccount:edit', '#', 'admin', '2019-10-11 16:07:37', '', null, '');
INSERT INTO `sys_menu` VALUES ('2029', '删除', '2025', '4', '#', 'menuItem', 'F', '0', 'kf:bCustomerAccount:remove', '#', 'admin', '2019-10-11 16:08:07', '', null, '');
INSERT INTO `sys_menu` VALUES ('2030', '客服详情查询', '2025', '5', '#', 'menuItem', 'F', '0', 'kf:bAccountLog:view', '#', 'admin', '2019-10-12 15:15:17', '', null, '');
INSERT INTO `sys_menu` VALUES ('2031', '客服详情列表', '2025', '6', '#', 'menuItem', 'F', '0', 'kf:bAccountLog:list', '#', 'admin', '2019-10-12 15:15:52', '', null, '');
INSERT INTO `sys_menu` VALUES ('2032', '编辑（取消申请）', '2018', '2', '#', 'menuItem', 'F', '0', 'order:bCashOrderApply:edit', '#', 'admin', '2019-10-12 17:36:21', 'admin', '2019-10-12 17:36:46', '');
INSERT INTO `sys_menu` VALUES ('2033', '查询', '2018', '3', '#', 'menuItem', 'F', '0', 'order:bCashOrderApply:list', '#', 'admin', '2019-10-14 16:23:31', '', null, '');
INSERT INTO `sys_menu` VALUES ('2034', '添加', '2015', '1', '#', 'menuItem', 'F', '0', 'order:bCashOrder:add', '#', 'admin', '2019-10-14 16:27:08', 'admin', '2019-10-15 15:57:56', '');
INSERT INTO `sys_menu` VALUES ('2035', '查询', '2015', '2', '#', 'menuItem', 'F', '0', 'order:bCashOrder:list', '#', 'admin', '2019-10-14 16:27:35', 'admin', '2019-10-15 16:08:03', '');
INSERT INTO `sys_menu` VALUES ('2036', '修改', '2015', '3', '#', 'menuItem', 'F', '0', 'order:bCashOrder:edit', '#', 'admin', '2019-10-14 16:28:06', 'admin', '2019-10-15 15:58:17', '');
INSERT INTO `sys_menu` VALUES ('2037', '删除', '2015', '4', '#', 'menuItem', 'F', '0', 'order:bCashOrder:remove', '#', 'admin', '2019-10-14 16:28:32', 'admin', '2019-10-15 15:58:28', '');
INSERT INTO `sys_menu` VALUES ('2039', '账变管理', '2025', '7', '#', 'menuItem', 'F', '0', 'kf:bAccountLog:add', '#', 'admin', '2019-10-16 14:32:16', '', null, '');
INSERT INTO `sys_menu` VALUES ('2041', '财务管理', '0', '4', '#', 'menuItem', 'M', '0', null, 'fa fa-calculator', 'admin', '2019-10-16 15:27:01', '', null, '');
INSERT INTO `sys_menu` VALUES ('2042', '财务管理', '2041', '1', '/financial/dish', 'menuItem', 'C', '0', 'financial:dish:view', '#', 'admin', '2019-10-16 15:27:43', 'admin', '2019-10-16 15:27:56', '');
INSERT INTO `sys_menu` VALUES ('2043', '盘口财务查询', '2042', '1', '#', 'menuItem', 'F', '0', 'financial:dish:list', '#', 'admin', '2019-10-16 15:31:33', 'admin', '2019-10-21 14:25:41', '');
INSERT INTO `sys_menu` VALUES ('2044', '客服财务查询', '2042', '2', '#', 'menuItem', 'F', '0', 'financial:dish:detailList', '#', 'admin', '2019-10-21 14:25:25', '', null, '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice` (
  `notice_id` int(4) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) COLLATE utf8_croatian_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) COLLATE utf8_croatian_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` varchar(2000) COLLATE utf8_croatian_ci DEFAULT NULL COMMENT '公告内容',
  `status` char(1) COLLATE utf8_croatian_ci DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) COLLATE utf8_croatian_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_croatian_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) COLLATE utf8_croatian_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_croatian_ci COMMENT='通知公告表';

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES ('1', '温馨提醒：2018-07-01 若依新版本发布啦', '2', '新版本内容', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '管理员');
INSERT INTO `sys_notice` VALUES ('2', '维护通知：2018-07-01 若依系统凌晨维护', '1', '维护内容', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log` (
  `oper_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) COLLATE utf8_croatian_ci DEFAULT '' COMMENT '模块标题',
  `business_type` int(2) DEFAULT '0' COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) COLLATE utf8_croatian_ci DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) COLLATE utf8_croatian_ci DEFAULT '' COMMENT '请求方式',
  `operator_type` int(1) DEFAULT '0' COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) COLLATE utf8_croatian_ci DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) COLLATE utf8_croatian_ci DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) COLLATE utf8_croatian_ci DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(50) COLLATE utf8_croatian_ci DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) COLLATE utf8_croatian_ci DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) COLLATE utf8_croatian_ci DEFAULT '' COMMENT '请求参数',
  `status` int(1) DEFAULT '0' COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) COLLATE utf8_croatian_ci DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`)
) ENGINE=InnoDB AUTO_INCREMENT=510 DEFAULT CHARSET=utf8 COLLATE=utf8_croatian_ci COMMENT='操作日志记录';

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES ('100', '部门管理', '2', 'com.management.project.controller.system.dept.DeptController.editSave()', '', '1', 'admin', '研发部门', '/system/dept/edit', '127.0.0.1', '内网IP', '{\"deptId\":[\"100\"],\"parentId\":[\"0\"],\"parentName\":[\"无\"],\"deptName\":[\"银商系统\"],\"orderNum\":[\"0\"],\"leader\":[\"某些人\"],\"phone\":[\"15888888888\"],\"email\":[\"ry@qq.com\"],\"status\":[\"0\"]}', '0', null, '2019-09-17 11:34:06');
INSERT INTO `sys_oper_log` VALUES ('101', '部门管理', '2', 'com.management.project.controller.system.dept.DeptController.editSave()', '', '1', 'admin', '研发部门', '/system/dept/edit', '127.0.0.1', '内网IP', '{\"deptId\":[\"101\"],\"parentId\":[\"100\"],\"parentName\":[\"银商系统\"],\"deptName\":[\"银商管理中心\"],\"orderNum\":[\"1\"],\"leader\":[\"某些人\"],\"phone\":[\"15888888888\"],\"email\":[\"ry@qq.com\"],\"status\":[\"0\"]}', '0', null, '2019-09-17 11:35:08');
INSERT INTO `sys_oper_log` VALUES ('102', '部门管理', '2', 'com.management.project.controller.system.dept.DeptController.editSave()', '', '1', 'admin', '研发部门', '/system/dept/edit', '127.0.0.1', '内网IP', '{\"deptId\":[\"102\"],\"parentId\":[\"100\"],\"parentName\":[\"银商系统\"],\"deptName\":[\"奖多多盘口\"],\"orderNum\":[\"2\"],\"leader\":[\"某些人\"],\"phone\":[\"15888888888\"],\"email\":[\"ry@qq.com\"],\"status\":[\"0\"]}', '0', null, '2019-09-17 11:35:34');
INSERT INTO `sys_oper_log` VALUES ('103', '部门管理', '3', 'com.management.project.controller.system.dept.DeptController.remove()', '', '1', 'admin', '银商管理中心', '/system/dept/remove/103', '127.0.0.1', '内网IP', '{}', '0', null, '2019-09-20 14:45:45');
INSERT INTO `sys_oper_log` VALUES ('104', '部门管理', '3', 'com.management.project.controller.system.dept.DeptController.remove()', '', '1', 'admin', '银商管理中心', '/system/dept/remove/104', '127.0.0.1', '内网IP', '{}', '0', null, '2019-09-20 14:45:48');
INSERT INTO `sys_oper_log` VALUES ('105', '部门管理', '3', 'com.management.project.controller.system.dept.DeptController.remove()', '', '1', 'admin', '银商管理中心', '/system/dept/remove/105', '127.0.0.1', '内网IP', '{}', '0', null, '2019-09-20 14:45:52');
INSERT INTO `sys_oper_log` VALUES ('106', '部门管理', '3', 'com.management.project.controller.system.dept.DeptController.remove()', '', '1', 'admin', '银商管理中心', '/system/dept/remove/106', '127.0.0.1', '内网IP', '{}', '0', null, '2019-09-20 14:45:56');
INSERT INTO `sys_oper_log` VALUES ('107', '部门管理', '3', 'com.management.project.controller.system.dept.DeptController.remove()', '', '1', 'admin', '银商管理中心', '/system/dept/remove/107', '127.0.0.1', '内网IP', '{}', '0', null, '2019-09-20 14:46:00');
INSERT INTO `sys_oper_log` VALUES ('108', '菜单管理', '2', 'com.management.project.controller.system.menu.MenuController.editSave()', '', '1', 'admin', '银商管理中心', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"103\"],\"parentId\":[\"1\"],\"menuType\":[\"C\"],\"menuName\":[\"盘口管理\"],\"url\":[\"/system/dept\"],\"target\":[\"menuItem\"],\"perms\":[\"system:dept:view\"],\"orderNum\":[\"4\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '0', null, '2019-09-20 14:50:38');
INSERT INTO `sys_oper_log` VALUES ('109', '菜单管理', '2', 'com.management.project.controller.system.menu.MenuController.editSave()', '', '1', 'admin', '银商管理中心', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1016\"],\"parentId\":[\"103\"],\"menuType\":[\"F\"],\"menuName\":[\"盘口查询\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"system:dept:list\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '0', null, '2019-09-20 14:51:46');
INSERT INTO `sys_oper_log` VALUES ('110', '菜单管理', '2', 'com.management.project.controller.system.menu.MenuController.editSave()', '', '1', 'admin', '银商管理中心', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1017\"],\"parentId\":[\"103\"],\"menuType\":[\"F\"],\"menuName\":[\"盘口新增\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"system:dept:add\"],\"orderNum\":[\"2\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '0', null, '2019-09-20 14:52:12');
INSERT INTO `sys_oper_log` VALUES ('111', '菜单管理', '2', 'com.management.project.controller.system.menu.MenuController.editSave()', '', '1', 'admin', '银商管理中心', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1018\"],\"parentId\":[\"103\"],\"menuType\":[\"F\"],\"menuName\":[\"盘口修改\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"system:dept:edit\"],\"orderNum\":[\"3\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '0', null, '2019-09-20 14:52:25');
INSERT INTO `sys_oper_log` VALUES ('112', '菜单管理', '2', 'com.management.project.controller.system.menu.MenuController.editSave()', '', '1', 'admin', '银商管理中心', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1019\"],\"parentId\":[\"103\"],\"menuType\":[\"F\"],\"menuName\":[\"盘口删除\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"system:dept:remove\"],\"orderNum\":[\"4\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '0', null, '2019-09-20 14:52:37');
INSERT INTO `sys_oper_log` VALUES ('113', '部门管理', '3', 'com.management.project.controller.system.dept.DeptController.remove()', '', '1', 'admin', '银商管理中心', '/system/dept/remove/108', '127.0.0.1', '内网IP', '{}', '0', null, '2019-09-20 15:05:30');
INSERT INTO `sys_oper_log` VALUES ('114', '部门管理', '3', 'com.management.project.controller.system.dept.DeptController.remove()', '', '1', 'admin', '银商管理中心', '/system/dept/remove/109', '127.0.0.1', '内网IP', '{}', '0', null, '2019-09-20 15:05:33');
INSERT INTO `sys_oper_log` VALUES ('115', '部门管理', '1', 'com.management.project.controller.system.dept.DeptController.addSave()', '', '1', 'admin', '银商管理中心', '/system/dept/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"100\"],\"deptName\":[\"vpn盘口\"],\"orderNum\":[\"3\"],\"leader\":[\"某人\"],\"phone\":[\"18888888888\"],\"email\":[\"\"],\"status\":[\"0\"]}', '0', null, '2019-09-20 15:06:17');
INSERT INTO `sys_oper_log` VALUES ('116', '盘口管理', '2', 'com.management.project.controller.system.dept.DeptController.editSave()', '', '1', 'admin', '银商管理中心', '/system/dept/edit', '127.0.0.1', '内网IP', '{\"deptId\":[\"101\"],\"parentId\":[\"100\"],\"parentName\":[\"银商系统\"],\"deptName\":[\"银商管理中心\"],\"orderNum\":[\"1\"],\"leader\":[\"某些人\"],\"phone\":[\"15888888888\"],\"email\":[\"ry@qq.com\"],\"status\":[\"1\"]}', '0', null, '2019-09-20 15:32:13');
INSERT INTO `sys_oper_log` VALUES ('117', '盘口管理', '2', 'com.management.project.controller.system.dept.DeptController.editSave()', '', '1', 'admin', '银商管理中心', '/system/dept/edit', '127.0.0.1', '内网IP', '{\"deptId\":[\"101\"],\"parentId\":[\"100\"],\"parentName\":[\"银商系统\"],\"deptName\":[\"银商管理中心\"],\"orderNum\":[\"1\"],\"leader\":[\"某些人\"],\"phone\":[\"15888888888\"],\"email\":[\"ry@qq.com\"],\"status\":[\"0\"]}', '0', null, '2019-09-20 15:32:35');
INSERT INTO `sys_oper_log` VALUES ('118', '用户管理', '2', 'com.management.project.controller.system.user.UserController.changeStatus()', '', '1', 'admin', '银商管理中心', '/system/user/changeStatus', '127.0.0.1', '内网IP', '{\"userId\":[\"2\"],\"status\":[\"1\"]}', '0', null, '2019-09-21 18:27:38');
INSERT INTO `sys_oper_log` VALUES ('119', '用户管理', '2', 'com.management.project.controller.system.user.UserController.changeStatus()', '', '1', 'admin', '银商管理中心', '/system/user/changeStatus', '127.0.0.1', '内网IP', '{\"userId\":[\"2\"],\"status\":[\"0\"]}', '0', null, '2019-09-21 18:27:42');
INSERT INTO `sys_oper_log` VALUES ('120', '用户管理', '2', 'com.management.project.controller.system.user.UserController.changeStatus()', '', '1', 'admin', '银商管理中心', '/system/user/changeStatus', '127.0.0.1', '内网IP', '{\"userId\":[\"2\"],\"status\":[\"1\"]}', '0', null, '2019-09-21 18:27:48');
INSERT INTO `sys_oper_log` VALUES ('121', '用户管理', '2', 'com.management.project.controller.system.user.UserController.changeStatus()', '', '1', 'admin', '银商管理中心', '/system/user/changeStatus', '127.0.0.1', '内网IP', '{\"userId\":[\"2\"],\"status\":[\"0\"]}', '0', null, '2019-09-21 18:28:10');
INSERT INTO `sys_oper_log` VALUES ('122', '岗位管理', '2', 'com.management.project.controller.system.post.PostController.editSave()', '', '1', 'admin', '银商管理中心', '/system/post/edit', '127.0.0.1', '内网IP', '{\"postId\":[\"4\"],\"postName\":[\"系统用户\"],\"postCode\":[\"user\"],\"postSort\":[\"4\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '0', null, '2019-09-21 18:31:33');
INSERT INTO `sys_oper_log` VALUES ('123', '岗位管理', '2', 'com.management.project.controller.system.post.PostController.editSave()', '', '1', 'admin', '银商管理中心', '/system/post/edit', '127.0.0.1', '内网IP', '{\"postId\":[\"3\"],\"postName\":[\"盘口用户\"],\"postCode\":[\"pankou\"],\"postSort\":[\"3\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '0', null, '2019-09-21 18:31:56');
INSERT INTO `sys_oper_log` VALUES ('124', '岗位管理', '2', 'com.management.project.controller.system.post.PostController.editSave()', '', '1', 'admin', '银商管理中心', '/system/post/edit', '127.0.0.1', '内网IP', '{\"postId\":[\"2\"],\"postName\":[\"盘口代理\"],\"postCode\":[\"daili\"],\"postSort\":[\"2\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '0', null, '2019-09-21 18:32:09');
INSERT INTO `sys_oper_log` VALUES ('125', '岗位管理', '2', 'com.management.project.controller.system.post.PostController.editSave()', '', '1', 'admin', '银商管理中心', '/system/post/edit', '127.0.0.1', '内网IP', '{\"postId\":[\"1\"],\"postName\":[\"客服\"],\"postCode\":[\"kefu\"],\"postSort\":[\"1\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '0', null, '2019-09-21 18:32:23');
INSERT INTO `sys_oper_log` VALUES ('126', '字典类型', '1', 'com.management.project.controller.system.dict.DictTypeController.addSave()', '', '1', 'admin', '银商管理中心', '/system/dict/add', '127.0.0.1', '内网IP', '{\"dictName\":[\"用户类型\"],\"dictType\":[\"sys_user_level\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '0', null, '2019-09-21 18:39:43');
INSERT INTO `sys_oper_log` VALUES ('127', '字典类型', '2', 'com.management.project.controller.system.dict.DictTypeController.editSave()', '', '1', 'admin', '银商管理中心', '/system/dict/edit', '127.0.0.1', '内网IP', '{\"dictId\":[\"100\"],\"dictName\":[\"用户类型\"],\"dictType\":[\"sys_user_level\"],\"status\":[\"0\"],\"remark\":[\"用户等级\"]}', '0', null, '2019-09-21 18:40:17');
INSERT INTO `sys_oper_log` VALUES ('128', '用户管理', '1', 'com.management.project.controller.system.user.UserController.addSave()', '', '1', 'admin', '银商管理中心', '/system/user/add', '127.0.0.1', '内网IP', '{\"deptId\":[\"101\"],\"userName\":[\"rjg\"],\"deptName\":[\"银商管理中心\"],\"phonenumber\":[\"18810595122\"],\"email\":[\"123@163.com\"],\"loginName\":[\"rjg\"],\"password\":[\"123456\"],\"sex\":[\"0\"],\"level\":[\"0\"],\"role\":[\"1\"],\"remark\":[\"\"],\"status\":[\"0\"],\"roleIds\":[\"1\"],\"postIds\":[\"\"]}', '0', null, '2019-09-23 18:01:27');
INSERT INTO `sys_oper_log` VALUES ('129', '角色管理', '2', 'com.management.project.controller.system.role.RoleController.editSave()', '', '1', 'admin', '银商管理中心', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"1\"],\"roleName\":[\"管理员\"],\"roleKey\":[\"admin\"],\"roleSort\":[\"1\"],\"status\":[\"0\"],\"remark\":[\"管理员\"],\"menuIds\":[\"1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,1042,501,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,1055,111,112,3,113,114,1056,1057,1058,1059,1060,115\"]}', '0', null, '2019-09-23 18:04:06');
INSERT INTO `sys_oper_log` VALUES ('130', '角色管理', '2', 'com.management.project.controller.system.role.RoleController.editSave()', '', '1', 'admin', '银商管理中心', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"1\"],\"roleName\":[\"管理员\"],\"roleKey\":[\"admin\"],\"roleSort\":[\"1\"],\"status\":[\"0\"],\"remark\":[\"管理员\"],\"menuIds\":[\"1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,1042,501,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,1055,111,112,3,113,114,1056,1057,1058,1059,1060,115\"]}', '0', null, '2019-09-23 18:04:12');
INSERT INTO `sys_oper_log` VALUES ('131', '角色管理', '2', 'com.management.project.controller.system.role.RoleController.editSave()', '', '1', 'admin', '银商管理中心', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"1\"],\"roleName\":[\"开发者\"],\"roleKey\":[\"admin\"],\"roleSort\":[\"1\"],\"status\":[\"0\"],\"remark\":[\"管理员\"],\"menuIds\":[\"1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,1042,501,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,1055,111,112,3,113,114,1056,1057,1058,1059,1060,115\"]}', '0', null, '2019-09-23 18:09:07');
INSERT INTO `sys_oper_log` VALUES ('132', '角色管理', '2', 'com.management.project.controller.system.role.RoleController.editSave()', '', '1', 'admin', '银商管理中心', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"1\"],\"roleName\":[\"开发者\"],\"roleKey\":[\"admin\"],\"roleSort\":[\"1\"],\"status\":[\"0\"],\"remark\":[\"开发者角色\"],\"menuIds\":[\"1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,1042,501,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,1055,111,112,3,113,114,1056,1057,1058,1059,1060,115\"]}', '0', null, '2019-09-23 18:09:16');
INSERT INTO `sys_oper_log` VALUES ('133', '角色管理', '2', 'com.management.project.controller.system.role.RoleController.editSave()', '', '1', 'admin', '银商管理中心', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"2\"],\"roleName\":[\"普通角色\"],\"roleKey\":[\"common\"],\"roleSort\":[\"2\"],\"status\":[\"0\"],\"remark\":[\"普通角色\"],\"menuIds\":[\"1,100,1000,1001,1002,1003,1004,1005,1006,103,1016,1017,1018,1019\"]}', '0', null, '2019-09-23 18:12:22');
INSERT INTO `sys_oper_log` VALUES ('134', '角色管理', '2', 'com.management.project.controller.system.role.RoleController.editSave()', '', '1', 'rjg', '银商管理中心', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"2\"],\"roleName\":[\"盘口用户\"],\"roleKey\":[\"common\"],\"roleSort\":[\"2\"],\"status\":[\"0\"],\"remark\":[\"普通角色\"],\"menuIds\":[\"1,100,1000,1001,1002,1003,1004,1005,1006,103,1016,1017,1018,1019\"]}', '0', null, '2019-09-23 21:44:40');
INSERT INTO `sys_oper_log` VALUES ('135', '角色管理', '1', 'com.management.project.controller.system.role.RoleController.addSave()', '', '1', 'rjg', '银商管理中心', '/system/role/add', '127.0.0.1', '内网IP', '{\"roleName\":[\"盘口代理\"],\"roleKey\":[\"agent\"],\"roleSort\":[\"3\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"1,100,1000,1001,1002,1003,1004,1005,1006\"]}', '0', null, '2019-09-23 21:45:51');
INSERT INTO `sys_oper_log` VALUES ('136', '菜单管理', '1', 'com.management.project.controller.system.menu.MenuController.addSave()', '', '1', 'rjg', '银商管理中心', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"0\"],\"menuType\":[\"C\"],\"menuName\":[\"上班系统\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"5\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2019-09-23 21:48:42');
INSERT INTO `sys_oper_log` VALUES ('137', '菜单管理', '1', 'com.management.project.controller.system.menu.MenuController.addSave()', '', '1', 'rjg', '银商管理中心', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"上班系统\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"5\"],\"icon\":[\"fa fa-fax\"],\"visible\":[\"0\"]}', '0', null, '2019-09-23 21:55:54');
INSERT INTO `sys_oper_log` VALUES ('138', '菜单管理', '1', 'com.management.project.controller.system.menu.MenuController.addSave()', '', '1', 'admin', '银商管理中心', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2001\"],\"menuType\":[\"C\"],\"menuName\":[\"开始上班\"],\"url\":[\"/goDie\"],\"target\":[\"menuBlank\"],\"perms\":[\"\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2019-09-23 21:58:26');
INSERT INTO `sys_oper_log` VALUES ('139', '角色管理', '1', 'com.management.project.controller.system.role.RoleController.addSave()', '', '1', 'admin', '银商管理中心', '/system/role/add', '127.0.0.1', '内网IP', '{\"roleName\":[\"客服\"],\"roleKey\":[\"service\"],\"roleSort\":[\"4\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"2001,2002\"]}', '0', null, '2019-09-23 21:59:51');
INSERT INTO `sys_oper_log` VALUES ('140', '字典数据', '1', 'com.management.project.controller.system.dict.DictDataController.addSave()', '', '1', 'admin', '银商管理中心', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"系统用户\"],\"dictValue\":[\"0\"],\"dictType\":[\"sys_user_level\"],\"cssClass\":[\"\"],\"dictSort\":[\"0\"],\"listClass\":[\"\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '0', null, '2019-09-23 22:05:54');
INSERT INTO `sys_oper_log` VALUES ('141', '字典数据', '1', 'com.management.project.controller.system.dict.DictDataController.addSave()', '', '1', 'admin', '银商管理中心', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"盘口管理员\"],\"dictValue\":[\"1\"],\"dictType\":[\"sys_user_level\"],\"cssClass\":[\"\"],\"dictSort\":[\"1\"],\"listClass\":[\"\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '0', null, '2019-09-23 22:06:07');
INSERT INTO `sys_oper_log` VALUES ('142', '字典数据', '1', 'com.management.project.controller.system.dict.DictDataController.addSave()', '', '1', 'admin', '银商管理中心', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"盘口代理\"],\"dictValue\":[\"2\"],\"dictType\":[\"sys_user_level\"],\"cssClass\":[\"\"],\"dictSort\":[\"2\"],\"listClass\":[\"\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '0', null, '2019-09-23 22:06:32');
INSERT INTO `sys_oper_log` VALUES ('143', '字典数据', '1', 'com.management.project.controller.system.dict.DictDataController.addSave()', '', '1', 'admin', '银商管理中心', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"盘口客服\"],\"dictValue\":[\"3\"],\"dictType\":[\"sys_user_level\"],\"cssClass\":[\"\"],\"dictSort\":[\"3\"],\"listClass\":[\"\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '0', null, '2019-09-23 22:06:44');
INSERT INTO `sys_oper_log` VALUES ('144', '角色管理', '2', 'com.management.project.controller.system.role.RoleController.authDataScopeSave()', '', '1', 'admin', '银商管理中心', '/system/role/authDataScope', '127.0.0.1', '内网IP', '{\"roleId\":[\"2\"],\"roleName\":[\"盘口用户\"],\"roleKey\":[\"common\"],\"dataScope\":[\"4\"],\"deptIds\":[\"\"]}', '0', null, '2019-09-23 22:21:04');
INSERT INTO `sys_oper_log` VALUES ('145', '角色管理', '2', 'com.management.project.controller.system.role.RoleController.authDataScopeSave()', '', '1', 'admin', '银商管理中心', '/system/role/authDataScope', '127.0.0.1', '内网IP', '{\"roleId\":[\"100\"],\"roleName\":[\"盘口代理\"],\"roleKey\":[\"agent\"],\"dataScope\":[\"3\"],\"deptIds\":[\"\"]}', '0', null, '2019-09-23 22:21:21');
INSERT INTO `sys_oper_log` VALUES ('146', '角色管理', '2', 'com.management.project.controller.system.role.RoleController.authDataScopeSave()', '', '1', 'admin', '银商管理中心', '/system/role/authDataScope', '127.0.0.1', '内网IP', '{\"roleId\":[\"101\"],\"roleName\":[\"客服\"],\"roleKey\":[\"service\"],\"dataScope\":[\"3\"],\"deptIds\":[\"\"]}', '0', null, '2019-09-23 22:21:31');
INSERT INTO `sys_oper_log` VALUES ('147', '角色管理', '1', 'com.management.project.controller.system.role.RoleController.addSave()', '', '1', 'admin', '银商管理中心', '/system/role/add', '127.0.0.1', '内网IP', '{\"roleName\":[\"平台管理元\"],\"roleKey\":[\"manager\"],\"roleSort\":[\"2\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024\"]}', '0', null, '2019-09-23 22:24:02');
INSERT INTO `sys_oper_log` VALUES ('148', '角色管理', '2', 'com.management.project.controller.system.role.RoleController.editSave()', '', '1', 'admin', '银商管理中心', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"102\"],\"roleName\":[\"平台管理员\"],\"roleKey\":[\"manager\"],\"roleSort\":[\"2\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024\"]}', '0', null, '2019-09-23 22:24:14');
INSERT INTO `sys_oper_log` VALUES ('149', '角色管理', '2', 'com.management.project.controller.system.role.RoleController.authDataScopeSave()', '', '1', 'admin', '银商管理中心', '/system/role/authDataScope', '127.0.0.1', '内网IP', '{\"roleId\":[\"102\"],\"roleName\":[\"平台管理员\"],\"roleKey\":[\"manager\"],\"dataScope\":[\"1\"],\"deptIds\":[\"\"]}', '0', null, '2019-09-23 22:24:18');
INSERT INTO `sys_oper_log` VALUES ('150', '角色管理', '2', 'com.management.project.controller.system.role.RoleController.authDataScopeSave()', '', '1', 'admin', '银商管理中心', '/system/role/authDataScope', '127.0.0.1', '内网IP', '{\"roleId\":[\"102\"],\"roleName\":[\"平台管理员\"],\"roleKey\":[\"manager\"],\"dataScope\":[\"1\"],\"deptIds\":[\"\"]}', '0', null, '2019-09-23 22:24:19');
INSERT INTO `sys_oper_log` VALUES ('151', '角色管理', '2', 'com.management.project.controller.system.role.RoleController.editSave()', '', '1', 'admin', '银商管理中心', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"1\"],\"roleName\":[\"开发者\"],\"roleKey\":[\"admin\"],\"roleSort\":[\"1\"],\"status\":[\"0\"],\"remark\":[\"开发者角色\"],\"menuIds\":[\"1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,1042,501,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,1055,111,112,3,113,114,1056,1057,1058,1059,1060,115,2001,2002\"]}', '0', null, '2019-09-23 22:26:07');
INSERT INTO `sys_oper_log` VALUES ('152', '用户管理', '3', 'com.management.project.controller.system.user.UserController.remove()', '', '1', 'rjg', '银商管理中心', '/system/user/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"2\"]}', '0', null, '2019-09-23 22:26:54');
INSERT INTO `sys_oper_log` VALUES ('153', '角色管理', '2', 'com.management.project.controller.system.role.RoleController.editSave()', '', '1', 'rjg', '银商管理中心', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"102\"],\"roleName\":[\"平台管理员\"],\"roleKey\":[\"manager\"],\"roleSort\":[\"2\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"1,100,1000,1001,1002,1003,1004,1005,1006,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024\"]}', '0', null, '2019-09-23 22:28:26');
INSERT INTO `sys_oper_log` VALUES ('154', '用户管理', '1', 'com.management.project.controller.system.user.UserController.addSave()', '', '1', 'rjg', '银商管理中心', '/system/user/add', '127.0.0.1', '内网IP', '{\"deptId\":[\"102\"],\"userName\":[\"奖多多\"],\"deptName\":[\"奖多多盘口\"],\"phonenumber\":[\"13511111111\"],\"email\":[\"1@1.com\"],\"loginName\":[\"奖多多\"],\"password\":[\"123456\"],\"sex\":[\"0\"],\"level\":[\"1\"],\"role\":[\"2\"],\"remark\":[\"\"],\"status\":[\"0\"],\"roleIds\":[\"2\"],\"postIds\":[\"3\"]}', '0', null, '2019-09-23 22:45:06');
INSERT INTO `sys_oper_log` VALUES ('155', '用户管理', '1', 'com.management.project.controller.system.user.UserController.addSave()', '', '1', 'rjg', '银商管理中心', '/system/user/add', '127.0.0.1', '内网IP', '{\"deptId\":[\"200\"],\"userName\":[\"vpn\"],\"deptName\":[\"vpn盘口\"],\"phonenumber\":[\"18811111111\"],\"email\":[\"2@2.com\"],\"loginName\":[\"vpn01\"],\"password\":[\"123456\"],\"sex\":[\"0\"],\"level\":[\"0\"],\"role\":[\"2\"],\"remark\":[\"\"],\"status\":[\"0\"],\"roleIds\":[\"2\"],\"postIds\":[\"3\"]}', '0', null, '2019-09-23 22:46:06');
INSERT INTO `sys_oper_log` VALUES ('156', '角色管理', '2', 'com.management.project.controller.system.role.RoleController.editSave()', '', '1', 'rjg', '银商管理中心', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"100\"],\"roleName\":[\"盘口代理\"],\"roleKey\":[\"agent\"],\"roleSort\":[\"3\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"1,100,1000,1001,1002,1003,1004,1005,1006\"]}', '0', null, '2019-09-23 22:48:34');
INSERT INTO `sys_oper_log` VALUES ('157', '角色管理', '2', 'com.management.project.controller.system.role.RoleController.editSave()', '', '1', 'rjg', '银商管理中心', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"2\"],\"roleName\":[\"盘口用户\"],\"roleKey\":[\"common\"],\"roleSort\":[\"2\"],\"status\":[\"0\"],\"remark\":[\"普通角色\"],\"menuIds\":[\"1,100,1000,1001,1002,1003,1004,1005,1006\"]}', '0', null, '2019-09-23 22:49:18');
INSERT INTO `sys_oper_log` VALUES ('158', '角色管理', '2', 'com.management.project.controller.system.role.RoleController.editSave()', '', '1', 'rjg', '银商管理中心', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"2\"],\"roleName\":[\"盘口用户\"],\"roleKey\":[\"common\"],\"roleSort\":[\"2\"],\"status\":[\"0\"],\"remark\":[\"普通角色\"],\"menuIds\":[\"1,100,1000,1001,1002,1003,1004,1005,1006\"]}', '0', null, '2019-09-23 22:49:22');
INSERT INTO `sys_oper_log` VALUES ('159', '重置密码', '2', 'com.management.project.controller.system.user.ProfileController.resetPwd()', '', '1', 'rjg', '银商管理中心', '/system/user/profile/resetPwd', '127.0.0.1', '内网IP', '{\"userId\":[\"100\"],\"loginName\":[\"rjg\"],\"oldPassword\":[\"123456\"],\"newPassword\":[\"111111\"],\"confirm\":[\"111111\"]}', '0', null, '2019-09-25 14:15:10');
INSERT INTO `sys_oper_log` VALUES ('160', '重置密码', '2', 'com.management.project.controller.system.user.ProfileController.resetPwd()', '', '1', 'rjg', '银商管理中心', '/system/user/profile/resetPwd', '127.0.0.1', '内网IP', '{\"userId\":[\"100\"],\"loginName\":[\"rjg\"],\"oldPassword\":[\"111111\"],\"newPassword\":[\"123456\"],\"confirm\":[\"123456\"]}', '0', null, '2019-09-25 16:31:04');
INSERT INTO `sys_oper_log` VALUES ('161', '用户管理', '1', 'com.management.project.controller.system.user.UserController.addSave()', '', '1', 'rjg', '银商管理中心', '/system/user/add', '127.0.0.1', '内网IP', '{\"deptId\":[\"102\"],\"userName\":[\"奖多多01\"],\"deptName\":[\"奖多多盘口\"],\"phonenumber\":[\"13511111122\"],\"email\":[\"3@2.com\"],\"loginName\":[\"奖多多01\"],\"password\":[\"123456\"],\"sex\":[\"0\"],\"level\":[\"2\"],\"remark\":[\"\"],\"status\":[\"0\"],\"roleIds\":[\"\"],\"postIds\":[\"2\"]}', '0', null, '2019-09-25 19:35:17');
INSERT INTO `sys_oper_log` VALUES ('162', '角色管理', '4', 'com.management.project.controller.system.role.RoleController.selectAuthUserAll()', '', '1', 'rjg', '银商管理中心', '/system/role/authUser/selectAll', '127.0.0.1', '内网IP', '{\"roleId\":[\"100\"],\"userIds\":[\"103\"]}', '0', null, '2019-09-25 19:35:49');
INSERT INTO `sys_oper_log` VALUES ('163', '用户管理', '1', 'com.management.project.controller.system.user.UserController.addSave()', '', '1', 'rjg', '银商管理中心', '/system/user/add', '127.0.0.1', '内网IP', '{\"deptId\":[\"101\"],\"userName\":[\"gf\"],\"deptName\":[\"银商管理中心\"],\"phonenumber\":[\"13511111113\"],\"email\":[\"3@3.com\"],\"loginName\":[\"gf\"],\"password\":[\"123456\"],\"sex\":[\"0\"],\"role\":[\"1\"],\"level\":[\"0\"],\"parentId\":[\"0\"],\"parentName\":[\"\"],\"remark\":[\"\"],\"status\":[\"0\"],\"roleIds\":[\"\"],\"postIds\":[\"4\"]}', '0', null, '2019-09-26 14:36:12');
INSERT INTO `sys_oper_log` VALUES ('164', '用户管理', '1', 'com.management.project.controller.system.user.UserController.addSave()', '', '1', 'rjg', '银商管理中心', '/system/user/add', '127.0.0.1', '内网IP', '{\"deptId\":[\"101\"],\"userName\":[\"cc\"],\"deptName\":[\"银商管理中心\"],\"phonenumber\":[\"13511111112\"],\"email\":[\"5@1.com\"],\"loginName\":[\"cc\"],\"password\":[\"123456\"],\"sex\":[\"0\"],\"role\":[\"1\"],\"level\":[\"0\"],\"parentId\":[\"0\"],\"parentName\":[\"\"],\"remark\":[\"\"],\"status\":[\"0\"],\"roleIds\":[\"\"],\"postIds\":[\"4\"]}', '0', null, '2019-09-26 14:38:30');
INSERT INTO `sys_oper_log` VALUES ('165', '用户管理', '1', 'com.management.project.controller.system.user.UserController.addSave()', '', '1', 'rjg', '银商管理中心', '/system/user/add', '127.0.0.1', '内网IP', '{\"deptId\":[\"101\"],\"userName\":[\"llj\"],\"deptName\":[\"银商管理中心\"],\"phonenumber\":[\"13511111143\"],\"email\":[\"3@1.com\"],\"loginName\":[\"llj\"],\"password\":[\"123456\"],\"sex\":[\"0\"],\"role\":[\"102\"],\"level\":[\"0\"],\"parentId\":[\"0\",\"0\"],\"parentName\":[\"\"],\"remark\":[\"\"],\"status\":[\"0\"],\"roleIds\":[\"\"],\"postIds\":[\"4\"]}', '0', null, '2019-09-26 14:44:26');
INSERT INTO `sys_oper_log` VALUES ('166', '角色管理', '4', 'com.management.project.controller.system.role.RoleController.selectAuthUserAll()', '', '1', 'rjg', '银商管理中心', '/system/role/authUser/selectAll', '127.0.0.1', '内网IP', '{\"roleId\":[\"1\"],\"userIds\":[\"105,104\"]}', '0', null, '2019-09-26 14:48:36');
INSERT INTO `sys_oper_log` VALUES ('167', '角色管理', '4', 'com.management.project.controller.system.role.RoleController.selectAuthUserAll()', '', '1', 'rjg', '银商管理中心', '/system/role/authUser/selectAll', '127.0.0.1', '内网IP', '{\"roleId\":[\"102\"],\"userIds\":[\"106\"]}', '0', null, '2019-09-26 14:48:45');
INSERT INTO `sys_oper_log` VALUES ('168', '用户管理', '1', 'com.management.project.controller.system.user.UserController.addSave()', '', '1', 'rjg', '银商管理中心', '/system/user/add', '127.0.0.1', '内网IP', '{\"deptId\":[\"101\"],\"userName\":[\"pyd\"],\"deptName\":[\"银商管理中心\"],\"phonenumber\":[\"13511111132\"],\"email\":[\"1@4.com\"],\"loginName\":[\"pyd\"],\"password\":[\"123456\"],\"sex\":[\"0\"],\"role\":[\"102\"],\"level\":[\"0\"],\"parentId\":[\"0\"],\"parentName\":[\"\"],\"remark\":[\"\"],\"status\":[\"0\"],\"roleIds\":[\"102\"],\"postIds\":[\"4\"],\"userParentId\":[\"0\"]}', '0', null, '2019-09-26 14:50:15');
INSERT INTO `sys_oper_log` VALUES ('169', '角色管理', '2', 'com.management.project.controller.system.role.RoleController.authDataScopeSave()', '', '1', 'rjg', '银商管理中心', '/system/role/authDataScope', '127.0.0.1', '内网IP', '{\"roleId\":[\"100\"],\"roleName\":[\"盘口代理\"],\"roleKey\":[\"agent\"],\"dataScope\":[\"1\"],\"deptIds\":[\"\"]}', '0', null, '2019-09-26 17:39:31');
INSERT INTO `sys_oper_log` VALUES ('170', '角色管理', '2', 'com.management.project.controller.system.role.RoleController.authDataScopeSave()', '', '1', 'rjg', '银商管理中心', '/system/role/authDataScope', '127.0.0.1', '内网IP', '{\"roleId\":[\"2\"],\"roleName\":[\"盘口用户\"],\"roleKey\":[\"common\"],\"dataScope\":[\"3\"],\"deptIds\":[\"\"]}', '0', null, '2019-09-26 17:42:13');
INSERT INTO `sys_oper_log` VALUES ('171', '角色管理', '2', 'com.management.project.controller.system.role.RoleController.authDataScopeSave()', '', '1', 'rjg', '银商管理中心', '/system/role/authDataScope', '127.0.0.1', '内网IP', '{\"roleId\":[\"100\"],\"roleName\":[\"盘口代理\"],\"roleKey\":[\"agent\"],\"dataScope\":[\"3\"],\"deptIds\":[\"\"]}', '0', null, '2019-09-26 17:42:22');
INSERT INTO `sys_oper_log` VALUES ('172', '角色管理', '2', 'com.management.project.controller.system.role.RoleController.authDataScopeSave()', '', '1', 'rjg', '银商管理中心', '/system/role/authDataScope', '127.0.0.1', '内网IP', '{\"roleId\":[\"2\"],\"roleName\":[\"盘口用户\"],\"roleKey\":[\"common\"],\"dataScope\":[\"4\"],\"deptIds\":[\"\"]}', '0', null, '2019-09-26 17:42:29');
INSERT INTO `sys_oper_log` VALUES ('173', '角色管理', '2', 'com.management.project.controller.system.role.RoleController.authDataScopeSave()', '', '1', 'rjg', '银商管理中心', '/system/role/authDataScope', '127.0.0.1', '内网IP', '{\"roleId\":[\"100\"],\"roleName\":[\"盘口代理\"],\"roleKey\":[\"agent\"],\"dataScope\":[\"4\"],\"deptIds\":[\"\"]}', '0', null, '2019-09-26 17:42:36');
INSERT INTO `sys_oper_log` VALUES ('174', '角色管理', '4', 'com.management.project.controller.system.role.RoleController.selectAuthUserAll()', '', '1', 'admin', '银商管理中心', '/system/role/authUser/selectAll', '127.0.0.1', '内网IP', '{\"roleId\":[\"1\"],\"userIds\":[\"101\"]}', '0', null, '2019-10-08 11:42:30');
INSERT INTO `sys_oper_log` VALUES ('175', '角色管理', '4', 'com.management.project.controller.system.role.RoleController.cancelAuthUser()', '', '1', 'admin', '银商管理中心', '/system/role/authUser/cancel', '127.0.0.1', '内网IP', '{\"roleId\":[\"1\"],\"userId\":[\"1\"]}', '0', null, '2019-10-08 11:42:39');
INSERT INTO `sys_oper_log` VALUES ('176', '用户管理', '1', 'com.management.project.controller.system.user.UserController.addSave()', '', '1', 'admin', '银商管理中心', '/system/user/add', '127.0.0.1', '内网IP', '{\"deptId\":[\"101\"],\"userName\":[\"test\"],\"deptName\":[\"银商管理中心\"],\"phonenumber\":[\"18301403333\"],\"email\":[\"y_gaofei@163.com\"],\"loginName\":[\"18301403333\"],\"password\":[\"123456\"],\"sex\":[\"0\"],\"role\":[\"102\"],\"level\":[\"0\"],\"parentId\":[\"0\"],\"parentName\":[\"\"],\"remark\":[\"\"],\"status\":[\"0\"],\"roleIds\":[\"102\"],\"postIds\":[\"\"],\"userParentId\":[\"0\"]}', '0', null, '2019-10-08 11:49:10');
INSERT INTO `sys_oper_log` VALUES ('177', '代码生成', '8', 'com.management.project.controller.tool.gen.GenController.genCode()', '', '1', 'admin', '银商管理中心', '/tool/gen/genCode/b_market_info', '127.0.0.1', '内网IP', '{}', '0', null, '2019-10-08 12:03:04');
INSERT INTO `sys_oper_log` VALUES ('178', '盘口管理', '1', 'com.management.project.controller.system.dept.DeptController.addSave()', '', '1', 'admin', '银商管理中心', '/system/dept/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"100\"],\"deptName\":[\"测试盘口01\"],\"orderNum\":[\"5\"],\"leader\":[\"\"],\"phone\":[\"\"],\"email\":[\"\"],\"rechargeUrl\":[\"www.baidu.com\"],\"belong\":[\"张三\"],\"openTime\":[\"\"],\"closeTime\":[\"\"],\"status\":[\"0\"]}', '1', '', '2019-10-08 14:58:34');
INSERT INTO `sys_oper_log` VALUES ('179', '盘口管理', '1', 'com.management.project.controller.system.dept.DeptController.addSave()', '', '1', 'admin', '银商管理中心', '/system/dept/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"100\"],\"deptName\":[\"测试盘口01\"],\"orderNum\":[\"5\"],\"leader\":[\"\"],\"phone\":[\"\"],\"email\":[\"\"],\"rechargeUrl\":[\"www.baidu.com\"],\"belong\":[\"张三\"],\"openTime\":[\"\"],\"closeTime\":[\"\"],\"status\":[\"0\"]}', '1', '', '2019-10-08 14:59:18');
INSERT INTO `sys_oper_log` VALUES ('180', '盘口管理', '1', 'com.management.project.controller.system.dept.DeptController.addSave()', '', '1', 'admin', '银商管理中心', '/system/dept/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"100\"],\"deptName\":[\"测试盘口01\"],\"orderNum\":[\"5\"],\"leader\":[\"哈哈哈\"],\"phone\":[\"\"],\"email\":[\"\"],\"rechargeUrl\":[\"www.baidu.com\"],\"belong\":[\"张三\"],\"openTime\":[\"\"],\"closeTime\":[\"\"],\"status\":[\"0\"]}', '1', '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Column \'market_name\' cannot be null\r\n### The error may involve com.management.project.mapper.mysql.system.dept.DeptMapper.insertMarketInfo-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into b_market_info(market_name,user_id,app_id,app_secret,recharge_url,logo_url,app_type,belong,state,create_time,open_time,close_time,dep_id)  values(?,?,?,?,?,?,?,?,?,?,?,?,?)\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Column \'market_name\' cannot be null\n; Column \'market_name\' cannot be null; nested exception is java.sql.SQLIntegrityConstraintViolationException: Column \'market_name\' cannot be null', '2019-10-08 15:02:50');
INSERT INTO `sys_oper_log` VALUES ('181', '盘口管理', '1', 'com.management.project.controller.system.dept.DeptController.addSave()', '', '1', 'admin', '银商管理中心', '/system/dept/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"100\"],\"deptName\":[\"测试盘口1\"],\"orderNum\":[\"5\"],\"leader\":[\"哈哈\"],\"phone\":[\"\"],\"email\":[\"\"],\"rechargeUrl\":[\"www.baidu.com\"],\"belong\":[\"张三\"],\"openTime\":[\"\"],\"closeTime\":[\"\"],\"status\":[\"0\"]}', '1', '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Column \'user_id\' cannot be null\r\n### The error may involve com.management.project.mapper.mysql.system.dept.DeptMapper.insertMarketInfo-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into b_market_info(market_name,user_id,app_id,app_secret,recharge_url,logo_url,app_type,belong,state,create_time,open_time,close_time,dep_id)  values(?,?,?,?,?,?,?,?,?,?,?,?,?)\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Column \'user_id\' cannot be null\n; Column \'user_id\' cannot be null; nested exception is java.sql.SQLIntegrityConstraintViolationException: Column \'user_id\' cannot be null', '2019-10-08 15:10:16');
INSERT INTO `sys_oper_log` VALUES ('182', '盘口管理', '1', 'com.management.project.controller.system.dept.DeptController.addSave()', '', '1', 'admin', '银商管理中心', '/system/dept/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"100\"],\"deptName\":[\"测试盘口1\"],\"orderNum\":[\"5\"],\"leader\":[\"1\"],\"phone\":[\"\"],\"email\":[\"\"],\"rechargeUrl\":[\"www.baidu.com\"],\"belong\":[\"张三\"],\"openTime\":[\"\"],\"closeTime\":[\"\"],\"status\":[\"0\"]}', '0', null, '2019-10-08 15:14:47');
INSERT INTO `sys_oper_log` VALUES ('183', '代码生成', '8', 'com.management.project.controller.tool.gen.GenController.genCode()', '', '1', 'admin', '银商管理中心', '/tool/gen/genCode/b_sys_conf', '127.0.0.1', '内网IP', '{}', '0', null, '2019-10-08 15:31:58');
INSERT INTO `sys_oper_log` VALUES ('184', '代码生成', '8', 'com.management.project.controller.tool.gen.GenController.genCode()', '', '1', 'admin', '银商管理中心', '/tool/gen/genCode/b_exchange_rate', '127.0.0.1', '内网IP', '{}', '0', null, '2019-10-08 15:34:01');
INSERT INTO `sys_oper_log` VALUES ('185', '字典类型', '1', 'com.management.project.controller.system.dict.DictTypeController.addSave()', '', '1', 'admin', '银商管理中心', '/system/dict/add', '127.0.0.1', '内网IP', '{\"dictName\":[\"盘口状态\"],\"dictType\":[\"b_market_status\"],\"status\":[\"0\"],\"remark\":[\"0  未开盘 1  开盘 2  停盘\"]}', '0', null, '2019-10-08 15:53:57');
INSERT INTO `sys_oper_log` VALUES ('186', '字典数据', '1', 'com.management.project.controller.system.dict.DictDataController.addSave()', '', '1', 'admin', '银商管理中心', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"未开盘\"],\"dictValue\":[\"0\"],\"dictType\":[\"b_market_status\"],\"cssClass\":[\"\"],\"dictSort\":[\"1\"],\"listClass\":[\"\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"0  未开盘 1  开盘 2  停盘 \"]}', '0', null, '2019-10-08 15:55:07');
INSERT INTO `sys_oper_log` VALUES ('187', '字典数据', '1', 'com.management.project.controller.system.dict.DictDataController.addSave()', '', '1', 'admin', '银商管理中心', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"开盘\"],\"dictValue\":[\"1\"],\"dictType\":[\"b_market_status\"],\"cssClass\":[\"\"],\"dictSort\":[\"2\"],\"listClass\":[\"\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"0  未开盘 1  开盘 2  停盘 \"]}', '0', null, '2019-10-08 15:55:25');
INSERT INTO `sys_oper_log` VALUES ('188', '字典数据', '1', 'com.management.project.controller.system.dict.DictDataController.addSave()', '', '1', 'admin', '银商管理中心', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"停盘\"],\"dictValue\":[\"2\"],\"dictType\":[\"b_market_status\"],\"cssClass\":[\"\"],\"dictSort\":[\"3\"],\"listClass\":[\"\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"0  未开盘 1  开盘 2  停盘 \"]}', '0', null, '2019-10-08 15:55:57');
INSERT INTO `sys_oper_log` VALUES ('189', '菜单管理', '1', 'com.management.project.controller.system.menu.MenuController.addSave()', '', '1', 'admin', '银商管理中心', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1\"],\"menuType\":[\"C\"],\"menuName\":[\"兑换设置\"],\"url\":[\"/toConfigure/bConf\"],\"target\":[\"menuItem\"],\"perms\":[\"toConfigure:bConf:view\"],\"orderNum\":[\"10\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2019-10-08 16:06:06');
INSERT INTO `sys_oper_log` VALUES ('190', '菜单管理', '1', 'com.management.project.controller.system.menu.MenuController.addSave()', '', '1', 'admin', '银商管理中心', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1\"],\"menuType\":[\"C\"],\"menuName\":[\"客服汇率\"],\"url\":[\"/toConfigure/bExchangeRate\"],\"target\":[\"menuItem\"],\"perms\":[\"toConfigure:bExchangeRate:view\"],\"orderNum\":[\"11\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2019-10-08 16:07:57');
INSERT INTO `sys_oper_log` VALUES ('191', '菜单管理', '1', 'com.management.project.controller.system.menu.MenuController.addSave()', '', '1', 'admin', '银商管理中心', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2003\"],\"menuType\":[\"F\"],\"menuName\":[\"查询\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"toConfigure:bConf:list\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2019-10-08 16:10:50');
INSERT INTO `sys_oper_log` VALUES ('192', '菜单管理', '1', 'com.management.project.controller.system.menu.MenuController.addSave()', '', '1', 'admin', '银商管理中心', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2003\"],\"menuType\":[\"F\"],\"menuName\":[\"新增\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"toConfigure:bConf:add\"],\"orderNum\":[\"2\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2019-10-08 16:11:14');
INSERT INTO `sys_oper_log` VALUES ('193', '菜单管理', '1', 'com.management.project.controller.system.menu.MenuController.addSave()', '', '1', 'admin', '银商管理中心', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2003\"],\"menuType\":[\"F\"],\"menuName\":[\"编辑\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"toConfigure:bConf:edit\"],\"orderNum\":[\"3\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2019-10-08 16:11:43');
INSERT INTO `sys_oper_log` VALUES ('194', '菜单管理', '1', 'com.management.project.controller.system.menu.MenuController.addSave()', '', '1', 'admin', '银商管理中心', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2003\"],\"menuType\":[\"F\"],\"menuName\":[\"删除\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"toConfigure:bConf:remove\"],\"orderNum\":[\"4\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2019-10-08 16:12:21');
INSERT INTO `sys_oper_log` VALUES ('195', '菜单管理', '1', 'com.management.project.controller.system.menu.MenuController.addSave()', '', '1', 'admin', '银商管理中心', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2004\"],\"menuType\":[\"F\"],\"menuName\":[\"查询\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"toConfigure:bExchangeRate:list\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2019-10-08 16:13:06');
INSERT INTO `sys_oper_log` VALUES ('196', '菜单管理', '1', 'com.management.project.controller.system.menu.MenuController.addSave()', '', '1', 'admin', '银商管理中心', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2004\"],\"menuType\":[\"F\"],\"menuName\":[\"新增\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"toConfigure:bExchangeRate:add\"],\"orderNum\":[\"2\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2019-10-08 16:13:24');
INSERT INTO `sys_oper_log` VALUES ('197', '菜单管理', '1', 'com.management.project.controller.system.menu.MenuController.addSave()', '', '1', 'admin', '银商管理中心', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2004\"],\"menuType\":[\"F\"],\"menuName\":[\"编辑\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"toConfigure:bExchangeRate:edit\"],\"orderNum\":[\"3\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2019-10-08 16:13:43');
INSERT INTO `sys_oper_log` VALUES ('198', '菜单管理', '1', 'com.management.project.controller.system.menu.MenuController.addSave()', '', '1', 'admin', '银商管理中心', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2004\"],\"menuType\":[\"F\"],\"menuName\":[\"删除\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"toConfigure:bExchangeRate:remove\"],\"orderNum\":[\"4\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2019-10-08 16:14:02');
INSERT INTO `sys_oper_log` VALUES ('199', '盘口管理', '1', 'com.management.project.controller.system.dept.DeptController.addSave()', '', '1', 'admin', '银商管理中心', '/system/dept/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"100\"],\"deptName\":[\"测试盘口\"],\"rechargeUrl\":[\"www.baidu.com\"],\"belong\":[\"张三\"],\"openTime\":[\"2019-10-10 06:10:00\"],\"closeTime\":[\"2019-10-16 16:25:23\"],\"status\":[\"0\"]}', '0', null, '2019-10-08 16:30:31');
INSERT INTO `sys_oper_log` VALUES ('200', '字典类型', '1', 'com.management.project.controller.system.dict.DictTypeController.addSave()', '', '1', 'admin', '银商管理中心', '/system/dict/add', '127.0.0.1', '内网IP', '{\"dictName\":[\"盘口类型\"],\"dictType\":[\"b_market_type\"],\"status\":[\"0\"],\"remark\":[\"0  棋牌 1  彩票 2  其它\"]}', '0', null, '2019-10-08 16:55:39');
INSERT INTO `sys_oper_log` VALUES ('201', '字典数据', '1', 'com.management.project.controller.system.dict.DictDataController.addSave()', '', '1', 'admin', '银商管理中心', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"棋牌\"],\"dictValue\":[\"0\"],\"dictType\":[\"b_market_type\"],\"cssClass\":[\"\"],\"dictSort\":[\"1\"],\"listClass\":[\"\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"0  棋牌 1  彩票 2  其它\"]}', '0', null, '2019-10-08 16:56:26');
INSERT INTO `sys_oper_log` VALUES ('202', '字典数据', '1', 'com.management.project.controller.system.dict.DictDataController.addSave()', '', '1', 'admin', '银商管理中心', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"彩票\"],\"dictValue\":[\"1\"],\"dictType\":[\"b_market_type\"],\"cssClass\":[\"\"],\"dictSort\":[\"2\"],\"listClass\":[\"\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"0  棋牌 1  彩票 2  其它\"]}', '0', null, '2019-10-08 16:56:45');
INSERT INTO `sys_oper_log` VALUES ('203', '字典数据', '1', 'com.management.project.controller.system.dict.DictDataController.addSave()', '', '1', 'admin', '银商管理中心', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"其它\"],\"dictValue\":[\"2\"],\"dictType\":[\"b_market_type\"],\"cssClass\":[\"\"],\"dictSort\":[\"2\"],\"listClass\":[\"\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"0  棋牌 1  彩票 2  其它\"]}', '0', null, '2019-10-08 16:56:58');
INSERT INTO `sys_oper_log` VALUES ('204', '字典数据', '2', 'com.management.project.controller.system.dict.DictDataController.editSave()', '', '1', 'admin', '银商管理中心', '/system/dict/data/edit', '127.0.0.1', '内网IP', '{\"dictCode\":[\"109\"],\"dictLabel\":[\"其它\"],\"dictValue\":[\"2\"],\"dictType\":[\"b_market_type\"],\"cssClass\":[\"\"],\"dictSort\":[\"3\"],\"listClass\":[\"\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"0 棋牌 1 彩票 2 其它\"]}', '0', null, '2019-10-08 16:57:11');
INSERT INTO `sys_oper_log` VALUES ('205', '修改兑换设置的状态', '2', 'com.management.project.controller.toConfigure.BConfController.changeStatus()', '', '1', 'admin', '银商管理中心', '/toConfigure/bConf/changeStatus', '127.0.0.1', '内网IP', '{\"id\":[\"1\"],\"status\":[\"1\"]}', '1', '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'where id = 1\' at line 3\r\n### The error may involve com.management.project.mapper.mysql.toConfigure.BConfMapper.updateBConf-Inline\r\n### The error occurred while setting parameters\r\n### SQL: update b_sys_conf                    where id = ?\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'where id = 1\' at line 3\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'where id = 1\' at line 3', '2019-10-08 16:58:31');
INSERT INTO `sys_oper_log` VALUES ('206', '修改兑换设置的状态', '2', 'com.management.project.controller.toConfigure.BConfController.changeStatus()', '', '1', 'admin', '银商管理中心', '/toConfigure/bConf/changeStatus', '127.0.0.1', '内网IP', '{\"id\":[\"1\"],\"state\":[\"0\"]}', '0', null, '2019-10-08 16:59:38');
INSERT INTO `sys_oper_log` VALUES ('207', '修改兑换设置的状态', '2', 'com.management.project.controller.toConfigure.BConfController.changeStatus()', '', '1', 'admin', '银商管理中心', '/toConfigure/bConf/changeStatus', '127.0.0.1', '内网IP', '{\"id\":[\"1\"],\"state\":[\"0\"]}', '0', null, '2019-10-08 16:59:45');
INSERT INTO `sys_oper_log` VALUES ('208', '盘口管理', '1', 'com.management.project.controller.system.dept.DeptController.addSave()', '', '1', 'admin', '银商管理中心', '/system/dept/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"100\"],\"deptName\":[\"测试盘口2\"],\"rechargeUrl\":[\"www.baidu.com\"],\"belong\":[\"李四\"],\"openTime\":[\"2019-10-09 06:55:58\"],\"closeTime\":[\"2019-10-26 18:50:58\"],\"status\":[\"2\"],\"appType\":[\"1\"]}', '0', null, '2019-10-08 16:59:47');
INSERT INTO `sys_oper_log` VALUES ('209', '修改兑换设置的状态', '2', 'com.management.project.controller.toConfigure.BConfController.changeStatus()', '', '1', 'admin', '银商管理中心', '/toConfigure/bConf/changeStatus', '127.0.0.1', '内网IP', '{\"id\":[\"1\"],\"state\":[\"0\"]}', '0', null, '2019-10-08 17:01:05');
INSERT INTO `sys_oper_log` VALUES ('210', '修改兑换设置的状态', '2', 'com.management.project.controller.toConfigure.BConfController.changeStatus()', '', '1', 'admin', '银商管理中心', '/toConfigure/bConf/changeStatus', '127.0.0.1', '内网IP', '{\"id\":[\"1\"],\"state\":[\"0\"]}', '0', null, '2019-10-08 17:01:07');
INSERT INTO `sys_oper_log` VALUES ('211', '修改兑换设置的状态', '2', 'com.management.project.controller.toConfigure.BConfController.changeStatus()', '', '1', 'admin', '银商管理中心', '/toConfigure/bConf/changeStatus', '127.0.0.1', '内网IP', '{\"id\":[\"1\"],\"state\":[\"0\"]}', '0', null, '2019-10-08 17:01:19');
INSERT INTO `sys_oper_log` VALUES ('212', '修改兑换设置的状态', '2', 'com.management.project.controller.toConfigure.BConfController.changeStatus()', '', '1', 'admin', '银商管理中心', '/toConfigure/bConf/changeStatus', '127.0.0.1', '内网IP', '{\"id\":[\"1\"],\"state\":[\"0\"]}', '0', null, '2019-10-08 17:01:30');
INSERT INTO `sys_oper_log` VALUES ('213', '修改兑换设置的状态', '2', 'com.management.project.controller.toConfigure.BConfController.changeStatus()', '', '1', 'admin', '银商管理中心', '/toConfigure/bConf/changeStatus', '127.0.0.1', '内网IP', '{\"id\":[\"1\"],\"state\":[\"0\"]}', '0', null, '2019-10-08 17:01:37');
INSERT INTO `sys_oper_log` VALUES ('214', '修改兑换设置的状态', '2', 'com.management.project.controller.toConfigure.BConfController.changeStatus()', '', '1', 'admin', '银商管理中心', '/toConfigure/bConf/changeStatus', '127.0.0.1', '内网IP', '{\"id\":[\"1\"],\"state\":[\"0\"]}', '0', null, '2019-10-08 17:02:51');
INSERT INTO `sys_oper_log` VALUES ('215', '修改兑换设置的状态', '2', 'com.management.project.controller.toConfigure.BConfController.changeStatus()', '', '1', 'admin', '银商管理中心', '/toConfigure/bConf/changeStatus', '127.0.0.1', '内网IP', '{\"id\":[\"1\"],\"state\":[\"0\"]}', '0', null, '2019-10-08 17:06:48');
INSERT INTO `sys_oper_log` VALUES ('216', '修改兑换设置的状态', '2', 'com.management.project.controller.toConfigure.BConfController.changeStatus()', '', '1', 'admin', '银商管理中心', '/toConfigure/bConf/changeStatus', '127.0.0.1', '内网IP', '{\"id\":[\"1\"],\"state\":[\"1\"]}', '0', null, '2019-10-08 17:10:06');
INSERT INTO `sys_oper_log` VALUES ('217', '盘口管理', '2', 'com.management.project.controller.system.dept.DeptController.editSave()', '', '1', 'admin', '银商管理中心', '/system/dept/edit', '127.0.0.1', '内网IP', '{\"deptId\":[\"206\"],\"parentId\":[\"100\"],\"parentName\":[\"银商系统\"],\"deptName\":[\"测试盘口\"],\"appId\":[\"9000001005140402\"],\"appSecret\":[\"54c6ad52762040a6bee081dafe3a4a40\"],\"rechargeUrl\":[\"www.baidu.com\"],\"belong\":[\"张三2\"],\"openTime\":[\"\"],\"closeTime\":[\"\"],\"status\":[\"2\"],\"appType\":[\"0\"]}', '0', null, '2019-10-08 17:19:17');
INSERT INTO `sys_oper_log` VALUES ('218', '盘口管理', '2', 'com.management.project.controller.system.dept.DeptController.editSave()', '', '1', 'admin', '银商管理中心', '/system/dept/edit', '127.0.0.1', '内网IP', '{\"deptId\":[\"206\"],\"parentId\":[\"100\"],\"parentName\":[\"银商系统\"],\"deptName\":[\"测试盘口\"],\"appId\":[\"9000001005140402\"],\"appSecret\":[\"54c6ad52762040a6bee081dafe3a4a40\"],\"rechargeUrl\":[\"www.baidu.com\"],\"belong\":[\"张三1\"],\"openTime\":[\"\"],\"closeTime\":[\"\"],\"status\":[\"1\"],\"appType\":[\"1\"]}', '0', null, '2019-10-08 17:22:30');
INSERT INTO `sys_oper_log` VALUES ('219', '盘口管理', '2', 'com.management.project.controller.system.dept.DeptController.editSave()', '', '1', 'admin', '银商管理中心', '/system/dept/edit', '127.0.0.1', '内网IP', '{\"deptId\":[\"207\"],\"parentId\":[\"100\"],\"parentName\":[\"银商系统\"],\"deptName\":[\"测试盘口2\"],\"appId\":[\"4000001351621042\"],\"appSecret\":[\"d465d65e2ccb44fb808ad1c30a6654aa\"],\"rechargeUrl\":[\"www.baidu.com\"],\"belong\":[\"王五\"],\"openTime\":[\"\"],\"closeTime\":[\"\"],\"status\":[\"2\"],\"appType\":[\"0\"]}', '0', null, '2019-10-08 17:27:21');
INSERT INTO `sys_oper_log` VALUES ('220', '盘口管理', '2', 'com.management.project.controller.system.dept.DeptController.editSave()', '', '1', 'admin', '银商管理中心', '/system/dept/edit', '127.0.0.1', '内网IP', '{\"deptId\":[\"206\"],\"parentId\":[\"100\"],\"parentName\":[\"银商系统\"],\"deptName\":[\"测试盘口\"],\"appId\":[\"9000001005140402\"],\"appSecret\":[\"54c6ad52762040a6bee081dafe3a4a40\"],\"rechargeUrl\":[\"www.baidu.com\"],\"belong\":[\"张三1\"],\"openTime\":[\"2019-12-13 01:05:00\"],\"closeTime\":[\"2019-12-31 23:00:00\"],\"status\":[\"1\"],\"appType\":[\"1\"]}', '0', null, '2019-10-08 17:36:46');
INSERT INTO `sys_oper_log` VALUES ('221', '系统参数', '2', 'com.management.project.controller.toConfigure.BConfController.editSave()', '', '1', 'admin', '银商管理中心', '/toConfigure/bConf/edit', '127.0.0.1', '内网IP', '{\"id\":[\"1\"],\"category\":[\"app_type\"],\"code\":[\"qp\"],\"name\":[\"棋牌\"],\"vale\":[\"0\"],\"parentId\":[\"\"],\"state\":[\"1\"]}', '0', null, '2019-10-08 17:39:15');
INSERT INTO `sys_oper_log` VALUES ('222', '系统参数', '2', 'com.management.project.controller.toConfigure.BConfController.editSave()', '', '1', 'admin', '银商管理中心', '/toConfigure/bConf/edit', '127.0.0.1', '内网IP', '{\"id\":[\"1\"],\"category\":[\"app_type\"],\"code\":[\"qp\"],\"name\":[\"棋牌\"],\"vale\":[\"0\"],\"parentId\":[\"\"]}', '0', null, '2019-10-08 17:39:19');
INSERT INTO `sys_oper_log` VALUES ('223', '系统参数', '2', 'com.management.project.controller.toConfigure.BConfController.editSave()', '', '1', 'admin', '银商管理中心', '/toConfigure/bConf/edit', '127.0.0.1', '内网IP', '{\"id\":[\"1\"],\"category\":[\"app_type\"],\"code\":[\"qp\"],\"name\":[\"棋牌\"],\"vale\":[\"0\"],\"parentId\":[\"\"],\"state\":[\"1\"]}', '0', null, '2019-10-08 17:40:31');
INSERT INTO `sys_oper_log` VALUES ('224', '系统参数', '2', 'com.management.project.controller.toConfigure.BConfController.editSave()', '', '1', 'admin', '银商管理中心', '/toConfigure/bConf/edit', '127.0.0.1', '内网IP', '{\"id\":[\"1\"],\"category\":[\"app_type\"],\"code\":[\"qp\"],\"name\":[\"棋牌\"],\"vale\":[\"0\"],\"parentId\":[\"\"]}', '0', null, '2019-10-08 17:40:37');
INSERT INTO `sys_oper_log` VALUES ('225', '盘口管理', '3', 'com.management.project.controller.system.dept.DeptController.remove()', '', '1', 'admin', '银商管理中心', '/system/dept/remove/207', '127.0.0.1', '内网IP', '{}', '0', null, '2019-10-08 17:43:16');
INSERT INTO `sys_oper_log` VALUES ('226', '系统参数', '2', 'com.management.project.controller.toConfigure.BConfController.editSave()', '', '1', 'admin', '银商管理中心', '/toConfigure/bConf/edit', '127.0.0.1', '内网IP', '{\"id\":[\"1\"],\"category\":[\"app_type\"],\"code\":[\"qp\"],\"name\":[\"棋牌\"],\"vale\":[\"0\"],\"parentId\":[\"\"]}', '0', null, '2019-10-08 17:43:52');
INSERT INTO `sys_oper_log` VALUES ('227', '系统参数', '2', 'com.management.project.controller.toConfigure.BConfController.editSave()', '', '1', 'admin', '银商管理中心', '/toConfigure/bConf/edit', '127.0.0.1', '内网IP', '{\"id\":[\"1\"],\"category\":[\"app_type\"],\"code\":[\"qp\"],\"name\":[\"棋牌\"],\"vale\":[\"0\"],\"parentId\":[\"\"],\"state\":[\"0\"]}', '0', null, '2019-10-08 17:45:50');
INSERT INTO `sys_oper_log` VALUES ('228', '系统参数', '2', 'com.management.project.controller.toConfigure.BConfController.editSave()', '', '1', 'admin', '银商管理中心', '/toConfigure/bConf/edit', '127.0.0.1', '内网IP', '{\"id\":[\"1\"],\"category\":[\"app_type\"],\"code\":[\"qp\"],\"name\":[\"棋牌\"],\"vale\":[\"0\"],\"parentId\":[\"\"],\"state\":[\"1\"]}', '0', null, '2019-10-08 17:45:57');
INSERT INTO `sys_oper_log` VALUES ('229', '重置密码', '2', 'com.management.project.controller.system.user.UserController.resetPwd()', '', '1', 'admin', '银商管理中心', '/system/user/resetPwd/108', '127.0.0.1', '内网IP', '{}', '0', null, '2019-10-08 18:06:42');
INSERT INTO `sys_oper_log` VALUES ('230', '重置密码', '2', 'com.management.project.controller.system.user.UserController.resetPwd()', '', '1', 'admin', '银商管理中心', '/system/user/resetPwd', '127.0.0.1', '内网IP', '{\"userId\":[\"108\"],\"loginName\":[\"18301403333\"],\"password\":[\"123456\"]}', '0', null, '2019-10-08 18:06:54');
INSERT INTO `sys_oper_log` VALUES ('231', '盘口管理-停用盘口', '2', 'com.management.project.controller.system.dept.DeptController.disableMarket()', '', '1', 'admin', '银商管理中心', '/system/dept/disableMarket', '127.0.0.1', '内网IP', '{\"deptId\":[\"206\"],\"status\":[\"2\"]}', '0', null, '2019-10-08 18:31:23');
INSERT INTO `sys_oper_log` VALUES ('232', '盘口管理-启用盘口', '2', 'com.management.project.controller.system.dept.DeptController.enableMarket()', '', '1', 'admin', '银商管理中心', '/system/dept/enableMarket', '127.0.0.1', '内网IP', '{\"deptId\":[\"206\"],\"status\":[\"1\"]}', '0', null, '2019-10-08 18:31:30');
INSERT INTO `sys_oper_log` VALUES ('233', '盘口管理', '1', 'com.management.project.controller.system.dept.DeptController.addSave()', '', '1', 'admin', '银商管理中心', '/system/dept/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"206\"],\"deptName\":[\"测试盘口1\"],\"rechargeUrl\":[\"www.baidu.com\"],\"belong\":[\"张三2\"],\"openTime\":[\"2019-10-08 09:15:12\"],\"closeTime\":[\"\"],\"status\":[\"0\"],\"appType\":[\"0\"]}', '1', '盘口停用，不允许新增', '2019-10-08 20:15:34');
INSERT INTO `sys_oper_log` VALUES ('234', '盘口管理', '1', 'com.management.project.controller.system.dept.DeptController.addSave()', '', '1', 'admin', '银商管理中心', '/system/dept/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"206\"],\"deptName\":[\"测试盘口1\"],\"rechargeUrl\":[\"www.baidu.com\"],\"belong\":[\"张三2\"],\"openTime\":[\"\"],\"closeTime\":[\"\"],\"status\":[\"0\"],\"appType\":[\"0\"]}', '1', '盘口停用，不允许新增', '2019-10-08 20:16:05');
INSERT INTO `sys_oper_log` VALUES ('235', '盘口管理-启用盘口', '2', 'com.management.project.controller.system.dept.DeptController.enableMarket()', '', '1', 'admin', '银商管理中心', '/system/dept/enableMarket', '127.0.0.1', '内网IP', '{\"deptId\":[\"101\"],\"status\":[\"1\"]}', '0', null, '2019-10-08 20:20:00');
INSERT INTO `sys_oper_log` VALUES ('236', '盘口管理-停用盘口', '2', 'com.management.project.controller.system.dept.DeptController.disableMarket()', '', '1', 'admin', '银商管理中心', '/system/dept/disableMarket', '127.0.0.1', '内网IP', '{\"deptId\":[\"101\"],\"status\":[\"2\"]}', '0', null, '2019-10-08 20:20:04');
INSERT INTO `sys_oper_log` VALUES ('237', '盘口管理', '1', 'com.management.project.controller.system.dept.DeptController.addSave()', '', '1', 'admin', '银商管理中心', '/system/dept/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"206\"],\"deptName\":[\"测试盘口1\"],\"rechargeUrl\":[\"www.baidu.com\"],\"belong\":[\"张三2\"],\"openTime\":[\"\"],\"closeTime\":[\"\"],\"status\":[\"1\"],\"appType\":[\"0\"]}', '1', '盘口停用，不允许新增', '2019-10-08 20:22:34');
INSERT INTO `sys_oper_log` VALUES ('238', '盘口管理', '1', 'com.management.project.controller.system.dept.DeptController.addSave()', '', '1', 'admin', '银商管理中心', '/system/dept/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"206\"],\"deptName\":[\"测试盘口1\"],\"rechargeUrl\":[\"www.baidu.com\"],\"belong\":[\"张三2\"],\"openTime\":[\"\"],\"closeTime\":[\"\"],\"status\":[\"1\"],\"appType\":[\"0\"]}', '0', null, '2019-10-08 20:24:43');
INSERT INTO `sys_oper_log` VALUES ('239', '盘口管理', '2', 'com.management.project.controller.system.dept.DeptController.editSave()', '', '1', 'admin', '银商管理中心', '/system/dept/edit', '127.0.0.1', '内网IP', '{\"deptId\":[\"208\"],\"parentId\":[\"206\"],\"parentName\":[\"测试盘口\"],\"deptName\":[\"测试盘口1\"],\"appId\":[\"7000002003719812\"],\"appSecret\":[\"305f537b4e434d9b8cd5aa652ca1a3ca\"],\"rechargeUrl\":[\"www.baidu.com\"],\"belong\":[\"张三2\"],\"openTime\":[\"\"],\"closeTime\":[\"\"],\"status\":[\"2\"],\"appType\":[\"1\"]}', '0', null, '2019-10-08 20:25:06');
INSERT INTO `sys_oper_log` VALUES ('240', '代码生成', '8', 'com.management.project.controller.tool.gen.GenController.genCode()', '', '1', 'admin', '银商管理中心', '/tool/gen/genCode/b_recharge_order', '127.0.0.1', '内网IP', '{}', '0', null, '2019-10-09 10:23:56');
INSERT INTO `sys_oper_log` VALUES ('241', '菜单管理', '1', 'com.management.project.controller.system.menu.MenuController.addSave()', '', '1', 'admin', '银商管理中心', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"订单管理\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"5\"],\"icon\":[\"fa fa-cart-plus\"],\"visible\":[\"0\"]}', '0', null, '2019-10-09 10:28:46');
INSERT INTO `sys_oper_log` VALUES ('242', '菜单管理', '2', 'com.management.project.controller.system.menu.MenuController.editSave()', '', '1', 'admin', '银商管理中心', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2013\"],\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"订单管理\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"4\"],\"icon\":[\"fa fa-cart-plus\"],\"visible\":[\"0\"]}', '0', null, '2019-10-09 10:28:58');
INSERT INTO `sys_oper_log` VALUES ('243', '菜单管理', '1', 'com.management.project.controller.system.menu.MenuController.addSave()', '', '1', 'admin', '银商管理中心', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2013\"],\"menuType\":[\"C\"],\"menuName\":[\"充值订单管理\"],\"url\":[\"/order/bRechargeOrder\"],\"target\":[\"menuItem\"],\"perms\":[\"order:bRechargeOrder:view\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2019-10-09 10:31:19');
INSERT INTO `sys_oper_log` VALUES ('244', '用户充值订单', '1', 'com.management.project.controller.order.BRechargeOrderController.addSave()', '', '1', 'admin', '银商管理中心', '/order/bRechargeOrder/add', '127.0.0.1', '内网IP', '{\"gameUserId\":[\"1\"],\"gameUserName\":[\"11\"],\"userId\":[\"253\"],\"parentId\":[\"\"],\"appId\":[\"206\"],\"gameCurrencyType\":[\"\"],\"rmbAmount\":[\"100\"],\"gameAmount\":[\"\"],\"state\":[\"\"],\"createTime\":[\"\"],\"updateTime\":[\"\"],\"account\":[\"\"],\"payAccountCode\":[\"\"],\"recAccountCode\":[\"\"],\"remark\":[\"\"]}', '1', '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\r\n### The error may involve com.management.project.mapper.mysql.order.BRechargeOrderMapper.insertBRechargeOrder-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into b_recharge_order    ( game_user_id,    game_user_name,    user_id,        app_id,        rmb_amount,                        pay_account_code,    rec_account_code,    remark )           values ( ?,    ?,    ?,        ?,        ?,                        ?,    ?,    ? )\r\n### Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\n; Field \'id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'id\' doesn\'t have a default value', '2019-10-09 11:24:40');
INSERT INTO `sys_oper_log` VALUES ('245', '字典类型', '1', 'com.management.project.controller.system.dict.DictTypeController.addSave()', '', '1', 'admin', '银商管理中心', '/system/dict/add', '127.0.0.1', '内网IP', '{\"dictName\":[\"订单充值状态\"],\"dictType\":[\"b_order_status\"],\"status\":[\"0\"],\"remark\":[\"0  待办 1  已入款待充值  2  充值完成  3 充值失败  4 取消\"]}', '0', null, '2019-10-09 14:22:25');
INSERT INTO `sys_oper_log` VALUES ('246', '字典数据', '1', 'com.management.project.controller.system.dict.DictDataController.addSave()', '', '1', 'admin', '银商管理中心', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"待办\"],\"dictValue\":[\"0\"],\"dictType\":[\"b_order_status\"],\"cssClass\":[\"\"],\"dictSort\":[\"1\"],\"listClass\":[\"\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"0 待办 1 已入款待充值 2 充值完成 3 充值失败 4 取消\"]}', '0', null, '2019-10-09 14:23:20');
INSERT INTO `sys_oper_log` VALUES ('247', '字典数据', '1', 'com.management.project.controller.system.dict.DictDataController.addSave()', '', '1', 'admin', '银商管理中心', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"已入款待充值\"],\"dictValue\":[\"1\"],\"dictType\":[\"b_order_status\"],\"cssClass\":[\"\"],\"dictSort\":[\"2\"],\"listClass\":[\"\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"0 待办 1 已入款待充值 2 充值完成 3 充值失败 4 取消\"]}', '0', null, '2019-10-09 14:23:40');
INSERT INTO `sys_oper_log` VALUES ('248', '字典数据', '1', 'com.management.project.controller.system.dict.DictDataController.addSave()', '', '1', 'admin', '银商管理中心', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"充值完成\"],\"dictValue\":[\"2\"],\"dictType\":[\"b_order_status\"],\"cssClass\":[\"\"],\"dictSort\":[\"3\"],\"listClass\":[\"\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"0 待办 1 已入款待充值 2 充值完成 3 充值失败 4 取消\"]}', '0', null, '2019-10-09 14:24:16');
INSERT INTO `sys_oper_log` VALUES ('249', '字典数据', '1', 'com.management.project.controller.system.dict.DictDataController.addSave()', '', '1', 'admin', '银商管理中心', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"充值失败\"],\"dictValue\":[\"3\"],\"dictType\":[\"b_order_status\"],\"cssClass\":[\"\"],\"dictSort\":[\"4\"],\"listClass\":[\"\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"0 待办 1 已入款待充值 2 充值完成 3 充值失败 4 取消\"]}', '0', null, '2019-10-09 14:24:48');
INSERT INTO `sys_oper_log` VALUES ('250', '字典数据', '1', 'com.management.project.controller.system.dict.DictDataController.addSave()', '', '1', 'admin', '银商管理中心', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"取消\"],\"dictValue\":[\"4\"],\"dictType\":[\"b_order_status\"],\"cssClass\":[\"\"],\"dictSort\":[\"5\"],\"listClass\":[\"\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"0 待办 1 已入款待充值 2 充值完成 3 充值失败 4 取消\"]}', '0', null, '2019-10-09 14:25:27');
INSERT INTO `sys_oper_log` VALUES ('251', '字典类型', '1', 'com.management.project.controller.system.dict.DictTypeController.addSave()', '', '1', 'admin', '银商管理中心', '/system/dict/add', '127.0.0.1', '内网IP', '{\"dictName\":[\"账户类型\"],\"dictType\":[\"b_pay_type\"],\"status\":[\"0\"],\"remark\":[\"0   银行卡  1 微信    2 支付宝\"]}', '0', null, '2019-10-09 14:39:27');
INSERT INTO `sys_oper_log` VALUES ('252', '字典数据', '1', 'com.management.project.controller.system.dict.DictDataController.addSave()', '', '1', 'admin', '银商管理中心', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"银行卡\"],\"dictValue\":[\"0\"],\"dictType\":[\"b_pay_type\"],\"cssClass\":[\"\"],\"dictSort\":[\"1\"],\"listClass\":[\"\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"0 银行卡 1 微信 2 支付宝\"]}', '0', null, '2019-10-09 14:40:12');
INSERT INTO `sys_oper_log` VALUES ('253', '字典数据', '1', 'com.management.project.controller.system.dict.DictDataController.addSave()', '', '1', 'admin', '银商管理中心', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"微信\"],\"dictValue\":[\"1\"],\"dictType\":[\"b_pay_type\"],\"cssClass\":[\"\"],\"dictSort\":[\"2\"],\"listClass\":[\"\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"0 银行卡 1 微信 2 支付宝\"]}', '0', null, '2019-10-09 14:40:30');
INSERT INTO `sys_oper_log` VALUES ('254', '字典数据', '1', 'com.management.project.controller.system.dict.DictDataController.addSave()', '', '1', 'admin', '银商管理中心', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"支付宝\"],\"dictValue\":[\"2\"],\"dictType\":[\"b_pay_type\"],\"cssClass\":[\"\"],\"dictSort\":[\"3\"],\"listClass\":[\"\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"0 银行卡 1 微信 2 支付宝\"]}', '0', null, '2019-10-09 14:41:04');
INSERT INTO `sys_oper_log` VALUES ('255', '字典数据', '2', 'com.management.project.controller.system.dict.DictDataController.editSave()', '', '1', 'admin', '银商管理中心', '/system/dict/data/edit', '127.0.0.1', '内网IP', '{\"dictCode\":[\"110\"],\"dictLabel\":[\"待处理\"],\"dictValue\":[\"0\"],\"dictType\":[\"b_order_status\"],\"cssClass\":[\"\"],\"dictSort\":[\"1\"],\"listClass\":[\"\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"0 待办 1 已入款待充值 2 充值完成 3 充值失败 4 取消\"]}', '0', null, '2019-10-09 15:02:00');
INSERT INTO `sys_oper_log` VALUES ('256', '字典数据', '2', 'com.management.project.controller.system.dict.DictDataController.editSave()', '', '1', 'admin', '银商管理中心', '/system/dict/data/edit', '127.0.0.1', '内网IP', '{\"dictCode\":[\"111\"],\"dictLabel\":[\"充值中\"],\"dictValue\":[\"1\"],\"dictType\":[\"b_order_status\"],\"cssClass\":[\"\"],\"dictSort\":[\"2\"],\"listClass\":[\"\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"0 待办 1 已入款待充值 2 充值完成 3 充值失败 4 取消\"]}', '0', null, '2019-10-09 15:02:12');
INSERT INTO `sys_oper_log` VALUES ('257', '字典数据', '2', 'com.management.project.controller.system.dict.DictDataController.editSave()', '', '1', 'admin', '银商管理中心', '/system/dict/data/edit', '127.0.0.1', '内网IP', '{\"dictCode\":[\"110\"],\"dictLabel\":[\"待处理\"],\"dictValue\":[\"0\"],\"dictType\":[\"b_order_status\"],\"cssClass\":[\"\"],\"dictSort\":[\"1\"],\"listClass\":[\"danger\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"0 待办 1 已入款待充值 2 充值完成 3 充值失败 4 取消\"]}', '0', null, '2019-10-09 15:14:19');
INSERT INTO `sys_oper_log` VALUES ('258', '字典数据', '2', 'com.management.project.controller.system.dict.DictDataController.editSave()', '', '1', 'admin', '银商管理中心', '/system/dict/data/edit', '127.0.0.1', '内网IP', '{\"dictCode\":[\"111\"],\"dictLabel\":[\"充值中\"],\"dictValue\":[\"1\"],\"dictType\":[\"b_order_status\"],\"cssClass\":[\"\"],\"dictSort\":[\"2\"],\"listClass\":[\"warning\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"0 待办 1 已入款待充值 2 充值完成 3 充值失败 4 取消\"]}', '0', null, '2019-10-09 15:14:29');
INSERT INTO `sys_oper_log` VALUES ('259', '字典数据', '2', 'com.management.project.controller.system.dict.DictDataController.editSave()', '', '1', 'admin', '银商管理中心', '/system/dict/data/edit', '127.0.0.1', '内网IP', '{\"dictCode\":[\"112\"],\"dictLabel\":[\"充值完成\"],\"dictValue\":[\"2\"],\"dictType\":[\"b_order_status\"],\"cssClass\":[\"\"],\"dictSort\":[\"3\"],\"listClass\":[\"success\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"0 待办 1 已入款待充值 2 充值完成 3 充值失败 4 取消\"]}', '0', null, '2019-10-09 15:14:41');
INSERT INTO `sys_oper_log` VALUES ('260', '字典数据', '2', 'com.management.project.controller.system.dict.DictDataController.editSave()', '', '1', 'admin', '银商管理中心', '/system/dict/data/edit', '127.0.0.1', '内网IP', '{\"dictCode\":[\"113\"],\"dictLabel\":[\"充值失败\"],\"dictValue\":[\"3\"],\"dictType\":[\"b_order_status\"],\"cssClass\":[\"\"],\"dictSort\":[\"4\"],\"listClass\":[\"warning\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"0 待办 1 已入款待充值 2 充值完成 3 充值失败 4 取消\"]}', '0', null, '2019-10-09 15:15:00');
INSERT INTO `sys_oper_log` VALUES ('261', '字典数据', '2', 'com.management.project.controller.system.dict.DictDataController.editSave()', '', '1', 'admin', '银商管理中心', '/system/dict/data/edit', '127.0.0.1', '内网IP', '{\"dictCode\":[\"111\"],\"dictLabel\":[\"充值中\"],\"dictValue\":[\"1\"],\"dictType\":[\"b_order_status\"],\"cssClass\":[\"\"],\"dictSort\":[\"2\"],\"listClass\":[\"primary\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"0 待办 1 已入款待充值 2 充值完成 3 充值失败 4 取消\"]}', '0', null, '2019-10-09 15:15:09');
INSERT INTO `sys_oper_log` VALUES ('262', '字典数据', '2', 'com.management.project.controller.system.dict.DictDataController.editSave()', '', '1', 'admin', '银商管理中心', '/system/dict/data/edit', '127.0.0.1', '内网IP', '{\"dictCode\":[\"115\"],\"dictLabel\":[\"银行卡\"],\"dictValue\":[\"0\"],\"dictType\":[\"b_pay_type\"],\"cssClass\":[\"\"],\"dictSort\":[\"1\"],\"listClass\":[\"info\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"0 银行卡 1 微信 2 支付宝\"]}', '0', null, '2019-10-09 15:15:42');
INSERT INTO `sys_oper_log` VALUES ('263', '字典数据', '2', 'com.management.project.controller.system.dict.DictDataController.editSave()', '', '1', 'admin', '银商管理中心', '/system/dict/data/edit', '127.0.0.1', '内网IP', '{\"dictCode\":[\"116\"],\"dictLabel\":[\"微信\"],\"dictValue\":[\"1\"],\"dictType\":[\"b_pay_type\"],\"cssClass\":[\"\"],\"dictSort\":[\"2\"],\"listClass\":[\"success\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"0 银行卡 1 微信 2 支付宝\"]}', '0', null, '2019-10-09 15:15:50');
INSERT INTO `sys_oper_log` VALUES ('264', '字典数据', '2', 'com.management.project.controller.system.dict.DictDataController.editSave()', '', '1', 'admin', '银商管理中心', '/system/dict/data/edit', '127.0.0.1', '内网IP', '{\"dictCode\":[\"117\"],\"dictLabel\":[\"支付宝\"],\"dictValue\":[\"2\"],\"dictType\":[\"b_pay_type\"],\"cssClass\":[\"\"],\"dictSort\":[\"3\"],\"listClass\":[\"primary\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"0 银行卡 1 微信 2 支付宝\"]}', '0', null, '2019-10-09 15:15:58');
INSERT INTO `sys_oper_log` VALUES ('265', '字典数据', '2', 'com.management.project.controller.system.dict.DictDataController.editSave()', '', '1', 'admin', '银商管理中心', '/system/dict/data/edit', '127.0.0.1', '内网IP', '{\"dictCode\":[\"110\"],\"dictLabel\":[\"待处理\"],\"dictValue\":[\"0\"],\"dictType\":[\"b_order_status\"],\"cssClass\":[\"\"],\"dictSort\":[\"1\"],\"listClass\":[\"warning\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"0 待办 1 已入款待充值 2 充值完成 3 充值失败 4 取消\"]}', '0', null, '2019-10-09 15:17:32');
INSERT INTO `sys_oper_log` VALUES ('266', '字典数据', '2', 'com.management.project.controller.system.dict.DictDataController.editSave()', '', '1', 'admin', '银商管理中心', '/system/dict/data/edit', '127.0.0.1', '内网IP', '{\"dictCode\":[\"113\"],\"dictLabel\":[\"充值失败\"],\"dictValue\":[\"3\"],\"dictType\":[\"b_order_status\"],\"cssClass\":[\"\"],\"dictSort\":[\"4\"],\"listClass\":[\"danger\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"0 待办 1 已入款待充值 2 充值完成 3 充值失败 4 取消\"]}', '0', null, '2019-10-09 15:17:41');
INSERT INTO `sys_oper_log` VALUES ('267', '字典数据', '2', 'com.management.project.controller.system.dict.DictDataController.editSave()', '', '1', 'admin', '银商管理中心', '/system/dict/data/edit', '127.0.0.1', '内网IP', '{\"dictCode\":[\"114\"],\"dictLabel\":[\"取消\"],\"dictValue\":[\"4\"],\"dictType\":[\"b_order_status\"],\"cssClass\":[\"\"],\"dictSort\":[\"5\"],\"listClass\":[\"info\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"0 待办 1 已入款待充值 2 充值完成 3 充值失败 4 取消\"]}', '0', null, '2019-10-09 15:18:15');
INSERT INTO `sys_oper_log` VALUES ('268', '字典数据', '2', 'com.management.project.controller.system.dict.DictDataController.editSave()', '', '1', 'admin', '银商管理中心', '/system/dict/data/edit', '127.0.0.1', '内网IP', '{\"dictCode\":[\"111\"],\"dictLabel\":[\"充值中\"],\"dictValue\":[\"1\"],\"dictType\":[\"b_order_status\"],\"cssClass\":[\"\"],\"dictSort\":[\"2\"],\"listClass\":[\"success\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"0 待办 1 已入款待充值 2 充值完成 3 充值失败 4 取消\"]}', '0', null, '2019-10-09 15:18:26');
INSERT INTO `sys_oper_log` VALUES ('269', '字典数据', '2', 'com.management.project.controller.system.dict.DictDataController.editSave()', '', '1', 'admin', '银商管理中心', '/system/dict/data/edit', '127.0.0.1', '内网IP', '{\"dictCode\":[\"112\"],\"dictLabel\":[\"充值完成\"],\"dictValue\":[\"2\"],\"dictType\":[\"b_order_status\"],\"cssClass\":[\"\"],\"dictSort\":[\"3\"],\"listClass\":[\"primary\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"0 待办 1 已入款待充值 2 充值完成 3 充值失败 4 取消\"]}', '0', null, '2019-10-09 15:18:32');
INSERT INTO `sys_oper_log` VALUES ('270', '字典数据', '2', 'com.management.project.controller.system.dict.DictDataController.editSave()', '', '1', 'admin', '银商管理中心', '/system/dict/data/edit', '127.0.0.1', '内网IP', '{\"dictCode\":[\"116\"],\"dictLabel\":[\"微信\"],\"dictValue\":[\"1\"],\"dictType\":[\"b_pay_type\"],\"cssClass\":[\"\"],\"dictSort\":[\"2\"],\"listClass\":[\"info\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"0 银行卡 1 微信 2 支付宝\"]}', '0', null, '2019-10-09 15:18:58');
INSERT INTO `sys_oper_log` VALUES ('271', '字典数据', '2', 'com.management.project.controller.system.dict.DictDataController.editSave()', '', '1', 'admin', '银商管理中心', '/system/dict/data/edit', '127.0.0.1', '内网IP', '{\"dictCode\":[\"117\"],\"dictLabel\":[\"支付宝\"],\"dictValue\":[\"2\"],\"dictType\":[\"b_pay_type\"],\"cssClass\":[\"\"],\"dictSort\":[\"3\"],\"listClass\":[\"info\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"0 银行卡 1 微信 2 支付宝\"]}', '0', null, '2019-10-09 15:19:05');
INSERT INTO `sys_oper_log` VALUES ('272', '用户充值订单', '2', 'com.management.project.controller.order.BRechargeOrderController.editSave()', '', '1', 'admin', '银商管理中心', '/order/bRechargeOrder/edit', '127.0.0.1', '内网IP', '{\"id\":[\"121212\"],\"gameCurrencyType\":[\"0\"],\"rmbAmount\":[\"280.00\"],\"gameAmount\":[\"150\"],\"state\":[\"2\"],\"account\":[\"1\"],\"payAccountCode\":[\"111111\"],\"recAccountCode\":[\"222222\"],\"remark\":[\"发的发\"]}', '0', null, '2019-10-09 15:54:15');
INSERT INTO `sys_oper_log` VALUES ('273', '用户充值订单', '2', 'com.management.project.controller.order.BRechargeOrderController.editSave()', '', '1', 'admin', '银商管理中心', '/order/bRechargeOrder/edit', '127.0.0.1', '内网IP', '{\"id\":[\"123456\"],\"gameCurrencyType\":[\"0\"],\"rmbAmount\":[\"100.00\"],\"gameAmount\":[\"100\"],\"state\":[\"2\"],\"account\":[\"0\"],\"payAccountCode\":[\"3333333333\"],\"recAccountCode\":[\"444444444444444\"],\"remark\":[\"二位无无若翁热污染无若无若无若翁绕弯儿翁绕弯儿翁热污染无若 \"]}', '0', null, '2019-10-09 16:15:34');
INSERT INTO `sys_oper_log` VALUES ('274', '代码生成', '8', 'com.management.project.controller.tool.gen.GenController.genCode()', '', '1', 'admin', '银商管理中心', '/tool/gen/genCode/b_cash_order', '127.0.0.1', '内网IP', '{}', '0', null, '2019-10-09 18:05:43');
INSERT INTO `sys_oper_log` VALUES ('275', '菜单管理', '1', 'com.management.project.controller.system.menu.MenuController.addSave()', '', '1', 'admin', '银商管理中心', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2013\"],\"menuType\":[\"C\"],\"menuName\":[\"提现订单管理\"],\"url\":[\"/order/bCashOrder\"],\"target\":[\"menuItem\"],\"perms\":[\"order:bCashOrder:view\"],\"orderNum\":[\"2\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2019-10-09 18:08:50');
INSERT INTO `sys_oper_log` VALUES ('276', '用户充值订单', '2', 'com.management.project.controller.order.BRechargeOrderController.editSave()', '', '1', 'admin', '银商管理中心', '/order/bRechargeOrder/edit', '127.0.0.1', '内网IP', '{\"id\":[\"123456\"],\"gameCurrencyType\":[\"0\"],\"rmbAmount\":[\"100.00\"],\"gameAmount\":[\"100\"],\"state\":[\"1\"],\"account\":[\"0\"],\"payAccountCode\":[\"3333333333\"],\"recAccountCode\":[\"444444444444444\"],\"remark\":[\"二位无无若翁热污染无若无若无若翁绕弯儿翁绕弯儿翁热污染无若 \"]}', '0', null, '2019-10-10 14:09:23');
INSERT INTO `sys_oper_log` VALUES ('277', '用户充值订单', '2', 'com.management.project.controller.order.BRechargeOrderController.editOrderStates()', '', '1', 'admin', '银商管理中心', '/order/bRechargeOrder/editOrderStates', '127.0.0.1', '内网IP', '{\"id\":[\"123456\"],\"state\":[\"2\"]}', '0', null, '2019-10-10 14:12:49');
INSERT INTO `sys_oper_log` VALUES ('278', '用户充值订单', '2', 'com.management.project.controller.order.BRechargeOrderController.editSave()', '', '1', 'admin', '银商管理中心', '/order/bRechargeOrder/edit', '127.0.0.1', '内网IP', '{\"id\":[\"1234567891\"],\"gameCurrencyType\":[\"0\"],\"rmbAmount\":[\"200.00\"],\"gameAmount\":[\"200\"],\"state\":[\"0\"],\"account\":[\"0\"],\"payAccountCode\":[\"\"],\"recAccountCode\":[\"\"],\"remark\":[\"\"]}', '0', null, '2019-10-10 14:13:22');
INSERT INTO `sys_oper_log` VALUES ('279', '用户充值订单', '2', 'com.management.project.controller.order.BRechargeOrderController.editSave()', '', '1', 'admin', '银商管理中心', '/order/bRechargeOrder/edit', '127.0.0.1', '内网IP', '{\"id\":[\"12345678\"],\"gameCurrencyType\":[\"0\"],\"rmbAmount\":[\"50.00\"],\"gameAmount\":[\"100\"],\"state\":[\"2\"],\"account\":[\"2\"],\"payAccountCode\":[\"3333333\"],\"recAccountCode\":[\"1111111\"],\"remark\":[\"fsfs\"]}', '0', null, '2019-10-10 14:13:41');
INSERT INTO `sys_oper_log` VALUES ('280', '用户充值订单', '2', 'com.management.project.controller.order.BRechargeOrderController.editSave()', '', '1', 'admin', '银商管理中心', '/order/bRechargeOrder/edit', '127.0.0.1', '内网IP', '{\"id\":[\"12345678\"],\"gameCurrencyType\":[\"0\"],\"rmbAmount\":[\"50.00\"],\"gameAmount\":[\"100\"],\"state\":[\"1\"],\"account\":[\"2\"],\"payAccountCode\":[\"3333333\"],\"recAccountCode\":[\"1111111\"],\"remark\":[\"fsfs\"]}', '0', null, '2019-10-10 14:13:55');
INSERT INTO `sys_oper_log` VALUES ('281', '用户充值订单', '2', 'com.management.project.controller.order.BRechargeOrderController.editOrderStates()', '', '1', 'admin', '银商管理中心', '/order/bRechargeOrder/editOrderStates', '127.0.0.1', '内网IP', '{\"id\":[\"12345678\"],\"state\":[\"4\"]}', '0', null, '2019-10-10 14:14:01');
INSERT INTO `sys_oper_log` VALUES ('282', '用户充值订单', '2', 'com.management.project.controller.order.BRechargeOrderController.editOrderStates()', '', '1', 'admin', '银商管理中心', '/order/bRechargeOrder/editOrderStates', '127.0.0.1', '内网IP', '{\"id\":[\"12345678\"],\"state\":[\"4\"]}', '0', null, '2019-10-10 14:14:14');
INSERT INTO `sys_oper_log` VALUES ('283', '修改充值订单状态', '2', 'com.management.project.controller.order.BRechargeOrderController.editOrderStates()', '', '1', 'admin', '银商管理中心', '/order/bRechargeOrder/editOrderStates', '127.0.0.1', '内网IP', '{\"id\":[\"1234567891\"],\"state\":[\"4\"]}', '0', null, '2019-10-10 14:15:22');
INSERT INTO `sys_oper_log` VALUES ('284', '菜单管理', '1', 'com.management.project.controller.system.menu.MenuController.addSave()', '', '1', 'admin', '银商管理中心', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"提款申请\"],\"url\":[\"/order/bCashOrderApply\"],\"target\":[\"menuItem\"],\"perms\":[\"order:bCashOrderApply:view\"],\"orderNum\":[\"6\"],\"icon\":[\"fa fa-fire-extinguisher\"],\"visible\":[\"0\"]}', '0', null, '2019-10-10 15:15:26');
INSERT INTO `sys_oper_log` VALUES ('285', '菜单管理', '3', 'com.management.project.controller.system.menu.MenuController.remove()', '', '1', 'admin', '银商管理中心', '/system/menu/remove/2016', '127.0.0.1', '内网IP', '{}', '0', null, '2019-10-10 15:15:37');
INSERT INTO `sys_oper_log` VALUES ('286', '菜单管理', '1', 'com.management.project.controller.system.menu.MenuController.addSave()', '', '1', 'admin', '银商管理中心', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"提款申请\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"6\"],\"icon\":[\"fa fa-fire-extinguisher\"],\"visible\":[\"0\"]}', '0', null, '2019-10-10 15:16:17');
INSERT INTO `sys_oper_log` VALUES ('287', '菜单管理', '1', 'com.management.project.controller.system.menu.MenuController.addSave()', '', '1', 'admin', '银商管理中心', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2017\"],\"menuType\":[\"C\"],\"menuName\":[\"申请提款\"],\"url\":[\"/order/bCashOrderApply\"],\"target\":[\"menuItem\"],\"perms\":[\"order:bCashOrderApply:view\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2019-10-10 15:19:21');
INSERT INTO `sys_oper_log` VALUES ('288', '菜单管理', '1', 'com.management.project.controller.system.menu.MenuController.addSave()', '', '1', 'admin', '银商管理中心', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2014\"],\"menuType\":[\"F\"],\"menuName\":[\"查询\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"order:bRechargeOrder:list\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2019-10-10 15:20:23');
INSERT INTO `sys_oper_log` VALUES ('289', '菜单管理', '1', 'com.management.project.controller.system.menu.MenuController.addSave()', '', '1', 'admin', '银商管理中心', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2014\"],\"menuType\":[\"F\"],\"menuName\":[\"添加\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"order:bRechargeOrder:add\"],\"orderNum\":[\"2\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2019-10-10 15:26:24');
INSERT INTO `sys_oper_log` VALUES ('290', '菜单管理', '1', 'com.management.project.controller.system.menu.MenuController.addSave()', '', '1', 'admin', '银商管理中心', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2014\"],\"menuType\":[\"F\"],\"menuName\":[\"修改 （状态改变）\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"order:bRechargeOrder:edit\"],\"orderNum\":[\"3\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2019-10-10 15:27:22');
INSERT INTO `sys_oper_log` VALUES ('291', '菜单管理', '1', 'com.management.project.controller.system.menu.MenuController.addSave()', '', '1', 'admin', '银商管理中心', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2014\"],\"menuType\":[\"F\"],\"menuName\":[\"删除\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"order:bRechargeOrder:remove\"],\"orderNum\":[\"4\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2019-10-10 15:27:55');
INSERT INTO `sys_oper_log` VALUES ('292', '代码生成', '8', 'com.management.project.controller.tool.gen.GenController.genCode()', '', '1', 'admin', '银商管理中心', '/tool/gen/genCode/b_customer_account', '127.0.0.1', '内网IP', '{}', '0', null, '2019-10-10 15:37:31');
INSERT INTO `sys_oper_log` VALUES ('293', '盘口管理', '3', 'com.management.project.controller.system.dept.DeptController.remove()', '', '1', 'admin', '银商管理中心', '/system/dept/remove/208', '127.0.0.1', '内网IP', '{}', '0', null, '2019-10-10 17:28:49');
INSERT INTO `sys_oper_log` VALUES ('294', '盘口管理', '3', 'com.management.project.controller.system.dept.DeptController.remove()', '', '1', 'admin', '银商管理中心', '/system/dept/remove/206', '127.0.0.1', '内网IP', '{}', '0', null, '2019-10-10 17:28:53');
INSERT INTO `sys_oper_log` VALUES ('295', '盘口管理', '1', 'com.management.project.controller.system.dept.DeptController.addSave()', '', '1', 'admin', '银商管理中心', '/system/dept/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"100\"],\"deptName\":[\"cp平台\"],\"rechargeUrl\":[\"\"],\"belong\":[\"\"],\"openTime\":[\"\"],\"closeTime\":[\"\"],\"status\":[\"0\"],\"appType\":[\"1\"]}', '0', null, '2019-10-10 17:29:54');
INSERT INTO `sys_oper_log` VALUES ('296', '盘口管理', '1', 'com.management.project.controller.system.dept.DeptController.addSave()', '', '1', 'admin', '银商管理中心', '/system/dept/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"100\"],\"deptName\":[\"qp平台\"],\"rechargeUrl\":[\"\"],\"belong\":[\"\"],\"openTime\":[\"\"],\"closeTime\":[\"\"],\"status\":[\"2\"],\"appType\":[\"2\"]}', '0', null, '2019-10-10 17:30:33');
INSERT INTO `sys_oper_log` VALUES ('297', '盘口管理', '1', 'com.management.project.controller.system.dept.DeptController.addSave()', '', '1', 'admin', '银商管理中心', '/system/dept/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"209\"],\"deptName\":[\"cp盘口1\"],\"rechargeUrl\":[\"\"],\"belong\":[\"\"],\"openTime\":[\"\"],\"closeTime\":[\"\"],\"status\":[\"1\"],\"appType\":[\"1\"]}', '0', null, '2019-10-10 17:31:15');
INSERT INTO `sys_oper_log` VALUES ('298', '盘口管理', '2', 'com.management.project.controller.system.dept.DeptController.editSave()', '', '1', 'admin', '银商管理中心', '/system/dept/edit', '127.0.0.1', '内网IP', '{\"deptId\":[\"209\"],\"parentId\":[\"100\"],\"parentName\":[\"银商系统\"],\"deptName\":[\"cp平台\"],\"appId\":[\"6000000409377154\"],\"appSecret\":[\"c0df75948adf45f8a55bf89ffe8e6ea7\"],\"rechargeUrl\":[\"\"],\"belong\":[\"\"],\"openTime\":[\"\"],\"closeTime\":[\"\"],\"status\":[\"1\"],\"appType\":[\"1\"]}', '0', null, '2019-10-10 17:31:25');
INSERT INTO `sys_oper_log` VALUES ('299', '盘口管理', '1', 'com.management.project.controller.system.dept.DeptController.addSave()', '', '1', 'admin', '银商管理中心', '/system/dept/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"210\"],\"deptName\":[\"qp盘口1\"],\"rechargeUrl\":[\"\"],\"belong\":[\"\"],\"openTime\":[\"\"],\"closeTime\":[\"\"],\"status\":[\"1\"],\"appType\":[\"2\"]}', '1', '盘口停用，不允许新增', '2019-10-10 17:32:09');
INSERT INTO `sys_oper_log` VALUES ('300', '盘口管理', '2', 'com.management.project.controller.system.dept.DeptController.editSave()', '', '1', 'admin', '银商管理中心', '/system/dept/edit', '127.0.0.1', '内网IP', '{\"deptId\":[\"210\"],\"parentId\":[\"100\"],\"parentName\":[\"银商系统\"],\"deptName\":[\"qp平台\"],\"appId\":[\"7000000636339315\"],\"appSecret\":[\"bcfec96d31384f209cb8e4e61afef210\"],\"rechargeUrl\":[\"\"],\"belong\":[\"\"],\"openTime\":[\"\"],\"closeTime\":[\"\"],\"status\":[\"1\"],\"appType\":[\"0\"]}', '0', null, '2019-10-10 17:32:24');
INSERT INTO `sys_oper_log` VALUES ('301', '盘口管理', '1', 'com.management.project.controller.system.dept.DeptController.addSave()', '', '1', 'admin', '银商管理中心', '/system/dept/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"210\"],\"deptName\":[\"棋牌盘口1\"],\"rechargeUrl\":[\"\"],\"belong\":[\"\"],\"openTime\":[\"\"],\"closeTime\":[\"\"],\"status\":[\"1\"],\"appType\":[\"0\"]}', '0', null, '2019-10-10 17:32:47');
INSERT INTO `sys_oper_log` VALUES ('302', '用户管理', '2', 'com.management.project.controller.system.user.UserController.editSave()', '', '1', 'admin', '银商管理中心', '/system/user/edit', '127.0.0.1', '内网IP', '{\"userId\":[\"108\",\"0\"],\"deptId\":[\"211\"],\"userName\":[\"test\"],\"dept.deptName\":[\"cp盘口1\"],\"phonenumber\":[\"18301403333\"],\"email\":[\"2@163.com\"],\"loginName\":[\"18301403333\"],\"sex\":[\"0\"],\"role\":[\"2\"],\"level\":[\"0\"],\"userParentName\":[\"\"],\"remark\":[\"\"],\"status\":[\"0\"],\"roleIds\":[\"2\"],\"postIds\":[\"\"],\"userParentId\":[\"0\"]}', '0', null, '2019-10-10 17:34:12');
INSERT INTO `sys_oper_log` VALUES ('303', '用户管理', '2', 'com.management.project.controller.system.user.UserController.editSave()', '', '1', 'admin', '银商管理中心', '/system/user/edit', '127.0.0.1', '内网IP', '{\"userId\":[\"108\",\"108\"],\"deptId\":[\"211\"],\"userName\":[\"test\"],\"dept.deptName\":[\"cp盘口1\"],\"phonenumber\":[\"18301403333\"],\"email\":[\"2@163.com\"],\"loginName\":[\"18301403333\"],\"sex\":[\"0\"],\"role\":[\"2\"],\"level\":[\"0\"],\"userParentName\":[\"\"],\"remark\":[\"\"],\"status\":[\"0\"],\"roleIds\":[\"2\"],\"postIds\":[\"3\"],\"userParentId\":[\"108\"]}', '0', null, '2019-10-10 17:36:23');
INSERT INTO `sys_oper_log` VALUES ('304', '角色管理', '1', 'com.management.project.controller.system.role.RoleController.addSave()', '', '1', 'admin', '银商管理中心', '/system/role/add', '127.0.0.1', '内网IP', '{\"roleName\":[\"cp 盘口用户\"],\"roleKey\":[\"cpRole1\"],\"roleSort\":[\"5\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"1,103,1016,1017,1018,1019,2013,2014,2019,2020,2021,2022,2015\"]}', '0', null, '2019-10-10 17:37:36');
INSERT INTO `sys_oper_log` VALUES ('305', '角色管理', '2', 'com.management.project.controller.system.role.RoleController.authDataScopeSave()', '', '1', 'admin', '银商管理中心', '/system/role/authDataScope', '127.0.0.1', '内网IP', '{\"roleId\":[\"103\"],\"roleName\":[\"cp 盘口用户\"],\"roleKey\":[\"cpRole1\"],\"dataScope\":[\"4\"],\"deptIds\":[\"\"]}', '0', null, '2019-10-10 17:37:59');
INSERT INTO `sys_oper_log` VALUES ('306', '用户管理', '2', 'com.management.project.controller.system.user.UserController.editSave()', '', '1', 'admin', '银商管理中心', '/system/user/edit', '127.0.0.1', '内网IP', '{\"userId\":[\"108\",\"0\"],\"deptId\":[\"211\"],\"userName\":[\"test\"],\"dept.deptName\":[\"cp盘口1\"],\"phonenumber\":[\"18301403333\"],\"email\":[\"2@163.com\"],\"loginName\":[\"18301403333\"],\"sex\":[\"0\"],\"role\":[\"103\"],\"level\":[\"0\"],\"userParentName\":[\"test\"],\"remark\":[\"\"],\"status\":[\"0\"],\"roleIds\":[\"103\"],\"postIds\":[\"3\"],\"userParentId\":[\"0\"]}', '0', null, '2019-10-10 17:39:07');
INSERT INTO `sys_oper_log` VALUES ('307', '盘口管理', '1', 'com.management.project.controller.system.dept.DeptController.addSave()', '', '1', 'admin', '银商管理中心', '/system/dept/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"209\"],\"deptName\":[\"cp盘口2\"],\"rechargeUrl\":[\"\"],\"belong\":[\"\"],\"openTime\":[\"\"],\"closeTime\":[\"\"],\"status\":[\"1\"],\"appType\":[\"1\"]}', '0', null, '2019-10-10 17:46:18');
INSERT INTO `sys_oper_log` VALUES ('308', '用户管理', '1', 'com.management.project.controller.system.user.UserController.addSave()', '', '1', 'admin', '银商管理中心', '/system/user/add', '127.0.0.1', '内网IP', '{\"deptId\":[\"213\"],\"userName\":[\"cp2\"],\"deptName\":[\"cp盘口2\"],\"phonenumber\":[\"13122223333\"],\"email\":[\"123@qq.com\"],\"loginName\":[\"cp2\"],\"password\":[\"123456\"],\"sex\":[\"0\"],\"role\":[\"103\"],\"level\":[\"1\"],\"parentId\":[\"0\"],\"parentName\":[\"\"],\"remark\":[\"\"],\"status\":[\"0\"],\"roleIds\":[\"103\"],\"postIds\":[\"\"],\"userParentId\":[\"0\"]}', '0', null, '2019-10-10 17:47:53');
INSERT INTO `sys_oper_log` VALUES ('309', '角色管理', '1', 'com.management.project.controller.system.role.RoleController.addSave()', '', '1', 'admin', '银商管理中心', '/system/role/add', '127.0.0.1', '内网IP', '{\"roleName\":[\"cp 盘口2\"],\"roleKey\":[\"cp2\"],\"roleSort\":[\"6\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"1,103,1016,1017,1018,1019,2013,2014,2019,2020,2021,2022,2015\"]}', '0', null, '2019-10-10 17:48:43');
INSERT INTO `sys_oper_log` VALUES ('310', '角色管理', '2', 'com.management.project.controller.system.role.RoleController.authDataScopeSave()', '', '1', 'admin', '银商管理中心', '/system/role/authDataScope', '127.0.0.1', '内网IP', '{\"roleId\":[\"104\"],\"roleName\":[\"cp 盘口2\"],\"roleKey\":[\"cp2\"],\"dataScope\":[\"4\"],\"deptIds\":[\"\"]}', '0', null, '2019-10-10 17:48:50');
INSERT INTO `sys_oper_log` VALUES ('311', '角色管理', '4', 'com.management.project.controller.system.role.RoleController.selectAuthUserAll()', '', '1', 'admin', '银商管理中心', '/system/role/authUser/selectAll', '127.0.0.1', '内网IP', '{\"roleId\":[\"104\"],\"userIds\":[\"109\"]}', '0', null, '2019-10-10 17:49:16');
INSERT INTO `sys_oper_log` VALUES ('312', '重置密码', '2', 'com.management.project.controller.system.user.UserController.resetPwd()', '', '1', 'admin', '银商管理中心', '/system/user/resetPwd/109', '127.0.0.1', '内网IP', '{}', '0', null, '2019-10-10 17:49:29');
INSERT INTO `sys_oper_log` VALUES ('313', '重置密码', '2', 'com.management.project.controller.system.user.UserController.resetPwd()', '', '1', 'admin', '银商管理中心', '/system/user/resetPwd', '127.0.0.1', '内网IP', '{\"userId\":[\"109\"],\"loginName\":[\"cp2\"],\"password\":[\"123456\"]}', '0', null, '2019-10-10 17:49:33');
INSERT INTO `sys_oper_log` VALUES ('314', '用户管理', '2', 'com.management.project.controller.system.user.UserController.editSave()', '', '1', 'admin', '银商管理中心', '/system/user/edit', '127.0.0.1', '内网IP', '{\"userId\":[\"109\",\"0\"],\"deptId\":[\"213\"],\"userName\":[\"cp2\"],\"dept.deptName\":[\"cp盘口2\"],\"phonenumber\":[\"13122223333\"],\"email\":[\"123@qq.com\"],\"loginName\":[\"cp2\"],\"sex\":[\"0\"],\"role\":[\"104\"],\"level\":[\"1\"],\"userParentName\":[\"\"],\"remark\":[\"\"],\"status\":[\"0\"],\"roleIds\":[\"104\"],\"postIds\":[\"\"],\"userParentId\":[\"0\"]}', '0', null, '2019-10-10 17:49:42');
INSERT INTO `sys_oper_log` VALUES ('315', '用户管理', '1', 'com.management.project.controller.system.user.UserController.addSave()', '', '1', 'admin', '银商管理中心', '/system/user/add', '127.0.0.1', '内网IP', '{\"deptId\":[\"213\"],\"userName\":[\"cp1\"],\"deptName\":[\"cp盘口2\"],\"phonenumber\":[\"13888888888\"],\"email\":[\"1223@qq.com\"],\"loginName\":[\"cp1\"],\"password\":[\"123456\"],\"sex\":[\"0\"],\"role\":[\"104\"],\"level\":[\"1\"],\"parentId\":[\"0\"],\"parentName\":[\"\"],\"remark\":[\"\"],\"status\":[\"0\"],\"roleIds\":[\"104\"],\"postIds\":[\"\"],\"userParentId\":[\"0\"]}', '0', null, '2019-10-10 17:51:35');
INSERT INTO `sys_oper_log` VALUES ('316', '角色管理', '4', 'com.management.project.controller.system.role.RoleController.selectAuthUserAll()', '', '1', 'admin', '银商管理中心', '/system/role/authUser/selectAll', '127.0.0.1', '内网IP', '{\"roleId\":[\"103\"],\"userIds\":[\"110\"]}', '0', null, '2019-10-10 17:51:47');
INSERT INTO `sys_oper_log` VALUES ('317', '角色管理', '1', 'com.management.project.controller.system.role.RoleController.addSave()', '', '1', 'admin', '银商管理中心', '/system/role/add', '127.0.0.1', '内网IP', '{\"roleName\":[\"cp平台1\"],\"roleKey\":[\"cpmanager\"],\"roleSort\":[\"7\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"1,103,1016,1017,1018,1019,2013,2014,2019,2020,2021,2022,2015\"]}', '0', null, '2019-10-10 17:55:43');
INSERT INTO `sys_oper_log` VALUES ('318', '角色管理', '2', 'com.management.project.controller.system.role.RoleController.authDataScopeSave()', '', '1', 'admin', '银商管理中心', '/system/role/authDataScope', '127.0.0.1', '内网IP', '{\"roleId\":[\"105\"],\"roleName\":[\"cp平台1\"],\"roleKey\":[\"cpmanager\"],\"dataScope\":[\"2\"],\"deptIds\":[\"100,209,213,211\"]}', '0', null, '2019-10-10 17:56:21');
INSERT INTO `sys_oper_log` VALUES ('319', '角色管理', '2', 'com.management.project.controller.system.role.RoleController.authDataScopeSave()', '', '1', 'admin', '银商管理中心', '/system/role/authDataScope', '127.0.0.1', '内网IP', '{\"roleId\":[\"105\"],\"roleName\":[\"cp平台1\"],\"roleKey\":[\"cpmanager\"],\"dataScope\":[\"2\"],\"deptIds\":[\"100,209,213,211\"]}', '0', null, '2019-10-10 17:56:30');
INSERT INTO `sys_oper_log` VALUES ('320', '角色管理', '2', 'com.management.project.controller.system.role.RoleController.authDataScopeSave()', '', '1', 'admin', '银商管理中心', '/system/role/authDataScope', '127.0.0.1', '内网IP', '{\"roleId\":[\"105\"],\"roleName\":[\"cp平台1\"],\"roleKey\":[\"cpmanager\"],\"dataScope\":[\"2\"],\"deptIds\":[\"100,209,213,211\"]}', '0', null, '2019-10-10 17:56:34');
INSERT INTO `sys_oper_log` VALUES ('321', '用户管理', '2', 'com.management.project.controller.system.user.UserController.editSave()', '', '1', 'admin', '银商管理中心', '/system/user/edit', '127.0.0.1', '内网IP', '{\"userId\":[\"110\",\"0\"],\"deptId\":[\"213\"],\"userName\":[\"cp1\"],\"dept.deptName\":[\"cp盘口2\"],\"phonenumber\":[\"13888888888\"],\"email\":[\"1223@qq.com\"],\"loginName\":[\"cp1\"],\"sex\":[\"0\"],\"role\":[\"105\"],\"level\":[\"1\"],\"userParentName\":[\"\"],\"remark\":[\"\"],\"status\":[\"0\"],\"roleIds\":[\"105\"],\"postIds\":[\"\"],\"userParentId\":[\"0\"]}', '0', null, '2019-10-10 17:57:32');
INSERT INTO `sys_oper_log` VALUES ('322', '菜单管理', '1', 'com.management.project.controller.system.menu.MenuController.addSave()', '', '1', 'admin', '银商管理中心', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2018\"],\"menuType\":[\"F\"],\"menuName\":[\"添加\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"order:bCashOrderApply:add\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2019-10-10 18:01:15');
INSERT INTO `sys_oper_log` VALUES ('323', '角色管理', '2', 'com.management.project.controller.system.role.RoleController.editSave()', '', '1', 'admin', '银商管理中心', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"105\"],\"roleName\":[\"cp平台1\"],\"roleKey\":[\"cpmanager\"],\"roleSort\":[\"7\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"1,103,1016,1017,1018,1019,2013,2014,2019,2020,2021,2022,2015,2017,2018,2023\"]}', '0', null, '2019-10-10 18:01:50');
INSERT INTO `sys_oper_log` VALUES ('324', '角色管理', '2', 'com.management.project.controller.system.role.RoleController.editSave()', '', '1', 'admin', '银商管理中心', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"105\"],\"roleName\":[\"cp平台\"],\"roleKey\":[\"cpmanager\"],\"roleSort\":[\"7\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"1,103,1016,1017,1018,1019,2013,2014,2019,2020,2021,2022,2015,2017,2018,2023\"]}', '0', null, '2019-10-10 18:02:41');
INSERT INTO `sys_oper_log` VALUES ('325', '角色管理', '2', 'com.management.project.controller.system.role.RoleController.editSave()', '', '1', 'admin', '银商管理中心', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"103\"],\"roleName\":[\"cp 盘口1\"],\"roleKey\":[\"cpRole1\"],\"roleSort\":[\"5\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"1,103,1016,1017,1018,1019,2013,2014,2019,2020,2021,2022,2015\"]}', '0', null, '2019-10-10 18:03:10');
INSERT INTO `sys_oper_log` VALUES ('326', '角色管理', '2', 'com.management.project.controller.system.role.RoleController.editSave()', '', '1', 'admin', '银商管理中心', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"103\"],\"roleName\":[\"cp 盘口1\"],\"roleKey\":[\"cpRole1\"],\"roleSort\":[\"5\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"1,103,1016,1017,1018,1019,2013,2014,2019,2020,2021,2022,2015\"]}', '0', null, '2019-10-10 18:03:10');
INSERT INTO `sys_oper_log` VALUES ('327', '角色管理', '2', 'com.management.project.controller.system.role.RoleController.authDataScopeSave()', '', '1', 'admin', '银商管理中心', '/system/role/authDataScope', '127.0.0.1', '内网IP', '{\"roleId\":[\"103\"],\"roleName\":[\"cp 盘口1\"],\"roleKey\":[\"cpRole1\"],\"dataScope\":[\"2\"],\"deptIds\":[\"100,209,211\"]}', '0', null, '2019-10-10 18:03:35');
INSERT INTO `sys_oper_log` VALUES ('328', '菜单管理', '1', 'com.management.project.controller.system.menu.MenuController.addSave()', '', '1', 'admin', '银商管理中心', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"客服管理\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"7\"],\"icon\":[\"fa fa-user-circle-o\"],\"visible\":[\"0\"]}', '0', null, '2019-10-10 20:12:16');
INSERT INTO `sys_oper_log` VALUES ('329', '菜单管理', '1', 'com.management.project.controller.system.menu.MenuController.addSave()', '', '1', 'admin', '银商管理中心', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2024\"],\"menuType\":[\"C\"],\"menuName\":[\"客服列表\"],\"url\":[\"/kf/bCustomerAccount\"],\"target\":[\"menuItem\"],\"perms\":[\"kf:bCustomerAccount:view\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2019-10-10 20:15:46');
INSERT INTO `sys_oper_log` VALUES ('330', '客服账户', '1', 'com.management.project.controller.kf.BCustomerAccountController.addSave()', '', '1', 'admin', '银商管理中心', '/kf/bCustomerAccount/add', '127.0.0.1', '内网IP', '{\"nickName\":[\"11\"],\"accountName\":[\"123\"],\"password\":[\"123\"],\"rePassword\":[\"123\"],\"creditBalance\":[\"11\"],\"cashBalance\":[\"11\"],\"gameCurrencyType\":[\"\"],\"gameCurrencyBalance\":[\"11\"],\"frozeAmount\":[\"11\"],\"createTime\":[\"\"],\"updateTime\":[\"\"]}', '1', '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'user_id\' doesn\'t have a default value\r\n### The error may involve com.management.project.mapper.mysql.kf.BCustomerAccountMapper.insertBCustomerAccount-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into b_customer_account    ( credit_balance,    cash_balance,        game_currency_balance,    froze_amount )           values ( ?,    ?,        ?,    ? )\r\n### Cause: java.sql.SQLException: Field \'user_id\' doesn\'t have a default value\n; Field \'user_id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'user_id\' doesn\'t have a default value', '2019-10-10 20:31:02');
INSERT INTO `sys_oper_log` VALUES ('331', '客服账户', '1', 'com.management.project.controller.kf.BCustomerAccountController.addSave()', '', '1', 'admin', '银商管理中心', '/kf/bCustomerAccount/add', '127.0.0.1', '内网IP', '{\"nickName\":[\"1234\"],\"accountName\":[\"1234\"],\"password\":[\"1234\"],\"rePassword\":[\"1234\"],\"creditBalance\":[\"11\"],\"cashBalance\":[\"11\"],\"gameCurrencyType\":[\"\"],\"gameCurrencyBalance\":[\"11\"],\"frozeAmount\":[\"\"],\"createTime\":[\"\"],\"updateTime\":[\"\"]}', '0', null, '2019-10-11 11:08:42');
INSERT INTO `sys_oper_log` VALUES ('332', '用户管理', '3', 'com.management.project.controller.system.user.UserController.remove()', '', '1', 'admin', '银商管理中心', '/system/user/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"111\"]}', '0', null, '2019-10-11 11:10:07');
INSERT INTO `sys_oper_log` VALUES ('333', '客服账户', '1', 'com.management.project.controller.kf.BCustomerAccountController.addSave()', '', '1', 'admin', '银商管理中心', '/kf/bCustomerAccount/add', '127.0.0.1', '内网IP', '{\"nickName\":[\"123\"],\"accountName\":[\"123\"],\"password\":[\"123\"],\"rePassword\":[\"123\"],\"creditBalance\":[\"123\"],\"cashBalance\":[\"11\"],\"gameCurrencyType\":[\"0\"],\"gameCurrencyBalance\":[\"11\"],\"frozeAmount\":[\"1\"],\"createTime\":[\"\"],\"updateTime\":[\"\"]}', '0', null, '2019-10-11 11:11:18');
INSERT INTO `sys_oper_log` VALUES ('334', '客服账户', '1', 'com.management.project.controller.kf.BCustomerAccountController.addSave()', '', '1', 'admin', '银商管理中心', '/kf/bCustomerAccount/add', '127.0.0.1', '内网IP', '{\"nickName\":[\"123\"],\"accountName\":[\"123\"],\"password\":[\"123\"],\"rePassword\":[\"123\"],\"creditBalance\":[\"123\"],\"cashBalance\":[\"123\"],\"gameCurrencyType\":[\"\"],\"gameCurrencyBalance\":[\"123\"],\"frozeAmount\":[\"1213\"],\"createTime\":[\"\"],\"updateTime\":[\"\"]}', '0', null, '2019-10-11 11:14:23');
INSERT INTO `sys_oper_log` VALUES ('335', '角色管理', '4', 'com.management.project.controller.system.role.RoleController.selectAuthUserAll()', '', '1', 'admin', '银商管理中心', '/system/role/authUser/selectAll', '127.0.0.1', '内网IP', '{\"roleId\":[\"105\"],\"userIds\":[\"113\"]}', '0', null, '2019-10-11 11:14:45');
INSERT INTO `sys_oper_log` VALUES ('336', '客服账户', '1', 'com.management.project.controller.kf.BCustomerAccountController.addSave()', '', '1', 'admin', '银商管理中心', '/kf/bCustomerAccount/add', '127.0.0.1', '内网IP', '{\"nickName\":[\"123\"],\"accountName\":[\"123\"],\"password\":[\"123\"],\"rePassword\":[\"123\"],\"creditBalance\":[\"123\"],\"cashBalance\":[\"123\"],\"gameCurrencyType\":[\"\"],\"gameCurrencyBalance\":[\"123\"],\"frozeAmount\":[\"1213\"],\"createTime\":[\"\"],\"updateTime\":[\"\"]}', '0', null, '2019-10-11 11:19:16');
INSERT INTO `sys_oper_log` VALUES ('337', '角色管理', '4', 'com.management.project.controller.system.role.RoleController.selectAuthUserAll()', '', '1', 'admin', '银商管理中心', '/system/role/authUser/selectAll', '127.0.0.1', '内网IP', '{\"roleId\":[\"105\"],\"userIds\":[\"114\"]}', '0', null, '2019-10-11 11:20:24');
INSERT INTO `sys_oper_log` VALUES ('338', '用户管理', '1', 'com.management.project.controller.system.user.UserController.addSave()', '', '1', 'admin', '银商管理中心', '/system/user/add', '127.0.0.1', '内网IP', '{\"deptId\":[\"211\"],\"userName\":[\"1234\"],\"deptName\":[\"cp盘口1\"],\"phonenumber\":[\"13122234444\"],\"email\":[\"1234@qq.com\"],\"loginName\":[\"1234\"],\"password\":[\"123456\"],\"sex\":[\"0\"],\"role\":[\"105\"],\"level\":[\"0\"],\"parentId\":[\"0\"],\"parentName\":[\"\"],\"remark\":[\"\"],\"status\":[\"0\"],\"roleIds\":[\"105\"],\"postIds\":[\"\"],\"userParentId\":[\"0\"]}', '0', null, '2019-10-11 11:38:44');
INSERT INTO `sys_oper_log` VALUES ('339', '客服账户', '1', 'com.management.project.controller.kf.BCustomerAccountController.addSave()', '', '1', 'admin', '银商管理中心', '/kf/bCustomerAccount/add', '127.0.0.1', '内网IP', '{\"nickName\":[\"123\"],\"accountName\":[\"123\"],\"password\":[\"123456\"],\"rePassword\":[\"123456\"],\"creditBalance\":[\"123\"],\"cashBalance\":[\"12\"],\"gameCurrencyType\":[\"\"],\"gameCurrencyBalance\":[\"12\"],\"frozeAmount\":[\"\"],\"createTime\":[\"\"],\"updateTime\":[\"\"]}', '0', null, '2019-10-11 11:40:59');
INSERT INTO `sys_oper_log` VALUES ('340', '用户管理', '1', 'com.management.project.controller.system.user.UserController.addSave()', '', '1', 'admin', '银商管理中心', '/system/user/add', '127.0.0.1', '内网IP', '{\"deptId\":[\"211\"],\"userName\":[\"11\"],\"deptName\":[\"cp盘口1\"],\"phonenumber\":[\"13122234445\"],\"email\":[\"11@qq.com\"],\"loginName\":[\"11\"],\"password\":[\"123456\"],\"sex\":[\"0\"],\"role\":[\"104\"],\"level\":[\"0\"],\"parentId\":[\"0\"],\"parentName\":[\"\"],\"remark\":[\"\"],\"status\":[\"0\"],\"roleIds\":[\"104\"],\"postIds\":[\"\"],\"userParentId\":[\"0\"]}', '0', null, '2019-10-11 14:02:32');
INSERT INTO `sys_oper_log` VALUES ('341', '用户管理', '1', 'com.management.project.controller.system.user.UserController.addSave()', '', '1', 'admin', '银商管理中心', '/system/user/add', '127.0.0.1', '内网IP', '{\"deptId\":[\"211\"],\"userName\":[\"12\"],\"deptName\":[\"cp盘口1\"],\"phonenumber\":[\"13122234446\"],\"email\":[\"12@qq.com\"],\"loginName\":[\"12\"],\"password\":[\"123456\"],\"sex\":[\"0\"],\"role\":[\"103\"],\"level\":[\"0\"],\"parentId\":[\"0\"],\"parentName\":[\"\"],\"remark\":[\"\"],\"status\":[\"0\"],\"roleIds\":[\"103\"],\"postIds\":[\"\"],\"userParentId\":[\"0\"]}', '0', null, '2019-10-11 14:03:27');
INSERT INTO `sys_oper_log` VALUES ('342', '客服账户', '1', 'com.management.project.controller.kf.BCustomerAccountController.addSave()', '', '1', 'admin', '银商管理中心', '/kf/bCustomerAccount/add', '127.0.0.1', '内网IP', '{\"nickName\":[\"kf1\"],\"accountName\":[\"kf1\"],\"password\":[\"123456\"],\"rePassword\":[\"123456\"],\"creditBalance\":[\"11\"],\"cashBalance\":[\"11\"],\"gameCurrencyType\":[\"\"],\"gameCurrencyBalance\":[\"\"],\"frozeAmount\":[\"\"],\"createTime\":[\"\"],\"updateTime\":[\"\"]}', '0', null, '2019-10-11 14:09:12');
INSERT INTO `sys_oper_log` VALUES ('343', '角色管理', '4', 'com.management.project.controller.system.role.RoleController.selectAuthUserAll()', '', '1', 'admin', '银商管理中心', '/system/role/authUser/selectAll', '127.0.0.1', '内网IP', '{\"roleId\":[\"105\"],\"userIds\":[\"119\"]}', '0', null, '2019-10-11 14:10:15');
INSERT INTO `sys_oper_log` VALUES ('344', '代码生成', '8', 'com.management.project.controller.tool.gen.GenController.genCode()', '', '1', 'admin', '银商管理中心', '/tool/gen/genCode/b_exchange_rate', '127.0.0.1', '内网IP', '{}', '0', null, '2019-10-11 14:26:16');
INSERT INTO `sys_oper_log` VALUES ('345', '客服账户', '1', 'com.management.project.controller.kf.BCustomerAccountController.addSave()', '', '1', 'admin', '银商管理中心', '/kf/bCustomerAccount/add', '127.0.0.1', '内网IP', '{\"deptId\":[\"213\"],\"nickName\":[\"44\"],\"accountName\":[\"44\"],\"password\":[\"444444\"],\"rePassword\":[\"444444\"],\"deptName\":[\"cp盘口2\"],\"creditBalance\":[\"44\"],\"cashBalance\":[\"44\"],\"gameCurrencyBalance\":[\"\"],\"frozeAmount\":[\"\"],\"gameCurrencyType\":[\"\"],\"rmb\":[\"100\"],\"xnb\":[\"120\"]}', '0', null, '2019-10-11 15:48:09');
INSERT INTO `sys_oper_log` VALUES ('346', '客服账户', '1', 'com.management.project.controller.kf.BCustomerAccountController.addSave()', '', '1', 'admin', '银商管理中心', '/kf/bCustomerAccount/add', '127.0.0.1', '内网IP', '{\"nickName\":[\"555\"],\"accountName\":[\"555\"],\"password\":[\"555555\"],\"rePassword\":[\"555555\"],\"creditBalance\":[\"55\"],\"cashBalance\":[\"55\"],\"gameCurrencyBalance\":[\"55\"],\"frozeAmount\":[\"\"],\"gameCurrencyType\":[\"\"],\"rmb\":[\"10\"],\"xnb\":[\"12.3\"]}', '0', null, '2019-10-11 16:00:33');
INSERT INTO `sys_oper_log` VALUES ('347', '客服账户', '1', 'com.management.project.controller.kf.BCustomerAccountController.addSave()', '', '1', 'admin', '银商管理中心', '/kf/bCustomerAccount/add', '127.0.0.1', '内网IP', '{\"nickName\":[\"66\"],\"accountName\":[\"66\"],\"password\":[\"666666\"],\"rePassword\":[\"666666\"],\"creditBalance\":[\"66\"],\"cashBalance\":[\"66\"],\"gameCurrencyBalance\":[\"6\"],\"frozeAmount\":[\"\"],\"gameCurrencyType\":[\"\"],\"rmb\":[\"10\"],\"xnb\":[\"14\"]}', '0', null, '2019-10-11 16:03:05');
INSERT INTO `sys_oper_log` VALUES ('348', '菜单管理', '1', 'com.management.project.controller.system.menu.MenuController.addSave()', '', '1', 'admin', '银商管理中心', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2025\"],\"menuType\":[\"F\"],\"menuName\":[\"查询\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"kf:bCustomerAccount:list\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2019-10-11 16:06:32');
INSERT INTO `sys_oper_log` VALUES ('349', '菜单管理', '1', 'com.management.project.controller.system.menu.MenuController.addSave()', '', '1', 'admin', '银商管理中心', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2025\"],\"menuType\":[\"F\"],\"menuName\":[\"保存\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"kf:bCustomerAccount:add\"],\"orderNum\":[\"2\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2019-10-11 16:07:09');
INSERT INTO `sys_oper_log` VALUES ('350', '菜单管理', '1', 'com.management.project.controller.system.menu.MenuController.addSave()', '', '1', 'admin', '银商管理中心', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2025\"],\"menuType\":[\"F\"],\"menuName\":[\"修改\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"kf:bCustomerAccount:edit\"],\"orderNum\":[\"3\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2019-10-11 16:07:37');
INSERT INTO `sys_oper_log` VALUES ('351', '菜单管理', '1', 'com.management.project.controller.system.menu.MenuController.addSave()', '', '1', 'admin', '银商管理中心', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2025\"],\"menuType\":[\"F\"],\"menuName\":[\"删除\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"kf:bCustomerAccount:remove\"],\"orderNum\":[\"4\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2019-10-11 16:08:07');
INSERT INTO `sys_oper_log` VALUES ('352', '字典类型', '1', 'com.management.project.controller.system.dict.DictTypeController.addSave()', '', '1', 'admin', '银商管理中心', '/system/dict/add', '127.0.0.1', '内网IP', '{\"dictName\":[\"虚拟币类型\"],\"dictType\":[\"b_exchange_type\"],\"status\":[\"0\"],\"remark\":[\"0  金币   1  积分\"]}', '0', null, '2019-10-11 16:12:56');
INSERT INTO `sys_oper_log` VALUES ('353', '字典数据', '1', 'com.management.project.controller.system.dict.DictDataController.addSave()', '', '1', 'admin', '银商管理中心', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"金币\"],\"dictValue\":[\"0\"],\"dictType\":[\"b_exchange_type\"],\"cssClass\":[\"\"],\"dictSort\":[\"1\"],\"listClass\":[\"\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"0 金币  1 积分\"]}', '0', null, '2019-10-11 16:13:34');
INSERT INTO `sys_oper_log` VALUES ('354', '字典数据', '1', 'com.management.project.controller.system.dict.DictDataController.addSave()', '', '1', 'admin', '银商管理中心', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"积分\"],\"dictValue\":[\"1\"],\"dictType\":[\"b_exchange_type\"],\"cssClass\":[\"\"],\"dictSort\":[\"2\"],\"listClass\":[\"\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"0 金币  1 积分\"]}', '0', null, '2019-10-11 16:13:57');
INSERT INTO `sys_oper_log` VALUES ('355', '客服账户', '1', 'com.management.project.controller.kf.BCustomerAccountController.addSave()', '', '1', 'admin', '银商管理中心', '/kf/bCustomerAccount/add', '127.0.0.1', '内网IP', '{\"nickName\":[\"kf1\"],\"accountName\":[\"kf1\"],\"password\":[\"123456\"],\"rePassword\":[\"123456\"],\"creditBalance\":[\"50\"],\"cashBalance\":[\"50\"],\"gameCurrencyBalance\":[\"\"],\"frozeAmount\":[\"\"],\"gameCurrencyType\":[\"0\"],\"rmb\":[\"1\"],\"xnb\":[\"1.2\"]}', '0', null, '2019-10-11 18:01:28');
INSERT INTO `sys_oper_log` VALUES ('356', '客服账户', '1', 'com.management.project.controller.kf.BCustomerAccountController.addSave()', '', '1', 'admin', '银商管理中心', '/kf/bCustomerAccount/add', '127.0.0.1', '内网IP', '{\"nickName\":[\"kf1\"],\"accountName\":[\"kf1\"],\"password\":[\"123456\"],\"rePassword\":[\"123456\"],\"creditBalance\":[\"11\"],\"cashBalance\":[\"11\"],\"gameCurrencyBalance\":[\"\"],\"frozeAmount\":[\"\"],\"gameCurrencyType\":[\"0\"],\"rmb\":[\"1\"],\"xnb\":[\"1.2\"]}', '0', null, '2019-10-11 18:18:30');
INSERT INTO `sys_oper_log` VALUES ('357', '客服账户', '2', 'com.management.project.controller.kf.BCustomerAccountController.editSave()', '', '1', 'admin', '银商管理中心', '/kf/bCustomerAccount/edit', '127.0.0.1', '内网IP', '{\"userId\":[\"126\"],\"creditBalance\":[\"50.00\"],\"cashBalance\":[\"50.00\"],\"gameCurrencyType\":[\"0\"],\"gameCurrencyBalance\":[\"50.00\"],\"frozeAmount\":[\"0.00\"]}', '0', null, '2019-10-12 10:29:48');
INSERT INTO `sys_oper_log` VALUES ('358', '代码生成', '8', 'com.management.project.controller.tool.gen.GenController.genCode()', '', '1', 'admin', '银商管理中心', '/tool/gen/genCode/b_account_log', '127.0.0.1', '内网IP', '{}', '0', null, '2019-10-12 13:48:03');
INSERT INTO `sys_oper_log` VALUES ('359', '客服账户', '1', 'com.management.project.controller.kf.BCustomerAccountController.addSave()', '', '1', 'admin', '银商管理中心', '/kf/bCustomerAccount/add', '127.0.0.1', '内网IP', '{\"nickName\":[\"test\"],\"accountName\":[\"test\"],\"password\":[\"123456\"],\"rePassword\":[\"123456\"],\"creditBalance\":[\"12\"],\"cashBalance\":[\"12\"],\"gameCurrencyBalance\":[\"12\"],\"frozeAmount\":[\"\"],\"gameCurrencyType\":[\"0\"],\"rmb\":[\"1\"],\"xnb\":[\"1.2\"]}', '0', null, '2019-10-12 14:04:17');
INSERT INTO `sys_oper_log` VALUES ('360', '客服账户', '3', 'com.management.project.controller.kf.BCustomerAccountController.remove()', '', '1', 'admin', '银商管理中心', '/kf/bCustomerAccount/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"128\"]}', '0', null, '2019-10-12 14:04:38');
INSERT INTO `sys_oper_log` VALUES ('361', '菜单管理', '1', 'com.management.project.controller.system.menu.MenuController.addSave()', '', '1', 'admin', '银商管理中心', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2025\"],\"menuType\":[\"F\"],\"menuName\":[\"客服详情查询\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"kf:bAccountLog:view\"],\"orderNum\":[\"5\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2019-10-12 15:15:17');
INSERT INTO `sys_oper_log` VALUES ('362', '菜单管理', '1', 'com.management.project.controller.system.menu.MenuController.addSave()', '', '1', 'admin', '银商管理中心', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2025\"],\"menuType\":[\"F\"],\"menuName\":[\"客服详情列表\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"kf:bAccountLog:list\"],\"orderNum\":[\"6\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2019-10-12 15:15:52');
INSERT INTO `sys_oper_log` VALUES ('363', '账户提现订单', '1', 'com.management.project.controller.order.BCashOrderController.addSave()', '', '1', 'admin', '银商管理中心', '/order/bCashOrder/add', '127.0.0.1', '内网IP', '{\"userId\":[\"1\"],\"marketId\":[\"9\"],\"pid\":[\"\"],\"cashAmount\":[\"60\"],\"balance\":[\"365.00\"],\"state\":[\"\"],\"recAccountType\":[\"\"],\"recAccountCode\":[\"\"],\"recBankName\":[\"\"],\"recOpenBank\":[\"\"],\"payBankName\":[\"\"],\"payAaccountCode\":[\"\"],\"remark\":[\"\"],\"createTime\":[\"\"],\"payTime\":[\"\"]}', '1', '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\r\n### The error may involve com.management.project.mapper.mysql.order.BCashOrderMapper.insertBCashOrder-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into b_cash_order    ( user_id,    market_id,        cash_amount,    balance )           values ( ?,    ?,        ?,    ? )\r\n### Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\n; Field \'id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'id\' doesn\'t have a default value', '2019-10-12 16:05:14');
INSERT INTO `sys_oper_log` VALUES ('364', '账户提现订单', '1', 'com.management.project.controller.order.BCashOrderController.addSave()', '', '1', 'admin', '银商管理中心', '/order/bCashOrder/add', '127.0.0.1', '内网IP', '{\"userId\":[\"1\"],\"marketId\":[\"9\"],\"pid\":[\"\"],\"cashAmount\":[\"56\"],\"balance\":[\"365.00\"],\"state\":[\"\"],\"recAccountType\":[\"\"],\"recAccountCode\":[\"\"],\"recBankName\":[\"\"],\"recOpenBank\":[\"\"],\"payBankName\":[\"\"],\"payAaccountCode\":[\"\"],\"remark\":[\"\"],\"createTime\":[\"\"],\"payTime\":[\"\"]}', '1', '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'parent_id\' doesn\'t have a default value\r\n### The error may involve com.management.project.mapper.mysql.order.BCashOrderMapper.insertBCashOrder-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into b_cash_order    ( id,    user_id,    market_id,        cash_amount,    balance )           values ( ?,    ?,    ?,        ?,    ? )\r\n### Cause: java.sql.SQLException: Field \'parent_id\' doesn\'t have a default value\n; Field \'parent_id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'parent_id\' doesn\'t have a default value', '2019-10-12 16:09:16');
INSERT INTO `sys_oper_log` VALUES ('365', '账户提现订单', '1', 'com.management.project.controller.order.BCashOrderController.addSave()', '', '1', 'admin', '银商管理中心', '/order/bCashOrder/add', '127.0.0.1', '内网IP', '{\"userId\":[\"1\"],\"marketId\":[\"9\"],\"pid\":[\"0\"],\"cashAmount\":[\"65\"],\"balance\":[\"365.00\"],\"state\":[\"\"],\"recAccountType\":[\"\"],\"recAccountCode\":[\"\"],\"recBankName\":[\"\"],\"recOpenBank\":[\"\"],\"payBankName\":[\"\"],\"payAaccountCode\":[\"\"],\"remark\":[\"\"],\"createTime\":[\"\"],\"payTime\":[\"\"]}', '1', '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'parent_id\' doesn\'t have a default value\r\n### The error may involve com.management.project.mapper.mysql.order.BCashOrderMapper.insertBCashOrder-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into b_cash_order    ( id,    user_id,    market_id,        cash_amount,    balance )           values ( ?,    ?,    ?,        ?,    ? )\r\n### Cause: java.sql.SQLException: Field \'parent_id\' doesn\'t have a default value\n; Field \'parent_id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'parent_id\' doesn\'t have a default value', '2019-10-12 16:11:27');
INSERT INTO `sys_oper_log` VALUES ('366', '账户提现订单', '1', 'com.management.project.controller.order.BCashOrderController.addSave()', '', '1', 'admin', '银商管理中心', '/order/bCashOrder/add', '127.0.0.1', '内网IP', '{\"userId\":[\"1\"],\"marketId\":[\"9\"],\"pid\":[\"0\"],\"cashAmount\":[\"65\"],\"balance\":[\"365.00\"],\"state\":[\"\"],\"recAccountType\":[\"\"],\"recAccountCode\":[\"\"],\"recBankName\":[\"\"],\"recOpenBank\":[\"\"],\"payBankName\":[\"\"],\"payAaccountCode\":[\"\"],\"remark\":[\"\"],\"createTime\":[\"\"],\"payTime\":[\"\"]}', '1', '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'parent_id\' doesn\'t have a default value\r\n### The error may involve com.management.project.mapper.mysql.order.BCashOrderMapper.insertBCashOrder-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into b_cash_order    ( id,    user_id,    market_id,        cash_amount,    balance )           values ( ?,    ?,    ?,        ?,    ? )\r\n### Cause: java.sql.SQLException: Field \'parent_id\' doesn\'t have a default value\n; Field \'parent_id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'parent_id\' doesn\'t have a default value', '2019-10-12 16:17:34');
INSERT INTO `sys_oper_log` VALUES ('367', '账户提现订单', '1', 'com.management.project.controller.order.BCashOrderController.addSave()', '', '1', 'admin', '银商管理中心', '/order/bCashOrder/add', '127.0.0.1', '内网IP', '{\"userId\":[\"1\"],\"marketId\":[\"9\"],\"pid\":[\"0\"],\"cashAmount\":[\"\"],\"balance\":[\"365.00\"],\"state\":[\"\"],\"recAccountType\":[\"0\"],\"recAccountCode\":[\"123456\"],\"recBankName\":[\"\"],\"recOpenBank\":[\"\"],\"payBankName\":[\"\"],\"payAaccountCode\":[\"\"],\"remark\":[\"\"],\"createTime\":[\"\"],\"payTime\":[\"\"]}', '0', null, '2019-10-12 16:20:12');
INSERT INTO `sys_oper_log` VALUES ('368', '账用户提现申请订单', '2', 'com.management.project.controller.order.BCashOrderApplyController.editSave()', '', '1', 'admin', '银商管理中心', '/order/bCashOrderApply/edit', '127.0.0.1', '内网IP', '{\"id\":[\"20191012161949467037\"],\"state\":[\"4\"]}', '0', null, '2019-10-12 16:27:02');
INSERT INTO `sys_oper_log` VALUES ('369', '字典类型', '1', 'com.management.project.controller.system.dict.DictTypeController.addSave()', '', '1', 'admin', '银商管理中心', '/system/dict/add', '127.0.0.1', '内网IP', '{\"dictName\":[\"提现订单状态\"],\"dictType\":[\"b_cashOrder_status\"],\"status\":[\"0\"],\"remark\":[\"状态[0:审核中 1:通过待汇款 2:审核未通过 3:提现完成 4 订单取消]\"]}', '0', null, '2019-10-12 17:01:53');
INSERT INTO `sys_oper_log` VALUES ('370', '字典数据', '1', 'com.management.project.controller.system.dict.DictDataController.addSave()', '', '1', 'admin', '银商管理中心', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"申请中\"],\"dictValue\":[\"0\"],\"dictType\":[\"b_cashOrder_status\"],\"cssClass\":[\"\"],\"dictSort\":[\"1\"],\"listClass\":[\"\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"状态[0:审核中 1:通过待汇款 2:审核未通过 3:提现完成 4 订单取消]\"]}', '0', null, '2019-10-12 17:02:19');
INSERT INTO `sys_oper_log` VALUES ('371', '字典数据', '1', 'com.management.project.controller.system.dict.DictDataController.addSave()', '', '1', 'admin', '银商管理中心', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"待汇款\"],\"dictValue\":[\"1\"],\"dictType\":[\"b_cashOrder_status\"],\"cssClass\":[\"\"],\"dictSort\":[\"2\"],\"listClass\":[\"\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"状态[0:审核中 1:通过待汇款 2:审核未通过 3:提现完成 4 订单取消]\"]}', '0', null, '2019-10-12 17:02:46');
INSERT INTO `sys_oper_log` VALUES ('372', '字典数据', '1', 'com.management.project.controller.system.dict.DictDataController.addSave()', '', '1', 'admin', '银商管理中心', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"未通过\"],\"dictValue\":[\"2\"],\"dictType\":[\"b_cashOrder_status\"],\"cssClass\":[\"\"],\"dictSort\":[\"3\"],\"listClass\":[\"\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"状态[0:审核中 1:通过待汇款 2:审核未通过 3:提现完成 4 订单取消]\"]}', '0', null, '2019-10-12 17:03:04');
INSERT INTO `sys_oper_log` VALUES ('373', '字典数据', '1', 'com.management.project.controller.system.dict.DictDataController.addSave()', '', '1', 'admin', '银商管理中心', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"提现完成\"],\"dictValue\":[\"3\"],\"dictType\":[\"b_cashOrder_status\"],\"cssClass\":[\"\"],\"dictSort\":[\"4\"],\"listClass\":[\"\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"状态[0:审核中 1:通过待汇款 2:审核未通过 3:提现完成 4 订单取消]\"]}', '0', null, '2019-10-12 17:03:24');
INSERT INTO `sys_oper_log` VALUES ('374', '字典数据', '1', 'com.management.project.controller.system.dict.DictDataController.addSave()', '', '1', 'admin', '银商管理中心', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"订单取消\"],\"dictValue\":[\"4\"],\"dictType\":[\"b_cashOrder_status\"],\"cssClass\":[\"\"],\"dictSort\":[\"5\"],\"listClass\":[\"\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"状态[0:审核中 1:通过待汇款 2:审核未通过 3:提现完成 4 订单取消]\"]}', '0', null, '2019-10-12 17:03:43');
INSERT INTO `sys_oper_log` VALUES ('375', '菜单管理', '1', 'com.management.project.controller.system.menu.MenuController.addSave()', '', '1', 'admin', '银商管理中心', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2018\"],\"menuType\":[\"F\"],\"menuName\":[\"编辑\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"order:bCashOrderApply:edit\"],\"orderNum\":[\"2\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2019-10-12 17:36:21');
INSERT INTO `sys_oper_log` VALUES ('376', '菜单管理', '2', 'com.management.project.controller.system.menu.MenuController.editSave()', '', '1', 'admin', '银商管理中心', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2032\"],\"parentId\":[\"2018\"],\"menuType\":[\"F\"],\"menuName\":[\"编辑（取消申请）\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"order:bCashOrderApply:edit\"],\"orderNum\":[\"2\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '0', null, '2019-10-12 17:36:46');
INSERT INTO `sys_oper_log` VALUES ('377', '账户提现订单', '1', 'com.management.project.controller.order.BCashOrderController.addSave()', '', '1', 'admin', '银商管理中心', '/order/bCashOrder/add', '127.0.0.1', '内网IP', '{\"userId\":[\"1\"],\"marketId\":[\"9\"],\"pid\":[\"0\"],\"cashAmount\":[\"50\"],\"balance\":[\"365.00\"],\"state\":[\"\"],\"recAccountType\":[\"0\"],\"recAccountCode\":[\"123456789\"],\"recBankName\":[\"\"],\"recOpenBank\":[\"\"],\"payBankName\":[\"\"],\"payAaccountCode\":[\"\"],\"remark\":[\"\"],\"createTime\":[\"\"],\"payTime\":[\"\"]}', '0', null, '2019-10-14 09:37:04');
INSERT INTO `sys_oper_log` VALUES ('378', '账户提现订单', '2', 'com.management.project.controller.order.BCashOrderController.editSave()', '', '1', 'admin', '银商管理中心', '/order/bCashOrder/edit', '127.0.0.1', '内网IP', '{\"id\":[\"20191014093653281771\"],\"state\":[\"1\"]}', '0', null, '2019-10-14 10:36:10');
INSERT INTO `sys_oper_log` VALUES ('379', '账用户提现申请订单', '2', 'com.management.project.controller.order.BCashOrderApplyController.editSave()', '', '1', 'admin', '银商管理中心', '/order/bCashOrderApply/edit', '127.0.0.1', '内网IP', '{\"id\":[\"20191014093653281771\"],\"state\":[\"3\"]}', '1', '', '2019-10-14 10:37:25');
INSERT INTO `sys_oper_log` VALUES ('380', '账户提现订单', '1', 'com.management.project.controller.order.BCashOrderController.addSave()', '', '1', 'admin', '银商管理中心', '/order/bCashOrder/add', '127.0.0.1', '内网IP', '{\"userId\":[\"1\"],\"marketId\":[\"9\"],\"pid\":[\"0\"],\"cashAmount\":[\"50\"],\"balance\":[\"365.00\"],\"recAccountType\":[\"0\"],\"recAccountCode\":[\"234343234\"],\"recBankName\":[\"fsdf\"],\"recOpenBank\":[\"fsf\"],\"remark\":[\"fdsfa\"]}', '0', null, '2019-10-14 11:21:47');
INSERT INTO `sys_oper_log` VALUES ('381', '账户提现订单', '2', 'com.management.project.controller.order.BCashOrderController.editSave()', '', '1', 'admin', '银商管理中心', '/order/bCashOrder/edit', '127.0.0.1', '内网IP', '{\"id\":[\"20191014112143991572\"],\"state\":[\"1\"]}', '0', null, '2019-10-14 11:22:01');
INSERT INTO `sys_oper_log` VALUES ('382', '账户提现订单', '2', 'com.management.project.controller.order.BCashOrderController.editSave()', '', '1', 'admin', '银商管理中心', '/order/bCashOrder/edit', '127.0.0.1', '内网IP', '{\"id\":[\"20191014112143991572\"],\"userId\":[\"1\"],\"marketId\":[\"9\"],\"cashAmount\":[\"50.00\"],\"balance\":[\"365.00\"],\"recAccountCode\":[\"234343234\"],\"recBankName\":[\"fsdf\"],\"recOpenBank\":[\"fsf\"],\"payBankName\":[\"上帝银行\"],\"payAaccountCode\":[\"88888888888888888\"],\"remark\":[\"fdsfa\"]}', '1', '', '2019-10-14 14:25:16');
INSERT INTO `sys_oper_log` VALUES ('383', '账户提现订单', '2', 'com.management.project.controller.order.BCashOrderController.editSave()', '', '1', 'admin', '银商管理中心', '/order/bCashOrder/edit', '127.0.0.1', '内网IP', '{\"id\":[\"20191014112143991572\"],\"userId\":[\"1\"],\"marketId\":[\"9\"],\"cashAmount\":[\"50.00\"],\"balance\":[\"365.00\"],\"recAccountCode\":[\"234343234\"],\"recBankName\":[\"fsdf\"],\"recOpenBank\":[\"fsf\"],\"payBankName\":[\"上帝银行\"],\"payAaccountCode\":[\"88888888888888888\"],\"remark\":[\"fdsfa\"]}', '1', '', '2019-10-14 14:29:16');
INSERT INTO `sys_oper_log` VALUES ('384', '账户提现订单', '2', 'com.management.project.controller.order.BCashOrderController.editSave()', '', '1', 'admin', '银商管理中心', '/order/bCashOrder/edit', '127.0.0.1', '内网IP', '{\"id\":[\"20191014112143991572\"],\"userId\":[\"1\"],\"marketId\":[\"9\"],\"cashAmount\":[\"50.00\"],\"balance\":[\"365.00\"],\"recAccountCode\":[\"234343234\"],\"recBankName\":[\"fsdf\"],\"recOpenBank\":[\"fsf\"],\"payBankName\":[\"上帝银行\"],\"payAaccountCode\":[\"88888888888888888\"],\"state\":[\"5\"],\"remark\":[\"fdsfa\"]}', '0', null, '2019-10-14 14:31:40');
INSERT INTO `sys_oper_log` VALUES ('385', '账户提现订单', '2', 'com.management.project.controller.order.BCashOrderController.editSave()', '', '1', 'admin', '银商管理中心', '/order/bCashOrder/edit', '127.0.0.1', '内网IP', '{\"id\":[\"20191014112143991572\"],\"userId\":[\"1\"],\"marketId\":[\"9\"],\"cashAmount\":[\"50.00\"],\"balance\":[\"365.00\"],\"recAccountCode\":[\"234343234\"],\"recBankName\":[\"fsdf\"],\"recOpenBank\":[\"fsf\"],\"payBankName\":[\"上帝银行\"],\"payAaccountCode\":[\"88888888888888888\"],\"state\":[\"5\"],\"remark\":[\"fdsfa\"]}', '0', null, '2019-10-14 14:42:46');
INSERT INTO `sys_oper_log` VALUES ('386', '账用户提现申请订单', '2', 'com.management.project.controller.order.BCashOrderApplyController.editSave()', '', '1', 'admin', '银商管理中心', '/order/bCashOrderApply/edit', '127.0.0.1', '内网IP', '{\"id\":[\"20191014112143991572\"],\"state\":[\"3\"]}', '1', '', '2019-10-14 14:46:04');
INSERT INTO `sys_oper_log` VALUES ('387', '账用户提现申请订单', '2', 'com.management.project.controller.order.BCashOrderApplyController.editSave()', '', '1', 'admin', '银商管理中心', '/order/bCashOrderApply/edit', '127.0.0.1', '内网IP', '{\"id\":[\"20191014112143991572\"],\"state\":[\"3\"]}', '0', null, '2019-10-14 14:47:24');
INSERT INTO `sys_oper_log` VALUES ('388', '账户提现订单', '2', 'com.management.project.controller.order.BCashOrderController.editSave()', '', '1', 'admin', '银商管理中心', '/order/bCashOrder/edit', '127.0.0.1', '内网IP', '{\"id\":[\"20191014112143991572\"],\"userId\":[\"1\"],\"marketId\":[\"9\"],\"cashAmount\":[\"50.00\"],\"balance\":[\"365.00\"],\"recAccountCode\":[\"234343234\"],\"recBankName\":[\"fsdf\"],\"recOpenBank\":[\"fsf\"],\"payBankName\":[\"上帝银行\"],\"payAaccountCode\":[\"88888888888888888\"],\"state\":[\"5\"],\"remark\":[\"fdsfa\"]}', '0', null, '2019-10-14 14:54:01');
INSERT INTO `sys_oper_log` VALUES ('389', '账用户提现申请订单', '2', 'com.management.project.controller.order.BCashOrderApplyController.editSave()', '', '1', 'admin', '银商管理中心', '/order/bCashOrderApply/edit', '127.0.0.1', '内网IP', '{\"id\":[\"20191014112143991572\"],\"state\":[\"3\"]}', '0', null, '2019-10-14 14:55:21');
INSERT INTO `sys_oper_log` VALUES ('390', '角色管理', '4', 'com.management.project.controller.system.role.RoleController.cancelAuthUser()', '', '1', 'admin', '银商管理中心', '/system/role/authUser/cancel', '127.0.0.1', '内网IP', '{\"roleId\":[\"105\"],\"userId\":[\"110\"]}', '0', null, '2019-10-14 15:48:05');
INSERT INTO `sys_oper_log` VALUES ('391', '角色管理', '4', 'com.management.project.controller.system.role.RoleController.cancelAuthUser()', '', '1', 'admin', '银商管理中心', '/system/role/authUser/cancel', '127.0.0.1', '内网IP', '{\"roleId\":[\"105\"],\"userId\":[\"115\"]}', '0', null, '2019-10-14 15:48:07');
INSERT INTO `sys_oper_log` VALUES ('392', '角色管理', '4', 'com.management.project.controller.system.role.RoleController.cancelAuthUser()', '', '1', 'admin', '银商管理中心', '/system/role/authUser/cancel', '127.0.0.1', '内网IP', '{\"roleId\":[\"104\"],\"userId\":[\"109\"]}', '0', null, '2019-10-14 15:48:12');
INSERT INTO `sys_oper_log` VALUES ('393', '角色管理', '4', 'com.management.project.controller.system.role.RoleController.cancelAuthUser()', '', '1', 'admin', '银商管理中心', '/system/role/authUser/cancel', '127.0.0.1', '内网IP', '{\"roleId\":[\"103\"],\"userId\":[\"108\"]}', '0', null, '2019-10-14 15:48:18');
INSERT INTO `sys_oper_log` VALUES ('394', '角色管理', '2', 'com.management.project.controller.system.role.RoleController.authDataScopeSave()', '', '1', 'admin', '银商管理中心', '/system/role/authDataScope', '127.0.0.1', '内网IP', '{\"roleId\":[\"103\"],\"roleName\":[\"cp 盘口1\"],\"roleKey\":[\"cpRole1\"],\"dataScope\":[\"2\"],\"deptIds\":[\"\"]}', '0', null, '2019-10-14 15:48:35');
INSERT INTO `sys_oper_log` VALUES ('395', '用户管理', '3', 'com.management.project.controller.system.user.UserController.remove()', '', '1', 'admin', '银商管理中心', '/system/user/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"126,115,110,109,108\"]}', '0', null, '2019-10-14 15:48:57');
INSERT INTO `sys_oper_log` VALUES ('396', '角色管理', '1', 'com.management.project.controller.system.role.RoleController.addSave()', '', '1', 'admin', '银商管理中心', '/system/role/add', '127.0.0.1', '内网IP', '{\"roleName\":[\"cp盘口1\"],\"roleKey\":[\"cpRole1\"],\"roleSort\":[\"3\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,2013,2014,2019,2020,2021,2022,2015,2024,2025,2026,2027,2028,2029,2030,2031\"]}', '0', null, '2019-10-14 16:09:32');
INSERT INTO `sys_oper_log` VALUES ('397', '角色管理', '2', 'com.management.project.controller.system.role.RoleController.authDataScopeSave()', '', '1', 'admin', '银商管理中心', '/system/role/authDataScope', '127.0.0.1', '内网IP', '{\"roleId\":[\"106\"],\"roleName\":[\"cp盘口1\"],\"roleKey\":[\"cpRole1\"],\"dataScope\":[\"2\"],\"deptIds\":[\"100,209,211\"]}', '0', null, '2019-10-14 16:09:57');
INSERT INTO `sys_oper_log` VALUES ('398', '角色管理', '1', 'com.management.project.controller.system.role.RoleController.addSave()', '', '1', 'admin', '银商管理中心', '/system/role/add', '127.0.0.1', '内网IP', '{\"roleName\":[\"cp盘口角色\"],\"roleKey\":[\"cpRole2\"],\"roleSort\":[\"6\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,103,1016,1017,1018,1019,2013,2014,2019,2020,2021,2022,2015,2017,2018,2023,2032,2024,2025,2026,2027,2028,2029,2030,2031\"]}', '0', null, '2019-10-14 16:10:53');
INSERT INTO `sys_oper_log` VALUES ('399', '角色管理', '2', 'com.management.project.controller.system.role.RoleController.authDataScopeSave()', '', '1', 'admin', '银商管理中心', '/system/role/authDataScope', '127.0.0.1', '内网IP', '{\"roleId\":[\"107\"],\"roleName\":[\"cp盘口角色\"],\"roleKey\":[\"cpRole2\"],\"dataScope\":[\"4\"],\"deptIds\":[\"\"]}', '0', null, '2019-10-14 16:11:09');
INSERT INTO `sys_oper_log` VALUES ('400', '角色管理', '2', 'com.management.project.controller.system.role.RoleController.authDataScopeSave()', '', '1', 'admin', '银商管理中心', '/system/role/authDataScope', '127.0.0.1', '内网IP', '{\"roleId\":[\"106\"],\"roleName\":[\"cp盘口1\"],\"roleKey\":[\"cpRole1\"],\"dataScope\":[\"3\"],\"deptIds\":[\"\"]}', '0', null, '2019-10-14 16:11:15');
INSERT INTO `sys_oper_log` VALUES ('401', '角色管理', '1', 'com.management.project.controller.system.role.RoleController.addSave()', '', '1', 'admin', '银商管理中心', '/system/role/add', '127.0.0.1', '内网IP', '{\"roleName\":[\"cp平台\"],\"roleKey\":[\"cpManager\"],\"roleSort\":[\"7\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,2013,2014,2019,2020,2021,2022,2015,2017,2018,2023,2032,2024,2025,2026,2027,2028,2029,2030,2031\"]}', '0', null, '2019-10-14 16:12:21');
INSERT INTO `sys_oper_log` VALUES ('402', '角色管理', '2', 'com.management.project.controller.system.role.RoleController.editSave()', '', '1', 'admin', '银商管理中心', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"108\"],\"roleName\":[\"cp平台\"],\"roleKey\":[\"cpManager\"],\"roleSort\":[\"7\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"\"]}', '0', null, '2019-10-14 16:13:23');
INSERT INTO `sys_oper_log` VALUES ('403', '用户管理', '1', 'com.management.project.controller.system.user.UserController.addSave()', '', '1', 'admin', '银商管理中心', '/system/user/add', '127.0.0.1', '内网IP', '{\"deptId\":[\"211\"],\"userName\":[\"cp1\"],\"deptName\":[\"cp盘口1\"],\"phonenumber\":[\"13211111111\"],\"email\":[\"cp1@qq.com\"],\"loginName\":[\"cp1\"],\"password\":[\"123456\"],\"sex\":[\"0\"],\"role\":[\"106\"],\"level\":[\"0\"],\"parentId\":[\"0\"],\"parentName\":[\"\"],\"remark\":[\"\"],\"status\":[\"0\"],\"roleIds\":[\"106\"],\"postIds\":[\"\"],\"userParentId\":[\"0\"]}', '0', null, '2019-10-14 16:17:13');
INSERT INTO `sys_oper_log` VALUES ('404', '角色管理', '2', 'com.management.project.controller.system.role.RoleController.editSave()', '', '1', 'admin', '银商管理中心', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"107\"],\"roleName\":[\"cp盘口2角色\"],\"roleKey\":[\"cpRole2\"],\"roleSort\":[\"6\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,103,1016,1017,1018,1019,2013,2014,2019,2020,2021,2022,2015,2017,2018,2023,2032,2024,2025,2026,2027,2028,2029,2030,2031\"]}', '0', null, '2019-10-14 16:17:30');
INSERT INTO `sys_oper_log` VALUES ('405', '角色管理', '2', 'com.management.project.controller.system.role.RoleController.editSave()', '', '1', 'admin', '银商管理中心', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"106\"],\"roleName\":[\"cp盘口1角色\"],\"roleKey\":[\"cpRole1\"],\"roleSort\":[\"3\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,2013,2014,2019,2020,2021,2022,2015,2024,2025,2026,2027,2028,2029,2030,2031\"]}', '0', null, '2019-10-14 16:17:52');
INSERT INTO `sys_oper_log` VALUES ('406', '用户管理', '1', 'com.management.project.controller.system.user.UserController.addSave()', '', '1', 'admin', '银商管理中心', '/system/user/add', '127.0.0.1', '内网IP', '{\"deptId\":[\"213\"],\"userName\":[\"cp2\"],\"deptName\":[\"cp盘口2\"],\"phonenumber\":[\"13222222222\"],\"email\":[\"cp2@qq.com\"],\"loginName\":[\"cp2\"],\"password\":[\"123456\"],\"sex\":[\"0\"],\"role\":[\"107\"],\"level\":[\"0\"],\"parentId\":[\"0\"],\"parentName\":[\"\"],\"remark\":[\"\"],\"status\":[\"0\"],\"roleIds\":[\"107\"],\"postIds\":[\"\"],\"userParentId\":[\"0\"]}', '0', null, '2019-10-14 16:18:50');
INSERT INTO `sys_oper_log` VALUES ('407', '用户管理', '1', 'com.management.project.controller.system.user.UserController.addSave()', '', '1', 'admin', '银商管理中心', '/system/user/add', '127.0.0.1', '内网IP', '{\"deptId\":[\"211\"],\"userName\":[\"cpm\"],\"deptName\":[\"cp盘口1\"],\"phonenumber\":[\"13233333333\"],\"email\":[\"cpm@qq.com\"],\"loginName\":[\"cpm\"],\"password\":[\"123456\"],\"sex\":[\"0\"],\"role\":[\"106\"],\"level\":[\"0\"],\"parentId\":[\"0\"],\"parentName\":[\"\"],\"remark\":[\"\"],\"status\":[\"0\"],\"roleIds\":[\"106\"],\"postIds\":[\"\"],\"userParentId\":[\"0\"]}', '0', null, '2019-10-14 16:19:59');
INSERT INTO `sys_oper_log` VALUES ('408', '角色管理', '4', 'com.management.project.controller.system.role.RoleController.selectAuthUserAll()', '', '1', 'admin', '银商管理中心', '/system/role/authUser/selectAll', '127.0.0.1', '内网IP', '{\"roleId\":[\"107\"],\"userIds\":[\"131\"]}', '0', null, '2019-10-14 16:20:12');
INSERT INTO `sys_oper_log` VALUES ('409', '角色管理', '2', 'com.management.project.controller.system.role.RoleController.authDataScopeSave()', '', '1', 'admin', '银商管理中心', '/system/role/authDataScope', '127.0.0.1', '内网IP', '{\"roleId\":[\"106\"],\"roleName\":[\"cp盘口1角色\"],\"roleKey\":[\"cpRole1\"],\"dataScope\":[\"2\"],\"deptIds\":[\"100,209,211\"]}', '0', null, '2019-10-14 16:22:09');
INSERT INTO `sys_oper_log` VALUES ('410', '角色管理', '2', 'com.management.project.controller.system.role.RoleController.authDataScopeSave()', '', '1', 'admin', '银商管理中心', '/system/role/authDataScope', '127.0.0.1', '内网IP', '{\"roleId\":[\"107\"],\"roleName\":[\"cp盘口2角色\"],\"roleKey\":[\"cpRole2\"],\"dataScope\":[\"2\"],\"deptIds\":[\"100,209,213\"]}', '0', null, '2019-10-14 16:22:20');
INSERT INTO `sys_oper_log` VALUES ('411', '菜单管理', '1', 'com.management.project.controller.system.menu.MenuController.addSave()', '', '1', 'admin', '银商管理中心', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2018\"],\"menuType\":[\"F\"],\"menuName\":[\"查询\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"order:bCashOrderApply:list\"],\"orderNum\":[\"3\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2019-10-14 16:23:31');
INSERT INTO `sys_oper_log` VALUES ('412', '角色管理', '2', 'com.management.project.controller.system.role.RoleController.editSave()', '', '1', 'admin', '银商管理中心', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"106\"],\"roleName\":[\"cp盘口1角色\"],\"roleKey\":[\"cpRole1\"],\"roleSort\":[\"3\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,2013,2014,2019,2020,2021,2022,2015,2017,2018,2023,2032,2033,2024,2025,2026,2027,2028,2029,2030,2031\"]}', '0', null, '2019-10-14 16:23:51');
INSERT INTO `sys_oper_log` VALUES ('413', '角色管理', '2', 'com.management.project.controller.system.role.RoleController.editSave()', '', '1', 'admin', '银商管理中心', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"106\"],\"roleName\":[\"cp盘口1角色\"],\"roleKey\":[\"cpRole1\"],\"roleSort\":[\"3\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,2013,2014,2019,2020,2021,2022,2015,2017,2018,2023,2032,2033,2024,2025,2026,2027,2028,2029,2030,2031\"]}', '0', null, '2019-10-14 16:24:34');
INSERT INTO `sys_oper_log` VALUES ('414', '菜单管理', '1', 'com.management.project.controller.system.menu.MenuController.addSave()', '', '1', 'admin', '银商管理中心', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2015\"],\"menuType\":[\"F\"],\"menuName\":[\"添加\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"order:bCashOrderApply:add\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2019-10-14 16:27:08');
INSERT INTO `sys_oper_log` VALUES ('415', '菜单管理', '1', 'com.management.project.controller.system.menu.MenuController.addSave()', '', '1', 'admin', '银商管理中心', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2015\"],\"menuType\":[\"F\"],\"menuName\":[\"查询\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"order:bCashOrderApply:list\"],\"orderNum\":[\"2\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2019-10-14 16:27:35');
INSERT INTO `sys_oper_log` VALUES ('416', '菜单管理', '1', 'com.management.project.controller.system.menu.MenuController.addSave()', '', '1', 'admin', '银商管理中心', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2015\"],\"menuType\":[\"F\"],\"menuName\":[\"修改\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"order:bCashOrderApply:edit\"],\"orderNum\":[\"3\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2019-10-14 16:28:06');
INSERT INTO `sys_oper_log` VALUES ('417', '菜单管理', '1', 'com.management.project.controller.system.menu.MenuController.addSave()', '', '1', 'admin', '银商管理中心', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2015\"],\"menuType\":[\"F\"],\"menuName\":[\"删除\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"order:bCashOrderApply:remove\"],\"orderNum\":[\"4\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2019-10-14 16:28:32');
INSERT INTO `sys_oper_log` VALUES ('418', '账用户提现申请订单', '1', 'com.management.project.controller.order.BCashOrderApplyController.addSave()', '', '1', 'cp1', 'cp盘口1', '/order/bCashOrderApply/add', '127.0.0.1', '内网IP', '{\"userId\":[\"129\"],\"marketId\":[\"7\"],\"pid\":[\"0\"],\"cashAmount\":[\"32\"],\"balance\":[\"0.00\"],\"recAccountType\":[\"0\"],\"recAccountCode\":[\"11\"],\"recBankName\":[\"11\"],\"recOpenBank\":[\"1\"],\"remark\":[\"11\"]}', '1', '提现金额不能大于余额', '2019-10-15 15:12:51');
INSERT INTO `sys_oper_log` VALUES ('419', '账用户提现申请订单', '1', 'com.management.project.controller.order.BCashOrderApplyController.addSave()', '', '1', 'cp1', 'cp盘口1', '/order/bCashOrderApply/add', '127.0.0.1', '内网IP', '{\"userId\":[\"129\"],\"marketId\":[\"7\"],\"pid\":[\"0\"],\"cashAmount\":[\"30\"],\"balance\":[\"1000.00\"],\"recAccountType\":[\"0\"],\"recAccountCode\":[\"123\"],\"recBankName\":[\"1111\"],\"recOpenBank\":[\"111\"],\"remark\":[\"\"]}', '1', 'nested exception is org.apache.ibatis.reflection.ReflectionException: There is no getter for property named \'traderId\' in \'class com.management.project.domain.kf.BAccountLog\'', '2019-10-15 15:13:29');
INSERT INTO `sys_oper_log` VALUES ('420', '账户提现订单', '2', 'com.management.project.controller.order.BCashOrderController.editSave()', '', '1', 'admin', '银商管理中心', '/order/bCashOrder/edit', '127.0.0.1', '内网IP', '{\"id\":[\"20191015151251019886\"],\"state\":[\"1\"]}', '0', null, '2019-10-15 15:17:52');
INSERT INTO `sys_oper_log` VALUES ('421', '账户提现订单', '2', 'com.management.project.controller.order.BCashOrderController.editSave()', '', '1', 'admin', '银商管理中心', '/order/bCashOrder/edit', '127.0.0.1', '内网IP', '{\"id\":[\"20191015151251019886\"],\"userId\":[\"129\"],\"marketId\":[\"7\"],\"cashAmount\":[\"32.00\"],\"balance\":[\"0.00\"],\"recAccountCode\":[\"11\"],\"recBankName\":[\"11\"],\"recOpenBank\":[\"1\"],\"payBankName\":[\"4444\"],\"payAaccountCode\":[\"333\"],\"state\":[\"5\"],\"remark\":[\"11\"]}', '0', null, '2019-10-15 15:18:13');
INSERT INTO `sys_oper_log` VALUES ('422', '账用户提现申请订单', '2', 'com.management.project.controller.order.BCashOrderApplyController.editSave()', '', '1', 'cp1', 'cp盘口1', '/order/bCashOrderApply/edit', '127.0.0.1', '内网IP', '{\"id\":[\"20191015151251019886\"],\"state\":[\"3\"]}', '1', 'nested exception is org.apache.ibatis.reflection.ReflectionException: There is no getter for property named \'traderID\' in \'class com.management.project.domain.kf.BAccountLog\'', '2019-10-15 15:38:01');
INSERT INTO `sys_oper_log` VALUES ('423', '菜单管理', '2', 'com.management.project.controller.system.menu.MenuController.editSave()', '', '1', 'admin', '银商管理中心', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2034\"],\"parentId\":[\"2015\"],\"menuType\":[\"F\"],\"menuName\":[\"添加\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"order:bCashOrder:add\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '0', null, '2019-10-15 15:57:56');
INSERT INTO `sys_oper_log` VALUES ('424', '菜单管理', '2', 'com.management.project.controller.system.menu.MenuController.editSave()', '', '1', 'admin', '银商管理中心', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2035\"],\"parentId\":[\"2015\"],\"menuType\":[\"F\"],\"menuName\":[\"查询\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"order:bCashOrder:list\"],\"orderNum\":[\"2\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '0', null, '2019-10-15 15:58:07');
INSERT INTO `sys_oper_log` VALUES ('425', '菜单管理', '2', 'com.management.project.controller.system.menu.MenuController.editSave()', '', '1', 'admin', '银商管理中心', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2036\"],\"parentId\":[\"2015\"],\"menuType\":[\"F\"],\"menuName\":[\"修改\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"order:bCashOrder:edit\"],\"orderNum\":[\"3\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '0', null, '2019-10-15 15:58:17');
INSERT INTO `sys_oper_log` VALUES ('426', '菜单管理', '2', 'com.management.project.controller.system.menu.MenuController.editSave()', '', '1', 'admin', '银商管理中心', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2037\"],\"parentId\":[\"2015\"],\"menuType\":[\"F\"],\"menuName\":[\"删除\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"order:bCashOrder:remove\"],\"orderNum\":[\"4\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '0', null, '2019-10-15 15:58:28');
INSERT INTO `sys_oper_log` VALUES ('427', '菜单管理', '2', 'com.management.project.controller.system.menu.MenuController.editSave()', '', '1', 'admin', '银商管理中心', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2035\"],\"parentId\":[\"2015\"],\"menuType\":[\"F\"],\"menuName\":[\"查询\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"order:bCashOrder:list\"],\"orderNum\":[\"2\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '0', null, '2019-10-15 16:08:03');
INSERT INTO `sys_oper_log` VALUES ('428', '账户提现订单', '2', 'com.management.project.controller.order.BCashOrderController.editSave()', '', '1', 'admin', '银商管理中心', '/order/bCashOrder/edit', '127.0.0.1', '内网IP', '{\"id\":[\"20191015151251019886\"],\"state\":[\"1\"]}', '0', null, '2019-10-15 16:09:46');
INSERT INTO `sys_oper_log` VALUES ('429', '账用户提现申请订单', '1', 'com.management.project.controller.order.BCashOrderApplyController.addSave()', '', '1', 'cp1', 'cp盘口1', '/order/bCashOrderApply/add', '127.0.0.1', '内网IP', '{\"userId\":[\"129\"],\"marketId\":[\"7\"],\"pid\":[\"0\"],\"cashAmount\":[\"50\"],\"balance\":[\"1000.00\"],\"recAccountType\":[\"0\"],\"recAccountCode\":[\"454444\"],\"recBankName\":[\"33\"],\"recOpenBank\":[\"22\"],\"remark\":[\"\"]}', '1', 'nested exception is org.apache.ibatis.reflection.ReflectionException: There is no getter for property named \'market_id\' in \'class com.management.project.domain.kf.BAccountLog\'', '2019-10-15 16:10:40');
INSERT INTO `sys_oper_log` VALUES ('430', '账用户提现申请订单', '1', 'com.management.project.controller.order.BCashOrderApplyController.addSave()', '', '1', 'cp1', 'cp盘口1', '/order/bCashOrderApply/add', '127.0.0.1', '内网IP', '{\"userId\":[\"129\"],\"marketId\":[\"7\"],\"pid\":[\"0\"],\"cashAmount\":[\"50\"],\"balance\":[\"1000.00\"],\"recAccountType\":[\"0\"],\"recAccountCode\":[\"111\"],\"recBankName\":[\"11\"],\"recOpenBank\":[\"11\"],\"remark\":[\"\"]}', '0', null, '2019-10-15 16:17:22');
INSERT INTO `sys_oper_log` VALUES ('431', '账户提现订单', '2', 'com.management.project.controller.order.BCashOrderController.editSave()', '', '1', 'admin', '银商管理中心', '/order/bCashOrder/edit', '127.0.0.1', '内网IP', '{\"id\":[\"20191015161722265149\"],\"state\":[\"1\"]}', '0', null, '2019-10-15 16:20:09');
INSERT INTO `sys_oper_log` VALUES ('432', '账用户提现申请订单', '1', 'com.management.project.controller.order.BCashOrderApplyController.addSave()', '', '1', 'cp1', 'cp盘口1', '/order/bCashOrderApply/add', '127.0.0.1', '内网IP', '{\"userId\":[\"129\"],\"marketId\":[\"7\"],\"pid\":[\"0\"],\"cashAmount\":[\"60\"],\"balance\":[\"950.00\"],\"recAccountType\":[\"0\"],\"recAccountCode\":[\"5555555\"],\"recBankName\":[\"555\"],\"recOpenBank\":[\"555\"],\"remark\":[\"\"]}', '0', null, '2019-10-15 16:37:47');
INSERT INTO `sys_oper_log` VALUES ('433', '账户提现订单', '2', 'com.management.project.controller.order.BCashOrderController.editSave()', '', '1', 'admin', '银商管理中心', '/order/bCashOrder/edit', '127.0.0.1', '内网IP', '{\"id\":[\"20191015163746899346\"],\"state\":[\"1\"]}', '0', null, '2019-10-15 16:37:58');
INSERT INTO `sys_oper_log` VALUES ('434', '账户提现订单', '2', 'com.management.project.controller.order.BCashOrderController.editSave()', '', '1', 'admin', '银商管理中心', '/order/bCashOrder/edit', '127.0.0.1', '内网IP', '{\"id\":[\"20191015163746899346\"],\"userId\":[\"129\"],\"marketId\":[\"7\"],\"cashAmount\":[\"60.00\"],\"balance\":[\"950.00\"],\"recAccountCode\":[\"5555555\"],\"recBankName\":[\"555\"],\"recOpenBank\":[\"555\"],\"payBankName\":[\"666\"],\"payAaccountCode\":[\"666\"],\"state\":[\"5\"],\"remark\":[\"\"]}', '0', null, '2019-10-15 16:38:43');
INSERT INTO `sys_oper_log` VALUES ('435', '账用户提现申请订单', '2', 'com.management.project.controller.order.BCashOrderApplyController.editSave()', '', '1', 'cp1', 'cp盘口1', '/order/bCashOrderApply/edit', '127.0.0.1', '内网IP', '{\"id\":[\"20191015163746899346\"],\"state\":[\"3\"]}', '0', null, '2019-10-15 16:39:47');
INSERT INTO `sys_oper_log` VALUES ('436', '菜单管理', '1', 'com.management.project.controller.system.menu.MenuController.addSave()', '', '1', 'admin', '银商管理中心', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2024\"],\"menuType\":[\"C\"],\"menuName\":[\"上分\"],\"url\":[\"/kf/bAccountLog/add\"],\"target\":[\"menuItem\"],\"perms\":[\"kf:bAccountLog:add\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2019-10-15 16:53:23');
INSERT INTO `sys_oper_log` VALUES ('437', '菜单管理', '3', 'com.management.project.controller.system.menu.MenuController.remove()', '', '1', 'admin', '银商管理中心', '/system/menu/remove/2038', '127.0.0.1', '内网IP', '{}', '0', null, '2019-10-15 16:59:14');
INSERT INTO `sys_oper_log` VALUES ('438', '客服账户流水', '1', 'com.management.project.controller.kf.BAccountLogController.addSave()', '', '1', 'admin', '银商管理中心', '/kf/bAccountLog/add', '127.0.0.1', '内网IP', '{\"userId\":[\"129\"],\"loginName\":[\"cp1\"],\"amount\":[\"100\"],\"balance\":[\"890.00\"]}', '0', null, '2019-10-16 09:44:25');
INSERT INTO `sys_oper_log` VALUES ('439', '客服账户流水', '1', 'com.management.project.controller.kf.BAccountLogController.addSave()', '', '1', 'admin', '银商管理中心', '/kf/bAccountLog/add', '127.0.0.1', '内网IP', '{\"userId\":[\"129\"],\"loginName\":[\"cp1\"],\"amount\":[\"500\"],\"balance\":[\"890.00\"]}', '1', '当前账号余额不足，无法给客服充值！！', '2019-10-16 10:07:02');
INSERT INTO `sys_oper_log` VALUES ('440', '客服账户流水', '1', 'com.management.project.controller.kf.BAccountLogController.addSave()', '', '1', 'admin', '银商管理中心', '/kf/bAccountLog/add', '127.0.0.1', '内网IP', '{\"userId\":[\"129\"],\"loginName\":[\"cp1\"],\"amount\":[\"10\"],\"balance\":[\"890.00\"]}', '0', null, '2019-10-16 10:07:39');
INSERT INTO `sys_oper_log` VALUES ('441', '账用户提现申请订单', '1', 'com.management.project.controller.order.BCashOrderApplyController.addSave()', '', '1', 'admin', '银商管理中心', '/order/bCashOrderApply/add', '127.0.0.1', '内网IP', '{\"userId\":[\"1\"],\"marketId\":[\"9\"],\"pid\":[\"0\"],\"cashAmount\":[\"10\"],\"balance\":[\"305.00\"],\"recAccountType\":[\"0\"],\"recAccountCode\":[\"111\"],\"recBankName\":[\"11\"],\"recOpenBank\":[\"11\"],\"remark\":[\"11\"]}', '0', null, '2019-10-16 10:28:39');
INSERT INTO `sys_oper_log` VALUES ('442', '客服账户', '1', 'com.management.project.controller.kf.BCustomerAccountController.addSave()', '', '1', 'cpm', 'cp盘口1', '/kf/bCustomerAccount/add', '127.0.0.1', '内网IP', '{\"nickName\":[\"kf123\"],\"accountName\":[\"kf123\"],\"password\":[\"123456\"],\"rePassword\":[\"123456\"],\"creditBalance\":[\"100\"],\"cashBalance\":[\"100\"],\"gameCurrencyBalance\":[\"\"],\"frozeAmount\":[\"\"],\"gameCurrencyType\":[\"0\"],\"rmb\":[\"10\"],\"xnb\":[\"12\"]}', '0', null, '2019-10-16 14:24:06');
INSERT INTO `sys_oper_log` VALUES ('443', '角色管理', '4', 'com.management.project.controller.system.role.RoleController.selectAuthUserAll()', '', '1', 'cpm', 'cp盘口1', '/system/role/authUser/selectAll', '127.0.0.1', '内网IP', '{\"roleId\":[\"106\"],\"userIds\":[\"132\"]}', '0', null, '2019-10-16 14:24:32');
INSERT INTO `sys_oper_log` VALUES ('444', '菜单管理', '1', 'com.management.project.controller.system.menu.MenuController.addSave()', '', '1', 'admin', '银商管理中心', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2025\"],\"menuType\":[\"F\"],\"menuName\":[\"账变管理\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"kf:bAccountLog:add\"],\"orderNum\":[\"7\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2019-10-16 14:32:16');
INSERT INTO `sys_oper_log` VALUES ('445', '角色管理', '2', 'com.management.project.controller.system.role.RoleController.editSave()', '', '1', 'admin', '银商管理中心', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"106\"],\"roleName\":[\"cp盘口1角色\"],\"roleKey\":[\"cpRole1\"],\"roleSort\":[\"3\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,2013,2014,2019,2020,2021,2022,2015,2017,2018,2023,2032,2033,2024,2025,2026,2027,2028,2029,2030,2031,2039\"]}', '0', null, '2019-10-16 14:32:32');
INSERT INTO `sys_oper_log` VALUES ('446', '角色管理', '2', 'com.management.project.controller.system.role.RoleController.editSave()', '', '1', 'admin', '银商管理中心', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"107\"],\"roleName\":[\"cp盘口2角色\"],\"roleKey\":[\"cpRole2\"],\"roleSort\":[\"6\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,103,1016,1017,1018,1019,2013,2014,2019,2020,2021,2022,2015,2017,2018,2023,2032,2024,2025,2026,2027,2028,2029,2030,2031,2039\"]}', '0', null, '2019-10-16 14:32:40');
INSERT INTO `sys_oper_log` VALUES ('447', '客服账户流水', '1', 'com.management.project.controller.kf.BAccountLogController.addSave()', '', '1', 'cpm', 'cp盘口1', '/kf/bAccountLog/add', '127.0.0.1', '内网IP', '{\"userId\":[\"132\"],\"loginName\":[\"kf123\"],\"amount\":[\"1\"],\"balance\":[\"100.00\"]}', '1', '当前账号余额不足，无法给客服充值！！', '2019-10-16 14:33:06');
INSERT INTO `sys_oper_log` VALUES ('448', '客服账户流水', '1', 'com.management.project.controller.kf.BAccountLogController.addSave()', '', '1', 'cpm', 'cp盘口1', '/kf/bAccountLog/add', '127.0.0.1', '内网IP', '{\"userId\":[\"132\"],\"loginName\":[\"kf123\"],\"amount\":[\"1\"],\"balance\":[\"100.00\"]}', '0', null, '2019-10-16 14:34:09');
INSERT INTO `sys_oper_log` VALUES ('449', '菜单管理', '1', 'com.management.project.controller.system.menu.MenuController.addSave()', '', '1', 'admin', '银商管理中心', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"0\"],\"menuType\":[\"C\"],\"menuName\":[\"财务管理\"],\"url\":[\"/financial/dish\"],\"target\":[\"menuItem\"],\"perms\":[\"financial:dish:view\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2019-10-16 15:26:02');
INSERT INTO `sys_oper_log` VALUES ('450', '菜单管理', '3', 'com.management.project.controller.system.menu.MenuController.remove()', '', '1', 'admin', '银商管理中心', '/system/menu/remove/2040', '127.0.0.1', '内网IP', '{}', '0', null, '2019-10-16 15:26:37');
INSERT INTO `sys_oper_log` VALUES ('451', '菜单管理', '1', 'com.management.project.controller.system.menu.MenuController.addSave()', '', '1', 'admin', '银商管理中心', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"财务管理\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"4\"],\"icon\":[\"fa fa-calculator\"],\"visible\":[\"0\"]}', '0', null, '2019-10-16 15:27:01');
INSERT INTO `sys_oper_log` VALUES ('452', '菜单管理', '1', 'com.management.project.controller.system.menu.MenuController.addSave()', '', '1', 'admin', '银商管理中心', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2041\"],\"menuType\":[\"C\"],\"menuName\":[\"财务款里\"],\"url\":[\"/financial/dish\"],\"target\":[\"menuItem\"],\"perms\":[\"financial:dish:view\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2019-10-16 15:27:43');
INSERT INTO `sys_oper_log` VALUES ('453', '菜单管理', '2', 'com.management.project.controller.system.menu.MenuController.editSave()', '', '1', 'admin', '银商管理中心', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2042\"],\"parentId\":[\"2041\"],\"menuType\":[\"C\"],\"menuName\":[\"财务管理\"],\"url\":[\"/financial/dish\"],\"target\":[\"menuItem\"],\"perms\":[\"financial:dish:view\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '0', null, '2019-10-16 15:27:56');
INSERT INTO `sys_oper_log` VALUES ('454', '菜单管理', '1', 'com.management.project.controller.system.menu.MenuController.addSave()', '', '1', 'admin', '银商管理中心', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2042\"],\"menuType\":[\"F\"],\"menuName\":[\"查询\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"financial:dish:list\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2019-10-16 15:31:33');
INSERT INTO `sys_oper_log` VALUES ('455', '角色管理', '2', 'com.management.project.controller.system.role.RoleController.editSave()', '', '1', 'admin', '银商管理中心', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"106\"],\"roleName\":[\"cp盘口1角色\"],\"roleKey\":[\"cpRole1\"],\"roleSort\":[\"3\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,2013,2014,2019,2020,2021,2022,2015,2041,2042,2043,2017,2018,2023,2032,2033,2024,2025,2026,2027,2028,2029,2030,2031,2039\"]}', '0', null, '2019-10-16 15:32:37');
INSERT INTO `sys_oper_log` VALUES ('456', '角色管理', '2', 'com.management.project.controller.system.role.RoleController.editSave()', '', '1', 'admin', '银商管理中心', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"107\"],\"roleName\":[\"cp盘口2角色\"],\"roleKey\":[\"cpRole2\"],\"roleSort\":[\"6\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,103,1016,1017,1018,1019,2013,2014,2019,2020,2021,2022,2015,2041,2042,2043,2017,2018,2023,2032,2024,2025,2026,2027,2028,2029,2030,2031,2039\"]}', '0', null, '2019-10-16 15:32:45');
INSERT INTO `sys_oper_log` VALUES ('457', '岗位管理', '1', 'com.management.project.controller.system.post.PostController.addSave()', '', '1', 'admin', '银商管理中心', '/system/post/add', '127.0.0.1', '内网IP', '{\"postName\":[\"cp平台管理\"],\"postCode\":[\"cpManager\"],\"postSort\":[\"5\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '0', null, '2019-10-18 10:42:58');
INSERT INTO `sys_oper_log` VALUES ('458', '用户管理', '2', 'com.management.project.controller.system.user.UserController.editSave()', '', '1', 'admin', '银商管理中心', '/system/user/edit', '127.0.0.1', '内网IP', '{\"userId\":[\"131\",\"131\"],\"deptId\":[\"211\"],\"userName\":[\"cpm\"],\"dept.deptName\":[\"cp盘口1\"],\"phonenumber\":[\"13233333333\"],\"email\":[\"cpm@qq.com\"],\"loginName\":[\"cpm\"],\"sex\":[\"0\"],\"role\":[\"106\"],\"level\":[\"0\"],\"userParentName\":[\"\"],\"remark\":[\"\"],\"status\":[\"0\"],\"roleIds\":[\"106\"],\"postIds\":[\"5\"],\"userParentId\":[\"131\"]}', '0', null, '2019-10-18 10:43:12');
INSERT INTO `sys_oper_log` VALUES ('459', '客服账户', '1', 'com.management.project.controller.kf.BCustomerAccountController.addSave()', '', '1', 'cp1', 'cp盘口1', '/kf/bCustomerAccount/add', '127.0.0.1', '内网IP', '{\"nickName\":[\"kf001\"],\"accountName\":[\"kf001\"],\"password\":[\"123456\"],\"rePassword\":[\"123456\"],\"deptName\":[\"cp盘口1\"],\"creditBalance\":[\"10\"],\"cashBalance\":[\"100\"],\"gameCurrencyBalance\":[\"\"],\"frozeAmount\":[\"\"],\"gameCurrencyType\":[\"0\"],\"rmb\":[\"10\"],\"xnb\":[\"12\"]}', '0', null, '2019-10-18 11:29:13');
INSERT INTO `sys_oper_log` VALUES ('460', '客服账户', '3', 'com.management.project.controller.kf.BCustomerAccountController.remove()', '', '1', 'cp1', 'cp盘口1', '/kf/bCustomerAccount/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"133\"]}', '0', null, '2019-10-18 11:33:00');
INSERT INTO `sys_oper_log` VALUES ('461', '客服账户', '1', 'com.management.project.controller.kf.BCustomerAccountController.addSave()', '', '1', 'cp1', 'cp盘口1', '/kf/bCustomerAccount/add', '127.0.0.1', '内网IP', '{\"deptId\":[\"211\"],\"nickName\":[\"kf001\"],\"accountName\":[\"kf001\"],\"password\":[\"123456\"],\"rePassword\":[\"123456\"],\"deptName\":[\"cp盘口1\"],\"creditBalance\":[\"\"],\"cashBalance\":[\"\"],\"gameCurrencyBalance\":[\"\"],\"frozeAmount\":[\"\"],\"gameCurrencyType\":[\"0\"],\"rmb\":[\"10\"],\"xnb\":[\"12\"]}', '0', null, '2019-10-18 11:34:27');
INSERT INTO `sys_oper_log` VALUES ('462', '角色管理', '4', 'com.management.project.controller.system.role.RoleController.selectAuthUserAll()', '', '1', 'cp1', 'cp盘口1', '/system/role/authUser/selectAll', '127.0.0.1', '内网IP', '{\"roleId\":[\"106\"],\"userIds\":[\"134\"]}', '0', null, '2019-10-18 11:35:13');
INSERT INTO `sys_oper_log` VALUES ('463', '角色管理', '1', 'com.management.project.controller.system.role.RoleController.addSave()', '', '1', 'admin', '银商管理中心', '/system/role/add', '127.0.0.1', '内网IP', '{\"roleName\":[\"ceshi\"],\"roleKey\":[\"ceshi\"],\"roleSort\":[\"8\"],\"status\":[\"0\"],\"remark\":[\"1\"],\"menuIds\":[\"\"]}', '0', null, '2019-10-18 14:05:55');
INSERT INTO `sys_oper_log` VALUES ('464', '菜单管理', '1', 'com.management.project.controller.system.menu.MenuController.addSave()', '', '1', 'admin', '银商管理中心', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2042\"],\"menuType\":[\"F\"],\"menuName\":[\"客服财务查询\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"financial:dish:detailList\"],\"orderNum\":[\"2\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2019-10-21 14:25:25');
INSERT INTO `sys_oper_log` VALUES ('465', '菜单管理', '2', 'com.management.project.controller.system.menu.MenuController.editSave()', '', '1', 'admin', '银商管理中心', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2043\"],\"parentId\":[\"2042\"],\"menuType\":[\"F\"],\"menuName\":[\"盘口财务查询\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"financial:dish:list\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '0', null, '2019-10-21 14:25:41');
INSERT INTO `sys_oper_log` VALUES ('466', '角色管理', '2', 'com.management.project.controller.system.role.RoleController.editSave()', '', '1', 'admin', '银商管理中心', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"106\"],\"roleName\":[\"cp盘口1角色\"],\"roleKey\":[\"cpRole1\"],\"roleSort\":[\"3\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,2013,2014,2019,2020,2021,2022,2015,2041,2042,2043,2044,2017,2018,2023,2032,2033,2024,2025,2026,2027,2028,2029,2030,2031,2039\"]}', '0', null, '2019-10-21 14:25:57');
INSERT INTO `sys_oper_log` VALUES ('467', '角色管理', '2', 'com.management.project.controller.system.role.RoleController.editSave()', '', '1', 'admin', '银商管理中心', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"107\"],\"roleName\":[\"cp盘口2角色\"],\"roleKey\":[\"cpRole2\"],\"roleSort\":[\"6\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,103,1016,1017,1018,1019,2013,2014,2019,2020,2021,2022,2015,2041,2042,2043,2044,2017,2018,2023,2032,2024,2025,2026,2027,2028,2029,2030,2031,2039\"]}', '0', null, '2019-10-21 14:26:06');
INSERT INTO `sys_oper_log` VALUES ('468', '用户管理', '2', 'com.management.project.controller.system.user.UserController.editSave()', '', '1', 'admin', '银商管理中心', '/system/user/edit', '127.0.0.1', '内网IP', '{\"userId\":[\"129\",\"129\"],\"deptId\":[\"211\"],\"userName\":[\"cp1\"],\"dept.deptName\":[\"cp盘口1\"],\"phonenumber\":[\"13211111111\"],\"email\":[\"cp1@qq.com\"],\"loginName\":[\"cp1\"],\"sex\":[\"0\"],\"role\":[\"106\"],\"level\":[\"3\"],\"userParentName\":[\"\"],\"remark\":[\"\"],\"status\":[\"0\"],\"roleIds\":[\"106\"],\"postIds\":[\"\"],\"userParentId\":[\"129\"]}', '0', null, '2019-10-21 14:26:29');
INSERT INTO `sys_oper_log` VALUES ('469', '角色管理', '2', 'com.management.project.controller.system.role.RoleController.editSave()', '', '1', 'admin', '银商管理中心', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"107\"],\"roleName\":[\"cp盘口2角色\"],\"roleKey\":[\"cpRole2\"],\"roleSort\":[\"6\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,103,1016,1017,1018,1019,2013,2014,2019,2020,2021,2022,2015,2034,2035,2036,2037,2041,2042,2043,2044,2017,2018,2023,2032,2024,2025,2026,2027,2028,2029,2030,2031,2039\"]}', '0', null, '2019-10-24 15:47:27');
INSERT INTO `sys_oper_log` VALUES ('470', '角色管理', '2', 'com.management.project.controller.system.role.RoleController.editSave()', '', '1', 'admin', '银商管理中心', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"106\"],\"roleName\":[\"cp盘口1角色\"],\"roleKey\":[\"cpRole1\"],\"roleSort\":[\"3\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,2013,2014,2019,2020,2021,2022,2015,2034,2035,2036,2037,2041,2042,2043,2044,2017,2018,2023,2032,2033,2024,2025,2026,2027,2028,2029,2030,2031,2039\"]}', '0', null, '2019-10-24 15:47:40');
INSERT INTO `sys_oper_log` VALUES ('471', '客服上线', '1', 'com.management.project.controller.kf.BCustomerAccountController.online()', '', '1', 'cp1', 'cp盘口1', '/kf/bCustomerAccount/online', '127.0.0.1', '内网IP', '{\"userId\":[\"129\"],\"state\":[\"1\"]}', '0', null, '2019-10-28 16:18:34');
INSERT INTO `sys_oper_log` VALUES ('472', '客服上线', '1', 'com.management.project.controller.kf.BCustomerAccountController.online()', '', '1', 'cp1', 'cp盘口1', '/kf/bCustomerAccount/online', '127.0.0.1', '内网IP', '{\"userId\":[\"129\"],\"state\":[\"1\"]}', '0', null, '2019-10-28 18:02:18');
INSERT INTO `sys_oper_log` VALUES ('473', '客服上线', '1', 'com.management.project.controller.kf.BCustomerAccountController.online()', '', '1', 'cp1', 'cp盘口1', '/kf/bCustomerAccount/online', '127.0.0.1', '内网IP', '{\"id\":[\"129\"]}', '1', '', '2019-10-29 09:45:35');
INSERT INTO `sys_oper_log` VALUES ('474', '客服上线', '1', 'com.management.project.controller.kf.BCustomerAccountController.online()', '', '1', 'cp1', 'cp盘口1', '/kf/bCustomerAccount/online', '127.0.0.1', '内网IP', '{\"id\":[\"129\"]}', '1', '', '2019-10-29 09:47:04');
INSERT INTO `sys_oper_log` VALUES ('475', '客服上线', '1', 'com.management.project.controller.kf.BCustomerAccountController.online()', '', '1', 'cp1', 'cp盘口1', '/kf/bCustomerAccount/online', '127.0.0.1', '内网IP', '{\"id\":[\"129\"]}', '0', null, '2019-10-29 10:15:17');
INSERT INTO `sys_oper_log` VALUES ('476', '客服上线', '1', 'com.management.project.controller.kf.BCustomerAccountController.online()', '', '1', 'cp1', 'cp盘口1', '/kf/bCustomerAccount/online', '127.0.0.1', '内网IP', '{\"id\":[\"129\"]}', '0', null, '2019-10-29 10:21:11');
INSERT INTO `sys_oper_log` VALUES ('477', '客服上线', '1', 'com.management.project.controller.kf.BCustomerAccountController.online()', '', '1', 'cp1', 'cp盘口1', '/kf/bCustomerAccount/online', '127.0.0.1', '内网IP', '{\"id\":[\"129\"]}', '0', null, '2019-10-29 17:10:07');
INSERT INTO `sys_oper_log` VALUES ('478', '客服上线', '1', 'com.management.project.controller.kf.BCustomerAccountController.online()', '', '1', 'cp1', 'cp盘口1', '/kf/bCustomerAccount/online', '127.0.0.1', '内网IP', '{\"id\":[\"129\"]}', '0', null, '2019-10-29 17:27:33');
INSERT INTO `sys_oper_log` VALUES ('479', '客服上线', '1', 'com.management.project.controller.kf.BCustomerAccountController.online()', '', '1', 'cp1', 'cp盘口1', '/kf/bCustomerAccount/online', '127.0.0.1', '内网IP', '{\"id\":[\"129\"]}', '0', null, '2019-10-29 20:22:46');
INSERT INTO `sys_oper_log` VALUES ('480', '客服账户', '1', 'com.management.project.controller.kf.BCustomerAccountController.addSave()', '', '1', 'cpm', 'cp盘口1', '/kf/bCustomerAccount/add', '127.0.0.1', '内网IP', '{\"deptId\":[\"211\"],\"nickName\":[\"1111\"],\"accountName\":[\"ll11\"],\"password\":[\"12345\"],\"rePassword\":[\"12345\"],\"deptName\":[\"cp盘口1\"],\"creditBalance\":[\"12\"],\"cashBalance\":[\"12\"],\"gameCurrencyBalance\":[\"\"],\"frozeAmount\":[\"\"],\"gameCurrencyType\":[\"0\"],\"rmb\":[\"10\"],\"xnb\":[\"14\"]}', '0', null, '2019-10-29 20:26:46');
INSERT INTO `sys_oper_log` VALUES ('481', '角色管理', '4', 'com.management.project.controller.system.role.RoleController.selectAuthUserAll()', '', '1', 'cpm', 'cp盘口1', '/system/role/authUser/selectAll', '127.0.0.1', '内网IP', '{\"roleId\":[\"106\"],\"userIds\":[\"135\"]}', '0', null, '2019-10-29 20:27:13');
INSERT INTO `sys_oper_log` VALUES ('482', '用户管理', '2', 'com.management.project.controller.system.user.UserController.editSave()', '', '1', 'cpm', 'cp盘口1', '/system/user/edit', '127.0.0.1', '内网IP', '{\"userId\":[\"135\",\"135\"],\"deptId\":[\"211\"],\"userName\":[\"1111\"],\"dept.deptName\":[\"cp盘口1\"],\"phonenumber\":[\"13233333337\"],\"email\":[\"123488@qq.com\"],\"loginName\":[\"ll11\"],\"sex\":[\"0\"],\"role\":[\"106\"],\"level\":[\"3\"],\"userParentName\":[\"\"],\"remark\":[\"\"],\"status\":[\"0\"],\"roleIds\":[\"106\"],\"postIds\":[\"\"],\"userParentId\":[\"135\"]}', '0', null, '2019-10-29 20:28:37');
INSERT INTO `sys_oper_log` VALUES ('483', '客服账户', '1', 'com.management.project.controller.kf.BCustomerAccountController.addSave()', '', '1', 'll11', 'cp盘口1', '/kf/bCustomerAccount/add', '127.0.0.1', '内网IP', '{\"deptId\":[\"211\"],\"nickName\":[\"ll22\"],\"accountName\":[\"ll22\"],\"password\":[\"1123456\"],\"rePassword\":[\"123456\"],\"deptName\":[\"cp盘口1\"],\"creditBalance\":[\"14\"],\"cashBalance\":[\"\"],\"gameCurrencyBalance\":[\"\"],\"frozeAmount\":[\"\"],\"gameCurrencyType\":[\"0\"],\"rmb\":[\"10\"],\"xnb\":[\"12\"]}', '0', null, '2019-10-29 20:33:09');
INSERT INTO `sys_oper_log` VALUES ('484', '角色管理', '4', 'com.management.project.controller.system.role.RoleController.selectAuthUserAll()', '', '1', 'll11', 'cp盘口1', '/system/role/authUser/selectAll', '127.0.0.1', '内网IP', '{\"roleId\":[\"106\"],\"userIds\":[\"136\"]}', '0', null, '2019-10-29 20:33:24');
INSERT INTO `sys_oper_log` VALUES ('485', '用户管理', '2', 'com.management.project.controller.system.user.UserController.editSave()', '', '1', 'll11', 'cp盘口1', '/system/user/edit', '127.0.0.1', '内网IP', '{\"userId\":[\"136\",\"136\"],\"deptId\":[\"211\"],\"userName\":[\"ll22\"],\"dept.deptName\":[\"cp盘口1\"],\"phonenumber\":[\"13233333338\"],\"email\":[\"123411@qq.com\"],\"loginName\":[\"ll22\"],\"sex\":[\"0\"],\"role\":[\"106\"],\"level\":[\"3\"],\"userParentName\":[\"\"],\"remark\":[\"\"],\"status\":[\"0\"],\"roleIds\":[\"106\"],\"postIds\":[\"\"],\"userParentId\":[\"136\"]}', '0', null, '2019-10-29 20:33:52');
INSERT INTO `sys_oper_log` VALUES ('486', '客服上线', '1', 'com.management.project.controller.kf.BCustomerAccountController.online()', '', '1', 'cp1', 'cp盘口1', '/kf/bCustomerAccount/online', '127.0.0.1', '内网IP', '{\"id\":[\"129\"]}', '0', null, '2019-10-30 11:12:07');
INSERT INTO `sys_oper_log` VALUES ('487', '客服下线', '1', 'com.management.project.controller.kf.BCustomerAccountController.offline()', '', '1', 'cp1', 'cp盘口1', '/kf/bCustomerAccount/offline', '127.0.0.1', '内网IP', '{\"id\":[\"129\"]}', '0', null, '2019-10-30 11:42:04');
INSERT INTO `sys_oper_log` VALUES ('488', '客服上线', '1', 'com.management.project.controller.kf.BCustomerAccountController.online()', '', '1', 'cp1', 'cp盘口1', '/kf/bCustomerAccount/online', '127.0.0.1', '内网IP', '{\"id\":[\"129\"]}', '0', null, '2019-10-30 11:45:50');
INSERT INTO `sys_oper_log` VALUES ('489', '客服下线', '1', 'com.management.project.controller.kf.BCustomerAccountController.offline()', '', '1', 'cp1', 'cp盘口1', '/kf/bCustomerAccount/offline', '127.0.0.1', '内网IP', '{\"id\":[\"129\"]}', '0', null, '2019-10-30 11:46:00');
INSERT INTO `sys_oper_log` VALUES ('490', '客服上线', '1', 'com.management.project.controller.kf.BCustomerAccountController.online()', '', '1', 'cp1', 'cp盘口1', '/kf/bCustomerAccount/online', '127.0.0.1', '内网IP', '{\"id\":[\"129\"]}', '0', null, '2019-10-30 11:46:51');
INSERT INTO `sys_oper_log` VALUES ('491', '客服下线', '1', 'com.management.project.controller.kf.BCustomerAccountController.offline()', '', '1', 'cp1', 'cp盘口1', '/kf/bCustomerAccount/offline', '127.0.0.1', '内网IP', '{\"id\":[\"129\"]}', '0', null, '2019-10-30 11:47:59');
INSERT INTO `sys_oper_log` VALUES ('492', '客服上线', '1', 'com.management.project.controller.kf.BCustomerAccountController.online()', '', '1', 'cp1', 'cp盘口1', '/kf/bCustomerAccount/online', '127.0.0.1', '内网IP', '{\"id\":[\"129\"]}', '0', null, '2019-10-30 11:48:03');
INSERT INTO `sys_oper_log` VALUES ('493', '客服下线', '1', 'com.management.project.controller.kf.BCustomerAccountController.offline()', '', '1', 'cp1', 'cp盘口1', '/kf/bCustomerAccount/offline', '127.0.0.1', '内网IP', '{\"id\":[\"129\"]}', '0', null, '2019-10-30 11:52:24');
INSERT INTO `sys_oper_log` VALUES ('494', '客服上线', '1', 'com.management.project.controller.kf.BCustomerAccountController.online()', '', '1', 'cp1', 'cp盘口1', '/kf/bCustomerAccount/online', '127.0.0.1', '内网IP', '{\"id\":[\"129\"]}', '0', null, '2019-10-30 11:52:29');
INSERT INTO `sys_oper_log` VALUES ('495', '客服下线', '1', 'com.management.project.controller.kf.BCustomerAccountController.offline()', '', '1', 'cp1', 'cp盘口1', '/kf/bCustomerAccount/offline', '127.0.0.1', '内网IP', '{\"id\":[\"129\"]}', '0', null, '2019-10-30 11:52:34');
INSERT INTO `sys_oper_log` VALUES ('496', '客服上线', '1', 'com.management.project.controller.kf.BCustomerAccountController.online()', '', '1', 'cp1', 'cp盘口1', '/kf/bCustomerAccount/online', '127.0.0.1', '内网IP', '{\"id\":[\"129\"]}', '0', null, '2019-10-30 11:52:36');
INSERT INTO `sys_oper_log` VALUES ('497', '客服下线', '1', 'com.management.project.controller.kf.BCustomerAccountController.offline()', '', '1', 'cp1', 'cp盘口1', '/kf/bCustomerAccount/offline', '127.0.0.1', '内网IP', '{\"id\":[\"129\"]}', '0', null, '2019-10-30 13:52:27');
INSERT INTO `sys_oper_log` VALUES ('498', '客服上线', '1', 'com.management.project.controller.kf.BCustomerAccountController.online()', '', '1', 'cp1', 'cp盘口1', '/kf/bCustomerAccount/online', '127.0.0.1', '内网IP', '{\"id\":[\"129\"]}', '0', null, '2019-10-30 13:52:29');
INSERT INTO `sys_oper_log` VALUES ('499', '代码生成', '8', 'com.ruoyi.project.controller.tool.gen.GenController.genCode()', '', '1', 'admin', '银商管理中心', '/tool/gen/genCode/t_user', '127.0.0.1', '内网IP', '{}', '0', null, '2019-11-12 11:32:25');
INSERT INTO `sys_oper_log` VALUES ('500', '代码生成', '8', 'com.ruoyi.project.controller.tool.gen.GenController.genCode()', '', '1', 'admin', '银商管理中心', '/tool/gen/genCode/config_job_category', '127.0.0.1', '内网IP', '{}', '0', null, '2019-11-12 11:34:14');
INSERT INTO `sys_oper_log` VALUES ('501', '代码生成', '8', 'com.ruoyi.project.controller.tool.gen.GenController.genCode()', '', '1', 'admin', '银商管理中心', '/tool/gen/genCode/config_job_label', '127.0.0.1', '内网IP', '{}', '0', null, '2019-11-12 11:35:08');
INSERT INTO `sys_oper_log` VALUES ('502', '代码生成', '8', 'com.ruoyi.project.controller.tool.gen.GenController.genCode()', '', '1', 'admin', '银商管理中心', '/tool/gen/genCode/job_position', '127.0.0.1', '内网IP', '{}', '0', null, '2019-11-12 11:38:06');
INSERT INTO `sys_oper_log` VALUES ('503', '代码生成', '8', 'com.ruoyi.project.controller.tool.gen.GenController.genCode()', '', '1', 'admin', '银商管理中心', '/tool/gen/genCode/t_article', '127.0.0.1', '内网IP', '{}', '0', null, '2019-11-12 11:39:12');
INSERT INTO `sys_oper_log` VALUES ('504', '代码生成', '8', 'com.ruoyi.project.controller.tool.gen.GenController.genCode()', '', '1', 'admin', '银商管理中心', '/tool/gen/genCode/t_company', '127.0.0.1', '内网IP', '{}', '0', null, '2019-11-12 11:39:25');
INSERT INTO `sys_oper_log` VALUES ('505', '代码生成', '8', 'com.ruoyi.project.controller.tool.gen.GenController.genCode()', '', '1', 'admin', '银商管理中心', '/tool/gen/genCode/t_kf_config', '127.0.0.1', '内网IP', '{}', '0', null, '2019-11-12 11:40:52');
INSERT INTO `sys_oper_log` VALUES ('506', '代码生成', '8', 'com.ruoyi.project.controller.tool.gen.GenController.genCode()', '', '1', 'admin', '银商管理中心', '/tool/gen/genCode/t_kf_detail', '127.0.0.1', '内网IP', '{}', '0', null, '2019-11-12 11:41:23');
INSERT INTO `sys_oper_log` VALUES ('507', '代码生成', '8', 'com.ruoyi.project.controller.tool.gen.GenController.genCode()', '', '1', 'admin', '银商管理中心', '/tool/gen/genCode/t_message', '127.0.0.1', '内网IP', '{}', '0', null, '2019-11-12 11:41:50');
INSERT INTO `sys_oper_log` VALUES ('508', '代码生成', '8', 'com.ruoyi.project.controller.tool.gen.GenController.genCode()', '', '1', 'admin', '银商管理中心', '/tool/gen/genCode/t_user', '127.0.0.1', '内网IP', '{}', '0', null, '2019-11-12 11:42:31');
INSERT INTO `sys_oper_log` VALUES ('509', '代码生成', '8', 'com.ruoyi.project.controller.tool.gen.GenController.genCode()', '', '1', 'admin', '银商管理中心', '/tool/gen/genCode/t_user_position', '127.0.0.1', '内网IP', '{}', '0', null, '2019-11-12 11:43:22');

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post` (
  `post_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) COLLATE utf8_croatian_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) COLLATE utf8_croatian_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int(4) NOT NULL COMMENT '显示顺序',
  `status` char(1) COLLATE utf8_croatian_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) COLLATE utf8_croatian_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_croatian_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8_croatian_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_croatian_ci COMMENT='岗位信息表';

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES ('1', 'kefu', '客服', '1', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2019-09-21 18:32:23', '');
INSERT INTO `sys_post` VALUES ('2', 'daili', '盘口代理', '2', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2019-09-21 18:32:09', '');
INSERT INTO `sys_post` VALUES ('3', 'pankou', '盘口用户', '3', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2019-09-21 18:31:55', '');
INSERT INTO `sys_post` VALUES ('4', 'user', '系统用户', '4', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2019-09-21 18:31:33', '');
INSERT INTO `sys_post` VALUES ('5', 'cpManager', 'cp平台管理', '5', '0', 'admin', '2019-10-18 10:42:58', '', null, null);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) COLLATE utf8_croatian_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) COLLATE utf8_croatian_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(4) NOT NULL COMMENT '显示顺序',
  `role_parent_id` bigint(20) DEFAULT NULL COMMENT '父级角色ID',
  `ancestors` varchar(50) COLLATE utf8_croatian_ci DEFAULT NULL COMMENT '祖级列表',
  `data_scope` char(1) COLLATE utf8_croatian_ci DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `status` char(1) COLLATE utf8_croatian_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) COLLATE utf8_croatian_ci DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) COLLATE utf8_croatian_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_croatian_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8_croatian_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8 COLLATE=utf8_croatian_ci COMMENT='角色信息表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '开发者', 'admin', '1', '0', '0', '1', '0', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2019-09-23 22:26:06', '开发者角色');
INSERT INTO `sys_role` VALUES ('2', '盘口用户', 'common', '2', '0', '0', '4', '0', '0', 'admin', '2018-03-16 11:33:00', 'rjg', '2019-09-26 17:42:29', '普通角色');
INSERT INTO `sys_role` VALUES ('100', '盘口代理', 'agent', '3', '2', '0,2', '4', '0', '0', 'rjg', '2019-09-23 21:45:50', 'rjg', '2019-09-26 17:42:36', '');
INSERT INTO `sys_role` VALUES ('101', '客服', 'service', '4', '100', '0,2,100', '3', '0', '0', 'admin', '2019-09-23 21:59:50', 'admin', '2019-09-23 22:21:31', null);
INSERT INTO `sys_role` VALUES ('102', '平台管理员', 'manager', '2', '0', '0', '1', '0', '0', 'admin', '2019-09-23 22:24:02', 'rjg', '2019-09-23 22:28:25', '');
INSERT INTO `sys_role` VALUES ('106', 'cp盘口1角色', 'cpRole1', '3', null, null, '2', '0', '0', 'admin', '2019-10-14 16:09:32', 'admin', '2019-10-24 15:47:40', '');
INSERT INTO `sys_role` VALUES ('107', 'cp盘口2角色', 'cpRole2', '6', null, null, '2', '0', '0', 'admin', '2019-10-14 16:10:53', 'admin', '2019-10-24 15:47:27', '');
INSERT INTO `sys_role` VALUES ('108', 'cp平台', 'cpManager', '7', null, null, '1', '0', '0', 'admin', '2019-10-14 16:12:21', 'admin', '2019-10-14 16:13:23', '');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept` (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(20) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`,`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_croatian_ci COMMENT='角色和部门关联表';

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES ('106', '100');
INSERT INTO `sys_role_dept` VALUES ('106', '209');
INSERT INTO `sys_role_dept` VALUES ('106', '211');
INSERT INTO `sys_role_dept` VALUES ('107', '100');
INSERT INTO `sys_role_dept` VALUES ('107', '209');
INSERT INTO `sys_role_dept` VALUES ('107', '213');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_croatian_ci COMMENT='角色和菜单关联表';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('1', '1');
INSERT INTO `sys_role_menu` VALUES ('1', '2');
INSERT INTO `sys_role_menu` VALUES ('1', '3');
INSERT INTO `sys_role_menu` VALUES ('1', '100');
INSERT INTO `sys_role_menu` VALUES ('1', '101');
INSERT INTO `sys_role_menu` VALUES ('1', '102');
INSERT INTO `sys_role_menu` VALUES ('1', '103');
INSERT INTO `sys_role_menu` VALUES ('1', '104');
INSERT INTO `sys_role_menu` VALUES ('1', '105');
INSERT INTO `sys_role_menu` VALUES ('1', '106');
INSERT INTO `sys_role_menu` VALUES ('1', '107');
INSERT INTO `sys_role_menu` VALUES ('1', '108');
INSERT INTO `sys_role_menu` VALUES ('1', '109');
INSERT INTO `sys_role_menu` VALUES ('1', '110');
INSERT INTO `sys_role_menu` VALUES ('1', '111');
INSERT INTO `sys_role_menu` VALUES ('1', '112');
INSERT INTO `sys_role_menu` VALUES ('1', '113');
INSERT INTO `sys_role_menu` VALUES ('1', '114');
INSERT INTO `sys_role_menu` VALUES ('1', '115');
INSERT INTO `sys_role_menu` VALUES ('1', '500');
INSERT INTO `sys_role_menu` VALUES ('1', '501');
INSERT INTO `sys_role_menu` VALUES ('1', '1000');
INSERT INTO `sys_role_menu` VALUES ('1', '1001');
INSERT INTO `sys_role_menu` VALUES ('1', '1002');
INSERT INTO `sys_role_menu` VALUES ('1', '1003');
INSERT INTO `sys_role_menu` VALUES ('1', '1004');
INSERT INTO `sys_role_menu` VALUES ('1', '1005');
INSERT INTO `sys_role_menu` VALUES ('1', '1006');
INSERT INTO `sys_role_menu` VALUES ('1', '1007');
INSERT INTO `sys_role_menu` VALUES ('1', '1008');
INSERT INTO `sys_role_menu` VALUES ('1', '1009');
INSERT INTO `sys_role_menu` VALUES ('1', '1010');
INSERT INTO `sys_role_menu` VALUES ('1', '1011');
INSERT INTO `sys_role_menu` VALUES ('1', '1012');
INSERT INTO `sys_role_menu` VALUES ('1', '1013');
INSERT INTO `sys_role_menu` VALUES ('1', '1014');
INSERT INTO `sys_role_menu` VALUES ('1', '1015');
INSERT INTO `sys_role_menu` VALUES ('1', '1016');
INSERT INTO `sys_role_menu` VALUES ('1', '1017');
INSERT INTO `sys_role_menu` VALUES ('1', '1018');
INSERT INTO `sys_role_menu` VALUES ('1', '1019');
INSERT INTO `sys_role_menu` VALUES ('1', '1020');
INSERT INTO `sys_role_menu` VALUES ('1', '1021');
INSERT INTO `sys_role_menu` VALUES ('1', '1022');
INSERT INTO `sys_role_menu` VALUES ('1', '1023');
INSERT INTO `sys_role_menu` VALUES ('1', '1024');
INSERT INTO `sys_role_menu` VALUES ('1', '1025');
INSERT INTO `sys_role_menu` VALUES ('1', '1026');
INSERT INTO `sys_role_menu` VALUES ('1', '1027');
INSERT INTO `sys_role_menu` VALUES ('1', '1028');
INSERT INTO `sys_role_menu` VALUES ('1', '1029');
INSERT INTO `sys_role_menu` VALUES ('1', '1030');
INSERT INTO `sys_role_menu` VALUES ('1', '1031');
INSERT INTO `sys_role_menu` VALUES ('1', '1032');
INSERT INTO `sys_role_menu` VALUES ('1', '1033');
INSERT INTO `sys_role_menu` VALUES ('1', '1034');
INSERT INTO `sys_role_menu` VALUES ('1', '1035');
INSERT INTO `sys_role_menu` VALUES ('1', '1036');
INSERT INTO `sys_role_menu` VALUES ('1', '1037');
INSERT INTO `sys_role_menu` VALUES ('1', '1038');
INSERT INTO `sys_role_menu` VALUES ('1', '1039');
INSERT INTO `sys_role_menu` VALUES ('1', '1040');
INSERT INTO `sys_role_menu` VALUES ('1', '1041');
INSERT INTO `sys_role_menu` VALUES ('1', '1042');
INSERT INTO `sys_role_menu` VALUES ('1', '1043');
INSERT INTO `sys_role_menu` VALUES ('1', '1044');
INSERT INTO `sys_role_menu` VALUES ('1', '1045');
INSERT INTO `sys_role_menu` VALUES ('1', '1046');
INSERT INTO `sys_role_menu` VALUES ('1', '1047');
INSERT INTO `sys_role_menu` VALUES ('1', '1048');
INSERT INTO `sys_role_menu` VALUES ('1', '1049');
INSERT INTO `sys_role_menu` VALUES ('1', '1050');
INSERT INTO `sys_role_menu` VALUES ('1', '1051');
INSERT INTO `sys_role_menu` VALUES ('1', '1052');
INSERT INTO `sys_role_menu` VALUES ('1', '1053');
INSERT INTO `sys_role_menu` VALUES ('1', '1054');
INSERT INTO `sys_role_menu` VALUES ('1', '1055');
INSERT INTO `sys_role_menu` VALUES ('1', '1056');
INSERT INTO `sys_role_menu` VALUES ('1', '1057');
INSERT INTO `sys_role_menu` VALUES ('1', '1058');
INSERT INTO `sys_role_menu` VALUES ('1', '1059');
INSERT INTO `sys_role_menu` VALUES ('1', '1060');
INSERT INTO `sys_role_menu` VALUES ('1', '2001');
INSERT INTO `sys_role_menu` VALUES ('1', '2002');
INSERT INTO `sys_role_menu` VALUES ('2', '1');
INSERT INTO `sys_role_menu` VALUES ('2', '100');
INSERT INTO `sys_role_menu` VALUES ('2', '1000');
INSERT INTO `sys_role_menu` VALUES ('2', '1001');
INSERT INTO `sys_role_menu` VALUES ('2', '1002');
INSERT INTO `sys_role_menu` VALUES ('2', '1003');
INSERT INTO `sys_role_menu` VALUES ('2', '1004');
INSERT INTO `sys_role_menu` VALUES ('2', '1005');
INSERT INTO `sys_role_menu` VALUES ('2', '1006');
INSERT INTO `sys_role_menu` VALUES ('100', '1');
INSERT INTO `sys_role_menu` VALUES ('100', '100');
INSERT INTO `sys_role_menu` VALUES ('100', '1000');
INSERT INTO `sys_role_menu` VALUES ('100', '1001');
INSERT INTO `sys_role_menu` VALUES ('100', '1002');
INSERT INTO `sys_role_menu` VALUES ('100', '1003');
INSERT INTO `sys_role_menu` VALUES ('100', '1004');
INSERT INTO `sys_role_menu` VALUES ('100', '1005');
INSERT INTO `sys_role_menu` VALUES ('100', '1006');
INSERT INTO `sys_role_menu` VALUES ('101', '2001');
INSERT INTO `sys_role_menu` VALUES ('101', '2002');
INSERT INTO `sys_role_menu` VALUES ('102', '1');
INSERT INTO `sys_role_menu` VALUES ('102', '100');
INSERT INTO `sys_role_menu` VALUES ('102', '103');
INSERT INTO `sys_role_menu` VALUES ('102', '104');
INSERT INTO `sys_role_menu` VALUES ('102', '1000');
INSERT INTO `sys_role_menu` VALUES ('102', '1001');
INSERT INTO `sys_role_menu` VALUES ('102', '1002');
INSERT INTO `sys_role_menu` VALUES ('102', '1003');
INSERT INTO `sys_role_menu` VALUES ('102', '1004');
INSERT INTO `sys_role_menu` VALUES ('102', '1005');
INSERT INTO `sys_role_menu` VALUES ('102', '1006');
INSERT INTO `sys_role_menu` VALUES ('102', '1016');
INSERT INTO `sys_role_menu` VALUES ('102', '1017');
INSERT INTO `sys_role_menu` VALUES ('102', '1018');
INSERT INTO `sys_role_menu` VALUES ('102', '1019');
INSERT INTO `sys_role_menu` VALUES ('102', '1020');
INSERT INTO `sys_role_menu` VALUES ('102', '1021');
INSERT INTO `sys_role_menu` VALUES ('102', '1022');
INSERT INTO `sys_role_menu` VALUES ('102', '1023');
INSERT INTO `sys_role_menu` VALUES ('102', '1024');
INSERT INTO `sys_role_menu` VALUES ('103', '1');
INSERT INTO `sys_role_menu` VALUES ('106', '1');
INSERT INTO `sys_role_menu` VALUES ('106', '100');
INSERT INTO `sys_role_menu` VALUES ('106', '101');
INSERT INTO `sys_role_menu` VALUES ('106', '102');
INSERT INTO `sys_role_menu` VALUES ('106', '103');
INSERT INTO `sys_role_menu` VALUES ('106', '1000');
INSERT INTO `sys_role_menu` VALUES ('106', '1001');
INSERT INTO `sys_role_menu` VALUES ('106', '1002');
INSERT INTO `sys_role_menu` VALUES ('106', '1003');
INSERT INTO `sys_role_menu` VALUES ('106', '1004');
INSERT INTO `sys_role_menu` VALUES ('106', '1005');
INSERT INTO `sys_role_menu` VALUES ('106', '1006');
INSERT INTO `sys_role_menu` VALUES ('106', '1007');
INSERT INTO `sys_role_menu` VALUES ('106', '1008');
INSERT INTO `sys_role_menu` VALUES ('106', '1009');
INSERT INTO `sys_role_menu` VALUES ('106', '1010');
INSERT INTO `sys_role_menu` VALUES ('106', '1011');
INSERT INTO `sys_role_menu` VALUES ('106', '1012');
INSERT INTO `sys_role_menu` VALUES ('106', '1013');
INSERT INTO `sys_role_menu` VALUES ('106', '1014');
INSERT INTO `sys_role_menu` VALUES ('106', '1015');
INSERT INTO `sys_role_menu` VALUES ('106', '1016');
INSERT INTO `sys_role_menu` VALUES ('106', '1017');
INSERT INTO `sys_role_menu` VALUES ('106', '1018');
INSERT INTO `sys_role_menu` VALUES ('106', '1019');
INSERT INTO `sys_role_menu` VALUES ('106', '2013');
INSERT INTO `sys_role_menu` VALUES ('106', '2014');
INSERT INTO `sys_role_menu` VALUES ('106', '2015');
INSERT INTO `sys_role_menu` VALUES ('106', '2017');
INSERT INTO `sys_role_menu` VALUES ('106', '2018');
INSERT INTO `sys_role_menu` VALUES ('106', '2019');
INSERT INTO `sys_role_menu` VALUES ('106', '2020');
INSERT INTO `sys_role_menu` VALUES ('106', '2021');
INSERT INTO `sys_role_menu` VALUES ('106', '2022');
INSERT INTO `sys_role_menu` VALUES ('106', '2023');
INSERT INTO `sys_role_menu` VALUES ('106', '2024');
INSERT INTO `sys_role_menu` VALUES ('106', '2025');
INSERT INTO `sys_role_menu` VALUES ('106', '2026');
INSERT INTO `sys_role_menu` VALUES ('106', '2027');
INSERT INTO `sys_role_menu` VALUES ('106', '2028');
INSERT INTO `sys_role_menu` VALUES ('106', '2029');
INSERT INTO `sys_role_menu` VALUES ('106', '2030');
INSERT INTO `sys_role_menu` VALUES ('106', '2031');
INSERT INTO `sys_role_menu` VALUES ('106', '2032');
INSERT INTO `sys_role_menu` VALUES ('106', '2033');
INSERT INTO `sys_role_menu` VALUES ('106', '2034');
INSERT INTO `sys_role_menu` VALUES ('106', '2035');
INSERT INTO `sys_role_menu` VALUES ('106', '2036');
INSERT INTO `sys_role_menu` VALUES ('106', '2037');
INSERT INTO `sys_role_menu` VALUES ('106', '2039');
INSERT INTO `sys_role_menu` VALUES ('106', '2041');
INSERT INTO `sys_role_menu` VALUES ('106', '2042');
INSERT INTO `sys_role_menu` VALUES ('106', '2043');
INSERT INTO `sys_role_menu` VALUES ('106', '2044');
INSERT INTO `sys_role_menu` VALUES ('107', '1');
INSERT INTO `sys_role_menu` VALUES ('107', '100');
INSERT INTO `sys_role_menu` VALUES ('107', '101');
INSERT INTO `sys_role_menu` VALUES ('107', '103');
INSERT INTO `sys_role_menu` VALUES ('107', '1000');
INSERT INTO `sys_role_menu` VALUES ('107', '1001');
INSERT INTO `sys_role_menu` VALUES ('107', '1002');
INSERT INTO `sys_role_menu` VALUES ('107', '1003');
INSERT INTO `sys_role_menu` VALUES ('107', '1004');
INSERT INTO `sys_role_menu` VALUES ('107', '1005');
INSERT INTO `sys_role_menu` VALUES ('107', '1006');
INSERT INTO `sys_role_menu` VALUES ('107', '1007');
INSERT INTO `sys_role_menu` VALUES ('107', '1008');
INSERT INTO `sys_role_menu` VALUES ('107', '1009');
INSERT INTO `sys_role_menu` VALUES ('107', '1010');
INSERT INTO `sys_role_menu` VALUES ('107', '1011');
INSERT INTO `sys_role_menu` VALUES ('107', '1016');
INSERT INTO `sys_role_menu` VALUES ('107', '1017');
INSERT INTO `sys_role_menu` VALUES ('107', '1018');
INSERT INTO `sys_role_menu` VALUES ('107', '1019');
INSERT INTO `sys_role_menu` VALUES ('107', '2013');
INSERT INTO `sys_role_menu` VALUES ('107', '2014');
INSERT INTO `sys_role_menu` VALUES ('107', '2015');
INSERT INTO `sys_role_menu` VALUES ('107', '2017');
INSERT INTO `sys_role_menu` VALUES ('107', '2018');
INSERT INTO `sys_role_menu` VALUES ('107', '2019');
INSERT INTO `sys_role_menu` VALUES ('107', '2020');
INSERT INTO `sys_role_menu` VALUES ('107', '2021');
INSERT INTO `sys_role_menu` VALUES ('107', '2022');
INSERT INTO `sys_role_menu` VALUES ('107', '2023');
INSERT INTO `sys_role_menu` VALUES ('107', '2024');
INSERT INTO `sys_role_menu` VALUES ('107', '2025');
INSERT INTO `sys_role_menu` VALUES ('107', '2026');
INSERT INTO `sys_role_menu` VALUES ('107', '2027');
INSERT INTO `sys_role_menu` VALUES ('107', '2028');
INSERT INTO `sys_role_menu` VALUES ('107', '2029');
INSERT INTO `sys_role_menu` VALUES ('107', '2030');
INSERT INTO `sys_role_menu` VALUES ('107', '2031');
INSERT INTO `sys_role_menu` VALUES ('107', '2032');
INSERT INTO `sys_role_menu` VALUES ('107', '2034');
INSERT INTO `sys_role_menu` VALUES ('107', '2035');
INSERT INTO `sys_role_menu` VALUES ('107', '2036');
INSERT INTO `sys_role_menu` VALUES ('107', '2037');
INSERT INTO `sys_role_menu` VALUES ('107', '2039');
INSERT INTO `sys_role_menu` VALUES ('107', '2041');
INSERT INTO `sys_role_menu` VALUES ('107', '2042');
INSERT INTO `sys_role_menu` VALUES ('107', '2043');
INSERT INTO `sys_role_menu` VALUES ('107', '2044');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '盘口ID',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父级ID',
  `login_name` varchar(30) COLLATE utf8_croatian_ci NOT NULL COMMENT '登录账号',
  `user_name` varchar(30) COLLATE utf8_croatian_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) COLLATE utf8_croatian_ci DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) COLLATE utf8_croatian_ci DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) COLLATE utf8_croatian_ci DEFAULT '' COMMENT '手机号码',
  `sex` char(1) COLLATE utf8_croatian_ci DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) COLLATE utf8_croatian_ci DEFAULT '' COMMENT '头像路径',
  `password` varchar(50) COLLATE utf8_croatian_ci DEFAULT '' COMMENT '密码',
  `salt` varchar(20) COLLATE utf8_croatian_ci DEFAULT '' COMMENT '盐加密',
  `status` char(1) COLLATE utf8_croatian_ci DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `level` char(1) COLLATE utf8_croatian_ci DEFAULT NULL COMMENT '用户等级 0系统用户 1 盘口管理员 2一级客服 3二级客服',
  `del_flag` char(1) COLLATE utf8_croatian_ci DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(50) COLLATE utf8_croatian_ci DEFAULT '' COMMENT '最后登陆IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登陆时间',
  `create_by` varchar(64) COLLATE utf8_croatian_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_croatian_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8_croatian_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`),
  KEY `INDEX_DEPT_LEVEL` (`dept_id`,`level`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=137 DEFAULT CHARSET=utf8 COLLATE=utf8_croatian_ci COMMENT='用户信息表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', '101', '0', 'admin', '若依', '00', 'ry@163.com', '15888888888', '1', '', '29c67a30398638269fe600f73a054934', '111111', '0', '0', '0', '127.0.0.1', '2019-11-12 11:32:11', 'admin', '2018-03-16 11:33:00', 'ry', '2019-11-12 11:32:11', '管理员');
INSERT INTO `sys_user` VALUES ('2', '101', '0', 'ry', '若依', '00', 'ry@qq.com', '15666666666', '1', '', '8e6d98b90472783cc73c17047ddccf36', '222222', '0', '0', '2', '127.0.0.1', '2019-09-23 18:12:42', 'admin', '2018-03-16 11:33:00', 'ry', '2019-09-23 18:12:39', '测试员');
INSERT INTO `sys_user` VALUES ('100', '101', '0', 'rjg', 'rjg', '00', '123@163.com', '18810595122', '0', '', '431ae6d8c4821e68356108c39862611f', '93b5bb', '0', '0', '0', '127.0.0.1', '2019-10-08 16:18:06', 'admin', '2019-09-23 18:01:27', '', '2019-10-08 16:18:06', null);
INSERT INTO `sys_user` VALUES ('101', '102', '0', '奖多多', '奖多多', '00', '1@1.com', '13511111111', '0', '', '8286797a0b28651aeef3dab2e43009cf', '6fe11d', '0', '1', '0', '127.0.0.1', '2019-09-26 17:40:43', 'rjg', '2019-09-23 22:45:05', '', '2019-09-26 17:40:40', null);
INSERT INTO `sys_user` VALUES ('102', '200', '0', 'vpn01', 'vpn', '00', '2@2.com', '18811111111', '0', '', '670cd876ee0a6687f8d57302721d80c6', 'a2b249', '0', '0', '0', '127.0.0.1', '2019-09-25 16:56:14', 'rjg', '2019-09-23 22:46:06', '', '2019-09-25 16:56:13', null);
INSERT INTO `sys_user` VALUES ('103', '102', '102', '奖多多01', '奖多多01', '00', '3@2.com', '13511111122', '0', '', 'd397302c0d067d05f6c49487736a9fb0', '69380b', '0', '2', '0', '127.0.0.1', '2019-09-26 17:40:02', 'rjg', '2019-09-25 19:35:16', '', '2019-09-26 17:39:59', null);
INSERT INTO `sys_user` VALUES ('104', '101', '0', 'gf', 'gf', '00', '3@3.com', '13511111113', '0', '', '9a3dd0eb5d4eed9fb243f51886835e1c', 'b0c32a', '0', '0', '0', '', null, 'rjg', '2019-09-26 14:36:12', '', null, null);
INSERT INTO `sys_user` VALUES ('105', '101', '0', 'cc', 'cc', '00', '5@1.com', '13511111112', '0', '', '28d8f65b5ba8371e631b4a490a33d77b', 'b729f0', '0', '0', '0', '127.0.0.1', '2019-09-26 14:48:57', 'rjg', '2019-09-26 14:38:30', '', '2019-09-26 14:48:54', null);
INSERT INTO `sys_user` VALUES ('106', '101', '0', 'llj', 'llj', '00', '3@1.com', '13511111143', '0', '', '5055f7c23f064ca04ad5e4cb876b05e9', 'e63f01', '0', '0', '0', '', null, 'rjg', '2019-09-26 14:44:25', '', null, null);
INSERT INTO `sys_user` VALUES ('107', '101', null, 'pyd', 'pyd', '00', '1@4.com', '13511111132', '0', '', '2eac03b1262a9ec9a23b7491ba09d6f8', 'e046fe', '0', '0', '0', '127.0.0.1', '2019-09-26 14:50:32', 'rjg', '2019-09-26 14:49:54', '', '2019-09-26 14:50:29', null);
INSERT INTO `sys_user` VALUES ('129', '211', '129', 'cp1', 'cp1', '00', 'cp1@qq.com', '13211111111', '0', '', 'e684764556bdc6320ba9b83b4df612f9', '81b683', '0', '3', '0', '127.0.0.1', '2019-10-30 14:22:46', 'admin', '2019-10-14 16:17:13', 'admin', '2019-10-30 14:22:45', '');
INSERT INTO `sys_user` VALUES ('130', '213', null, 'cp2', 'cp2', '00', 'cp2@qq.com', '13222222222', '0', '', 'cba508c0b18147e673b9f044be0e282a', '1134a2', '0', '0', '0', '', null, 'admin', '2019-10-14 16:18:50', '', null, null);
INSERT INTO `sys_user` VALUES ('131', '211', '131', 'cpm', 'cpm', '00', 'cpm@qq.com', '13233333333', '0', '', '7894767f9224db67f5f4be1136eecc3e', '0757f7', '0', '0', '0', '127.0.0.1', '2019-10-30 10:13:39', 'admin', '2019-10-14 16:19:59', 'admin', '2019-10-30 10:13:38', '');
INSERT INTO `sys_user` VALUES ('132', '211', null, 'kf123', 'kf123', '00', '', '', '0', '', 'b78d574933eb0ea3e1e02bd2258fd6bd', '30b267', '0', null, '0', '', null, 'cpm', '2019-10-16 14:24:06', '', null, null);
INSERT INTO `sys_user` VALUES ('134', '211', null, 'kf001', 'kf001', '00', '', '', '0', '', '5be5246d0f3ab491ba6921ab6ea2df08', 'bb3b0f', '0', null, '0', '', null, 'cp1', '2019-10-18 11:34:27', '', null, null);
INSERT INTO `sys_user` VALUES ('135', '211', '135', 'll11', '1111', '00', '123488@qq.com', '13233333337', '0', '', '3721cfd68d9b1715c05454e4507d0f56', 'c7edc7', '0', '3', '0', '127.0.0.1', '2019-10-29 20:34:19', 'cpm', '2019-10-29 20:26:46', 'cpm', '2019-10-29 20:34:18', '');
INSERT INTO `sys_user` VALUES ('136', '211', '136', 'll22', 'll22', '00', '123411@qq.com', '13233333338', '0', '', 'd362862581992831743129391eccee15', 'a14c22', '0', '3', '0', '', null, 'll11', '2019-10-29 20:33:09', 'll11', '2019-10-29 20:33:52', '');

-- ----------------------------
-- Table structure for sys_user_online
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_online`;
CREATE TABLE `sys_user_online` (
  `sessionId` varchar(50) COLLATE utf8_croatian_ci NOT NULL DEFAULT '' COMMENT '用户会话id',
  `login_name` varchar(50) COLLATE utf8_croatian_ci DEFAULT '' COMMENT '登录账号',
  `dept_name` varchar(50) COLLATE utf8_croatian_ci DEFAULT '' COMMENT '部门名称',
  `ipaddr` varchar(50) COLLATE utf8_croatian_ci DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) COLLATE utf8_croatian_ci DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) COLLATE utf8_croatian_ci DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) COLLATE utf8_croatian_ci DEFAULT '' COMMENT '操作系统',
  `status` varchar(10) COLLATE utf8_croatian_ci DEFAULT '' COMMENT '在线状态on_line在线off_line离线',
  `start_timestamp` datetime DEFAULT NULL COMMENT 'session创建时间',
  `last_access_time` datetime DEFAULT NULL COMMENT 'session最后访问时间',
  `expire_time` int(5) DEFAULT '0' COMMENT '超时时间，单位为分钟',
  PRIMARY KEY (`sessionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_croatian_ci COMMENT='在线用户记录';

-- ----------------------------
-- Records of sys_user_online
-- ----------------------------
INSERT INTO `sys_user_online` VALUES ('34cbde9d-c08c-4430-bd85-319c640bddc9', 'admin', '银商管理中心', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', 'on_line', '2019-11-12 11:32:04', '2019-11-12 11:42:31', '1800000');

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post` (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`,`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_croatian_ci COMMENT='用户与岗位关联表';

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES ('1', '1');
INSERT INTO `sys_user_post` VALUES ('2', '2');
INSERT INTO `sys_user_post` VALUES ('101', '3');
INSERT INTO `sys_user_post` VALUES ('102', '3');
INSERT INTO `sys_user_post` VALUES ('106', '4');
INSERT INTO `sys_user_post` VALUES ('107', '4');
INSERT INTO `sys_user_post` VALUES ('108', '3');
INSERT INTO `sys_user_post` VALUES ('131', '5');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_croatian_ci COMMENT='用户和角色关联表';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('1', '1');
INSERT INTO `sys_user_role` VALUES ('2', '2');
INSERT INTO `sys_user_role` VALUES ('100', '1');
INSERT INTO `sys_user_role` VALUES ('101', '1');
INSERT INTO `sys_user_role` VALUES ('101', '2');
INSERT INTO `sys_user_role` VALUES ('102', '2');
INSERT INTO `sys_user_role` VALUES ('129', '106');
INSERT INTO `sys_user_role` VALUES ('130', '107');
INSERT INTO `sys_user_role` VALUES ('131', '106');
INSERT INTO `sys_user_role` VALUES ('132', '106');
INSERT INTO `sys_user_role` VALUES ('134', '106');
INSERT INTO `sys_user_role` VALUES ('135', '106');
INSERT INTO `sys_user_role` VALUES ('136', '106');

-- ----------------------------
-- Table structure for t_article
-- ----------------------------
DROP TABLE IF EXISTS `t_article`;
CREATE TABLE `t_article` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '标题',
  `url` varchar(512) COLLATE utf8_bin DEFAULT NULL COMMENT '链接地址',
  `content` text COLLATE utf8_bin COMMENT '软文内容',
  `status` tinyint(2) DEFAULT '0' COMMENT '是否删除 0 未删除  1  已删除',
  `label` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '软文标签',
  `readTimes` bigint(20) DEFAULT '0' COMMENT '阅读次数',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  `imgUrl` varchar(512) COLLATE utf8_bin DEFAULT NULL COMMENT '软文icon',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='软文表';

-- ----------------------------
-- Records of t_article
-- ----------------------------
INSERT INTO `t_article` VALUES ('1', '那些年摸爬滚打出来的精华', 'https://www.jianshu.com/p/0649ff8948d8', null, '0', '三人行', '0', '2019-11-08 19:52:27', null);
INSERT INTO `t_article` VALUES ('2', '职场第1课：第一份工作的15个保命秘籍', 'https://www.jianshu.com/p/ea79d629db5d', null, '0', '职场', '0', '2019-11-08 19:59:42', null);
INSERT INTO `t_article` VALUES ('3', '这24条职场弯路，你本可以绕开的', 'https://www.jianshu.com/p/94da0eec4a36', null, '0', '职场', '0', '2019-11-08 20:00:24', null);
INSERT INTO `t_article` VALUES ('4', '熬夜时间长了会怎么样？', 'https://www.zhihu.com/question/344061018/answer/881971543', null, '0', '生活方式', '0', '2019-11-08 20:02:55', null);
INSERT INTO `t_article` VALUES ('5', '如何过极简的生活？', 'https://www.zhihu.com/question/30055346/answer/878882918', null, '0', '生活方式', '0', '2019-11-08 20:03:56', null);
INSERT INTO `t_article` VALUES ('6', '普通本科毕业生找工作真的很难吗?', 'https://www.zhihu.com/question/320784313/answer/882436619', null, '0', '求职', '0', '2019-11-08 20:04:39', null);
INSERT INTO `t_article` VALUES ('7', '老北京口中的“三馆”，藏着说不完的学问！', 'https://zhuanlan.zhihu.com/p/89809203', null, '0', '美食', '0', '2019-11-08 20:05:27', null);
INSERT INTO `t_article` VALUES ('8', '北京稻香村有哪些好吃的点心？', 'https://www.zhihu.com/question/23383198/answer/861437760', null, '0', '美食', '0', '2019-11-08 20:06:11', null);
INSERT INTO `t_article` VALUES ('9', '在北京有哪些适合一个人玩的地方？', 'https://www.zhihu.com/question/32177689/answer/871394946', null, '0', '美食', '0', '2019-11-08 20:06:38', null);
INSERT INTO `t_article` VALUES ('10', '旅行的意义在于什么呢？', 'https://www.zhihu.com/question/349398312/answer/882481289', null, '0', '旅行', '0', '2019-11-08 20:08:18', null);
INSERT INTO `t_article` VALUES ('11', '国内冬季旅行最佳目的地有啥推荐？', 'https://www.zhihu.com/question/52504090/answer/881156060', null, '0', '旅行', '0', '2019-11-08 20:08:45', null);
INSERT INTO `t_article` VALUES ('12', '比西藏神秘，2020最佳旅行国度Top1！被称为全球最幸福的地方', 'https://zhuanlan.zhihu.com/p/89919854', null, '0', '旅行', '0', '2019-11-08 20:09:47', null);

-- ----------------------------
-- Table structure for t_banner
-- ----------------------------
DROP TABLE IF EXISTS `t_banner`;
CREATE TABLE `t_banner` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `banner` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT 'banner 地址',
  `targetUrl` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '跳转链接',
  `status` tinyint(2) DEFAULT '0' COMMENT '是否删除',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  `updateTime` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of t_banner
-- ----------------------------
INSERT INTO `t_banner` VALUES ('1', 'http://localhost:9999/images/123.jpg', null, '0', '2019-11-07 15:22:28', '2019-11-07 15:22:31');
INSERT INTO `t_banner` VALUES ('2', 'http://localhost:9999/images/1234.jpg', null, '0', '2019-11-07 15:23:00', '2019-11-07 15:23:03');

-- ----------------------------
-- Table structure for t_company
-- ----------------------------
DROP TABLE IF EXISTS `t_company`;
CREATE TABLE `t_company` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `company` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '公司名称',
  `description` varchar(1000) COLLATE utf8_bin DEFAULT NULL COMMENT '公司介绍',
  `authentication` tinyint(1) DEFAULT NULL COMMENT '是否认证  0 未认证  1 已认证',
  `domain` tinyint(255) DEFAULT NULL COMMENT '所在地  关联城市表  ',
  `type` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '企业类型',
  `status` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '经营状态',
  `registeredCapital` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '注册资本',
  `registerDate` datetime DEFAULT NULL COMMENT '注册时间',
  `address` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '注册地址',
  `registrationAuthority` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '登记机关',
  `creditCode` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '统一社会信用代码',
  `groupCode` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '组织机构代码',
  `businessScop` text COLLATE utf8_bin COMMENT '经营范围',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  `updateTime` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='公司信息';

-- ----------------------------
-- Records of t_company
-- ----------------------------
INSERT INTO `t_company` VALUES ('1', '上市500强', '这是一家比较强的公司', '1', '1', '1', null, null, '2019-06-19 18:24:59', null, null, null, null, null, '2019-11-06 18:24:53', '2019-11-06 18:24:56');

-- ----------------------------
-- Table structure for t_kf_config
-- ----------------------------
DROP TABLE IF EXISTS `t_kf_config`;
CREATE TABLE `t_kf_config` (
  `id` bigint(20) NOT NULL,
  `platform` tinyint(2) DEFAULT NULL COMMENT '平台 （1 华为  2 小米 3 魅族  4 oppo 5  vivo  6 当乐 7 引用汇  8 百度应用  8 机锋市场  9 安卓市场 10 安卓市场  11 豌豆荚 12 360手机助手  13 阿里分发中心   ）',
  `position` tinyint(2) DEFAULT NULL COMMENT '客服放置位置',
  `status` tinyint(2) DEFAULT '0' COMMENT '状态  0  启用  1 停用',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  `updateTime` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='客服配置信息表';

-- ----------------------------
-- Records of t_kf_config
-- ----------------------------

-- ----------------------------
-- Table structure for t_kf_detail
-- ----------------------------
DROP TABLE IF EXISTS `t_kf_detail`;
CREATE TABLE `t_kf_detail` (
  `id` bigint(20) NOT NULL,
  `confId` bigint(20) DEFAULT NULL COMMENT '客服配置表的ID   关联 t_kf_config表的ID',
  `qq` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT 'qq',
  `wechat` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '微信',
  `aliPay` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '支付宝',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='客服详情';

-- ----------------------------
-- Records of t_kf_detail
-- ----------------------------

-- ----------------------------
-- Table structure for t_message
-- ----------------------------
DROP TABLE IF EXISTS `t_message`;
CREATE TABLE `t_message` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `type` tinyint(2) NOT NULL COMMENT '消息类型  0  系统消息  1 报名信息  ',
  `title` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '消息标题',
  `content` text COLLATE utf8_bin COMMENT '消息内容',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '消息状态 （0  未读  1 已读）',
  `userId` bigint(20) NOT NULL DEFAULT '0' COMMENT '关联t_user 表的id',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `index_1` (`status`,`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='系统消息和站内消息表';

-- ----------------------------
-- Records of t_message
-- ----------------------------
INSERT INTO `t_message` VALUES ('1', '0', '系统消息', 0xE8BF99E698AFE4B880E69DA1E7B3BBE7BB9FE6B688E681AF, '0', '0', '2019-11-07 16:56:00');
INSERT INTO `t_message` VALUES ('2', '0', '好消息', 0xE8BF99E698AFE4B88069E69DA1E7B3BBE7BB9FE5A5BDE6B688E681AF, '0', '0', '2019-11-08 16:56:04');
INSERT INTO `t_message` VALUES ('3', '0', '报名信息', 0xE682A8E79A84E68AA5E5908DE4BFA1E681AFE8A2ABE69FA5E79C8B, '1', '9', '2019-11-08 16:56:09');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `mobile` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '手机号',
  `password` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '密码',
  `faceUrl` varchar(512) COLLATE utf8_bin DEFAULT NULL COMMENT '头像地址',
  `balance` decimal(12,2) DEFAULT NULL COMMENT '账户余额',
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '姓名',
  `sex` tinyint(2) DEFAULT NULL COMMENT '性别 0  男  1  女',
  `education` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '学历',
  `birthyear` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '出生年份',
  `birthday` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '出生年月日',
  `identity` tinyint(2) DEFAULT '1' COMMENT '身份  0 学生  1  非学生',
  `height` double DEFAULT NULL COMMENT '身高',
  `weight` double DEFAULT NULL COMMENT '体重',
  `address` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '居住地点',
  `wechat` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '微信',
  `qq` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT 'QQ',
  `mail` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '邮箱',
  `descrption` text COLLATE utf8_bin COMMENT '自我介绍',
  `photo` varchar(512) COLLATE utf8_bin DEFAULT NULL COMMENT '个人照片',
  `relaName` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '真是姓名',
  `id_card` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '身份证号',
  `schedule` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '简历完成进度',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  `updateTime` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='用户信息表';

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1', '17986541236', 'e10adc3949ba59abbe56e057f20f883e', 'http://localhost:9999/images/1572699692887_images.jpg', '5000.00', '呵呵', '0', '博士后', '1993', '1993-07-20', '0', '0', '0', '奋斗啥方式', '13922222222', '123456789', '999@qq.com', 0xE59B9EE5A48DE79C8BE698AFE590A6E5BC80E5A78BE4BB98E6ACBEE9A1BAE4B8B0, 'qwe', '张呵呵', '658795412365458256', '10', '2019-11-02 17:55:27', '2019-11-02 17:55:27');
INSERT INTO `t_user` VALUES ('5', '18122223333', 'e10adc3949ba59abbe56e057f20f883e', null, null, null, null, null, null, null, '1', null, null, null, null, null, null, null, null, null, null, null, '2019-11-04 12:40:14', '2019-11-04 12:40:14');
INSERT INTO `t_user` VALUES ('9', '18301403656', 'e10adc3949ba59abbe56e057f20f883e', 'http://localhost:9999/images/1572923182864_下载.jpg', '185222200.00', '1234', '0', 'string', '2010', '2010-09-08', '0', '180', '178', '放沙发上看', '66666565', 'string', '3654@qq.com', 0xE4BB98E6ACBEE698AFE590A6E5BC80E5A78BE796AFE78B82E98081, 'http://localhost:9999/images/1573219458412_下载.jpg', 'string', '235412365422555555', 'string', '2019-11-04 16:57:32', '2019-11-04 17:00:48');
INSERT INTO `t_user` VALUES ('10', '13122225555', 'e10adc3949ba59abbe56e057f20f883e', 'http://localhost:9999/images/1573284141244_u=2830299245,1153803492&fm=26&gp=0.jpg', '10.00', '小三', '0', '还房贷', '1993', '1993', '0', '0', '0', 'fsfsfsfsdfd', 'string', 'string', '123@qq.com', 0x6A66736C6A666C73, 'string', '张三', 'string', 'string', '2019-11-09 14:11:39', '2019-11-09 15:21:07');

-- ----------------------------
-- Table structure for t_user_education
-- ----------------------------
DROP TABLE IF EXISTS `t_user_education`;
CREATE TABLE `t_user_education` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userId` bigint(20) DEFAULT NULL,
  `schoolName` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '学校',
  `domain` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '专业',
  `education` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '最高学历',
  `startTime` datetime DEFAULT NULL COMMENT '入学时间',
  `endTime` datetime DEFAULT NULL COMMENT '毕业时间',
  `experience` text COLLATE utf8_bin COMMENT '在校经历',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  `updateTime` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='学生教育信息';

-- ----------------------------
-- Records of t_user_education
-- ----------------------------
INSERT INTO `t_user_education` VALUES ('1', '9', '剑桥大学', '经济法', '博士后', '2019-11-05 11:36:57', '2019-11-05 11:36:57', 0xE68EA5E8BF9BE69DA5E688BFE997B4E698AFE99BB7E9948BE5B0B1E698AFE6B5AAE8B4B9, '2019-11-05 11:36:57', '2019-11-05 11:46:09');
INSERT INTO `t_user_education` VALUES ('2', '9', '剑桥大学', '经济法', '博士后', '2019-11-05 11:36:57', '2019-11-05 11:36:57', 0xE68EA5E8BF9BE69DA5E688BFE997B4E698AFE99BB7E9948BE5B0B1E698AFE6B5AAE8B4B9, '2019-11-05 11:45:37', '2019-11-05 11:36:57');
INSERT INTO `t_user_education` VALUES ('3', '10', '点点滴滴', '', '博士', '2019-11-09 14:12:23', '2019-11-09 14:12:23', 0xE6B395E5B888E6B395E890A8E88AACE69292E58F91E7949FE58F91E7949F, '2019-11-09 15:23:35', '2019-11-09 14:12:23');

-- ----------------------------
-- Table structure for t_user_like_job
-- ----------------------------
DROP TABLE IF EXISTS `t_user_like_job`;
CREATE TABLE `t_user_like_job` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userId` bigint(20) DEFAULT NULL COMMENT '用户ID  关联t_user表',
  `positId` bigint(20) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_1` (`userId`,`positId`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='用户收藏职位表';

-- ----------------------------
-- Records of t_user_like_job
-- ----------------------------
INSERT INTO `t_user_like_job` VALUES ('1', '9', '1', '2019-11-07 17:36:42');
INSERT INTO `t_user_like_job` VALUES ('2', '9', '3', '2019-11-07 17:36:53');
INSERT INTO `t_user_like_job` VALUES ('3', '9', '4', '2019-11-07 17:37:05');
INSERT INTO `t_user_like_job` VALUES ('4', '9', '6', '2019-11-07 17:37:18');
INSERT INTO `t_user_like_job` VALUES ('5', '9', '8', '2019-11-07 17:37:27');
INSERT INTO `t_user_like_job` VALUES ('6', '9', '9', '2019-11-07 17:37:37');
INSERT INTO `t_user_like_job` VALUES ('7', '9', '11', '2019-11-07 17:37:47');
INSERT INTO `t_user_like_job` VALUES ('8', '9', '2', '2019-11-08 15:24:18');

-- ----------------------------
-- Table structure for t_user_position
-- ----------------------------
DROP TABLE IF EXISTS `t_user_position`;
CREATE TABLE `t_user_position` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userId` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `positId` bigint(20) DEFAULT NULL COMMENT '职位ID',
  `status` tinyint(2) DEFAULT NULL COMMENT '状态（0 已报名  1被查看  2  待面试  3 已录取  4 已拒绝）',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  `updateTime` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `index_1` (`userId`,`positId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='用户报名职位关联关系表';

-- ----------------------------
-- Records of t_user_position
-- ----------------------------
INSERT INTO `t_user_position` VALUES ('1', '9', '1', '0', '2019-11-07 21:19:14', '2019-11-07 21:19:17');
INSERT INTO `t_user_position` VALUES ('2', '9', '2', '0', '2019-11-07 21:19:29', '2019-11-07 21:19:31');
INSERT INTO `t_user_position` VALUES ('3', '9', '3', '0', '2019-11-07 21:19:39', '2019-11-07 21:19:43');

-- ----------------------------
-- Table structure for t_user_workexperience
-- ----------------------------
DROP TABLE IF EXISTS `t_user_workexperience`;
CREATE TABLE `t_user_workexperience` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userId` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `title` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '职位',
  `startTime` datetime DEFAULT NULL COMMENT '入职时间',
  `endTime` datetime DEFAULT NULL COMMENT '离职时间',
  `company` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '公司名称',
  `workTime` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '工作年限',
  `workContent` text COLLATE utf8_bin COMMENT '工作内容',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  `updatetime` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='工作经历';

-- ----------------------------
-- Records of t_user_workexperience
-- ----------------------------
INSERT INTO `t_user_workexperience` VALUES ('1', '9', '非经济法律上', '2019-11-05 12:16:31', '2019-11-05 12:16:31', '快手', '5年', 0xE5B0B1E58F91E7949FE4BA86E7BAA0E7BAB7, '2019-11-05 12:16:31', '2019-11-05 12:20:16');
INSERT INTO `t_user_workexperience` VALUES ('2', '10', '法师法萨芬', '2019-11-09 14:12:28', '2019-11-09 14:12:28', '恢复上课', '1', 0xE6B395E5B888E6B395E890A8E88AACE69292E58F91E7949FE58F91E7949F, '2019-11-09 15:24:25', '2019-11-09 14:12:28');
