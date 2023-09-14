CREATE DATABASE IF NOT EXISTS `COT_28` DEFAULT CHARACTER SET UTF8MB4 COLLATE utf8mb4_unicode_ci;
USE `COT_28`;

CREATE TABLE `CATEGORY` (
  `id` INT UNSIGNED AUTO_INCREMENT,
  `label` VARCHAR(80),
  `description` TEXT,
  `url_image` VARCHAR(200),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4;

CREATE TABLE `ORDER` (
  `id` INT UNSIGNED AUTO_INCREMENT,
  `total_amount` DECIMAL(7.2),
  `order_date` DATETIME,
  `user_id`  INT UNSIGNED,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4;

CREATE TABLE `ORDER_LINE` (
  `ref_id` INT UNSIGNED,
  `order_id` INT UNSIGNED,
  `quantity` SMALLINT UNSIGNED,
  PRIMARY KEY (`ref_id`, `order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4;

CREATE TABLE `TEA_PACKAGING` (
  `ref` INT UNSIGNED,
  `tea_id` INT UNSIGNED,
  `packaging_id` INT UNSIGNED,
  `price` DECIMAL(6.2),
  PRIMARY KEY (`ref`)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4;

CREATE TABLE `OPINION` (
  `user_id` INT UNSIGNED,
  `tea_id` INT UNSIGNED,
  `note` TINYINT UNSIGNED, 
  PRIMARY KEY (`user_id`, `tea_id`)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4;

CREATE TABLE `PACKAGING` (
  `id`  INT UNSIGNED AUTO_INCREMENT,
  `package` VARCHAR(42),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4;

CREATE TABLE `TEA` (
  `id`  INT UNSIGNED AUTO_INCREMENT,
  `label_1` VARCHAR(42),
  `label_2` VARCHAR(42),
  `description` TEXT,
  `url_tea` VARCHAR(142),
  `url_image` VARCHAR(142),
  `our_favorite` TINYINT UNSIGNED,
  `vote_average` DECIMAL(3.2),
  `category_id` INT UNSIGNED,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4;

CREATE TABLE `USER` (
  `id`  INT UNSIGNED AUTO_INCREMENT,
  `label` VARCHAR(42),
  `email` VARCHAR(120),
  `password` VARCHAR(255),
  `role` VARCHAR(20),
  `created_at` DATETIME,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4;

ALTER TABLE `ORDER` ADD FOREIGN KEY (`user_id`) REFERENCES `USER` (`id`);
ALTER TABLE `ORDER_LINE` ADD FOREIGN KEY (`ref_id`) REFERENCES `TEA_PACKAGING` (`ref`);
ALTER TABLE `ORDER_LINE` ADD FOREIGN KEY (`order_id`) REFERENCES `ORDER` (`id`);
ALTER TABLE `TEA_PACKAGING` ADD FOREIGN KEY (`tea_id`) REFERENCES `TEA` (`id`);
ALTER TABLE `TEA_PACKAGING` ADD FOREIGN KEY (`packaging_id`) REFERENCES `PACKAGING` (`id`);
ALTER TABLE `OPINION` ADD FOREIGN KEY (`user_id`) REFERENCES `USER` (`id`);
ALTER TABLE `OPINION` ADD FOREIGN KEY (`tea_id`) REFERENCES `TEA` (`id`);
ALTER TABLE `TEA` ADD FOREIGN KEY (`category_id`) REFERENCES `CATEGORY` (`id`);
