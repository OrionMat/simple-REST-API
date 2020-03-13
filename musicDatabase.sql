-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema musicDatabase
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema musicDatabase
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `musicDatabase` DEFAULT CHARACTER SET utf8 ;
USE `musicDatabase` ;

-- -----------------------------------------------------
-- Table `musicDatabase`.`Song Orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `musicDatabase`.`Song Orders` (
  `idSong Orders` INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`idSong Orders`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `musicDatabase`.`Artists`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `musicDatabase`.`Artists` (
  `idArtists` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idArtists`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `musicDatabase`.`Songs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `musicDatabase`.`Songs` (
  `idSongs` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(45) NOT NULL,
  `price` DECIMAL(5,2) NOT NULL,
  `duration` TIME NOT NULL,
  `Song Orders_idSong Orders` INT NOT NULL,
  `Artists_idArtists` INT NOT NULL,
  PRIMARY KEY (`idSongs`),
  INDEX `fk_Songs_Song Orders1_idx` (`Song Orders_idSong Orders` ASC) VISIBLE,
  INDEX `fk_Songs_Artists1_idx` (`Artists_idArtists` ASC) VISIBLE,
  CONSTRAINT `fk_Songs_Song Orders1`
    FOREIGN KEY (`Song Orders_idSong Orders`)
    REFERENCES `musicDatabase`.`Song Orders` (`idSong Orders`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Songs_Artists1`
    FOREIGN KEY (`Artists_idArtists`)
    REFERENCES `musicDatabase`.`Artists` (`idArtists`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `musicDatabase`.`Album Orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `musicDatabase`.`Album Orders` (
  `idAlbum Orders` INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`idAlbum Orders`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `musicDatabase`.`Albums`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `musicDatabase`.`Albums` (
  `idAlbums` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(45) NOT NULL,
  `price` DECIMAL(5,2) NOT NULL,
  `Album Orders_idAlbum Orders` INT NOT NULL,
  `Artists_idArtists` INT NOT NULL,
  PRIMARY KEY (`idAlbums`),
  INDEX `fk_Albums_Album Orders1_idx` (`Album Orders_idAlbum Orders` ASC) VISIBLE,
  INDEX `fk_Albums_Artists1_idx` (`Artists_idArtists` ASC) VISIBLE,
  CONSTRAINT `fk_Albums_Album Orders1`
    FOREIGN KEY (`Album Orders_idAlbum Orders`)
    REFERENCES `musicDatabase`.`Album Orders` (`idAlbum Orders`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Albums_Artists1`
    FOREIGN KEY (`Artists_idArtists`)
    REFERENCES `musicDatabase`.`Artists` (`idArtists`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `musicDatabase`.`Song_Album`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `musicDatabase`.`Song_Album` (
  `Songs_idSongs` INT NOT NULL,
  `Albums_idAlbums` INT NOT NULL,
  `track number` INT NULL,
  PRIMARY KEY (`Songs_idSongs`, `Albums_idAlbums`),
  INDEX `fk_Songs_has_Albums_Albums1_idx` (`Albums_idAlbums` ASC) VISIBLE,
  INDEX `fk_Songs_has_Albums_Songs_idx` (`Songs_idSongs` ASC) VISIBLE,
  CONSTRAINT `fk_Songs_has_Albums_Songs`
    FOREIGN KEY (`Songs_idSongs`)
    REFERENCES `musicDatabase`.`Songs` (`idSongs`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Songs_has_Albums_Albums1`
    FOREIGN KEY (`Albums_idAlbums`)
    REFERENCES `musicDatabase`.`Albums` (`idAlbums`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
