SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Demande`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`Demande` (
  `idDemande` INT NOT NULL AUTO_INCREMENT ,
  `Nom` VARCHAR(45) NULL ,
  `Prenom` VARCHAR(45) NULL ,
  `Email` VARCHAR(45) NULL ,
  `Lab` VARCHAR(45) NULL ,
  `Adress` VARCHAR(45) NULL ,
  `Date_demande` DATE NULL ,
  `Date_use` DATE NULL ,
  `Comments` VARCHAR(45) NULL ,
  PRIMARY KEY (`idDemande`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;


-- -----------------------------------------------------
-- Table `mydb`.`Ar`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`Ar` (
  `idAr` INT NOT NULL AUTO_INCREMENT ,
  `Nom_d` VARCHAR(45) NULL ,
  `Date_d` DATE NULL ,
  PRIMARY KEY (`idAr`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Réponse`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`Réponse` (
  `idRéponse` INT NOT NULL AUTO_INCREMENT ,
  `resp` VARCHAR(45) NULL ,
  PRIMARY KEY (`idRéponse`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Event`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`Event` (
  `idEvent` INT NOT NULL AUTO_INCREMENT ,
  `Name_Event` VARCHAR(45) NULL ,
  `Lieu_event` VARCHAR(45) NULL ,
  PRIMARY KEY (`idEvent`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Matos`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`Matos` (
  `idMatos` INT NOT NULL ,
  `name` VARCHAR(45) NULL ,
  `description` VARCHAR(45) NULL ,
  PRIMARY KEY (`idMatos`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Tresp`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`Tresp` (
  `idTresp` INT NOT NULL ,
  PRIMARY KEY (`idTresp`) )
ENGINE = InnoDB;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
