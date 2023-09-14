CREATE DATABASE IF NOT EXISTS `SANS_TITRE` DEFAULT CHARACTER SET UTF8MB4 COLLATE utf8mb4_unicode_ci;
USE `SANS_TITRE`;

CREATE TABLE `categories` (
  `id` INT(10) UNSIGNED,
  `label` VARCHAR(42),
  `description` VARCHAR(201),
  `url_image` VARCHAR(42),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4;

CREATE TABLE `orders` (
  `id` INT(10) UNSIGNED,
  `total_amount` INT(5),
  `order_date` DATETIME,
  `user_id` INT(10) UNSIGNED,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4;

CREATE TABLE `orders_teas` (
  `order_id` INT(10) UNSIGNED,
  `tea_id` INT(10) UNSIGNED,
  `quantity` VARCHAR(42),
  `ref_product` INT(6),
  PRIMARY KEY (`order_id`, `tea_id`)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4;

CREATE TABLE `teas_packages` (
  `tea_id` INT(10) UNSIGNED,
  `package_id` INT(10) UNSIGNED,
  `ref` INT(6) UNSIGNED,
  `price` DECIMAL(6,2) UNSIGNED,
  PRIMARY KEY (`tea_id`, `package_id`)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4;

CREATE TABLE `users_teas` (
  `user_id` INT(10) UNSIGNED,
  `tea_id` INT(10) UNSIGNED,
  `vote_count` INT(5) UNSIGNED,
  PRIMARY KEY (`user_id`, `tea_id`)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4;

CREATE TABLE `packages` (
  `id` INT(10) UNSIGNED,
  `package` VARCHAR(42),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4;

CREATE TABLE `teas` (
  `id` INT(10) UNSIGNED,
  `label_1` VARCHAR(30),
  `label_2` VARCHAR(42),
  `description` VARCHAR(501),
  `url_tea` VARCHAR(255),
  `url_image` VARCHAR(255),
  `vote_average` DECIMAL(3,2),
  `our_favorite` TINYINT(1) UNSIGNED,
  `category_id` INT(10) UNSIGNED,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4;

CREATE TABLE `users` (
  `id` INT(10) UNSIGNED,
  `label` VARCHAR(42),
  `email` VARCHAR(120),
  `password` VARCHAR(255),
  `role` VARCHAR(20),
  `created_at` DATETIME,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4;

ALTER TABLE `orders` ADD FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
ALTER TABLE `orders_teas` ADD FOREIGN KEY (`tea_id`) REFERENCES `teas` (`id`);
ALTER TABLE `orders_teas` ADD FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`);
ALTER TABLE `teas_packages` ADD FOREIGN KEY (`package_id`) REFERENCES `packages` (`id`);
ALTER TABLE `teas_packages` ADD FOREIGN KEY (`tea_id`) REFERENCES `teas` (`id`);
ALTER TABLE `users_teas` ADD FOREIGN KEY (`tea_id`) REFERENCES `teas` (`id`);
ALTER TABLE `users_teas` ADD FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
ALTER TABLE `teas` ADD FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);