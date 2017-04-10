-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 2017-04-07 18:10:35
-- 服务器版本： 10.1.16-MariaDB
-- PHP Version: 5.6.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `healthsystem`
--

-- --------------------------------------------------------

--
-- 表的结构 `about`
--

CREATE TABLE `about` (
  `about_id` mediumint(8) NOT NULL COMMENT 'ID',
  `about_img` varchar(32) DEFAULT NULL COMMENT '图片',
  `about_title` varchar(32) DEFAULT NULL COMMENT '标题',
  `about_info` varchar(255) DEFAULT NULL COMMENT '介绍',
  `about_copy` varchar(128) DEFAULT NULL COMMENT '版权',
  `about_time` varchar(16) DEFAULT NULL COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='关于APP';

-- --------------------------------------------------------

--
-- 表的结构 `account`
--

CREATE TABLE `account` (
  `account_id` int(16) NOT NULL COMMENT '记录ID',
  `user_id` int(16) NOT NULL COMMENT '用户ID',
  `top_up` mediumint(8) DEFAULT NULL COMMENT '充值金钱',
  `consume` mediumint(8) DEFAULT NULL COMMENT '消费金钱',
  `pay_remain` mediumint(8) DEFAULT NULL COMMENT '余额',
  `swift_number` varchar(128) DEFAULT NULL COMMENT '流水号',
  `pay_time` varchar(16) DEFAULT NULL COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='我的账户详情';

-- --------------------------------------------------------

--
-- 表的结构 `analyze`
--

CREATE TABLE `analyze` (
  `analyze_id` mediumint(8) NOT NULL COMMENT 'ID',
  `analyze_down` varchar(16) DEFAULT NULL COMMENT '下载量',
  `doc_reg` varchar(16) DEFAULT NULL COMMENT '医生注册数',
  `user_reg` varchar(16) DEFAULT NULL COMMENT '用户注册数',
  `online_doc` varchar(16) DEFAULT NULL COMMENT '在线医生人数',
  `online_user` varchar(16) DEFAULT NULL COMMENT '在线用户人数',
  `count_rece` varchar(16) DEFAULT NULL COMMENT '累计就诊人数',
  `analyze_time` varchar(16) DEFAULT NULL COMMENT '时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='统计分析表';

-- --------------------------------------------------------

--
-- 表的结构 `attention`
--

CREATE TABLE `attention` (
  `atten_id` int(16) NOT NULL COMMENT '记录ID',
  `user_id` int(16) NOT NULL COMMENT '用户ID',
  `hos_id` mediumint(8) NOT NULL COMMENT '医院ID',
  `doc_id` mediumint(8) NOT NULL COMMENT '医生ID',
  `atten_time` varchar(16) DEFAULT NULL COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户关注表';

-- --------------------------------------------------------

--
-- 表的结构 `auth`
--

CREATE TABLE `auth` (
  `auth_id` mediumint(8) NOT NULL COMMENT '权限ID',
  `auth_name` varchar(32) NOT NULL COMMENT '权限名称',
  `auth_pid` varchar(32) NOT NULL COMMENT '父ID',
  `auth_c` varchar(64) NOT NULL COMMENT '模块',
  `auth_a` varchar(64) NOT NULL COMMENT '操作方法',
  `auth_path` varchar(128) NOT NULL COMMENT '全路径',
  `auth_level` varchar(8) NOT NULL COMMENT '级别'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='后台管理员权限表';

-- --------------------------------------------------------

--
-- 表的结构 `check_img`
--

CREATE TABLE `check_img` (
  `check_img_id` int(16) NOT NULL COMMENT '图片ID',
  `check_img_name` varchar(32) DEFAULT NULL COMMENT '图片名字',
  `check_img_path` varchar(32) DEFAULT NULL COMMENT '图片路径',
  `time` varchar(16) DEFAULT NULL COMMENT '时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='检查图片表';

-- --------------------------------------------------------

--
-- 表的结构 `department_info`
--

CREATE TABLE `department_info` (
  `dep_id` mediumint(9) NOT NULL COMMENT '科室ID',
  `dep_name` varchar(30) NOT NULL COMMENT '科室名称',
  `parent_id` mediumint(9) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='科室信息';

--
-- 转存表中的数据 `department_info`
--

INSERT INTO `department_info` (`dep_id`, `dep_name`, `parent_id`) VALUES
(1, '外科', 0),
(2, '内科', 0),
(3, '骨外科', 0),
(4, '儿科学', 0),
(5, '妇产科学', 0),
(6, '神经外科', 1),
(7, '心血管外科', 1),
(8, '心血管内科', 2),
(9, '神经内科', 2),
(10, '妇科', 5),
(11, '骨科', 3),
(12, '儿科', 4),
(13, '脊柱外科', 3),
(14, '新生儿科', 4),
(15, '产科', 5);

-- --------------------------------------------------------

--
-- 表的结构 `depa_illness`
--

CREATE TABLE `depa_illness` (
  `depa_illness_id` mediumint(8) NOT NULL COMMENT '关联ID',
  `one_depa_id` mediumint(8) NOT NULL COMMENT '一级科室ID',
  `two_depa_id` mediumint(8) NOT NULL COMMENT '二级科室ID',
  `illness_id` mediumint(8) NOT NULL COMMENT '疾病ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='科室疾病关联表';

-- --------------------------------------------------------

--
-- 表的结构 `diet`
--

CREATE TABLE `diet` (
  `diet_id` int(16) NOT NULL COMMENT 'ID',
  `user_id` int(16) NOT NULL COMMENT '用户ID',
  `usediet_id` int(16) NOT NULL COMMENT '记录人ID',
  `type_diet` varchar(8) DEFAULT NULL COMMENT '餐型',
  `food` varchar(255) DEFAULT NULL COMMENT '食物',
  `diet_time` varchar(16) DEFAULT NULL COMMENT '用餐时间',
  `time` varchar(16) DEFAULT NULL COMMENT '记录日期'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='饮食记录表';

-- --------------------------------------------------------

--
-- 表的结构 `doctor_info`
--

CREATE TABLE `doctor_info` (
  `doc_id` mediumint(8) NOT NULL COMMENT '医生ID',
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
  `doc_time` varchar(16) NOT NULL COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='医生信息表';

--
-- 转存表中的数据 `doctor_info`
--

INSERT INTO `doctor_info` (`doc_id`, `hos_id`, `depa_id`, `doc_name`, `doc_sex`, `doc_img`, `doc_phone`, `doc_password`, `doc_especial`, `doc_introduce`, `doc_address`, `doc_alipay`, `doc_rece`, `doc_hot`, `doc_attention`, `doc_fee`, `doc_time`) VALUES
(1, 55, 2, '王哲', '男', 'doctor/2017-03-22/58d2546b514d2.jpg', '123', '123', '心血管内科', '&lt;p&gt;哈哈啊哈哈哈的境况涉及到卡时间段库拉索建档立卡涉及到拉时间段雷克萨&amp;nbsp;&lt;/p&gt;', '北京 东城区 ', '15768650568', '213123', '5.0', '123', '999', '2017-03-29 19:17'),
(10, 55, 6, '姚桂泰', '男', 'doctor/2017-03-22/58d227278e625.jpg', '15768651577', '', '鼻炎、皮肤病', '&lt;p&gt;1111&lt;/p&gt;', '广东 惠州 惠城区', '15768650568', '', '111', NULL, '-100', '2017-03-22 15:26'),
(20, 55, 6, '黄辉煌', '男', 'doctor/2017-03-22/58d24a1c0d8f2.jpg', '15768650568', '', '时间段开始', '&lt;p&gt;啊实打实大所大所&lt;/p&gt;', '广东 惠州 惠城区', '15768650568', '', '23', NULL, '200', '2017-03-22 17:55'),
(31, 55, 6, '张洋豪', '男', 'doctor/2017-03-22/58d255fe4298d.jpg', '123456', '123456', 'eq', '', '广东 惠州 惠城区', 'qwe', '', '', NULL, '', '2017-03-23 18:30'),
(32, 54, 10, '叶莉', '女', 'doctor/2017-03-30/58dd11e4b5ae7.jpg', '15768650568', '123456', '鼻炎、皮肤病', '&lt;p&gt;叶莉叶莉叶莉叶莉叶莉叶莉叶莉叶莉叶莉叶莉叶莉叶莉叶莉叶莉叶莉叶莉叶莉叶莉叶莉叶莉叶莉叶莉叶莉叶莉&lt;/p&gt;', '广东 惠州 惠城区', '111', '', '1111', NULL, '200', '2017-03-30 22:10'),
(33, 57, 9, '叶伟发', '男', 'doctor/2017-04-07/58e79d2f23359.jpg', '123456', '123456', '骨科', '', '广东 惠州 惠城区', '123', '', '111', NULL, '123', '2017-04-07 22:11'),
(34, 57, 8, '林庆涛', '男', 'doctor/2017-04-07/58e79df1b0a3f.jpg', '123', '123456', '心肌梗塞', '', '广东 惠州 惠城区', '123', '', '213', NULL, '123', '2017-04-07 22:10'),
(35, 56, 6, '郑文志', '男', 'doctor/2017-04-07/58e7a12fd0ae3.jpg', '123', '123456', '脑外伤、脑出血', '', '广东 惠州 惠城区', '123', '', '113', NULL, '123', '2017-04-07 22:24'),
(36, 56, 13, '李随生', '男', 'doctor/2017-04-07/58e7a1472b042.jpg', '123', '123456', '骨伤', '', '广东 惠州 惠城区', '123', '', '12', NULL, '123', '2017-04-07 22:25'),
(37, 54, 10, '李佳迪', '男', 'doctor/2017-04-07/58e7a17910ba8.jpg', '123456', '123456', '子宫肌瘤', '', '广东 惠州 惠城区', '213', '', '11', NULL, '23', '2017-04-07 22:26'),
(38, 53, 9, '蔡刘聪', '男', 'doctor/2017-04-07/58e7a1c387f7e.jpg', '123', '123456', '神经病', '', '福建 福州 鼓楼区', '123', '', '11', NULL, '123', '2017-04-07 22:27'),
(39, 53, 8, '黄宇红', '男', 'doctor/2017-04-07/58e7a1e532d9e.jpg', '123', '123456', '冠心病', '', '广东 惠州 惠城区', '213', '', '123', NULL, '23', '2017-04-07 22:27');

-- --------------------------------------------------------

--
-- 表的结构 `drug`
--

CREATE TABLE `drug` (
  `drug_id` int(16) NOT NULL COMMENT '用药记录ID',
  `user_id` int(16) NOT NULL COMMENT '用户ID',
  `usedrug_id` int(16) NOT NULL COMMENT '用药人ID',
  `drug_info_id` int(16) NOT NULL COMMENT '药品详情ID',
  `ailmentv` varchar(32) DEFAULT NULL COMMENT '治疗疾病',
  `drug_hos` varchar(32) DEFAULT NULL COMMENT '开药医院',
  `drug_doc` varchar(16) DEFAULT NULL COMMENT '开药医生',
  `time` varchar(16) DEFAULT NULL COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='我的用药信息';

-- --------------------------------------------------------

--
-- 表的结构 `drug_img`
--

CREATE TABLE `drug_img` (
  `drug_img_id` int(16) NOT NULL COMMENT '图片ID',
  `drug_img_name` varchar(16) DEFAULT NULL COMMENT '图片名称',
  `drug_img_path` varchar(16) DEFAULT NULL COMMENT '图片路径',
  `time` varchar(16) DEFAULT NULL COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='药品图片表';

-- --------------------------------------------------------

--
-- 表的结构 `drug_info`
--

CREATE TABLE `drug_info` (
  `drug_info_id` int(16) NOT NULL COMMENT '用药记录ID',
  `drug_name` varchar(16) DEFAULT NULL COMMENT '药品名称',
  `drug_howuse` longtext COMMENT '使用方法',
  `drug_img_id` int(16) DEFAULT NULL COMMENT '图片ID',
  `usedrug_time` varchar(32) DEFAULT NULL COMMENT '用药时间',
  `drug_remind` varchar(8) DEFAULT NULL COMMENT '是否提醒'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='药品信息表';

-- --------------------------------------------------------

--
-- 表的结构 `feedback`
--

CREATE TABLE `feedback` (
  `feedb_id` int(16) NOT NULL COMMENT 'ID',
  `user_id` int(16) NOT NULL COMMENT '用户ID',
  `con_phone` varchar(16) DEFAULT NULL COMMENT '联系电话',
  `feedb_content` longtext COMMENT '反馈内容',
  `feedb_img` varchar(32) DEFAULT NULL COMMENT '反馈图片',
  `feedb_time` varchar(16) DEFAULT NULL COMMENT '反馈时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='意见反馈';

-- --------------------------------------------------------

--
-- 表的结构 `form`
--

CREATE TABLE `form` (
  `form_id` int(16) NOT NULL COMMENT '订单ID',
  `user_id` int(16) NOT NULL COMMENT '用户ID',
  `doc_name` varchar(16) DEFAULT NULL COMMENT '医生姓名',
  `depa_name` varchar(32) DEFAULT NULL COMMENT '科室名字',
  `illness_name` varchar(32) DEFAULT NULL COMMENT '疾病名称',
  `price` varchar(16) DEFAULT NULL COMMENT '价钱',
  `time` varchar(16) DEFAULT NULL COMMENT '下单时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='我的就诊订单';

-- --------------------------------------------------------

--
-- 表的结构 `friend_file`
--

CREATE TABLE `friend_file` (
  `file_id` int(16) NOT NULL COMMENT 'ID',
  `user_id` int(16) NOT NULL COMMENT '用户ID',
  `friend_id` int(16) NOT NULL COMMENT '关联的好友ID',
  `time` varchar(16) DEFAULT NULL COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='关联的亲友档案';

-- --------------------------------------------------------

--
-- 表的结构 `habit`
--

CREATE TABLE `habit` (
  `habit_id` int(16) NOT NULL COMMENT 'ID',
  `user_id` int(16) NOT NULL COMMENT '用户ID',
  `usehab_id` int(16) NOT NULL COMMENT '记录人ID',
  `getup_time` varchar(16) DEFAULT NULL COMMENT '起床时间',
  `sleep_time` varchar(16) DEFAULT NULL COMMENT '睡觉时间',
  `other` varchar(255) DEFAULT NULL COMMENT '其他',
  `time` varchar(16) DEFAULT NULL COMMENT '记录日期'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='个人习惯表';

-- --------------------------------------------------------

--
-- 表的结构 `health_know`
--

CREATE TABLE `health_know` (
  `know_id` mediumint(8) NOT NULL COMMENT '知识ID',
  `know_title` varchar(32) DEFAULT NULL COMMENT '标题',
  `know_see` varchar(32) DEFAULT '0' COMMENT '浏览量',
  `know_content` longtext COMMENT '内容',
  `time` varchar(16) DEFAULT NULL COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='健康知识表';

--
-- 转存表中的数据 `health_know`
--

INSERT INTO `health_know` (`know_id`, `know_title`, `know_see`, `know_content`, `time`) VALUES
(2, '阿斯达所多', NULL, '&lt;p&gt;萨达萨达所大所&lt;/p&gt;', '2017-03-29 20:37'),
(5, '撒打算', '0', '&lt;p&gt;啊实打实大所&lt;/p&gt;', '2017-03-29 21:25');

-- --------------------------------------------------------

--
-- 表的结构 `health_know_img`
--

CREATE TABLE `health_know_img` (
  `id` mediumint(9) NOT NULL,
  `health_know_img` varchar(150) DEFAULT NULL COMMENT '图片路径',
  `know_id` mediumint(9) NOT NULL COMMENT '所属知识ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='健康知识内容图片表';

-- --------------------------------------------------------

--
-- 表的结构 `hospital_info`
--

CREATE TABLE `hospital_info` (
  `hos_id` mediumint(9) NOT NULL COMMENT '医院ID',
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
  `hos_attention` varchar(32) NOT NULL COMMENT '被关注量'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='医院信息';

--
-- 转存表中的数据 `hospital_info`
--

INSERT INTO `hospital_info` (`hos_id`, `hos_name`, `hos_level`, `hos_address`, `hos_address_detail`, `hos_longitude`, `hos_latitude`, `hos_introduce`, `hos_navigate_img`, `hos_hot`, `hos_time`, `hos_link`, `hos_attention`) VALUES
(53, '惠州市华康骨科医院', '二甲', '广东 广州 荔湾区', '广东省惠州市惠城区演达大道46号惠州学院对面', '123', '123', '&lt;p&gt;广东省惠州市惠城区演达大道46号惠州学院对面&lt;/p&gt;', 'Hospital/2017-03-11/58c3b3ea2ec2a.jpg', '324', '2017-03-11 16:23:06', '', ''),
(54, '惠州市中心人民医院', '三甲', '北京 西城区', '广东省惠州市惠城区鹅岭北路', '12', '3', '&lt;p&gt;惠州市中心人民医院坐落于惠民之州——惠州，面积两百余亩，是惠州最大的医院。&lt;/p&gt;', 'Hospital/2017-03-16/58ca5fdd13b44.jpg', '5.0', '2017-03-16 17:50:21', '', ''),
(55, '东华医院', '二乙', '广东 惠州 惠城区', '河南岸南岸路143号', '123', '123', '&lt;p&gt;惠州东华医院位于惠城区河南岸南岸路143号，是一所综合性医院。医院经营面积6000平方米，医院核定床位230张（暂定），全院职工预计215人。&lt;/p&gt;', 'Hospital/2017-03-22/58d200ed5ba8f.jpg', '4.2', '2017-03-22 12:43:25', '', ''),
(56, '博爱医院', '三甲', '广东 惠州 惠城区', '河南岸演达大道46号', '123', '123', '&lt;p&gt;段开始到静安寺肯德基爱神的箭卡死了&lt;/p&gt;', 'Hospital/2017-03-24/58d50391badf2.jpg', '123', '2017-03-24 19:31:29', '', ''),
(57, '惠州市第三人民医院', '二甲', '广东 惠州 惠城区', '东平公园', '123', '321', '&lt;p&gt;惠州市第三人民医院惠州市第三人民医院惠州市第三人民医院惠州市第三人民医院惠州市第三人民医院&lt;/p&gt;', 'Hospital/2017-04-06/58e6132a76fff.jpg', '5.0', '2017-04-06 18:06:34', '', '');

-- --------------------------------------------------------

--
-- 表的结构 `hos_dep`
--

CREATE TABLE `hos_dep` (
  `id` int(11) NOT NULL,
  `dep_id` mediumint(9) NOT NULL COMMENT '科室ID',
  `hos_id` mediumint(9) NOT NULL COMMENT '所属医院',
  `dep_introduce` longtext NOT NULL COMMENT '科室介绍',
  `dep_time` varchar(30) NOT NULL DEFAULT '0' COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='医院-科室关联表';

--
-- 转存表中的数据 `hos_dep`
--

INSERT INTO `hos_dep` (`id`, `dep_id`, `hos_id`, `dep_introduce`, `dep_time`) VALUES
(1, 1, 54, 'sadasd', '12323'),
(2, 1, 53, '213', '213'),
(4, 6, 53, '&lt;p&gt;萨达&lt;/p&gt;', '2017-03-17 19:23:46'),
(5, 7, 53, '&lt;p&gt;萨达&lt;/p&gt;', '2017-03-17 19:23:55'),
(7, 2, 54, '', '2017-03-17 19:26:22'),
(8, 5, 54, '&lt;p&gt;哦哦哦&lt;/p&gt;', '2017-03-21 10:05:32'),
(9, 7, 54, '&lt;p&gt;阿萨德&lt;/p&gt;', '2017-03-21 12:03:58'),
(14, 10, 54, '&lt;p&gt;sad&lt;/p&gt;', '2017-03-21 12:32:41'),
(15, 4, 54, '&lt;p&gt;sad&lt;/p&gt;', '2017-03-21 12:35:42'),
(18, 8, 54, '', '2017-03-21 12:58:19'),
(20, 6, 54, '', '2017-03-21 13:00:04'),
(21, 9, 54, '', '2017-03-21 13:00:36'),
(23, 2, 53, '', '2017-03-21 13:31:49'),
(24, 8, 53, '', '2017-03-21 13:31:54'),
(25, 9, 53, '', '2017-03-21 13:31:59'),
(26, 4, 53, '', '2017-03-21 13:32:17'),
(27, 3, 54, '&lt;p&gt;撒打算&lt;/p&gt;', '2017-03-22 11:26:48'),
(28, 1, 55, '', '2017-03-22 12:44:32'),
(29, 2, 55, '', '2017-03-22 12:44:37'),
(30, 3, 55, '', '2017-03-22 12:44:41'),
(31, 4, 55, '', '2017-03-22 12:44:46'),
(32, 5, 55, '', '2017-03-22 12:44:51'),
(33, 6, 55, '', '2017-03-22 14:34:35'),
(34, 7, 57, '', '2017-04-07 22:09:52'),
(35, 6, 57, '&lt;p&gt;萨达&lt;br/&gt;&lt;/p&gt;', '2017-04-07 22:09:41'),
(36, 1, 57, '', '2017-04-07 22:09:46'),
(37, 2, 57, '', '2017-04-07 22:10:01'),
(38, 8, 57, '', '2017-04-07 22:10:07'),
(39, 9, 57, '', '2017-04-07 22:10:12'),
(40, 1, 56, '', '2017-04-07 22:22:56'),
(41, 2, 56, '', '2017-04-07 22:23:04'),
(42, 3, 56, '', '2017-04-07 22:23:11'),
(43, 4, 56, '', '2017-04-07 22:23:15'),
(44, 5, 56, '', '2017-04-07 22:23:21'),
(45, 6, 56, '', '2017-04-07 22:23:26'),
(46, 7, 56, '', '2017-04-07 22:23:30'),
(47, 8, 56, '', '2017-04-07 22:23:35'),
(48, 13, 56, '', '2017-04-07 22:23:40'),
(49, 12, 56, '', '2017-04-07 22:23:45'),
(50, 14, 56, '', '2017-04-07 22:23:49'),
(51, 10, 56, '', '2017-04-07 22:23:53'),
(52, 15, 56, '', '2017-04-07 22:23:58'),
(53, 12, 53, '', '2017-04-07 22:26:19');

-- --------------------------------------------------------

--
-- 表的结构 `hos_img`
--

CREATE TABLE `hos_img` (
  `id` mediumint(9) NOT NULL COMMENT 'ID',
  `hos_img` varchar(150) DEFAULT NULL COMMENT '医院图片',
  `hos_mid_img` varchar(150) DEFAULT NULL COMMENT '中图',
  `hos_sm_img` varchar(150) DEFAULT NULL COMMENT '小图',
  `hos_id` mediumint(9) NOT NULL COMMENT '医院ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='医院图片';

--
-- 转存表中的数据 `hos_img`
--

INSERT INTO `hos_img` (`id`, `hos_img`, `hos_mid_img`, `hos_sm_img`, `hos_id`) VALUES
(26, 'Hospital/2017-03-11/58c3b3ea43621.jpg', 'Hospital/2017-03-11/thumb_0_58c3b3ea43621.jpg', 'Hospital/2017-03-11/thumb_1_58c3b3ea43621.jpg', 53),
(27, 'Hospital/2017-03-11/58c3b3ea8381b.jpg', 'Hospital/2017-03-11/thumb_0_58c3b3ea8381b.jpg', 'Hospital/2017-03-11/thumb_1_58c3b3ea8381b.jpg', 53),
(28, 'Hospital/2017-03-16/58ca5fdd343c8.jpg', 'Hospital/2017-03-16/thumb_0_58ca5fdd343c8.jpg', 'Hospital/2017-03-16/thumb_1_58ca5fdd343c8.jpg', 54),
(29, 'Hospital/2017-03-16/58ca5fddba4ed.jpg', 'Hospital/2017-03-16/thumb_0_58ca5fddba4ed.jpg', 'Hospital/2017-03-16/thumb_1_58ca5fddba4ed.jpg', 54),
(30, 'Hospital/2017-03-22/58d200ed82a1e.jpg', 'Hospital/2017-03-22/thumb_0_58d200ed82a1e.jpg', 'Hospital/2017-03-22/thumb_1_58d200ed82a1e.jpg', 55),
(31, 'Hospital/2017-03-22/58d200ee440f8.jpg', 'Hospital/2017-03-22/thumb_0_58d200ee440f8.jpg', 'Hospital/2017-03-22/thumb_1_58d200ee440f8.jpg', 55),
(33, 'Hospital/2017-04-06/58e6132bac41b.jpg', 'Hospital/2017-04-06/thumb_0_58e6132bac41b.jpg', 'Hospital/2017-04-06/thumb_1_58e6132bac41b.jpg', 57),
(34, 'Hospital/2017-04-06/58e6132bccd94.jpg', 'Hospital/2017-04-06/thumb_0_58e6132bccd94.jpg', 'Hospital/2017-04-06/thumb_1_58e6132bccd94.jpg', 57),
(35, 'Hospital/2017-04-06/58e61f437aefd.jpg', 'Hospital/2017-04-06/thumb_0_58e61f437aefd.jpg', 'Hospital/2017-04-06/thumb_1_58e61f437aefd.jpg', 57),
(36, 'Hospital/2017-04-06/58e629275b695.jpg', 'Hospital/2017-04-06/thumb_0_58e629275b695.jpg', 'Hospital/2017-04-06/thumb_1_58e629275b695.jpg', 57),
(37, 'Hospital/2017-04-06/58e62991f115e.jpg', 'Hospital/2017-04-06/thumb_0_58e62991f115e.jpg', 'Hospital/2017-04-06/thumb_1_58e62991f115e.jpg', 57),
(38, 'Hospital/2017-04-06/58e62b18350bd.jpg', 'Hospital/2017-04-06/thumb_0_58e62b18350bd.jpg', 'Hospital/2017-04-06/thumb_1_58e62b18350bd.jpg', 55);

-- --------------------------------------------------------

--
-- 表的结构 `illness`
--

CREATE TABLE `illness` (
  `illness_id` mediumint(8) NOT NULL COMMENT '疾病ID',
  `one_depa_id` mediumint(8) NOT NULL COMMENT '一级科室ID',
  `two_depa_id` mediumint(8) NOT NULL COMMENT '二级科室ID',
  `illness_name` varchar(32) NOT NULL COMMENT '疾病名称',
  `illness_introduce` longtext COMMENT '疾病介绍'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='疾病表';

--
-- 转存表中的数据 `illness`
--

INSERT INTO `illness` (`illness_id`, `one_depa_id`, `two_depa_id`, `illness_name`, `illness_introduce`) VALUES
(1, 1, 6, '脑外伤', '&lt;p&gt;脑外伤脑外伤脑外伤&lt;/p&gt;'),
(2, 1, 11, '骨折', '&lt;p&gt;骨折骨折&lt;/p&gt;'),
(4, 0, 8, '冠心病', '&lt;p&gt;冠心病冠心病冠心病冠心病&lt;/p&gt;'),
(5, 0, 9, '脑梗塞', '&lt;p&gt;脑梗塞脑梗塞脑梗塞&lt;/p&gt;'),
(6, 0, 12, '小儿感冒', '&lt;p&gt;小儿感冒小儿感冒小儿感冒&lt;/p&gt;'),
(7, 0, 10, '月经失调', '&lt;p&gt;月经失调月经失调月经失调月经失调&lt;/p&gt;'),
(8, 0, 7, '风湿性心脏病', '&lt;p&gt;风湿性心脏病风湿性心脏病风湿性心脏病&lt;/p&gt;'),
(9, 0, 6, '脑出血', '&lt;p&gt;脑出血脑出血脑出血&lt;/p&gt;'),
(10, 0, 13, '腰椎间盘突出', '&lt;p&gt;腰椎间盘突出腰椎间盘突出&lt;/p&gt;'),
(11, 0, 14, '新生儿黄疸', '&lt;p&gt;新生儿黄疸新生儿黄疸新生儿黄疸&lt;/p&gt;'),
(12, 0, 15, '妊娠合并症', '&lt;p&gt;妊娠合并症妊娠合并症&lt;/p&gt;');

-- --------------------------------------------------------

--
-- 表的结构 `inquiry`
--

CREATE TABLE `inquiry` (
  `inqu_id` int(16) NOT NULL COMMENT '记录ID',
  `user_id` int(16) NOT NULL COMMENT '用户ID',
  `inqu_peo_id` int(16) NOT NULL COMMENT '问诊人ID',
  `inqu_info` longtext COMMENT '问诊信息',
  `inqu_img_id` int(16) DEFAULT NULL COMMENT '图片ID',
  `inqu_time` varchar(16) DEFAULT NULL COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='问诊信息表';

-- --------------------------------------------------------

--
-- 表的结构 `inqu_img`
--

CREATE TABLE `inqu_img` (
  `inqu_img_id` int(16) NOT NULL COMMENT '图片ID',
  `inqu_img_name` varchar(32) DEFAULT NULL COMMENT '图片名字',
  `inqu_img_path` varchar(32) DEFAULT NULL COMMENT '图片路径',
  `inqu_img_time` varchar(16) DEFAULT NULL COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='问诊图片';

-- --------------------------------------------------------

--
-- 表的结构 `manager`
--

CREATE TABLE `manager` (
  `mg_id` mediumint(8) NOT NULL COMMENT '管理员ID',
  `mg_admin` varchar(16) NOT NULL COMMENT '管理员账号',
  `mg_password` varchar(128) NOT NULL COMMENT '管理员密码',
  `mg_name` varchar(32) NOT NULL COMMENT '管理员姓名',
  `mg_role_id` mediumint(8) NOT NULL COMMENT '角色ID',
  `mg_time` varchar(16) NOT NULL COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='后台管理员信息表';

-- --------------------------------------------------------

--
-- 表的结构 `message_push`
--

CREATE TABLE `message_push` (
  `push_id` mediumint(8) NOT NULL COMMENT '推送ID',
  `push_title` varchar(32) DEFAULT NULL COMMENT '标题',
  `push_img` varchar(64) DEFAULT NULL COMMENT '图片',
  `push_see` varchar(32) DEFAULT NULL COMMENT '浏览量',
  `push_content` longtext COMMENT '内容',
  `create_time` varchar(16) DEFAULT NULL COMMENT '时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='消息推送';

-- --------------------------------------------------------

--
-- 表的结构 `my_doc`
--

CREATE TABLE `my_doc` (
  `user_id` int(16) NOT NULL COMMENT '用户ID',
  `doc_ids` int(16) DEFAULT NULL COMMENT '关注的医生ID',
  `my_doc_time` varchar(16) DEFAULT NULL COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='我的医生';

-- --------------------------------------------------------

--
-- 表的结构 `news`
--

CREATE TABLE `news` (
  `news_id` mediumint(8) NOT NULL COMMENT '新闻ID',
  `news_title` varchar(32) DEFAULT NULL COMMENT '标题',
  `news_see` varchar(32) DEFAULT NULL COMMENT '浏览量',
  `news_content` longtext COMMENT '内容',
  `time` varchar(16) DEFAULT NULL COMMENT '时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='新闻表';

-- --------------------------------------------------------

--
-- 表的结构 `news_img`
--

CREATE TABLE `news_img` (
  `news_img_id` mediumint(8) NOT NULL COMMENT '图片ID',
  `news_img_name` varchar(32) DEFAULT NULL COMMENT '图片名称',
  `news_img_path` varchar(32) DEFAULT NULL COMMENT '图片路径',
  `create_time` varchar(16) DEFAULT NULL COMMENT '创建时间',
  `news_id` mediumint(8) NOT NULL COMMENT '新闻ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='新闻图片表';

-- --------------------------------------------------------

--
-- 表的结构 `page_img`
--

CREATE TABLE `page_img` (
  `page_img_id` int(16) NOT NULL COMMENT '图片ID',
  `page_img_name` varchar(32) DEFAULT NULL COMMENT '图片名字',
  `page_img_path` varchar(32) DEFAULT NULL COMMENT '图片路径',
  `time` varchar(16) DEFAULT NULL COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='处方图片表';

-- --------------------------------------------------------

--
-- 表的结构 `push_img`
--

CREATE TABLE `push_img` (
  `push_img_id` mediumint(8) NOT NULL COMMENT '图片ID',
  `push_img_path` varchar(64) DEFAULT NULL COMMENT '图片路径',
  `push_img_name` varchar(32) DEFAULT NULL COMMENT '图片名字',
  `time` varchar(16) DEFAULT NULL COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='消息推送图片表';

-- --------------------------------------------------------

--
-- 表的结构 `role`
--

CREATE TABLE `role` (
  `role_id` mediumint(8) NOT NULL COMMENT '角色ID',
  `role_name` varchar(32) NOT NULL COMMENT '角色名称',
  `role_auth_ac` varchar(255) NOT NULL COMMENT '模块操作',
  `role_auth_ids` varchar(255) NOT NULL COMMENT '权限ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='后台管理员角色表';

-- --------------------------------------------------------

--
-- 表的结构 `see_doc_case`
--

CREATE TABLE `see_doc_case` (
  `seecase_id` int(16) NOT NULL COMMENT 'ID',
  `user_id` int(16) NOT NULL COMMENT '用户人ID',
  `useseedoc_id` int(16) NOT NULL COMMENT '记录人ID',
  `seecase_hos` varchar(32) DEFAULT NULL COMMENT '就诊医院',
  `seecase_depa` varchar(32) DEFAULT NULL COMMENT '就诊科室',
  `seecase_doc` varchar(32) DEFAULT NULL COMMENT '就诊医生',
  `seecase_info` longtext COMMENT '诊断',
  `seecase_sgs` longtext COMMENT '医生建议',
  `page_info` longtext COMMENT '处方信息',
  `page_img_id` varchar(16) DEFAULT NULL COMMENT '处方图片ID',
  `check_info` longtext COMMENT '检查信息',
  `check_img_id` varchar(16) DEFAULT NULL COMMENT '检查图片ID',
  `seecase_time` varchar(16) DEFAULT NULL COMMENT '就诊时间',
  `time` varchar(16) DEFAULT NULL COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='医院就诊记录';

-- --------------------------------------------------------

--
-- 表的结构 `slider`
--

CREATE TABLE `slider` (
  `slider_id` mediumint(8) NOT NULL COMMENT '图片ID',
  `slider_path` varchar(128) DEFAULT NULL COMMENT '图片路径',
  `slider_name` varchar(64) DEFAULT NULL COMMENT '图片名字',
  `slider_time` varchar(16) DEFAULT NULL COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='轮播图';

-- --------------------------------------------------------

--
-- 表的结构 `standard`
--

CREATE TABLE `standard` (
  `stan_id` int(16) NOT NULL COMMENT 'ID',
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
  `time` varchar(16) DEFAULT NULL COMMENT '记录日期'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='健康指标表';

-- --------------------------------------------------------

--
-- 表的结构 `talk`
--

CREATE TABLE `talk` (
  `talk_id` int(16) NOT NULL COMMENT 'ID',
  `sender_id` int(16) NOT NULL COMMENT '发送者ID',
  `receiver_id` int(16) NOT NULL COMMENT '接收者ID',
  `content` longtext COMMENT '内容',
  `talk_img_id` int(16) DEFAULT NULL COMMENT '图片ID',
  `talk_pic` varchar(32) DEFAULT NULL COMMENT '表情',
  `read` varchar(16) DEFAULT NULL COMMENT '是否已读',
  `time` varchar(16) DEFAULT NULL COMMENT '时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='聊天记录表';

-- --------------------------------------------------------

--
-- 表的结构 `talk_img`
--

CREATE TABLE `talk_img` (
  `talk_img_id` int(16) NOT NULL COMMENT '图片ID',
  `talk_img_path` varchar(32) DEFAULT NULL COMMENT '图片路径',
  `time` varchar(16) DEFAULT NULL COMMENT '时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='聊天图片表';

-- --------------------------------------------------------

--
-- 表的结构 `user_add`
--

CREATE TABLE `user_add` (
  `user_add_id` int(16) NOT NULL COMMENT '被添加者ID',
  `user_id` int(16) NOT NULL COMMENT '用户ID',
  `uadd_name` varchar(16) NOT NULL COMMENT '姓名',
  `uadd_sex` enum('女','男') DEFAULT '男' COMMENT '性别',
  `uadd_age` mediumint(8) DEFAULT NULL COMMENT '年龄',
  `uadd_city` varchar(32) DEFAULT NULL COMMENT '居住地',
  `uadd_phone` varchar(16) DEFAULT NULL COMMENT '电话',
  `uadd_rela` varchar(16) DEFAULT NULL COMMENT '与用户的关系',
  `inqu_id` int(16) DEFAULT NULL COMMENT '我的问诊',
  `drug_id` int(16) DEFAULT NULL COMMENT '我的用药',
  `stan_id` int(16) DEFAULT NULL COMMENT '我的健康指标',
  `diet_id` int(16) DEFAULT NULL COMMENT '我的饮食',
  `habit_id` int(16) DEFAULT NULL COMMENT '我的习惯',
  `seecase_id` int(16) DEFAULT NULL COMMENT '就诊记录',
  `time` varchar(16) DEFAULT NULL COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='账户所有者添加的患者';

-- --------------------------------------------------------

--
-- 表的结构 `user_info`
--

CREATE TABLE `user_info` (
  `user_id` mediumint(16) NOT NULL COMMENT '用户ID',
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
  `user_time` varchar(16) NOT NULL COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户信息表';

--
-- 转存表中的数据 `user_info`
--

INSERT INTO `user_info` (`user_id`, `user_name`, `user_nickname`, `user_age`, `user_phone`, `user_password`, `user_img`, `user_sex`, `user_city`, `user_date`, `papers_type`, `papers_num`, `nation`, `profession`, `education`, `marriage`, `user_qq`, `user_weixin`, `user_time`) VALUES
(1, '张洋豪', '张洋豪', 22, '15768650568', '123456', 'User/2017-03-25/58d5ec271fc8c.jpg', '男', '黑龙江 鸡西 鸡冠区', '07/13/1995', '身份证', '441622199411067918', '汉', '学生', '本科', '未婚', '3777623205', '15768650568', '2017-03-25 12:41'),
(2, '王哲', '王哲', 12, '15768650568', '123456', 'User/2017-03-25/58d5ec6a6c634.jpg', '男', '天津 和平区 ', '11/09/1994', '身份证', '441622199411067918', '汉', '学生', '本科', '未婚', '3777623205', '15768650568', '2017-03-25 12:47'),
(3, '黄辉煌', '黄辉煌', 22, '110', '110', 'User/2017-03-25/58d5ebe31bf28.jpg', '女', '广东 惠州 惠城区', '123', '学生证', '123', '123', '学生仔', '本科', '未婚', '123', '213', '2017-03-25 12:02'),
(4, '姚桂泰', '姚桂泰', 28, '120', '1210', 'User/2017-03-25/58d5ec5f3534f.jpg', '男', '广东 惠州 惠城区', '1996-11-05', '身份证', '45456', '汉族', '学生', '硕士', '未婚', '562356610', '562356610', '2017-03-25 12:04'),
(5, '何家朗', '肥仔哥哥', 22, '15768652840', '123456', 'User/2017-03-29/58db96bbf04bf.jpg', '男', '广东 广州 增城市', '06/06/1995', '身份证', '44162215564798888', '回族', '营养师', '本科', '未婚', '123456', '12346', '2017-03-29 19:13');

-- --------------------------------------------------------

--
-- 表的结构 `user_login`
--

CREATE TABLE `user_login` (
  `user_id` int(16) NOT NULL COMMENT '用户ID',
  `user_phone` varchar(16) NOT NULL COMMENT '用户手机',
  `user_password` varchar(128) NOT NULL COMMENT '用户密码',
  `login_time` varchar(16) NOT NULL COMMENT '登录时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户登录验证表';

-- --------------------------------------------------------

--
-- 表的结构 `user_relation`
--

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
  `file_id` int(16) DEFAULT NULL COMMENT '亲友档案'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户关联表';

--
-- Indexes for dumped tables
--

--
-- Indexes for table `about`
--
ALTER TABLE `about`
  ADD PRIMARY KEY (`about_id`);

--
-- Indexes for table `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`account_id`);

--
-- Indexes for table `analyze`
--
ALTER TABLE `analyze`
  ADD PRIMARY KEY (`analyze_id`);

--
-- Indexes for table `attention`
--
ALTER TABLE `attention`
  ADD PRIMARY KEY (`atten_id`);

--
-- Indexes for table `auth`
--
ALTER TABLE `auth`
  ADD PRIMARY KEY (`auth_id`);

--
-- Indexes for table `check_img`
--
ALTER TABLE `check_img`
  ADD PRIMARY KEY (`check_img_id`);

--
-- Indexes for table `department_info`
--
ALTER TABLE `department_info`
  ADD PRIMARY KEY (`dep_id`);

--
-- Indexes for table `depa_illness`
--
ALTER TABLE `depa_illness`
  ADD PRIMARY KEY (`depa_illness_id`);

--
-- Indexes for table `diet`
--
ALTER TABLE `diet`
  ADD PRIMARY KEY (`diet_id`);

--
-- Indexes for table `doctor_info`
--
ALTER TABLE `doctor_info`
  ADD PRIMARY KEY (`doc_id`);

--
-- Indexes for table `drug`
--
ALTER TABLE `drug`
  ADD PRIMARY KEY (`drug_id`);

--
-- Indexes for table `drug_img`
--
ALTER TABLE `drug_img`
  ADD PRIMARY KEY (`drug_img_id`);

--
-- Indexes for table `drug_info`
--
ALTER TABLE `drug_info`
  ADD PRIMARY KEY (`drug_info_id`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`feedb_id`);

--
-- Indexes for table `form`
--
ALTER TABLE `form`
  ADD PRIMARY KEY (`form_id`);

--
-- Indexes for table `friend_file`
--
ALTER TABLE `friend_file`
  ADD PRIMARY KEY (`file_id`);

--
-- Indexes for table `habit`
--
ALTER TABLE `habit`
  ADD PRIMARY KEY (`habit_id`);

--
-- Indexes for table `health_know`
--
ALTER TABLE `health_know`
  ADD PRIMARY KEY (`know_id`);

--
-- Indexes for table `health_know_img`
--
ALTER TABLE `health_know_img`
  ADD PRIMARY KEY (`id`),
  ADD KEY `know_id` (`know_id`);

--
-- Indexes for table `hospital_info`
--
ALTER TABLE `hospital_info`
  ADD PRIMARY KEY (`hos_id`);

--
-- Indexes for table `hos_dep`
--
ALTER TABLE `hos_dep`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hos_id` (`hos_id`),
  ADD KEY `dep_id` (`dep_id`);

--
-- Indexes for table `hos_img`
--
ALTER TABLE `hos_img`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hos_id` (`hos_id`);

--
-- Indexes for table `illness`
--
ALTER TABLE `illness`
  ADD PRIMARY KEY (`illness_id`);

--
-- Indexes for table `inquiry`
--
ALTER TABLE `inquiry`
  ADD PRIMARY KEY (`inqu_id`);

--
-- Indexes for table `inqu_img`
--
ALTER TABLE `inqu_img`
  ADD PRIMARY KEY (`inqu_img_id`);

--
-- Indexes for table `manager`
--
ALTER TABLE `manager`
  ADD PRIMARY KEY (`mg_id`);

--
-- Indexes for table `message_push`
--
ALTER TABLE `message_push`
  ADD PRIMARY KEY (`push_id`);

--
-- Indexes for table `my_doc`
--
ALTER TABLE `my_doc`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`news_id`);

--
-- Indexes for table `news_img`
--
ALTER TABLE `news_img`
  ADD PRIMARY KEY (`news_img_id`);

--
-- Indexes for table `page_img`
--
ALTER TABLE `page_img`
  ADD PRIMARY KEY (`page_img_id`);

--
-- Indexes for table `push_img`
--
ALTER TABLE `push_img`
  ADD PRIMARY KEY (`push_img_id`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`role_id`);

--
-- Indexes for table `see_doc_case`
--
ALTER TABLE `see_doc_case`
  ADD PRIMARY KEY (`seecase_id`);

--
-- Indexes for table `slider`
--
ALTER TABLE `slider`
  ADD PRIMARY KEY (`slider_id`);

--
-- Indexes for table `standard`
--
ALTER TABLE `standard`
  ADD PRIMARY KEY (`stan_id`);

--
-- Indexes for table `talk`
--
ALTER TABLE `talk`
  ADD PRIMARY KEY (`talk_id`);

--
-- Indexes for table `talk_img`
--
ALTER TABLE `talk_img`
  ADD PRIMARY KEY (`talk_img_id`);

--
-- Indexes for table `user_add`
--
ALTER TABLE `user_add`
  ADD PRIMARY KEY (`user_add_id`);

--
-- Indexes for table `user_info`
--
ALTER TABLE `user_info`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `user_login`
--
ALTER TABLE `user_login`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `user_relation`
--
ALTER TABLE `user_relation`
  ADD PRIMARY KEY (`user_id`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `about`
--
ALTER TABLE `about`
  MODIFY `about_id` mediumint(8) NOT NULL AUTO_INCREMENT COMMENT 'ID';
--
-- 使用表AUTO_INCREMENT `account`
--
ALTER TABLE `account`
  MODIFY `account_id` int(16) NOT NULL AUTO_INCREMENT COMMENT '记录ID';
--
-- 使用表AUTO_INCREMENT `analyze`
--
ALTER TABLE `analyze`
  MODIFY `analyze_id` mediumint(8) NOT NULL AUTO_INCREMENT COMMENT 'ID';
--
-- 使用表AUTO_INCREMENT `attention`
--
ALTER TABLE `attention`
  MODIFY `atten_id` int(16) NOT NULL AUTO_INCREMENT COMMENT '记录ID';
--
-- 使用表AUTO_INCREMENT `auth`
--
ALTER TABLE `auth`
  MODIFY `auth_id` mediumint(8) NOT NULL AUTO_INCREMENT COMMENT '权限ID';
--
-- 使用表AUTO_INCREMENT `check_img`
--
ALTER TABLE `check_img`
  MODIFY `check_img_id` int(16) NOT NULL AUTO_INCREMENT COMMENT '图片ID';
--
-- 使用表AUTO_INCREMENT `department_info`
--
ALTER TABLE `department_info`
  MODIFY `dep_id` mediumint(9) NOT NULL AUTO_INCREMENT COMMENT '科室ID', AUTO_INCREMENT=16;
--
-- 使用表AUTO_INCREMENT `depa_illness`
--
ALTER TABLE `depa_illness`
  MODIFY `depa_illness_id` mediumint(8) NOT NULL AUTO_INCREMENT COMMENT '关联ID';
--
-- 使用表AUTO_INCREMENT `diet`
--
ALTER TABLE `diet`
  MODIFY `diet_id` int(16) NOT NULL AUTO_INCREMENT COMMENT 'ID';
--
-- 使用表AUTO_INCREMENT `doctor_info`
--
ALTER TABLE `doctor_info`
  MODIFY `doc_id` mediumint(8) NOT NULL AUTO_INCREMENT COMMENT '医生ID', AUTO_INCREMENT=40;
--
-- 使用表AUTO_INCREMENT `drug`
--
ALTER TABLE `drug`
  MODIFY `drug_id` int(16) NOT NULL AUTO_INCREMENT COMMENT '用药记录ID';
--
-- 使用表AUTO_INCREMENT `drug_img`
--
ALTER TABLE `drug_img`
  MODIFY `drug_img_id` int(16) NOT NULL AUTO_INCREMENT COMMENT '图片ID';
--
-- 使用表AUTO_INCREMENT `drug_info`
--
ALTER TABLE `drug_info`
  MODIFY `drug_info_id` int(16) NOT NULL AUTO_INCREMENT COMMENT '用药记录ID';
--
-- 使用表AUTO_INCREMENT `feedback`
--
ALTER TABLE `feedback`
  MODIFY `feedb_id` int(16) NOT NULL AUTO_INCREMENT COMMENT 'ID';
--
-- 使用表AUTO_INCREMENT `form`
--
ALTER TABLE `form`
  MODIFY `form_id` int(16) NOT NULL AUTO_INCREMENT COMMENT '订单ID';
--
-- 使用表AUTO_INCREMENT `friend_file`
--
ALTER TABLE `friend_file`
  MODIFY `file_id` int(16) NOT NULL AUTO_INCREMENT COMMENT 'ID';
--
-- 使用表AUTO_INCREMENT `habit`
--
ALTER TABLE `habit`
  MODIFY `habit_id` int(16) NOT NULL AUTO_INCREMENT COMMENT 'ID';
--
-- 使用表AUTO_INCREMENT `health_know`
--
ALTER TABLE `health_know`
  MODIFY `know_id` mediumint(8) NOT NULL AUTO_INCREMENT COMMENT '知识ID', AUTO_INCREMENT=6;
--
-- 使用表AUTO_INCREMENT `health_know_img`
--
ALTER TABLE `health_know_img`
  MODIFY `id` mediumint(9) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `hospital_info`
--
ALTER TABLE `hospital_info`
  MODIFY `hos_id` mediumint(9) NOT NULL AUTO_INCREMENT COMMENT '医院ID', AUTO_INCREMENT=58;
--
-- 使用表AUTO_INCREMENT `hos_dep`
--
ALTER TABLE `hos_dep`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;
--
-- 使用表AUTO_INCREMENT `hos_img`
--
ALTER TABLE `hos_img`
  MODIFY `id` mediumint(9) NOT NULL AUTO_INCREMENT COMMENT 'ID', AUTO_INCREMENT=39;
--
-- 使用表AUTO_INCREMENT `illness`
--
ALTER TABLE `illness`
  MODIFY `illness_id` mediumint(8) NOT NULL AUTO_INCREMENT COMMENT '疾病ID', AUTO_INCREMENT=13;
--
-- 使用表AUTO_INCREMENT `inquiry`
--
ALTER TABLE `inquiry`
  MODIFY `inqu_id` int(16) NOT NULL AUTO_INCREMENT COMMENT '记录ID';
--
-- 使用表AUTO_INCREMENT `inqu_img`
--
ALTER TABLE `inqu_img`
  MODIFY `inqu_img_id` int(16) NOT NULL AUTO_INCREMENT COMMENT '图片ID';
--
-- 使用表AUTO_INCREMENT `manager`
--
ALTER TABLE `manager`
  MODIFY `mg_id` mediumint(8) NOT NULL AUTO_INCREMENT COMMENT '管理员ID';
--
-- 使用表AUTO_INCREMENT `message_push`
--
ALTER TABLE `message_push`
  MODIFY `push_id` mediumint(8) NOT NULL AUTO_INCREMENT COMMENT '推送ID';
--
-- 使用表AUTO_INCREMENT `news`
--
ALTER TABLE `news`
  MODIFY `news_id` mediumint(8) NOT NULL AUTO_INCREMENT COMMENT '新闻ID';
--
-- 使用表AUTO_INCREMENT `news_img`
--
ALTER TABLE `news_img`
  MODIFY `news_img_id` mediumint(8) NOT NULL AUTO_INCREMENT COMMENT '图片ID';
--
-- 使用表AUTO_INCREMENT `page_img`
--
ALTER TABLE `page_img`
  MODIFY `page_img_id` int(16) NOT NULL AUTO_INCREMENT COMMENT '图片ID';
--
-- 使用表AUTO_INCREMENT `push_img`
--
ALTER TABLE `push_img`
  MODIFY `push_img_id` mediumint(8) NOT NULL AUTO_INCREMENT COMMENT '图片ID';
--
-- 使用表AUTO_INCREMENT `role`
--
ALTER TABLE `role`
  MODIFY `role_id` mediumint(8) NOT NULL AUTO_INCREMENT COMMENT '角色ID';
--
-- 使用表AUTO_INCREMENT `see_doc_case`
--
ALTER TABLE `see_doc_case`
  MODIFY `seecase_id` int(16) NOT NULL AUTO_INCREMENT COMMENT 'ID';
--
-- 使用表AUTO_INCREMENT `slider`
--
ALTER TABLE `slider`
  MODIFY `slider_id` mediumint(8) NOT NULL AUTO_INCREMENT COMMENT '图片ID';
--
-- 使用表AUTO_INCREMENT `standard`
--
ALTER TABLE `standard`
  MODIFY `stan_id` int(16) NOT NULL AUTO_INCREMENT COMMENT 'ID';
--
-- 使用表AUTO_INCREMENT `talk`
--
ALTER TABLE `talk`
  MODIFY `talk_id` int(16) NOT NULL AUTO_INCREMENT COMMENT 'ID';
--
-- 使用表AUTO_INCREMENT `talk_img`
--
ALTER TABLE `talk_img`
  MODIFY `talk_img_id` int(16) NOT NULL AUTO_INCREMENT COMMENT '图片ID';
--
-- 使用表AUTO_INCREMENT `user_add`
--
ALTER TABLE `user_add`
  MODIFY `user_add_id` int(16) NOT NULL AUTO_INCREMENT COMMENT '被添加者ID';
--
-- 使用表AUTO_INCREMENT `user_info`
--
ALTER TABLE `user_info`
  MODIFY `user_id` mediumint(16) NOT NULL AUTO_INCREMENT COMMENT '用户ID', AUTO_INCREMENT=6;
--
-- 限制导出的表
--

--
-- 限制表 `health_know_img`
--
ALTER TABLE `health_know_img`
  ADD CONSTRAINT `health_know_img_ibfk_1` FOREIGN KEY (`know_id`) REFERENCES `health_know` (`know_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 限制表 `hos_dep`
--
ALTER TABLE `hos_dep`
  ADD CONSTRAINT `hos_dep_ibfk_1` FOREIGN KEY (`hos_id`) REFERENCES `hospital_info` (`hos_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `hos_dep_ibfk_2` FOREIGN KEY (`dep_id`) REFERENCES `department_info` (`dep_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 限制表 `hos_img`
--
ALTER TABLE `hos_img`
  ADD CONSTRAINT `hos_img_ibfk_1` FOREIGN KEY (`hos_id`) REFERENCES `hospital_info` (`hos_id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
