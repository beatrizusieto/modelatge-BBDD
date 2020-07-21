-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Amazon
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Amazon
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Amazon` DEFAULT CHARACTER SET utf8 ;
USE `Amazon` ;

-- -----------------------------------------------------
-- Table `Amazon`.`Author`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Amazon`.`Author` (
  `idAuthor` INT NOT NULL,
  `nameAuthor` VARCHAR(45) NULL,
  `emailAuthor` VARCHAR(45) NULL,
  PRIMARY KEY (`idAuthor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Amazon`.`Invoice`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Amazon`.`Invoice` (
  `idInvoice` INT NOT NULL,
  PRIMARY KEY (`idInvoice`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Amazon`.`User`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Amazon`.`User` (
  `idUser` INT NOT NULL,
  `nameUser` VARCHAR(45) NULL,
  `emailUser` VARCHAR(45) NULL,
  `passwordUser` VARCHAR(45) NULL,
  `Invoice_idInvoice` INT NOT NULL,
  PRIMARY KEY (`idUser`),
  INDEX `fk_User_Invoice1_idx` (`Invoice_idInvoice` ASC) VISIBLE,
  CONSTRAINT `fk_User_Invoice1`
    FOREIGN KEY (`Invoice_idInvoice`)
    REFERENCES `Amazon`.`Invoice` (`idInvoice`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Amazon`.`Book`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Amazon`.`Book` (
  `idBook` INT NOT NULL,
  `nameBook` VARCHAR(200) NULL,
  `unitsBook` INT NULL,
  `priceBook` FLOAT NULL,
  `Author_idAuthor` INT NOT NULL,
  `User_idUser` INT NOT NULL,
  `Invoice_idInvoice` INT NOT NULL,
  PRIMARY KEY (`idBook`),
  INDEX `fk_Book_Author_idx` (`Author_idAuthor` ASC) VISIBLE,
  INDEX `fk_Book_User1_idx` (`User_idUser` ASC) VISIBLE,
  INDEX `fk_Book_Invoice1_idx` (`Invoice_idInvoice` ASC) VISIBLE,
  CONSTRAINT `fk_Book_Author`
    FOREIGN KEY (`Author_idAuthor`)
    REFERENCES `Amazon`.`Author` (`idAuthor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Book_User1`
    FOREIGN KEY (`User_idUser`)
    REFERENCES `Amazon`.`User` (`idUser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Book_Invoice1`
    FOREIGN KEY (`Invoice_idInvoice`)
    REFERENCES `Amazon`.`Invoice` (`idInvoice`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `Amazon`.`Author`
-- -----------------------------------------------------
START TRANSACTION;
USE `Amazon`;
INSERT INTO `Amazon`.`Author` (`idAuthor`, `nameAuthor`, `emailAuthor`) VALUES (1, 'Cervantes', 'cervantes@gmail.com');
INSERT INTO `Amazon`.`Author` (`idAuthor`, `nameAuthor`, `emailAuthor`) VALUES (2, 'Shakespeare', 'shakespeare@gmail.com');

COMMIT;


-- -----------------------------------------------------
-- Data for table `Amazon`.`Invoice`
-- -----------------------------------------------------
START TRANSACTION;
USE `Amazon`;
INSERT INTO `Amazon`.`Invoice` (`idInvoice`) VALUES (1);
INSERT INTO `Amazon`.`Invoice` (`idInvoice`) VALUES (2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `Amazon`.`User`
-- -----------------------------------------------------
START TRANSACTION;
USE `Amazon`;
INSERT INTO `Amazon`.`User` (`idUser`, `nameUser`, `emailUser`, `passwordUser`, `Invoice_idInvoice`) VALUES (1, 'Juan', 'juan@gmail.com', 'juan1', 1);
INSERT INTO `Amazon`.`User` (`idUser`, `nameUser`, `emailUser`, `passwordUser`, `Invoice_idInvoice`) VALUES (2, 'Marta', 'marta@gmail.com', 'marta1', 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `Amazon`.`Book`
-- -----------------------------------------------------
START TRANSACTION;
USE `Amazon`;
INSERT INTO `Amazon`.`Book` (`idBook`, `nameBook`, `unitsBook`, `priceBook`, `Author_idAuthor`, `User_idUser`, `Invoice_idInvoice`) VALUES (1, 'El Quijote', 3, 30, 1, 1, 1);
INSERT INTO `Amazon`.`Book` (`idBook`, `nameBook`, `unitsBook`, `priceBook`, `Author_idAuthor`, `User_idUser`, `Invoice_idInvoice`) VALUES (2, 'Romeo y Julieta', 4, 20, 2, 2, 2);

COMMIT;

