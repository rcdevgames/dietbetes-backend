# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: localhost (MySQL 5.7.23)
# Database: dietbetes
# Generation Time: 2019-03-07 10:07:35 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table alarm_reminder
# ------------------------------------------------------------

DROP TABLE IF EXISTS `alarm_reminder`;

CREATE TABLE `alarm_reminder` (
  `id` int(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `title` varchar(55) DEFAULT NULL,
  `note` varchar(55) DEFAULT NULL,
  `remind_at` varchar(5) DEFAULT NULL,
  `remind_on` varchar(255) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `alarm_reminder` WRITE;
/*!40000 ALTER TABLE `alarm_reminder` DISABLE KEYS */;

INSERT INTO `alarm_reminder` (`id`, `user_id`, `title`, `note`, `remind_at`, `remind_on`, `status`, `created_at`, `updated_at`, `deleted_at`)
VALUES
	(1,1,'Makan Pagi','Makan Pagi','08:00','0',1,'2019-02-24 22:09:44','2019-02-28 15:00:21','2019-02-28 15:00:21'),
	(2,1,'Makan Siang','Makan Siang','13:12','0',1,'2019-02-24 22:22:18','2019-02-24 22:22:18',NULL),
	(3,1,'Makan Malam','Makan Malam','13:11','1,6,7',1,'2019-02-24 22:30:05','2019-02-24 22:30:05',NULL);

/*!40000 ALTER TABLE `alarm_reminder` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table diet
# ------------------------------------------------------------

DROP TABLE IF EXISTS `diet`;

CREATE TABLE `diet` (
  `id` int(20) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(5) DEFAULT NULL,
  `calories` double DEFAULT NULL,
  `protein` double DEFAULT NULL,
  `fat` double DEFAULT NULL,
  `carbo` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `diet` WRITE;
/*!40000 ALTER TABLE `diet` DISABLE KEYS */;

INSERT INTO `diet` (`id`, `type`, `calories`, `protein`, `fat`, `carbo`)
VALUES
	(1,'I',1100,43,30,172),
	(2,'II',1300,45,35,192),
	(3,'III',1500,51.5,36.5,235),
	(4,'IV',1900,60,48,299),
	(5,'V',2100,62,53,319),
	(6,'VI',2300,73,59,369),
	(7,'VII',2500,80,62,396);

/*!40000 ALTER TABLE `diet` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table food_journal
# ------------------------------------------------------------

DROP TABLE IF EXISTS `food_journal`;

CREATE TABLE `food_journal` (
  `id` int(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(20) DEFAULT NULL,
  `cal` double DEFAULT '0',
  `carbo` double DEFAULT '0',
  `protein` double DEFAULT '0',
  `fat` double DEFAULT '0',
  `schedule` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `food_journal` WRITE;
/*!40000 ALTER TABLE `food_journal` DISABLE KEYS */;

INSERT INTO `food_journal` (`id`, `user_id`, `cal`, `carbo`, `protein`, `fat`, `schedule`, `created_at`, `updated_at`)
VALUES
	(1,1,130,28.5,2.48,0.23,1,'2019-02-21 18:18:15','2019-02-21 18:18:15'),
	(2,1,155,15.05,11.48,5.16,5,'2019-02-22 13:03:49','2019-02-22 13:03:49');

/*!40000 ALTER TABLE `food_journal` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table food_receipt
# ------------------------------------------------------------

DROP TABLE IF EXISTS `food_receipt`;

CREATE TABLE `food_receipt` (
  `id` int(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(55) DEFAULT NULL,
  `ingredients` text,
  `tutorial` text,
  `image` varchar(255) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table medicines
# ------------------------------------------------------------

DROP TABLE IF EXISTS `medicines`;

CREATE TABLE `medicines` (
  `id` int(20) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(255) DEFAULT NULL,
  `generic` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `dose` varchar(255) DEFAULT NULL,
  `working_hour` varchar(255) DEFAULT NULL,
  `frequent` varchar(255) DEFAULT NULL,
  `suggestion` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `medicines` WRITE;
/*!40000 ALTER TABLE `medicines` DISABLE KEYS */;

INSERT INTO `medicines` (`id`, `type`, `generic`, `name`, `content`, `dose`, `working_hour`, `frequent`, `suggestion`, `created_at`, `updated_at`)
VALUES
	(1,'Sulfonilurea','Klorpropamid','Diabenese','100-250','100-500','24-36','1','Segera Sebelum Makan',NULL,NULL),
	(2,'Sulfonilurea','Glibenklamid','Daonil','2.5-5','2.5-15','12-24','1-1','Segera Sebelum Makan',NULL,NULL),
	(3,'Sulfonilurea','Glipizid','Minidiab','5-10','5-20','10-16','1-2','Segera Sebelum Makan',NULL,NULL),
	(4,'Sulfonilurea','Glipizid','Glucotrol-XL',NULL,NULL,NULL,'1','Segera Sebelum Makan',NULL,NULL),
	(5,'Sulfonilurea','Glikzaid','Diamicron','80','80-240','10-20','1','Segera Sebelum Makan',NULL,NULL),
	(6,'Sulfonilurea','Glikzaid','Diamicron-MR',NULL,NULL,NULL,NULL,'Segera Sebelum Makan',NULL,NULL),
	(7,'Sulfonilurea','Glukuidon','Glurenorm','30','30-120',NULL,'1-1','Segera Sebelum Makan',NULL,NULL),
	(8,'Sulfonilurea','Glimepirid','Amaryl','[1,2,3,4]','0.5-6',NULL,'3','Segera Sebelum Makan',NULL,NULL),
	(9,'Glinid','Repaglinid','NovoNorm','[0.5,1,2','100-500','24-36','3','Segera Sebelum Makan',NULL,NULL),
	(10,'Glinid','Nateglinid','Starflix','120','360',NULL,'1','Segera Sebelum Makan',NULL,NULL),
	(11,'Tiazolidindion','Pioglitazon','Actos, Deculin','15-30','15-30','24','1','Tidak Bergantung Makan',NULL,NULL),
	(12,'Tiazolidindion','Rosiglitazon','Avandia','4','2-4','24','1','Tidak Bergantung Makan',NULL,NULL),
	(13,'Glukosidase Alpha','Acarbose','Glucobay','50-100','100-300',NULL,'3','Bersama Suapan Pertama',NULL,NULL),
	(14,'Buguanid','Metformin','Glucophage*','500-850','250-3000','6-8','1-3','Bersama atau Sesudah Makan',NULL,NULL),
	(15,'Buguanid','Metformin','Glucophage XR','500','500-2000','24','1','Bersama atau Sesudah Makan',NULL,NULL);

/*!40000 ALTER TABLE `medicines` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table notification_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `notification_log`;

CREATE TABLE `notification_log` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `message` text,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `notification_log` WRITE;
/*!40000 ALTER TABLE `notification_log` DISABLE KEYS */;

INSERT INTO `notification_log` (`id`, `message`, `created_at`, `updated_at`)
VALUES
	(1,'','2019-02-24 23:56:28','2019-02-24 23:56:28'),
	(2,'','2019-02-25 11:42:46','2019-02-25 11:42:46'),
	(3,'{\"errors\":[\"Message Notifications must have English language content\"]}','2019-02-25 11:44:17','2019-02-25 11:44:17'),
	(4,'{\"errors\":[\"Message Notifications must have English language content\"]}','2019-02-25 11:44:40','2019-02-25 11:44:40'),
	(5,'{\"errors\":[\"Message Notifications must have English language content\"]}','2019-02-25 11:44:50','2019-02-25 11:44:50'),
	(6,'{\"errors\":[\"Message Notifications must have English language content\"]}','2019-02-25 11:44:55','2019-02-25 11:44:55'),
	(7,'','2019-02-25 11:45:23','2019-02-25 11:45:23'),
	(8,'','2019-02-25 11:52:00','2019-02-25 11:52:00'),
	(9,'','2019-02-25 11:52:50','2019-02-25 11:52:50'),
	(10,'','2019-02-25 12:02:00','2019-02-25 12:02:00'),
	(11,'{\"id\":\"a053e19f-7229-4159-98e2-b34c9ea67d7d\",\"recipients\":1,\"external_id\":null}','2019-02-25 12:03:01','2019-02-25 12:03:01'),
	(12,'{\"id\":\"13e7984c-2bff-4fd2-8b5d-1866a48444f9\",\"recipients\":1,\"external_id\":null}','2019-02-25 12:41:01','2019-02-25 12:41:01'),
	(13,'{\"id\":\"43b71efb-43eb-4a56-b84f-2563d195252e\",\"recipients\":1,\"external_id\":null}','2019-02-25 12:43:01','2019-02-25 12:43:01'),
	(14,'{\"id\":\"e88cd817-e067-41ce-9849-ed6c62bb896c\",\"recipients\":1,\"external_id\":null}','2019-02-25 13:42:01','2019-02-25 13:42:01'),
	(15,'{\"id\":\"9e01c85b-0c4c-4767-94c7-e1036831d77a\",\"recipients\":1,\"external_id\":null}','2019-02-25 13:44:06','2019-02-25 13:44:06'),
	(16,'{\"id\":\"6056a9b0-055e-4430-904a-926b772674ae\",\"recipients\":1,\"external_id\":null}','2019-02-28 13:42:02','2019-02-28 13:42:02'),
	(17,'{\"id\":\"4cdfc44f-c93b-4c05-862f-df864382ed50\",\"recipients\":1,\"external_id\":null}','2019-02-28 13:44:02','2019-02-28 13:44:02'),
	(18,'{\"id\":\"d3d7bd19-dd80-40f1-8ab0-7c9335cfd31f\",\"recipients\":1,\"external_id\":null}','2019-03-03 01:57:02','2019-03-03 01:57:02'),
	(19,'{\"id\":\"c8929cf9-8895-46b1-8722-5d3c5b0dbe04\",\"recipients\":1,\"external_id\":null}','2019-03-03 01:58:01','2019-03-03 01:58:01'),
	(20,'{\"id\":\"c1a2f063-f694-49f8-9ac6-70c05e715360\",\"recipients\":1,\"external_id\":null}','2019-03-03 13:11:02','2019-03-03 13:11:02'),
	(21,'{\"id\":\"5037fd9a-9bb4-433e-9812-a917d4d7d06e\",\"recipients\":1,\"external_id\":null}','2019-03-03 13:12:01','2019-03-03 13:12:01'),
	(22,'{\"id\":\"01abbddc-a640-4496-bc85-2f7d0aeb863c\",\"recipients\":1,\"external_id\":null}','2019-03-04 13:12:06','2019-03-04 13:12:06'),
	(23,'{\"id\":\"3d7a17f8-1eca-4797-95e2-91d4ef3682ce\",\"recipients\":1,\"external_id\":null}','2019-03-06 13:12:05','2019-03-06 13:12:05');

/*!40000 ALTER TABLE `notification_log` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table user_detail
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_detail`;

CREATE TABLE `user_detail` (
  `id` int(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(20) DEFAULT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  `call_name` varchar(255) DEFAULT NULL,
  `gender` tinyint(1) DEFAULT '1',
  `dob` date DEFAULT NULL,
  `physical_activity` tinyint(1) DEFAULT '1',
  `height` int(11) DEFAULT '0',
  `weight` int(11) DEFAULT '0',
  `ideal_weight` double DEFAULT NULL,
  `mass_index` double DEFAULT NULL,
  `history_family` tinyint(1) DEFAULT '0',
  `chol_total` int(11) DEFAULT NULL,
  `chol_ldl` int(11) DEFAULT NULL,
  `chol_hdl` int(11) DEFAULT NULL,
  `triglesida` int(11) DEFAULT NULL,
  `blood_pressure` varchar(15) DEFAULT NULL,
  `clinical_symptoms` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `user_detail` WRITE;
/*!40000 ALTER TABLE `user_detail` DISABLE KEYS */;

INSERT INTO `user_detail` (`id`, `user_id`, `full_name`, `call_name`, `gender`, `dob`, `physical_activity`, `height`, `weight`, `ideal_weight`, `mass_index`, `history_family`, `chol_total`, `chol_ldl`, `chol_hdl`, `triglesida`, `blood_pressure`, `clinical_symptoms`, `created_at`, `updated_at`)
VALUES
	(1,1,'Angel Jovi','Angel',0,'1997-07-21',2,163,49,60,49,0,200,130,80,280,'160/100','[1,2,3,4]','2019-01-28 18:32:06','2019-01-29 13:08:39'),
	(2,2,'Rizky Andhika Putra','Rizky',1,'1988-11-25',1,170,98,63,33.9,0,200,130,80,280,'110/80','[1]','2019-02-05 07:26:59','2019-02-05 07:26:59'),
	(3,3,'Angel Jovi','Angel',0,'1994-11-25',1,165,55,60,19,1,123,123,123,123,'110/80','[1,2,3,4]','2019-02-15 12:58:45','2019-02-15 12:58:45');

/*!40000 ALTER TABLE `user_detail` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table user_diet_required
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_diet_required`;

CREATE TABLE `user_diet_required` (
  `id` int(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(20) DEFAULT NULL,
  `calories` double DEFAULT '0',
  `carbo` double DEFAULT '0',
  `protein` double DEFAULT '0',
  `fat` double DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `user_diet_required` WRITE;
/*!40000 ALTER TABLE `user_diet_required` DISABLE KEYS */;

INSERT INTO `user_diet_required` (`id`, `user_id`, `calories`, `carbo`, `protein`, `fat`, `created_at`, `updated_at`)
VALUES
	(1,1,1300,192,45,35,'2019-02-21 18:17:44','2019-02-21 18:17:44'),
	(2,1,1300,192,45,35,'2019-02-22 17:50:52','2019-02-22 17:50:52'),
	(3,1,1300,192,45,35,'2019-02-23 04:16:42','2019-02-23 04:16:42'),
	(4,1,1300,192,45,35,'2019-02-23 04:16:42','2019-02-23 04:16:42'),
	(5,1,1300,192,45,35,'2019-02-24 05:03:44','2019-02-24 05:03:44'),
	(6,1,1300,192,45,35,'2019-02-24 05:03:44','2019-02-24 05:03:44'),
	(7,1,1300,192,45,35,'2019-02-24 05:03:44','2019-02-24 05:03:44'),
	(8,1,1300,192,45,35,'2019-02-25 00:09:41','2019-02-25 00:09:41'),
	(9,1,1300,192,45,35,'2019-02-27 19:04:18','2019-02-27 19:04:18'),
	(10,1,1300,192,45,35,'2019-02-28 12:02:04','2019-02-28 12:02:04'),
	(11,1,1300,192,45,35,'2019-02-28 12:02:04','2019-02-28 12:02:04'),
	(12,1,1300,192,45,35,'2019-03-01 14:28:08','2019-03-01 14:28:08'),
	(13,1,1300,192,45,35,'2019-03-01 14:28:08','2019-03-01 14:28:08'),
	(14,1,1300,192,45,35,'2019-03-04 01:17:08','2019-03-04 01:17:08'),
	(15,1,1300,192,45,35,'2019-03-04 01:17:08','2019-03-04 01:17:08'),
	(16,1,1300,192,45,35,'2019-03-06 11:42:20','2019-03-06 11:42:20'),
	(17,1,1300,192,45,35,'2019-03-07 16:02:18','2019-03-07 16:02:18');

/*!40000 ALTER TABLE `user_diet_required` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table user_glucose
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_glucose`;

CREATE TABLE `user_glucose` (
  `id` int(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(20) DEFAULT NULL,
  `hba1c` double DEFAULT NULL,
  `gdp` int(11) DEFAULT NULL,
  `gds` int(11) DEFAULT NULL,
  `ttgo` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `user_glucose` WRITE;
/*!40000 ALTER TABLE `user_glucose` DISABLE KEYS */;

INSERT INTO `user_glucose` (`id`, `user_id`, `hba1c`, `gdp`, `gds`, `ttgo`, `date`, `created_at`, `updated_at`)
VALUES
	(1,1,7,210,270,250,'2019-01-27','2019-01-28 18:32:06','2019-01-28 18:32:06'),
	(2,1,7,210,270,250,'2019-01-28','2019-01-30 10:21:35','2019-01-30 10:21:35'),
	(3,1,7,210,270,250,'2019-01-29','2019-01-30 10:24:17','2019-01-30 10:24:17'),
	(4,2,7,210,270,250,'2019-02-04','2019-02-05 07:26:59','2019-02-05 07:26:59'),
	(5,3,123,123,123,123,'2019-02-15','2019-02-15 12:58:45','2019-02-15 12:58:45'),
	(6,1,5,100,65,125,'2019-02-17','2019-02-17 09:33:45','2019-02-17 09:33:45');

/*!40000 ALTER TABLE `user_glucose` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table user_medicine
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_medicine`;

CREATE TABLE `user_medicine` (
  `id` int(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(20) DEFAULT NULL,
  `medicine_id` int(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `user_medicine` WRITE;
/*!40000 ALTER TABLE `user_medicine` DISABLE KEYS */;

INSERT INTO `user_medicine` (`id`, `user_id`, `medicine_id`, `created_at`, `updated_at`)
VALUES
	(1,1,1,NULL,NULL),
	(2,1,2,NULL,NULL),
	(3,1,3,NULL,NULL),
	(4,2,2,NULL,NULL),
	(5,3,1,NULL,NULL),
	(6,3,2,NULL,NULL),
	(7,3,3,NULL,NULL);

/*!40000 ALTER TABLE `user_medicine` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table user_reset_password
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_reset_password`;

CREATE TABLE `user_reset_password` (
  `id` int(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(20) DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  `use` tinyint(1) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(20) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(25) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `token` text,
  `google_token` text,
  `onesignal_token` text,
  `avatar_url` text,
  `last_login` datetime DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`id`, `email`, `password`, `token`, `google_token`, `onesignal_token`, `avatar_url`, `last_login`, `status`, `created_at`, `updated_at`)
VALUES
	(1,'admin@dietbetes.com','$2y$10$vemGZj4iPnji9hd856ElR.laY28lYv9Nolu90cjmzp1bIvkhZ8xAm','eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOjEsImlzcyI6Imh0dHA6Ly8xMC4wLjAuOTkvYXBpL3YxL2F1dGgvbG9naW4iLCJpYXQiOjE1NTE4NjQyNDMsImV4cCI6MTU1NDQ1NjI0MywibmJmIjoxNTUxODY0MjQzLCJqdGkiOiI3NklIRnJweHMxdXJ5M0NWIn0.s4hg3odKbfYi90UYU4LA6QhwVgtmwwRiZGreUCe1AWI',NULL,'d2eae6df-9b97-410b-95cf-eb1b974463de','hqhyovzs-1548784355.jpg','2019-03-06 16:24:03',1,'2019-01-28 18:32:06','2019-03-06 16:24:03'),
	(2,'rcdev.games@gmail.com','$2y$10$6UdHBDWK4rHAI.pIjNqupe5O5dhKkdZ2bhR2pOLn4jS1JbOAh.5rm','eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOm51bGwsImlzcyI6Imh0dHA6Ly9kaWV0YmV0ZXMubG9jYWwvYXBpL3YxL2F1dGgvcmVnaXN0ZXIiLCJpYXQiOjE1NDkzNTE2MTksImV4cCI6MTU1MTk0MzYxOSwibmJmIjoxNTQ5MzUxNjE5LCJqdGkiOiJ2Zkw2Y1ZxYzF0bGFtblFRIn0.14VKqUJtKJPKPWKDl3pp_x5hTEMmZU_ns_JFt5fZXlI',NULL,NULL,NULL,'2019-02-05 07:26:59',1,'2019-02-05 07:26:59','2019-02-05 07:26:59'),
	(3,'admin1@dietbetes.com','$2y$10$/HNb5NBFIP1BCxqEuMD10uf2az8wO0W1qwW6m6J2PyTRNQ2etAt6y','eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOm51bGwsImlzcyI6Imh0dHA6Ly9kaWV0YmV0ZXMubG9jYWwvYXBpL3YxL2F1dGgvcmVnaXN0ZXIiLCJpYXQiOjE1NTAyMzU1MjUsImV4cCI6MTU1MjgyNzUyNSwibmJmIjoxNTUwMjM1NTI1LCJqdGkiOiJLMzFiSGRJdEhOVHlYeHpBIn0.k_OsqYXjHlykRG3e9nhxArvlMf6wQQ7amb942a-lpnA',NULL,NULL,NULL,'2019-02-15 12:58:45',1,'2019-02-15 12:58:45','2019-02-15 12:58:45');

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
