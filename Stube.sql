-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Stube
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Stube
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Stube` DEFAULT CHARACTER SET utf8 ;
USE `Stube` ;

-- -----------------------------------------------------
-- Table `Stube`.`User`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Stube`.`User` (
  `idUser` INT NOT NULL,
  `emailUser` VARCHAR(45) NULL,
  `passwordUser` VARCHAR(45) NULL,
  PRIMARY KEY (`idUser`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Stube`.`Video`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Stube`.`Video` (
  `idYouTube` VARCHAR(45) NOT NULL,
  `descriptionVideo` VARCHAR(200) NULL,
  `titleVideo` VARCHAR(100) NULL,
  `urlVideo` VARCHAR(100) NULL,
  `User_idUser` INT NOT NULL,
  PRIMARY KEY (`idYouTube`),
  INDEX `fk_Video_User_idx` (`User_idUser` ASC) VISIBLE,
  CONSTRAINT `fk_Video_User`
    FOREIGN KEY (`User_idUser`)
    REFERENCES `Stube`.`User` (`idUser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `Stube`.`User`
-- -----------------------------------------------------
START TRANSACTION;
USE `Stube`;
INSERT INTO `Stube`.`User` (`idUser`, `emailUser`, `passwordUser`) VALUES (1, 'pepe@gmail.com', 'pepe1');
INSERT INTO `Stube`.`User` (`idUser`, `emailUser`, `passwordUser`) VALUES (2, 'maria@gmail.com', 'maria1');

COMMIT;


-- -----------------------------------------------------
-- Data for table `Stube`.`Video`
-- -----------------------------------------------------
START TRANSACTION;
USE `Stube`;
INSERT INTO `Stube`.`Video` (`idYouTube`, `descriptionVideo`, `titleVideo`, `urlVideo`, `User_idUser`) VALUES ('3XlZWpLwvvo', 'Cómo usar GIT y Github', 'Tutorial GIT y Github', 'https://www.youtube.com/watch?v=3XlZWpLwvvo', 1);
INSERT INTO `Stube`.`Video` (`idYouTube`, `descriptionVideo`, `titleVideo`, `urlVideo`, `User_idUser`) VALUES ('8e4iMLTDy4w', 'Vídeo sobre SQL', '¿Qué es SQL?', 'https://www.youtube.com/watch?v=8e4iMLTDy4w', 2);
INSERT INTO `Stube`.`Video` (`idYouTube`, `descriptionVideo`, `titleVideo`, `urlVideo`, `User_idUser`) VALUES ('ehzh2WM9vVI', 'Review distribuciones Linux', 'Top 5 distribuciones de Linux', 'https://www.youtube.com/watch?v=ehzh2WM9vVI', 1);

COMMIT;

