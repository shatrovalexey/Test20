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
  `id` bigint(22) unsigned zerofill NOT NULL AUTO_INCREMENT COMMENT 'идентификатор',
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
INSERT INTO `account` VALUES (0000000000000000000001,1,996.00,'2017-09-28 10:44:34');
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_history`
--

DROP TABLE IF EXISTS `account_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_history` (
  `id` bigint(22) unsigned zerofill NOT NULL AUTO_INCREMENT COMMENT 'идентификатор',
  `account_id` bigint(22) unsigned zerofill NOT NULL COMMENT 'идентификатор счёта',
  `amount` decimal(10,2) unsigned NOT NULL COMMENT 'сумма',
  `array` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0=дебит, 1=кредит',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'дата\\время создания',
  PRIMARY KEY (`id`),
  KEY `fk_account_history_account_idx` (`account_id`),
  KEY `idx_account_id_array` (`account_id`,`array`),
  CONSTRAINT `fk_account_history_account` FOREIGN KEY (`account_id`) REFERENCES `account` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8 COMMENT='Транзакции счёта';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_history`
--

LOCK TABLES `account_history` WRITE;
/*!40000 ALTER TABLE `account_history` DISABLE KEYS */;
INSERT INTO `account_history` VALUES (0000000000000000000001,0000000000000000000001,100.00,1,'2017-09-27 18:29:16'),(0000000000000000000005,0000000000000000000001,1.00,0,'2017-09-27 14:51:31'),(0000000000000000000006,0000000000000000000001,1.00,0,'2017-09-27 14:51:40'),(0000000000000000000007,0000000000000000000001,1.00,0,'2017-09-27 15:03:26'),(0000000000000000000008,0000000000000000000001,1.00,0,'2017-09-27 15:04:55'),(0000000000000000000009,0000000000000000000001,23.00,0,'2017-09-27 17:13:10'),(0000000000000000000010,0000000000000000000001,0.00,0,'2017-09-27 17:13:58'),(0000000000000000000011,0000000000000000000001,1.00,0,'2017-09-27 17:15:40'),(0000000000000000000012,0000000000000000000001,1.00,1,'2017-09-27 17:36:47'),(0000000000000000000013,0000000000000000000001,1.00,1,'2017-09-27 17:42:03'),(0000000000000000000014,0000000000000000000001,1.00,1,'2017-09-27 17:43:07'),(0000000000000000000015,0000000000000000000001,1.00,0,'2017-09-27 17:43:09'),(0000000000000000000016,0000000000000000000001,1.00,0,'2017-09-27 17:43:35'),(0000000000000000000017,0000000000000000000001,1.00,1,'2017-09-27 17:43:37'),(0000000000000000000018,0000000000000000000001,1.00,1,'2017-09-27 17:43:39'),(0000000000000000000019,0000000000000000000001,1.00,0,'2017-09-27 17:43:42'),(0000000000000000000020,0000000000000000000001,1.00,0,'2017-09-27 17:43:43'),(0000000000000000000021,0000000000000000000001,1.00,0,'2017-09-27 17:43:44'),(0000000000000000000022,0000000000000000000001,1.00,0,'2017-09-27 17:43:45'),(0000000000000000000023,0000000000000000000001,1.00,1,'2017-09-27 17:44:57'),(0000000000000000000024,0000000000000000000001,11.00,1,'2017-09-27 17:45:02'),(0000000000000000000025,0000000000000000000001,10.00,0,'2017-09-27 17:52:46'),(0000000000000000000026,0000000000000000000001,10.00,0,'2017-09-27 17:52:48'),(0000000000000000000027,0000000000000000000001,10.00,0,'2017-09-27 17:52:54'),(0000000000000000000028,0000000000000000000001,10.00,0,'2017-09-27 17:52:54'),(0000000000000000000029,0000000000000000000001,10.00,0,'2017-09-27 17:52:54'),(0000000000000000000030,0000000000000000000001,10.00,0,'2017-09-27 17:52:54'),(0000000000000000000031,0000000000000000000001,10.00,0,'2017-09-27 17:52:54'),(0000000000000000000032,0000000000000000000001,10.00,0,'2017-09-27 17:52:55'),(0000000000000000000033,0000000000000000000001,10.00,1,'2017-09-27 17:53:01'),(0000000000000000000034,0000000000000000000001,10.00,1,'2017-09-27 17:53:01'),(0000000000000000000035,0000000000000000000001,10.00,1,'2017-09-27 17:53:01'),(0000000000000000000036,0000000000000000000001,10.00,1,'2017-09-27 17:53:01'),(0000000000000000000037,0000000000000000000001,10.00,1,'2017-09-27 17:53:01'),(0000000000000000000038,0000000000000000000001,10.00,1,'2017-09-27 17:53:02'),(0000000000000000000039,0000000000000000000001,13.00,1,'2017-09-27 17:53:04'),(0000000000000000000040,0000000000000000000001,13.00,1,'2017-09-27 17:53:04'),(0000000000000000000041,0000000000000000000001,13.00,1,'2017-09-27 17:53:04'),(0000000000000000000042,0000000000000000000001,13.00,1,'2017-09-27 17:53:05'),(0000000000000000000043,0000000000000000000001,13.00,1,'2017-09-27 17:53:05'),(0000000000000000000044,0000000000000000000001,13.00,1,'2017-09-27 17:53:05'),(0000000000000000000045,0000000000000000000001,13.00,1,'2017-09-27 17:53:05'),(0000000000000000000046,0000000000000000000001,13.00,1,'2017-09-27 17:53:05'),(0000000000000000000047,0000000000000000000001,13.00,1,'2017-09-27 17:53:05'),(0000000000000000000048,0000000000000000000001,13.00,1,'2017-09-27 17:53:05'),(0000000000000000000049,0000000000000000000001,13.00,1,'2017-09-27 17:53:06'),(0000000000000000000050,0000000000000000000001,13.00,1,'2017-09-27 17:53:06'),(0000000000000000000051,0000000000000000000001,13.00,1,'2017-09-27 17:53:24'),(0000000000000000000052,0000000000000000000001,10.00,0,'2017-09-27 17:55:42'),(0000000000000000000053,0000000000000000000001,10.00,0,'2017-09-27 17:58:16'),(0000000000000000000054,0000000000000000000001,1.00,0,'2017-09-27 18:26:20'),(0000000000000000000055,0000000000000000000001,1.00,0,'2017-09-27 18:26:29'),(0000000000000000000056,0000000000000000000001,1.00,0,'2017-09-27 18:26:48'),(0000000000000000000057,0000000000000000000001,1.00,0,'2017-09-27 18:27:37'),(0000000000000000000058,0000000000000000000001,1.00,0,'2017-09-27 18:27:42'),(0000000000000000000059,0000000000000000000001,1.00,0,'2017-09-27 18:28:27'),(0000000000000000000060,0000000000000000000001,1.00,0,'2017-09-27 18:28:27'),(0000000000000000000061,0000000000000000000001,100.00,0,'2017-09-27 18:28:43'),(0000000000000000000062,0000000000000000000001,100.00,0,'2017-09-27 18:28:43'),(0000000000000000000063,0000000000000000000001,5.00,0,'2017-09-27 18:29:31'),(0000000000000000000064,0000000000000000000001,1000.00,1,'2017-09-27 18:30:37'),(0000000000000000000065,0000000000000000000001,1.00,0,'2017-09-27 18:36:18'),(0000000000000000000066,0000000000000000000001,1.00,0,'2017-09-27 18:40:36'),(0000000000000000000067,0000000000000000000001,1.00,0,'2017-09-28 10:44:18'),(0000000000000000000068,0000000000000000000001,1.00,1,'2017-09-28 10:44:21'),(0000000000000000000069,0000000000000000000001,1.00,0,'2017-09-28 10:44:23'),(0000000000000000000070,0000000000000000000001,1.00,0,'2017-09-28 10:44:34');
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
INSERT INTO `session` VALUES ('05f5ca9d26d68e3dfdd8a1fda6a980aa',1,'2017-09-27 22:40:25','2017-09-27 18:40:25'),('7b6d6c16a57494c22459593388dc9e1b',1,'2017-09-28 17:09:38','2017-09-28 13:09:38'),('8ab50250e4c0a41802a896a733ab9bdd',1,'0000-00-00 00:00:00','2017-09-27 13:01:51'),('be8ce4375495a77a36ff8048974a1af8',1,'2017-09-27 19:04:51','2017-09-27 15:04:51'),('e8ebd0ecbd97edf6cd2a29f37f29e25c',1,'2017-09-28 12:49:16','2017-09-28 08:49:16'),('e8f517726563540317142e97b1bc9b0c',1,'2017-09-28 14:43:25','2017-09-28 10:43:25');
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
    DETERMINISTIC
    COMMENT 'Идентификатор пользователя по логину и паролю'
BEGIN
	RETURN (
		SELECT SQL_SMALL_RESULT
			`u1`.`id` AS `user_id`
        FROM
			`user` AS `u1`
		WHERE
            ( `u1`.`passwd` = `fs_passwd`( `in_login` , `in_passwd` ) )
		LIMIT 1
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

-- Dump completed on 2017-09-28 16:17:13
