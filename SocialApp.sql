-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema SocialApp
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema SocialApp
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `SocialApp` DEFAULT CHARACTER SET utf8 ;
USE `SocialApp` ;

-- -----------------------------------------------------
-- Table `SocialApp`.`User`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SocialApp`.`User` (
  `idUser` INT NOT NULL AUTO_INCREMENT,
  `nameUser` VARCHAR(45) NULL,
  `emailUser` VARCHAR(45) NULL,
  `passwordUser` VARCHAR(45) NULL,
  PRIMARY KEY (`idUser`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SocialApp`.`Friends`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SocialApp`.`Friends` (
  `idFriend` INT NOT NULL,
  `howTheyMeet` VARCHAR(200) NULL,
  `User_idUser` INT NOT NULL,
  PRIMARY KEY (`idFriend`),
  INDEX `fk_Friends_User1_idx` (`User_idUser` ASC) VISIBLE,
  CONSTRAINT `fk_Friends_User1`
    FOREIGN KEY (`User_idUser`)
    REFERENCES `SocialApp`.`User` (`idUser`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SocialApp`.`Photo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SocialApp`.`Photo` (
  `idPhoto` VARCHAR(45) NOT NULL,
  `placePhoto` VARCHAR(45) NULL,
  `urlPhoto` VARCHAR(200) NULL,
  `User_idUser` INT NOT NULL,
  PRIMARY KEY (`idPhoto`),
  INDEX `fk_Photo_User1_idx` (`User_idUser` ASC) VISIBLE,
  CONSTRAINT `fk_Photo_User1`
    FOREIGN KEY (`User_idUser`)
    REFERENCES `SocialApp`.`User` (`idUser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `SocialApp`.`User`
-- -----------------------------------------------------
START TRANSACTION;
USE `SocialApp`;
INSERT INTO `SocialApp`.`User` (`idUser`, `nameUser`, `emailUser`, `passwordUser`) VALUES (1, 'Pedro', 'pedro@gmail.com', 'pedro1');
INSERT INTO `SocialApp`.`User` (`idUser`, `nameUser`, `emailUser`, `passwordUser`) VALUES (2, 'Maria', 'maria@gmail.com', 'maria1');

COMMIT;


-- -----------------------------------------------------
-- Data for table `SocialApp`.`Friends`
-- -----------------------------------------------------
START TRANSACTION;
USE `SocialApp`;
INSERT INTO `SocialApp`.`Friends` (`idFriend`, `howTheyMeet`, `User_idUser`) VALUES (1, 'amigos', 1);
INSERT INTO `SocialApp`.`Friends` (`idFriend`, `howTheyMeet`, `User_idUser`) VALUES (2, 'primos', 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `SocialApp`.`Photo`
-- -----------------------------------------------------
START TRANSACTION;
USE `SocialApp`;
INSERT INTO `SocialApp`.`Photo` (`idPhoto`, `placePhoto`, `urlPhoto`, `User_idUser`) VALUES ('1', 'Madrid', 'http://madrid.com', 1);
INSERT INTO `SocialApp`.`Photo` (`idPhoto`, `placePhoto`, `urlPhoto`, `User_idUser`) VALUES ('2', 'Sevilla', 'http://Sevilla.org', 2);

COMMIT;

