SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';


CREATE SCHEMA IF NOT EXISTS `verkauf` DEFAULT CHARACTER SET utf8 ;
USE `verkauf` ;

-- -----------------------------------------------------
-- Table `verkauf`.`hersteller`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `verkauf`.`hersteller` (
  `herstellernummer` INT(11) NOT NULL,
  `herstellername` CHAR(30) NULL DEFAULT NULL,
  `land` CHAR(30) NULL DEFAULT NULL,
  PRIMARY KEY (`herstellernummer`),
  INDEX `herstellerindex` (`herstellername` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `verkauf`.`artikel`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `verkauf`.`artikel` (
  `artikelnummer` INT(11) NOT NULL,
  `herstellernummer` INT(11) NOT NULL,
  `artikelname` CHAR(50) NULL DEFAULT NULL,
  `preis` DECIMAL(7,2) NULL DEFAULT NULL,
  PRIMARY KEY (`artikelnummer`),
  INDEX `artikelindex` (`artikelname` ASC),
  INDEX `fk_artikel_hersteller1_idx` (`herstellernummer` ASC),
  CONSTRAINT `fk1`
    FOREIGN KEY (`herstellernummer`)
    REFERENCES `verkauf`.`hersteller` (`herstellernummer`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `verkauf`.`person`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `verkauf`.`person` (
  `personennummer` INT(11) NOT NULL,
  `nachname` CHAR(20) NULL DEFAULT NULL,
  `vorname` CHAR(20) NULL DEFAULT NULL,
  `strasse` CHAR(30) NULL DEFAULT NULL,
  `ort` CHAR(30) NULL DEFAULT NULL,
  `plz` INT(11) NULL DEFAULT NULL,
  `land` CHAR(20) NULL DEFAULT NULL,
  `geburtsdatum` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`personennummer`),
  INDEX `personenindex` (`nachname` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `verkauf`.`bestellung`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `verkauf`.`bestellung` (
  `bestellnummer` INT(11) NOT NULL AUTO_INCREMENT,
  `artikelnummer` INT(11) NOT NULL,
  `kundennummer` INT(11) NOT NULL,
  `artikelanzahl` INT(11) NULL DEFAULT NULL,
  `bestellsumme` DECIMAL(7,2) NULL DEFAULT NULL,
  PRIMARY KEY (`bestellnummer`),
  CONSTRAINT `fk2`
    FOREIGN KEY (`artikelnummer`)
    REFERENCES `verkauf`.`artikel` (`artikelnummer`)
    ON DELETE CASCADE,
  CONSTRAINT `fk3`
    FOREIGN KEY (`kundennummer`)
    REFERENCES `verkauf`.`person` (`personennummer`)
    ON DELETE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
