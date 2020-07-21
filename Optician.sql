-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Optician
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Optician
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Optician` DEFAULT CHARACTER SET utf8 ;
USE `Optician` ;

-- -----------------------------------------------------
-- Table `Optician`.`Supplier`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Optician`.`Supplier` (
  `idSupplier` INT NOT NULL,
  `nameSupplier` VARCHAR(45) NULL,
  `adressSupplier` VARCHAR(400) NULL,
  `telephoneSupplier` VARCHAR(13) NULL,
  `faxSupplier` VARCHAR(13) NULL,
  `nifSupplier` VARCHAR(13) NULL,
  PRIMARY KEY (`idSupplier`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Optician`.`Friend`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Optician`.`Friend` (
  `idFriend` INT NOT NULL,
  PRIMARY KEY (`idFriend`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Optician`.`Client`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Optician`.`Client` (
  `idClient` INT NOT NULL,
  `nameClient` VARCHAR(45) NULL,
  `adressClient` VARCHAR(400) NULL,
  `telephoneClient` VARCHAR(45) NULL,
  `emailClient` VARCHAR(45) NULL,
  `date` DATE NULL,
  `Friend_idFriend` INT NOT NULL,
  PRIMARY KEY (`idClient`),
  INDEX `fk_Client_Friend1_idx` (`Friend_idFriend` ASC) VISIBLE,
  CONSTRAINT `fk_Client_Friend1`
    FOREIGN KEY (`Friend_idFriend`)
    REFERENCES `Optician`.`Friend` (`idFriend`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Optician`.`Employee`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Optician`.`Employee` (
  `idEmployee` INT NOT NULL,
  `firstNameEmployee` VARCHAR(45) NULL,
  `familyNameEmployee` VARCHAR(45) NULL,
  PRIMARY KEY (`idEmployee`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Optician`.`Glasses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Optician`.`Glasses` (
  `idGlasses` INT NOT NULL,
  `brandGlasses` VARCHAR(45) NULL,
  `gradationR` DECIMAL NULL,
  `gradationL` DECIMAL NULL,
  `typeOfFrame` VARCHAR(45) NULL,
  `colorOfFrame` VARCHAR(45) NULL,
  `colorGlassR` VARCHAR(45) NULL,
  `colorGlassL` VARCHAR(45) NULL,
  `priceGlasses` FLOAT NULL,
  `Supplier_idSupplier` INT NOT NULL,
  `Client_idClient` INT NOT NULL,
  `Employee_idEmployee` INT NOT NULL,
  PRIMARY KEY (`idGlasses`),
  INDEX `fk_Glasses_Supplier_idx` (`Supplier_idSupplier` ASC) VISIBLE,
  INDEX `fk_Glasses_Client1_idx` (`Client_idClient` ASC) VISIBLE,
  INDEX `fk_Glasses_Employee1_idx` (`Employee_idEmployee` ASC) VISIBLE,
  CONSTRAINT `fk_Glasses_Supplier`
    FOREIGN KEY (`Supplier_idSupplier`)
    REFERENCES `Optician`.`Supplier` (`idSupplier`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Glasses_Client1`
    FOREIGN KEY (`Client_idClient`)
    REFERENCES `Optician`.`Client` (`idClient`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Glasses_Employee1`
    FOREIGN KEY (`Employee_idEmployee`)
    REFERENCES `Optician`.`Employee` (`idEmployee`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `Optician`.`Supplier`
-- -----------------------------------------------------
START TRANSACTION;
USE `Optician`;
INSERT INTO `Optician`.`Supplier` (`idSupplier`, `nameSupplier`, `adressSupplier`, `telephoneSupplier`, `faxSupplier`, `nifSupplier`) VALUES (1, 'Indo', 'Carrer Gran 23 4 2 Barcelona 08880 España', '+346897090', '+34670900', '46777777Z');
INSERT INTO `Optician`.`Supplier` (`idSupplier`, `nameSupplier`, `adressSupplier`, `telephoneSupplier`, `faxSupplier`, `nifSupplier`) VALUES (2, 'Lu Xi', 'Tokio Street 200 3 1 Tokio 0090 Japon ', '+46898980', '+45600606', '34567878X');

COMMIT;


-- -----------------------------------------------------
-- Data for table `Optician`.`Friend`
-- -----------------------------------------------------
START TRANSACTION;
USE `Optician`;
INSERT INTO `Optician`.`Friend` (`idFriend`) VALUES (1);
INSERT INTO `Optician`.`Friend` (`idFriend`) VALUES (2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `Optician`.`Client`
-- -----------------------------------------------------
START TRANSACTION;
USE `Optician`;
INSERT INTO `Optician`.`Client` (`idClient`, `nameClient`, `adressClient`, `telephoneClient`, `emailClient`, `date`, `Friend_idFriend`) VALUES (1, 'Pedro Garcia', 'avinguda Mataró 200 5 1 00840 Figueres', '34567899', 'pedro@gmail.com', '2015-04-01', 1);
INSERT INTO `Optician`.`Client` (`idClient`, `nameClient`, `adressClient`, `telephoneClient`, `emailClient`, `date`, `Friend_idFriend`) VALUES (2, 'Maria Vidal', 'avinguda Mistral 200 5 1 00840 Martorell', '34565656', 'maria@gmail.com', '2019-03-02', 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `Optician`.`Employee`
-- -----------------------------------------------------
START TRANSACTION;
USE `Optician`;
INSERT INTO `Optician`.`Employee` (`idEmployee`, `firstNameEmployee`, `familyNameEmployee`) VALUES (1, 'Rodrigo', 'Martinez');
INSERT INTO `Optician`.`Employee` (`idEmployee`, `firstNameEmployee`, `familyNameEmployee`) VALUES (2, 'Sara', 'Llull');

COMMIT;


-- -----------------------------------------------------
-- Data for table `Optician`.`Glasses`
-- -----------------------------------------------------
START TRANSACTION;
USE `Optician`;
INSERT INTO `Optician`.`Glasses` (`idGlasses`, `brandGlasses`, `gradationR`, `gradationL`, `typeOfFrame`, `colorOfFrame`, `colorGlassR`, `colorGlassL`, `priceGlasses`, `Supplier_idSupplier`, `Client_idClient`, `Employee_idEmployee`) VALUES (1, 'Indo', 2, 3, 'flotant', 'vermell', 'blau', 'blau', 400, 1, 1, 1);
INSERT INTO `Optician`.`Glasses` (`idGlasses`, `brandGlasses`, `gradationR`, `gradationL`, `typeOfFrame`, `colorOfFrame`, `colorGlassR`, `colorGlassL`, `priceGlasses`, `Supplier_idSupplier`, `Client_idClient`, `Employee_idEmployee`) VALUES (2, 'Dino', 6, 5, 'pasta', 'groc', 'gris', 'gris', 500, 2, 2, 2);

COMMIT;

