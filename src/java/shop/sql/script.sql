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

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

ALTER TABLE `shop`.`Admins`
DROP FOREIGN KEY `fk_Admins_Accounts1`,
DROP FOREIGN KEY `fk_Admins_Persons1`;

ALTER TABLE `shop`.`Customers`
DROP FOREIGN KEY `fk_Customers_Accounts1`;

ALTER TABLE `shop`.`Favourite_lists`
DROP FOREIGN KEY `fk_Favourite_lists_Customers1`;

ALTER TABLE `shop`.`Lists_to_products`
DROP FOREIGN KEY `fk_Lists_to_products_Favourite_lists1`,
DROP FOREIGN KEY `fk_Lists_to_products_Products1`;

ALTER TABLE `shop`.`Order_lines`
DROP FOREIGN KEY `fk_Order_lines_Orders1`;

ALTER TABLE `shop`.`Orders`
DROP FOREIGN KEY `fk_Orders_Order_states1`;

ALTER TABLE `shop`.`Orders_to_products`
DROP FOREIGN KEY `fk_Orders_to_products_Order_lines1`,
DROP FOREIGN KEY `fk_Orders_to_products_Products1`;

ALTER TABLE `shop`.`Persons`
DROP FOREIGN KEY `fk_Persons_Person_states`;

ALTER TABLE `shop`.`Products`
DROP FOREIGN KEY `fk_Products_Categories1`;

ALTER TABLE `shop`.`Admins`
CHANGE COLUMN `Accounts_account_id` `account_id` INT(11) NOT NULL ,
CHANGE COLUMN `Persons_person_id` `person_id` INT(11) NOT NULL ;

ALTER TABLE `shop`.`Customers`
CHANGE COLUMN `Accounts_account_id` `account_id` INT(11) NOT NULL ;

ALTER TABLE `shop`.`Favourite_lists`
CHANGE COLUMN `Customers_customer_id` `customer_id` INT(11) NOT NULL ;

ALTER TABLE `shop`.`Lists_to_products`
DROP COLUMN `Lists_to_productscol`,
CHANGE COLUMN `Favourite_lists_list_id` `list_id` INT(11) NOT NULL ,
CHANGE COLUMN `Products_product_id` `product_id` INT(11) NOT NULL ;

ALTER TABLE `shop`.`Order_lines`
CHANGE COLUMN `Orders_order_id` `order_id` INT(11) NOT NULL ;

ALTER TABLE `shop`.`Orders`
CHANGE COLUMN `Order_states_state_id` `state_id` INT(11) NOT NULL ;

ALTER TABLE `shop`.`Orders_to_products`
CHANGE COLUMN `Order_lines_line_id` `line_id` INT(11) NOT NULL ,
CHANGE COLUMN `Products_product_id` `product_id` INT(11) NOT NULL ;

ALTER TABLE `shop`.`Persons`
CHANGE COLUMN `Person_states_state_id` `state_id` INT(11) NOT NULL ;

ALTER TABLE `shop`.`Products`
CHANGE COLUMN `Categories_category_id` `category_id` INT(11) NOT NULL ;

CREATE TABLE IF NOT EXISTS `shop`.`Warranties` (
  `warranty_id` INT(11) NOT NULL AUTO_INCREMENT,
  `warranty_start` DATE NOT NULL,
  `warranty_expiry` DATE NOT NULL,
  PRIMARY KEY (`warranty_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `shop`.`Sale_lines` (
  `line_id` INT(11) NOT NULL AUTO_INCREMENT,
  `product_quantity` INT(11) NOT NULL,
  `line_price` DOUBLE NOT NULL,
  `product_id` INT(11) NOT NULL,
  `warranty_id` INT(11) NOT NULL,
  `sale_id` INT(11) NOT NULL,
  PRIMARY KEY (`line_id`),
  INDEX `fk_Sale_lines_Products1_idx` (`product_id` ASC),
  INDEX `fk_Sale_lines_Warranties1_idx` (`warranty_id` ASC),
  INDEX `fk_Sale_lines_Sales1_idx` (`sale_id` ASC),
  CONSTRAINT `fk_Sale_lines_Products1`
    FOREIGN KEY (`product_id`)
    REFERENCES `shop`.`Products` (`product_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Sale_lines_Warranties1`
    FOREIGN KEY (`warranty_id`)
    REFERENCES `shop`.`Warranties` (`warranty_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Sale_lines_Sales1`
    FOREIGN KEY (`sale_id`)
    REFERENCES `shop`.`Sales` (`sale_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `shop`.`Sales` (
  `sale_id` INT(11) NOT NULL AUTO_INCREMENT,
  `sale_price` DOUBLE NOT NULL,
  `createDate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `customer_id` INT(11) NOT NULL,
  `order_id` INT(11) NOT NULL,
  PRIMARY KEY (`sale_id`),
  INDEX `fk_Sales_Customers1_idx` (`customer_id` ASC),
  INDEX `fk_Sales_Orders1_idx` (`order_id` ASC),
  CONSTRAINT `fk_Sales_Customers1`
    FOREIGN KEY (`customer_id`)
    REFERENCES `shop`.`Customers` (`customer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Sales_Orders1`
    FOREIGN KEY (`order_id`)
    REFERENCES `shop`.`Orders` (`order_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

ALTER TABLE `shop`.`Admins`
ADD CONSTRAINT `fk_Admins_Accounts1`
  FOREIGN KEY (`account_id`)
  REFERENCES `shop`.`Accounts` (`account_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_Admins_Persons1`
  FOREIGN KEY (`person_id`)
  REFERENCES `shop`.`Persons` (`person_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `shop`.`Customers`
ADD CONSTRAINT `fk_Customers_Accounts1`
  FOREIGN KEY (`account_id`)
  REFERENCES `shop`.`Accounts` (`account_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `shop`.`Favourite_lists`
ADD CONSTRAINT `fk_Favourite_lists_Customers1`
  FOREIGN KEY (`customer_id`)
  REFERENCES `shop`.`Customers` (`customer_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `shop`.`Lists_to_products`
ADD CONSTRAINT `fk_Lists_to_products_Favourite_lists1`
  FOREIGN KEY (`list_id`)
  REFERENCES `shop`.`Favourite_lists` (`list_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_Lists_to_products_Products1`
  FOREIGN KEY (`product_id`)
  REFERENCES `shop`.`Products` (`product_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `shop`.`Order_lines`
ADD CONSTRAINT `fk_Order_lines_Orders1`
  FOREIGN KEY (`order_id`)
  REFERENCES `shop`.`Orders` (`order_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `shop`.`Orders`
ADD CONSTRAINT `fk_Orders_Order_states1`
  FOREIGN KEY (`state_id`)
  REFERENCES `shop`.`Order_states` (`state_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `shop`.`Orders_to_products`
ADD CONSTRAINT `fk_Orders_to_products_Order_lines1`
  FOREIGN KEY (`line_id`)
  REFERENCES `shop`.`Order_lines` (`line_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_Orders_to_products_Products1`
  FOREIGN KEY (`product_id`)
  REFERENCES `shop`.`Products` (`product_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `shop`.`Persons`
ADD CONSTRAINT `fk_Persons_Person_states`
  FOREIGN KEY (`state_id`)
  REFERENCES `shop`.`Person_states` (`state_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `shop`.`Products`
ADD CONSTRAINT `fk_Products_Categories1`
  FOREIGN KEY (`category_id`)
  REFERENCES `shop`.`Categories` (`category_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `shop`.`Accounts`
CHANGE COLUMN `account_created` `account_created` TIMESTAMP NOT NULL DEFAULT DEFAULT CURRENT_TIMESTAMP ;

ALTER TABLE `shop`.`Admins`
CHANGE COLUMN `start_work` `start_work` TIMESTAMP NOT NULL DEFAULT DEFAULT CURRENT_TIMESTAMP ;

ALTER TABLE `shop`.`Favourite_lists`
ADD COLUMN `updated` TIMESTAMP NOT NULL DEFAULT 'DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP' AFTER `customer_id`;

ALTER TABLE `shop`.`Orders`
ADD COLUMN `order_created` TIMESTAMP NOT NULL DEFAULT DEFAULT CURRENT_TIMESTAMP AFTER `order_price`;

ALTER TABLE `shop`.`Persons`
CHANGE COLUMN `person_born_date` `person_born_date` TIMESTAMP NOT NULL DEFAULT DEFAULT CURRENT_TIMESTAMP ,
ADD COLUMN `information_updated` TIMESTAMP NOT NULL DEFAULT DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP AFTER `person_born_date`;

ALTER TABLE `shop`.`Sales`
CHANGE COLUMN `createDate` `createDate` TIMESTAMP NOT NULL DEFAULT DEFAULT CURRENT_TIMESTAMP ;

CREATE TABLE IF NOT EXISTS `shop`.`Phones` (
  `phone_id` INT(11) NOT NULL AUTO_INCREMENT,
  `phone_model` VARCHAR(45) NOT NULL,
  `phone_CPU` VARCHAR(45) NOT NULL,
  `phone_RAM` VARCHAR(45) NOT NULL,
  `phone_ROM` VARCHAR(45) NOT NULL,
  `phone_battery` VARCHAR(45) NOT NULL,
  `phone_screen_size` DOUBLE NOT NULL,
  `phone_colour` VARCHAR(45) NOT NULL,
  `phone_video_adapter` VARCHAR(45) NOT NULL,
  `phone_complete_set` VARCHAR(45) NOT NULL,
  `phone_dimensions` VARCHAR(45) NOT NULL,
  `system_id` INT(11) NOT NULL,
  `product_id` INT(11) NOT NULL,
  PRIMARY KEY (`phone_id`),
  INDEX `fk_Phones_Operation_Systems1_idx` (`system_id` ASC),
  INDEX `fk_Phones_Products1_idx` (`product_id` ASC),
  CONSTRAINT `fk_Phones_Operation_Systems1`
    FOREIGN KEY (`system_id`)
    REFERENCES `shop`.`Operation_Systems` (`system_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Phones_Products1`
    FOREIGN KEY (`product_id`)
    REFERENCES `shop`.`Products` (`product_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `shop`.`Laptops` (
  `laptop_id` INT(11) NOT NULL AUTO_INCREMENT,
  `laptop_model` VARCHAR(45) NOT NULL,
  `laptop_CPU` VARCHAR(45) NOT NULL,
  `laptop_RAM` VARCHAR(45) NOT NULL,
  `laptop_ROM` VARCHAR(45) NOT NULL,
  `laptop_battery` VARCHAR(45) NOT NULL,
  `laptop_screen_size` DOUBLE NOT NULL,
  `laptop_colour` VARCHAR(45) NOT NULL,
  `laptop_video_adapter` VARCHAR(45) NOT NULL,
  `laptop_complete_set` VARCHAR(45) NOT NULL,
  `laptop_dimensions` VARCHAR(45) NOT NULL,
  `system_id` INT(11) NOT NULL,
  `product_id` INT(11) NOT NULL,
  PRIMARY KEY (`laptop_id`),
  INDEX `fk_Laptops_Operation_Systems1_idx` (`system_id` ASC),
  INDEX `fk_Laptops_Products1_idx` (`product_id` ASC),
  CONSTRAINT `fk_Laptops_Operation_Systems1`
    FOREIGN KEY (`system_id`)
    REFERENCES `shop`.`Operation_Systems` (`system_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Laptops_Products1`
    FOREIGN KEY (`product_id`)
    REFERENCES `shop`.`Products` (`product_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `shop`.`TV` (
  `tv_id` INT(11) NOT NULL AUTO_INCREMENT,
  `tv_model` VARCHAR(45) NOT NULL,
  `tv_battery` VARCHAR(45) NOT NULL,
  `tv_screen_size` DOUBLE NOT NULL,
  `tv_colour` VARCHAR(45) NOT NULL,
  `tv_complete_set` VARCHAR(45) NOT NULL,
  `tv_dimensions` VARCHAR(45) NOT NULL,
  `product_id` INT(11) NOT NULL,
  PRIMARY KEY (`tv_id`),
  INDEX `fk_TV_Products1_idx` (`product_id` ASC),
  CONSTRAINT `fk_TV_Products1`
    FOREIGN KEY (`product_id`)
    REFERENCES `shop`.`Products` (`product_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `shop`.`Operation_Systems` (
  `system_id` INT(11) NOT NULL AUTO_INCREMENT,
  `system_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`system_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;

ALTER TABLE `shop`.`Admins`
CHANGE COLUMN `start_work` `start_work` TIMESTAMP NOT NULL DEFAULT DEFAULT CURRENT_TIMESTAMP ;

ALTER TABLE `shop`.`Favourite_lists`
ADD COLUMN `updated` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP AFTER `customer_id`;

ALTER TABLE `shop`.`Orders`
ADD COLUMN `order_created` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP AFTER `order_price`;

ALTER TABLE `shop`.`Persons`
ADD COLUMN `information_updated` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP AFTER `person_born_date`;

CREATE TABLE IF NOT EXISTS `shop`.`Phones` (
  `phone_id` INT(11) NOT NULL AUTO_INCREMENT,
  `phone_model` VARCHAR(45) NOT NULL,
  `phone_CPU` VARCHAR(45) NOT NULL,
  `phone_RAM` VARCHAR(45) NOT NULL,
  `phone_ROM` VARCHAR(45) NOT NULL,
  `phone_battery` VARCHAR(45) NOT NULL,
  `phone_screen_size` DOUBLE NOT NULL,
  `phone_colour` VARCHAR(45) NOT NULL,
  `phone_video_adapter` VARCHAR(45) NOT NULL,
  `phone_complete_set` VARCHAR(45) NOT NULL,
  `phone_dimensions` VARCHAR(45) NOT NULL,
  `system_id` INT(11) NOT NULL,
  `product_id` INT(11) NOT NULL,
  PRIMARY KEY (`phone_id`),
  INDEX `fk_Phones_Operation_Systems1_idx` (`system_id` ASC),
  INDEX `fk_Phones_Products1_idx` (`product_id` ASC),
  CONSTRAINT `fk_Phones_Operation_Systems1`
    FOREIGN KEY (`system_id`)
    REFERENCES `shop`.`Operation_Systems` (`system_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Phones_Products1`
    FOREIGN KEY (`product_id`)
    REFERENCES `shop`.`Products` (`product_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `shop`.`Laptops` (
  `laptop_id` INT(11) NOT NULL AUTO_INCREMENT,
  `laptop_model` VARCHAR(45) NOT NULL,
  `laptop_CPU` VARCHAR(45) NOT NULL,
  `laptop_RAM` VARCHAR(45) NOT NULL,
  `laptop_ROM` VARCHAR(45) NOT NULL,
  `laptop_battery` VARCHAR(45) NOT NULL,
  `laptop_screen_size` DOUBLE NOT NULL,
  `laptop_colour` VARCHAR(45) NOT NULL,
  `laptop_video_adapter` VARCHAR(45) NOT NULL,
  `laptop_complete_set` VARCHAR(45) NOT NULL,
  `laptop_dimensions` VARCHAR(45) NOT NULL,
  `system_id` INT(11) NOT NULL,
  `product_id` INT(11) NOT NULL,
  PRIMARY KEY (`laptop_id`),
  INDEX `fk_Laptops_Operation_Systems1_idx` (`system_id` ASC),
  INDEX `fk_Laptops_Products1_idx` (`product_id` ASC),
  CONSTRAINT `fk_Laptops_Operation_Systems1`
    FOREIGN KEY (`system_id`)
    REFERENCES `shop`.`Operation_Systems` (`system_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Laptops_Products1`
    FOREIGN KEY (`product_id`)
    REFERENCES `shop`.`Products` (`product_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `shop`.`TV` (
  `tv_id` INT(11) NOT NULL AUTO_INCREMENT,
  `tv_model` VARCHAR(45) NOT NULL,
  `tv_battery` VARCHAR(45) NOT NULL,
  `tv_screen_size` DOUBLE NOT NULL,
  `tv_colour` VARCHAR(45) NOT NULL,
  `tv_complete_set` VARCHAR(45) NOT NULL,
  `tv_dimensions` VARCHAR(45) NOT NULL,
  `product_id` INT(11) NOT NULL,
  PRIMARY KEY (`tv_id`),
  INDEX `fk_TV_Products1_idx` (`product_id` ASC),
  CONSTRAINT `fk_TV_Products1`
    FOREIGN KEY (`product_id`)
    REFERENCES `shop`.`Products` (`product_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `shop`.`Operation_Systems` (
  `system_id` INT(11) NOT NULL AUTO_INCREMENT,
  `system_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`system_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;










ALTER TABLE `shop`.`Orders`
ADD COLUMN `order_created` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP AFTER `order_price`;

ALTER TABLE `shop`.`Persons`
ADD COLUMN `information_updated` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP AFTER `person_born_date`;

CREATE TABLE IF NOT EXISTS `shop`.`Phones` (
  `phone_id` INT(11) NOT NULL AUTO_INCREMENT,
  `phone_model` VARCHAR(45) NOT NULL,
  `phone_CPU` VARCHAR(45) NOT NULL,
  `phone_RAM` VARCHAR(45) NOT NULL,
  `phone_ROM` VARCHAR(45) NOT NULL,
  `phone_battery` VARCHAR(45) NOT NULL,
  `phone_screen_size` DOUBLE NOT NULL,
  `phone_colour` VARCHAR(45) NOT NULL,
  `phone_video_adapter` VARCHAR(45) NOT NULL,
  `phone_complete_set` VARCHAR(45) NOT NULL,
  `phone_dimensions` VARCHAR(45) NOT NULL,
  `system_id` INT(11) NOT NULL,
  `product_id` INT(11) NOT NULL,
  PRIMARY KEY (`phone_id`),
  INDEX `fk_Phones_Operation_Systems1_idx` (`system_id` ASC),
  INDEX `fk_Phones_Products1_idx` (`product_id` ASC),
  CONSTRAINT `fk_Phones_Operation_Systems1`
    FOREIGN KEY (`system_id`)
    REFERENCES `shop`.`Operation_Systems` (`system_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Phones_Products1`
    FOREIGN KEY (`product_id`)
    REFERENCES `shop`.`Products` (`product_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `shop`.`Laptops` (
  `laptop_id` INT(11) NOT NULL AUTO_INCREMENT,
  `laptop_model` VARCHAR(45) NOT NULL,
  `laptop_CPU` VARCHAR(45) NOT NULL,
  `laptop_RAM` VARCHAR(45) NOT NULL,
  `laptop_ROM` VARCHAR(45) NOT NULL,
  `laptop_battery` VARCHAR(45) NOT NULL,
  `laptop_screen_size` DOUBLE NOT NULL,
  `laptop_colour` VARCHAR(45) NOT NULL,
  `laptop_video_adapter` VARCHAR(45) NOT NULL,
  `laptop_complete_set` VARCHAR(45) NOT NULL,
  `laptop_dimensions` VARCHAR(45) NOT NULL,
  `system_id` INT(11) NOT NULL,
  `product_id` INT(11) NOT NULL,
  PRIMARY KEY (`laptop_id`),
  INDEX `fk_Laptops_Operation_Systems1_idx` (`system_id` ASC),
  INDEX `fk_Laptops_Products1_idx` (`product_id` ASC),
  CONSTRAINT `fk_Laptops_Operation_Systems1`
    FOREIGN KEY (`system_id`)
    REFERENCES `shop`.`Operation_Systems` (`system_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Laptops_Products1`
    FOREIGN KEY (`product_id`)
    REFERENCES `shop`.`Products` (`product_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `shop`.`TV` (
  `tv_id` INT(11) NOT NULL AUTO_INCREMENT,
  `tv_model` VARCHAR(45) NOT NULL,
  `tv_battery` VARCHAR(45) NOT NULL,
  `tv_screen_size` DOUBLE NOT NULL,
  `tv_colour` VARCHAR(45) NOT NULL,
  `tv_complete_set` VARCHAR(45) NOT NULL,
  `tv_dimensions` VARCHAR(45) NOT NULL,
  `product_id` INT(11) NOT NULL,
  PRIMARY KEY (`tv_id`),
  INDEX `fk_TV_Products1_idx` (`product_id` ASC),
  CONSTRAINT `fk_TV_Products1`
    FOREIGN KEY (`product_id`)
    REFERENCES `shop`.`Products` (`product_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `shop`.`Operation_Systems` (
  `system_id` INT(11) NOT NULL AUTO_INCREMENT,
  `system_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`system_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;