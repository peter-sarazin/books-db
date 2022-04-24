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
  `publisher_name` VARCHAR(45) NOT NULL,
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
  `series_id` INT(10) NULL,
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
INSERT INTO `books`.`person` (`person_id`, `first_name`, `middle_name`, `last_name`) VALUES (7, 'Andrew', NULL, 'Hunt');
INSERT INTO `books`.`person` (`person_id`, `first_name`, `middle_name`, `last_name`) VALUES (8, 'David', NULL, 'Thomas');
INSERT INTO `books`.`person` (`person_id`, `first_name`, `middle_name`, `last_name`) VALUES (9, 'Huw', NULL, 'Collingbourne');
INSERT INTO `books`.`person` (`person_id`, `first_name`, `middle_name`, `last_name`) VALUES (10, 'Brian', 'W', 'Kernighan');
INSERT INTO `books`.`person` (`person_id`, `first_name`, `middle_name`, `last_name`) VALUES (11, 'Dennis', 'MacAlistar', 'Ritchie');
INSERT INTO `books`.`person` (`person_id`, `first_name`, `middle_name`, `last_name`) VALUES (12, 'Scott', NULL, 'Meyers');
INSERT INTO `books`.`person` (`person_id`, `first_name`, `middle_name`, `last_name`) VALUES (13, 'Kent', NULL, 'Beck');
INSERT INTO `books`.`person` (`person_id`, `first_name`, `middle_name`, `last_name`) VALUES (14, 'Eric', NULL, 'Freeman');
INSERT INTO `books`.`person` (`person_id`, `first_name`, `middle_name`, `last_name`) VALUES (15, 'Elisabeth', NULL, 'Robson');
INSERT INTO `books`.`person` (`person_id`, `first_name`, `middle_name`, `last_name`) VALUES (16, 'Katamreddy Siva', 'Prasad', 'Reddy');

COMMIT;


-- -----------------------------------------------------
-- Data for table `books`.`book_title`
-- -----------------------------------------------------
START TRANSACTION;
USE `books`;
INSERT INTO `books`.`book_title` (`book_title_id`, `title`, `subtitle`, `volume`, `volume_title`) VALUES (1, 'The C Programming Language', 'ANSI C', NULL, NULL);
INSERT INTO `books`.`book_title` (`book_title_id`, `title`, `subtitle`, `volume`, `volume_title`) VALUES (2, 'Effective C++', '50 Specific Ways to Improve Your Programs and Designs', NULL, NULL);
INSERT INTO `books`.`book_title` (`book_title_id`, `title`, `subtitle`, `volume`, `volume_title`) VALUES (3, 'Spring In Action', NULL, NULL, NULL);
INSERT INTO `books`.`book_title` (`book_title_id`, `title`, `subtitle`, `volume`, `volume_title`) VALUES (4, 'The Little Book of Adventure Game Programming in Java', NULL, NULL, NULL);
INSERT INTO `books`.`book_title` (`book_title_id`, `title`, `subtitle`, `volume`, `volume_title`) VALUES (5, 'The Pragmatic Programmer', 'from journeyman to master', NULL, NULL);
INSERT INTO `books`.`book_title` (`book_title_id`, `title`, `subtitle`, `volume`, `volume_title`) VALUES (6, 'Test-Driven Development', 'By Example', NULL, NULL);
INSERT INTO `books`.`book_title` (`book_title_id`, `title`, `subtitle`, `volume`, `volume_title`) VALUES (7, 'Head First Design Patterns', 'Building Extensible & Maintainable Object-Oriented Software', NULL, NULL);
INSERT INTO `books`.`book_title` (`book_title_id`, `title`, `subtitle`, `volume`, `volume_title`) VALUES (8, 'Java Persistence with MyBatis 3', 'A practical guide to MyBatis, a simple yet  powerful Java Persistence Framework!', NULL, NULL);

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
INSERT INTO `books`.`publisher` (`publisher_id`, `publisher_name`, `url`) VALUES (5, 'Addison-Wesley', NULL);
INSERT INTO `books`.`publisher` (`publisher_id`, `publisher_name`, `url`) VALUES (6, 'Prentice Hall Software Series', NULL);
INSERT INTO `books`.`publisher` (`publisher_id`, `publisher_name`, `url`) VALUES (7, 'O\'Reilly Media, Inc.', 'https://www.oreilly.com/');

COMMIT;


-- -----------------------------------------------------
-- Data for table `books`.`series`
-- -----------------------------------------------------
START TRANSACTION;
USE `books`;
INSERT INTO `books`.`series` (`series_id`, `series_name`) VALUES (1, 'In Action');
INSERT INTO `books`.`series` (`series_id`, `series_name`) VALUES (2, 'The Little Book of');
INSERT INTO `books`.`series` (`series_id`, `series_name`) VALUES (3, 'Addison-Wesley Professional Computing Series');
INSERT INTO `books`.`series` (`series_id`, `series_name`) VALUES (4, 'The Addison-Wesley Signature Series');
INSERT INTO `books`.`series` (`series_id`, `series_name`) VALUES (5, 'Head First');

COMMIT;


-- -----------------------------------------------------
-- Data for table `books`.`book`
-- -----------------------------------------------------
START TRANSACTION;
USE `books`;
INSERT INTO `books`.`book` (`book_id`, `book_title_id`, `publisher_id`, `series_id`, `edition`, `isbn10`, `isbn13`, `url`) VALUES (1, 3, 1, 1, 5, NULL, '9781617294945', 'https://www.manning.com/books/spring-in-action-fifth-edition');
INSERT INTO `books`.`book` (`book_id`, `book_title_id`, `publisher_id`, `series_id`, `edition`, `isbn10`, `isbn13`, `url`) VALUES (2, 4, 4, 2, 1, NULL, '9781913132132', 'http://bitwisebooks.com/books/little-book-of-adventure-game-programming-in-java/');
INSERT INTO `books`.`book` (`book_id`, `book_title_id`, `publisher_id`, `series_id`, `edition`, `isbn10`, `isbn13`, `url`) VALUES (3, 5, 5, NULL, 1, '020161622X', NULL, NULL);
INSERT INTO `books`.`book` (`book_id`, `book_title_id`, `publisher_id`, `series_id`, `edition`, `isbn10`, `isbn13`, `url`) VALUES (4, 1, 6, NULL, 2, '0131103709', NULL, NULL);
INSERT INTO `books`.`book` (`book_id`, `book_title_id`, `publisher_id`, `series_id`, `edition`, `isbn10`, `isbn13`, `url`) VALUES (5, 2, 5, 3, 1, '0201563649', NULL, NULL);
INSERT INTO `books`.`book` (`book_id`, `book_title_id`, `publisher_id`, `series_id`, `edition`, `isbn10`, `isbn13`, `url`) VALUES (6, 6, 5, 4, 1, '0321146530', '9780321146533', NULL);
INSERT INTO `books`.`book` (`book_id`, `book_title_id`, `publisher_id`, `series_id`, `edition`, `isbn10`, `isbn13`, `url`) VALUES (7, 7, 7, 5, 2, NULL, '9781492078005', 'https://www.oreilly.com/library/view/head-first-design/9781492077992/');
INSERT INTO `books`.`book` (`book_id`, `book_title_id`, `publisher_id`, `series_id`, `edition`, `isbn10`, `isbn13`, `url`) VALUES (8, 8, 3, NULL, 1, NULL, '9787782166801', 'https://www.packtpub.com/product/java-persistence-with-mybatis-3/9781782166801');

COMMIT;


-- -----------------------------------------------------
-- Data for table `books`.`book_author`
-- -----------------------------------------------------
START TRANSACTION;
USE `books`;
INSERT INTO `books`.`book_author` (`book_id`, `person_id`) VALUES (1, 6);
INSERT INTO `books`.`book_author` (`book_id`, `person_id`) VALUES (3, 7);
INSERT INTO `books`.`book_author` (`book_id`, `person_id`) VALUES (3, 8);
INSERT INTO `books`.`book_author` (`book_id`, `person_id`) VALUES (2, 9);
INSERT INTO `books`.`book_author` (`book_id`, `person_id`) VALUES (4, 10);
INSERT INTO `books`.`book_author` (`book_id`, `person_id`) VALUES (4, 11);
INSERT INTO `books`.`book_author` (`book_id`, `person_id`) VALUES (5, 12);
INSERT INTO `books`.`book_author` (`book_id`, `person_id`) VALUES (6, 13);
INSERT INTO `books`.`book_author` (`book_id`, `person_id`) VALUES (7, 14);
INSERT INTO `books`.`book_author` (`book_id`, `person_id`) VALUES (7, 15);
INSERT INTO `books`.`book_author` (`book_id`, `person_id`) VALUES (8, 16);

COMMIT;


-- -----------------------------------------------------
-- Data for table `books`.`book_retailer`
-- -----------------------------------------------------
START TRANSACTION;
USE `books`;
INSERT INTO `books`.`book_retailer` (`book_retailer_id`, `name`, `url`) VALUES (1, 'Amazon', 'http://www.amazon.com');

COMMIT;


-- -----------------------------------------------------
-- Data for table `books`.`book_purchase`
-- -----------------------------------------------------
START TRANSACTION;
USE `books`;
INSERT INTO `books`.`book_purchase` (`book_id`, `book_retailer_id`, `purchase_price`, `purchase_date`) VALUES (1, 1, 25.23, '2021-04-11');
INSERT INTO `books`.`book_purchase` (`book_id`, `book_retailer_id`, `purchase_price`, `purchase_date`) VALUES (2, 1, 20.18, '2022-04-18');
INSERT INTO `books`.`book_purchase` (`book_id`, `book_retailer_id`, `purchase_price`, `purchase_date`) VALUES (3, 1, 33.96, '2006-10-2');
INSERT INTO `books`.`book_purchase` (`book_id`, `book_retailer_id`, `purchase_price`, `purchase_date`) VALUES (6, 1, 32.78, '2013-03-15');
INSERT INTO `books`.`book_purchase` (`book_id`, `book_retailer_id`, `purchase_price`, `purchase_date`) VALUES (7, 1, 41.45, '2021-04-11');
INSERT INTO `books`.`book_purchase` (`book_id`, `book_retailer_id`, `purchase_price`, `purchase_date`) VALUES (8, 1, 29.99, '2019-02-13');

COMMIT;

