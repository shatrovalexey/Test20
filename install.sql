CREATE DATABASE `test3` DEFAULT CHARACTER SET utf8 ;
CREATE USER `test3`@`localhost` IDENTIFIED BY 'test3' ;
GRANT ALL PRIVILEGES ON `test3`.* TO `test3`@`localhost` ;
FLUSH PRIVILEGES ;
USE `test3` ;