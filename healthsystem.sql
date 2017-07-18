/*
Navicat MySQL Data Transfer

Source Server         : wangzhe
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : healthsystem

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2017-07-18 22:44:31
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `about`
-- ----------------------------
DROP TABLE IF EXISTS `about`;
CREATE TABLE `about` (
  `about_id` mediumint(8) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `about_img` varchar(32) DEFAULT NULL COMMENT '图片',
  `about_title` varchar(32) DEFAULT NULL COMMENT '标题',
  `about_info` varchar(255) DEFAULT NULL COMMENT '介绍',
  `about_copy` varchar(128) DEFAULT NULL COMMENT '版权',
  `about_time` varchar(16) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`about_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='关于APP';

-- ----------------------------
-- Records of about
-- ----------------------------

-- ----------------------------
-- Table structure for `analyze`
-- ----------------------------
DROP TABLE IF EXISTS `analyze`;
CREATE TABLE `analyze` (
  `analyze_id` mediumint(8) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `analyze_down` varchar(16) DEFAULT NULL COMMENT '下载量',
  `doc_reg` varchar(16) DEFAULT NULL COMMENT '医生注册数',
  `user_reg` varchar(16) DEFAULT NULL COMMENT '用户注册数',
  `online_doc` varchar(16) DEFAULT NULL COMMENT '在线医生人数',
  `online_user` varchar(16) DEFAULT NULL COMMENT '在线用户人数',
  `count_rece` varchar(16) DEFAULT NULL COMMENT '累计就诊人数',
  `analyze_time` varchar(16) DEFAULT NULL COMMENT '时间',
  PRIMARY KEY (`analyze_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='统计分析表';

-- ----------------------------
-- Records of analyze
-- ----------------------------

-- ----------------------------
-- Table structure for `attention_doc`
-- ----------------------------
DROP TABLE IF EXISTS `attention_doc`;
CREATE TABLE `attention_doc` (
  `atten_id` int(16) NOT NULL AUTO_INCREMENT COMMENT '记录ID',
  `user_phone` varchar(16) DEFAULT NULL COMMENT '用户电话',
  `doc_phone` varchar(16) DEFAULT NULL COMMENT '医生电话',
  `atten_time` varchar(16) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`atten_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='用户关注表';

-- ----------------------------
-- Records of attention_doc
-- ----------------------------
INSERT INTO `attention_doc` VALUES ('9', '15768653949', '11768653949', '2017-05-05 00:51');
INSERT INTO `attention_doc` VALUES ('10', 'null', '11768653949', '2017-06-06 16:35');
INSERT INTO `attention_doc` VALUES ('11', '15768650568', '15768651578', '2017-06-06 16:36');

-- ----------------------------
-- Table structure for `attention_hos`
-- ----------------------------
DROP TABLE IF EXISTS `attention_hos`;
CREATE TABLE `attention_hos` (
  `id` int(16) NOT NULL AUTO_INCREMENT,
  `user_phone` varchar(16) DEFAULT NULL,
  `hos_id` int(16) DEFAULT NULL,
  `time` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of attention_hos
-- ----------------------------
INSERT INTO `attention_hos` VALUES ('9', '15768653949', '54', '2017-05-05 01:15');
INSERT INTO `attention_hos` VALUES ('10', 'null', '55', '2017-06-05 10:54');
INSERT INTO `attention_hos` VALUES ('11', 'null', '57', '2017-06-06 16:34');
INSERT INTO `attention_hos` VALUES ('12', 'null', '53', '2017-06-06 16:34');

-- ----------------------------
-- Table structure for `auth`
-- ----------------------------
DROP TABLE IF EXISTS `auth`;
CREATE TABLE `auth` (
  `auth_id` mediumint(8) NOT NULL AUTO_INCREMENT COMMENT '权限ID',
  `auth_name` varchar(32) NOT NULL COMMENT '权限名称',
  `auth_pid` varchar(32) NOT NULL COMMENT '父ID',
  `auth_c` varchar(64) NOT NULL COMMENT '模块',
  `auth_a` varchar(64) NOT NULL COMMENT '操作方法',
  `auth_path` varchar(128) NOT NULL COMMENT '全路径',
  `auth_level` varchar(8) NOT NULL COMMENT '级别',
  PRIMARY KEY (`auth_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='后台管理员权限表';

-- ----------------------------
-- Records of auth
-- ----------------------------

-- ----------------------------
-- Table structure for `auth_group`
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `title` char(100) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `rules` char(80) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group
-- ----------------------------
INSERT INTO `auth_group` VALUES ('1', '超级管理员', '1', '1,3,7,4,5,6,8,2,11,12,13,19,23,24,25,9,10');
INSERT INTO `auth_group` VALUES ('2', '普通用户', '1', '1,2,3');
INSERT INTO `auth_group` VALUES ('3', '科室管理员', '1', '1,3,8,19,23,24,25');
INSERT INTO `auth_group` VALUES ('4', '医院管理员', '1', '1,3,8,2,11,12,13');
INSERT INTO `auth_group` VALUES ('5', '疾病管理员', '1', '1,3,8');
INSERT INTO `auth_group` VALUES ('6', '功能管理员', '1', '1,3,9');
INSERT INTO `auth_group` VALUES ('7', '用户管理员', '1', '1,3,7,4,5,6');

-- ----------------------------
-- Table structure for `auth_group_access`
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_access`;
CREATE TABLE `auth_group_access` (
  `uid` mediumint(8) unsigned NOT NULL,
  `group_id` mediumint(8) unsigned NOT NULL,
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  KEY `uid` (`uid`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group_access
-- ----------------------------
INSERT INTO `auth_group_access` VALUES ('1', '1');
INSERT INTO `auth_group_access` VALUES ('1', '2');
INSERT INTO `auth_group_access` VALUES ('8', '1');
INSERT INTO `auth_group_access` VALUES ('8', '4');
INSERT INTO `auth_group_access` VALUES ('9', '2');

-- ----------------------------
-- Table structure for `auth_rule`
-- ----------------------------
DROP TABLE IF EXISTS `auth_rule`;
CREATE TABLE `auth_rule` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(80) NOT NULL DEFAULT '',
  `title` char(20) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `condition` char(100) DEFAULT '',
  `pid` mediumint(9) NOT NULL COMMENT '父权限ID',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_rule
-- ----------------------------
INSERT INTO `auth_rule` VALUES ('1', 'Admin/Index/index', '后台首页', '1', '', '0');
INSERT INTO `auth_rule` VALUES ('2', 'Admin/Hospital/listHos', '医院管理', '1', '', '8');
INSERT INTO `auth_rule` VALUES ('3', 'Admin/Index/main', '主界面', '1', '', '1');
INSERT INTO `auth_rule` VALUES ('4', 'Admin/Relative/listRela', '亲友管理', '1', '', '7');
INSERT INTO `auth_rule` VALUES ('5', 'Admin/HistoryVis/listHis', '历史就诊', '1', '', '7');
INSERT INTO `auth_rule` VALUES ('6', 'Admin/User/listUser', '用户管理', '1', '', '7');
INSERT INTO `auth_rule` VALUES ('7', 'Admin/Nav/user', '用户管理', '1', '', '0');
INSERT INTO `auth_rule` VALUES ('8', 'Admin/Nav/hospital', '医院管理', '1', '', '0');
INSERT INTO `auth_rule` VALUES ('9', 'Admin/Nav/config', '功能管理', '1', '', '0');
INSERT INTO `auth_rule` VALUES ('10', 'Admin/Nav/auth', '权限控制', '1', '', '0');
INSERT INTO `auth_rule` VALUES ('11', 'Admin/Hospital/addHos', '添加医院', '1', '', '2');
INSERT INTO `auth_rule` VALUES ('12', 'Admin/Hospital/edit', '修改医院', '1', '', '2');
INSERT INTO `auth_rule` VALUES ('13', 'Admin/Hospital/del', '删除医院', '1', '', '2');
INSERT INTO `auth_rule` VALUES ('24', 'Admin/Department/edit', '修改科室', '1', '', '19');
INSERT INTO `auth_rule` VALUES ('25', 'Admin/Department/delete', '删除科室', '1', '', '19');
INSERT INTO `auth_rule` VALUES ('19', 'Admin/Department/listDep', '科室管理', '1', '', '8');
INSERT INTO `auth_rule` VALUES ('23', 'Admin/Department/add', '添加科室', '1', '', '19');

-- ----------------------------
-- Table structure for `check_img`
-- ----------------------------
DROP TABLE IF EXISTS `check_img`;
CREATE TABLE `check_img` (
  `check_img_id` int(16) NOT NULL AUTO_INCREMENT COMMENT '图片ID',
  `seecase_id` mediumint(9) NOT NULL COMMENT '图片名字',
  `check_img_path` varchar(150) DEFAULT NULL COMMENT '图片路径',
  `time` varchar(16) DEFAULT NULL COMMENT '时间',
  PRIMARY KEY (`check_img_id`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8 COMMENT='检查图片表';

-- ----------------------------
-- Records of check_img
-- ----------------------------
INSERT INTO `check_img` VALUES ('6', '8', 'checkImg/2017-04-16/58f2d17d93cb9.jpg', '2017-04-16 10:05');
INSERT INTO `check_img` VALUES ('7', '2', 'checkImg/2017-04-16/58f2fdb92e190.jpg', '2017-04-16 13:14');
INSERT INTO `check_img` VALUES ('8', '12', 'checkImg/2017-04-16/58f3040027c4b.jpg', '2017-04-16 13:41');
INSERT INTO `check_img` VALUES ('9', '18', 'checkImg/2017-04-17/58f4b0e312d89.jpg', '2017-04-17 20:11');
INSERT INTO `check_img` VALUES ('87', '349', 'checkImg/2017-04-21/58f8e4e10067d.jpg', '2017-04-21 00:42');
INSERT INTO `check_img` VALUES ('91', '359', 'checkImg/2017-04-22/58fabdb10c841.jpeg', '2017-04-22 10:19');
INSERT INTO `check_img` VALUES ('98', '370', 'checkImg/2017-04-22/58faed862be50.jpg', '2017-04-22 13:43');
INSERT INTO `check_img` VALUES ('101', '377', 'checkImg/2017-04-22/58fb1f8d82451.jpg', '2017-04-22 17:17');

-- ----------------------------
-- Table structure for `chufang`
-- ----------------------------
DROP TABLE IF EXISTS `chufang`;
CREATE TABLE `chufang` (
  `cf_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_phone` varchar(16) DEFAULT NULL,
  `doc_phone` varchar(16) DEFAULT NULL,
  `hos_name` varchar(16) DEFAULT NULL,
  `doc_name` varchar(16) DEFAULT NULL,
  `zhenduan` longtext,
  `jianyi` longtext,
  `chufang` longtext,
  `jianyan` longtext,
  `cf_time` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`cf_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='处方表';

-- ----------------------------
-- Records of chufang
-- ----------------------------
INSERT INTO `chufang` VALUES ('14', '15768653949', '11768653949', '惠州市儿童医院', '刘冠贤', '心脏病', '多注意休息', '阿司匹林', '', '2017-05-05 00:50');

-- ----------------------------
-- Table structure for `chufang_img`
-- ----------------------------
DROP TABLE IF EXISTS `chufang_img`;
CREATE TABLE `chufang_img` (
  `cf_img_id` int(11) NOT NULL AUTO_INCREMENT,
  `cf_img_path` varchar(255) DEFAULT NULL,
  `user_phone` varchar(16) DEFAULT NULL,
  `doc_phone` varchar(16) DEFAULT NULL,
  `cf_img_time` varchar(16) DEFAULT NULL,
  `cf_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`cf_img_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of chufang_img
-- ----------------------------
INSERT INTO `chufang_img` VALUES ('1', 'Chufang/2017-05-03/5908cea9c9dc7.jpg', '15768653949', '15768651577', '2017-05-03 02:23', null);
INSERT INTO `chufang_img` VALUES ('2', 'Chufang/2017-05-03/5908cea9d659a.jpg', '15768653949', '15768651577', '2017-05-03 02:23', null);
INSERT INTO `chufang_img` VALUES ('3', 'Chufang/2017-05-03/5908cfad77702.jpg', '15768653949', '15768651577', '2017-05-03 02:27', null);
INSERT INTO `chufang_img` VALUES ('4', 'Chufang/2017-05-03/5908d373bbd11.jpg', '15768653949', '15768651577', '2017-05-03 02:44', null);
INSERT INTO `chufang_img` VALUES ('5', 'Chufang/2017-05-03/5908d3ffabc2c.jpg', '15768653949', '15768651577', '2017-05-03 02:46', '5');
INSERT INTO `chufang_img` VALUES ('6', 'Chufang/2017-05-03/5908d3ffbeee7.jpg', '15768653949', '15768651577', '2017-05-03 02:46', '5');
INSERT INTO `chufang_img` VALUES ('7', 'Chufang/2017-05-03/5908d9f5e8a2d.jpg', '15768653949', '15768651577', '2017-05-03 03:11', '6');
INSERT INTO `chufang_img` VALUES ('8', 'Chufang/2017-05-03/5908d9f600a30.jpg', '15768653949', '15768651577', '2017-05-03 03:11', '6');
INSERT INTO `chufang_img` VALUES ('9', 'Chufang/2017-05-03/5908da94cde63.jpg', '15768653949', '15768651577', '2017-05-03 03:14', '7');
INSERT INTO `chufang_img` VALUES ('10', 'Chufang/2017-05-03/5908dac64cd45.jpg', '15768653949', '15768651577', '2017-05-03 03:15', '8');
INSERT INTO `chufang_img` VALUES ('11', 'Chufang/2017-05-03/5908dc91e0da4.jpg', '15768653949', '15768651577', '2017-05-03 03:22', '9');
INSERT INTO `chufang_img` VALUES ('12', 'Chufang/2017-05-04/590a905e0fd5f.jpg', '15768651577', '12768653949', '2017-05-04 10:22', '12');
INSERT INTO `chufang_img` VALUES ('13', 'Chufang/2017-05-05/590b5807075d4.jpg', '15768653949', '12768653949', '2017-05-05 00:34', '13');
INSERT INTO `chufang_img` VALUES ('14', 'Chufang/2017-05-05/590b5be7a3413.jpg', '15768653949', '11768653949', '2017-05-05 00:50', '14');

-- ----------------------------
-- Table structure for `department_info`
-- ----------------------------
DROP TABLE IF EXISTS `department_info`;
CREATE TABLE `department_info` (
  `dep_id` mediumint(9) NOT NULL AUTO_INCREMENT COMMENT '科室ID',
  `dep_name` varchar(30) NOT NULL COMMENT '科室名称',
  `parent_id` mediumint(9) NOT NULL DEFAULT '0',
  PRIMARY KEY (`dep_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COMMENT='科室信息';

-- ----------------------------
-- Records of department_info
-- ----------------------------
INSERT INTO `department_info` VALUES ('1', '外科', '0');
INSERT INTO `department_info` VALUES ('2', '内科', '0');
INSERT INTO `department_info` VALUES ('3', '骨科', '0');
INSERT INTO `department_info` VALUES ('4', '儿科', '0');
INSERT INTO `department_info` VALUES ('5', '妇产科', '0');
INSERT INTO `department_info` VALUES ('6', '神经外科', '1');
INSERT INTO `department_info` VALUES ('7', '心血管外科', '1');
INSERT INTO `department_info` VALUES ('8', '心血管内科', '2');
INSERT INTO `department_info` VALUES ('9', '神经内科', '2');
INSERT INTO `department_info` VALUES ('10', '妇科', '5');
INSERT INTO `department_info` VALUES ('11', '皮肤科', '3');
INSERT INTO `department_info` VALUES ('12', '儿科', '4');
INSERT INTO `department_info` VALUES ('13', '脊柱外科', '3');
INSERT INTO `department_info` VALUES ('14', '眼科', '4');
INSERT INTO `department_info` VALUES ('15', '产科', '5');
INSERT INTO `department_info` VALUES ('16', '消化内科', '2');
INSERT INTO `department_info` VALUES ('17', '肿瘤科', '0');
INSERT INTO `department_info` VALUES ('18', '肿瘤内科', '17');
INSERT INTO `department_info` VALUES ('19', '泌尿外科', '1');

-- ----------------------------
-- Table structure for `depa_illness`
-- ----------------------------
DROP TABLE IF EXISTS `depa_illness`;
CREATE TABLE `depa_illness` (
  `depa_illness_id` mediumint(8) NOT NULL AUTO_INCREMENT COMMENT '关联ID',
  `one_depa_id` mediumint(8) NOT NULL COMMENT '一级科室ID',
  `two_depa_id` mediumint(8) NOT NULL COMMENT '二级科室ID',
  `illness_id` mediumint(8) NOT NULL COMMENT '疾病ID',
  PRIMARY KEY (`depa_illness_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='科室疾病关联表';

-- ----------------------------
-- Records of depa_illness
-- ----------------------------

-- ----------------------------
-- Table structure for `diet`
-- ----------------------------
DROP TABLE IF EXISTS `diet`;
CREATE TABLE `diet` (
  `diet_id` int(16) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_id` int(16) NOT NULL COMMENT '用户ID',
  `usediet_id` int(16) NOT NULL COMMENT '记录人ID',
  `type_diet` varchar(8) DEFAULT NULL COMMENT '餐型',
  `food` varchar(255) DEFAULT NULL COMMENT '食物',
  `diet_time` varchar(16) DEFAULT NULL COMMENT '用餐时间',
  `time` varchar(16) DEFAULT NULL COMMENT '记录日期',
  PRIMARY KEY (`diet_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='饮食记录表';

-- ----------------------------
-- Records of diet
-- ----------------------------

-- ----------------------------
-- Table structure for `doctor_info`
-- ----------------------------
DROP TABLE IF EXISTS `doctor_info`;
CREATE TABLE `doctor_info` (
  `doc_id` mediumint(8) NOT NULL AUTO_INCREMENT COMMENT '医生ID',
  `hos_id` mediumint(8) NOT NULL COMMENT '所属医院ID',
  `depa_id` mediumint(8) NOT NULL COMMENT '所属科室ID',
  `doc_name` varchar(32) NOT NULL COMMENT '医生姓名',
  `doc_sex` enum('女','男') NOT NULL DEFAULT '男' COMMENT '医生性别',
  `doc_img` varchar(128) NOT NULL COMMENT '医生头像',
  `doc_phone` varchar(32) NOT NULL COMMENT '医生电话',
  `doc_password` varchar(128) NOT NULL DEFAULT '123456' COMMENT '医生密码',
  `doc_especial` varchar(255) NOT NULL COMMENT '医生擅长',
  `doc_introduce` longtext COMMENT '医生介绍',
  `doc_address` varchar(128) NOT NULL COMMENT '所属地址',
  `doc_alipay` varchar(32) DEFAULT NULL COMMENT '支付宝账号',
  `doc_rece` varchar(8) NOT NULL COMMENT '线上累计接诊',
  `doc_hot` varchar(255) NOT NULL DEFAULT '0' COMMENT '热门程度',
  `doc_attention` varchar(8) DEFAULT NULL COMMENT '被关注量',
  `doc_fee` varchar(8) DEFAULT NULL COMMENT '费用',
  `doc_time` varchar(16) NOT NULL COMMENT '创建时间',
  `im_token` varchar(255) DEFAULT NULL COMMENT '医生聊天token',
  `doc_cid` varchar(255) DEFAULT NULL COMMENT '个推要用的cid',
  `doc_token` varchar(255) DEFAULT NULL,
  `token_time` varchar(255) DEFAULT NULL,
  `doc_zhiye` varchar(255) DEFAULT NULL COMMENT '执业点',
  `doc_age` varchar(16) DEFAULT NULL COMMENT '年龄',
  PRIMARY KEY (`doc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8 COMMENT='医生信息表';

-- ----------------------------
-- Records of doctor_info
-- ----------------------------
INSERT INTO `doctor_info` VALUES ('1', '55', '2', '王哲', '男', 'doctor/0504/1.png', '15768651579', 'e10adc3949ba59abbe56e057f20f883e', '心血管内科', '&lt;p&gt;哈哈啊哈哈哈的境况涉及到卡时间段库拉索建档立卡涉及到拉时间段雷克萨&amp;nbsp;&lt;/p&gt;', '北京 东城区 ', '15768650568', '213123', '456', '1278', '23', '2017-03-29 19:17', 'fh+LgoorVLvwkWb8ezwH+gw5f5aZvT5xw3JgzbRIqa9f++CboQfQJugg98teFg1+dirRB9E4cqQkuqWCW/novrcSCIKmu0mR', '', '8b30bc3c12c82e3ab6f6aad55e4b82ea', '2017-06-06 22:26:38', null, '40');
INSERT INTO `doctor_info` VALUES ('10', '55', '2', '柳下惠', '男', 'doctor/0504/2.png', '15768651578', 'e10adc3949ba59abbe56e057f20f883e', '鼻炎、皮肤病', '&lt;p&gt;1111&lt;/p&gt;', '广东 惠州 惠城区', '15768650568', '135', '114', '454', '48', '2017-03-22 15:26', 'SkozrTqAAIy2qtxx9ytySgw5f5aZvT5xw3JgzbRIqa+L76gWTUero8r0cW89G7NPdirRB9E4cqQkuqWCW/novjsYXSKuZTiL', null, null, null, null, '42');
INSERT INTO `doctor_info` VALUES ('20', '55', '3', '姚桂泰', '男', 'doctor/0504/3.png', '15768651577', 'e10adc3949ba59abbe56e057f20f883e', '骨外科', '&lt;p&gt;啊实打实大所大所&lt;/p&gt;', '广东 惠州 惠城区', '15768650568', '435', '230', '134', '58', '2017-03-22 17:55', 'nwErqNjm+BtYyjXZ3GR6W0eCMLfsJdG7DU8H1ybxjweIGYfROLLh8jQS3Vv0slEVAApMVpD1m3vwl/x9sbLqlwjA/rMMOzfD', '411c1018f0df4c29ec5d25a2e6dfeb88', '5e92174c0f883db4f345bca212b59c52', '2017-05-04 13:55:15', null, '43');
INSERT INTO `doctor_info` VALUES ('31', '55', '6', '张洋豪', '男', 'doctor/0504/4.png', '15768651576', 'e10adc3949ba59abbe56e057f20f883e', '妇科', '&lt;p&gt;黄玉良于1999-2000年度在北京积水潭医院参加第36届全国骨科医师进修班学习。从事临床医疗工作26年，迄今为止长期在临床一线工作，担任创伤骨科科主任，是学科带头人，具有丰富的临床经验，处理过大量的创伤病例，率先在惠州市把创伤院前急救、院内急诊与骨科专科病区一体化管理。擅长四肢骨折、关节复杂骨折、髋关节置换、腰腿痛等的诊治。&lt;/p&gt;', '广东 惠州 惠城区', '15768650568', '124', '12', '55', '56', '2017-03-23 18:30', 'gR9jgvDeR+AHeNgWH+CEgQw5f5aZvT5xw3JgzbRIqa+66NbwxcXwPaBvgNN/ps3mR07B+R0eHGYkuqWCW/novukq+fYO5GtH', 'e23339f872349ef6002998397ca0d669', '270824c56c451a5f1a1e74d4e08cda6e', '2017-04-29 13:50:25', null, '36');
INSERT INTO `doctor_info` VALUES ('32', '54', '10', '叶莉', '女', 'doctor/0504/5.png', '15768651575', 'e10adc3949ba59abbe56e057f20f883e', '鼻炎、皮肤病', '&lt;p&gt;黄玉良于1999-2000年度在北京积水潭医院参加第36届全国骨科医师进修班学习。从事临床医疗工作26年，迄今为止长期在临床一线工作，担任创伤骨科科主任，是学科带头人，具有丰富的临床经验，处理过大量的创伤病例，率先在惠州市把创伤院前急救、院内急诊与骨科专科病区一体化管理。擅长四肢骨折、关节复杂骨折、髋关节置换、腰腿痛等的诊治。&lt;/p&gt;', '广东 惠州 惠城区', '15768650568', '1247', '1111', '17', '74', '2017-03-30 22:10', 'w9EwB8vJX+uIC+KHL23cyQw5f5aZvT5xw3JgzbRIqa+L76gWTUerozYwdxP5IpJHt4L0u6EuZe4kuqWCW/novlSJEqWPmIq6', null, null, null, null, '38');
INSERT INTO `doctor_info` VALUES ('33', '57', '9', '叶伟发', '男', 'doctor/0504/1.png', '15768651574', 'e10adc3949ba59abbe56e057f20f883e', '骨科', '&lt;p&gt;黄玉良于1999-2000年度在北京积水潭医院参加第36届全国骨科医师进修班学习。从事临床医疗工作26年，迄今为止长期在临床一线工作，担任创伤骨科科主任，是学科带头人，具有丰富的临床经验，处理过大量的创伤病例，率先在惠州市把创伤院前急救、院内急诊与骨科专科病区一体化管理。擅长四肢骨折、关节复杂骨折、髋关节置换、腰腿痛等的诊治。&lt;/p&gt;', '广东 惠州 惠城区', '15768650568', '131', '111', '45', '123', '2017-04-07 22:11', 'Qm+2/pqDe8mby3220ZRWLVJSNIpA9S6EZU7IckO4ZgdgZi4u1o2ODnfveaVuATsx0ZV3W9VG58ywKNt4LG5AuA5mWHB9U8Fa', null, null, null, null, '35');
INSERT INTO `doctor_info` VALUES ('34', '57', '8', '林庆涛', '男', 'doctor/0504/2.png', '15768651573', 'e10adc3949ba59abbe56e057f20f883e', '心肌梗塞', '&lt;p&gt;黄玉良于1999-2000年度在北京积水潭医院参加第36届全国骨科医师进修班学习。从事临床医疗工作26年，迄今为止长期在临床一线工作，担任创伤骨科科主任，是学科带头人，具有丰富的临床经验，处理过大量的创伤病例，率先在惠州市把创伤院前急救、院内急诊与骨科专科病区一体化管理。擅长四肢骨折、关节复杂骨折、髋关节置换、腰腿痛等的诊治。&lt;/p&gt;', '广东 惠州 惠城区', '15768650568', '132', '213', '131', '123', '2017-04-07 22:10', 'fMahdrUUeR5ZD5oMAvGKWFJSNIpA9S6EZU7IckO4ZgdgZi4u1o2ODogo9ne6SiG/0ZV3W9VG58ywKNt4LG5AuNspSqNkvDRR', null, null, null, null, '46');
INSERT INTO `doctor_info` VALUES ('35', '56', '6', '郑文志', '男', 'doctor/0504/3.png', '15768651572', 'e10adc3949ba59abbe56e057f20f883e', '脑外伤、脑出血', '&lt;p&gt;黄玉良于1999-2000年度在北京积水潭医院参加第36届全国骨科医师进修班学习。从事临床医疗工作26年，迄今为止长期在临床一线工作，担任创伤骨科科主任，是学科带头人，具有丰富的临床经验，处理过大量的创伤病例，率先在惠州市把创伤院前急救、院内急诊与骨科专科病区一体化管理。擅长四肢骨折、关节复杂骨折、髋关节置换、腰腿痛等的诊治。&lt;/p&gt;', '广东 惠州 惠城区', '15768650568', '341', '113', '324', '123', '2017-04-07 22:24', '9nbBNhjga4so5e1TJPYJdgw5f5aZvT5xw3JgzbRIqa+L76gWTUero4PT7zX69krW4G7SMrhpDZckuqWCW/novrSxEPLO8fVv', null, null, null, null, '27');
INSERT INTO `doctor_info` VALUES ('36', '56', '6', '李随生', '男', 'doctor/0504/4.png', '15768651570', 'e10adc3949ba59abbe56e057f20f883e', '骨伤', '&lt;p&gt;黄玉良于1999-2000年度在北京积水潭医院参加第36届全国骨科医师进修班学习。从事临床医疗工作26年，迄今为止长期在临床一线工作，担任创伤骨科科主任，是学科带头人，具有丰富的临床经验，处理过大量的创伤病例，率先在惠州市把创伤院前急救、院内急诊与骨科专科病区一体化管理。擅长四肢骨折、关节复杂骨折、髋关节置换、腰腿痛等的诊治。&lt;/p&gt;', '广东 惠州 惠城区', '15768650568', '212', '12', '124', '123', '2017-04-07 22:25', 'CqiZ8og8J9UIuyYYsbyghlJSNIpA9S6EZU7IckO4ZgdgZi4u1o2ODvg4ktKesOVY0ZV3W9VG58ywKNt4LG5AuNtNRziuCRfQ', null, null, null, null, '35');
INSERT INTO `doctor_info` VALUES ('37', '54', '10', '李佳迪', '男', 'doctor/0504/5.png', '15768651569', 'e10adc3949ba59abbe56e057f20f883e', '子宫肌瘤', '&lt;p&gt;黄玉良于1999-2000年度在北京积水潭医院参加第36届全国骨科医师进修班学习。从事临床医疗工作26年，迄今为止长期在临床一线工作，担任创伤骨科科主任，是学科带头人，具有丰富的临床经验，处理过大量的创伤病例，率先在惠州市把创伤院前急救、院内急诊与骨科专科病区一体化管理。擅长四肢骨折、关节复杂骨折、髋关节置换、腰腿痛等的诊治。&lt;/p&gt;', '广东 惠州 惠城区', '15768650568', '244', '11', '214', '23', '2017-04-07 22:26', 'j8n4viitOTI0H52aYx3GMAw5f5aZvT5xw3JgzbRIqa+L76gWTUero1nfcaXrLbWIt4L0u6EuZe4kuqWCW/novi+23qTO+oMo', null, null, null, null, '34');
INSERT INTO `doctor_info` VALUES ('38', '53', '9', '蔡刘聪', '男', 'doctor/0504/1.png', '15768651568', 'e10adc3949ba59abbe56e057f20f883e', '儿科', '&lt;p&gt;黄玉良于1999-2000年度在北京积水潭医院参加第36届全国骨科医师进修班学习。从事临床医疗工作26年，迄今为止长期在临床一线工作，担任创伤骨科科主任，是学科带头人，具有丰富的临床经验，处理过大量的创伤病例，率先在惠州市把创伤院前急救、院内急诊与骨科专科病区一体化管理。擅长四肢骨折、关节复杂骨折、髋关节置换、腰腿痛等的诊治。&lt;/p&gt;', '福建 福州 鼓楼区', '15768650568', '318', '11', '121', '123', '2017-04-07 22:27', 'ib7bzm1NBzasbBC7K5FXhEeCMLfsJdG7DU8H1ybxjweIGYfROLLh8jM0ZSaTlbGfqVHaLUWvgLXwl/x9sbLqlx2zFMb8lkCS', null, null, null, null, '35');
INSERT INTO `doctor_info` VALUES ('39', '53', '8', '黄宇红', '男', 'doctor/0504/2.png', '15768651567', 'e10adc3949ba59abbe56e057f20f883e', '冠心病', '&lt;p&gt;黄玉良于1999-2000年度在北京积水潭医院参加第36届全国骨科医师进修班学习。从事临床医疗工作26年，迄今为止长期在临床一线工作，担任创伤骨科科主任，是学科带头人，具有丰富的临床经验，处理过大量的创伤病例，率先在惠州市把创伤院前急救、院内急诊与骨科专科病区一体化管理。擅长四肢骨折、关节复杂骨折、髋关节置换、腰腿痛等的诊治。&lt;/p&gt;', '广东 惠州 惠城区', '15768650568', '112', '123', '145', '23', '2017-04-07 22:27', 'rvdK9ab+bYpZD5oMAvGKWFJSNIpA9S6EZU7IckO4ZgdgZi4u1o2ODlzweSSHeIit0ZV3W9VG58ywKNt4LG5AuBOIjSDL3en0', null, null, null, null, '36');
INSERT INTO `doctor_info` VALUES ('42', '57', '7', '李人民', '男', 'doctor/0504/3.png', '15768651560', '0e28da76aa66fd6bd07701dc4bb1653c', '内科', '&lt;p&gt;黄玉良于1999-2000年度在北京积水潭医院参加第36届全国骨科医师进修班学习。从事临床医疗工作26年，迄今为止长期在临床一线工作，担任创伤骨科科主任，是学科带头人，具有丰富的临床经验，处理过大量的创伤病例，率先在惠州市把创伤院前急救、院内急诊与骨科专科病区一体化管理。擅长四肢骨折、关节复杂骨折、髋关节置换、腰腿痛等的诊治。&lt;/p&gt;', '广东 惠州 惠城区', null, '475', '0', '234', '37', '', 'u/f1vq/Q3NYUcY3Jgq5/vgw5f5aZvT5xw3JgzbRIqa+66NbwxcXwPbkB0Q8+L6BMuN8NxmGrDY4kuqWCW/novnQivlZN8TDY', 'e23339f872349ef6002998397ca0d669', 'f0e9c7423ad82c36899961e9a4a1b86f', '2017-04-29 09:57:40', null, '36');
INSERT INTO `doctor_info` VALUES ('43', '53', '8', '刘冠贤', '男', 'doctor/0504/4.png', '11768653949', 'e10adc3949ba59abbe56e057f20f883e', '糖尿病', '&lt;p&gt;刘冠贤于1999-2000年度在北京积水潭医院参加第36届全国骨科医师进修班学习。从事临床医疗工作26年，迄今为止长期在临床一线工作，担任创伤骨科科主任，是学科带头人，具有丰富的临床经验，处理过大量的创伤病例，率先在惠州市把创伤院前急救、院内急诊与骨科专科病区一体化管理。擅长四肢骨折、关节复杂骨折、髋关节置换、腰腿痛等的诊治。&lt;/p&gt;', '广东 惠州 惠城区', null, '234', '0', '345', '20', '', 'zDz1PLLGT70NY879c02mAAw5f5aZvT5xw3JgzbRIqa9f++CboQfQJnsnBKEj6/Oh8/j8ZAmG56RheLBgh/qFnirMlwiWMyPM', '4bfb9fcaa51777c66b3e3bd5f008de99', 'd6ac871a1813e71ec71a16d0e1b311a5', '2017-06-04 00:10:37', '', '59');
INSERT INTO `doctor_info` VALUES ('44', '57', '0', '黄玉良', '男', 'doctor/0504/5.png', '', '0e28da76aa66fd6bd07701dc4bb1653c', '妇科肿瘤、妇科微创（阴式手术、妇科腔镜）、妇科疑难病症及慢性病诊治', '&lt;p&gt;黄玉良于1999-2000年度在北京积水潭医院参加第36届全国骨科医师进修班学习。从事临床医疗工作26年，迄今为止长期在临床一线工作，担任创伤骨科科主任，是学科带头人，具有丰富的临床经验，处理过大量的创伤病例，率先在惠州市把创伤院前急救、院内急诊与骨科专科病区一体化管理。擅长四肢骨折、关节复杂骨折、髋关节置换、腰腿痛等的诊治。&lt;/p&gt;', '广东 惠州 惠城区', null, '451', '0', '238', '54', '', null, null, null, null, null, null);
INSERT INTO `doctor_info` VALUES ('45', '57', '0', '纪燕琴', '男', 'doctor/0504/1.png', '', '0e28da76aa66fd6bd07701dc4bb1653c', '恶性肿瘤的化学治疗、内分泌治疗、生物治疗、分子靶向治疗及营养支持治疗', '&lt;p&gt;纪燕琴，副院长，妇产科主任兼妇科主任，主任医师。惠州市名医，广东医学院、汕头大学兼职教授、硕士生导师。广东省医师协会妇产科分会第二届常务委员，广东省医学会妇产科分会第十一届委员，广东省健康管理学会妇产科分会第一届常务委员。&lt;/p&gt;', '广东 惠州 惠城区', null, '234', '0', '357', '57', '', null, null, null, null, null, null);
INSERT INTO `doctor_info` VALUES ('46', '57', '0', '袁霞', '男', 'doctor/0504/2.png', '', '0e28da76aa66fd6bd07701dc4bb1653c', '擅长脑血管系统疾病', '&lt;p&gt;袁霞，医学博士，内科主任医师、硕士生导师、教授。惠州市名医、惠州市拔尖人才。惠州市中心人民医院肿瘤内科主任，广东省抗癌协会常务理事、广东省医学会肿瘤内科分会副主任委员、广东省医学会肿瘤学分会常委、广东省抗癌协会生物治疗委员会副主任委员、广东省抗癌协会黑色素瘤治疗委员会副主任委员、广东省抗癌协会化疗专业委员会委员、广东省抗癌协会肺癌专委会委员、广东省抗癌协会康复与姑息委员会委员、广州抗癌协会胃癌专业委员会常委、惠州医学会肿瘤学分会主任委员、惠州市抗癌协会会长。&lt;/p&gt;', '广东 惠州 惠城区', null, '247', '0', '248', '58', '', null, null, null, null, null, null);
INSERT INTO `doctor_info` VALUES ('47', '57', '0', '罗伟良', '男', 'doctor/0504/3.png', '', '0e28da76aa66fd6bd07701dc4bb1653c', '高血压病、冠心病、风心病、心肌病、心衰、各种心律失常、高脂血症、糖尿病、脑血管意外', '&lt;p&gt;罗伟良，主任医师，医院医疗总监，大内科主任，脑病中心主任，神经内科主任，学科带头人，惠州市名医。广东省医学会神经病学分会第六届及第七届委员，广东省医师协会神经科分会常委，国家核心期刊《血栓与止血学》杂志编委会第四及第五届编委，惠州市医学会神经病学分会主任委员，惠州市医学会内科学分会主任委员。广东医学院兼职教授，广东医学院硕士生导师。&lt;/p&gt;', '广东 惠州 惠城区', null, '286', '0', '423', '58', '', null, null, null, null, null, null);
INSERT INTO `doctor_info` VALUES ('48', '55', '0', '徐峰', '男', 'doctor/0504/4.png', '', '0e28da76aa66fd6bd07701dc4bb1653c', '颅脑创伤的急诊急救及开颅手术治疗', '&lt;p&gt;大内科主任 &amp;nbsp;心血管内科主任医师，中华医学会心血管病学会惠州分会常委、老年病学会常务委员，内科分会委员、急诊分会委员。惠州市医疗事故鉴定专家，惠州市劳动能力鉴定专家。惠州市模范军队转业干部，惠州市卫生系统优秀党员。&lt;/p&gt;', '广东 惠州 惠城区', null, '237', '0', '358', '59', '', null, null, null, null, null, null);
INSERT INTO `doctor_info` VALUES ('49', '55', '0', '张国韶', '男', 'doctor/0504/5.png', '', '0e28da76aa66fd6bd07701dc4bb1653c', '颅脑创伤的急诊急救及开颅手术治疗', '&lt;p&gt;神经外科主任，副主任医师、副教授 从事神经外科工作25余年，毕业于黑龙江省齐齐哈尔医学院，临床医疗系。曾任公安总院脑外科主任、学科带头人、齐齐哈尔市神经外科专业委员会委员。&lt;/p&gt;', '广东 惠州 惠城区', null, '346', '0', '237', '57', '', null, null, null, null, null, null);
INSERT INTO `doctor_info` VALUES ('50', '55', '0', '陈兴宏', '男', 'doctor/0504/1.png', '', '0e28da76aa66fd6bd07701dc4bb1653c', '对普通泌尿系统的外伤、肿瘤、结石、结核、畸形等积累了丰富的经验', '&lt;p&gt;中国医科大学兼职教授，中华医学会辽宁省泌尿外科分会会员。从事泌外的临床教学科研工作30余年，对普通泌尿系统的外伤、肿瘤、结石、结核、畸形等积累了丰富的经验。&lt;/p&gt;', '广东 惠州 惠城区', null, '512', '0', '257', '37', '', null, null, null, null, null, null);
INSERT INTO `doctor_info` VALUES ('51', '55', '0', '朱洪文', '男', 'doctor/0504/2.png', '', '0e28da76aa66fd6bd07701dc4bb1653c', '泌尿外科常见病、多发病的诊治以及前列腺、泌尿系结石腔镜微创手术治疗', '&lt;p&gt;泌尿外科主任，2003年毕业于佳木斯大学临床医学，毕业后一直从事泌尿外科临床工作，擅长泌尿外科常见病、多发病的诊治以及前列腺、泌尿系结石腔镜微创手术治疗。专业特长：采用B超定位对泌尿系全程结石行体外冲击波碎石治疗，尤其对输尿管中段定位困难的结石诊治有丰富的临床经验。至今已完成体外碎石达10000多例，成功率达90%以上，取得良好的社会效应。&lt;/p&gt;', '广东 惠州 惠城区', null, '347', '0', '238', '52', '', null, null, null, null, null, null);
INSERT INTO `doctor_info` VALUES ('52', '64', '6', '王医生', '男', 'doctor/0504/4.png', '15768650568', '123456', '鼻炎、心血管疾病', '阿诗丹顿多多多多多多多多多多多多多多多多多多多多多多多多多多多多多', '广东省 广州市 白云区', null, '', '0', null, null, '2017-05-04 11:12', null, null, null, null, null, null);
INSERT INTO `doctor_info` VALUES ('53', '64', '8', '吴医生', '女', 'doctor/0504/2.png', '15768650569', '123456', '鼻炎、心血管疾病', '阿诗丹顿多多多多多多多多多多多多多多多多多多多多多多多多多多多多多', '广东省 广州市 白云区', null, '', '0', null, null, '2017-05-04 11:12', null, null, null, null, null, null);
INSERT INTO `doctor_info` VALUES ('54', '64', '9', '李医生', '男', 'doctor/0504/4.png', '15768650570', '123456', '鼻炎、心血管疾病', '阿诗丹顿多多多多多多多多多多多多多多多多多多多多多多多多多多多多多', '广东省 广州市 白云区', null, '', '0', null, null, '2017-05-04 11:12', null, null, null, null, null, null);
INSERT INTO `doctor_info` VALUES ('55', '64', '7', '刘医生', '女', 'doctor/0504/2.png', '15768650571', '123456', '鼻炎、心血管疾病', '阿诗丹顿多多多多多多多多多多多多多多多多多多多多多多多多多多多多多', '广东省 广州市 白云区', null, '', '0', null, null, '2017-05-04 11:12', null, null, null, null, null, null);

-- ----------------------------
-- Table structure for `drug`
-- ----------------------------
DROP TABLE IF EXISTS `drug`;
CREATE TABLE `drug` (
  `drug_id` int(16) NOT NULL AUTO_INCREMENT COMMENT '用药记录ID',
  `user_id` int(16) NOT NULL COMMENT '用户ID',
  `usedrug_id` int(16) NOT NULL COMMENT '用药人ID',
  `drug_info_id` int(16) NOT NULL COMMENT '药品详情ID',
  `ailmentv` varchar(32) DEFAULT NULL COMMENT '治疗疾病',
  `drug_hos` varchar(32) DEFAULT NULL COMMENT '开药医院',
  `drug_doc` varchar(16) DEFAULT NULL COMMENT '开药医生',
  `time` varchar(16) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`drug_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='我的用药信息';

-- ----------------------------
-- Records of drug
-- ----------------------------

-- ----------------------------
-- Table structure for `drug_diary`
-- ----------------------------
DROP TABLE IF EXISTS `drug_diary`;
CREATE TABLE `drug_diary` (
  `id` mediumint(11) NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(11) DEFAULT NULL,
  `relative_id` mediumint(11) DEFAULT NULL,
  `drug_info` text,
  `drug_time` varchar(150) DEFAULT NULL,
  `drug_notime` text,
  `drug_date` varchar(150) DEFAULT NULL,
  `drug_res` text,
  `drug_num` varchar(16) DEFAULT NULL,
  `is_on_time` varchar(16) DEFAULT NULL,
  `is_bad` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of drug_diary
-- ----------------------------
INSERT INTO `drug_diary` VALUES ('1', '48', null, '阿司匹林', '5:0', '', '201754', '', '一日三次', '是', '否');
INSERT INTO `drug_diary` VALUES ('2', '43', null, '', '', '', '201754', '', '', '是', '否');
INSERT INTO `drug_diary` VALUES ('3', '43', null, '', '', '', '201754', '', '', '是', '否');
INSERT INTO `drug_diary` VALUES ('4', '43', null, '阿司匹林', '6:0', '', '201753', '', '一日三次', '是', '否');
INSERT INTO `drug_diary` VALUES ('5', '49', null, '阿司匹林', '5:0', '', '201755', '', '一日两次', '是', '否');
INSERT INTO `drug_diary` VALUES ('6', '49', null, '', '5:0', '', '201755', '', '', '是', '否');
INSERT INTO `drug_diary` VALUES ('7', '1', null, '', '6:0', '', '201765', '', '一日三次', '是', '否');

-- ----------------------------
-- Table structure for `drug_img`
-- ----------------------------
DROP TABLE IF EXISTS `drug_img`;
CREATE TABLE `drug_img` (
  `drug_img_id` int(16) NOT NULL AUTO_INCREMENT COMMENT '图片ID',
  `drug_img_name` varchar(16) DEFAULT NULL COMMENT '图片名称',
  `drug_img_path` varchar(16) DEFAULT NULL COMMENT '图片路径',
  `time` varchar(16) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`drug_img_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='药品图片表';

-- ----------------------------
-- Records of drug_img
-- ----------------------------

-- ----------------------------
-- Table structure for `drug_info`
-- ----------------------------
DROP TABLE IF EXISTS `drug_info`;
CREATE TABLE `drug_info` (
  `drug_info_id` int(16) NOT NULL AUTO_INCREMENT COMMENT '用药记录ID',
  `drug_name` varchar(16) DEFAULT NULL COMMENT '药品名称',
  `drug_howuse` longtext COMMENT '使用方法',
  `drug_img_id` int(16) DEFAULT NULL COMMENT '图片ID',
  `usedrug_time` varchar(32) DEFAULT NULL COMMENT '用药时间',
  `drug_remind` varchar(8) DEFAULT NULL COMMENT '是否提醒',
  PRIMARY KEY (`drug_info_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='药品信息表';

-- ----------------------------
-- Records of drug_info
-- ----------------------------

-- ----------------------------
-- Table structure for `family_info`
-- ----------------------------
DROP TABLE IF EXISTS `family_info`;
CREATE TABLE `family_info` (
  `id` mediumint(11) NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(9) DEFAULT NULL,
  `relation` varchar(16) DEFAULT NULL,
  `sick` varchar(16) DEFAULT NULL COMMENT '家族史表',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of family_info
-- ----------------------------

-- ----------------------------
-- Table structure for `feedback`
-- ----------------------------
DROP TABLE IF EXISTS `feedback`;
CREATE TABLE `feedback` (
  `feedb_id` int(16) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_id` int(16) NOT NULL COMMENT '用户ID',
  `con_phone` varchar(16) DEFAULT NULL COMMENT '联系电话',
  `feedb_content` longtext COMMENT '反馈内容',
  `feedb_img` varchar(32) DEFAULT NULL COMMENT '反馈图片',
  `feedb_time` varchar(16) DEFAULT NULL COMMENT '反馈时间',
  PRIMARY KEY (`feedb_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='意见反馈';

-- ----------------------------
-- Records of feedback
-- ----------------------------
INSERT INTO `feedback` VALUES ('1', '43', '', '这个APP挺不错的', null, '2017-04-29 18:00');
INSERT INTO `feedback` VALUES ('2', '43', '', '有些功能还需要完善', null, '2017-04-29 18:00');
INSERT INTO `feedback` VALUES ('3', '49', '', 'app bug没有', null, '2017-05-05 01:21');

-- ----------------------------
-- Table structure for `form`
-- ----------------------------
DROP TABLE IF EXISTS `form`;
CREATE TABLE `form` (
  `form_id` int(16) NOT NULL AUTO_INCREMENT COMMENT '订单ID',
  `user_id` int(16) NOT NULL COMMENT '用户ID',
  `doc_name` varchar(16) DEFAULT NULL COMMENT '医生姓名',
  `depa_name` varchar(32) DEFAULT NULL COMMENT '科室名字',
  `illness_name` varchar(32) DEFAULT NULL COMMENT '疾病名称',
  `price` varchar(16) DEFAULT NULL COMMENT '价钱',
  `time` varchar(16) DEFAULT NULL COMMENT '下单时间',
  PRIMARY KEY (`form_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='我的就诊订单';

-- ----------------------------
-- Records of form
-- ----------------------------

-- ----------------------------
-- Table structure for `friend_file`
-- ----------------------------
DROP TABLE IF EXISTS `friend_file`;
CREATE TABLE `friend_file` (
  `file_id` int(16) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_id` int(16) NOT NULL COMMENT '用户ID',
  `friend_id` int(16) NOT NULL COMMENT '关联的好友ID',
  `time` varchar(16) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`file_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='关联的亲友档案';

-- ----------------------------
-- Records of friend_file
-- ----------------------------

-- ----------------------------
-- Table structure for `habit`
-- ----------------------------
DROP TABLE IF EXISTS `habit`;
CREATE TABLE `habit` (
  `habit_id` int(16) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_id` int(16) NOT NULL COMMENT '用户ID',
  `usehab_id` int(16) NOT NULL COMMENT '记录人ID',
  `getup_time` varchar(16) DEFAULT NULL COMMENT '起床时间',
  `sleep_time` varchar(16) DEFAULT NULL COMMENT '睡觉时间',
  `other` varchar(255) DEFAULT NULL COMMENT '其他',
  `time` varchar(16) DEFAULT NULL COMMENT '记录日期',
  PRIMARY KEY (`habit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='个人习惯表';

-- ----------------------------
-- Records of habit
-- ----------------------------

-- ----------------------------
-- Table structure for `health_know`
-- ----------------------------
DROP TABLE IF EXISTS `health_know`;
CREATE TABLE `health_know` (
  `know_id` mediumint(8) NOT NULL AUTO_INCREMENT COMMENT '知识ID',
  `know_title` varchar(32) DEFAULT NULL COMMENT '标题',
  `know_see` varchar(32) DEFAULT '0' COMMENT '浏览量',
  `know_content` longtext COMMENT '内容',
  `time` varchar(16) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`know_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='健康知识表';

-- ----------------------------
-- Records of health_know
-- ----------------------------
INSERT INTO `health_know` VALUES ('2', '吃橘子的功效与作用', '51', '&lt;p&gt;&lt;span style=&quot;color: rgb(68, 68, 68); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;金秋十月，橘子上市。橘子浑身都是宝，橘皮、橘络、橘核、橘肉均是“天然药物”，一个橘子相当于5味药。每天吃1个桔子可以使人们避免口腔癌、喉癌和胃癌的侵袭。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;/p&gt;&lt;h3 style=&quot;padding: 0px; margin: 0px; font-family: Verdana, Arial, Helvetica, sans-serif; color: rgb(68, 68, 68); white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;color: rgb(68, 68, 68); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);&quot;&gt;橘皮清新口气&lt;/span&gt;&lt;/h3&gt;&lt;p style=&quot;padding: 5px 0px; margin-top: 0px; margin-bottom: 0px; font-family: Verdana, Arial, Helvetica, sans-serif; color: rgb(68, 68, 68); font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;新鲜的橘皮中含有大量的维生素C和香精油，具有理气化痰、健脾和胃等功能。将其咀嚼后吐掉残渣，重复数次，对去除口腔异味比较有效。橘皮泡茶，味道清香，还能通气提神。&lt;/p&gt;&lt;p style=&quot;padding: 5px 0px; margin-top: 0px; margin-bottom: 0px; font-family: Verdana, Arial, Helvetica, sans-serif; color: rgb(68, 68, 68); font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;h3 style=&quot;padding: 0px; margin: 0px; font-family: Verdana, Arial, Helvetica, sans-serif; color: rgb(68, 68, 68); white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;color: rgb(68, 68, 68); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);&quot;&gt;陈皮有助消化&lt;/span&gt;&lt;/h3&gt;&lt;p style=&quot;padding: 5px 0px; margin-top: 0px; margin-bottom: 0px; font-family: Verdana, Arial, Helvetica, sans-serif; color: rgb(68, 68, 68); font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;陈皮是晒干的橘子皮，而且越陈越好。陈皮味辛、苦，性温，归脾、胃，功效健脾开胃，主治消化不良。陈皮可以和大米一起熬粥，或者用来炖汤。&lt;/p&gt;&lt;h3 style=&quot;padding: 0px; margin: 0px; font-family: Verdana, Arial, Helvetica, sans-serif; color: rgb(68, 68, 68); white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;color: rgb(68, 68, 68); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);&quot;&gt;橘络保护血管&lt;/span&gt;&lt;/h3&gt;&lt;p style=&quot;padding: 5px 0px; margin-top: 0px; margin-bottom: 0px; font-family: Verdana, Arial, Helvetica, sans-serif; color: rgb(68, 68, 68); font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;橘子里白色网状的丝络，叫“橘络”，因为其中含有一种名为“芦丁”的营养素，所以有苦味。但这种物质能使人的血管保持正常的弹性和密度，减少血管壁的脆性和渗透性，防止脑溢血的发生。橘络可以直接吃，也可用来泡水喝。&lt;/p&gt;&lt;p style=&quot;padding: 5px 0px; margin-top: 0px; margin-bottom: 0px; font-family: Verdana, Arial, Helvetica, sans-serif; color: rgb(68, 68, 68); font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;h3 style=&quot;padding: 0px; margin: 0px; font-family: Verdana, Arial, Helvetica, sans-serif; color: rgb(68, 68, 68); white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;color: rgb(68, 68, 68); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);&quot;&gt;橘核缓解痛经&lt;/span&gt;&lt;/h3&gt;&lt;p style=&quot;padding: 5px 0px; margin-top: 0px; margin-bottom: 0px; font-family: Verdana, Arial, Helvetica, sans-serif; color: rgb(68, 68, 68); font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;橘核有理气、温胃、止痛的作用，既能驱寒，又能止痛，因此有助女性缓解痛经。建议用橘核沏茶，一般用3~5克;如果疼得厉害，可以用到10克。&lt;/p&gt;&lt;p style=&quot;padding: 5px 0px; margin-top: 0px; margin-bottom: 0px; font-family: Verdana, Arial, Helvetica, sans-serif; color: rgb(68, 68, 68); font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;h3 style=&quot;padding: 0px; margin: 0px; font-family: Verdana, Arial, Helvetica, sans-serif; color: rgb(68, 68, 68); white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;color: rgb(68, 68, 68); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);&quot;&gt;橘肉生津止渴&lt;/span&gt;&lt;/h3&gt;&lt;p style=&quot;padding: 5px 0px; margin-top: 0px; margin-bottom: 0px; font-family: Verdana, Arial, Helvetica, sans-serif; color: rgb(68, 68, 68); font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;橘肉含水量高，能生津止渴。现代研究证明，橘子富含维生素C、胡萝卜素、叶酸等营养成分，并且还含有抗氧化、抗癌、抗过敏成分，能减少冠心病、中风及&lt;a href=&quot;http://www.jk3721.com/html/changjianjibing/gaoxueya/&quot; target=&quot;_blank&quot; style=&quot;padding: 0px; margin: 0px; color: rgb(51, 51, 51); text-decoration: none;&quot;&gt;&lt;span style=&quot;padding: 0px; margin: 0px; border-bottom: 1px dashed rgb(0, 102, 255);&quot;&gt;高血压&lt;/span&gt;&lt;/a&gt;的发病率。&lt;/p&gt;&lt;p style=&quot;padding: 5px 0px; margin-top: 0px; margin-bottom: 0px; font-family: Verdana, Arial, Helvetica, sans-serif; color: rgb(68, 68, 68); font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;h3 style=&quot;padding: 0px; margin: 0px; font-family: Verdana, Arial, Helvetica, sans-serif; color: rgb(68, 68, 68); white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;color: rgb(68, 68, 68); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);&quot;&gt;吃橘子6大好处&lt;/span&gt;&lt;/h3&gt;&lt;p style=&quot;padding: 5px 0px; margin-top: 0px; margin-bottom: 0px; font-family: Verdana, Arial, Helvetica, sans-serif; color: rgb(68, 68, 68); font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;促进通便&lt;/p&gt;&lt;p style=&quot;padding: 5px 0px; margin-top: 0px; margin-bottom: 0px; font-family: Verdana, Arial, Helvetica, sans-serif; color: rgb(68, 68, 68); font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;橘子的膳食纤维的含量相当高，多吃可促进排便。&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;padding: 5px 0px; margin-top: 0px; margin-bottom: 0px; font-family: Verdana, Arial, Helvetica, sans-serif; color: rgb(68, 68, 68); font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;降低胆固醇&lt;/p&gt;&lt;p style=&quot;padding: 5px 0px; margin-top: 0px; margin-bottom: 0px; font-family: Verdana, Arial, Helvetica, sans-serif; color: rgb(68, 68, 68); font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;丰富的膳食纤维不仅有利于肠胃的蠕动，同时利用橘子中的果胶还可降低胆固醇发病的机率。&lt;/p&gt;&lt;p style=&quot;padding: 5px 0px; margin-top: 0px; margin-bottom: 0px; font-family: Verdana, Arial, Helvetica, sans-serif; color: rgb(68, 68, 68); font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;美容&lt;/p&gt;&lt;p style=&quot;padding: 5px 0px; margin-top: 0px; margin-bottom: 0px; font-family: Verdana, Arial, Helvetica, sans-serif; color: rgb(68, 68, 68); font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;橘子具有美容的作用，因为橘子的维生素C含量是最高的，多吃不仅可保持皮肤的水嫩，同时还有助于抑制黑色素的形成。&lt;/p&gt;&lt;p style=&quot;padding: 5px 0px; margin-top: 0px; margin-bottom: 0px; font-family: Verdana, Arial, Helvetica, sans-serif; color: rgb(68, 68, 68); font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;消除疲劳&lt;/p&gt;&lt;p style=&quot;padding: 5px 0px; margin-top: 0px; margin-bottom: 0px; font-family: Verdana, Arial, Helvetica, sans-serif; color: rgb(68, 68, 68); font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;橘子中的柠檬酸的含量非常之高，而柠檬酸不仅具有开胃之功效，同时还有消除疲劳的作用。&lt;/p&gt;&lt;p style=&quot;padding: 5px 0px; margin-top: 0px; margin-bottom: 0px; font-family: Verdana, Arial, Helvetica, sans-serif; color: rgb(68, 68, 68); font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;保护心血管&lt;/p&gt;&lt;p style=&quot;padding: 5px 0px; margin-top: 0px; margin-bottom: 0px; font-family: Verdana, Arial, Helvetica, sans-serif; color: rgb(68, 68, 68); font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;健康橘皮苷可以加强毛细血管的韧性，降血压，扩张心脏的冠状动脉，故橘子是预防冠心病和动脉硬化的食品，研究证实，食用柑橘可以降低沉积在动脉血管中的胆固醇，有助于使动脉粥样硬化发生逆转。&lt;/p&gt;&lt;p style=&quot;padding: 5px 0px; margin-top: 0px; margin-bottom: 0px; font-family: Verdana, Arial, Helvetica, sans-serif; color: rgb(68, 68, 68); font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;防癌抗癌&lt;/p&gt;&lt;p style=&quot;padding: 5px 0px; margin-top: 0px; margin-bottom: 0px; font-family: Verdana, Arial, Helvetica, sans-serif; color: rgb(68, 68, 68); font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&amp;nbsp; &amp;nbsp; 中医认为，橘子具有润肺、止咳、化痰、健脾、顺气、止渴的药效。尤其是老年人、急慢性支气管炎以及心血管病患者，是食用的上乘果品。据澳洲科学家和食品工业研究机构最新研究显示，每天吃1个桔子可以使人们避免口腔癌、喉癌和胃癌的侵袭。&lt;/p&gt;&lt;h3 style=&quot;padding: 0px; margin: 0px; font-family: Verdana, Arial, Helvetica, sans-serif; color: rgb(68, 68, 68); white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;color: rgb(68, 68, 68); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);&quot;&gt;橘子不能一次吃太多&lt;/span&gt;&lt;/h3&gt;&lt;p style=&quot;padding: 5px 0px; margin-top: 0px; margin-bottom: 0px; font-family: Verdana, Arial, Helvetica, sans-serif; color: rgb(68, 68, 68); font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;据研究，每天吃3个桔子，就能满足一个人一天对维生素C的需要量。若食用过多，过量摄入维生素C时，体内代谢的草酸会增多，易引起尿结石、肾结石。另外多吃对口腔和牙齿有害。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '2017-04-25 08:53');
INSERT INTO `health_know` VALUES ('5', '喝牛奶也能减肥？不是空谈，但并非每个人都适合', '18', '&lt;p&gt;&lt;span style=&quot;color: rgb(68, 68, 68); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;有人说，喝牛奶&lt;/span&gt;&lt;span style=&quot;color: rgb(68, 68, 68); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);&quot;&gt;能减肥，因为喝牛奶能引起&lt;/span&gt;&lt;a href=&quot;http://www.jk3721.com/html/changjianjibing/qiujifuxie-qiuxie-/&quot; target=&quot;_blank&quot; style=&quot;padding: 0px; margin: 0px; font-family: Verdana, Arial, Helvetica, sans-serif; color: rgb(51, 51, 51); text-decoration: none; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;padding: 0px; margin: 0px; border-bottom: 1px dashed rgb(0, 102, 255);&quot;&gt;腹泻&lt;/span&gt;&lt;/a&gt;&lt;span style=&quot;color: rgb(68, 68, 68); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);&quot;&gt;。&lt;/span&gt;&lt;span style=&quot;color: rgb(68, 68, 68); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);&quot;&gt;确实有些人喝牛奶会腹泻。小时候喝母乳和牛奶，我们的肠道里会产生一种分解乳糖的酶。成年后，是因为断乳且没有喝母乳、牛奶的硬性需求，肠道内能分解乳糖的酶也就消失了，在肠道内得不到分解的乳糖，在大肠内细菌分解，进而产生乳酸，乳酸又刺激肠壁蠕动、收缩后，引起腹泻。更有甚者，有些人喝牛奶后，当乳酸的高渗透压，将水分挤压到肠液后，还会引起痢疾。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;color: rgb(68, 68, 68); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;对减肥的人来说，适当的腹泻会起到减肥作用，但若成了痢疾，那就对身体有害了，所以还是要根据个人的情况来选择。&lt;/span&gt;&lt;span style=&quot;color: rgb(68, 68, 68); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);&quot;&gt;牛奶减肥只适用于喝牛奶腹泻者。如果喝牛奶不腹泻，那不仅不能减肥，还会因身体吸收了牛奶的热量而增重。&lt;/span&gt;&lt;span style=&quot;color: rgb(68, 68, 68); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);&quot;&gt;不管是喝牛奶减肥还是吃乳糖减肥，常喝牛奶，常吃乳糖，会使肠类细菌生成乳糖酶，进而分解成葡萄&lt;/span&gt;&lt;span style=&quot;color: rgb(68, 68, 68); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);&quot;&gt;糖和半乳糖，减肥效果也就大打折扣了。&lt;/span&gt;&lt;/p&gt;', '2017-04-25 08:54');
INSERT INTO `health_know` VALUES ('6', '吃坚果有哪些好处？10大营养坚果', '13', '&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;span style=&quot;color: rgb(68, 68, 68); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);&quot;&gt;坚持吃半个月坚果，身体竟然变成什么样子呢?在生活中，坚果是非常受大众喜欢的零食，那么，你知道坚果有哪些吗?常吃坚果的好处有哪些呢?坚果的营养价值有哪些呢?下面我们一起来看看吃坚果有什么好处?&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;color: rgb(68, 68, 68); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);&quot;&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp;&amp;nbsp;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;strong style=&quot;color: rgb(68, 68, 68); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 14px; padding: 0px; margin: 0px;&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;女子网购坚果吃半月胖五斤 竟然还查出来高血脂&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;padding: 5px 0px; margin-top: 0px; margin-bottom: 0px; font-family: Verdana, Arial, Helvetica, sans-serif; color: rgb(68, 68, 68); font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;　　&lt;/p&gt;&lt;p style=&quot;padding: 5px 0px; margin-top: 0px; margin-bottom: 0px; font-family: Verdana, Arial, Helvetica, sans-serif; color: rgb(68, 68, 68); font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; 天气渐冷，出门需要越来越多的勇气，相比来说，躺在沙发上，看着电视，吃点零食成了上好的选择。&lt;/p&gt;&lt;p style=&quot;padding: 5px 0px; margin-top: 0px; margin-bottom: 0px; font-family: Verdana, Arial, Helvetica, sans-serif; color: rgb(68, 68, 68); font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;　　其中，坚果类零食很受大家的欢迎，常见的有核桃、葵花子、腰果、松子、杏仁、开心果、花生等。疾控中心营养专家提醒您，坚果虽好，适量最好。&lt;/p&gt;&lt;p style=&quot;padding: 5px 0px; margin-top: 0px; margin-bottom: 0px; font-family: Verdana, Arial, Helvetica, sans-serif; color: rgb(68, 68, 68); font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;strong style=&quot;padding: 0px; margin: 0px;&quot;&gt;　　&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;padding: 5px 0px; margin-top: 0px; margin-bottom: 0px; font-family: Verdana, Arial, Helvetica, sans-serif; color: rgb(68, 68, 68); font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;strong style=&quot;padding: 0px; margin: 0px;&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &amp;nbsp;半月胖了五斤，查出高血脂&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;padding: 5px 0px; margin-top: 0px; margin-bottom: 0px; font-family: Verdana, Arial, Helvetica, sans-serif; color: rgb(68, 68, 68); font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;　　&lt;/p&gt;&lt;p style=&quot;padding: 5px 0px; margin-top: 0px; margin-bottom: 0px; font-family: Verdana, Arial, Helvetica, sans-serif; color: rgb(68, 68, 68); font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;市民郭女士刚刚跟朋友一起团购了坚果套装，里面有核桃、杏仁、松子、花生、腰果、榛子等10多个品种，按照一定比例混在一起，让人食欲大增。听说吃坚果能抗衰老、保护心脑血管，郭女士平时一边打电脑，一边拿出来几袋拆开吃。&lt;/p&gt;&lt;p style=&quot;padding: 5px 0px; margin-top: 0px; margin-bottom: 0px; font-family: Verdana, Arial, Helvetica, sans-serif; color: rgb(68, 68, 68); font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;　　这些坚果都已经经过加工、剥皮，拿起来就能入口食用，不知不觉中，一大袋子坚果就见底了，郭女士无奈地说。&lt;/p&gt;&lt;p style=&quot;padding: 5px 0px; margin-top: 0px; margin-bottom: 0px; font-family: Verdana, Arial, Helvetica, sans-serif; color: rgb(68, 68, 68); font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;　　自从开始买这些坚果零食，自己保持了多年的体重就开始猛涨，“100斤的体重保持了很多年，没想到，自从买了这些坚果，最近半个月体重一下长了近5斤，而且还查出了高血脂。”&lt;/p&gt;&lt;p style=&quot;padding: 5px 0px; margin-top: 0px; margin-bottom: 0px; font-family: Verdana, Arial, Helvetica, sans-serif; color: rgb(68, 68, 68); font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;padding: 5px 0px; margin-top: 0px; margin-bottom: 0px; font-family: Verdana, Arial, Helvetica, sans-serif; color: rgb(68, 68, 68); font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;　　记者了解到，高血脂这种病是“无声杀手”，患者得病后并不会有什么症状，往往等到引起并发症后或者是体检时，患者通过查血脂才会发现。&lt;/p&gt;&lt;p style=&quot;padding: 5px 0px; margin-top: 0px; margin-bottom: 0px; font-family: Verdana, Arial, Helvetica, sans-serif; color: rgb(68, 68, 68); font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;　　然而，高血脂造成的并发症包括中风、心梗、脑梗、胰腺炎等。因此提醒广大市民，要定期到医院查血脂，具体说来：年轻人4———5年检查一次血脂;老年人1年检查一次血脂;有三高和心脑血管疾病的人3———6个月就要检查一次血脂。&lt;/p&gt;&lt;p style=&quot;padding: 5px 0px; margin-top: 0px; margin-bottom: 0px; font-family: Verdana, Arial, Helvetica, sans-serif; color: rgb(68, 68, 68); font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;padding: 5px 0px; margin-top: 0px; margin-bottom: 0px; font-family: Verdana, Arial, Helvetica, sans-serif; color: rgb(68, 68, 68); font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;strong style=&quot;padding: 0px; margin: 0px;&quot;&gt;　　建议：适量食用坚果，才有助于健康&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;padding: 5px 0px; margin-top: 0px; margin-bottom: 0px; font-family: Verdana, Arial, Helvetica, sans-serif; color: rgb(68, 68, 68); font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;padding: 5px 0px; margin-top: 0px; margin-bottom: 0px; font-family: Verdana, Arial, Helvetica, sans-serif; color: rgb(68, 68, 68); font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;　　市疾控中心营养专家介绍，坚果的确是一类营养丰富的食品，含有大量的维生素e、叶酸、镁、钾、铜、单不饱和脂肪酸和多不饱和脂肪酸及较多的膳食纤维。&lt;/p&gt;&lt;p style=&quot;padding: 5px 0px; margin-top: 0px; margin-bottom: 0px; font-family: Verdana, Arial, Helvetica, sans-serif; color: rgb(68, 68, 68); font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;padding: 5px 0px; margin-top: 0px; margin-bottom: 0px; font-family: Verdana, Arial, Helvetica, sans-serif; color: rgb(68, 68, 68); font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;　　少量食用坚果，的确有助于健康。然而，坚果所含的蛋白质和脂肪也非常高，比如，每100g黄豆中含脂肪16g，每100g花生仁中含脂肪44.3g，是黄豆的3倍。&lt;/p&gt;&lt;p style=&quot;padding: 5px 0px; margin-top: 0px; margin-bottom: 0px; font-family: Verdana, Arial, Helvetica, sans-serif; color: rgb(68, 68, 68); font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;padding: 5px 0px; margin-top: 0px; margin-bottom: 0px; font-family: Verdana, Arial, Helvetica, sans-serif; color: rgb(68, 68, 68); font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;　　因此，过量食用坚果容易导致血脂升高，加重肥胖。有心脑血管疾病的人，一定要格外注意，否则，容易很短时间内就加重病情，让人措手不及。“一般建议，每周食用50克坚果比较适宜。50克大概就是一小把，这个量就比较合适。”&lt;/p&gt;&lt;p style=&quot;padding: 5px 0px; margin-top: 0px; margin-bottom: 0px; font-family: Verdana, Arial, Helvetica, sans-serif; color: rgb(68, 68, 68); font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;　　基于坚果的营养成分及对健康的影响，营养专家建议适量吃。按照中国居民膳食指南建议，坚果的摄入适宜量是每周50g，这个50g是去皮去壳的重量。&lt;/p&gt;&lt;p style=&quot;padding: 5px 0px; margin-top: 0px; margin-bottom: 0px; font-family: Verdana, Arial, Helvetica, sans-serif; color: rgb(68, 68, 68); font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;padding: 5px 0px; margin-top: 0px; margin-bottom: 0px; font-family: Verdana, Arial, Helvetica, sans-serif; color: rgb(68, 68, 68); font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;　　一般来说，带壳的坚果，如瓜子，每天2把左右，如果是不带壳的扁桃仁，每天大概一小把，10粒左右;核桃每天2-3个左右。&lt;/p&gt;&lt;p style=&quot;padding: 5px 0px; margin-top: 0px; margin-bottom: 0px; font-family: Verdana, Arial, Helvetica, sans-serif; color: rgb(68, 68, 68); font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;padding: 5px 0px; margin-top: 0px; margin-bottom: 0px; font-family: Verdana, Arial, Helvetica, sans-serif; color: rgb(68, 68, 68); font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;　　其次，可以尝试多种吃法。如吃早餐时可以吃上几粒坚果;喝茶时可以来几粒;上午或下午感到饿时，可以来上几粒。&lt;/p&gt;&lt;p style=&quot;padding: 5px 0px; margin-top: 0px; margin-bottom: 0px; font-family: Verdana, Arial, Helvetica, sans-serif; color: rgb(68, 68, 68); font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;padding: 5px 0px; margin-top: 0px; margin-bottom: 0px; font-family: Verdana, Arial, Helvetica, sans-serif; color: rgb(68, 68, 68); font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;　　坚果既可以单独吃，也可以入菜，如西芹腰果，营养口味俱佳。最后，少吃含盐的坚果。在选择坚果时，建议选择原味的，不选择加盐的，以减少盐的摄入。&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;color: rgb(68, 68, 68); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);&quot;&gt;&lt;br/&gt;&lt;/span&gt;&lt;br/&gt;&lt;/p&gt;', '2017-04-25 08:53');
INSERT INTO `health_know` VALUES ('7', '脑外伤的早期康复治疗原则', '6', '&lt;p&gt;&lt;strong&gt;&lt;span style=&quot;font-family: 宋体, SimSun; font-size: 14px;&quot;&gt;（一）介入时机及标准。&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-family: 宋体, SimSun; font-size: 14px;&quot;&gt;脑外伤伤员的康复治疗越早越好，并应贯穿急性期至恢复期。凡是有神经功能障碍的伤员都应该不同程度地接受康复治疗。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;strong&gt;&lt;span style=&quot;font-family: 宋体, SimSun; font-size: 14px;&quot;&gt;（二）治疗原则与方法。&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-family: 宋体, SimSun; font-size: 14px;&quot;&gt;1.急性期。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-family: 宋体, SimSun; font-size: 14px;&quot;&gt;一般指轻度损伤后2－4周、中度损伤后4-6周、重度或极重度损伤后6-8周。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-family: 宋体, SimSun; font-size: 14px;&quot;&gt;（1）伤员卧床时应保持自然体位。每天多次摇高床头，每次20-30分钟。原则上每2小时翻身1次。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-family: 宋体, SimSun; font-size: 14px;&quot;&gt;（2）鼓励神智清醒的伤员主动进行轻微肢体活动。若无法主动活动时必须进行关节被动活动，以避免关节挛缩。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-family: 宋体, SimSun; font-size: 14px;&quot;&gt;（3）应给予伤员积极的环境刺激，包括音乐、抚摸、亲人呼唤等，保证营养充足。呼吸障碍的伤员要给予拍背、呼吸训练和体位引流。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-family: 宋体, SimSun; font-size: 14px;&quot;&gt;（4）任何治疗都要避免诱发癫痫和颅压增高等。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-family: 宋体, SimSun; font-size: 14px;&quot;&gt;2.恢复期。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-family: 宋体, SimSun; font-size: 14px;&quot;&gt;本期伤员生命体征相对稳定，神经系统症状未加重，脑水肿、颅内高压等已控制，未出现新的需要手术处理的病情变化。脑脊液外引流管已拔除或脑室-腹腔引流管通畅，无脑脊液漏。无其它重要脏器严重功能障碍，CT等影像学检查未见病变进行性发展，无严重感染、糖尿病酮症酸中毒。仍有持续性神经功能障碍或并发症，影响生活自理。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-family: 宋体, SimSun; font-size: 14px;&quot;&gt;本期应针对伤员功能障碍的类型和程度有的放矢地安排治疗，循序渐进，注意病情变化和伤员安全。除康复专业技术人员外，还需要家属等有关人员的共同参与。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-family: 宋体, SimSun; font-size: 14px;&quot;&gt;（1）评定伤员的躯体功能、精神心理状态、言语吞咽功能等，详细了解伤员功能障碍的程度，依此制定康复治疗方案和目标。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-family: 宋体, SimSun; font-size: 14px;&quot;&gt;（2）意识障碍的伤员可通过药物、高压氧等治疗促进意识的恢复，家属应积极配合进行亲情唤醒。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-family: 宋体, SimSun; font-size: 14px;&quot;&gt;（3）脑外伤伤员常合并有记忆力、注意力、定向力、计算力等损害，可以通过药物、高压氧治疗以及认知功能训练进行康复，需要家属积极配合。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-family: 宋体, SimSun; font-size: 14px;&quot;&gt;（4）伤员若存在语言表达、理解、阅读、书写能力的下降，应进行言语训练。医务人员和家属等要多与伤员语言交流。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-family: 宋体, SimSun; font-size: 14px;&quot;&gt;（5）应在评估伤员构音和吞咽功能的基础上确定进食方式，必要时保留胃管进行构音和吞咽功能训练。家属等有关人员要在康复专业人员的指导下给患者喂食，防止误吸或窒息的发生。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-family: 宋体, SimSun; font-size: 14px;&quot;&gt;（6）在充分考虑伤员病情、体力、心肺功能的基础上，协助伤员进行关节活动、起坐、站立、平衡与协调、步行、运动控制的训练。训练时应注意安全，防止摔倒等意外情况发生。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-family: 宋体, SimSun; font-size: 14px;&quot;&gt;（7）加强伤员ADL能力的训练，争取尽早恢复健肢的生活自理功能，逐步促进和恢复患肢的自理能力。必要时可以使用辅具和矫形器。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-family: 宋体, SimSun; font-size: 14px;&quot;&gt;（8）对于大小便功能障碍的伤员，要首先查找原因，有针对性地开展治疗。选择合适的排便和排尿方式，培养正确的排便和排尿习惯。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '2017-04-25 17:35');

-- ----------------------------
-- Table structure for `health_know_img`
-- ----------------------------
DROP TABLE IF EXISTS `health_know_img`;
CREATE TABLE `health_know_img` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `health_know_img` varchar(150) DEFAULT NULL COMMENT '图片路径',
  `know_id` mediumint(9) NOT NULL COMMENT '所属知识ID',
  PRIMARY KEY (`id`),
  KEY `know_id` (`know_id`),
  CONSTRAINT `health_know_img_ibfk_1` FOREIGN KEY (`know_id`) REFERENCES `health_know` (`know_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='健康知识内容图片表';

-- ----------------------------
-- Records of health_know_img
-- ----------------------------

-- ----------------------------
-- Table structure for `history_search`
-- ----------------------------
DROP TABLE IF EXISTS `history_search`;
CREATE TABLE `history_search` (
  `history_id` int(8) NOT NULL AUTO_INCREMENT COMMENT '搜索ID',
  `user_phone` varchar(16) NOT NULL COMMENT '用户手机号码',
  `search_content` longtext COMMENT '搜索内容',
  `search_time` varchar(16) DEFAULT NULL COMMENT '搜索时间',
  PRIMARY KEY (`history_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of history_search
-- ----------------------------
INSERT INTO `history_search` VALUES ('3', '15768653333', '糖尿病', '2017-04-13 17:20');
INSERT INTO `history_search` VALUES ('4', '15768653949', 'aa', null);

-- ----------------------------
-- Table structure for `hospital_info`
-- ----------------------------
DROP TABLE IF EXISTS `hospital_info`;
CREATE TABLE `hospital_info` (
  `hos_id` mediumint(9) NOT NULL AUTO_INCREMENT COMMENT '医院ID',
  `hos_name` varchar(150) NOT NULL COMMENT '医院名称',
  `hos_level` varchar(30) NOT NULL DEFAULT '' COMMENT '医院等级',
  `hos_address` varchar(30) NOT NULL DEFAULT '' COMMENT '医院所属地址',
  `hos_address_detail` varchar(150) NOT NULL DEFAULT '' COMMENT '医院详细地址',
  `hos_longitude` varchar(30) NOT NULL DEFAULT '' COMMENT '医院经度',
  `hos_latitude` varchar(30) NOT NULL DEFAULT '' COMMENT '医院维度',
  `hos_introduce` longtext COMMENT '医院介绍',
  `hos_navigate_img` varchar(150) DEFAULT '' COMMENT '院内导航图片',
  `hos_hot` varchar(30) NOT NULL DEFAULT '' COMMENT '医院热门程度',
  `hos_time` varchar(30) NOT NULL DEFAULT '' COMMENT '创建时间',
  `hos_link` varchar(255) NOT NULL COMMENT '官网',
  `hos_attention` varchar(32) NOT NULL COMMENT '被关注量',
  `hos_daohang` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`hos_id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8 COMMENT='医院信息';

-- ----------------------------
-- Records of hospital_info
-- ----------------------------
INSERT INTO `hospital_info` VALUES ('53', '惠州市儿童医院', '二甲', '广东省 惠州市 惠城区', '人民中路318号', '114.429203', '23.088700000', '&lt;p&gt;广东省惠州市惠城区演达大道46号惠州学院对面&lt;/p&gt;', 'Hospital/2017-04-12/58ee11715d13f.jpg', '324', '2017-03-11 16:23:06', '', '626', 'Hospital/disan.jpg');
INSERT INTO `hospital_info` VALUES ('54', '惠州市中心人民医院', '三甲', '广东省 惠州市 惠城区', '广东省惠州市惠城区鹅岭北路', '114.405428', '23.088142', '&lt;p&gt;惠州市中心人民医院坐落于惠民之州——惠州，面积两百余亩，是惠州最大的医院。&lt;/p&gt;', 'Hospital/2017-04-12/58ee112bd4e64.jpg', '541', '2017-03-16 17:50:21', '', '137', 'Hospital/disan.jpg');
INSERT INTO `hospital_info` VALUES ('55', '东华医院', '二乙', '广东省 惠州 惠城区', '河南岸南岸路143号', '114.429104', '23.066893', '&lt;p&gt;惠州东华医院位于惠城区河南岸南岸路143号，是一所综合性医院。医院经营面积6000平方米，医院核定床位230张（暂定），全院职工预计215人。&lt;/p&gt;', 'Hospital/2017-04-12/58ee11037d622.jpg', '135', '2017-03-22 12:43:25', '', '568', 'Hospital/disan.jpg');
INSERT INTO `hospital_info` VALUES ('56', '惠州市博爱医院', '三甲', '广东省 惠州市 惠城区', '河南岸演达大道46号', '114.42628', '23.07249', '&lt;p&gt;段开始到静安寺肯德基爱神的箭卡死了&lt;/p&gt;', 'Hospital/2017-04-12/58ee10c5d9edb.jpg', '539', '2017-03-24 19:31:29', '', '367', 'Hospital/disan.jpg');
INSERT INTO `hospital_info` VALUES ('57', '惠州市第三人民医院', '二甲', '广东省 惠州市 惠城区', '东平公园', '114.430077', '23.095056', '&lt;p&gt;惠州市第三人民医院惠州市第三人民医院惠州市第三人民医院惠州市第三人民医院惠州市第三人民医院&lt;/p&gt;', 'Hospital/2017-04-06/58e6132a76fff.jpg', '5.0', '2017-04-06 18:06:34', '', '562', 'Hospital/disan.jpg');
INSERT INTO `hospital_info` VALUES ('64', '北京协和医院', '三甲', '北京 西城区 ', '人民中路46号', '116.3676100000', '39.9129700000', '&lt;p&gt;王企鹅群翁群翁群翁&lt;/p&gt;', 'Hospital/2017-04-06/58e6132a76fff.jpg', '347', '', '', '349', 'Hospital/disan.jpg');

-- ----------------------------
-- Table structure for `hos_dep`
-- ----------------------------
DROP TABLE IF EXISTS `hos_dep`;
CREATE TABLE `hos_dep` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dep_id` mediumint(9) NOT NULL COMMENT '科室ID',
  `hos_id` mediumint(9) NOT NULL COMMENT '所属医院',
  `dep_introduce` longtext NOT NULL COMMENT '科室介绍',
  `dep_time` varchar(32) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `hot` varchar(8) DEFAULT NULL COMMENT '是否热门',
  PRIMARY KEY (`id`),
  KEY `hos_id` (`hos_id`),
  KEY `dep_id` (`dep_id`),
  CONSTRAINT `hos_dep_ibfk_1` FOREIGN KEY (`hos_id`) REFERENCES `hospital_info` (`hos_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `hos_dep_ibfk_2` FOREIGN KEY (`dep_id`) REFERENCES `department_info` (`dep_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8 COMMENT='医院-科室关联表';

-- ----------------------------
-- Records of hos_dep
-- ----------------------------
INSERT INTO `hos_dep` VALUES ('1', '1', '54', 'sadasd', '12323', '1');
INSERT INTO `hos_dep` VALUES ('2', '1', '53', '213', '213', null);
INSERT INTO `hos_dep` VALUES ('4', '6', '53', '&lt;p&gt;萨达&lt;/p&gt;', '2017-03-17 19:23:46', null);
INSERT INTO `hos_dep` VALUES ('5', '7', '53', '&lt;p&gt;萨达&lt;/p&gt;', '2017-03-17 19:23:55', null);
INSERT INTO `hos_dep` VALUES ('7', '2', '54', '', '2017-03-17 19:26:22', '1');
INSERT INTO `hos_dep` VALUES ('8', '5', '54', '妇产科是临床医学四大主要学科之一，主要研究女性生殖器官疾病的病因、病理、诊断及防治，妊娠、分娩的生理和病理变化，高危妊娠及难产的预防和诊治，女性生殖内分分泌，计划生育及妇女保健等。现代分子生物学、肿瘤学、遗传学、生殖内分泌学及免疫学等医学基础理论的深入研究和临床医学诊疗检测技术的进步，拓宽和深化了妇产科学的发展，为保障妇女身体和生殖健康及防治各种妇产科疾病起着重要的作用。', '2017-03-21 10:05:32', null);
INSERT INTO `hos_dep` VALUES ('9', '7', '54', '&lt;p&gt;阿萨德&lt;/p&gt;', '2017-03-21 12:03:58', null);
INSERT INTO `hos_dep` VALUES ('14', '10', '54', '&lt;p&gt;sad&lt;/p&gt;', '2017-03-21 12:32:41', null);
INSERT INTO `hos_dep` VALUES ('15', '4', '54', '&lt;p&gt;sad&lt;/p&gt;', '2017-03-21 12:35:42', null);
INSERT INTO `hos_dep` VALUES ('18', '8', '54', '', '2017-03-21 12:58:19', null);
INSERT INTO `hos_dep` VALUES ('20', '6', '54', '', '2017-03-21 13:00:04', null);
INSERT INTO `hos_dep` VALUES ('21', '9', '54', '', '2017-03-21 13:00:36', null);
INSERT INTO `hos_dep` VALUES ('23', '2', '53', '', '2017-03-21 13:31:49', null);
INSERT INTO `hos_dep` VALUES ('24', '8', '53', '', '2017-03-21 13:31:54', '1');
INSERT INTO `hos_dep` VALUES ('25', '9', '53', '', '2017-03-21 13:31:59', null);
INSERT INTO `hos_dep` VALUES ('26', '4', '53', '', '2017-03-21 13:32:17', null);
INSERT INTO `hos_dep` VALUES ('27', '3', '54', '&lt;p&gt;撒打算&lt;/p&gt;', '2017-03-22 11:26:48', null);
INSERT INTO `hos_dep` VALUES ('28', '1', '55', '', '2017-03-22 12:44:32', '1');
INSERT INTO `hos_dep` VALUES ('29', '2', '55', '', '2017-03-22 12:44:37', null);
INSERT INTO `hos_dep` VALUES ('30', '3', '55', '', '2017-03-22 12:44:41', null);
INSERT INTO `hos_dep` VALUES ('31', '4', '55', '', '2017-03-22 12:44:46', null);
INSERT INTO `hos_dep` VALUES ('32', '5', '55', '', '2017-03-22 12:44:51', null);
INSERT INTO `hos_dep` VALUES ('33', '6', '55', '', '2017-03-22 14:34:35', null);
INSERT INTO `hos_dep` VALUES ('34', '7', '57', '', '2017-04-07 22:09:52', '');
INSERT INTO `hos_dep` VALUES ('35', '6', '57', '&lt;p&gt;萨达&lt;br/&gt;&lt;/p&gt;', '2017-04-07 22:09:41', '');
INSERT INTO `hos_dep` VALUES ('36', '1', '57', '', '2017-04-07 22:09:46', '1');
INSERT INTO `hos_dep` VALUES ('37', '2', '57', '', '2017-04-07 22:10:01', null);
INSERT INTO `hos_dep` VALUES ('38', '8', '57', '', '2017-04-07 22:10:07', null);
INSERT INTO `hos_dep` VALUES ('39', '9', '57', '', '2017-04-07 22:10:12', null);
INSERT INTO `hos_dep` VALUES ('40', '1', '56', '', '2017-04-07 22:22:56', null);
INSERT INTO `hos_dep` VALUES ('41', '2', '56', '', '2017-04-07 22:23:04', null);
INSERT INTO `hos_dep` VALUES ('42', '3', '56', '', '2017-04-07 22:23:11', null);
INSERT INTO `hos_dep` VALUES ('43', '4', '56', '', '2017-04-07 22:23:15', null);
INSERT INTO `hos_dep` VALUES ('44', '5', '56', '', '2017-04-07 22:23:21', null);
INSERT INTO `hos_dep` VALUES ('45', '6', '56', '', '2017-04-07 22:23:26', null);
INSERT INTO `hos_dep` VALUES ('46', '7', '56', '', '2017-04-07 22:23:30', null);
INSERT INTO `hos_dep` VALUES ('47', '8', '56', '', '2017-04-07 22:23:35', null);
INSERT INTO `hos_dep` VALUES ('48', '13', '56', '', '2017-04-07 22:23:40', null);
INSERT INTO `hos_dep` VALUES ('49', '12', '56', '', '2017-04-07 22:23:45', null);
INSERT INTO `hos_dep` VALUES ('50', '14', '56', '', '2017-04-07 22:23:49', null);
INSERT INTO `hos_dep` VALUES ('51', '10', '56', '', '2017-04-07 22:23:53', null);
INSERT INTO `hos_dep` VALUES ('52', '15', '56', '', '2017-04-07 22:23:58', null);
INSERT INTO `hos_dep` VALUES ('53', '12', '53', '', '2017-04-07 22:26:19', null);
INSERT INTO `hos_dep` VALUES ('54', '3', '57', '', '0', null);
INSERT INTO `hos_dep` VALUES ('55', '11', '57', '', '0', null);
INSERT INTO `hos_dep` VALUES ('56', '17', '57', '', '0', null);
INSERT INTO `hos_dep` VALUES ('57', '18', '57', '', '0', null);
INSERT INTO `hos_dep` VALUES ('58', '5', '57', '', '0', null);
INSERT INTO `hos_dep` VALUES ('59', '10', '57', '', '0', null);
INSERT INTO `hos_dep` VALUES ('61', '8', '55', '', '0', null);
INSERT INTO `hos_dep` VALUES ('62', '19', '55', '', '0', null);

-- ----------------------------
-- Table structure for `hos_img`
-- ----------------------------
DROP TABLE IF EXISTS `hos_img`;
CREATE TABLE `hos_img` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `hos_img` varchar(150) DEFAULT NULL COMMENT '医院图片',
  `hos_mid_img` varchar(150) DEFAULT NULL COMMENT '中图',
  `hos_sm_img` varchar(150) DEFAULT NULL COMMENT '小图',
  `hos_id` mediumint(9) NOT NULL COMMENT '医院ID',
  PRIMARY KEY (`id`),
  KEY `hos_id` (`hos_id`),
  CONSTRAINT `hos_img_ibfk_1` FOREIGN KEY (`hos_id`) REFERENCES `hospital_info` (`hos_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8 COMMENT='医院图片';

-- ----------------------------
-- Records of hos_img
-- ----------------------------
INSERT INTO `hos_img` VALUES ('27', 'Hospital/1.jpg', 'Hospital/2017-03-11/thumb_0_58c3b3ea8381b.jpg', 'Hospital/2017-03-11/thumb_1_58c3b3ea8381b.jpg', '53');
INSERT INTO `hos_img` VALUES ('28', 'Hospital/2.jpg', 'Hospital/2017-03-16/thumb_0_58ca5fdd343c8.jpg', 'Hospital/2017-03-16/thumb_1_58ca5fdd343c8.jpg', '54');
INSERT INTO `hos_img` VALUES ('31', 'Hospital/3.jpg', 'Hospital/2017-03-22/thumb_0_58d200ee440f8.jpg', 'Hospital/2017-03-22/thumb_1_58d200ee440f8.jpg', '55');
INSERT INTO `hos_img` VALUES ('33', 'Hospital/4.jpg', 'Hospital/2017-04-06/thumb_0_58e6132bac41b.jpg', 'Hospital/2017-04-06/thumb_1_58e6132bac41b.jpg', '57');
INSERT INTO `hos_img` VALUES ('34', 'Hospital/5.jpg', 'Hospital/2017-04-06/thumb_0_58e6132bccd94.jpg', 'Hospital/2017-04-06/thumb_1_58e6132bccd94.jpg', '57');
INSERT INTO `hos_img` VALUES ('35', 'Hospital/6.jpg', 'Hospital/2017-04-06/thumb_0_58e61f437aefd.jpg', 'Hospital/2017-04-06/thumb_1_58e61f437aefd.jpg', '57');
INSERT INTO `hos_img` VALUES ('37', 'Hospital/7.jpg', 'Hospital/2017-04-06/thumb_0_58e62991f115e.jpg', 'Hospital/2017-04-06/thumb_1_58e62991f115e.jpg', '57');
INSERT INTO `hos_img` VALUES ('38', 'Hospital/8.jpg', 'Hospital/2017-04-06/thumb_0_58e62b18350bd.jpg', 'Hospital/2017-04-06/thumb_1_58e62b18350bd.jpg', '55');
INSERT INTO `hos_img` VALUES ('39', 'Hospital/9.png', 'Hospital/2017-04-12/thumb_0_58ee10a4cf1df.jpg', 'Hospital/2017-04-12/thumb_1_58ee10a4cf1df.jpg', '56');
INSERT INTO `hos_img` VALUES ('40', 'Hospital/10.png', 'Hospital/2017-04-12/thumb_0_58ee10b4ce491.jpg', 'Hospital/2017-04-12/thumb_1_58ee10b4ce491.jpg', '56');
INSERT INTO `hos_img` VALUES ('41', 'Hospital/11.jpg', 'Hospital/2017-04-12/thumb_0_58ee111b5eb21.jpg', 'Hospital/2017-04-12/thumb_1_58ee111b5eb21.jpg', '55');
INSERT INTO `hos_img` VALUES ('42', 'Hospital/1.jpg', 'Hospital/2017-04-12/thumb_0_58ee113ecfb15.jpg', 'Hospital/2017-04-12/thumb_1_58ee113ecfb15.jpg', '54');
INSERT INTO `hos_img` VALUES ('43', 'Hospital/2.jpg', 'Hospital/2017-04-12/thumb_0_58ee11922e2e4.jpg', 'Hospital/2017-04-12/thumb_1_58ee11922e2e4.jpg', '53');
INSERT INTO `hos_img` VALUES ('45', 'Hospital/4.jpg', null, null, '55');
INSERT INTO `hos_img` VALUES ('46', 'Hospital/5.jpg', null, null, '55');
INSERT INTO `hos_img` VALUES ('47', 'Hospital/2017-06-15/59422984c5ad7.jpg', 'Hospital/2017-06-15/thumb_0_59422984c5ad7.jpg', 'Hospital/2017-06-15/thumb_1_59422984c5ad7.jpg', '64');

-- ----------------------------
-- Table structure for `illness`
-- ----------------------------
DROP TABLE IF EXISTS `illness`;
CREATE TABLE `illness` (
  `illness_id` mediumint(8) NOT NULL AUTO_INCREMENT COMMENT '疾病ID',
  `one_depa_id` mediumint(8) NOT NULL COMMENT '一级科室ID',
  `two_depa_id` mediumint(8) NOT NULL COMMENT '二级科室ID',
  `illness_name` varchar(32) NOT NULL COMMENT '疾病名称',
  `illness_introduce` longtext COMMENT '疾病介绍',
  PRIMARY KEY (`illness_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='疾病表';

-- ----------------------------
-- Records of illness
-- ----------------------------
INSERT INTO `illness` VALUES ('1', '1', '6', '脑外伤', '&lt;p&gt;脑外伤脑外伤脑外伤&lt;/p&gt;');
INSERT INTO `illness` VALUES ('2', '1', '11', '骨折', '&lt;p&gt;骨折骨折&lt;/p&gt;');
INSERT INTO `illness` VALUES ('4', '0', '8', '冠心病', '&lt;p&gt;冠心病冠心病冠心病冠心病&lt;/p&gt;');
INSERT INTO `illness` VALUES ('5', '0', '9', '脑梗塞', '&lt;p&gt;脑梗塞脑梗塞脑梗塞&lt;/p&gt;');
INSERT INTO `illness` VALUES ('6', '0', '12', '小儿感冒', '&lt;p&gt;小儿感冒小儿感冒小儿感冒&lt;/p&gt;');
INSERT INTO `illness` VALUES ('7', '0', '10', '月经失调', '&lt;p&gt;月经失调月经失调月经失调月经失调&lt;/p&gt;');
INSERT INTO `illness` VALUES ('8', '0', '7', '风湿性心脏病', '&lt;p&gt;风湿性心脏病风湿性心脏病风湿性心脏病&lt;/p&gt;');
INSERT INTO `illness` VALUES ('9', '0', '6', '脑出血', '&lt;p&gt;脑出血脑出血脑出血&lt;/p&gt;');
INSERT INTO `illness` VALUES ('10', '0', '13', '腰椎间盘突出', '&lt;p&gt;腰椎间盘突出腰椎间盘突出&lt;/p&gt;');
INSERT INTO `illness` VALUES ('11', '0', '14', '新生儿黄疸', '&lt;p&gt;新生儿黄疸新生儿黄疸新生儿黄疸&lt;/p&gt;');

-- ----------------------------
-- Table structure for `inquiry`
-- ----------------------------
DROP TABLE IF EXISTS `inquiry`;
CREATE TABLE `inquiry` (
  `id` int(16) NOT NULL AUTO_INCREMENT COMMENT '记录ID',
  `user_phone` varchar(16) DEFAULT NULL COMMENT '用户ID',
  `zixun_illness` varchar(255) DEFAULT NULL,
  `see_doc` varchar(8) DEFAULT NULL COMMENT '是否去过医院',
  `zixun_text` longtext COMMENT '问诊信息',
  `time` varchar(16) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='问诊信息表';

-- ----------------------------
-- Records of inquiry
-- ----------------------------
INSERT INTO `inquiry` VALUES ('9', '15768653948', '头痛', '否', '不舒服', '2017-05-04 10:42');
INSERT INTO `inquiry` VALUES ('10', '17727217224', '脚不舒服', '否', '疼痛', '2017-05-04 10:42');
INSERT INTO `inquiry` VALUES ('11', '15768651577', '皮肤病', '否', '皮肤痒', '2017-05-04 10:48');
INSERT INTO `inquiry` VALUES ('13', '15768653949', '头痛', '是', '偏头痛', '2017-05-05 01:02');

-- ----------------------------
-- Table structure for `inqu_img`
-- ----------------------------
DROP TABLE IF EXISTS `inqu_img`;
CREATE TABLE `inqu_img` (
  `id` int(16) NOT NULL AUTO_INCREMENT COMMENT '图片ID',
  `inqu_img_path` varchar(255) DEFAULT NULL COMMENT '图片路径',
  `inqu_img_time` varchar(16) DEFAULT NULL COMMENT '创建时间',
  `user_phone` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='问诊图片';

-- ----------------------------
-- Records of inqu_img
-- ----------------------------
INSERT INTO `inqu_img` VALUES ('1', 'Inquiry/2017-04-29/5904ad2bb751a.jpg', '2017-04-29 23:11', '15768653949');
INSERT INTO `inqu_img` VALUES ('4', 'Inquiry/2017-04-30/5904bacca5895.jpg', '2017-04-30 00:09', '15768653949');
INSERT INTO `inqu_img` VALUES ('5', 'Inquiry/2017-04-30/5904baccb8325.jpg', '2017-04-30 00:09', '15768653949');
INSERT INTO `inqu_img` VALUES ('6', 'Inquiry/2017-05-04/590a9687dba23.jpg', '2017-05-04 10:48', '15768651577');
INSERT INTO `inqu_img` VALUES ('7', 'Inquiry/2017-05-05/590b5d365cf15.jpg', '2017-05-05 00:56', '15768653949');
INSERT INTO `inqu_img` VALUES ('8', 'Inquiry/2017-05-05/590b5ea74a540.jpg', '2017-05-05 01:02', '15768653949');

-- ----------------------------
-- Table structure for `manager`
-- ----------------------------
DROP TABLE IF EXISTS `manager`;
CREATE TABLE `manager` (
  `mg_id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `mg_admin` varchar(150) DEFAULT NULL,
  `mg_password` varchar(150) DEFAULT NULL,
  `create_time` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`mg_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of manager
-- ----------------------------
INSERT INTO `manager` VALUES ('1', 'admin', '123456', null);
INSERT INTO `manager` VALUES ('8', 'wangzhe', '123', '2017-07-14 20:35:58');
INSERT INTO `manager` VALUES ('9', 'guest', 'guest', '2017-07-09 16:25:36');

-- ----------------------------
-- Table structure for `message_push`
-- ----------------------------
DROP TABLE IF EXISTS `message_push`;
CREATE TABLE `message_push` (
  `push_id` mediumint(8) NOT NULL AUTO_INCREMENT COMMENT '推送ID',
  `push_title` varchar(32) DEFAULT NULL COMMENT '标题',
  `push_img` varchar(64) DEFAULT NULL COMMENT '图片',
  `push_see` varchar(32) DEFAULT NULL COMMENT '浏览量',
  `push_content` longtext COMMENT '内容',
  `create_time` varchar(16) DEFAULT NULL COMMENT '时间',
  PRIMARY KEY (`push_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='消息推送';

-- ----------------------------
-- Records of message_push
-- ----------------------------

-- ----------------------------
-- Table structure for `my_doc`
-- ----------------------------
DROP TABLE IF EXISTS `my_doc`;
CREATE TABLE `my_doc` (
  `id` int(16) NOT NULL AUTO_INCREMENT,
  `user_phone` varchar(16) DEFAULT NULL COMMENT '用户ID',
  `doc_phone` varchar(16) DEFAULT NULL COMMENT '关注的医生ID',
  `my_doc_time` varchar(16) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='我的医生';

-- ----------------------------
-- Records of my_doc
-- ----------------------------
INSERT INTO `my_doc` VALUES ('11', '15768653949', '11768653949', '2017-05-05 00:49');

-- ----------------------------
-- Table structure for `news`
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news` (
  `news_id` mediumint(8) NOT NULL AUTO_INCREMENT COMMENT '新闻ID',
  `news_title` varchar(32) DEFAULT NULL COMMENT '标题',
  `news_see` varchar(32) DEFAULT NULL COMMENT '浏览量',
  `news_content` longtext COMMENT '内容',
  `time` varchar(16) DEFAULT NULL COMMENT '时间',
  PRIMARY KEY (`news_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='新闻表';

-- ----------------------------
-- Records of news
-- ----------------------------

-- ----------------------------
-- Table structure for `news_img`
-- ----------------------------
DROP TABLE IF EXISTS `news_img`;
CREATE TABLE `news_img` (
  `news_img_id` mediumint(8) NOT NULL AUTO_INCREMENT COMMENT '图片ID',
  `news_img_name` varchar(32) DEFAULT NULL COMMENT '图片名称',
  `news_img_path` varchar(32) DEFAULT NULL COMMENT '图片路径',
  `create_time` varchar(16) DEFAULT NULL COMMENT '创建时间',
  `news_id` mediumint(8) NOT NULL COMMENT '新闻ID',
  PRIMARY KEY (`news_img_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='新闻图片表';

-- ----------------------------
-- Records of news_img
-- ----------------------------

-- ----------------------------
-- Table structure for `page_img`
-- ----------------------------
DROP TABLE IF EXISTS `page_img`;
CREATE TABLE `page_img` (
  `page_img_id` int(16) NOT NULL AUTO_INCREMENT COMMENT '图片ID',
  `seecase_id` mediumint(9) NOT NULL COMMENT '图片名字',
  `page_img_path` varchar(150) DEFAULT NULL COMMENT '图片路径',
  `time` varchar(16) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`page_img_id`)
) ENGINE=InnoDB AUTO_INCREMENT=194 DEFAULT CHARSET=utf8 COMMENT='处方图片表';

-- ----------------------------
-- Records of page_img
-- ----------------------------
INSERT INTO `page_img` VALUES ('3', '8', 'pageImg/2017-04-16/58f2d17d6f19c.jpg', '2017-04-16 10:05');
INSERT INTO `page_img` VALUES ('4', '2', 'pageImg/2017-04-16/58f2fdb9023af.jpg', '2017-04-16 13:14');
INSERT INTO `page_img` VALUES ('6', '18', 'pageImg/2017-04-17/58f4b0e2e365c.jpg', '2017-04-17 20:11');
INSERT INTO `page_img` VALUES ('7', '13', 'pageImg/2017-04-17/58f4c8ecac2f0.jpg', '2017-04-17 21:53');
INSERT INTO `page_img` VALUES ('165', '349', 'pageImg/2017-04-21/58f8e4e0d05fd.jpg', '2017-04-21 00:42');
INSERT INTO `page_img` VALUES ('171', '359', 'pageImg/2017-04-22/58fabdb0e7e44.jpg', '2017-04-22 10:19');
INSERT INTO `page_img` VALUES ('184', '12', 'pageImg/2017-04-22/58faee046bb5a.jpg', '2017-04-22 13:45');
INSERT INTO `page_img` VALUES ('185', '370', 'pageImg/2017-04-22/58fb125d90bde.jpg', '2017-04-22 16:20');
INSERT INTO `page_img` VALUES ('193', '377', 'pageImg/2017-04-23/58fc36060fc78.jpeg', '2017-04-23 13:05');

-- ----------------------------
-- Table structure for `pingjia`
-- ----------------------------
DROP TABLE IF EXISTS `pingjia`;
CREATE TABLE `pingjia` (
  `pingjia_id` int(16) NOT NULL AUTO_INCREMENT,
  `user_phone` varchar(16) DEFAULT NULL,
  `doc_phone` varchar(16) DEFAULT NULL,
  `pingjia_text` longtext,
  `time` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`pingjia_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pingjia
-- ----------------------------
INSERT INTO `pingjia` VALUES ('1', '15768653949', '15768651577', '医生人很好', '2017-5-11');
INSERT INTO `pingjia` VALUES ('2', '15768653948', '15768651577', '医术高明', '2017-5-11');
INSERT INTO `pingjia` VALUES ('3', '15768651577', '12768653949', '医生很好', '2017-05-04 10-25');
INSERT INTO `pingjia` VALUES ('4', '15768653949', '12768653949', '', '2017-05-05 00-35');
INSERT INTO `pingjia` VALUES ('5', '15768653949', '11768653949', '好医生不错', '2017-05-05 01-01');

-- ----------------------------
-- Table structure for `push_img`
-- ----------------------------
DROP TABLE IF EXISTS `push_img`;
CREATE TABLE `push_img` (
  `push_img_id` mediumint(8) NOT NULL AUTO_INCREMENT COMMENT '图片ID',
  `push_img_path` varchar(64) DEFAULT NULL COMMENT '图片路径',
  `push_img_name` varchar(32) DEFAULT NULL COMMENT '图片名字',
  `time` varchar(16) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`push_img_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='消息推送图片表';

-- ----------------------------
-- Records of push_img
-- ----------------------------

-- ----------------------------
-- Table structure for `relative_info`
-- ----------------------------
DROP TABLE IF EXISTS `relative_info`;
CREATE TABLE `relative_info` (
  `relative_id` mediumint(16) NOT NULL AUTO_INCREMENT COMMENT '被添加者ID',
  `user_id` mediumint(16) NOT NULL COMMENT '用户ID',
  `relative_name` varchar(16) NOT NULL COMMENT '姓名',
  `relative_sex` enum('女','男') DEFAULT '男' COMMENT '性别',
  `relative_age` mediumint(8) DEFAULT NULL COMMENT '年龄',
  `relative_date` varchar(30) NOT NULL COMMENT '出生日期',
  `relative_city` varchar(32) DEFAULT NULL COMMENT '居住地',
  `relative_phone` varchar(16) DEFAULT NULL COMMENT '电话',
  `relative_relation` varchar(16) DEFAULT NULL COMMENT '与用户的关系',
  `create_time` varchar(16) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`relative_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `relative_info_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='亲友信息';

-- ----------------------------
-- Records of relative_info
-- ----------------------------
INSERT INTO `relative_info` VALUES ('4', '10', '王兴浪', '男', '48', '04/20/2017', '广东 惠州 惠城区', '1125797922', '家庭成员', '2017-04-16 00:00');
INSERT INTO `relative_info` VALUES ('5', '1', '张三儿', '男', '5', '02/07/2012', '广东 惠州 惠城区', '15768650561', '家庭成员', '2017-04-16 17:01');
INSERT INTO `relative_info` VALUES ('6', '1', '张二狗', '男', '12', '04/16/2017', '广东 惠州 惠城区', '123', '朋友', '2017-04-16 18:07');
INSERT INTO `relative_info` VALUES ('7', '10', '黄宇红', '女', '46', '10/28/1971', '广东 惠州 惠城区', '12479888995', '家庭成员', '2017-04-16 18:42');
INSERT INTO `relative_info` VALUES ('9', '1', '张无忌', '男', '55', '06/12/1963', '广东 汕头 潮南区', '12345679122', '亲戚', '2017-04-17 19:56');
INSERT INTO `relative_info` VALUES ('10', '2', '王小强', '男', '12', '04/19/2017', '广东 惠州 惠城区', '123123', '朋友', '2017-04-17 21:07');
INSERT INTO `relative_info` VALUES ('11', '48', '涂', '', '0', '', '', '', '家庭成员', '2017-05-04 10:59');
INSERT INTO `relative_info` VALUES ('12', '49', '小学同学', '女', '29', '', '广州', '15745888569', '朋友', '2017-05-05 01:05');

-- ----------------------------
-- Table structure for `role`
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `role_id` mediumint(8) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(32) NOT NULL COMMENT '角色名称',
  `role_auth_ac` varchar(255) NOT NULL COMMENT '模块操作',
  `role_auth_ids` varchar(255) NOT NULL COMMENT '权限ID',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='后台管理员角色表';

-- ----------------------------
-- Records of role
-- ----------------------------

-- ----------------------------
-- Table structure for `see_doc_case`
-- ----------------------------
DROP TABLE IF EXISTS `see_doc_case`;
CREATE TABLE `see_doc_case` (
  `seecase_id` mediumint(9) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_id` mediumint(16) NOT NULL COMMENT '用户人ID',
  `relative_id` mediumint(16) DEFAULT '0' COMMENT '亲友ID',
  `seecase_hos` varchar(32) DEFAULT NULL COMMENT '就诊医院',
  `seecase_depa` varchar(32) DEFAULT NULL COMMENT '就诊科室',
  `seecase_doc` varchar(32) DEFAULT NULL COMMENT '就诊医生',
  `seecase_info` longtext COMMENT '诊断',
  `seecase_sgs` longtext COMMENT '医生建议',
  `page_info` longtext COMMENT '处方信息',
  `check_info` longtext COMMENT '检查信息',
  `seecase_time` varchar(16) DEFAULT NULL COMMENT '就诊时间',
  `time` varchar(16) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`seecase_id`)
) ENGINE=InnoDB AUTO_INCREMENT=378 DEFAULT CHARSET=utf8 COMMENT='医院就诊记录';

-- ----------------------------
-- Records of see_doc_case
-- ----------------------------
INSERT INTO `see_doc_case` VALUES ('2', '10', '0', '东华医院', '儿科', '王哲', '小儿感冒', '多喝水、多休息', '999感冒灵颗粒一盒、小柴胡冲剂一盒', '阿斯达所多', '2010年10月', '2017-04-22 15:36');
INSERT INTO `see_doc_case` VALUES ('7', '1', '5', '123', '213', '12', '3123', '', '', '', '04/14/2017', '2017-04-13 21:11');
INSERT INTO `see_doc_case` VALUES ('8', '1', '0', '阿斯达所多', '阿萨德', '按时', '21323', '萨达啊', '&lt;p&gt;撒大声地&lt;/p&gt;', '&lt;p&gt;阿萨德&lt;/p&gt;', '03/17/1994', '2017-04-14 17:09');
INSERT INTO `see_doc_case` VALUES ('12', '10', '4', '惠州市第三人民医院', '五官科', '刘医生', '过敏性鼻炎', '多休息，多锻炼', '布地奈德鼻喷雾剂1支/30ml、999感冒冲剂', '轻微鼻息肉', '04/11/2017', '2017-04-22 13:45');
INSERT INTO `see_doc_case` VALUES ('13', '1', '0', '惠州市第三人民医院', '骨科', '张三', '骨折', '多休息，多锻炼', '', '', '04/04/2017', '2017-04-16 16:51');
INSERT INTO `see_doc_case` VALUES ('14', '5', '0', '广州增城市中心医院', '妇科', '姚医生', '难产', '多休息，多锻炼', '', '', '04/04/2017', '2017-04-16 18:48');
INSERT INTO `see_doc_case` VALUES ('15', '10', '7', '龙川人民医院', '神经内科', '黄医生', '冠心病', '多喝水、多休息', '&lt;p&gt;多喝水、多休息多喝水、多休息&lt;/p&gt;', '', '04/05/2017', '2017-04-16 19:43');
INSERT INTO `see_doc_case` VALUES ('18', '10', '0', '惠州市第三人民医院', '口腔科', '吴医生', '蛀牙', '多休息，多锻炼', '&lt;p&gt;驱蚊器翁群翁群翁请问请问&lt;/p&gt;', '&lt;p&gt;驱蚊器翁而且请问请问请问请问&lt;/p&gt;', '04/13/2016', '2017-04-17 20:11');
INSERT INTO `see_doc_case` VALUES ('349', '10', '0', '北京第一人民医院', '急诊', '刘医生', '流感', '注意休息，多喝水', '感冒药一盒', '流鼻涕伴有发烧', '2016/07/22', '2017-04-21 00:42');
INSERT INTO `see_doc_case` VALUES ('359', '10', '0', '北京协和医院', '外科', '王医生', '冠心病', '心脏搭桥手术', '天草丹参保心茶', '心血管不正常', '2010/10/25', '2017-04-22 16:02');
INSERT INTO `see_doc_case` VALUES ('370', '10', '4', '玛丽医院', '嗖嗖嗖', '小报告', '去去去', '', '', '', '', '2017-04-22 16:20');
INSERT INTO `see_doc_case` VALUES ('376', '11', '0', '', '', '攻击力', '', '', '', '', '', '2017-04-22 16:58');
INSERT INTO `see_doc_case` VALUES ('377', '10', '0', '恭喜你我还', '红米', '111', 'dhdh', 'xhxhx', 'hxjxjddjdjTGV', 'djdjdjdjdj', '', '2017-04-24 21:13');

-- ----------------------------
-- Table structure for `slider_img`
-- ----------------------------
DROP TABLE IF EXISTS `slider_img`;
CREATE TABLE `slider_img` (
  `slider_id` mediumint(8) NOT NULL AUTO_INCREMENT COMMENT '图片ID',
  `slider_path` varchar(128) DEFAULT NULL COMMENT '图片路径',
  `slider_name` varchar(64) DEFAULT NULL COMMENT '图片名字',
  `slider_time` varchar(16) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`slider_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='轮播图';

-- ----------------------------
-- Records of slider_img
-- ----------------------------

-- ----------------------------
-- Table structure for `standard`
-- ----------------------------
DROP TABLE IF EXISTS `standard`;
CREATE TABLE `standard` (
  `stan_id` int(16) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_id` int(16) NOT NULL COMMENT '用户ID',
  `usestan_id` int(16) NOT NULL COMMENT '记录人ID',
  `blopre` varchar(8) DEFAULT NULL COMMENT '血压',
  `bloglu` varchar(8) DEFAULT NULL COMMENT '血糖',
  `heart` varchar(8) DEFAULT NULL COMMENT '心率',
  `pulse` varchar(8) DEFAULT NULL COMMENT '脉搏',
  `heat` varchar(8) DEFAULT NULL COMMENT '体温',
  `breathe` varchar(8) DEFAULT NULL COMMENT '呼吸频率',
  `capacity` varchar(8) DEFAULT NULL COMMENT '肺活量',
  `weight` varchar(8) DEFAULT NULL COMMENT '体重',
  `height` varchar(8) DEFAULT NULL COMMENT '身高',
  `vision` varchar(8) DEFAULT NULL COMMENT '视力',
  `time` varchar(16) DEFAULT NULL COMMENT '记录日期',
  PRIMARY KEY (`stan_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='健康指标表';

-- ----------------------------
-- Records of standard
-- ----------------------------
INSERT INTO `standard` VALUES ('1', '43', '0', '暂无', '暂无', '暂无', null, null, null, null, '暂无', '157cm', '暂无', '201752');
INSERT INTO `standard` VALUES ('2', '43', '0', '暂无', '暂无', '暂无', null, null, null, null, '暂无', '588cm', '暂无', '201751');
INSERT INTO `standard` VALUES ('3', '49', '0', '100mmHg', '暂无', '暂无', null, null, null, null, '暂无', '暂无', '暂无', '201754');
INSERT INTO `standard` VALUES ('4', '49', '0', '120mmHg', '无记录', '暂无', null, null, null, null, '暂无', '暂无', '暂无', '201755');
INSERT INTO `standard` VALUES ('5', '48', '0', '暂无', '无记录', '暂无', null, null, null, null, '暂无', '173cm', '暂无', '201766');

-- ----------------------------
-- Table structure for `talk`
-- ----------------------------
DROP TABLE IF EXISTS `talk`;
CREATE TABLE `talk` (
  `talk_id` int(16) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `sender_id` int(16) NOT NULL COMMENT '发送者ID',
  `receiver_id` int(16) NOT NULL COMMENT '接收者ID',
  `content` longtext COMMENT '内容',
  `talk_img_id` int(16) DEFAULT NULL COMMENT '图片ID',
  `talk_pic` varchar(32) DEFAULT NULL COMMENT '表情',
  `read` varchar(16) DEFAULT NULL COMMENT '是否已读',
  `time` varchar(16) DEFAULT NULL COMMENT '时间',
  PRIMARY KEY (`talk_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='聊天记录表';

-- ----------------------------
-- Records of talk
-- ----------------------------

-- ----------------------------
-- Table structure for `talk_img`
-- ----------------------------
DROP TABLE IF EXISTS `talk_img`;
CREATE TABLE `talk_img` (
  `talk_img_id` int(16) NOT NULL AUTO_INCREMENT COMMENT '图片ID',
  `talk_img_path` varchar(32) DEFAULT NULL COMMENT '图片路径',
  `time` varchar(16) DEFAULT NULL COMMENT '时间',
  PRIMARY KEY (`talk_img_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='聊天图片表';

-- ----------------------------
-- Records of talk_img
-- ----------------------------

-- ----------------------------
-- Table structure for `user_info`
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info` (
  `user_id` mediumint(16) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `user_name` varchar(16) NOT NULL COMMENT '用户姓名',
  `user_nickname` varchar(16) NOT NULL COMMENT '用户昵称',
  `user_age` mediumint(8) NOT NULL COMMENT '年龄',
  `user_phone` varchar(16) NOT NULL COMMENT '用户电话',
  `user_password` varchar(128) NOT NULL COMMENT '用户密码',
  `user_img` varchar(64) NOT NULL COMMENT '用户头像',
  `user_sex` enum('女','男') NOT NULL DEFAULT '男' COMMENT '用户性别',
  `user_city` varchar(128) NOT NULL COMMENT '所在城市',
  `user_date` varchar(16) NOT NULL COMMENT '出生日期',
  `papers_type` varchar(16) DEFAULT NULL COMMENT '证件类型',
  `papers_num` varchar(32) DEFAULT NULL COMMENT '证件号码',
  `nation` varchar(16) DEFAULT '汉' COMMENT '民族',
  `profession` varchar(16) DEFAULT NULL COMMENT '职业',
  `education` varchar(16) DEFAULT NULL COMMENT '文化程度',
  `marriage` varchar(8) NOT NULL COMMENT '婚姻状况',
  `user_qq` varchar(16) DEFAULT NULL COMMENT 'QQ',
  `user_weixin` varchar(16) DEFAULT NULL COMMENT '微信',
  `user_time` varchar(16) NOT NULL COMMENT '创建时间',
  `user_token` varchar(256) DEFAULT NULL,
  `token_time` varchar(16) DEFAULT NULL COMMENT 'token生成时间',
  `login_time` varchar(16) DEFAULT NULL COMMENT '最后一次登录时间',
  `im_token` varchar(255) DEFAULT NULL COMMENT '融云token',
  `user_cid` varchar(255) DEFAULT NULL COMMENT '推送CID',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- ----------------------------
-- Records of user_info
-- ----------------------------
INSERT INTO `user_info` VALUES ('1', '王小二', '张洋豪', '22', '15768650568', 'e10adc3949ba59abbe56e057f20f883e', 'User/headimg/2017-06-23/594c807d50147.jpg', '男', '黑龙江 鸡西 鸡冠区', '07/13/1995', '身份证', '441622199411067918', '汉', '学生', '本科', '未婚', '3777623205', '15768650568', '2017-03-25 12:41', 'b1a63e90f643468f7f553c218df8b175', '2017-06-23 13:06', '2017-06-23 13:06', 'H1u+oxNOWZMkxm9oF1gIQAw5f5aZvT5xw3JgzbRIqa+L76gWTUero/s+ToM7UkrE4G7SMrhpDZdnXNe4pSrk/Nt6VddU0wGc', 'ee4385d420a3f096c7be95769813a299');
INSERT INTO `user_info` VALUES ('2', '王妮丽', '王哲', '12', '15768650567', 'e10adc3949ba59abbe56e057f20f883e', 'User/2017-03-25/58d5ec6a6c634.jpg', '男', '天津 和平区 ', '11/09/1994', '身份证', '441622199411067918', '汉', '学生', '本科', '未婚', '3777623205', '15768650568', '2017-03-25 12:47', '52e3cf5a59038e27ef6564744081ef7b', '2017-06-06 22:26', '2017-06-06 22:26', 'rlCA52B5S12by3220ZRWLVJSNIpA9S6EZU7IckO4ZgdgZi4u1o2ODiR80ia6WDxB0ZV3W9VG58xQ7O4TGeFyDROIjSDL3en0', '66c302093ab39f5d96517c6f704668ff');
INSERT INTO `user_info` VALUES ('3', '黄巧玲', '黄辉煌', '22', '15768650566', 'e10adc3949ba59abbe56e057f20f883e', 'User/2017-03-25/58d5ebe31bf28.jpg', '男', '广东 惠州 惠城区', '123', '学生证', '123', '汉族', '学生仔', '本科', '未婚', '123', '213', '2017-04-10 12:57', '54b0ade9851210e1196108a708f8da7f', '2017-04-18 08:37', '2017-04-18 08:37', 'T/Wcpzqz0+DiOq6p80aX8Aw5f5aZvT5xw3JgzbRIqa+L76gWTUero6ZNEA1f++vGMLGFONZxDV5nXNe4pSrk/DOrvNPO9obM', '7c165f2b0ef3f3ebd5197f798a9f7117');
INSERT INTO `user_info` VALUES ('4', '于桂琴', '姚桂泰', '28', '15768650565', 'e10adc3949ba59abbe56e057f20f883e', 'User/2017-04-12/58ee11c7f147b.jpg', '男', '广东 惠州 惠城区', '1996-11-05', '身份证', '45456', '汉族', '学生', '本科', '未婚', '562356610', '562356610', '2017-04-12 19:38', null, null, null, 'KVcQpcvs/NXe/1wVZJNKkUeCMLfsJdG7DU8H1ybxjweIGYfROLLh8gdMlYAX7ke64cjtZBihQDIxIOavrjCWGI1TaqhoBcD8', null);
INSERT INTO `user_info` VALUES ('5', '何佳丽', '肥仔哥哥', '22', '15768652840', 'e10adc3949ba59abbe56e057f20f883e', 'User/2017-03-29/58db96bbf04bf.jpg', '男', '广东 广州 增城市', '06/06/1995', '身份证', '44162215564798888', '回族', '营养师', '本科', '未婚', '123456', '12346', '2017-03-29 19:13', '8f30ea9aa89e71ed34108e773fb1fa78', '2017-04-15 16:32', '2017-04-15 16:32', 'Em3Lsdwt+rOH2Q6sGpFgNww5f5aZvT5xw3JgzbRIqa+L76gWTUero6USCYyoi8vErmWzKc2/cx1Ig1GGHHi9MghZUialeCfr', null);
INSERT INTO `user_info` VALUES ('7', '赵民', '张三', '43', '15768653948', 'e10adc3949ba59abbe56e057f20f883e', 'User/78.jpg', '男', '  ', '', '身份证', '', '汉', '', '本科', '未婚', '', '', '2017-04-12 19:39', '1ff824f9ee4e1b406f216e44fdb825bf', '2017-04-20 09:51', '2017-04-20 09:51', 'JQN+aIMJ4bBsZI39GOaA3ww5f5aZvT5xw3JgzbRIqa+L76gWTUeroxeAX4e6xFfdy+ZkLl6MfuhheLBgh/qFnplmpHm5SmN8', null);
INSERT INTO `user_info` VALUES ('8', '李海东', '李四', '32', '15768653333', 'e10adc3949ba59abbe56e057f20f883e', 'User/2017-04-12/58ee122610e95.jpg', '男', '  ', '', '身份证', '', '汉', '', '本科', '未婚', '', '', '2017-04-12 19:40', '9f755e1214cc7d38b90665d70fe88c0a', '2017-04-20 20:34', '2017-04-20 20:34', 'PC8EIeoCDosHeNgWH+CEgQw5f5aZvT5xw3JgzbRIqa+L76gWTUero8K6f7PbQrg/y+ZkLl6MfuitzfSm0+F/Q5SFlE1cL6H4', null);
INSERT INTO `user_info` VALUES ('9', '张宝明', '', '29', '15768653334', 'e10adc3949ba59abbe56e057f20f883e', 'User/user_img.png', '男', '', '', null, null, '汉', null, null, '', null, null, '2017-04-12 18:21', 'd41661bd042bed4a597df4dda58e65cc', '2017-04-12 18:21', '2017-04-12 18:21', 'H7vrnfoHtFVcSS8ChYMcMUeCMLfsJdG7DU8H1ybxjweIGYfROLLh8hnIzKAYQhgZy6IOuQR8kJ5f2m3mYT4DE3mObAGH+Zny', null);
INSERT INTO `user_info` VALUES ('10', '赵国', '', '37', '15768653666', 'e10adc3949ba59abbe56e057f20f883e', 'User/user_img.png', '男', '', '', null, null, '汉', null, null, '', null, null, '2017-04-17 13:05', null, null, null, 'DIy4DnOKqV9QPGfG1b2IWUeCMLfsJdG7DU8H1ybxjweIGYfROLLh8jiZvSKQBubnHupunclA8hZf2m3mYT4DExE37CZH9Jpv', null);
INSERT INTO `user_info` VALUES ('11', '李东', '', '16', '15768653665', 'e10adc3949ba59abbe56e057f20f883e', 'User/user_img.png', '男', '', '', null, null, '汉', null, null, '', null, null, '2017-04-17 13:07', null, null, null, '1oVvMZvW/TwoKmVewgCoogw5f5aZvT5xw3JgzbRIqa+L76gWTUerox7CDK4pA3NMR07B+R0eHGZ/kW09WWDh+89EiKoNBb1p', null);
INSERT INTO `user_info` VALUES ('12', '赵毅', '', '38', '15768653335', 'e10adc3949ba59abbe56e057f20f883e', 'User/user_img.png', '男', '', '', null, null, '汉', null, null, '', null, null, '2017-04-17 13:51', null, null, null, 'w+tE73NNgT725yZ9666rN0eCMLfsJdG7DU8H1ybxjweIGYfROLLh8kiX/d9sk1+V4xE74X5RiYxf2m3mYT4DE4r1421EXpfH', null);
INSERT INTO `user_info` VALUES ('44', '张宝明', '', '37', '17727217224', 'e10adc3949ba59abbe56e057f20f883e', 'User/user_img2.jpg', '男', '广东 广州 增城市', '1996-11-05', '身份证', '44162215564798888', '汉', '厨师', '本科', '未婚', '562356610', '562356610', '2017-04-28 12:17', '5165ad41b04a73f60c815435a665ec0c', '2017-05-04 08:36', '2017-05-04 08:36', null, 'f18d226202d1199f5ea6b79a8d5a2992');
INSERT INTO `user_info` VALUES ('45', '小明', '', '0', '17727217222', 'e10adc3949ba59abbe56e057f20f883e', 'User/user_img.png', '男', '', '', null, null, '汉', null, null, '', null, null, '2017-05-04 08:50', '1b42a8fa02bca1c023a12823485141f8', '2017-05-04 08:50', '2017-05-04 08:50', 'vYtJqJ3bni1QlqKXmLHKpVJSNIpA9S6EZU7IckO4ZgfbNm7QQHUQ7VdkURn9VyKo0ABiC/3AlXfkdBvV37n88G5vYqNioyTI', '7c165f2b0ef3f3ebd5197f798a9f7117');
INSERT INTO `user_info` VALUES ('48', '李海东', '', '0', '15768651577', 'e10adc3949ba59abbe56e057f20f883e', 'User/headimg/2017-05-05/590b7e7e68875.BMP', '男', '', '', null, null, '汉', null, null, '', null, null, '2017-05-04 09:25', '326975a355766ad339eaafdecb9446c4', '2017-06-14 11:08', '2017-06-14 11:08', 'AwmbWJ78DO5y4tcvWhmN0Aw5f5aZvT5xw3JgzbRIqa+66NbwxcXwPQRhzlUbC9s1t4L0u6EuZe4kuqWCW/noviZI661vKPv0', 'ee4385d420a3f096c7be95769813a299');
INSERT INTO `user_info` VALUES ('49', '彭海波', '', '40', '15768653949', 'e10adc3949ba59abbe56e057f20f883e', 'User/headimg/2017-05-05/590b6312cd7ab.jpg', '男', '北京', '', '身份证', '', '汉', '', '初中或以下', '未婚', '', '', '2017-05-05 00:46', 'e4a6ca4df97cf9ad88a513b8a575526c', '2017-06-14 15:05', '2017-06-14 15:05', 'ZPTLpLT/0PyMoUOE9BRNcAw5f5aZvT5xw3JgzbRIqa+66NbwxcXwPdl1+3cQ/6ziuN8NxmGrDY5heLBgh/qFnirMlwiWMyPM', '7c165f2b0ef3f3ebd5197f798a9f7117');

-- ----------------------------
-- Table structure for `user_relation`
-- ----------------------------
DROP TABLE IF EXISTS `user_relation`;
CREATE TABLE `user_relation` (
  `user_id` int(16) NOT NULL COMMENT '用户ID',
  `user_add_id` int(16) DEFAULT NULL COMMENT '添加的患者',
  `account_id` int(16) DEFAULT NULL COMMENT '我的账户明细',
  `atten_id` int(16) DEFAULT NULL COMMENT '我的关注',
  `inqu_id` int(16) DEFAULT NULL COMMENT ' 我的问诊',
  `my_doc_id` int(16) DEFAULT NULL COMMENT '我的医生',
  `drug_id` int(16) DEFAULT NULL COMMENT '我的用药',
  `stan_id` int(16) DEFAULT NULL COMMENT '我的健康指标',
  `diet_id` int(16) DEFAULT NULL COMMENT '我的饮食',
  `habit_id` int(16) DEFAULT NULL COMMENT '我的习惯',
  `seecase_id` int(16) DEFAULT NULL COMMENT '历史就诊',
  `form_id` int(16) DEFAULT NULL COMMENT '我的订单',
  `feedb_id` int(16) DEFAULT NULL COMMENT '意见反馈',
  `file_id` int(16) DEFAULT NULL COMMENT '亲友档案',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户关联表';

-- ----------------------------
-- Records of user_relation
-- ----------------------------

-- ----------------------------
-- Table structure for `user_yzm`
-- ----------------------------
DROP TABLE IF EXISTS `user_yzm`;
CREATE TABLE `user_yzm` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_phone` varchar(16) DEFAULT NULL,
  `user_yzm` varchar(16) DEFAULT NULL,
  `yzm_time` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_yzm
-- ----------------------------
INSERT INTO `user_yzm` VALUES ('1', '17727217225', '818286', '2017-05-04 08:49');
INSERT INTO `user_yzm` VALUES ('4', '1772721722', '679638', '2017-04-22 23:44');
INSERT INTO `user_yzm` VALUES ('5', '15768653949', '804525', '2017-05-05 00:46');
INSERT INTO `user_yzm` VALUES ('6', '15768651577', '369494', '2017-05-04 09:24');
INSERT INTO `user_yzm` VALUES ('7', '15768651576', '666666', '2017-04-25 11:27');
INSERT INTO `user_yzm` VALUES ('8', '15711112222', '666666', '2017-04-26 21:10');
INSERT INTO `user_yzm` VALUES ('9', '15768653535', '742288', '2017-04-27 14:53');

-- ----------------------------
-- Table structure for `zixun`
-- ----------------------------
DROP TABLE IF EXISTS `zixun`;
CREATE TABLE `zixun` (
  `id` int(16) NOT NULL AUTO_INCREMENT,
  `doc_phone` varchar(16) DEFAULT NULL,
  `user_phone` varchar(16) DEFAULT NULL,
  `zixun_illness` varchar(255) DEFAULT NULL,
  `see_doc` varchar(8) DEFAULT NULL,
  `zixun_text` longtext,
  `time` varchar(16) DEFAULT NULL,
  `read` varchar(16) DEFAULT NULL COMMENT '是否已读',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=190 DEFAULT CHARSET=utf8 COMMENT='用户向医生发咨询的表';

-- ----------------------------
-- Records of zixun
-- ----------------------------
INSERT INTO `zixun` VALUES ('187', '11768653949', '15768653949', '心脏', '是', '心脏不好', '2017-05-05 00:49', '是');
INSERT INTO `zixun` VALUES ('188', '11768653949', '15768653949', '', '否', '', '2017-05-05 02:29', '是');
INSERT INTO `zixun` VALUES ('189', '11768653949', '15768653949', '', '否', '疼', '2017-05-05 02:30', '是');

-- ----------------------------
-- Table structure for `zixun_img`
-- ----------------------------
DROP TABLE IF EXISTS `zixun_img`;
CREATE TABLE `zixun_img` (
  `zixun_img_id` int(16) NOT NULL AUTO_INCREMENT,
  `zixun_img_path` varchar(128) DEFAULT NULL,
  `zixun_img_time` varchar(16) DEFAULT NULL,
  `doc_phone` varchar(16) DEFAULT NULL,
  `user_phone` varchar(16) DEFAULT NULL,
  `id` int(16) DEFAULT NULL COMMENT '咨询信息的ID',
  PRIMARY KEY (`zixun_img_id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COMMENT='咨询图片表';

-- ----------------------------
-- Records of zixun_img
-- ----------------------------
INSERT INTO `zixun_img` VALUES ('28', 'Zixun/2017-05-05/590b5b83927ca.jpg', '2017-05-05 00:49', '11768653949', '15768653949', '187');
INSERT INTO `zixun_img` VALUES ('29', 'Zixun/2017-05-05/590b732bb233d.jpg', '2017-05-05 02:30', '11768653949', '15768653949', '189');
