/*
Navicat MySQL Data Transfer

Source Server         : MySQL
Source Server Version : 50624
Source Host           : 127.0.0.1:3306
Source Database       : instalhms

Target Server Type    : MYSQL
Target Server Version : 50624
File Encoding         : 65001

Date: 2019-04-09 08:26:58
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for backpack_file
-- ----------------------------
DROP TABLE IF EXISTS `backpack_file`;
CREATE TABLE `backpack_file` (
`BackpackFileId`  int(11) NOT NULL AUTO_INCREMENT ,
`BackpackFilePath`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`BackpackTime`  datetime NOT NULL ,
PRIMARY KEY (`BackpackFileId`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=1

;

-- ----------------------------
-- Records of backpack_file
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for backpack_setting
-- ----------------------------
DROP TABLE IF EXISTS `backpack_setting`;
CREATE TABLE `backpack_setting` (
`BackpackSettingId`  int(11) NOT NULL AUTO_INCREMENT ,
`BackpackSqlFile`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`BackpackBatFile`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`BackpackToPath`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
PRIMARY KEY (`BackpackSettingId`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=1

;

-- ----------------------------
-- Records of backpack_setting
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for bill
-- ----------------------------
DROP TABLE IF EXISTS `bill`;
CREATE TABLE `bill` (
`BillId`  int(11) NOT NULL AUTO_INCREMENT ,
`PaymentStatus`  varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`PatientId`  int(11) NOT NULL ,
`BillDate`  datetime NOT NULL ,
`TotalAmount`  float NOT NULL ,
PRIMARY KEY (`BillId`),
FOREIGN KEY (`PatientId`) REFERENCES `patient` (`PatientId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
INDEX `patientBill` (`PatientId`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=1

;

-- ----------------------------
-- Records of bill
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for bloodbank
-- ----------------------------
DROP TABLE IF EXISTS `bloodbank`;
CREATE TABLE `bloodbank` (
`RecordId`  int(11) NOT NULL AUTO_INCREMENT ,
`DonorName`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`DonorBloodType`  varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`DonorGender`  varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`DonorAddress`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`DonorPhone`  varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`IsInBank`  varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
PRIMARY KEY (`RecordId`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=1

;

-- ----------------------------
-- Records of bloodbank
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for check_item
-- ----------------------------
DROP TABLE IF EXISTS `check_item`;
CREATE TABLE `check_item` (
`CheckItemId`  int(11) NOT NULL AUTO_INCREMENT ,
`CheckItemName`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`CheckItemPrice`  float NOT NULL ,
`CheckItemDescription`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
PRIMARY KEY (`CheckItemId`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=4

;

-- ----------------------------
-- Records of check_item
-- ----------------------------
BEGIN;
INSERT INTO `check_item` VALUES ('1', '请问', '0', '驱蚊器翁'), ('2', '项目1', '1562', '项目说明1'), ('3', '驱蚊', '123', '1324');
COMMIT;

-- ----------------------------
-- Table structure for check_record
-- ----------------------------
DROP TABLE IF EXISTS `check_record`;
CREATE TABLE `check_record` (
`CheckRecordId`  int(11) NOT NULL AUTO_INCREMENT ,
`PatientId`  int(11) NOT NULL ,
`CheckItemId`  int(11) NOT NULL ,
`PaymentStatus`  varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`CheckDate`  datetime NOT NULL ,
`CheckResultDescription`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`CheckStaff`  int(11) NOT NULL ,
`ResultFile`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
PRIMARY KEY (`CheckRecordId`),
FOREIGN KEY (`CheckItemId`) REFERENCES `check_item` (`CheckItemId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
FOREIGN KEY (`CheckStaff`) REFERENCES `staff` (`StaffId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
FOREIGN KEY (`PatientId`) REFERENCES `patient` (`PatientId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
INDEX `patientCheckRecord` (`PatientId`) USING BTREE ,
INDEX `checkRecordCheckItem` (`CheckItemId`) USING BTREE ,
INDEX `checkRecordStaff` (`CheckStaff`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=10

;

-- ----------------------------
-- Records of check_record
-- ----------------------------
BEGIN;
INSERT INTO `check_record` VALUES ('2', '3', '3', '否', '2019-04-06 16:55:26', '飞得更高电饭锅电饭锅电饭锅非官方的规范工程现场VC不v', '6', 'resources\\image\\20190406165516078.png'), ('3', '3', '3', '否', '2019-04-07 15:27:20', 'fsadfdg的法国队v才不辜负已经换了科技含量你们', '7', 'resources\\image\\20190407152707320.jpg'), ('4', '3', '2', '否', '2019-04-08 10:04:24', 'jsdakfl你开饭店那撒电脑蜂蜜柠檬茶，仙女of漏洞是', '7', 'resources\\image\\20190408100414982.py'), ('5', '3', '2', '否', '2019-04-08 10:09:19', '和国际化管理看明年绿不纯洁', '7', 'resources\\image\\20190408100909064.jpg'), ('6', '3', '1', '否', '2019-04-08 10:44:58', '很关键环节，', '6', ''), ('7', '3', '1', '否', '2019-04-08 10:45:31', '丰东股份表现出责罚', '6', 'resources\\image\\20190408104525090.png'), ('8', '3', '2', '否', '2019-04-08 10:51:37', '的双方各江湖告急', '7', 'resources\\image\\20190408105131952.png'), ('9', '3', '2', '否', '2019-04-08 10:55:03', '反，每年北京快乐', '7', 'resources\\image\\20190408105457730.jpg');
COMMIT;

-- ----------------------------
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department` (
`DepartmentId`  int(11) NOT NULL AUTO_INCREMENT ,
`DepartmentName`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`DepartmentDescription`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`DepartmentImage`  int(255) NULL DEFAULT NULL ,
PRIMARY KEY (`DepartmentId`),
FOREIGN KEY (`DepartmentImage`) REFERENCES `image` (`ImageId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
INDEX `departmentImage` (`DepartmentImage`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=11

;

-- ----------------------------
-- Records of department
-- ----------------------------
BEGIN;
INSERT INTO `department` VALUES ('9', '住院部', '住院管理', null), ('10', '放射科', '负责放射仪器的使用维护', null);
COMMIT;

-- ----------------------------
-- Table structure for diet_advice
-- ----------------------------
DROP TABLE IF EXISTS `diet_advice`;
CREATE TABLE `diet_advice` (
`DietAdviceId`  int(11) NOT NULL AUTO_INCREMENT ,
`PatientId`  int(11) NOT NULL ,
`DietAdviceContent`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`StaffId`  int(11) NOT NULL ,
`DietAdviceTime`  datetime NOT NULL ,
PRIMARY KEY (`DietAdviceId`),
FOREIGN KEY (`PatientId`) REFERENCES `patient` (`PatientId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
FOREIGN KEY (`StaffId`) REFERENCES `staff` (`StaffId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
INDEX `dietAdvicePatient` (`PatientId`) USING BTREE ,
INDEX `dietAdviceStaff` (`StaffId`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=1

;

-- ----------------------------
-- Records of diet_advice
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for image
-- ----------------------------
DROP TABLE IF EXISTS `image`;
CREATE TABLE `image` (
`ImageId`  int(11) NOT NULL AUTO_INCREMENT ,
`ImagePath`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`UsePage`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
PRIMARY KEY (`ImageId`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=21

;

-- ----------------------------
-- Records of image
-- ----------------------------
BEGIN;
INSERT INTO `image` VALUES ('1', 'resources\\image\\staffDefault.jpg', null), ('2', 'resources\\image\\staffDefault.jpg', null), ('3', 'resources\\image\\staffDefault.jpg', null), ('4', 'resources\\image\\staffDefault.jpg', null), ('5', 'resources\\image\\staffDefault.jpg', null), ('6', 'resources\\image\\staffDefault.jpg', null), ('7', 'resources\\image\\staffDefault.jpg', null), ('8', 'resources\\image\\staffDefault.jpg', null), ('9', 'resources\\image\\staffDefault.jpg', null), ('10', 'resources\\image\\staffDefault.jpg', null), ('11', 'resources\\image\\20190406160039982.jpg', null), ('12', 'resources\\image\\20190406162934046.jpg', null), ('13', 'resources\\image\\20190406163144496.png', null), ('14', 'resources\\image\\20190406165516078.png', null), ('15', 'resources\\image\\20190407152707320.jpg', null), ('16', 'resources\\image\\20190408100414982.py', null), ('17', 'resources\\image\\20190408100909064.jpg', null), ('18', 'resources\\image\\20190408104525090.png', null), ('19', 'resources\\image\\20190408105131952.png', null), ('20', 'resources\\image\\20190408105457730.jpg', null);
COMMIT;

-- ----------------------------
-- Table structure for leave
-- ----------------------------
DROP TABLE IF EXISTS `leave`;
CREATE TABLE `leave` (
`LeaveId`  int(11) NOT NULL AUTO_INCREMENT ,
`StaffId`  int(11) NOT NULL ,
`LeaveStartTime`  datetime NOT NULL ,
`LeaveEndTime`  datetime NOT NULL ,
`ApplicationStatus`  varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`Reason`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
PRIMARY KEY (`LeaveId`),
FOREIGN KEY (`StaffId`) REFERENCES `staff` (`StaffId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
INDEX `StaffLeave` (`StaffId`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=1

;

-- ----------------------------
-- Records of leave
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for medical_record
-- ----------------------------
DROP TABLE IF EXISTS `medical_record`;
CREATE TABLE `medical_record` (
`MedicalRecordId`  int(11) NOT NULL AUTO_INCREMENT ,
`PatientId`  int(11) NOT NULL ,
`DiagnoseStaff`  int(11) NOT NULL ,
`DiagnosticDescription`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`Date`  datetime NOT NULL ,
`Symptom`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
PRIMARY KEY (`MedicalRecordId`),
FOREIGN KEY (`DiagnoseStaff`) REFERENCES `staff` (`StaffId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
FOREIGN KEY (`PatientID`) REFERENCES `patient` (`PatientId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
INDEX `patientMedicalRecord` (`PatientId`) USING BTREE ,
INDEX `diagnoseStaffMedicalRecord` (`DiagnoseStaff`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=11

;

-- ----------------------------
-- Records of medical_record
-- ----------------------------
BEGIN;
INSERT INTO `medical_record` VALUES ('1', '3', '6', '轻微感冒发顺丰的的撒发生打发打发阿萨德范德萨发', '2019-04-10 15:48:00', '头疼发热放大声的撒范德萨发大水范德萨范德萨'), ('2', '3', '6', '轻微感冒', '2019-04-10 15:48:00', '头疼发热'), ('3', '3', '6', '轻微感冒', '2019-04-10 15:48:00', '头疼发热'), ('4', '3', '6', '轻微感冒', '2019-04-10 15:48:00', '头疼发热'), ('5', '3', '6', '轻微感冒', '2019-04-10 15:48:00', '头疼发热'), ('6', '3', '6', '轻微感冒', '2019-04-10 15:48:00', '头疼发热'), ('7', '3', '6', '轻微感冒', '2019-04-10 15:48:00', '头疼发热'), ('8', '3', '6', '撒旦范德萨', '2019-04-02 22:01:16', '士大夫打撒'), ('9', '3', '6', '', '2019-04-08 15:55:22', ''), ('10', '3', '6', '', '2019-04-08 15:56:21', '');
COMMIT;

-- ----------------------------
-- Table structure for medication_history
-- ----------------------------
DROP TABLE IF EXISTS `medication_history`;
CREATE TABLE `medication_history` (
`MedicationHistoryId`  int(11) NOT NULL ,
`PatientId`  int(11) NOT NULL ,
`MedicationId`  int(11) NOT NULL ,
`AdverseReactions`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`Duration`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`LastTime`  datetime NOT NULL ,
PRIMARY KEY (`MedicationHistoryId`),
FOREIGN KEY (`MedicationId`) REFERENCES `medicine` (`MedicineId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
FOREIGN KEY (`PatientId`) REFERENCES `patient` (`PatientId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
INDEX `patientMedicationHistory` (`PatientId`) USING BTREE ,
INDEX `medicationHistoryMedication` (`MedicationId`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci

;

-- ----------------------------
-- Records of medication_history
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for medicine
-- ----------------------------
DROP TABLE IF EXISTS `medicine`;
CREATE TABLE `medicine` (
`MedicineId`  int(11) NOT NULL AUTO_INCREMENT ,
`MedicineName`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`MedicineInstructions`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`MedicineDescription`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`MedicinePrice`  decimal(10,0) NOT NULL ,
`MedicineNumber`  int(11) NOT NULL ,
`ValidityPeriod`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`ProductionDate`  datetime NOT NULL ,
PRIMARY KEY (`MedicineId`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=2

;

-- ----------------------------
-- Records of medicine
-- ----------------------------
BEGIN;
INSERT INTO `medicine` VALUES ('1', '1', '2', '3', '4', '5', '6', '2019-03-03 00:00:00');
COMMIT;

-- ----------------------------
-- Table structure for patient
-- ----------------------------
DROP TABLE IF EXISTS `patient`;
CREATE TABLE `patient` (
`PatientId`  int(11) NOT NULL AUTO_INCREMENT ,
`PatientName`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`PatientBirthday`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`PatientGender`  varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`PatientAge`  int(11) NOT NULL ,
`BloodType`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`PatientPhone`  varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`PatientAddress`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`PatientMStatus`  varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`PatientEmail`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`Image`  int(11) NULL DEFAULT NULL ,
`PatientPassword`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`IdCard`  varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
PRIMARY KEY (`PatientId`),
FOREIGN KEY (`Image`) REFERENCES `image` (`ImageId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
UNIQUE INDEX `PatientEmail` (`PatientEmail`) USING BTREE ,
UNIQUE INDEX `IdCard` (`IdCard`) USING BTREE ,
INDEX `patientImage` (`Image`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=4

;

-- ----------------------------
-- Records of patient
-- ----------------------------
BEGIN;
INSERT INTO `patient` VALUES ('3', '王企鹅', '1994-10-04', '男', '25', '未知', '15265870943', '山东省青岛市', '已婚', '2523511898@qq.com', null, 'e10adc3949ba59abbe56e057f20f883e', '370829199410041756');
COMMIT;

-- ----------------------------
-- Table structure for precaution_advice
-- ----------------------------
DROP TABLE IF EXISTS `precaution_advice`;
CREATE TABLE `precaution_advice` (
`PrecautionAdviceId`  int(11) NOT NULL ,
`PatientId`  int(11) NOT NULL ,
`PrecautionAdviceContent`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`StaffId`  int(11) NOT NULL ,
`DietAdviceTime`  datetime NOT NULL ,
PRIMARY KEY (`PrecautionAdviceId`),
FOREIGN KEY (`PatientId`) REFERENCES `patient` (`PatientId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
FOREIGN KEY (`StaffId`) REFERENCES `staff` (`StaffId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
INDEX `patientPrecautionAdvice` (`PatientId`) USING BTREE ,
INDEX `staffPrecautionAdvice` (`StaffId`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci

;

-- ----------------------------
-- Records of precaution_advice
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for prescription
-- ----------------------------
DROP TABLE IF EXISTS `prescription`;
CREATE TABLE `prescription` (
`PrescriptionId`  int(11) NOT NULL AUTO_INCREMENT ,
`MedicalRecordId`  int(11) NOT NULL ,
`PrescriptionContent`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`PrescriptionDate`  datetime NOT NULL ,
`PrescriptionPrecautions`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
PRIMARY KEY (`PrescriptionId`),
FOREIGN KEY (`MedicalRecordId`) REFERENCES `medical_record` (`MedicalRecordId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
INDEX `MedicalRecordPrescription` (`MedicalRecordId`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=1

;

-- ----------------------------
-- Records of prescription
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for reservation
-- ----------------------------
DROP TABLE IF EXISTS `reservation`;
CREATE TABLE `reservation` (
`ReservationId`  int(11) NOT NULL AUTO_INCREMENT ,
`ReservationTime`  varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`StaffId`  int(11) NOT NULL ,
`PatientId`  int(11) NOT NULL ,
`ReservationDate`  datetime NOT NULL ,
`IsFinished`  varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
PRIMARY KEY (`ReservationId`),
FOREIGN KEY (`PatientId`) REFERENCES `patient` (`PatientId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
FOREIGN KEY (`StaffId`) REFERENCES `staff` (`StaffId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
INDEX `patientReservation` (`PatientId`) USING BTREE ,
INDEX `staffReservation` (`StaffId`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=12

;

-- ----------------------------
-- Records of reservation
-- ----------------------------
BEGIN;
INSERT INTO `reservation` VALUES ('7', '1_1', '7', '3', '2019-03-31 14:43:51', '否'), ('8', '1_1', '7', '3', '2019-04-01 00:00:00', '否'), ('9', '1_1', '7', '3', '2019-04-01 00:00:00', '否'), ('10', '1_1', '7', '3', '2019-04-01 00:00:00', '否'), ('11', '1_1', '7', '3', '2019-04-01 00:00:00', '否');
COMMIT;

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
`RoleId`  int(11) NOT NULL AUTO_INCREMENT ,
`RoleName`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`RoleDescription`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`RoleWork`  int(11) NULL DEFAULT NULL COMMENT '角色的工作，与checkItem的checkItemId相关联，可以为空' ,
PRIMARY KEY (`RoleId`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=7

;

-- ----------------------------
-- Records of role
-- ----------------------------
BEGIN;
INSERT INTO `role` VALUES ('4', '临床医生', '负责诊断病人', '1'), ('5', '检查医生', '负责使用仪器检查病人病情，并给出检查结果说明', '2'), ('6', '行政医生', '负责管理人事部门事务，药品进出等等', '3');
COMMIT;

-- ----------------------------
-- Table structure for staff
-- ----------------------------
DROP TABLE IF EXISTS `staff`;
CREATE TABLE `staff` (
`StaffId`  int(11) NOT NULL AUTO_INCREMENT ,
`StaffName`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`TitleId`  int(11) NOT NULL ,
`DepartmentID`  int(11) NOT NULL ,
`Image`  int(11) NULL DEFAULT NULL ,
`StaffPassword`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`Role`  int(11) NOT NULL ,
`Email`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`Specialty`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`Introduction`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`Gender`  varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
PRIMARY KEY (`StaffId`),
FOREIGN KEY (`Role`) REFERENCES `role` (`RoleId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
FOREIGN KEY (`DepartmentID`) REFERENCES `department` (`DepartmentId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
FOREIGN KEY (`Image`) REFERENCES `image` (`ImageId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
FOREIGN KEY (`TitleId`) REFERENCES `title` (`TitleId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
UNIQUE INDEX `Email` (`Email`) USING BTREE ,
INDEX `staffTitle` (`TitleId`) USING BTREE ,
INDEX `staffImage` (`Image`) USING BTREE ,
INDEX `staffDepartment` (`DepartmentID`) USING BTREE ,
INDEX `RoleStaff` (`Role`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=10

;

-- ----------------------------
-- Records of staff
-- ----------------------------
BEGIN;
INSERT INTO `staff` VALUES ('6', '王琪', '8', '9', '5', 'e10adc3949ba59abbe56e057f20f883e', '4', '2523511899@qq.com', '内科', '交大毕业博士后哈哈哈哈哈哈哈哈哈', '男'), ('7', '王企2', '10', '10', '4', 'e10adc3949ba59abbe56e057f20f883e', '5', '2523511888@qq.com', '放射治疗', '哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈或或或或或或或或或或', '女'), ('8', '王企鹅', '8', '9', '4', 'e10adc3949ba59abbe56e057f20f883e', '6', '2523511881@qq.com', '放射治疗', '哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈或或或或或或或或或或', '女'), ('9', '易上福', '9', '9', '4', 'e10adc3949ba59abbe56e057f20f883e', '4', '2523511198@qq.com', '颈椎', '第三方的范德萨发的那个火炬红包VB线程', '男');
COMMIT;

-- ----------------------------
-- Table structure for task
-- ----------------------------
DROP TABLE IF EXISTS `task`;
CREATE TABLE `task` (
`TaskId`  int(11) NOT NULL AUTO_INCREMENT ,
`TaskTarget`  int(11) NOT NULL ,
`TaskSponsor`  int(11) NOT NULL ,
`TaskContent`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`TaskStatus`  varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`Patient`  int(11) NOT NULL ,
`TaskProgress`  float NOT NULL ,
`date`  datetime NOT NULL ,
PRIMARY KEY (`TaskId`),
FOREIGN KEY (`Patient`) REFERENCES `patient` (`PatientId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
FOREIGN KEY (`TaskSponsor`) REFERENCES `staff` (`StaffId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
FOREIGN KEY (`TaskTarget`) REFERENCES `staff` (`StaffId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
INDEX `patientTask` (`Patient`) USING BTREE ,
INDEX `staffTarget` (`TaskTarget`) USING BTREE ,
INDEX `staffSponsor` (`TaskSponsor`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=12

;

-- ----------------------------
-- Records of task
-- ----------------------------
BEGIN;
INSERT INTO `task` VALUES ('1', '6', '7', '检查病人状况', '是', '3', '1', '2019-04-06 16:55:26'), ('2', '7', '6', '算法但是防守打法', '是', '3', '1', '2019-04-07 15:27:20'), ('4', '6', '6', '的萨芬', '是', '3', '1', '2019-04-08 10:44:58'), ('5', '7', '6', '疑似症状', '是', '3', '1', '2019-04-08 10:04:24'), ('6', '7', '7', '范德萨发的是符合规范', '是', '3', '1', '2019-04-08 10:09:19'), ('10', '7', '7', 'gfdh万v健康韩国客户那边能不能把你', '是', '3', '1', '2019-04-08 10:51:37'), ('11', '7', '7', '12346776663', '是', '3', '1', '2019-04-08 10:55:03');
COMMIT;

-- ----------------------------
-- Table structure for title
-- ----------------------------
DROP TABLE IF EXISTS `title`;
CREATE TABLE `title` (
`TitleId`  int(11) NOT NULL AUTO_INCREMENT ,
`TitleName`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`TitleDescription`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
PRIMARY KEY (`TitleId`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=12

;

-- ----------------------------
-- Records of title
-- ----------------------------
BEGIN;
INSERT INTO `title` VALUES ('8', '住院医师', '住院观察'), ('9', '主治医师', '主要负责人'), ('10', '副主任医师', '副主任医师'), ('11', '主任医师', '有官职的');
COMMIT;

-- ----------------------------
-- Table structure for work_schedule
-- ----------------------------
DROP TABLE IF EXISTS `work_schedule`;
CREATE TABLE `work_schedule` (
`WorkScheduleId`  int(11) NOT NULL AUTO_INCREMENT ,
`StaffId`  int(11) NOT NULL ,
`WorkSchedule`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
PRIMARY KEY (`WorkScheduleId`),
FOREIGN KEY (`StaffId`) REFERENCES `staff` (`StaffId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
INDEX `staffWorkSchedule` (`StaffId`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=43

;

-- ----------------------------
-- Records of work_schedule
-- ----------------------------
BEGIN;
INSERT INTO `work_schedule` VALUES ('13', '7', '1_1'), ('14', '7', '4_2'), ('15', '7', '7_2'), ('16', '9', '1_1'), ('17', '9', '4_2'), ('18', '9', '6_1'), ('19', '9', '7_2'), ('25', '8', '1_1'), ('26', '8', '1_2'), ('27', '8', '2_1'), ('28', '8', '2_2'), ('29', '8', '3_1'), ('30', '8', '3_2'), ('31', '8', '4_1'), ('32', '8', '4_2'), ('33', '8', '5_1'), ('34', '8', '5_2'), ('35', '8', '6_1'), ('36', '8', '6_2'), ('37', '8', '7_1'), ('38', '8', '7_2'), ('39', '6', '1_1'), ('40', '6', '2_2'), ('41', '6', '5_1'), ('42', '6', '7_1');
COMMIT;

-- ----------------------------
-- Auto increment value for backpack_file
-- ----------------------------
ALTER TABLE `backpack_file` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for backpack_setting
-- ----------------------------
ALTER TABLE `backpack_setting` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for bill
-- ----------------------------
ALTER TABLE `bill` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for bloodbank
-- ----------------------------
ALTER TABLE `bloodbank` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for check_item
-- ----------------------------
ALTER TABLE `check_item` AUTO_INCREMENT=4;

-- ----------------------------
-- Auto increment value for check_record
-- ----------------------------
ALTER TABLE `check_record` AUTO_INCREMENT=10;

-- ----------------------------
-- Auto increment value for department
-- ----------------------------
ALTER TABLE `department` AUTO_INCREMENT=11;

-- ----------------------------
-- Auto increment value for diet_advice
-- ----------------------------
ALTER TABLE `diet_advice` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for image
-- ----------------------------
ALTER TABLE `image` AUTO_INCREMENT=21;

-- ----------------------------
-- Auto increment value for leave
-- ----------------------------
ALTER TABLE `leave` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for medical_record
-- ----------------------------
ALTER TABLE `medical_record` AUTO_INCREMENT=11;

-- ----------------------------
-- Auto increment value for medicine
-- ----------------------------
ALTER TABLE `medicine` AUTO_INCREMENT=2;

-- ----------------------------
-- Auto increment value for patient
-- ----------------------------
ALTER TABLE `patient` AUTO_INCREMENT=4;

-- ----------------------------
-- Auto increment value for prescription
-- ----------------------------
ALTER TABLE `prescription` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for reservation
-- ----------------------------
ALTER TABLE `reservation` AUTO_INCREMENT=12;

-- ----------------------------
-- Auto increment value for role
-- ----------------------------
ALTER TABLE `role` AUTO_INCREMENT=7;

-- ----------------------------
-- Auto increment value for staff
-- ----------------------------
ALTER TABLE `staff` AUTO_INCREMENT=10;

-- ----------------------------
-- Auto increment value for task
-- ----------------------------
ALTER TABLE `task` AUTO_INCREMENT=12;

-- ----------------------------
-- Auto increment value for title
-- ----------------------------
ALTER TABLE `title` AUTO_INCREMENT=12;

-- ----------------------------
-- Auto increment value for work_schedule
-- ----------------------------
ALTER TABLE `work_schedule` AUTO_INCREMENT=43;
