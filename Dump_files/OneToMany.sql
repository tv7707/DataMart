-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema SalesOrder
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema SalesOrder
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `SalesOrder` DEFAULT CHARACTER SET utf8 ;
USE `SalesOrder` ;

-- -----------------------------------------------------
-- Table `SalesOrder`.`Customer_Dimension`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SalesOrder`.`Customer_Dimension` (
  `Customer_sk` INT NOT NULL,
  `Customer_id` INT NULL,
  `Name` VARCHAR(45) NULL,
  `Addr1` VARCHAR(50) NULL,
  `Addr2` VARCHAR(50) NULL,
  `City` VARCHAR(50) NULL,
  `State` VARCHAR(2) NULL,
  `Zip` CHAR(15) NULL,
  `typeName` VARCHAR(20) NULL,
  `CustomerTypeID` VARCHAR(1) NULL,
  `CurrentFlag` TINYINT(1) NULL,
  `EffectiveDate` DATE NULL,
  `ExpirationDate` DATE NULL,
  `source` VARCHAR(45) NULL,
  PRIMARY KEY (`Customer_sk`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SalesOrder`.`Product_Dimension`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SalesOrder`.`Product_Dimension` (
  `Product_sk` INT NOT NULL,
  `prodDescription` VARCHAR(45) NULL,
  `prodtypeID` INT NULL,
  `Name` VARCHAR(45) NULL,
  `Abbrev` VARCHAR(45) NULL,
  `unitCost` VARCHAR(45) NULL,
  `price1` DECIMAL(10,2) NULL,
  `price2` DECIMAL(10,2) NULL,
  `prodid` INT NULL,
  `BUID` VARCHAR(45) NULL,
  `CurrentFlag` TINYINT(1) NULL,
  `EffectiveDate` DATE NULL,
  `ExpirationDate` DATE NULL,
  `source` VARCHAR(45) NULL,
  `typeDescription` VARCHAR(45) NULL,
  PRIMARY KEY (`Product_sk`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SalesOrder`.`Supplier_Dimension`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SalesOrder`.`Supplier_Dimension` (
  `Supplier_sk` INT NOT NULL,
  `supplierName` VARCHAR(45) NULL,
  `supplierAddr1` VARCHAR(45) NULL,
  `supplierAddr2` VARCHAR(45) NULL,
  `supplierCity` VARCHAR(45) NULL,
  `supplierState` VARCHAR(45) NULL,
  `supplierZipcode` INT NULL,
  `CurrentFlag` TINYINT(1) NULL,
  `ExpirationDate` DATE NULL,
  `EffectiveDate` DATE NULL,
  `Supplier_ID` VARCHAR(45) NULL,
  `source` VARCHAR(45) NULL,
  PRIMARY KEY (`Supplier_sk`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SalesOrder`.`Sale_Date_Dimension`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SalesOrder`.`Sale_Date_Dimension` (
  `saleDate_sk` INT NOT NULL,
  `CalendarDay` VARCHAR(45) NULL,
  `CalendarWeek` VARCHAR(45) NULL,
  `CalendarQuater` VARCHAR(45) NULL,
  `CalendarMonth` VARCHAR(45) NULL,
  `CalendarYear` VARCHAR(45) NULL,
  `Fiscalday` VARCHAR(45) NULL,
  `FiscalWeek` VARCHAR(45) NULL,
  `FiscalQuarter` VARCHAR(45) NULL,
  `fiscalMonth` VARCHAR(45) NULL,
  `FiscalYear` VARCHAR(45) NULL,
  `Date` VARCHAR(45) NULL,
  PRIMARY KEY (`saleDate_sk`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SalesOrder`.`Order_Date_Dimension`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SalesOrder`.`Order_Date_Dimension` (
  `orderDate_sk` INT NOT NULL,
  `CalendarDay` VARCHAR(45) NULL,
  `CalendarWeek` VARCHAR(45) NULL,
  `CalendarQuarter` VARCHAR(45) NULL,
  `CalendarMonth` VARCHAR(45) NULL,
  `CalendarYear` VARCHAR(45) NULL,
  `FiscalDay` VARCHAR(45) NULL,
  `FiscalWeek` VARCHAR(45) NULL,
  `FiscalQuarter` VARCHAR(45) NULL,
  `FiscalMonth` VARCHAR(45) NULL,
  `FiscalYear` VARCHAR(45) NULL,
  `Date` DATE NULL,
  PRIMARY KEY (`orderDate_sk`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SalesOrder`.`Transaction_Profile_Dimension`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SalesOrder`.`Transaction_Profile_Dimension` (
  `transactionProfile_sk` INT NOT NULL,
  `paymentMethod` VARCHAR(45) NULL,
  `shippingMethod` VARCHAR(45) NULL,
  `orderingMethod` VARCHAR(45) NULL,
  `source` VARCHAR(45) NULL,
  PRIMARY KEY (`transactionProfile_sk`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SalesOrder`.`Sales_Fact`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SalesOrder`.`Sales_Fact` (
  `Customer_sk` INT NOT NULL,
  `Product_sk` INT NOT NULL,
  `Supplier_sk` INT NOT NULL,
  `TransactionProfile_sk` INT NOT NULL,
  `orderdate_sk` INT NOT NULL,
  `saleDate_sk` INT NOT NULL,
  `invoiceID(DD)` VARCHAR(45) NULL,
  `shipCost` VARCHAR(45) NULL,
  `daysToShip` VARCHAR(45) NULL,
  `discounted` VARCHAR(45) NULL,
  `source` VARCHAR(45) NULL,
  `qty` INT NULL,
  `salesAmount` VARCHAR(45) NULL)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SalesOrder`.`Shipping_Dimension`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SalesOrder`.`Shipping_Dimension` (
  `Shipping_sk` INT NOT NULL,
  `Company_Name` VARCHAR(45) NULL,
  `CompanyAddr1` VARCHAR(45) NULL,
  `CompanyAddr2` VARCHAR(45) NULL,
  `CompanyCity` VARCHAR(45) NULL,
  `CompanyState` VARCHAR(45) NULL,
  `CompanyZip` VARCHAR(45) NULL,
  `Shipping_id` INT NULL,
  PRIMARY KEY (`Shipping_sk`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SalesOrder`.`Supplier_Shipping_Dimension`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SalesOrder`.`Supplier_Shipping_Dimension` (
  `Supplier_Dimension_Supplier_sk` INT NOT NULL,
  `Shipping_Dimension_Shipping_sk` INT NOT NULL)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
