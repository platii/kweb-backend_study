CREATE TABLE `students` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(20) NOT NULL,
  `entrance_year` INT NOT NULL,
  `major_code` CHAR(4) NOT NULL,
  `serial_number` CHAR(4) NOT NULL,
  `phone` VARCHAR(13),
  `address` TEXT,
  `total_credit` INT DEFAULT 0,
  `gpa` FLOAT DEFAULT 0.0,
  `is_enrolled` TINYINT(1) DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
