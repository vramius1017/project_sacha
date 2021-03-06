SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci ;
USE `mydb` ;

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
-- Table `mydb`.`Reservation`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`Reservation` (
  `idReservation` INT NOT NULL AUTO_INCREMENT ,
  `Date_resa` DATE NOT NULL ,
  PRIMARY KEY (`idReservation`) )
ENGINE = InnoDB;


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
  `Comments` VARCHAR(45) NULL ,
  `Matos_idMatos` INT NOT NULL ,
  `D_idtresp` INT NOT NULL ,
  `Reservation_idRes` INT NOT NULL ,
  PRIMARY KEY (`idDemande`, `Matos_idMatos`, `D_idtresp`, `Reservation_idRes`) ,
  CONSTRAINT `fk_Demande_Matos1`
    FOREIGN KEY (`Matos_idMatos` )
    REFERENCES `mydb`.`Matos` (`idMatos` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Demande_Reservation1`
    FOREIGN KEY (`Reservation_idRes` )
    REFERENCES `mydb`.`Reservation` (`idReservation` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;

CREATE INDEX `fk_Demande_Matos1_idx` ON `mydb`.`Demande` (`Matos_idMatos` ASC) ;

CREATE INDEX `fk_Demande_Reservation1` ON `mydb`.`Demande` (`Reservation_idRes` ASC) ;


-- -----------------------------------------------------
-- Table `mydb`.`Ar`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`Ar` (
  `idAr` INT NOT NULL AUTO_INCREMENT ,
  `Nom_d` VARCHAR(45) NULL ,
  `Date_d` DATE NULL ,
  `Demande_idDemande` INT NOT NULL ,
  `Demande_Matos_idMatos` INT NOT NULL ,
  PRIMARY KEY (`idAr`, `Demande_idDemande`, `Demande_Matos_idMatos`) ,
  CONSTRAINT `fk_Ar_Demande1`
    FOREIGN KEY (`Demande_idDemande` , `Demande_Matos_idMatos` )
    REFERENCES `mydb`.`Demande` (`idDemande` , `Matos_idMatos` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Ar_Demande1_idx` ON `mydb`.`Ar` (`Demande_idDemande` ASC, `Demande_Matos_idMatos` ASC) ;


-- -----------------------------------------------------
-- Table `mydb`.`Tresp`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`Tresp` (
  `idTresp` INT NOT NULL ,
  PRIMARY KEY (`idTresp`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Réponse`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`Réponse` (
  `idRéponse` INT NOT NULL AUTO_INCREMENT ,
  `resp` VARCHAR(45) NULL ,
  `Tresp_idTresp` INT NOT NULL ,
  `Demande_idDemande` INT NOT NULL ,
  `Demande_Matos_idMatos` INT NOT NULL ,
  `Demande_date_use` INT NOT NULL ,
  PRIMARY KEY (`idRéponse`, `Tresp_idTresp`, `Demande_idDemande`, `Demande_Matos_idMatos`, `Demande_date_use`) ,
  CONSTRAINT `fk_Réponse_Tresp1`
    FOREIGN KEY (`Tresp_idTresp` )
    REFERENCES `mydb`.`Tresp` (`idTresp` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Réponse_Demande1`
    FOREIGN KEY (`Demande_idDemande` , `Demande_Matos_idMatos` , `Demande_date_use` )
    REFERENCES `mydb`.`Demande` (`idDemande` , `Matos_idMatos` , `D_idtresp` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Réponse_Tresp1_idx` ON `mydb`.`Réponse` (`Tresp_idTresp` ASC) ;

CREATE INDEX `fk_Réponse_Demande1_idx` ON `mydb`.`Réponse` (`Demande_idDemande` ASC, `Demande_Matos_idMatos` ASC, `Demande_date_use` ASC) ;


-- -----------------------------------------------------
-- Table `mydb`.`Event`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`Event` (
  `idEvent` INT NOT NULL AUTO_INCREMENT ,
  `Name_Event` VARCHAR(45) NULL ,
  `Lieu_event` VARCHAR(45) NULL ,
  `Matos_idMatos` INT NOT NULL ,
  PRIMARY KEY (`idEvent`, `Matos_idMatos`) ,
  CONSTRAINT `fk_Event_Matos1`
    FOREIGN KEY (`Matos_idMatos` )
    REFERENCES `mydb`.`Matos` (`idMatos` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Event_Matos1_idx` ON `mydb`.`Event` (`Matos_idMatos` ASC) ;


-- -----------------------------------------------------
-- Table `mydb`.`Statut`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`Statut` (
  `idStatut` INT NOT NULL ,
  `statut` VARCHAR(45) NULL ,
  `Matos_idMatos` INT NOT NULL ,
  `Reservation_idReservation` INT NOT NULL ,
  PRIMARY KEY (`idStatut`, `Matos_idMatos`, `Reservation_idReservation`) ,
  CONSTRAINT `fk_Statut_Matos1`
    FOREIGN KEY (`Matos_idMatos` )
    REFERENCES `mydb`.`Matos` (`idMatos` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Statut_Reservation1`
    FOREIGN KEY (`Reservation_idReservation` )
    REFERENCES `mydb`.`Reservation` (`idReservation` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;

CREATE UNIQUE INDEX `statut_UNIQUE` ON `mydb`.`Statut` (`statut` ASC) ;

CREATE INDEX `fk_Statut_Matos1` ON `mydb`.`Statut` (`Matos_idMatos` ASC) ;

CREATE INDEX `fk_Statut_Reservation1` ON `mydb`.`Statut` (`Reservation_idReservation` ASC) ;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
