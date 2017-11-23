/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50626
Source Host           : localhost:3306
Source Database       : bloodbank

Target Server Type    : MYSQL
Target Server Version : 50626
File Encoding         : 65001

Date: 2017-11-23 16:59:10
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `bloodtype_table`
-- ----------------------------
DROP TABLE IF EXISTS `bloodtype_table`;
CREATE TABLE `bloodtype_table` (
  `Bloodtype_Id` varchar(10) NOT NULL,
  `Bloodtype_Name` varchar(10) NOT NULL,
  PRIMARY KEY (`Bloodtype_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of bloodtype_table
-- ----------------------------
INSERT INTO `bloodtype_table` VALUES ('BG01', 'A-');
INSERT INTO `bloodtype_table` VALUES ('BG02', 'A+');
INSERT INTO `bloodtype_table` VALUES ('BG03', 'B-');
INSERT INTO `bloodtype_table` VALUES ('BG04', 'B+');
INSERT INTO `bloodtype_table` VALUES ('BG05', 'AB-');
INSERT INTO `bloodtype_table` VALUES ('BG06', 'A+');
INSERT INTO `bloodtype_table` VALUES ('BG07', 'O-');
INSERT INTO `bloodtype_table` VALUES ('BG08', 'O+');

-- ----------------------------
-- Table structure for `blood_categorys`
-- ----------------------------
DROP TABLE IF EXISTS `blood_categorys`;
CREATE TABLE `blood_categorys` (
  `category_id` varchar(20) NOT NULL,
  `category_name` varchar(20) NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of blood_categorys
-- ----------------------------

-- ----------------------------
-- Table structure for `blood_units_details`
-- ----------------------------
DROP TABLE IF EXISTS `blood_units_details`;
CREATE TABLE `blood_units_details` (
  `unit_no` varchar(20) NOT NULL,
  `bloodtype_id` varchar(20) NOT NULL,
  `bloodcategory-id` varchar(20) NOT NULL,
  `date_added` date NOT NULL,
  `expiry_date` date NOT NULL,
  PRIMARY KEY (`unit_no`),
  KEY `unit_bloodtype` (`bloodtype_id`),
  KEY `category` (`bloodcategory-id`),
  CONSTRAINT `category` FOREIGN KEY (`bloodcategory-id`) REFERENCES `blood_categorys` (`category_id`),
  CONSTRAINT `unit_bloodtype` FOREIGN KEY (`bloodtype_id`) REFERENCES `bloodtype_table` (`Bloodtype_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of blood_units_details
-- ----------------------------

-- ----------------------------
-- Table structure for `diseases_difects`
-- ----------------------------
DROP TABLE IF EXISTS `diseases_difects`;
CREATE TABLE `diseases_difects` (
  `disease_difect_id` varchar(20) NOT NULL,
  `disease_difect_name` varchar(20) NOT NULL,
  PRIMARY KEY (`disease_difect_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of diseases_difects
-- ----------------------------

-- ----------------------------
-- Table structure for `donorpersonaldetails`
-- ----------------------------
DROP TABLE IF EXISTS `donorpersonaldetails`;
CREATE TABLE `donorpersonaldetails` (
  `DonorId` varchar(20) NOT NULL,
  `Fname` varchar(20) NOT NULL,
  `Lname` varchar(20) NOT NULL,
  `Gender` varchar(20) NOT NULL,
  `DOB` date NOT NULL,
  `Residence` varchar(20) NOT NULL,
  `Email/Phone_no` varchar(20) NOT NULL,
  PRIMARY KEY (`DonorId`),
  KEY `DonorId` (`DonorId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of donorpersonaldetails
-- ----------------------------

-- ----------------------------
-- Table structure for `donor_archive`
-- ----------------------------
DROP TABLE IF EXISTS `donor_archive`;
CREATE TABLE `donor_archive` (
  `donor_id` varchar(20) NOT NULL,
  `bloodtype_id` varchar(20) NOT NULL,
  `fname` varchar(20) NOT NULL,
  `lname` varchar(20) NOT NULL,
  KEY `archive_id` (`donor_id`),
  KEY `archive_bloodtype` (`bloodtype_id`),
  CONSTRAINT `archive_bloodtype` FOREIGN KEY (`bloodtype_id`) REFERENCES `bloodtype_table` (`Bloodtype_Id`),
  CONSTRAINT `archive_id` FOREIGN KEY (`donor_id`) REFERENCES `donorpersonaldetails` (`DonorId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of donor_archive
-- ----------------------------

-- ----------------------------
-- Table structure for `donor_blooddetails`
-- ----------------------------
DROP TABLE IF EXISTS `donor_blooddetails`;
CREATE TABLE `donor_blooddetails` (
  `DonorId` varchar(20) NOT NULL,
  `Bloodtype_Id` varchar(20) NOT NULL,
  PRIMARY KEY (`DonorId`),
  KEY `Bloodtype_Id` (`Bloodtype_Id`),
  CONSTRAINT `Bloodtype_Id` FOREIGN KEY (`Bloodtype_Id`) REFERENCES `bloodtype_table` (`Bloodtype_Id`),
  CONSTRAINT `DonorId` FOREIGN KEY (`DonorId`) REFERENCES `donorpersonaldetails` (`DonorId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of donor_blooddetails
-- ----------------------------

-- ----------------------------
-- Table structure for `recipients_archive`
-- ----------------------------
DROP TABLE IF EXISTS `recipients_archive`;
CREATE TABLE `recipients_archive` (
  `recipient_id` varchar(20) NOT NULL,
  `bloodtype_id` varchar(20) NOT NULL,
  `fname` varchar(20) NOT NULL,
  `lname` varchar(20) NOT NULL,
  KEY `recipient_id` (`recipient_id`),
  KEY `bloodtype_id` (`bloodtype_id`),
  CONSTRAINT `recipients_archive_ibfk_1` FOREIGN KEY (`recipient_id`) REFERENCES `recipients_personal_details` (`recipient_id`),
  CONSTRAINT `recipients_archive_ibfk_2` FOREIGN KEY (`bloodtype_id`) REFERENCES `bloodtype_table` (`Bloodtype_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of recipients_archive
-- ----------------------------

-- ----------------------------
-- Table structure for `recipients_personal_details`
-- ----------------------------
DROP TABLE IF EXISTS `recipients_personal_details`;
CREATE TABLE `recipients_personal_details` (
  `recipient_id` varchar(20) NOT NULL,
  `fname` varchar(20) NOT NULL,
  `lname` varchar(20) NOT NULL,
  `Gender` varchar(10) NOT NULL,
  `dob` date NOT NULL,
  `residence` varchar(20) NOT NULL,
  `contacts` varchar(25) NOT NULL,
  PRIMARY KEY (`recipient_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of recipients_personal_details
-- ----------------------------

-- ----------------------------
-- Table structure for `recipient_blood_details`
-- ----------------------------
DROP TABLE IF EXISTS `recipient_blood_details`;
CREATE TABLE `recipient_blood_details` (
  `recipient_id` varchar(20) NOT NULL,
  `bloodtype_id` varchar(20) NOT NULL,
  KEY `recipient` (`recipient_id`),
  KEY `bloodtype` (`bloodtype_id`),
  CONSTRAINT `bloodtype` FOREIGN KEY (`bloodtype_id`) REFERENCES `bloodtype_table` (`Bloodtype_Id`),
  CONSTRAINT `recipient` FOREIGN KEY (`recipient_id`) REFERENCES `recipients_personal_details` (`recipient_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of recipient_blood_details
-- ----------------------------

-- ----------------------------
-- Table structure for `request_table`
-- ----------------------------
DROP TABLE IF EXISTS `request_table`;
CREATE TABLE `request_table` (
  `request_id` varchar(20) NOT NULL,
  `date_added` date NOT NULL,
  `request_description` longtext NOT NULL,
  PRIMARY KEY (`request_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of request_table
-- ----------------------------

-- ----------------------------
-- Table structure for `residence_areas`
-- ----------------------------
DROP TABLE IF EXISTS `residence_areas`;
CREATE TABLE `residence_areas` (
  `areaCode` varchar(20) NOT NULL,
  `residenceArea` varchar(20) NOT NULL,
  PRIMARY KEY (`areaCode`,`residenceArea`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of residence_areas
-- ----------------------------
INSERT INTO `residence_areas` VALUES ('a001', 'chumani');
INSERT INTO `residence_areas` VALUES ('a002', 'roka');
INSERT INTO `residence_areas` VALUES ('a003', 'chonyi');
INSERT INTO `residence_areas` VALUES ('a004 ', 'watamu');
INSERT INTO `residence_areas` VALUES ('a005', 'kilifi');
INSERT INTO `residence_areas` VALUES ('a006', 'malindi');
INSERT INTO `residence_areas` VALUES ('a007', 'kaloleni');

-- ----------------------------
-- Table structure for `user_archive`
-- ----------------------------
DROP TABLE IF EXISTS `user_archive`;
CREATE TABLE `user_archive` (
  `user_id` varchar(20) DEFAULT NULL,
  `fname` varchar(20) DEFAULT NULL,
  `lname` varchar(20) DEFAULT NULL,
  `priviledge` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  KEY `arch_userid` (`user_id`),
  KEY `password` (`password`),
  CONSTRAINT `arch_userid` FOREIGN KEY (`user_id`) REFERENCES `user_personal_details` (`userId`),
  CONSTRAINT `user_archive_ibfk_1` FOREIGN KEY (`password`) REFERENCES `user_login_details` (`password`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of user_archive
-- ----------------------------

-- ----------------------------
-- Table structure for `user_login_details`
-- ----------------------------
DROP TABLE IF EXISTS `user_login_details`;
CREATE TABLE `user_login_details` (
  `userId` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `priveledge` int(10) NOT NULL,
  PRIMARY KEY (`password`),
  KEY `userid` (`userId`),
  CONSTRAINT `userid` FOREIGN KEY (`userId`) REFERENCES `user_personal_details` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of user_login_details
-- ----------------------------
INSERT INTO `user_login_details` VALUES ('32603854', 'Ngatata11', '1');

-- ----------------------------
-- Table structure for `user_personal_details`
-- ----------------------------
DROP TABLE IF EXISTS `user_personal_details`;
CREATE TABLE `user_personal_details` (
  `userId` varchar(15) NOT NULL,
  `Fname` varchar(20) NOT NULL,
  `Lname` varchar(20) NOT NULL,
  `DOB` date NOT NULL,
  `Gender` varchar(20) NOT NULL,
  `Residence` varchar(20) NOT NULL,
  `contacts` varchar(20) NOT NULL,
  PRIMARY KEY (`userId`),
  KEY `userId` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of user_personal_details
-- ----------------------------
INSERT INTO `user_personal_details` VALUES ('32603854', 'david', 'munga', '1995-11-24', 'male', 'Chumani', 'mungazuma78@gmail.co');
