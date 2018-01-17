-- MySQL Workbench Synchronization
-- Generated: 2018-01-15 23:41
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: Олюнь

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE TABLE IF NOT EXISTS `shop`.`Persons` (
  `person_id` INT(11) NOT NULL,
  `person_name` VARCHAR(45) NOT NULL,
  `person_surname` VARCHAR(45) NOT NULL,
  `person_born_date` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(),
  `Person_states_state_id` INT(11) NOT NULL,
  PRIMARY KEY (`person_id`),
  INDEX `fk_Persons_Person_states_idx` (`Person_states_state_id` ASC),
  CONSTRAINT `fk_Persons_Person_states`
    FOREIGN KEY (`Person_states_state_id`)
    REFERENCES `shop`.`Person_states` (`state_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `shop`.`Person_states` (
  `state_id` INT(11) NOT NULL AUTO_INCREMENT,
  `state` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`state_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `shop`.`Accounts` (
  `account_id` INT(11) NOT NULL AUTO_INCREMENT,
  `account_login` VARCHAR(20) NOT NULL,
  `account_password` VARCHAR(20) NOT NULL,
  `account_email` VARCHAR(25) NOT NULL,
  `account_country` VARCHAR(25) NULL DEFAULT NULL,
  `account_created` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(),
  PRIMARY KEY (`account_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `shop`.`Customers` (
  `customer_id` INT(11) NOT NULL AUTO_INCREMENT,
  `Persons_person_id` INT(11) NOT NULL,
  `Accounts_account_id` INT(11) NOT NULL,
  PRIMARY KEY (`customer_id`),
  INDEX `fk_Customers_Persons1_idx` (`Persons_person_id` ASC),
  INDEX `fk_Customers_Accounts1_idx` (`Accounts_account_id` ASC),
  CONSTRAINT `fk_Customers_Persons1`
    FOREIGN KEY (`Persons_person_id`)
    REFERENCES `shop`.`Persons` (`person_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Customers_Accounts1`
    FOREIGN KEY (`Accounts_account_id`)
    REFERENCES `shop`.`Accounts` (`account_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `shop`.`Admins` (
  `admin_id` INT(11) NOT NULL AUTO_INCREMENT,
  `start_work` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(),
  `Accounts_account_id` INT(11) NOT NULL,
  `Persons_person_id` INT(11) NOT NULL,
  PRIMARY KEY (`admin_id`),
  INDEX `fk_Admins_Accounts1_idx` (`Accounts_account_id` ASC),
  INDEX `fk_Admins_Persons1_idx` (`Persons_person_id` ASC),
  CONSTRAINT `fk_Admins_Accounts1`
    FOREIGN KEY (`Accounts_account_id`)
    REFERENCES `shop`.`Accounts` (`account_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Admins_Persons1`
    FOREIGN KEY (`Persons_person_id`)
    REFERENCES `shop`.`Persons` (`person_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;



SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

ALTER TABLE `shop`.`Admins`
ADD INDEX `fk_Admins_Accounts1_idx` (`Accounts_account_id` ASC),
ADD INDEX `fk_Admins_Persons1_idx` (`Persons_person_id` ASC),
DROP INDEX `fk_Admins_Persons1_idx` ,
DROP INDEX `fk_Admins_Accounts1_idx` ;

ALTER TABLE `shop`.`Customers`
ADD INDEX `fk_Customers_Persons1_idx` (`Persons_person_id` ASC),
ADD INDEX `fk_Customers_Accounts1_idx` (`Accounts_account_id` ASC),
DROP INDEX `fk_Customers_Accounts1_idx` ,
DROP INDEX `fk_Customers_Persons1_idx` ;

CREATE TABLE IF NOT EXISTS `shop`.`Categories` (
  `category_id` INT(11) NOT NULL,
  `category` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`category_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `shop`.`Products` (
  `product_id` INT(11) NOT NULL,
  `product_name` VARCHAR(45) NOT NULL,
  `product_description` VARCHAR(45) NOT NULL,
  `product_price` DOUBLE NOT NULL,
  `product_country` VARCHAR(45) NOT NULL,
  `product_vendor` VARCHAR(45) NOT NULL,
  `product_warranty` DATE NOT NULL,
  `Categories_category_id` INT(11) NOT NULL,
  PRIMARY KEY (`product_id`),
  INDEX `fk_Products_Categories1_idx` (`Categories_category_id` ASC),
  CONSTRAINT `fk_Products_Categories1`
    FOREIGN KEY (`Categories_category_id`)
    REFERENCES `shop`.`Categories` (`category_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `shop`.`Favourite_lists` (
  `list_id` INT(11) NOT NULL,
  `Customers_customer_id` INT(11) NOT NULL,
  PRIMARY KEY (`list_id`),
  INDEX `fk_Favourite_lists_Customers1_idx` (`Customers_customer_id` ASC),
  CONSTRAINT `fk_Favourite_lists_Customers1`
    FOREIGN KEY (`Customers_customer_id`)
    REFERENCES `shop`.`Customers` (`customer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `shop`.`Lists_to_products` (
  `id` INT(11) NOT NULL,
  `Favourite_lists_list_id` INT(11) NOT NULL,
  `Products_product_id` INT(11) NOT NULL,
  `Lists_to_productscol` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Lists_to_products_Favourite_lists1_idx` (`Favourite_lists_list_id` ASC),
  INDEX `fk_Lists_to_products_Products1_idx` (`Products_product_id` ASC),
  CONSTRAINT `fk_Lists_to_products_Favourite_lists1`
    FOREIGN KEY (`Favourite_lists_list_id`)
    REFERENCES `shop`.`Favourite_lists` (`list_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Lists_to_products_Products1`
    FOREIGN KEY (`Products_product_id`)
    REFERENCES `shop`.`Products` (`product_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `shop`.`Order_states` (
  `state_id` INT(11) NOT NULL,
  `state` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`state_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `shop`.`Order_lines` (
  `line_id` INT(11) NOT NULL AUTO_INCREMENT,
  `quantity` INT(11) NOT NULL,
  `price` DOUBLE NOT NULL,
  `Orders_order_id` INT(11) NOT NULL,
  PRIMARY KEY (`line_id`),
  INDEX `fk_Order_lines_Orders1_idx` (`Orders_order_id` ASC),
  CONSTRAINT `fk_Order_lines_Orders1`
    FOREIGN KEY (`Orders_order_id`)
    REFERENCES `shop`.`Orders` (`order_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `shop`.`Orders` (
  `order_id` INT(11) NOT NULL AUTO_INCREMENT,
  `order_price` DOUBLE NOT NULL,
  `Order_states_state_id` INT(11) NOT NULL,
  PRIMARY KEY (`order_id`),
  INDEX `fk_Orders_Order_states1_idx` (`Order_states_state_id` ASC),
  CONSTRAINT `fk_Orders_Order_states1`
    FOREIGN KEY (`Order_states_state_id`)
    REFERENCES `shop`.`Order_states` (`state_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `shop`.`Orders_to_products` (
  `id` INT(11) NOT NULL,
  `Order_lines_line_id` INT(11) NOT NULL,
  `Products_product_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Orders_to_products_Order_lines1_idx` (`Order_lines_line_id` ASC),
  INDEX `fk_Orders_to_products_Products1_idx` (`Products_product_id` ASC),
  CONSTRAINT `fk_Orders_to_products_Order_lines1`
    FOREIGN KEY (`Order_lines_line_id`)
    REFERENCES `shop`.`Order_lines` (`line_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Orders_to_products_Products1`
    FOREIGN KEY (`Products_product_id`)
    REFERENCES `shop`.`Products` (`product_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

