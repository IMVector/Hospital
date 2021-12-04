/*
Navicat MySQL Data Transfer

Source Server         : MySQL
Source Server Version : 50624
Source Host           : 127.0.0.1:3306
Source Database       : instalhms

Target Server Type    : MYSQL
Target Server Version : 50624
File Encoding         : 65001

Date: 2019-04-26 19:49:20
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for backpack_file
-- ----------------------------
DROP TABLE IF EXISTS `backpack_file`;
CREATE TABLE `backpack_file` (
  `BackpackFileId` int(11) NOT NULL AUTO_INCREMENT,
  `BackpackFilePath` varchar(255) NOT NULL,
  `BackpackTime` datetime NOT NULL,
  PRIMARY KEY (`BackpackFileId`)
) ENGINE=InnoDB AUTO_INCREMENT=127 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of backpack_file
-- ----------------------------
INSERT INTO `backpack_file` VALUES ('39', 'D:\\2019_04_21_10_30_00backpack.sql', '2019-04-21 10:30:00');
INSERT INTO `backpack_file` VALUES ('40', 'D:\\2019_04_21_11_00_00backpack.sql', '2019-04-21 11:00:00');
INSERT INTO `backpack_file` VALUES ('41', 'D:\\2019_04_21_11_30_00backpack.sql', '2019-04-21 11:30:00');
INSERT INTO `backpack_file` VALUES ('42', 'D:\\2019_04_21_12_30_00backpack.sql', '2019-04-21 12:30:00');
INSERT INTO `backpack_file` VALUES ('43', 'D:\\2019_04_21_01_00_00backpack.sql', '2019-04-21 13:00:00');
INSERT INTO `backpack_file` VALUES ('44', 'D:\\2019_04_21_01_30_00backpack.sql', '2019-04-21 13:30:00');
INSERT INTO `backpack_file` VALUES ('45', 'D:\\2019_04_21_02_00_00backpack.sql', '2019-04-21 14:00:00');
INSERT INTO `backpack_file` VALUES ('46', 'D:\\2019_04_21_02_30_00backpack.sql', '2019-04-21 14:30:00');
INSERT INTO `backpack_file` VALUES ('47', 'D:\\2019_04_21_03_00_00backpack.sql', '2019-04-21 15:00:00');
INSERT INTO `backpack_file` VALUES ('48', 'D:\\2019_04_21_03_30_00backpack.sql', '2019-04-21 15:30:00');
INSERT INTO `backpack_file` VALUES ('49', 'D:\\2019_04_21_04_00_00backpack.sql', '2019-04-21 16:00:00');
INSERT INTO `backpack_file` VALUES ('50', 'D:\\2019_04_21_04_30_00backpack.sql', '2019-04-21 16:30:00');
INSERT INTO `backpack_file` VALUES ('51', 'D:\\2019_04_21_05_00_00backpack.sql', '2019-04-21 17:00:00');
INSERT INTO `backpack_file` VALUES ('52', 'D:\\2019_04_21_05_30_00backpack.sql', '2019-04-21 17:30:00');
INSERT INTO `backpack_file` VALUES ('53', 'D:\\2019_04_22_01_00_00backpack.sql', '2019-04-22 13:00:00');
INSERT INTO `backpack_file` VALUES ('54', 'D:\\2019_04_22_01_30_00backpack.sql', '2019-04-22 13:30:00');
INSERT INTO `backpack_file` VALUES ('55', 'D:\\2019_04_22_02_00_00backpack.sql', '2019-04-22 14:00:00');
INSERT INTO `backpack_file` VALUES ('56', 'D:\\2019_04_22_02_30_00backpack.sql', '2019-04-22 14:30:00');
INSERT INTO `backpack_file` VALUES ('57', 'D:\\2019_04_22_03_00_00backpack.sql', '2019-04-22 15:00:00');
INSERT INTO `backpack_file` VALUES ('58', 'D:\\2019_04_22_03_30_00backpack.sql', '2019-04-22 15:30:00');
INSERT INTO `backpack_file` VALUES ('59', 'D:\\2019_04_22_04_30_00backpack.sql', '2019-04-22 16:30:00');
INSERT INTO `backpack_file` VALUES ('60', 'D:\\2019_04_23_05_00_00backpack.sql', '2019-04-23 17:00:00');
INSERT INTO `backpack_file` VALUES ('61', 'D:\\2019_04_23_05_30_00backpack.sql', '2019-04-23 17:30:00');
INSERT INTO `backpack_file` VALUES ('62', 'D:\\2019_04_23_06_00_00backpack.sql', '2019-04-23 18:00:00');
INSERT INTO `backpack_file` VALUES ('63', 'D:\\2019_04_23_06_30_00backpack.sql', '2019-04-23 18:30:00');
INSERT INTO `backpack_file` VALUES ('64', 'D:\\2019_04_23_07_00_00backpack.sql', '2019-04-23 19:00:00');
INSERT INTO `backpack_file` VALUES ('65', 'D:\\2019_04_23_07_30_00backpack.sql', '2019-04-23 19:30:00');
INSERT INTO `backpack_file` VALUES ('66', 'D:\\2019_04_23_08_00_00backpack.sql', '2019-04-23 20:00:00');
INSERT INTO `backpack_file` VALUES ('67', 'D:\\2019_04_23_08_30_00backpack.sql', '2019-04-23 20:30:00');
INSERT INTO `backpack_file` VALUES ('68', 'D:\\2019_04_23_09_00_00backpack.sql', '2019-04-23 21:00:00');
INSERT INTO `backpack_file` VALUES ('69', 'D:\\2019_04_23_09_30_00backpack.sql', '2019-04-23 21:30:00');
INSERT INTO `backpack_file` VALUES ('70', 'D:\\2019_04_23_10_00_00backpack.sql', '2019-04-23 22:00:00');
INSERT INTO `backpack_file` VALUES ('71', 'D:\\2019_04_23_10_30_00backpack.sql', '2019-04-23 22:30:00');
INSERT INTO `backpack_file` VALUES ('72', 'D:\\2019_04_23_11_00_00backpack.sql', '2019-04-23 23:00:00');
INSERT INTO `backpack_file` VALUES ('73', 'D:\\2019_04_23_11_30_00backpack.sql', '2019-04-23 23:30:00');
INSERT INTO `backpack_file` VALUES ('74', 'D:\\2019_04_24_12_00_00backpack.sql', '2019-04-24 00:00:00');
INSERT INTO `backpack_file` VALUES ('75', 'D:\\2019_04_24_04_30_00backpack.sql', '2019-04-24 16:30:00');
INSERT INTO `backpack_file` VALUES ('76', 'D:\\2019_04_24_05_00_00backpack.sql', '2019-04-24 17:00:00');
INSERT INTO `backpack_file` VALUES ('77', 'D:\\2019_04_24_05_30_00backpack.sql', '2019-04-24 17:30:00');
INSERT INTO `backpack_file` VALUES ('78', 'D:\\2019_04_24_06_00_00backpack.sql', '2019-04-24 18:00:00');
INSERT INTO `backpack_file` VALUES ('79', 'D:\\2019_04_24_06_30_00backpack.sql', '2019-04-24 18:30:00');
INSERT INTO `backpack_file` VALUES ('80', 'D:\\2019_04_24_07_00_00backpack.sql', '2019-04-24 19:00:00');
INSERT INTO `backpack_file` VALUES ('81', 'D:\\2019_04_24_07_30_00backpack.sql', '2019-04-24 19:30:00');
INSERT INTO `backpack_file` VALUES ('82', 'D:\\2019_04_24_08_00_00backpack.sql', '2019-04-24 20:00:00');
INSERT INTO `backpack_file` VALUES ('83', 'D:\\2019_04_24_08_30_00backpack.sql', '2019-04-24 20:30:00');
INSERT INTO `backpack_file` VALUES ('84', 'D:\\2019_04_24_09_00_00backpack.sql', '2019-04-24 21:00:00');
INSERT INTO `backpack_file` VALUES ('85', 'D:\\2019_04_24_09_30_00backpack.sql', '2019-04-24 21:30:00');
INSERT INTO `backpack_file` VALUES ('86', 'D:\\2019_04_24_10_00_00backpack.sql', '2019-04-24 22:00:00');
INSERT INTO `backpack_file` VALUES ('87', 'D:\\2019_04_24_10_30_00backpack.sql', '2019-04-24 22:30:00');
INSERT INTO `backpack_file` VALUES ('88', 'D:\\2019_04_25_01_30_00backpack.sql', '2019-04-25 13:30:00');
INSERT INTO `backpack_file` VALUES ('89', 'D:\\2019_04_25_02_00_00backpack.sql', '2019-04-25 14:00:00');
INSERT INTO `backpack_file` VALUES ('90', 'D:\\2019_04_25_02_30_00backpack.sql', '2019-04-25 14:30:00');
INSERT INTO `backpack_file` VALUES ('91', 'D:\\2019_04_25_03_00_00backpack.sql', '2019-04-25 15:00:00');
INSERT INTO `backpack_file` VALUES ('92', 'D:\\2019_04_25_03_30_00backpack.sql', '2019-04-25 15:30:00');
INSERT INTO `backpack_file` VALUES ('93', 'D:\\2019_04_25_04_00_00backpack.sql', '2019-04-25 16:00:00');
INSERT INTO `backpack_file` VALUES ('94', 'D:\\2019_04_25_04_30_00backpack.sql', '2019-04-25 16:30:00');
INSERT INTO `backpack_file` VALUES ('95', 'D:\\2019_04_25_05_00_00backpack.sql', '2019-04-25 17:00:00');
INSERT INTO `backpack_file` VALUES ('96', 'D:\\2019_04_25_05_30_00backpack.sql', '2019-04-25 17:30:00');
INSERT INTO `backpack_file` VALUES ('97', 'D:\\2019_04_25_06_00_00backpack.sql', '2019-04-25 18:00:00');
INSERT INTO `backpack_file` VALUES ('98', 'D:\\2019_04_25_06_30_00backpack.sql', '2019-04-25 18:30:00');
INSERT INTO `backpack_file` VALUES ('99', 'D:\\2019_04_25_07_00_00backpack.sql', '2019-04-25 19:00:00');
INSERT INTO `backpack_file` VALUES ('100', 'D:\\2019_04_25_07_30_00backpack.sql', '2019-04-25 19:30:00');
INSERT INTO `backpack_file` VALUES ('101', 'D:\\2019_04_25_08_00_00backpack.sql', '2019-04-25 20:00:00');
INSERT INTO `backpack_file` VALUES ('102', 'D:\\2019_04_25_08_30_00backpack.sql', '2019-04-25 20:30:00');
INSERT INTO `backpack_file` VALUES ('103', 'D:\\2019_04_25_09_00_00backpack.sql', '2019-04-25 21:00:00');
INSERT INTO `backpack_file` VALUES ('104', 'D:\\2019_04_25_10_00_00backpack.sql', '2019-04-25 22:00:00');
INSERT INTO `backpack_file` VALUES ('105', 'D:\\2019_04_25_10_30_00backpack.sql', '2019-04-25 22:30:00');
INSERT INTO `backpack_file` VALUES ('106', 'D:\\2019_04_25_11_00_00backpack.sql', '2019-04-25 23:00:00');
INSERT INTO `backpack_file` VALUES ('107', 'D:\\2019_04_26_10_00_00backpack.sql', '2019-04-26 10:00:00');
INSERT INTO `backpack_file` VALUES ('108', 'D:\\2019_04_26_10_30_00backpack.sql', '2019-04-26 10:30:00');
INSERT INTO `backpack_file` VALUES ('109', 'D:\\2019_04_26_11_00_00backpack.sql', '2019-04-26 11:00:00');
INSERT INTO `backpack_file` VALUES ('110', 'D:\\2019_04_26_11_30_00backpack.sql', '2019-04-26 11:30:00');
INSERT INTO `backpack_file` VALUES ('111', 'D:\\2019_04_26_12_00_00backpack.sql', '2019-04-26 12:00:00');
INSERT INTO `backpack_file` VALUES ('112', 'D:\\2019_04_26_12_30_00backpack.sql', '2019-04-26 12:30:00');
INSERT INTO `backpack_file` VALUES ('113', 'D:\\2019_04_26_01_00_00backpack.sql', '2019-04-26 13:00:00');
INSERT INTO `backpack_file` VALUES ('114', 'D:\\2019_04_26_01_30_00backpack.sql', '2019-04-26 13:30:00');
INSERT INTO `backpack_file` VALUES ('115', 'D:\\2019_04_26_02_00_00backpack.sql', '2019-04-26 14:00:00');
INSERT INTO `backpack_file` VALUES ('116', 'D:\\2019_04_26_02_30_00backpack.sql', '2019-04-26 14:30:00');
INSERT INTO `backpack_file` VALUES ('117', 'D:\\2019_04_26_03_00_00backpack.sql', '2019-04-26 15:00:00');
INSERT INTO `backpack_file` VALUES ('118', 'D:\\2019_04_26_03_30_00backpack.sql', '2019-04-26 15:30:00');
INSERT INTO `backpack_file` VALUES ('119', 'D:\\2019_04_26_04_00_00backpack.sql', '2019-04-26 16:00:00');
INSERT INTO `backpack_file` VALUES ('120', 'D:\\2019_04_26_04_30_00backpack.sql', '2019-04-26 16:30:00');
INSERT INTO `backpack_file` VALUES ('121', 'D:\\2019_04_26_05_00_00backpack.sql', '2019-04-26 17:00:00');
INSERT INTO `backpack_file` VALUES ('122', 'D:\\2019_04_26_05_30_00backpack.sql', '2019-04-26 17:30:00');
INSERT INTO `backpack_file` VALUES ('123', 'D:\\2019_04_26_06_00_00backpack.sql', '2019-04-26 18:00:00');
INSERT INTO `backpack_file` VALUES ('124', 'D:\\2019_04_26_06_30_00backpack.sql', '2019-04-26 18:30:00');
INSERT INTO `backpack_file` VALUES ('125', 'D:\\2019_04_26_07_00_00backpack.sql', '2019-04-26 19:00:00');
INSERT INTO `backpack_file` VALUES ('126', 'D:\\2019_04_26_07_30_00backpack.sql', '2019-04-26 19:30:00');

-- ----------------------------
-- Table structure for backpack_setting
-- ----------------------------
DROP TABLE IF EXISTS `backpack_setting`;
CREATE TABLE `backpack_setting` (
  `BackpackSettingId` int(11) NOT NULL AUTO_INCREMENT,
  `EnvironmentPath` varchar(255) NOT NULL,
  `BackpackToPath` varchar(255) NOT NULL,
  PRIMARY KEY (`BackpackSettingId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of backpack_setting
-- ----------------------------
INSERT INTO `backpack_setting` VALUES ('1', 'C:\\\\mysql\\\\bin\\\\', 'D:\\\\');

-- ----------------------------
-- Table structure for bill
-- ----------------------------
DROP TABLE IF EXISTS `bill`;
CREATE TABLE `bill` (
  `BillId` int(11) NOT NULL AUTO_INCREMENT,
  `PaymentStatus` varchar(2) NOT NULL,
  `PatientId` int(11) NOT NULL,
  `BillDate` datetime NOT NULL,
  `TotalAmount` float NOT NULL,
  `ChargeItem` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`BillId`),
  KEY `patientBill` (`PatientId`) USING BTREE,
  CONSTRAINT `bill_ibfk_1` FOREIGN KEY (`PatientId`) REFERENCES `patient` (`PatientId`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bill
-- ----------------------------
INSERT INTO `bill` VALUES ('10', '否', '7', '2019-04-21 12:47:33', '557', 'checkRecordId,18,19,medicine,3,5,7,');
INSERT INTO `bill` VALUES ('11', '否', '7', '2019-04-21 13:58:50', '325', 'checkRecordId,20,medicine,3,7,5,');

-- ----------------------------
-- Table structure for bloodbank
-- ----------------------------
DROP TABLE IF EXISTS `bloodbank`;
CREATE TABLE `bloodbank` (
  `RecordId` int(11) NOT NULL AUTO_INCREMENT,
  `DonorName` varchar(20) NOT NULL,
  `DonorBloodType` varchar(10) NOT NULL,
  `DonorGender` varchar(2) NOT NULL,
  `DonorAddress` varchar(50) NOT NULL,
  `DonorPhone` varchar(11) NOT NULL,
  `IsInBank` varchar(2) NOT NULL,
  PRIMARY KEY (`RecordId`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bloodbank
-- ----------------------------
INSERT INTO `bloodbank` VALUES ('1', '去问问', 'A型', '女', '山东', '13102562257', '是');
INSERT INTO `bloodbank` VALUES ('2', '易一安', 'B型', '男', ' 鲁东大学', '15610565528', '是');
INSERT INTO `bloodbank` VALUES ('6', 'jjjd', 'O型', '女', 'dsfad', '15265870946', '是');
INSERT INTO `bloodbank` VALUES ('7', 'jjjd', 'O型', '女', 'dsfad', '15265870946', '是');
INSERT INTO `bloodbank` VALUES ('8', 'jjjd', 'O型', '女', 'dsfad', '15265870946', '是');
INSERT INTO `bloodbank` VALUES ('9', 'jjjd', 'O型', '女', 'dsfad', '15265870946', '是');
INSERT INTO `bloodbank` VALUES ('14', 'jjjd', 'O型', '女', 'dsfad', '15265870946', '是');
INSERT INTO `bloodbank` VALUES ('15', 'jjjd', 'O型', '女', 'dsfad', '15265870946', '是');
INSERT INTO `bloodbank` VALUES ('16', 'jjjd', 'O型', '女', 'dsfad', '15265870946', '是');

-- ----------------------------
-- Table structure for check_item
-- ----------------------------
DROP TABLE IF EXISTS `check_item`;
CREATE TABLE `check_item` (
  `CheckItemId` int(11) NOT NULL AUTO_INCREMENT,
  `CheckItemName` varchar(20) NOT NULL,
  `CheckItemPrice` float NOT NULL,
  `CheckItemDescription` varchar(50) NOT NULL,
  PRIMARY KEY (`CheckItemId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of check_item
-- ----------------------------
INSERT INTO `check_item` VALUES ('1', '检查项目1', '232', '项目说明1');
INSERT INTO `check_item` VALUES ('2', '检查项目2', '1562', '项目说明2');
INSERT INTO `check_item` VALUES ('3', '检查项目3', '123', '检查项目3');
INSERT INTO `check_item` VALUES ('4', '检查项目4', '222', '检查项目说明4');
INSERT INTO `check_item` VALUES ('5', '检查项目5', '152', '项目说明');
INSERT INTO `check_item` VALUES ('6', '检查项目6', '53', '项目说明6');

-- ----------------------------
-- Table structure for check_record
-- ----------------------------
DROP TABLE IF EXISTS `check_record`;
CREATE TABLE `check_record` (
  `CheckRecordId` int(11) NOT NULL AUTO_INCREMENT,
  `PatientId` int(11) NOT NULL,
  `CheckItemId` int(11) NOT NULL,
  `PaymentStatus` varchar(2) NOT NULL,
  `CheckDate` datetime NOT NULL,
  `CheckResultDescription` varchar(255) NOT NULL,
  `CheckStaff` int(11) NOT NULL,
  `ResultFile` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`CheckRecordId`),
  KEY `patientCheckRecord` (`PatientId`) USING BTREE,
  KEY `checkRecordCheckItem` (`CheckItemId`) USING BTREE,
  KEY `checkRecordStaff` (`CheckStaff`) USING BTREE,
  CONSTRAINT `check_record_ibfk_1` FOREIGN KEY (`CheckItemId`) REFERENCES `check_item` (`CheckItemId`),
  CONSTRAINT `check_record_ibfk_2` FOREIGN KEY (`CheckStaff`) REFERENCES `staff` (`StaffId`),
  CONSTRAINT `check_record_ibfk_3` FOREIGN KEY (`PatientId`) REFERENCES `patient` (`PatientId`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of check_record
-- ----------------------------
INSERT INTO `check_record` VALUES ('18', '7', '1', '是', '2019-04-21 12:25:54', '没有明显物理病变', '6', 'resources\\image\\20190421122534064.png');
INSERT INTO `check_record` VALUES ('19', '7', '1', '是', '2019-04-21 12:36:53', '无明显病变', '6', 'resources\\image\\20190421123639608.png');
INSERT INTO `check_record` VALUES ('20', '7', '1', '是', '2019-04-21 13:19:44', '没有明显病变', '6', 'resources\\image\\20190421131926054.png');
INSERT INTO `check_record` VALUES ('21', '8', '1', '否', '2019-04-26 15:31:36', '眼睛周围有轻微感染', '6', 'resources\\image\\20190426153113967.png');
INSERT INTO `check_record` VALUES ('22', '8', '2', '否', '2019-04-26 19:44:51', 'qewwwwwwwwwwwwwwwww', '7', 'resources\\image\\20190426194011011.jpg');
INSERT INTO `check_record` VALUES ('23', '8', '2', '否', '2019-04-26 19:44:51', 'qewwwwwwwwwwwwwwwww', '7', 'resources\\image\\20190426194011011.jpg');
INSERT INTO `check_record` VALUES ('24', '8', '1', '否', '2019-04-26 19:47:06', 'qwwwwwweqweqweqweqe', '11', 'resources\\image\\20190426194659248.png');

-- ----------------------------
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department` (
  `DepartmentId` int(11) NOT NULL AUTO_INCREMENT,
  `DepartmentName` varchar(20) NOT NULL,
  `DepartmentDescription` varchar(255) NOT NULL,
  `DepartmentImage` int(255) DEFAULT NULL,
  PRIMARY KEY (`DepartmentId`),
  KEY `departmentImage` (`DepartmentImage`) USING BTREE,
  CONSTRAINT `department_ibfk_1` FOREIGN KEY (`DepartmentImage`) REFERENCES `image` (`ImageId`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO `department` VALUES ('1', '放射科', '负责放射仪器的使用维护', '4');
INSERT INTO `department` VALUES ('2', '新部门', '这是一条部门说明', '1');
INSERT INTO `department` VALUES ('3', '急救部', '急救管理', '2');
INSERT INTO `department` VALUES ('4', '药品部', '药品管理', '2');
INSERT INTO `department` VALUES ('9', '住院部', '住院管理', '1');
INSERT INTO `department` VALUES ('16', '新21231', 'sfdsafsafsdf', '4');

-- ----------------------------
-- Table structure for diet_advice
-- ----------------------------
DROP TABLE IF EXISTS `diet_advice`;
CREATE TABLE `diet_advice` (
  `DietAdviceId` int(11) NOT NULL AUTO_INCREMENT,
  `PatientId` int(11) NOT NULL,
  `DietAdviceContent` varchar(255) NOT NULL,
  `StaffId` int(11) NOT NULL,
  `DietAdviceTime` datetime NOT NULL,
  PRIMARY KEY (`DietAdviceId`),
  KEY `dietAdvicePatient` (`PatientId`) USING BTREE,
  KEY `dietAdviceStaff` (`StaffId`) USING BTREE,
  CONSTRAINT `diet_advice_ibfk_1` FOREIGN KEY (`PatientId`) REFERENCES `patient` (`PatientId`),
  CONSTRAINT `diet_advice_ibfk_2` FOREIGN KEY (`StaffId`) REFERENCES `staff` (`StaffId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of diet_advice
-- ----------------------------
INSERT INTO `diet_advice` VALUES ('1', '7', '多吃清淡食品', '6', '2019-04-21 12:40:00');
INSERT INTO `diet_advice` VALUES ('2', '7', '多喝热水，少吃辛辣', '6', '2019-04-21 13:22:19');

-- ----------------------------
-- Table structure for image
-- ----------------------------
DROP TABLE IF EXISTS `image`;
CREATE TABLE `image` (
  `ImageId` int(11) NOT NULL AUTO_INCREMENT,
  `ImagePath` varchar(255) NOT NULL,
  `UsePage` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ImageId`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of image
-- ----------------------------
INSERT INTO `image` VALUES ('1', 'resources\\image\\bgfirst.png', '病人轮播图');
INSERT INTO `image` VALUES ('2', 'resources\\image\\bgsecond.png', '医生轮播图');
INSERT INTO `image` VALUES ('3', 'resources\\image\\bgthird.png', '管理轮播图');
INSERT INTO `image` VALUES ('4', 'resources\\image\\0.png', 'logo');
INSERT INTO `image` VALUES ('5', 'resources\\image\\avatar.png', '病人默认头像');
INSERT INTO `image` VALUES ('6', 'resources\\image\\staffDefault.jpg', '医生默认头像');
INSERT INTO `image` VALUES ('7', 'resources\\image\\s1.jpg', '');
INSERT INTO `image` VALUES ('8', 'resources\\image\\s2.jpg', '');
INSERT INTO `image` VALUES ('9', 'resources\\image\\s3.jpg', '');
INSERT INTO `image` VALUES ('10', 'resources\\image\\s4.jpg', '');
INSERT INTO `image` VALUES ('11', 'resources\\image\\s5.jpg', '');
INSERT INTO `image` VALUES ('12', 'resources\\image\\s6.jpg', '');
INSERT INTO `image` VALUES ('13', 'resources\\image\\s7.jpg', '');
INSERT INTO `image` VALUES ('14', 'resources\\image\\s8.jpg', '');
INSERT INTO `image` VALUES ('15', 'resources\\image\\s9.jpg', '');
INSERT INTO `image` VALUES ('16', 'resources\\image\\s2.jpg', '');
INSERT INTO `image` VALUES ('50', 'resources\\image\\20190426095920917.png', null);
INSERT INTO `image` VALUES ('51', 'resources\\image\\20190426153113967.png', null);
INSERT INTO `image` VALUES ('52', 'resources\\image\\20190426194011011.jpg', null);
INSERT INTO `image` VALUES ('53', 'resources\\image\\20190426194659248.png', null);

-- ----------------------------
-- Table structure for leave
-- ----------------------------
DROP TABLE IF EXISTS `leave`;
CREATE TABLE `leave` (
  `LeaveId` int(11) NOT NULL AUTO_INCREMENT,
  `StaffId` int(11) NOT NULL,
  `LeaveStartTime` datetime NOT NULL,
  `LeaveEndTime` datetime NOT NULL,
  `ApplicationStatus` varchar(4) NOT NULL,
  `Reason` varchar(255) NOT NULL,
  PRIMARY KEY (`LeaveId`),
  KEY `StaffLeave` (`StaffId`) USING BTREE,
  CONSTRAINT `leave_ibfk_1` FOREIGN KEY (`StaffId`) REFERENCES `staff` (`StaffId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of leave
-- ----------------------------

-- ----------------------------
-- Table structure for medical_record
-- ----------------------------
DROP TABLE IF EXISTS `medical_record`;
CREATE TABLE `medical_record` (
  `MedicalRecordId` int(11) NOT NULL AUTO_INCREMENT,
  `PatientId` int(11) NOT NULL,
  `DiagnoseStaff` int(11) NOT NULL,
  `DiagnosticDescription` varchar(255) NOT NULL,
  `Date` datetime NOT NULL,
  `Symptom` varchar(255) NOT NULL,
  `PaymentStatus` varchar(4) NOT NULL,
  PRIMARY KEY (`MedicalRecordId`),
  KEY `patientMedicalRecord` (`PatientId`) USING BTREE,
  KEY `diagnoseStaffMedicalRecord` (`DiagnoseStaff`) USING BTREE,
  CONSTRAINT `medical_record_ibfk_1` FOREIGN KEY (`DiagnoseStaff`) REFERENCES `staff` (`StaffId`),
  CONSTRAINT `medical_record_ibfk_2` FOREIGN KEY (`PatientId`) REFERENCES `patient` (`PatientId`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of medical_record
-- ----------------------------
INSERT INTO `medical_record` VALUES ('33', '8', '6', '普通感冒', '2019-04-21 12:37:52', '流鼻涕，眼疼', '是');
INSERT INTO `medical_record` VALUES ('34', '8', '6', '没有明显症状，普通问题', '2019-04-21 13:21:07', '头疼，.......................................', '是');
INSERT INTO `medical_record` VALUES ('35', '7', '6', '普通感冒1111111111', '2019-04-27 13:21:07', 'sadasdas', '是');
INSERT INTO `medical_record` VALUES ('36', '8', '6', '普通感冒222222222222', '2019-04-26 18:08:02', '.......................................', '是');
INSERT INTO `medical_record` VALUES ('37', '7', '6', '普通感冒222222222222', '2019-04-26 18:08:02', '.......................................', '是');
INSERT INTO `medical_record` VALUES ('38', '8', '6', '普通感冒222222222222', '2019-04-26 18:08:02', '.......................................', '是');
INSERT INTO `medical_record` VALUES ('39', '8', '6', '普通感冒222222222222', '2019-04-26 18:08:02', '.......................................', '是');

-- ----------------------------
-- Table structure for medication_history
-- ----------------------------
DROP TABLE IF EXISTS `medication_history`;
CREATE TABLE `medication_history` (
  `MedicationHistoryId` int(11) NOT NULL AUTO_INCREMENT,
  `PatientId` int(11) NOT NULL,
  `MedicationId` int(11) NOT NULL,
  `AdverseReactions` varchar(100) NOT NULL,
  `Duration` varchar(255) NOT NULL,
  `LastTime` datetime NOT NULL,
  PRIMARY KEY (`MedicationHistoryId`),
  KEY `patientMedicationHistory` (`PatientId`) USING BTREE,
  KEY `medicationHistoryMedication` (`MedicationId`) USING BTREE,
  CONSTRAINT `medication_history_ibfk_1` FOREIGN KEY (`MedicationId`) REFERENCES `medicine` (`MedicineId`),
  CONSTRAINT `medication_history_ibfk_2` FOREIGN KEY (`PatientId`) REFERENCES `patient` (`PatientId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of medication_history
-- ----------------------------

-- ----------------------------
-- Table structure for medicine
-- ----------------------------
DROP TABLE IF EXISTS `medicine`;
CREATE TABLE `medicine` (
  `MedicineId` int(11) NOT NULL AUTO_INCREMENT,
  `MedicineName` varchar(20) NOT NULL,
  `MedicineInstructions` varchar(100) NOT NULL,
  `MedicineDescription` varchar(100) NOT NULL,
  `MedicinePrice` decimal(10,0) NOT NULL,
  `MedicineNumber` int(11) NOT NULL,
  `ValidityPeriod` varchar(20) NOT NULL,
  `ProductionDate` datetime NOT NULL,
  PRIMARY KEY (`MedicineId`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of medicine
-- ----------------------------
INSERT INTO `medicine` VALUES ('5', '测试药品3', '一日2次，一次3粒', '治疗头疼', '66', '20', '3年', '2019-04-02 00:00:00');
INSERT INTO `medicine` VALUES ('6', '测试药品4', '一日三次，一次五粒', '治疗头疼12', '3423', '20', '3年', '2019-04-02 00:00:00');
INSERT INTO `medicine` VALUES ('7', '测试药品5', '一日三次，一次五粒', '治疗头疼5555', '152', '20', '12个月', '2019-04-02 00:00:00');
INSERT INTO `medicine` VALUES ('8', '测试药品6', '一日三次，一次五粒', '治疗', '123', '123', '4年', '2019-04-11 00:00:00');

-- ----------------------------
-- Table structure for patient
-- ----------------------------
DROP TABLE IF EXISTS `patient`;
CREATE TABLE `patient` (
  `PatientId` int(11) NOT NULL AUTO_INCREMENT,
  `PatientName` varchar(20) NOT NULL,
  `PatientBirthday` varchar(20) NOT NULL,
  `PatientGender` varchar(2) NOT NULL,
  `PatientAge` int(11) NOT NULL,
  `BloodType` varchar(20) DEFAULT NULL,
  `PatientPhone` varchar(11) NOT NULL,
  `PatientAddress` varchar(50) NOT NULL,
  `PatientMStatus` varchar(2) NOT NULL,
  `PatientEmail` varchar(30) NOT NULL,
  `Image` int(11) DEFAULT NULL,
  `PatientPassword` varchar(255) NOT NULL,
  `IdCard` varchar(18) NOT NULL,
  PRIMARY KEY (`PatientId`),
  UNIQUE KEY `PatientEmail` (`PatientEmail`) USING BTREE,
  UNIQUE KEY `IdCard` (`IdCard`) USING BTREE,
  KEY `patientImage` (`Image`) USING BTREE,
  CONSTRAINT `patient_ibfk_1` FOREIGN KEY (`Image`) REFERENCES `image` (`ImageId`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of patient
-- ----------------------------
INSERT INTO `patient` VALUES ('7', '杨阳洋', '1998-10-09', '男', '21', 'AB型', '15265870944', '山东省烟台市', '未婚', '1769326712@qq.com', '5', 'e10adc3949ba59abbe56e057f20f883e', '370829199810092576');
INSERT INTO `patient` VALUES ('8', 'aaa', '1994-10-04', '女', '25', 'B型', '15265870943', '山东省烟台市', '未婚', '2523511898@qq.com', '5', 'e10adc3949ba59abbe56e057f20f883e', '370829199410041766');

-- ----------------------------
-- Table structure for precaution_advice
-- ----------------------------
DROP TABLE IF EXISTS `precaution_advice`;
CREATE TABLE `precaution_advice` (
  `PrecautionAdviceId` int(11) NOT NULL AUTO_INCREMENT,
  `PatientId` int(11) NOT NULL,
  `PrecautionAdviceContent` varchar(100) NOT NULL,
  `StaffId` int(11) NOT NULL,
  `DietAdviceTime` datetime NOT NULL,
  `LastId` int(11) DEFAULT NULL,
  `Role` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`PrecautionAdviceId`),
  KEY `patientPrecautionAdvice` (`PatientId`) USING BTREE,
  KEY `staffPrecautionAdvice` (`StaffId`) USING BTREE,
  KEY `back_to_staff` (`LastId`),
  CONSTRAINT `precaution_advice_ibfk_1` FOREIGN KEY (`PatientId`) REFERENCES `patient` (`PatientId`),
  CONSTRAINT `precaution_advice_ibfk_2` FOREIGN KEY (`StaffId`) REFERENCES `staff` (`StaffId`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of precaution_advice
-- ----------------------------
INSERT INTO `precaution_advice` VALUES ('7', '7', '清热解毒', '6', '2019-04-21 12:40:17', null, 'staff');
INSERT INTO `precaution_advice` VALUES ('8', '7', '吃什么药能清热解毒', '6', '2019-04-21 12:40:41', '7', 'patient');
INSERT INTO `precaution_advice` VALUES ('9', '7', '板蓝根！', '6', '2019-04-21 12:41:20', '8', 'staff');
INSERT INTO `precaution_advice` VALUES ('10', '7', '多注意休息', '6', '2019-04-21 13:22:54', null, 'staff');
INSERT INTO `precaution_advice` VALUES ('11', '7', '多吃蔬菜', '6', '2019-04-21 13:23:55', '8', 'staff');
INSERT INTO `precaution_advice` VALUES ('12', '7', '吃什么蔬菜', '6', '2019-04-21 13:24:10', '11', 'patient');
INSERT INTO `precaution_advice` VALUES ('13', '7', '胡萝卜', '6', '2019-04-21 13:24:21', '12', 'staff');

-- ----------------------------
-- Table structure for prescription
-- ----------------------------
DROP TABLE IF EXISTS `prescription`;
CREATE TABLE `prescription` (
  `PrescriptionId` int(11) NOT NULL AUTO_INCREMENT,
  `MedicalRecordId` int(11) NOT NULL,
  `PrescriptionContent` varchar(100) NOT NULL,
  `PrescriptionDate` datetime NOT NULL,
  `PrescriptionPrecautions` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`PrescriptionId`),
  KEY `MedicalRecordPrescription` (`MedicalRecordId`) USING BTREE,
  CONSTRAINT `prescription_ibfk_1` FOREIGN KEY (`MedicalRecordId`) REFERENCES `medical_record` (`MedicalRecordId`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of prescription
-- ----------------------------
INSERT INTO `prescription` VALUES ('11', '33', '3,5,7', '2019-04-21 12:37:52', '多喝水，少吃辛辣食品');
INSERT INTO `prescription` VALUES ('12', '34', '3,7,5', '2019-04-21 13:21:07', '多注意休息');

-- ----------------------------
-- Table structure for reservation
-- ----------------------------
DROP TABLE IF EXISTS `reservation`;
CREATE TABLE `reservation` (
  `ReservationId` int(11) NOT NULL AUTO_INCREMENT,
  `ReservationTime` varchar(10) NOT NULL,
  `StaffId` int(11) NOT NULL,
  `PatientId` int(11) NOT NULL,
  `ReservationDate` datetime NOT NULL,
  `IsFinished` varchar(10) NOT NULL,
  PRIMARY KEY (`ReservationId`),
  KEY `patientReservation` (`PatientId`) USING BTREE,
  KEY `staffReservation` (`StaffId`) USING BTREE,
  CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`PatientId`) REFERENCES `patient` (`PatientId`),
  CONSTRAINT `reservation_ibfk_2` FOREIGN KEY (`StaffId`) REFERENCES `staff` (`StaffId`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of reservation
-- ----------------------------
INSERT INTO `reservation` VALUES ('20', '5_1', '6', '7', '2019-04-26 00:00:00', '否');
INSERT INTO `reservation` VALUES ('21', '2_2', '6', '7', '2019-04-23 00:00:00', '否');
INSERT INTO `reservation` VALUES ('22', '4_1', '8', '7', '2019-04-25 00:00:00', '否');
INSERT INTO `reservation` VALUES ('23', '5_1', '6', '7', '2019-04-26 00:00:00', '否');
INSERT INTO `reservation` VALUES ('24', '7_1', '6', '7', '2019-04-28 00:00:00', '否');
INSERT INTO `reservation` VALUES ('25', '4_1', '8', '7', '2019-04-25 00:00:00', '否');
INSERT INTO `reservation` VALUES ('26', '2_2', '6', '7', '2019-04-23 00:00:00', '否');
INSERT INTO `reservation` VALUES ('27', '5_1', '6', '7', '2019-04-26 00:00:00', '否');
INSERT INTO `reservation` VALUES ('28', '2_2', '6', '7', '2019-04-23 00:00:00', '否');
INSERT INTO `reservation` VALUES ('29', '5_1', '6', '7', '2019-04-26 00:00:00', '否');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `RoleId` int(11) NOT NULL AUTO_INCREMENT,
  `RoleName` varchar(20) NOT NULL,
  `RoleDescription` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`RoleId`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', '管理员', '管理网站');
INSERT INTO `role` VALUES ('4', '临床医生', '负责诊断病人');
INSERT INTO `role` VALUES ('5', '检查医生', '负责使用仪器检查病人病情，并给出检查结果说明');
INSERT INTO `role` VALUES ('6', '行政医生', '负责管理人事部门事务，药品进出等等');
INSERT INTO `role` VALUES ('7', '的', '法萨芬');

-- ----------------------------
-- Table structure for staff
-- ----------------------------
DROP TABLE IF EXISTS `staff`;
CREATE TABLE `staff` (
  `StaffId` int(11) NOT NULL AUTO_INCREMENT,
  `StaffName` varchar(20) NOT NULL,
  `TitleId` int(11) NOT NULL,
  `DepartmentID` int(11) NOT NULL,
  `Image` int(11) DEFAULT NULL,
  `StaffPassword` varchar(255) NOT NULL,
  `Role` int(11) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Specialty` varchar(255) NOT NULL,
  `Introduction` varchar(255) NOT NULL,
  `Gender` varchar(4) NOT NULL,
  `staffWork` int(11) DEFAULT NULL,
  PRIMARY KEY (`StaffId`),
  UNIQUE KEY `Email` (`Email`) USING BTREE,
  KEY `staffTitle` (`TitleId`) USING BTREE,
  KEY `staffImage` (`Image`) USING BTREE,
  KEY `staffDepartment` (`DepartmentID`) USING BTREE,
  KEY `RoleStaff` (`Role`) USING BTREE,
  CONSTRAINT `staff_ibfk_1` FOREIGN KEY (`Role`) REFERENCES `role` (`RoleId`),
  CONSTRAINT `staff_ibfk_2` FOREIGN KEY (`DepartmentID`) REFERENCES `department` (`DepartmentId`),
  CONSTRAINT `staff_ibfk_3` FOREIGN KEY (`Image`) REFERENCES `image` (`ImageId`),
  CONSTRAINT `staff_ibfk_4` FOREIGN KEY (`TitleId`) REFERENCES `title` (`TitleId`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of staff
-- ----------------------------
INSERT INTO `staff` VALUES ('6', '王琪', '8', '1', '11', 'e10adc3949ba59abbe56e057f20f883e', '4', '2523511899@qq.com', '内科', '                                                                交大毕业博士后哈哈哈哈哈哈哈哈哈\r\n                            \r\n                            ', '女', null);
INSERT INTO `staff` VALUES ('7', '王企', '8', '2', '7', 'e10adc3949ba59abbe56e057f20f883e', '5', '2523511888@qq.com', '放射治疗', '哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈或或或或或或或或或或', '男', '2');
INSERT INTO `staff` VALUES ('8', '王企鹅', '8', '3', '9', 'e10adc3949ba59abbe56e057f20f883e', '6', '2523511881@qq.com', '放射治疗', '哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈或或或或或或或或或或', '男', null);
INSERT INTO `staff` VALUES ('9', '梁美', '8', '4', '13', 'e10adc3949ba59abbe56e057f20f883e', '1', '2523511198@qq.com', '颈椎', '第三方的范德萨发的那个火炬红包VB线程', '女', null);
INSERT INTO `staff` VALUES ('10', '杨帆', '8', '4', '10', 'e10adc3949ba59abbe56e057f20f883e', '1', '2523511298@qq.com', '颈椎', '第三方的范德萨发的那个火炬红包VB线程', '女', null);
INSERT INTO `staff` VALUES ('11', '李国强', '3', '4', '6', 'e10adc3949ba59abbe56e057f20f883e', '5', '2523511886@qq.com', '眼科', '鲁东大学毕业生', '男', '1');
INSERT INTO `staff` VALUES ('12', '李晓明', '3', '3', '6', 'e10adc3949ba59abbe56e057f20f883e', '5', '225356565@qq.com', '治疗头疼', '毕业于鲁东大学', '男', '3');
INSERT INTO `staff` VALUES ('13', '氢气球', '4', '2', '6', 'e10adc3949ba59abbe56e057f20f883e', '5', '2523511999@qq.com', '12121212', '1212122', '男', '4');

-- ----------------------------
-- Table structure for task
-- ----------------------------
DROP TABLE IF EXISTS `task`;
CREATE TABLE `task` (
  `TaskId` int(11) NOT NULL AUTO_INCREMENT,
  `TaskTarget` int(11) NOT NULL,
  `TaskSponsor` int(11) NOT NULL,
  `TaskContent` varchar(100) NOT NULL,
  `TaskStatus` varchar(2) NOT NULL,
  `Patient` int(11) NOT NULL,
  `TaskProgress` float NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`TaskId`),
  KEY `patientTask` (`Patient`) USING BTREE,
  KEY `staffTarget` (`TaskTarget`) USING BTREE,
  KEY `staffSponsor` (`TaskSponsor`) USING BTREE,
  CONSTRAINT `task_ibfk_1` FOREIGN KEY (`Patient`) REFERENCES `patient` (`PatientId`),
  CONSTRAINT `task_ibfk_2` FOREIGN KEY (`TaskSponsor`) REFERENCES `staff` (`StaffId`),
  CONSTRAINT `task_ibfk_3` FOREIGN KEY (`TaskTarget`) REFERENCES `staff` (`StaffId`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of task
-- ----------------------------
INSERT INTO `task` VALUES ('25', '7', '6', '流感', '是', '7', '1', '2019-04-21 12:25:55');
INSERT INTO `task` VALUES ('26', '7', '6', '眼睛', '是', '7', '1', '2019-04-21 12:36:53');
INSERT INTO `task` VALUES ('27', '7', '6', '第三方收到发生过丰东股份', '是', '7', '1', '2019-04-21 13:19:45');
INSERT INTO `task` VALUES ('28', '8', '6', '眼睛红肿', '否', '8', '0', '2019-04-26 15:29:27');
INSERT INTO `task` VALUES ('29', '7', '6', '眼睛红肿', '是', '8', '1', '2019-04-26 15:31:36');
INSERT INTO `task` VALUES ('30', '7', '6', '强强强强强强强强', '是', '8', '1', '2019-04-26 19:44:52');
INSERT INTO `task` VALUES ('31', '11', '6', '强强强强强强强强11111111111', '是', '8', '1', '2019-04-26 19:47:06');

-- ----------------------------
-- Table structure for title
-- ----------------------------
DROP TABLE IF EXISTS `title`;
CREATE TABLE `title` (
  `TitleId` int(11) NOT NULL AUTO_INCREMENT,
  `TitleName` varchar(20) NOT NULL,
  `TitleDescription` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`TitleId`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of title
-- ----------------------------
INSERT INTO `title` VALUES ('1', '主治医师', '病人病情主要负责人');
INSERT INTO `title` VALUES ('2', '副主任医师', '副主任医师');
INSERT INTO `title` VALUES ('3', '主任医师', '有官职的');
INSERT INTO `title` VALUES ('4', '检查医生', '检查');
INSERT INTO `title` VALUES ('8', '住院医师', '住院观察');

-- ----------------------------
-- Table structure for work_schedule
-- ----------------------------
DROP TABLE IF EXISTS `work_schedule`;
CREATE TABLE `work_schedule` (
  `WorkScheduleId` int(11) NOT NULL AUTO_INCREMENT,
  `StaffId` int(11) NOT NULL,
  `WorkSchedule` varchar(100) NOT NULL,
  PRIMARY KEY (`WorkScheduleId`),
  KEY `staffWorkSchedule` (`StaffId`) USING BTREE,
  CONSTRAINT `work_schedule_ibfk_1` FOREIGN KEY (`StaffId`) REFERENCES `staff` (`StaffId`)
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of work_schedule
-- ----------------------------
INSERT INTO `work_schedule` VALUES ('13', '7', '1_1');
INSERT INTO `work_schedule` VALUES ('14', '7', '4_2');
INSERT INTO `work_schedule` VALUES ('15', '7', '7_2');
INSERT INTO `work_schedule` VALUES ('16', '9', '1_1');
INSERT INTO `work_schedule` VALUES ('17', '9', '4_2');
INSERT INTO `work_schedule` VALUES ('18', '9', '6_1');
INSERT INTO `work_schedule` VALUES ('19', '9', '7_2');
INSERT INTO `work_schedule` VALUES ('25', '8', '1_1');
INSERT INTO `work_schedule` VALUES ('26', '8', '1_2');
INSERT INTO `work_schedule` VALUES ('27', '8', '2_1');
INSERT INTO `work_schedule` VALUES ('28', '8', '2_2');
INSERT INTO `work_schedule` VALUES ('29', '8', '3_1');
INSERT INTO `work_schedule` VALUES ('30', '8', '3_2');
INSERT INTO `work_schedule` VALUES ('31', '8', '4_1');
INSERT INTO `work_schedule` VALUES ('32', '8', '4_2');
INSERT INTO `work_schedule` VALUES ('33', '8', '5_1');
INSERT INTO `work_schedule` VALUES ('34', '8', '5_2');
INSERT INTO `work_schedule` VALUES ('35', '8', '6_1');
INSERT INTO `work_schedule` VALUES ('36', '8', '6_2');
INSERT INTO `work_schedule` VALUES ('37', '8', '7_1');
INSERT INTO `work_schedule` VALUES ('38', '8', '7_2');
INSERT INTO `work_schedule` VALUES ('39', '6', '1_1');
INSERT INTO `work_schedule` VALUES ('40', '6', '2_2');
INSERT INTO `work_schedule` VALUES ('41', '6', '5_1');
INSERT INTO `work_schedule` VALUES ('42', '6', '7_1');
INSERT INTO `work_schedule` VALUES ('77', '12', '1_2');
INSERT INTO `work_schedule` VALUES ('78', '12', '2_1');
INSERT INTO `work_schedule` VALUES ('79', '12', '4_1');
INSERT INTO `work_schedule` VALUES ('80', '12', '4_2');
INSERT INTO `work_schedule` VALUES ('81', '12', '6_1');
INSERT INTO `work_schedule` VALUES ('82', '12', '6_2');
