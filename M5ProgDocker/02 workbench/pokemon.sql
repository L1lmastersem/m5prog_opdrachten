INSERT INTO `m5prog`.`pokemon` (`element`, `naam`) VALUES ('electric', 'pikachu');

INSERT INTO `m5prog`.`pokemon` (`element`, `naam`) VALUES ('ground', 'geodude');

-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema m5prog
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema m5prog
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `m5prog` DEFAULT CHARACTER SET utf8 ;
USE `m5prog` ;

-- -----------------------------------------------------
-- Table `m5prog`.`pokemon`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `m5prog`.`pokemon` (
  `idpokemon` INT NOT NULL AUTO_INCREMENT,
  `element` VARCHAR(100) NOT NULL,
  `naam` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idpokemon`),
  UNIQUE INDEX `idpokemon_UNIQUE` (`idpokemon` ASC) VISIBLE,
  UNIQUE INDEX `naam_UNIQUE` (`naam` ASC) VISIBLE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
