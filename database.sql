-- MySQL dump 10.13  Distrib 5.7.19, for Linux (x86_64)
--
-- Host: localhost    Database: test3
-- ------------------------------------------------------
-- Server version	5.7.19-0ubuntu0.16.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account` (
  `id` bigint(22) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор',
  `user_id` bigint(22) unsigned NOT NULL COMMENT 'идентификатор пользователя',
  `amount` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT 'сумма счёта',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'дата\\время создания',
  PRIMARY KEY (`id`),
  KEY `fk_account_user_idx` (`user_id`),
  CONSTRAINT `fk_account_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='счёт';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES (1,1,96.01,'2017-09-27 15:04:55');
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_history`
--

DROP TABLE IF EXISTS `account_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_history` (
  `id` bigint(22) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор',
  `account_id` bigint(22) unsigned NOT NULL COMMENT 'идентификатор счёта',
  `amount` decimal(10,2) unsigned NOT NULL COMMENT 'сумма',
  `array` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0=дебит, 1=кредит',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'дата\\время создания',
  PRIMARY KEY (`id`),
  KEY `fk_account_history_account_idx` (`account_id`),
  KEY `idx_account_id_array` (`account_id`,`array`),
  CONSTRAINT `fk_account_history_account` FOREIGN KEY (`account_id`) REFERENCES `account` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='Транзакции счёта';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_history`
--

LOCK TABLES `account_history` WRITE;
/*!40000 ALTER TABLE `account_history` DISABLE KEYS */;
INSERT INTO `account_history` VALUES (1,1,100.01,1,'2017-09-27 14:04:57'),(5,1,1.00,0,'2017-09-27 14:51:31'),(6,1,1.00,0,'2017-09-27 14:51:40'),(7,1,1.00,0,'2017-09-27 15:03:26'),(8,1,1.00,0,'2017-09-27 15:04:55');
/*!40000 ALTER TABLE `account_history` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_UNSIGNED_SUBTRACTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `test3`.`account_history_AFTER_INSERT` AFTER INSERT
ON `account_history` FOR EACH ROW CALL `pu_account_amount`( new.`account_id` ) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_UNSIGNED_SUBTRACTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `test3`.`account_history_AFTER_UPDATE` AFTER UPDATE ON `account_history` FOR EACH ROW
CALL `pu_account_amount`( new.`account_id` ) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_UNSIGNED_SUBTRACTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `test3`.`account_history_AFTER_DELETE` AFTER DELETE ON `account_history` FOR EACH ROW
CALL `pu_account_amount`( old.`account_id` ) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `session`
--

DROP TABLE IF EXISTS `session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `session` (
  `id` char(32) NOT NULL COMMENT 'идентификатор',
  `user_id` bigint(22) unsigned NOT NULL COMMENT 'идентификатор пользователя',
  `expires` datetime NOT NULL COMMENT 'дата\\время истечения актуальности',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'дата\\время создания',
  PRIMARY KEY (`id`),
  KEY `user_id_expires_idx` (`user_id`,`expires`),
  CONSTRAINT `fk_session_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='сессии';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `session`
--

LOCK TABLES `session` WRITE;
/*!40000 ALTER TABLE `session` DISABLE KEYS */;
INSERT INTO `session` VALUES ('8ab50250e4c0a41802a896a733ab9bdd',1,'0000-00-00 00:00:00','2017-09-27 13:01:51'),('be8ce4375495a77a36ff8048974a1af8',1,'2017-09-27 19:04:51','2017-09-27 15:04:51');
/*!40000 ALTER TABLE `session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` bigint(22) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор',
  `login` varchar(20) NOT NULL COMMENT 'логин',
  `passwd` char(32) NOT NULL COMMENT 'пароль',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'дата\\время создания',
  PRIMARY KEY (`id`),
  UNIQUE KEY `login_UNIQUE` (`login`),
  UNIQUE KEY `passwd` (`passwd`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='пользователь';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'test','db2d303c20b9468bbe90114d3d1874b3','2017-09-27 07:19:51');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'test3'
--
/*!50003 DROP FUNCTION IF EXISTS `fi_account_history` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_UNSIGNED_SUBTRACTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `fi_account_history`(
	`in_account_id` BIGINT( 22 ) UNSIGNED ,
	`in_amount` NUMERIC( 10 , 2 ) UNSIGNED ,
    `in_array` TINYINT( 1 ) UNSIGNED
) RETURNS bigint(22) unsigned
    COMMENT 'Создание транзакции по счёту'
BEGIN
	DECLARE `v_amount` NUMERIC( 10 , 2 ) UNSIGNED DEFAULT (
		SELECT SQL_SMALL_RESULT
			`a1`.`amount`
		FROM
			`account` AS `a1`
		WHERE
			( `a1`.`id` = `in_account_id` )
		LIMIT 1
    ) ;

	IF ( `v_amount` IS null ) THEN
		RETURN null ;
    END IF ;

    IF ( ( `in_array` IS false ) AND ( `v_amount` < `in_amount` ) ) THEN
		RETURN null ;
    END IF ;

	INSERT INTO
		`account_history`
	SET
		`account_id` = `in_account_id` ,
		`amount` = `in_amount` ,
		`array` = `in_array` ;

	RETURN last_insert_id( ) ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fi_session` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_UNSIGNED_SUBTRACTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `fi_session`(
	`in_user_id` BIGINT( 22 ) UNSIGNED ,
    `in_expires` BIGINT( 22 ) UNSIGNED
) RETURNS char(32) CHARSET utf8
    COMMENT 'Создание сессии'
BEGIN
	DECLARE `v_expires` DATETIME DEFAULT from_unixtime( unix_timestamp( ) + `in_expires` ) ;

	UPDATE
		`session` AS `s1`
	SET
		`s1`.`expires` = `v_expires`
    WHERE
		( `s1`.`user_id` = `in_user_id` ) AND
        ( `s1`.`expires` >= current_timestamp( ) ) ;

    IF ( NOT row_count( ) ) THEN
		INSERT INTO
			`session`(
				`id` ,
				`user_id` ,
				`expires`
			)
		SELECT
			md5( uuid( ) ) AS `session_id` ,
			`u1`.`id` AS `user_id` ,
			`v_expires` AS `expires`
		FROM
			`user` AS `u1`
		WHERE
			( `u1`.`id` = `in_user_id` )
		LIMIT 1 ;
    END IF ;

	RETURN `fs_session`( `in_user_id` ) ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fi_user` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_UNSIGNED_SUBTRACTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `fi_user`(
	`in_login` VARCHAR( 20 ) ,
    `in_passwd` VARCHAR( 20 )
) RETURNS bigint(22) unsigned
    COMMENT 'Создание пользователя'
BEGIN
	INSERT INTO
		`user`
	SET
		`login` = `in_login` ,
        `passwd` = `fs_passwd`( `in_login` , `in_passwd` ) ;

	RETURN last_insert_id( ) ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fs_account_history_balance` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_UNSIGNED_SUBTRACTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `fs_account_history_balance`(
	`in_account_id` BIGINT( 22 ) UNSIGNED
) RETURNS decimal(10,2)
    COMMENT 'Баланс счёта'
BEGIN
	RETURN
		`fs_account_history_sum`( `in_account_id` , true ) -
        `fs_account_history_sum`( `in_account_id` , false ) ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fs_account_history_sum` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_UNSIGNED_SUBTRACTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `fs_account_history_sum`(
	`in_account_id` BIGINT( 22 ) UNSIGNED ,
    `in_array` TINYINT( 1 ) UNSIGNED
) RETURNS decimal(10,2) unsigned
    COMMENT 'Сумма счёта под дебиту(0) или по кредиту(1)'
BEGIN
	DECLARE `v_result` NUMERIC( 10 , 2 ) UNSIGNED DEFAULT (
		SELECT SQL_SMALL_RESULT
			sum( `ah1`.`amount` ) AS `debit`
        FROM
			`account_history` AS `ah1`
		WHERE
			( `ah1`.`account_id` = `in_account_id` ) AND
            ( `ah1`.`array` = `in_array` )    
    ) ;

	RETURN coalesce( `v_result` , 0.0 ) ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fs_passwd` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_UNSIGNED_SUBTRACTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `fs_passwd`(
	`in_login` VARCHAR( 20 ) ,
    `in_passwd` VARCHAR( 20 )
) RETURNS char(32) CHARSET utf8
    DETERMINISTIC
    COMMENT 'Хэш логина и пароля'
BEGIN
	RETURN md5( concat( md5( `in_login` ) , md5( `in_passwd` ) ) ) ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fs_session` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_UNSIGNED_SUBTRACTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `fs_session`(
	`in_user_id` BIGINT( 22 ) UNSIGNED
) RETURNS char(32) CHARSET utf8
    COMMENT 'Идентификатор сессии'
BEGIN
	RETURN (
		SELECT SQL_SMALL_RESULT
			`s1`.`id` AS `session_id`
		FROM
			`session` AS `s1`
		WHERE
			( `s1`.`user_id` = `in_user_id` ) AND
			( `s1`.`expires` > current_timestamp( ) )
		LIMIT 1
	) ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fs_user` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_UNSIGNED_SUBTRACTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `fs_user`(
	`in_login` VARCHAR( 20 ) ,
    `in_passwd` VARCHAR( 20 )
) RETURNS bigint(22) unsigned
    COMMENT 'Идентификатор пользователя по логину и паролю'
BEGIN
	RETURN (
		SELECT SQL_SMALL_RESULT
			`u1`.`id` AS `user_id`
        FROM
			`user` AS `u1`
		WHERE
            ( `u1`.`passwd` = `fs_passwd`( `in_login` , `in_passwd` ) )
    ) ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pu_account_amount` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_UNSIGNED_SUBTRACTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `pu_account_amount`(
	`in_account_id` BIGINT( 22 ) UNSIGNED
)
    COMMENT 'Поддержание актуальности поля `amount`'
BEGIN
	UPDATE
		`account` AS `a1`
	SET
		`a1`.`amount` = `fs_account_history_balance`( `in_account_id` )
	WHERE
		( `a1`.`id` = `in_account_id` ) ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-09-27 19:49:52
