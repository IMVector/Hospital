/*
Navicat MySQL Data Transfer

Source Server         : MySQL
Source Server Version : 50624
Source Host           : 127.0.0.1:3306
Source Database       : instalhms

Target Server Type    : MYSQL
Target Server Version : 50624
File Encoding         : 65001

Date: 2019-04-19 20:34:15
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of backpack_file
-- ----------------------------
INSERT INTO `backpack_file` VALUES ('2', 'D:\\2019_04_19_03_00_00backpack.sql', '2019-04-19 15:00:00');
INSERT INTO `backpack_file` VALUES ('3', 'D:\\2019_04_19_03_30_00backpack.sql', '2019-04-19 15:30:00');
INSERT INTO `backpack_file` VALUES ('4', 'D:\\2019_04_19_04_00_00backpack.sql', '2019-04-19 16:00:00');
INSERT INTO `backpack_file` VALUES ('5', 'D:\\2019_04_19_04_30_00backpack.sql', '2019-04-19 16:30:00');
INSERT INTO `backpack_file` VALUES ('6', 'D:\\2019_04_19_05_00_00backpack.sql', '2019-04-19 17:00:00');
INSERT INTO `backpack_file` VALUES ('7', 'D:\\2019_04_19_05_30_00backpack.sql', '2019-04-19 17:30:00');
INSERT INTO `backpack_file` VALUES ('8', 'D:\\2019_04_19_06_00_00backpack.sql', '2019-04-19 18:00:00');
INSERT INTO `backpack_file` VALUES ('9', 'D:\\2019_04_19_06_30_00backpack.sql', '2019-04-19 18:30:00');
INSERT INTO `backpack_file` VALUES ('10', 'D:\\2019_04_19_07_30_00backpack.sql', '2019-04-19 19:30:00');
INSERT INTO `backpack_file` VALUES ('11', 'D:\\2019_04_19_08_30_00backpack.sql', '2019-04-19 20:30:00');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bill
-- ----------------------------

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bloodbank
-- ----------------------------

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of check_item
-- ----------------------------
INSERT INTO `check_item` VALUES ('1', '请问', '0', '驱蚊器翁');
INSERT INTO `check_item` VALUES ('2', '项目1', '1562', '项目说明1');
INSERT INTO `check_item` VALUES ('3', '驱蚊', '123', '1324');

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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of check_record
-- ----------------------------
INSERT INTO `check_record` VALUES ('2', '3', '3', '否', '2019-04-06 16:55:26', '飞得更高电饭锅电饭锅电饭锅非官方的规范工程现场VC不v', '6', 'resources\\image\\20190406165516078.png');
INSERT INTO `check_record` VALUES ('3', '3', '3', '否', '2019-04-07 15:27:20', 'fsadfdg的法国队v才不辜负已经换了科技含量你们', '7', 'resources\\image\\20190407152707320.jpg');
INSERT INTO `check_record` VALUES ('4', '3', '2', '否', '2019-04-08 10:04:24', 'jsdakfl你开饭店那撒电脑蜂蜜柠檬茶，仙女of漏洞是', '7', 'resources\\image\\20190408100414982.py');
INSERT INTO `check_record` VALUES ('5', '3', '2', '否', '2019-04-08 10:09:19', '和国际化管理看明年绿不纯洁', '7', 'resources\\image\\20190408100909064.jpg');
INSERT INTO `check_record` VALUES ('6', '3', '1', '否', '2019-04-08 10:44:58', '很关键环节，', '6', '');
INSERT INTO `check_record` VALUES ('7', '3', '1', '否', '2019-04-08 10:45:31', '丰东股份表现出责罚', '6', 'resources\\image\\20190408104525090.png');
INSERT INTO `check_record` VALUES ('8', '3', '2', '否', '2019-04-08 10:51:37', '的双方各江湖告急', '7', 'resources\\image\\20190408105131952.png');
INSERT INTO `check_record` VALUES ('9', '3', '2', '否', '2019-04-08 10:55:03', '反，每年北京快乐', '7', 'resources\\image\\20190408105457730.jpg');
INSERT INTO `check_record` VALUES ('10', '3', '2', '否', '2019-04-10 23:43:04', 'fdsfcxzvsdfdsf', '7', 'resources\\image\\20190410234257562.jpg');
INSERT INTO `check_record` VALUES ('11', '3', '2', '否', '2019-04-11 14:37:47', '无明显病变，一切正常', '7', 'resources\\image\\20190411143730690.png');

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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO `department` VALUES ('9', '住院部', '住院管理', null);
INSERT INTO `department` VALUES ('10', '放射科', '负责放射仪器的使用维护', null);

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of diet_advice
-- ----------------------------
INSERT INTO `diet_advice` VALUES ('1', '3', 'fdasfdsf', '6', '2019-04-17 10:57:27');
INSERT INTO `diet_advice` VALUES ('2', '3', 'fsdafg', '6', '2019-04-17 10:58:33');
INSERT INTO `diet_advice` VALUES ('3', '3', '第三方收到', '6', '2019-04-17 11:26:46');
INSERT INTO `diet_advice` VALUES ('4', '3', '地方撒', '6', '2019-04-17 11:28:31');
INSERT INTO `diet_advice` VALUES ('5', '3', '是反复', '6', '2019-04-17 11:29:16');

-- ----------------------------
-- Table structure for image
-- ----------------------------
DROP TABLE IF EXISTS `image`;
CREATE TABLE `image` (
  `ImageId` int(11) NOT NULL AUTO_INCREMENT,
  `ImagePath` varchar(255) NOT NULL,
  `UsePage` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ImageId`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of image
-- ----------------------------
INSERT INTO `image` VALUES ('1', 'resources\\image\\bgfirst.png', '病人轮播图');
INSERT INTO `image` VALUES ('2', 'resources\\image\\bgsecond.png', '医生轮播图');
INSERT INTO `image` VALUES ('3', 'resources\\image\\bgthird.png', '管理轮播图');
INSERT INTO `image` VALUES ('4', 'resources\\image\\20190418222142335.png', '第4个轮播图');
INSERT INTO `image` VALUES ('5', 'resources\\image\\avatar.png', null);
INSERT INTO `image` VALUES ('6', 'resources\\image\\staffDefault.jpg', null);
INSERT INTO `image` VALUES ('7', 'resources\\image\\staffDefault.jpg', null);
INSERT INTO `image` VALUES ('8', 'resources\\image\\staffDefault.jpg', null);
INSERT INTO `image` VALUES ('9', 'resources\\image\\staffDefault.jpg', null);
INSERT INTO `image` VALUES ('10', 'resources\\image\\staffDefault.jpg', null);
INSERT INTO `image` VALUES ('11', 'resources\\image\\20190406160039982.jpg', null);
INSERT INTO `image` VALUES ('12', 'resources\\image\\20190406162934046.jpg', null);
INSERT INTO `image` VALUES ('13', 'resources\\image\\20190406163144496.png', null);
INSERT INTO `image` VALUES ('14', 'resources\\image\\20190406165516078.png', null);
INSERT INTO `image` VALUES ('15', 'resources\\image\\20190407152707320.jpg', null);
INSERT INTO `image` VALUES ('16', 'resources\\image\\20190408100414982.py', null);
INSERT INTO `image` VALUES ('17', 'resources\\image\\20190408100909064.jpg', null);
INSERT INTO `image` VALUES ('18', 'resources\\image\\20190408104525090.png', null);
INSERT INTO `image` VALUES ('19', 'resources\\image\\20190408105131952.png', null);
INSERT INTO `image` VALUES ('20', 'resources\\image\\20190408105457730.jpg', null);
INSERT INTO `image` VALUES ('21', 'resources\\image\\20190410234257562.jpg', null);
INSERT INTO `image` VALUES ('22', 'resources\\image\\20190411143730690.png', null);
INSERT INTO `image` VALUES ('23', 'resources\\image\\20190411154806523.jpg', null);
INSERT INTO `image` VALUES ('24', 'resources\\image\\20190411172022936.jpg', null);
INSERT INTO `image` VALUES ('25', 'resources\\image\\20190411172224008.png', null);
INSERT INTO `image` VALUES ('26', 'resources\\image\\20190411172331862.png', null);
INSERT INTO `image` VALUES ('27', 'resources\\image\\20190411174728279.png', null);
INSERT INTO `image` VALUES ('28', 'resources\\image\\20190418104520087.jpg', null);
INSERT INTO `image` VALUES ('29', 'resources\\image\\20190418105210328.jpg', null);
INSERT INTO `image` VALUES ('30', 'resources\\image\\20190418105333088.jpg', null);
INSERT INTO `image` VALUES ('31', 'resources\\image\\20190418111924962.jpg', null);
INSERT INTO `image` VALUES ('32', 'resources\\image\\20190418114111004.jpg', null);

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
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of medical_record
-- ----------------------------
INSERT INTO `medical_record` VALUES ('1', '3', '6', '轻微感冒发顺丰的的撒发生打发打发阿萨德范德萨发', '2019-04-10 15:48:00', '头疼发热放大声的撒范德萨发大水范德萨范德萨', '否');
INSERT INTO `medical_record` VALUES ('2', '3', '6', '轻微感冒', '2019-04-10 15:48:00', '头疼发热', '否');
INSERT INTO `medical_record` VALUES ('3', '3', '6', '轻微感冒', '2019-04-10 15:48:00', '头疼发热', '否');
INSERT INTO `medical_record` VALUES ('4', '3', '6', '轻微感冒', '2019-04-10 15:48:00', '头疼发热', '否');
INSERT INTO `medical_record` VALUES ('5', '3', '6', '轻微感冒', '2019-04-10 15:48:00', '头疼发热', '否');
INSERT INTO `medical_record` VALUES ('6', '3', '6', '轻微感冒', '2019-04-10 15:48:00', '头疼发热', '否');
INSERT INTO `medical_record` VALUES ('7', '3', '6', '轻微感冒', '2019-04-10 15:48:00', '头疼发热', '否');
INSERT INTO `medical_record` VALUES ('8', '3', '6', '撒旦范德萨', '2019-04-02 22:01:16', '士大夫打撒', '否');
INSERT INTO `medical_record` VALUES ('11', '3', '8', '上火', '2019-04-09 13:31:06', '头疼。。。。。。。。。。。。。。。。。。。', '否');
INSERT INTO `medical_record` VALUES ('22', '3', '8', '上火', '2019-04-09 13:31:17', '头疼。。。。。。。。。。。。。。。。。。。', '否');
INSERT INTO `medical_record` VALUES ('23', '3', '7', '无明显症状，多喝水', '2019-04-11 14:38:43', '脚冷，手冷', '否');

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of medication_history
-- ----------------------------
INSERT INTO `medication_history` VALUES ('1', '3', '6', 'qwe', '12', '2019-04-03 00:00:00');

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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of medicine
-- ----------------------------
INSERT INTO `medicine` VALUES ('2', '测试药品1', '一日三次，一次五粒', '治疗头疼', '15', '20', '3年', '2019-04-02 00:00:00');
INSERT INTO `medicine` VALUES ('3', '测试药品2', '一日三次，一次五粒', '治疗头疼', '15', '20', '3年', '2019-04-02 00:00:00');
INSERT INTO `medicine` VALUES ('4', '测试药品3', '一日三次，一次五粒', '治疗头疼', '15', '20', '3年', '2019-04-02 00:00:00');
INSERT INTO `medicine` VALUES ('5', '测试药品4', '一日三次，一次五粒', '治疗头疼', '15', '20', '3年', '2019-04-02 00:00:00');
INSERT INTO `medicine` VALUES ('6', '测试药品5', '一日三次，一次五粒', '治疗头疼', '15', '20', '3年', '2019-04-02 00:00:00');
INSERT INTO `medicine` VALUES ('7', 'aaaa', '一日三次，一次五粒', '治疗头疼', '15', '20', '3年', '2019-04-02 00:00:00');

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of patient
-- ----------------------------
INSERT INTO `patient` VALUES ('3', '王企鹅', '1994-10-04', '男', '25', 'AB型', '15265870943', '山东省青岛市', '未婚', '2523511898@qq.com', '27', 'e10adc3949ba59abbe56e057f20f883e', '370829199410041756');
INSERT INTO `patient` VALUES ('4', '社会王', '1994-10-04', '女', '25', 'A型', '15265870944', '山东省青岛市', '未婚', '1769326712@qq.com', '23', 'e10adc3949ba59abbe56e057f20f883e', '370829199410041766');

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of precaution_advice
-- ----------------------------
INSERT INTO `precaution_advice` VALUES ('1', '3', '范德萨发', '6', '2019-04-17 11:34:50', null, 'staff');
INSERT INTO `precaution_advice` VALUES ('2', '3', '为什么？', '6', '2019-04-19 19:22:48', '1', 'patient');
INSERT INTO `precaution_advice` VALUES ('3', '3', '因为...........................', '6', '2019-04-19 19:46:37', '2', 'staff');
INSERT INTO `precaution_advice` VALUES ('4', '3', '哈哈哈哈哈哈哈哈哈哈哈哈哈', '6', '2019-04-19 19:48:46', '3', 'patient');

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of prescription
-- ----------------------------
INSERT INTO `prescription` VALUES ('1', '23', '2,5,4,7', '2019-04-11 14:38:43', '少吃辣，多吃清淡食物');

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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of reservation
-- ----------------------------
INSERT INTO `reservation` VALUES ('12', '7_1', '6', '3', '2019-04-14 00:00:00', '否');
INSERT INTO `reservation` VALUES ('13', '4_2', '7', '3', '2019-04-11 00:00:00', '否');
INSERT INTO `reservation` VALUES ('14', '4_2', '7', '3', '2019-04-11 00:00:00', '否');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `RoleId` int(11) NOT NULL AUTO_INCREMENT,
  `RoleName` varchar(20) NOT NULL,
  `RoleDescription` varchar(255) DEFAULT NULL,
  `RoleWork` int(11) DEFAULT NULL COMMENT '角色的工作，与checkItem的checkItemId相关联，可以为空',
  PRIMARY KEY (`RoleId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', '管理员', '管理网站', null);
INSERT INTO `role` VALUES ('4', '临床医生', '负责诊断病人', '1');
INSERT INTO `role` VALUES ('5', '检查医生', '负责使用仪器检查病人病情，并给出检查结果说明', '2');
INSERT INTO `role` VALUES ('6', '行政医生', '负责管理人事部门事务，药品进出等等', '3');

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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of staff
-- ----------------------------
INSERT INTO `staff` VALUES ('6', '王琪', '8', '10', '32', 'e10adc3949ba59abbe56e057f20f883e', '4', '2523511899@qq.com', '内科', '                                交大毕业博士后哈哈哈哈哈哈哈哈哈\r\n                            ', '男');
INSERT INTO `staff` VALUES ('7', '王企2', '10', '10', '4', 'e10adc3949ba59abbe56e057f20f883e', '5', '2523511888@qq.com', '放射治疗', '哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈或或或或或或或或或或', '女');
INSERT INTO `staff` VALUES ('8', '王企鹅', '8', '9', '4', 'e10adc3949ba59abbe56e057f20f883e', '6', '2523511881@qq.com', '放射治疗', '哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈或或或或或或或或或或', '女');
INSERT INTO `staff` VALUES ('9', '易上福', '9', '9', '4', 'e10adc3949ba59abbe56e057f20f883e', '1', '2523511198@qq.com', '颈椎', '第三方的范德萨发的那个火炬红包VB线程', '男');

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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of task
-- ----------------------------
INSERT INTO `task` VALUES ('1', '6', '7', '检查病人状况', '是', '3', '1', '2019-04-06 16:55:26');
INSERT INTO `task` VALUES ('2', '7', '6', '算法但是防守打法', '是', '3', '1', '2019-04-07 15:27:20');
INSERT INTO `task` VALUES ('4', '6', '6', '的萨芬', '是', '3', '1', '2019-04-08 10:44:58');
INSERT INTO `task` VALUES ('5', '7', '6', '疑似症状', '是', '3', '1', '2019-04-08 10:04:24');
INSERT INTO `task` VALUES ('6', '7', '7', '范德萨发的是符合规范', '是', '3', '1', '2019-04-08 10:09:19');
INSERT INTO `task` VALUES ('10', '7', '7', 'gfdh万v健康韩国客户那边能不能把你', '是', '3', '1', '2019-04-08 10:51:37');
INSERT INTO `task` VALUES ('11', '7', '7', '12346776663', '是', '3', '1', '2019-04-08 10:55:03');
INSERT INTO `task` VALUES ('12', '7', '6', 'fdsfds', '是', '3', '1', '2019-04-10 23:43:04');
INSERT INTO `task` VALUES ('13', '7', '6', '肝虚', '是', '3', '1', '2019-04-11 14:37:47');

-- ----------------------------
-- Table structure for title
-- ----------------------------
DROP TABLE IF EXISTS `title`;
CREATE TABLE `title` (
  `TitleId` int(11) NOT NULL AUTO_INCREMENT,
  `TitleName` varchar(20) NOT NULL,
  `TitleDescription` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`TitleId`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of title
-- ----------------------------
INSERT INTO `title` VALUES ('8', '住院医师', '住院观察');
INSERT INTO `title` VALUES ('9', '主治医师', '主要负责人');
INSERT INTO `title` VALUES ('10', '副主任医师', '副主任医师');
INSERT INTO `title` VALUES ('11', '主任医师', '有官职的');

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
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;

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
