-- users 테이블
CREATE TABLE `users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` VARCHAR(20) NOT NULL,
  `password` VARCHAR(100) NOT NULL,
  `nickname` VARCHAR(30) NOT NULL,
  `profile_img` TEXT,
  `status_msg` TEXT,
  `is_deleted` TINYINT(1) DEFAULT 0,
  `joined_at` DATETIME NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- channels 테이블
CREATE TABLE `channels` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  `creator_id` INT NOT NULL,
  `link` VARCHAR(100),
  `capacity` INT,
  `is_deleted` TINYINT(1) DEFAULT 0,
  `created_at` DATETIME NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`creator_id`) REFERENCES `users`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- chats 테이블
CREATE TABLE `chats` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `content` TEXT NOT NULL,
  `writer_id` INT NOT NULL,
  `channel_id` INT NOT NULL,
  `created_at` DATETIME NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`writer_id`) REFERENCES `users`(`id`) ON DELETE CASCADE,
  FOREIGN KEY (`channel_id`) REFERENCES `channels`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- follows 테이블
CREATE TABLE `follows` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `follower_id` INT NOT NULL,
  `followee_id` INT NOT NULL,
  `followed_at` DATETIME NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`follower_id`) REFERENCES `users`(`id`) ON DELETE CASCADE,
  FOREIGN KEY (`followee_id`) REFERENCES `users`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- blocks 테이블
CREATE TABLE `blocks` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `blocker_id` INT NOT NULL,
  `blocked_id` INT NOT NULL,
  `blocked_at` DATETIME NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`blocker_id`) REFERENCES `users`(`id`) ON DELETE CASCADE,
  FOREIGN KEY (`blocked_id`) REFERENCES `users`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
