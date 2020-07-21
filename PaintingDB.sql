-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema PaintingDB
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema PaintingDB
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `PaintingDB` DEFAULT CHARACTER SET utf8 ;
USE `PaintingDB` ;

-- -----------------------------------------------------
-- Table `PaintingDB`.`Buyer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PaintingDB`.`Buyer` (
  `idBuyer` INT NOT NULL,
  `firstNameBuyer` VARCHAR(45) NULL,
  `familyNameBuyer` VARCHAR(45) NULL,
  `DNI_Buyer` INT(8) NULL,
  PRIMARY KEY (`idBuyer`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PaintingDB`.`Painting`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PaintingDB`.`Painting` (
  `idPainting` INT NOT NULL,
  `pricePainting` FLOAT NULL,
  `authorPainting` VARCHAR(45) NULL,
  `Buyer_idBuyer` INT NOT NULL,
  PRIMARY KEY (`idPainting`),
  INDEX `fk_Painting_Buyer_idx` (`Buyer_idBuyer` ASC) VISIBLE,
  CONSTRAINT `fk_Painting_Buyer`
    FOREIGN KEY (`Buyer_idBuyer`)
    REFERENCES `PaintingDB`.`Buyer` (`idBuyer`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `PaintingDB`.`Buyer`
-- -----------------------------------------------------
START TRANSACTION;
USE `PaintingDB`;
INSERT INTO `PaintingDB`.`Buyer` (`idBuyer`, `firstNameBuyer`, `familyNameBuyer`, `DNI_Buyer`) VALUES (1, 'John', 'Smith', 38769090);
INSERT INTO `PaintingDB`.`Buyer` (`idBuyer`, `firstNameBuyer`, `familyNameBuyer`, `DNI_Buyer`) VALUES (2, 'María', 'Güell', 67897980);
INSERT INTO `PaintingDB`.`Buyer` (`idBuyer`, `firstNameBuyer`, `familyNameBuyer`, `DNI_Buyer`) VALUES (3, 'Federica', 'Verdi', 68790900);

COMMIT;


-- -----------------------------------------------------
-- Data for table `PaintingDB`.`Painting`
-- -----------------------------------------------------
START TRANSACTION;
USE `PaintingDB`;
INSERT INTO `PaintingDB`.`Painting` (`idPainting`, `pricePainting`, `authorPainting`, `Buyer_idBuyer`) VALUES (1, 300000, 'Dalí', 3);
INSERT INTO `PaintingDB`.`Painting` (`idPainting`, `pricePainting`, `authorPainting`, `Buyer_idBuyer`) VALUES (2, 50000, 'Sorolla', 1);
INSERT INTO `PaintingDB`.`Painting` (`idPainting`, `pricePainting`, `authorPainting`, `Buyer_idBuyer`) VALUES (3, 500000, 'Picasso', 2);

COMMIT;

