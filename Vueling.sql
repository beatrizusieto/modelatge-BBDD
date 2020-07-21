-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema vueling
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema vueling
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `vueling` DEFAULT CHARACTER SET utf8 ;
USE `vueling` ;

-- -----------------------------------------------------
-- Table `vueling`.`Avions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vueling`.`Avions` (
  `id_avions` INT NOT NULL,
  `capacitat` INT NULL,
  `model` VARCHAR(45) NULL,
  PRIMARY KEY (`id_avions`),
  UNIQUE INDEX `id_avions_UNIQUE` (`id_avions` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `vueling`.`Seients`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vueling`.`Seients` (
  `id_seient` INT NOT NULL,
  `id_avions` INT NOT NULL,
  UNIQUE INDEX `id_seient_UNIQUE` (`id_seient` ASC) VISIBLE,
  INDEX `fk_Seients_Avions_idx` (`id_avions` ASC) VISIBLE,
  PRIMARY KEY (`id_seient`),
  CONSTRAINT `fk_Seients_Avions`
    FOREIGN KEY (`id_avions`)
    REFERENCES `vueling`.`Avions` (`id_avions`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `vueling`.`Avions`
-- -----------------------------------------------------
START TRANSACTION;
USE `vueling`;
INSERT INTO `vueling`.`Avions` (`id_avions`, `capacitat`, `model`) VALUES (1, 124, 'Airbus A319-100');
INSERT INTO `vueling`.`Avions` (`id_avions`, `capacitat`, `model`) VALUES (2, 150, 'Airbus A320 neo');
INSERT INTO `vueling`.`Avions` (`id_avions`, `capacitat`, `model`) VALUES (3, 150, 'Airbus A320-200');
INSERT INTO `vueling`.`Avions` (`id_avions`, `capacitat`, `model`) VALUES (4, 185, 'Airbus A321-200');

COMMIT;


-- -----------------------------------------------------
-- Data for table `vueling`.`Seients`
-- -----------------------------------------------------
START TRANSACTION;
USE `vueling`;
INSERT INTO `vueling`.`Seients` (`id_seient`, `id_avions`) VALUES (1, 2);
INSERT INTO `vueling`.`Seients` (`id_seient`, `id_avions`) VALUES (2, 4);
INSERT INTO `vueling`.`Seients` (`id_seient`, `id_avions`) VALUES (3, 3);
INSERT INTO `vueling`.`Seients` (`id_seient`, `id_avions`) VALUES (4, 2);

COMMIT;

