-- ---
-- Globals
-- ---

-- SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
-- SET FOREIGN_KEY_CHECKS=0;

-- ---
-- Table 'OCRD'
-- 
-- ---

DROP TABLE IF EXISTS `OCRD`;
		
CREATE TABLE `OCRD` (
  `CardCode` VARCHAR(15) NOT NULL,
  `CardName` VARCHAR(100) NOT NULL,
  `CardType` VARCHAR(10) NOT NULL,
  `GroupCode` INT NULL DEFAULT NULL,
  `Phone1` VARCHAR(20) NULL DEFAULT NULL,
  `EmailAddress` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`CardCode`)
);

-- ---
-- Table 'CRD1'
-- 
-- ---

DROP TABLE IF EXISTS `CRD1`;
		
CREATE TABLE `CRD1` (
  `AddressID` INT NOT NULL AUTO_INCREMENT,
  `CardCode_OCRD` VARCHAR(15) NOT NULL,
  `CardCode` VARCHAR(15) NOT NULL,
  `Address` VARCHAR(100) NOT NULL,
  `City` VARCHAR(50) NULL DEFAULT NULL,
  `State` VARCHAR(50) NULL DEFAULT NULL,
  `ZipCode` VARCHAR(20) NULL DEFAULT NULL,
  PRIMARY KEY (`AddressID`),
KEY (`CardCode`)
);

-- ---
-- Table 'CRD7'
-- 
-- ---

DROP TABLE IF EXISTS `CRD7`;
		
CREATE TABLE `CRD7` (
  `SegmentID` INT NOT NULL AUTO_INCREMENT,
  `CardCode_OCRD` VARCHAR(15) NOT NULL,
  `CardCode` VARCHAR(15) NOT NULL,
  `SegmentName` VARCHAR(50) NOT NULL,
  `TaxId1` INTEGER NULL DEFAULT NULL,
  `TaxId2` INTEGER NULL DEFAULT NULL,
  `TaxId3` INTEGER NULL DEFAULT NULL,
  `TaxId4` INTEGER NULL DEFAULT NULL,
  `TaxId5` INTEGER NULL DEFAULT NULL,
  `TaxId6` INTEGER NULL DEFAULT NULL,
  `TaxId7` INTEGER NULL DEFAULT NULL,
  `TaxId8` INTEGER NULL DEFAULT NULL,
  `TaxId9` INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (`SegmentID`),
KEY (`CardCode`)
);

-- ---
-- Table 'OCRB'
-- 
-- ---

DROP TABLE IF EXISTS `OCRB`;
		
CREATE TABLE `OCRB` (
  `BankID` INT NOT NULL AUTO_INCREMENT,
  `CardCode` VARCHAR(15) NOT NULL,
  `BankName` VARCHAR(100) NOT NULL,
  `AccountNumber` VARCHAR(20) NOT NULL,
  `Branch` VARCHAR(50) NULL DEFAULT NULL,
  `CardCode_OCRD` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`BankID`),
KEY (`CardCode`)
);

-- ---
-- Foreign Keys 
-- ---

ALTER TABLE `CRD1` ADD FOREIGN KEY (CardCode_OCRD) REFERENCES `OCRD` (`CardCode`);
ALTER TABLE `CRD7` ADD FOREIGN KEY (CardCode_OCRD) REFERENCES `OCRD` (`CardCode`);
ALTER TABLE `OCRB` ADD FOREIGN KEY (CardCode_OCRD) REFERENCES `OCRD` (`CardCode`);

-- ---
-- Table Properties
-- ---

-- ALTER TABLE `OCRD` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `CRD1` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `CRD7` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `OCRB` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ---
-- Test Data
-- ---

-- INSERT INTO `OCRD` (`CardCode`,`CardName`,`CardType`,`GroupCode`,`Phone1`,`EmailAddress`) VALUES
-- ('','','','','','');
-- INSERT INTO `CRD1` (`AddressID`,`CardCode_OCRD`,`CardCode`,`Address`,`City`,`State`,`ZipCode`) VALUES
-- ('','','','','','','');
-- INSERT INTO `CRD7` (`SegmentID`,`CardCode_OCRD`,`CardCode`,`SegmentName`,`TaxId1`,`TaxId2`,`TaxId3`,`TaxId4`,`TaxId5`,`TaxId6`,`TaxId7`,`TaxId8`,`TaxId9`) VALUES
-- ('','','','','','','','','','','','','');
-- INSERT INTO `OCRB` (`BankID`,`CardCode`,`BankName`,`AccountNumber`,`Branch`,`CardCode_OCRD`) VALUES
-- ('','','','','','');