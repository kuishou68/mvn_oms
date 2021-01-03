/*
Navicat MySQL Data Transfer

Source Server         : a
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : oms

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2021-01-02 17:10:34
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `customer`
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer` (
  `Cid` int(10) NOT NULL AUTO_INCREMENT,
  `Cnam` char(20) DEFAULT NULL,
  `Cadd` varchar(40) DEFAULT NULL,
  `Cpeo` char(15) DEFAULT NULL,
  `Ctel` char(11) DEFAULT NULL,
  `Cmai` varchar(30) DEFAULT NULL,
  `Cnot` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`Cid`),
  UNIQUE KEY `Cnam` (`Cnam`),
  UNIQUE KEY `Ctel` (`Ctel`),
  UNIQUE KEY `Cmai` (`Cmai`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of customer
-- ----------------------------
INSERT INTO `customer` VALUES ('1', '苹果公司', '美国加利福尼亚州库比蒂诺市', '库克', '18328552197', 'timcook@icloud.com', '重要客户');
INSERT INTO `customer` VALUES ('2', '华为技术有限公司', '广东省深圳市龙岗区坂田街道华为基地', '余承东', '18328552170', 'yuchengdong@huawei.com', '');
INSERT INTO `customer` VALUES ('3', '小米科技有限责任公司', '北京市海淀区清河中街68号 华润五彩城写字楼', '雷军', '13730835952', 'leijun@mi.com', null);
INSERT INTO `customer` VALUES ('4', '魅族科技有限公司', '中国广东省珠海市科技创新海岸魅族科技楼', '黄章', '13730836021', 'huangzhang@163.com', null);
INSERT INTO `customer` VALUES ('5', '万普拉斯科技有限公司', '深圳市前海深港合作区前湾一路1号A栋', '刘作虎', '13730836136', 'liuzuohu@163.com', null);
INSERT INTO `customer` VALUES ('6', '锤子科技有限公司', '北京市朝阳区望京绿地中心A座', '罗永浩', '13730836215', 'luoyonghao@163.com', '');
INSERT INTO `customer` VALUES ('7', '三星电子', '韩国京畿道城南市盆唐区书岘洞263号三星广场大厦', '李健熙', '13730836278', 'lee@samsung.com', null);
INSERT INTO `customer` VALUES ('10', '张家界网络有限公司', '张家界永定区', '李建霖', '15845236749', '123@qq.com', null);

-- ----------------------------
-- Table structure for `order`
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `Oid` int(11) NOT NULL,
  `Pid` char(40) DEFAULT NULL,
  `Cid` int(10) DEFAULT NULL,
  `Onum` int(10) NOT NULL,
  `Otot` int(10) NOT NULL,
  `Osta` varchar(10) NOT NULL,
  `Otim` datetime NOT NULL,
  `Onot` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`Oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order
-- ----------------------------
INSERT INTO `order` VALUES ('1', '1', '1', '2500', '250000', '已完成', '2018-05-01 09:41:00', '重要订单');
INSERT INTO `order` VALUES ('2', '4', '2', '5000', '150000', '未付款', '2018-05-30 20:55:20', null);
INSERT INTO `order` VALUES ('3', '2', '7', '6000', '900000', '已发货', '2018-05-20 13:26:08', null);
INSERT INTO `order` VALUES ('4', '2', '1', '2500', '250000', '已付款', '2018-05-30 19:15:22', '');
INSERT INTO `order` VALUES ('5', '4', '1', '500', '15000', '已完成', '2018-05-15 20:55:06', '');

-- ----------------------------
-- Table structure for `product`
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `Pid` int(10) NOT NULL,
  `Pnam` varchar(20) DEFAULT NULL,
  `Puni` varchar(10) DEFAULT NULL,
  `Ppri` float NOT NULL,
  `Pnum` int(10) NOT NULL,
  `Ptyp` varchar(15) DEFAULT NULL,
  `Pbir` varchar(15) DEFAULT NULL,
  `Ppro` varchar(20) DEFAULT NULL,
  `Pnot` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`Pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('1', 'LCD显示屏', '个', '100', '10255', '显示屏', '中国', '富士康', null);
INSERT INTO `product` VALUES ('2', 'OLED显示屏', '个', '150', '45185', '显示屏', '韩国', '三星', null);
INSERT INTO `product` VALUES ('3', '高通骁龙845', '个', '30', '13158', '芯片', '美国', '高通', null);
INSERT INTO `product` VALUES ('4', '听筒', '个', '30', '46551', '听筒', '中国', '富士康', null);
INSERT INTO `product` VALUES ('5', 'GPS', '个', '80', '98512', '芯片', '美国', '摩托罗拉', null);
INSERT INTO `product` VALUES ('6', '3000mha电池', '块', '50', '84568', '电池', '中国', '富士康', null);
INSERT INTO `product` VALUES ('7', '玻璃后盖', '个', '200', '21561', '后盖', '中国', '富士康', null);
INSERT INTO `product` VALUES ('8', '金属后盖', '个', '180', '21854', '后盖', '中国', '富士康', null);
INSERT INTO `product` VALUES ('9', '2000w后置摄像头', '个', '250', '21574', '摄像头', '韩国', '三星', null);
INSERT INTO `product` VALUES ('10', '800w前置摄像头', '个', '100', '95462', '摄像头', '日本', '索尼', null);

-- ----------------------------
-- Table structure for `sys_product_order`
-- ----------------------------
DROP TABLE IF EXISTS `sys_product_order`;
CREATE TABLE `sys_product_order` (
  `Pid` bigint(20) NOT NULL COMMENT '产品ID',
  `Oid` bigint(20) NOT NULL COMMENT '订单ID',
  PRIMARY KEY (`Pid`,`Oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='产品和订单关联表';

-- ----------------------------
-- Records of sys_product_order
-- ----------------------------
INSERT INTO `sys_product_order` VALUES ('1', '1');
INSERT INTO `sys_product_order` VALUES ('2', '2');

-- ----------------------------
-- Table structure for `sys_role`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(4) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) DEFAULT '1' COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) DEFAULT '1' COMMENT '部门树选择项是否关联显示',
  `status` char(1) NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='角色信息表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '超级管理员', 'admin', '1', '1', '1', '1', '0', '0', 'admin', '2020-12-29 10:40:15', '', null, '超级管理员');
INSERT INTO `sys_role` VALUES ('2', '普通角色', 'common', '2', '2', '1', '1', '0', '0', 'admin', '2020-12-29 10:40:15', '', null, '普通角色');

-- ----------------------------
-- Table structure for `sys_user`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `user_name` varchar(30) DEFAULT NULL COMMENT '用户账号',
  `nick_name` varchar(30) DEFAULT NULL COMMENT '用户昵称',
  `user_type` varchar(2) DEFAULT '01' COMMENT '用户类型（00系统用户 01普通用户）',
  `email` varchar(50) DEFAULT NULL COMMENT '用户邮箱',
  `phonenumber` varchar(11) DEFAULT NULL COMMENT '手机号码',
  `sex` char(1) DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `password` varchar(100) DEFAULT NULL COMMENT '密码',
  `status` char(1) DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(50) DEFAULT NULL COMMENT '最后登录IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) DEFAULT 'admin' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=120 DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'kuishou', '魁首', null, '783533896@qq.com', '15888888811', '1', '123456', '0', '0', '127.0.0.1', '2020-12-30 16:08:18', 'admin', '2020-12-30 16:08:18', '', null, '管理员');
INSERT INTO `sys_user` VALUES ('2', 'lingixu', '领秀', '01', '783533896@qq.com', '15666666666', '0', '123456', '0', '0', '127.0.0.1', '2020-12-30 16:08:18', 'admin', '2020-12-30 16:08:18', '', null, '客户');
INSERT INTO `sys_user` VALUES ('3', 'zhangsan', '张三', '01', '111@qq.com', '15666666666', '1', '123456', '0', '0', '127.0.0.1', '2020-12-30 16:08:18', 'admin', '2020-12-30 16:08:18', '', null, '客户');
INSERT INTO `sys_user` VALUES ('4', 'lisi', '李四', '01', '222@qq.com', '15666666666', '0', '123456', '0', '0', '127.0.0.1', '2020-12-30 16:08:18', 'admin', '2020-12-30 16:08:18', '', null, '客户');
INSERT INTO `sys_user` VALUES ('115', 'wangwu', null, null, '5555@qq.com', '15326489753', '0', null, '0', '0', null, null, 'admin', null, '', null, null);
INSERT INTO `sys_user` VALUES ('116', 'zhaoliu', null, null, '6665@qq.com', '15362947863', '0', null, '0', '0', null, null, 'admin', null, '', null, null);
INSERT INTO `sys_user` VALUES ('117', 'hhhh', null, '01', '8888@qq.com', '15642987436', '0', null, '0', '0', null, null, 'admin', null, '', null, null);
INSERT INTO `sys_user` VALUES ('119', 'hhh', null, '01', '123@qq.com', '15326487956', '1', null, '0', '0', null, null, 'admin', null, '', null, null);

-- ----------------------------
-- Table structure for `sys_user_order`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_order`;
CREATE TABLE `sys_user_order` (
  `Oid` bigint(20) NOT NULL COMMENT '订单ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  PRIMARY KEY (`Oid`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户和订单关联表';

-- ----------------------------
-- Records of sys_user_order
-- ----------------------------
INSERT INTO `sys_user_order` VALUES ('1', '1');
INSERT INTO `sys_user_order` VALUES ('2', '2');

-- ----------------------------
-- Table structure for `sys_user_role`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户和角色关联表';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('1', '1');
INSERT INTO `sys_user_role` VALUES ('2', '2');
