-- Ensure you’re using MySQL / MariaDB for ENUM and ON UPDATE syntax
-- Table names are quoted to avoid keyword conflicts.

-- 1) User
CREATE TABLE `User` (
    `user_id` CHAR(36) PRIMARY KEY,
    `first_name` VARCHAR(255) NOT NULL,
    `last_name` VARCHAR(255) NOT NULL,
    `email` VARCHAR(255) NOT NULL UNIQUE,
    `password_hash` VARCHAR(255) NOT NULL,
    `phone_number` VARCHAR(20),
    `role` ENUM('guest','host','admin') NOT NULL,
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 2) Property
CREATE TABLE `Property` (
    `property_id` CHAR(36) PRIMARY KEY,
    `host_id` CHAR(36) NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `description` TEXT NOT NULL,
    `location` VARCHAR(255) NOT NULL,
    `price_per_night` DECIMAL(10,2) NOT NULL,
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT `fk_property_host`
        FOREIGN KEY (`host_id`) REFERENCES `User`(`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 3) Booking
CREATE TABLE `Booking` (
    `booking_id` CHAR(36) PRIMARY KEY,
    `property_id` CHAR(36) NOT NULL,
    `user_id` CHAR(36) NOT NULL,
    `start_date` DATE NOT NULL,
    `end_date` DATE NOT NULL,
    `total_price` DECIMAL(10,2) NOT NULL,
    `status` ENUM('pending','confirmed','canceled') NOT NULL,
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT `fk_booking_property`
        FOREIGN KEY (`property_id`) REFERENCES `Property`(`property_id`),
    CONSTRAINT `fk_booking_user`
        FOREIGN KEY (`user_id`) REFERENCES `User`(`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 4) Payment
CREATE TABLE `Payment` (
    `payment_id` CHAR(36) PRIMARY KEY,
    `booking_id` CHAR(36) NOT NULL,
    `amount` DECIMAL(10,2) NOT NULL,
    `payment_date` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `payment_method` ENUM('credit_card','paypal','stripe') NOT NULL,
    CONSTRAINT `fk_payment_booking`
        FOREIGN KEY (`booking_id`) REFERENCES `Booking`(`booking_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 5) Review
CREATE TABLE `Review` (
    `review_id` CHAR(36) PRIMARY KEY,
    `property_id` CHAR(36) NOT NULL,
    `user_id` CHAR(36) NOT NULL,
    `rating` INT NOT NULL CHECK (`rating` >= 1 AND `rating` <= 5),
    `comment` TEXT NOT NULL,
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT `fk_review_property`
        FOREIGN KEY (`property_id`) REFERENCES `Property`(`property_id`),
    CONSTRAINT `fk_review_user`
        FOREIGN KEY (`user_id`) REFERENCES `User`(`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 6) Message
CREATE TABLE `Message` (
    `message_id` CHAR(36) PRIMARY KEY,
    `sender_id` CHAR(36) NOT NULL,
    `recipient_id` CHAR(36) NOT NULL,
    `message_body` TEXT NOT NULL,
    `sent_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT `fk_message_sender`
        FOREIGN KEY (`sender_id`) REFERENCES `User`(`user_id`),
    CONSTRAINT `fk_message_recipient`
        FOREIGN KEY (`recipient_id`) REFERENCES `User`(`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Indexes for performance
CREATE INDEX `idx_user_email` ON `User`(`email`);
CREATE INDEX `idx_property_host` ON `Property`(`host_id`);
CREATE INDEX `idx_booking_property` ON `Booking`(`property_id`);
CREATE INDEX `idx_booking_user` ON `Booking`(`user_id`);
CREATE INDEX `idx_payment_booking` ON `Payment`(`booking_id`);
CREATE INDEX `idx_review_property` ON `Review`(`property_id`);
CREATE INDEX `idx_review_user` ON `Review`(`user_id`);
CREATE INDEX `idx_message_sender` ON `Message`(`sender_id`);
CREATE INDEX `idx_message_recipient` ON `Message`(`recipient_id`);
