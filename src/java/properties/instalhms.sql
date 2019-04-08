/*
Navicat MySQL Data Transfer

Source Server         : MySQL
Source Server Version : 50624
Source Host           : 127.0.0.1:3306
Source Database       : instalhms

Target Server Type    : MYSQL
Target Server Version : 50624
File Encoding         : 65001

Date: 2019-04-03 22:46:45
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of backpack_file
-- ----------------------------

-- ----------------------------
-- Table structure for backpack_setting
-- ----------------------------
DROP TABLE IF EXISTS `backpack_setting`;
CREATE TABLE `backpack_setting` (
  `BackpackSettingId` int(11) NOT NULL AUTO_INCREMENT,
  `BackpackSqlFile` varchar(255) NOT NULL,
  `BackpackBatFile` varchar(255) NOT NULL,
  `BackpackToPath` varchar(255) NOT NULL,
  PRIMARY KEY (`BackpackSettingId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of backpack_setting
-- ----------------------------

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
  PRIMARY KEY (`BillId`),
  KEY `patientBill` (`PatientId`),
  CONSTRAINT `patientBill` FOREIGN KEY (`PatientId`) REFERENCES `patient` (`PatientId`)
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
  PRIMARY KEY (`CheckRecordId`),
  KEY `patientCheckRecord` (`PatientId`),
  KEY `checkRecordCheckItem` (`CheckItemId`),
  KEY `checkRecordStaff` (`CheckStaff`),
  CONSTRAINT `checkRecordCheckItem` FOREIGN KEY (`CheckItemId`) REFERENCES `check_item` (`CheckItemId`),
  CONSTRAINT `checkRecordStaff` FOREIGN KEY (`CheckStaff`) REFERENCES `staff` (`StaffId`),
  CONSTRAINT `patientCheckRecord` FOREIGN KEY (`PatientId`) REFERENCES `patient` (`PatientId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of check_record
-- ----------------------------

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
  KEY `departmentImage` (`DepartmentImage`),
  CONSTRAINT `departmentImage` FOREIGN KEY (`DepartmentImage`) REFERENCES `image` (`ImageId`)
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
  KEY `dietAdvicePatient` (`PatientId`),
  KEY `dietAdviceStaff` (`StaffId`),
  CONSTRAINT `dietAdvicePatient` FOREIGN KEY (`PatientId`) REFERENCES `patient` (`PatientId`),
  CONSTRAINT `dietAdviceStaff` FOREIGN KEY (`StaffId`) REFERENCES `staff` (`StaffId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of diet_advice
-- ----------------------------

-- ----------------------------
-- Table structure for image
-- ----------------------------
DROP TABLE IF EXISTS `image`;
CREATE TABLE `image` (
  `ImageId` int(11) NOT NULL AUTO_INCREMENT,
  `ImagePath` varchar(255) NOT NULL,
  `UsePage` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ImageId`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of image
-- ----------------------------
INSERT INTO `image` VALUES ('1', 'resources\\image\\staffDefault.jpg', null);
INSERT INTO `image` VALUES ('2', 'resources\\image\\staffDefault.jpg', null);
INSERT INTO `image` VALUES ('3', 'resources\\image\\staffDefault.jpg', null);
INSERT INTO `image` VALUES ('4', 'resources\\image\\staffDefault.jpg', null);
INSERT INTO `image` VALUES ('5', 'resources\\image\\staffDefault.jpg', null);
INSERT INTO `image` VALUES ('6', 'resources\\image\\staffDefault.jpg', null);
INSERT INTO `image` VALUES ('7', 'resources\\image\\staffDefault.jpg', null);
INSERT INTO `image` VALUES ('8', 'resources\\image\\staffDefault.jpg', null);
INSERT INTO `image` VALUES ('9', 'resources\\image\\staffDefault.jpg', null);
INSERT INTO `image` VALUES ('10', 'resources\\image\\staffDefault.jpg', null);

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
  KEY `StaffLeave` (`StaffId`),
  CONSTRAINT `StaffLeave` FOREIGN KEY (`StaffId`) REFERENCES `staff` (`StaffId`)
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
  `Symptom` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`MedicalRecordId`),
  KEY `patientMedicalRecord` (`PatientId`) USING BTREE,
  KEY `diagnoseStaffMedicalRecord` (`DiagnoseStaff`),
  CONSTRAINT `diagnoseStaffMedicalRecord` FOREIGN KEY (`DiagnoseStaff`) REFERENCES `staff` (`StaffId`),
  CONSTRAINT `patientMedicalRecord` FOREIGN KEY (`PatientID`) REFERENCES `patient` (`PatientId`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of medical_record
-- ----------------------------
INSERT INTO `medical_record` VALUES ('1', '3', '6', '轻微感冒发顺丰的的撒发生打发打发阿萨德范德萨发', '2019-04-10 15:48:00', '头疼发热放大声的撒范德萨发大水范德萨范德萨');
INSERT INTO `medical_record` VALUES ('2', '3', '6', '轻微感冒', '2019-04-10 15:48:00', '头疼发热');
INSERT INTO `medical_record` VALUES ('3', '3', '6', '轻微感冒', '2019-04-10 15:48:00', '头疼发热');
INSERT INTO `medical_record` VALUES ('4', '3', '6', '轻微感冒', '2019-04-10 15:48:00', '头疼发热');
INSERT INTO `medical_record` VALUES ('5', '3', '6', '轻微感冒', '2019-04-10 15:48:00', '头疼发热');
INSERT INTO `medical_record` VALUES ('6', '3', '6', '轻微感冒', '2019-04-10 15:48:00', '头疼发热');
INSERT INTO `medical_record` VALUES ('7', '3', '6', '轻微感冒', '2019-04-10 15:48:00', '头疼发热');
INSERT INTO `medical_record` VALUES ('8', '3', '6', '撒旦范德萨', '2019-04-02 22:01:16', '士大夫打撒');

-- ----------------------------
-- Table structure for medication_history
-- ----------------------------
DROP TABLE IF EXISTS `medication_history`;
CREATE TABLE `medication_history` (
  `MedicationHistoryId` int(11) NOT NULL,
  `PatientId` int(11) NOT NULL,
  `MedicationId` int(11) NOT NULL,
  `AdverseReactions` varchar(100) NOT NULL,
  `Duration` varchar(255) NOT NULL,
  `LastTime` datetime NOT NULL,
  PRIMARY KEY (`MedicationHistoryId`),
  KEY `patientMedicationHistory` (`PatientId`),
  KEY `medicationHistoryMedication` (`MedicationId`),
  CONSTRAINT `medicationHistoryMedication` FOREIGN KEY (`MedicationId`) REFERENCES `medicine` (`MedicineId`),
  CONSTRAINT `patientMedicationHistory` FOREIGN KEY (`PatientId`) REFERENCES `patient` (`PatientId`)
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of medicine
-- ----------------------------
INSERT INTO `medicine` VALUES ('1', '1', '2', '3', '4', '5', '6', '2019-03-03 00:00:00');

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
  UNIQUE KEY `PatientEmail` (`PatientEmail`),
  UNIQUE KEY `IdCard` (`IdCard`),
  KEY `patientImage` (`Image`),
  CONSTRAINT `patientImage` FOREIGN KEY (`Image`) REFERENCES `image` (`ImageId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of patient
-- ----------------------------
INSERT INTO `patient` VALUES ('3', '王企鹅', '1994-10-04', '男', '25', '未知', '15265870943', '山东省青岛市', '已婚', '2523511898@qq.com', null, 'e10adc3949ba59abbe56e057f20f883e', '370829199410041756');

-- ----------------------------
-- Table structure for precaution_advice
-- ----------------------------
DROP TABLE IF EXISTS `precaution_advice`;
CREATE TABLE `precaution_advice` (
  `PrecautionAdviceId` int(11) NOT NULL,
  `PatientId` int(11) NOT NULL,
  `PrecautionAdviceContent` varchar(100) NOT NULL,
  `StaffId` int(11) NOT NULL,
  `DietAdviceTime` datetime NOT NULL,
  PRIMARY KEY (`PrecautionAdviceId`),
  KEY `patientPrecautionAdvice` (`PatientId`),
  KEY `staffPrecautionAdvice` (`StaffId`),
  CONSTRAINT `patientPrecautionAdvice` FOREIGN KEY (`PatientId`) REFERENCES `patient` (`PatientId`),
  CONSTRAINT `staffPrecautionAdvice` FOREIGN KEY (`StaffId`) REFERENCES `staff` (`StaffId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of precaution_advice
-- ----------------------------

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
  KEY `MedicalRecordPrescription` (`MedicalRecordId`),
  CONSTRAINT `MedicalRecordPrescription` FOREIGN KEY (`MedicalRecordId`) REFERENCES `medical_record` (`MedicalRecordId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of prescription
-- ----------------------------

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
  KEY `patientReservation` (`PatientId`),
  KEY `staffReservation` (`StaffId`),
  CONSTRAINT `patientReservation` FOREIGN KEY (`PatientId`) REFERENCES `patient` (`PatientId`),
  CONSTRAINT `staffReservation` FOREIGN KEY (`StaffId`) REFERENCES `staff` (`StaffId`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of reservation
-- ----------------------------
INSERT INTO `reservation` VALUES ('7', '1_1', '7', '3', '2019-03-31 14:43:51', '否');
INSERT INTO `reservation` VALUES ('8', '1_1', '7', '3', '2019-04-01 00:00:00', '否');
INSERT INTO `reservation` VALUES ('9', '1_1', '7', '3', '2019-04-01 00:00:00', '否');
INSERT INTO `reservation` VALUES ('10', '1_1', '7', '3', '2019-04-01 00:00:00', '否');
INSERT INTO `reservation` VALUES ('11', '1_1', '7', '3', '2019-04-01 00:00:00', '否');

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
INSERT INTO `role` VALUES ('4', '临床医生', '负责诊断病人', null);
INSERT INTO `role` VALUES ('5', '检查医生', '负责使用仪器检查病人病情，并给出检查结果说明', null);
INSERT INTO `role` VALUES ('6', '行政管理', '负责管理人事部门事务，药品进出等等', null);

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
  UNIQUE KEY `Email` (`Email`),
  KEY `staffTitle` (`TitleId`),
  KEY `staffImage` (`Image`),
  KEY `staffDepartment` (`DepartmentID`),
  KEY `RoleStaff` (`Role`),
  CONSTRAINT `RoleStaff` FOREIGN KEY (`Role`) REFERENCES `role` (`RoleId`),
  CONSTRAINT `staffDepartment` FOREIGN KEY (`DepartmentID`) REFERENCES `department` (`DepartmentId`),
  CONSTRAINT `staffImage` FOREIGN KEY (`Image`) REFERENCES `image` (`ImageId`),
  CONSTRAINT `staffTitle` FOREIGN KEY (`TitleId`) REFERENCES `title` (`TitleId`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of staff
-- ----------------------------
INSERT INTO `staff` VALUES ('6', '王琪', '8', '9', '5', 'e10adc3949ba59abbe56e057f20f883e', '4', '2523511899@qq.com', '内科', '交大毕业博士后哈哈哈哈哈哈哈哈哈', '男');
INSERT INTO `staff` VALUES ('7', '王企鹅', '10', '10', '8', 'e10adc3949ba59abbe56e057f20f883e', '4', '2523511888@qq.com', '放射治疗', '哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈或或或或或或或或或或', '女');

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
  PRIMARY KEY (`TaskId`),
  KEY `patientTask` (`Patient`),
  KEY `staffTarget` (`TaskTarget`),
  KEY `staffSponsor` (`TaskSponsor`),
  CONSTRAINT `patientTask` FOREIGN KEY (`Patient`) REFERENCES `patient` (`PatientId`),
  CONSTRAINT `staffSponsor` FOREIGN KEY (`TaskSponsor`) REFERENCES `staff` (`StaffId`),
  CONSTRAINT `staffTarget` FOREIGN KEY (`TaskTarget`) REFERENCES `staff` (`StaffId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of task
-- ----------------------------
INSERT INTO `task` VALUES ('1', '6', '7', '检查病人状况', '否', '3', '0.33');

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
  KEY `staffWorkSchedule` (`StaffId`),
  CONSTRAINT `staffWorkSchedule` FOREIGN KEY (`StaffId`) REFERENCES `staff` (`StaffId`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of work_schedule
-- ----------------------------
INSERT INTO `work_schedule` VALUES ('13', '7', '1_1');
INSERT INTO `work_schedule` VALUES ('14', '7', '4_2');
INSERT INTO `work_schedule` VALUES ('15', '7', '7_2');