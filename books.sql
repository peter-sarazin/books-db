-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema books
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `books` ;

-- -----------------------------------------------------
-- Schema books
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `books` DEFAULT CHARACTER SET latin1 ;
USE `books` ;

-- -----------------------------------------------------
-- Table `books`.`person`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `books`.`person` ;

CREATE TABLE IF NOT EXISTS `books`.`person` (
  `person_id` INT(10) NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(20) NULL DEFAULT NULL,
  `middle_name` VARCHAR(20) NULL DEFAULT NULL,
  `last_name` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`person_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `books`.`book_title`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `books`.`book_title` ;

CREATE TABLE IF NOT EXISTS `books`.`book_title` (
  `book_title_id` INT(10) NOT NULL,
  `title` VARCHAR(255) NOT NULL,
  `subtitle` VARCHAR(255) NULL,
  `volume` INT(10) NULL,
  `volume_title` VARCHAR(255) NULL,
  PRIMARY KEY (`book_title_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `books`.`publisher`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `books`.`publisher` ;

CREATE TABLE IF NOT EXISTS `books`.`publisher` (
  `publisher_id` INT(10) NOT NULL AUTO_INCREMENT,
  `publisher_name` VARCHAR(45) NULL DEFAULT NULL,
  `url` VARCHAR(255) NULL,
  PRIMARY KEY (`publisher_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `books`.`series`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `books`.`series` ;

CREATE TABLE IF NOT EXISTS `books`.`series` (
  `series_id` INT(10) NOT NULL AUTO_INCREMENT,
  `series_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`series_id`))
ENGINE = InnoDB
KEY_BLOCK_SIZE = 16;


-- -----------------------------------------------------
-- Table `books`.`book`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `books`.`book` ;

CREATE TABLE IF NOT EXISTS `books`.`book` (
  `book_id` INT NOT NULL AUTO_INCREMENT,
  `book_title_id` INT(10) NOT NULL,
  `publisher_id` INT(10) NOT NULL,
  `series_id` INT(10) NOT NULL,
  `edition` INT(10) NOT NULL DEFAULT 1,
  `isbn10` VARCHAR(10) NULL,
  `isbn13` VARCHAR(13) NULL,
  `url` VARCHAR(255) NULL,
  PRIMARY KEY (`book_id`),
  INDEX `fk_book_has_book_title_idx` (`book_title_id` ASC) VISIBLE,
  INDEX `fk_book_publisher1_idx` (`publisher_id` ASC) VISIBLE,
  INDEX `fk_book_series1_idx` (`series_id` ASC) VISIBLE,
  CONSTRAINT `fk_book_edition_book_title1`
    FOREIGN KEY (`book_title_id`)
    REFERENCES `books`.`book_title` (`book_title_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_book_publisher1`
    FOREIGN KEY (`publisher_id`)
    REFERENCES `books`.`publisher` (`publisher_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_book_series1`
    FOREIGN KEY (`series_id`)
    REFERENCES `books`.`series` (`series_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `books`.`book_author`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `books`.`book_author` ;

CREATE TABLE IF NOT EXISTS `books`.`book_author` (
  `book_id` INT NOT NULL,
  `person_id` INT(10) NOT NULL,
  INDEX `fk_book_author_has_book_idx` (`book_id` ASC) VISIBLE,
  INDEX `fk_book_author_person1_idx` (`person_id` ASC) VISIBLE,
  CONSTRAINT `fk_book_author_book1`
    FOREIGN KEY (`book_id`)
    REFERENCES `books`.`book` (`book_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_book_author_person1`
    FOREIGN KEY (`person_id`)
    REFERENCES `books`.`person` (`person_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `books`.`book_retailer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `books`.`book_retailer` ;

CREATE TABLE IF NOT EXISTS `books`.`book_retailer` (
  `book_retailer_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `url` VARCHAR(255) NULL,
  PRIMARY KEY (`book_retailer_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `books`.`book_purchase`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `books`.`book_purchase` ;

CREATE TABLE IF NOT EXISTS `books`.`book_purchase` (
  `book_id` INT NOT NULL,
  `book_retailer_id` INT NOT NULL,
  `purchase_price` DOUBLE NULL,
  `purchase_date` DATE NULL,
  INDEX `fk_book_purchase_has_book_retailer_idx` (`book_retailer_id` ASC) VISIBLE,
  INDEX `fk_book_purchase_has_book_idx` (`book_id` ASC) VISIBLE,
  CONSTRAINT `fk_book_purchase_book_retailer1`
    FOREIGN KEY (`book_retailer_id`)
    REFERENCES `books`.`book_retailer` (`book_retailer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_book_purchase_book1`
    FOREIGN KEY (`book_id`)
    REFERENCES `books`.`book` (`book_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `books`.`person`
-- -----------------------------------------------------
START TRANSACTION;
USE `books`;
INSERT INTO `books`.`person` (`person_id`, `first_name`, `middle_name`, `last_name`) VALUES (1, 'Christian', NULL, 'Bauer');
INSERT INTO `books`.`person` (`person_id`, `first_name`, `middle_name`, `last_name`) VALUES (2, 'Gavin', NULL, 'King');
INSERT INTO `books`.`person` (`person_id`, `first_name`, `middle_name`, `last_name`) VALUES (3, 'Gary', NULL, 'Mak');
INSERT INTO `books`.`person` (`person_id`, `first_name`, `middle_name`, `last_name`) VALUES (4, 'Josh', NULL, 'Long');
INSERT INTO `books`.`person` (`person_id`, `first_name`, `middle_name`, `last_name`) VALUES (5, 'Daniel', NULL, 'Rubio');
INSERT INTO `books`.`person` (`person_id`, `first_name`, `middle_name`, `last_name`) VALUES (6, 'Craig', NULL, 'Walls');

COMMIT;


-- -----------------------------------------------------
-- Data for table `books`.`book_title`
-- -----------------------------------------------------
START TRANSACTION;
USE `books`;
INSERT INTO `books`.`book_title` (`book_title_id`, `title`, `subtitle`, `volume`, `volume_title`) VALUES (1, 'Spring Recipies', 'A Problem-Solution Approach', NULL, NULL);
INSERT INTO `books`.`book_title` (`book_title_id`, `title`, `subtitle`, `volume`, `volume_title`) VALUES (2, 'Java Persistence with Hibernate', 'Revised Edition of Hibernate in Action', NULL, NULL);
INSERT INTO `books`.`book_title` (`book_title_id`, `title`, `subtitle`, `volume`, `volume_title`) VALUES (3, 'Spring In Action', NULL, NULL, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `books`.`publisher`
-- -----------------------------------------------------
START TRANSACTION;
USE `books`;
INSERT INTO `books`.`publisher` (`publisher_id`, `publisher_name`, `url`) VALUES (1, 'Manning Publications Co.', 'http://www.manning.com');
INSERT INTO `books`.`publisher` (`publisher_id`, `publisher_name`, `url`) VALUES (2, 'Apress', 'http://www.apress.com');
INSERT INTO `books`.`publisher` (`publisher_id`, `publisher_name`, `url`) VALUES (3, 'Packt Publishing Ltd.', 'http://packtpub.com');
INSERT INTO `books`.`publisher` (`publisher_id`, `publisher_name`, `url`) VALUES (4, 'bitwise books', 'http://www.bitwisebooks.com');

COMMIT;


-- -----------------------------------------------------
-- Data for table `books`.`series`
-- -----------------------------------------------------
START TRANSACTION;
USE `books`;
INSERT INTO `books`.`series` (`series_id`, `series_name`) VALUES (1, 'In Action');

COMMIT;


-- -----------------------------------------------------
-- Data for table `books`.`book`
-- -----------------------------------------------------
START TRANSACTION;
USE `books`;
INSERT INTO `books`.`book` (`book_id`, `book_title_id`, `publisher_id`, `series_id`, `edition`, `isbn10`, `isbn13`, `url`) VALUES (1, 3, 1, 1, 5, NULL, '9781617294945', 'https://www.manning.com/books/spring-in-action-fifth-edition');

COMMIT;


-- -----------------------------------------------------
-- Data for table `books`.`book_author`
-- -----------------------------------------------------
START TRANSACTION;
USE `books`;
INSERT INTO `books`.`book_author` (`book_id`, `person_id`) VALUES (1, 6);

COMMIT;

