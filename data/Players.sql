SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Players
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema PlayersPlayerstats_UserIDSlot4Playerstats_UserID
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Players` DEFAULT CHARACTER SET utf8mb4 ;
USE `Players` ;

-- -----------------------------------------------------
-- Table `Players`.`Playerstats`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Players`.`Playerstats` (
  `UserID` VARCHAR(45) NOT NULL,
  `Description` VARCHAR(45) NULL,
  `LVL` INT NULL DEFAULT 1,
  `EXP` INT NULL DEFAULT 0,
  `STR` INT NULL DEFAULT 5,
  `DEX` INT NULL DEFAULT 5,
  `PREC` INT NULL DEFAULT 5,
  `PERC` INT NULL DEFAULT 5,
  PRIMARY KEY (`UserID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Players`.`Equipment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Players`.`Equipment` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Slot1` VARCHAR(45) NULL DEFAULT 'Makarov',
  `Slot2` VARCHAR(45) NULL DEFAULT 'EMPTY',
  `Slot3` VARCHAR(45) NULL DEFAULT 'EMPTY',
  `Slot4` VARCHAR(45) NULL DEFAULT 'EMPTY',
  `Playerstats_UserID` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID`, `Playerstats_UserID`),
  INDEX `fk_Equipment_Playerstats_idx` (`Playerstats_UserID` ASC) VISIBLE,
  CONSTRAINT `fk_Equipment_Playerstats`
    FOREIGN KEY (`Playerstats_UserID`)
    REFERENCES `Players`.`Playerstats` (`UserID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Players`.`Weapons`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Players`.`Weapons` (
  `Weapon` VARCHAR(12) NOT NULL,
  `Damage` INT NULL,
  `FULL-AUTO-AMNT` INT NULL,
  `Range` VARCHAR(8) NULL,
  PRIMARY KEY (`Weapon`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Players`.`Stash`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Players`.`Stash` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `InventoryPath` VARCHAR(45) NULL,
  `Playerstats_UserID` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID`, `Playerstats_UserID`),
  INDEX `fk_Stash_Playerstats1_idx` (`Playerstats_UserID` ASC) VISIBLE,
  CONSTRAINT `fk_Stash_Playerstats1`
    FOREIGN KEY (`Playerstats_UserID`)
    REFERENCES `Players`.`Playerstats` (`UserID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Players`.`PlayersInRaid`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Players`.`PlayersInRaid` (
  `UserID` VARCHAR (45) NOT NULL,
  `STR` INT(5) DEFAULT NULL,
  `DEX` INT(5) DEFAULT NULL,
  `PREC` INT(5) DEFAULT NULL,
  `PERC` INT(5) DEFAULT NULL,
  `HeadHP` INT(5) DEFAULT 35,
  `ChestHP` INT(5) DEFAULT 80,
  `Stomach` INT(5) DEFAULT 70,
  `Arms` INT (5) DEFAULT 120,
  `Legs` INT (5) DEFAULT 130,
  PRIMARY KEY (`UserID`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `Players`.`Items`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Players`.`Items` (
  `Item` VARCHAR(45) NOT NULL,
  `Description` TINYTEXT NULL,
  PRIMARY KEY (`Item`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
