# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: localhost (MySQL 5.7.23)
# Database: bali_db
# Generation Time: 2019-02-11 07:00:12 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table articleblog
# ------------------------------------------------------------

DROP TABLE IF EXISTS `articleblog`;

CREATE TABLE `articleblog` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(11) DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image_banner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_article` text COLLATE utf8mb4_unicode_ci,
  `article` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `articleblog` WRITE;
/*!40000 ALTER TABLE `articleblog` DISABLE KEYS */;

INSERT INTO `articleblog` (`id`, `category_id`, `slug`, `title`, `image_banner`, `short_article`, `article`, `status`, `created_at`, `updated_at`, `deleted_at`)
VALUES
	(1,1,'running-deer-in-the-wild-safary','Running deer in the wild safary','1548409159-slider-2.jpg','<p>Proin gravida nibh vel velit auctor aliquet. Aenean sollicitudin, lorem quis bibendum auctor, nisi elit consequat ipsum, nec sagittis sem nibh id elit. Duis sed odio sit amet vulputate cursus a sit amet mauris. Morbi accumsan ipsum velit.</p>','<p>Proin gravida nibh vel velit auctor aliquet. Aenean sollicitudin, lorem quis bibendum auctor, nisi elit consequat ipsum, nec sagittis sem nibh id elit. Duis sed odio sit amet vulputate cursus a sit amet mauris. Morbi accumsan ipsum velit.</p>','1','2019-01-25 09:39:19','2019-01-27 04:50:11',NULL),
	(2,2,'climbing-higher-altitudes','Climbing higher altitudes','1548439381-slider-1.jpg',NULL,'<p>Proin gravida nibh vel velit auctor aliquet. Aenean sollicitudin, lorem quis bibendum auctor, nisi elit consequat ipsum, nec sagittis sem nibh id elit. Duis sed odio sit amet vulputate cursus a sit amet mauris. Morbi accumsan ipsum velit.</p>','1','2019-01-25 18:03:01','2019-01-25 18:04:35',NULL),
	(3,2,'admiring-the-beauty-of-the-mountains','Admiring the beauty of the mountains','1548439427-slider-3.jpg',NULL,'<p>Proin gravida nibh vel velit auctor aliquet. Aenean sollicitudin, lorem quis bibendum auctor, nisi elit consequat ipsum, nec sagittis sem nibh id elit. Duis sed odio sit amet vulputate cursus a sit amet mauris. Morbi accumsan ipsum velit.</p>','1','2019-01-25 18:03:47','2019-01-25 18:03:47',NULL);

/*!40000 ALTER TABLE `articleblog` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table banner
# ------------------------------------------------------------

DROP TABLE IF EXISTS `banner`;

CREATE TABLE `banner` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `image_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image_file` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `banner` WRITE;
/*!40000 ALTER TABLE `banner` DISABLE KEYS */;

INSERT INTO `banner` (`id`, `image_name`, `image_file`, `description`, `created_at`, `updated_at`, `deleted_at`)
VALUES
	(1,'Banner1','1548054060-slider-1.jpg','<p>Description</p>','2019-01-21 06:58:30','2019-01-24 14:06:57','2019-01-24 14:06:57'),
	(2,'EXTRA VALUE PACKAGES','1548338859-slider-1.jpg','<p>Save Up to 25% on Our Combination Tours</p>','2019-01-24 14:07:40','2019-01-24 14:07:40',NULL),
	(3,'EXTRA VALUE PACKAGES','1548338880-slider-2.jpg','<p>Save Up to 25% on Our Combination Tours</p>','2019-01-24 14:08:00','2019-01-24 14:08:00',NULL),
	(4,'EXTRA VALUE PACKAGES','1548338897-slider-3.jpg','<p>Save Up to 25% on Our Combination Tours</p>','2019-01-24 14:08:17','2019-01-24 14:08:17',NULL),
	(5,'EXTRA VALUE PACKAGES','1548338906-slider-4.jpg','<p>Save Up to 25% on Our Combination Tours</p>','2019-01-24 14:08:26','2019-01-24 14:08:26',NULL);

/*!40000 ALTER TABLE `banner` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table categoryblog
# ------------------------------------------------------------

DROP TABLE IF EXISTS `categoryblog`;

CREATE TABLE `categoryblog` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `categoryblog` WRITE;
/*!40000 ALTER TABLE `categoryblog` DISABLE KEYS */;

INSERT INTO `categoryblog` (`id`, `slug`, `category_name`, `description`, `created_at`, `updated_at`, `deleted_at`)
VALUES
	(1,'how-to','How to','<p>description</p>','2019-01-25 09:07:33','2019-01-25 09:08:10',NULL),
	(2,'travel','Travel',NULL,'2019-01-25 18:00:25','2019-01-25 18:00:25',NULL);

/*!40000 ALTER TABLE `categoryblog` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table categorygallery
# ------------------------------------------------------------

DROP TABLE IF EXISTS `categorygallery`;

CREATE TABLE `categorygallery` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `categorygallery` WRITE;
/*!40000 ALTER TABLE `categorygallery` DISABLE KEYS */;

INSERT INTO `categorygallery` (`id`, `category_name`, `description`, `created_at`, `updated_at`, `deleted_at`)
VALUES
	(1,'Cycling','<p>Cycling Tour</p>','2019-01-21 07:52:27','2019-01-25 17:23:37',NULL),
	(2,'Trekking Sunrise','<p>Trekking Sunrise Mount Batur</p>','2019-01-25 17:24:05','2019-01-25 17:24:05',NULL),
	(3,'Rafting','<p>Rafting Ubud</p>','2019-01-25 17:24:25','2019-01-25 17:24:25',NULL),
	(4,'ATV','<p>ATV Taro Adventure</p>','2019-01-25 17:25:04','2019-01-25 17:25:04',NULL),
	(5,'Jungle Trekking','<p>Jungle Trekking, Meditation. Cleaning &amp; Blessing</p>','2019-01-25 17:25:40','2019-01-25 17:25:40',NULL),
	(6,'VW Classic Tour','<p>VW Classic Tour</p>','2019-01-25 17:26:05','2019-01-25 17:26:05',NULL);

/*!40000 ALTER TABLE `categorygallery` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table categoryvideo
# ------------------------------------------------------------

DROP TABLE IF EXISTS `categoryvideo`;

CREATE TABLE `categoryvideo` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `categoryvideo` WRITE;
/*!40000 ALTER TABLE `categoryvideo` DISABLE KEYS */;

INSERT INTO `categoryvideo` (`id`, `category_name`, `description`, `created_at`, `updated_at`, `deleted_at`)
VALUES
	(1,'Trekking Sunrise','<p>Trekking Sunrise</p>','2019-01-23 04:01:24','2019-01-25 17:49:10','2019-01-25 17:49:10'),
	(2,'Rafting','<p>Rafting</p>','2019-01-25 17:43:45','2019-01-25 17:49:07','2019-01-25 17:49:07'),
	(3,'Trekking Sunrise',NULL,'2019-01-25 17:49:17','2019-01-25 17:49:17',NULL),
	(4,'Rafting',NULL,'2019-01-25 17:49:24','2019-01-25 17:49:24',NULL);

/*!40000 ALTER TABLE `categoryvideo` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table event
# ------------------------------------------------------------

DROP TABLE IF EXISTS `event`;

CREATE TABLE `event` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image_file` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `long_description` text COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `event` WRITE;
/*!40000 ALTER TABLE `event` DISABLE KEYS */;

INSERT INTO `event` (`id`, `slug`, `title`, `image_file`, `short_description`, `long_description`, `status`, `created_at`, `updated_at`, `deleted_at`)
VALUES
	(1,'sed-ut-perspiciatis-unde-omnis','SED UT PERSPICIATIS UNDE OMNIS','[\"1548564216-bali.jpg\",\"1548564217-enduro-adventures-bali.jpg\"]','<p>There are many variations of passages of Lorem Ipsum available but the is majority have suffered alteration in some form by injected humour dummy randomised words which don&#39;t look even slightly believable. If you are that going to use a passage of Lorem Ipsum you need to be sure there isn&#39;t is an anything embarrassing hidden in the middle of text.</p>',NULL,1,'2019-01-24 18:18:11','2019-01-27 04:43:37',NULL),
	(2,'nemo-enim-ipsam-voluptatem','NEMO ENIM IPSAM VOLUPTATEM','[\"1548564255-enduro-adventures-bali.jpg\",\"1548564255-slider-1.jpg\"]','<p>There are many variations of passages of Lorem Ipsum available but the is majority have suffered alteration in some form by injected humour dummy randomised words which don&#39;t look even slightly believable. If you are that going to use a passage of Lorem Ipsum you need to be sure there isn&#39;t is an anything embarrassing hidden in the middle of text.</p>',NULL,1,'2019-01-24 18:19:01','2019-01-27 04:44:15',NULL),
	(3,'ut-enim-ad-minima','UT ENIM AD MINIMA','[\"1548564265-bali.jpg\",\"1548564265-slider-3.jpg\"]','<p>There are many variations of passages of Lorem Ipsum available but the is majority have suffered alteration in some form by injected humour dummy randomised words which don&#39;t look even slightly believable. If you are that going to use a passage of Lorem Ipsum you need to be sure there isn&#39;t is an anything embarrassing hidden in the middle of text.</p>',NULL,1,'2019-01-24 18:19:30','2019-01-27 04:44:25',NULL),
	(4,'duis-aute','DUIS AUTE','[\"1548564283-overlay_bg.jpg\",\"1548564284-safari-journey.jpg\"]','<p>There are many variations of passages of Lorem Ipsum available but the is majority have suffered alteration in some form by injected humour dummy randomised words which don&#39;t look even slightly believable. If you are that going to use a passage of Lorem Ipsum you need to be sure there isn&#39;t is an anything embarrassing hidden in the middle of text.</p>',NULL,1,'2019-01-24 18:19:52','2019-01-27 04:44:44',NULL),
	(5,'test','Test','1548383140-overlay_bg.jpg','<p>Test</p>','<p>test</p>',1,'2019-01-25 02:25:40','2019-01-27 04:45:05','2019-01-27 04:45:05');

/*!40000 ALTER TABLE `event` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table imagegallery
# ------------------------------------------------------------

DROP TABLE IF EXISTS `imagegallery`;

CREATE TABLE `imagegallery` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_file` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `imagegallery` WRITE;
/*!40000 ALTER TABLE `imagegallery` DISABLE KEYS */;

INSERT INTO `imagegallery` (`id`, `category_id`, `image_file`, `Description`, `created_at`, `updated_at`, `deleted_at`)
VALUES
	(1,'[1]','1548437211-slideshow18.jpg','<p>Cycling Tour</p>','2019-01-21 09:28:47','2019-01-25 17:26:52',NULL),
	(2,'[2]','1548437344-download-copy-2.jpeg','<p>Trekking Sunrise Mount Batur</p>','2019-01-25 07:55:29','2019-01-25 17:29:04',NULL),
	(3,'[3]','1548438125-rafting-5431518782.jpg','<p>Rafting Ubud</p>','2019-01-25 17:27:19','2019-01-25 17:42:05',NULL),
	(4,'[2]','1548437297-download-copy-2.jpeg','<p>Trekking Sunrise Mount Batur</p>','2019-01-25 17:28:17','2019-01-25 17:28:46','2019-01-25 17:28:46'),
	(5,'[4]','1548437408-atvred1.jpg','<p>ATV Taro Adventure</p>','2019-01-25 17:30:08','2019-01-25 17:30:08',NULL),
	(6,'[5]','1548437579-screenshot-312.jpg','<p>Jungle Trekking</p>','2019-01-25 17:32:59','2019-01-25 17:32:59',NULL),
	(7,'[6]','1548437605-baliquadbiking3.png','<p>VW Classic Tour</p>','2019-01-25 17:33:26','2019-01-25 17:33:26',NULL),
	(8,'[1]','1548437654-slideshow19.jpg','<p>Cycling</p>','2019-01-25 17:34:14','2019-01-25 17:34:14',NULL),
	(9,'[1]','1548437672-slideshow20.jpg','<p>Cycling</p>','2019-01-25 17:34:32','2019-01-25 17:34:32',NULL),
	(10,'[6]','1548437697-0d6add09d8cdce934cfbb4f5f17b023c.jpg','<p>VW</p>','2019-01-25 17:34:57','2019-01-25 17:34:57',NULL),
	(11,'[5]','1548437715-screenshot-313.jpg','<p>Jungle</p>','2019-01-25 17:35:15','2019-01-25 17:35:15',NULL),
	(12,'[2]','1548437745-mt_pulag_sunrise.jpg','<p>Sunrise Trekking</p>','2019-01-25 17:35:46','2019-01-25 17:35:46',NULL),
	(13,'[2]','1548437763-Mt-Kenya.jpg','<p>Trekking</p>','2019-01-25 17:36:03','2019-01-25 17:36:03',NULL),
	(14,'[4]','1548437788-atvred1.jpg','<p>Atv</p>','2019-01-25 17:36:28','2019-01-25 17:36:28',NULL),
	(15,'[3]','1548438013-arung-jeram-yang-menantang-sekaligus-menyenangkan-e1527581619561.jpg','<p>rafting</p>','2019-01-25 17:36:53','2019-01-25 17:40:13',NULL),
	(16,'[3]','1548438090-sobek-rafting-4.jpg','<p>Rafting</p>','2019-01-25 17:37:08','2019-01-25 17:41:30',NULL),
	(17,'[4]','1548437850-bali-pertiwi-atv.jpg','<p>atv</p>','2019-01-25 17:37:30','2019-01-25 17:37:30',NULL),
	(18,'[5]','1548437870-Hillraches_b4.jpg',NULL,'2019-01-25 17:37:50','2019-01-25 17:37:50',NULL),
	(19,'[6]','1548437880-31af06750b4c0e48c10d3bf0e5daa9a8.jpg',NULL,'2019-01-25 17:38:01','2019-01-25 17:38:01',NULL);

/*!40000 ALTER TABLE `imagegallery` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table images
# ------------------------------------------------------------

DROP TABLE IF EXISTS `images`;

CREATE TABLE `images` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `for` int(11) DEFAULT NULL,
  `file_name` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table listvideo
# ------------------------------------------------------------

DROP TABLE IF EXISTS `listvideo`;

CREATE TABLE `listvideo` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image_file` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `link` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `listvideo` WRITE;
/*!40000 ALTER TABLE `listvideo` DISABLE KEYS */;

INSERT INTO `listvideo` (`id`, `category_id`, `name`, `image_file`, `link`, `description`, `created_at`, `updated_at`, `deleted_at`)
VALUES
	(1,'[1]','Video Test','1548438305-video-1.jpg','https://www.youtube.com/watch?v=FzVR_fymZw4','<p>description</p>','2019-01-25 07:30:20','2019-01-25 17:51:29','2019-01-25 17:51:29'),
	(2,'[2]','Test video list','1548438323-video-2.jpg','https://www.youtube.com/watch?v=FzVR_fymZw4','<p>rafting</p>','2019-01-25 07:47:25','2019-01-25 17:51:32','2019-01-25 17:51:32'),
	(3,'[4]','rafting','1548438752-video-1.jpg','https://www.youtube.com/watch?v=ibuUmMhD2Pg',NULL,'2019-01-25 17:52:32','2019-01-25 17:52:32',NULL),
	(4,'[3]','Trekking','1548438771-video-2.jpg','https://www.youtube.com/watch?v=ibuUmMhD2Pg',NULL,'2019-01-25 17:52:51','2019-01-25 17:52:51',NULL);

/*!40000 ALTER TABLE `listvideo` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table menu_role
# ------------------------------------------------------------

DROP TABLE IF EXISTS `menu_role`;

CREATE TABLE `menu_role` (
  `menu_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  UNIQUE KEY `menu_role_menu_id_role_id_unique` (`menu_id`,`role_id`),
  KEY `menu_role_menu_id_index` (`menu_id`),
  KEY `menu_role_role_id_index` (`role_id`),
  CONSTRAINT `menu_role_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE,
  CONSTRAINT `menu_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `menu_role` WRITE;
/*!40000 ALTER TABLE `menu_role` DISABLE KEYS */;

INSERT INTO `menu_role` (`menu_id`, `role_id`)
VALUES
	(3,1),
	(4,1),
	(5,1),
	(6,1),
	(7,1),
	(8,1),
	(9,1),
	(10,1),
	(11,1),
	(12,1),
	(13,1),
	(16,1),
	(17,1),
	(18,1),
	(19,1),
	(20,1),
	(21,1),
	(22,1),
	(25,1);

/*!40000 ALTER TABLE `menu_role` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table menus
# ------------------------------------------------------------

DROP TABLE IF EXISTS `menus`;

CREATE TABLE `menus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `position` int(11) DEFAULT NULL,
  `menu_type` int(11) NOT NULL DEFAULT '1',
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `menus_name_unique` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `menus` WRITE;
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;

INSERT INTO `menus` (`id`, `position`, `menu_type`, `icon`, `name`, `title`, `parent_id`, `created_at`, `updated_at`)
VALUES
	(1,NULL,0,NULL,'User','User',NULL,NULL,NULL),
	(2,NULL,0,NULL,'Role','Role',NULL,NULL,NULL),
	(3,1,1,'fa-image','Banner','Banner',25,'2019-01-21 06:52:50','2019-02-06 12:25:45'),
	(4,1,1,'fa-info-circle','About','About',5,'2019-01-21 07:44:08','2019-01-23 11:12:18'),
	(5,9,2,'fa-cogs','Setting','Setting',NULL,'2019-01-21 07:46:28','2019-01-25 11:16:40'),
	(6,3,1,'fa-phone','ContactUs','Contact Us',25,'2019-01-21 07:47:44','2019-02-06 12:25:45'),
	(7,7,2,'fa-image','Gallery','Gallery',NULL,'2019-01-21 07:49:21','2019-01-25 11:16:40'),
	(8,1,1,'fa-bars','CategoryGallery','Category Gallery',7,'2019-01-21 07:51:41','2019-01-23 11:12:17'),
	(9,2,1,'fa-images','ImageGallery','Image Gallery',7,'2019-01-21 07:57:49','2019-01-23 11:12:18'),
	(10,2,1,'fa-share-alt','Socmed','Social Media',5,'2019-01-21 09:37:09','2019-02-06 12:25:45'),
	(11,6,1,'fa-database','Service','Service',NULL,'2019-01-22 07:04:03','2019-01-25 11:16:40'),
	(12,8,2,'fa-video','Video','Video',NULL,'2019-01-22 13:19:30','2019-01-25 11:16:40'),
	(13,2,1,'fa-video','ListVideo','Video',12,'2019-01-22 13:23:05','2019-01-23 11:12:18'),
	(16,1,1,'fa-list','CategoryVideo','Category Video',12,'2019-01-22 13:27:02','2019-01-23 11:12:18'),
	(17,2,2,'fa-newspaper','Blog','Blog',NULL,'2019-01-23 12:34:42','2019-01-25 11:16:40'),
	(18,1,1,'fa-list','CategoryBlog','Category Blog',17,'2019-01-23 12:35:42','2019-02-06 12:25:45'),
	(19,2,1,'fa-newspaper','ArticleBlog','Article Blog',17,'2019-01-23 12:39:35','2019-02-06 12:25:45'),
	(20,3,1,'fa-comments','Review','Testimoni',NULL,'2019-01-24 13:06:54','2019-01-25 11:16:40'),
	(21,4,1,'fa-calendar','Event','Event',NULL,'2019-01-24 18:03:56','2019-01-25 11:16:40'),
	(22,2,1,'fa-quote-right','Quotes','Quotes',25,'2019-01-25 11:16:28','2019-02-06 12:25:45'),
	(25,0,2,'fa-home','Home','Home',NULL,'2019-02-06 12:24:40','2019-02-06 12:24:40');

/*!40000 ALTER TABLE `menus` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table migrations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;

INSERT INTO `migrations` (`id`, `migration`, `batch`)
VALUES
	(1,'2014_10_12_000000_create_users_table',1),
	(2,'2014_10_12_100000_create_password_resets_table',1),
	(3,'2015_10_10_000000_create_menus_table',1),
	(4,'2015_10_10_000000_create_roles_table',1),
	(5,'2015_10_10_000000_update_users_table',1),
	(6,'2015_12_11_000000_create_users_logs_table',1),
	(7,'2016_03_14_000000_update_menus_table',1),
	(8,'2019_01_21_065250_create_banner_table',2),
	(9,'2019_01_21_075141_create_category-gallery_table',3),
	(10,'2019_01_21_075749_create_image-gallery_table',4),
	(11,'2019_01_22_070403_create_service_table',5),
	(12,'2019_01_22_132305_create_category_video_table',6),
	(13,'2019_01_22_132702_create_category_video_table',7),
	(14,'2019_01_23_123542_create_category_blog_table',8),
	(15,'2019_01_23_123935_create_article_blog_table',9),
	(16,'2019_01_24_130654_create_review_table',10),
	(17,'2019_01_24_180356_create_event_table',11);

/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table password_resets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `password_resets`;

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table review
# ------------------------------------------------------------

DROP TABLE IF EXISTS `review`;

CREATE TABLE `review` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `image_file` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;

INSERT INTO `review` (`id`, `image_file`, `title`, `description`, `name`, `created_at`, `updated_at`, `deleted_at`)
VALUES
	(1,'1548414154-testimonial-1.jpg','A Must do Trip !','<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.</p>','Emily Haley','2019-01-25 11:02:34','2019-01-25 11:02:34',NULL),
	(2,'1548414182-testimonial-4.jpg','A Must Do Trip!','<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.</p>','John Smith','2019-01-25 11:03:02','2019-01-25 11:03:02',NULL);

/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table roles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `roles`;

CREATE TABLE `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;

INSERT INTO `roles` (`id`, `title`, `created_at`, `updated_at`)
VALUES
	(1,'Administrator','2019-01-21 05:22:13','2019-01-21 05:22:13');

/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table service
# ------------------------------------------------------------

DROP TABLE IF EXISTS `service`;

CREATE TABLE `service` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `banner_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `galery` text COLLATE utf8mb4_unicode_ci,
  `detail` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `service` WRITE;
/*!40000 ALTER TABLE `service` DISABLE KEYS */;

INSERT INTO `service` (`id`, `title`, `slug`, `banner_image`, `description`, `galery`, `detail`, `created_at`, `updated_at`, `deleted_at`)
VALUES
	(1,'Test','tes','1548157920-fashion-anak.png','<p>test</p>',NULL,'<p>test detail</p>','2019-01-22 11:52:03','2019-01-22 13:06:58','2019-01-22 13:06:58'),
	(2,'Test','test','1548162498-Macam-Motif-Keramik-Teras.jpg','<p>test</p>','[\"1548162498-diy.jpg\",\"1548162498-electric.jpg\",\"1548162498-fashion-anak.png\",\"1548162499-fashion-muslim.png\",\"1548162499-fashion-pria.png\",\"1548162500-fashion-wanita.png\",\"1548162501-gardening.jpg\",\"1548162501-gembok.jpg\"]','<p>test</p>','2019-01-22 13:08:21','2019-01-24 12:22:34','2019-01-24 12:22:34'),
	(3,'Cycling Tour','cycling-tour','1548433666-slideshow18.jpg','<p>BIKE TO CULTURE NATURE ADVENTURE<br />\r\nInspired by the spirit of back to Nature and simple harmony In life, we proudly you explore and experience the deep sense of balinese countryside, simply unique, unforgetable, trace the heart of Bali. Feel the beats of unexposed life style of local people, and learn from the wisdom of ancient ancestors for current life</p>\r\n\r\n<ul>\r\n</ul>','[\"1548433593-slideshow18.jpg\",\"1548433594-slideshow19.jpg\",\"1548433594-slideshow20.jpg\"]','<p>TOUR ITINERARY</p>\r\n\r\n<ul>\r\n	<li>We pick up at the hotel and drive to the countryside , first we will explore all about Bali agriculture farmer, small cooperative organization, where the famouse Luwak Coffee is produced with some others herbal drink&rsquo;s Coffee and tea . Also you get some local snacks, cake, fruite for breakfast</li>\r\n	<li>Start riding from high level area of Kintamani with excelent view of mountain and lake of Batur. Ride on downhill come into farming area Of Kintamani with enjoy the nice landscape In around of you.</li>\r\n	<li>The first stop is at vilage Temple, feel the spiritual religius of local people.</li>\r\n	<li>Visit a balinese family compound In a village our profesional Guide will explain you all about the living culture and tradition.</li>\r\n	<li>Unforgetable cycling inside of rice field and we will stop on the best sport to take photos, meet with local farmers show how they process the rice plantation and organize about Bali&rsquo;s farming system.</li>\r\n	<li>At the end of the trip, we will serve you oN appetizing Lunch in our delightful local restaurant.</li>\r\n</ul>\r\n\r\n<p>TOUR INCLUDE</p>\r\n\r\n<ul>\r\n	<li>Hotel pick-up and drop off</li>\r\n	<li>Profesional english speaking guide</li>\r\n	<li>Morning Coffee break and breakfast</li>\r\n	<li>Unlimited water along of the trip</li>\r\n	<li>Helmet</li>\r\n	<li>Lunch</li>\r\n</ul>\r\n\r\n<p>WHAT TO BRING</p>\r\n\r\n<ul>\r\n	<li>Walking / sport shoes recomended</li>\r\n	<li>Camera for hunting photo &amp; video</li>\r\n	<li>Cash money for payment and souvenirs</li>\r\n	<li>Changing clothes( In wet season)</li>\r\n</ul>\r\n\r\n<p>PICK UP TIME</p>\r\n\r\n<ul>\r\n	<li>07.30 Nusa dua / Jimbaran</li>\r\n	<li>07.30 -07.45 Kuta / Seminyak Area</li>\r\n	<li>07.30 - 08.00 Sanur Area</li>\r\n	<li>08.00 - 08.45 Ubud Area</li>\r\n</ul>','2019-01-25 08:23:30','2019-01-25 16:27:46',NULL),
	(4,'Trekking Sunrise Mount Batur','Trekking sunrise-mount-batur','1548434465-Mt-Kenya.jpg','<p>It is a once in a lifetime experience to see the sunrise from the top of bali&#39;s active volcano Mountain Batur (1717M). The higest volcano in bali, the early trekking is invigarating, and the sunrise views from the peaks unsurpassed.</p>','[\"1548434465-download-copy-2.jpeg\",\"1548434466-mt_pulag_sunrise.jpg\",\"1548434466-Mt-Kenya.jpg\"]','<p>Itinerary mountain Batur Sunrise Trekking:</p>\r\n\r\n<ul>\r\n	<li>02.00 Hotel pick-up drive directly to strating point</li>\r\n	<li>03.00 For breakfast banana pancake with chocolate, tea and coffee</li>\r\n	<li>04.00 You will be accompanied by a licenced trekking organization guide assist you with your ascent of around 2 hours from bottom peak</li>\r\n	<li>05.00 There will be a short stop for resting and drinking supplied water</li>\r\n	<li>06.00 On arrival at the peak of MT.Batur you will be served with a packed breakfast and egg cooked in the volcano stram while you wait for sunrise</li>\r\n	<li>10.00 Back to hotel</li>\r\n</ul>','2019-01-25 16:09:25','2019-01-25 17:12:29',NULL),
	(5,'Rafting Ubud','rafting-ubud','1548434683-arung-jeram-yang-menantang-sekaligus-menyenangkan-e1527581619561.jpg','<p>The two hours visual spectacular white water rafting teip down the ayung river in ubud. provide a thrill to begins the adventure you push of from river bank as you drop between class l and class ll rapids, wind through deep valleys with cascading water fall and towering cliffs of prehistoric significance. You will discover tropical forests, Hindu shrines brightly decorated on ceremonial days of prayer. This adventure for guests of all ages is a mix of wild excitement, fun, breath taking view, and well sightseeing.</p>','[\"1548434683-01.JPEG\",\"1548434683-02.JPEG\",\"1548434683-03.JPG\"]','<p>Includes :</p>\r\n\r\n<ul>\r\n	<li>Return Transfer</li>\r\n	<li>Safety Equipment</li>\r\n	<li>Insurance</li>\r\n	<li>Buffet Lunch</li>\r\n	<li>Locker</li>\r\n	<li>Changing Room</li>\r\n	<li>Shower Including Towel, soap and shampoo</li>\r\n</ul>\r\n\r\n<p>What to bring:</p>\r\n\r\n<ul>\r\n	<li>Changing Cloth, waterproof, camera, sunscreen, Mosquuito, Repellant, Sun Glasses, voucher or Cash money.</li>\r\n	<li>Swim suit/ Short pant / T-shirt/ River Sandal or sport Shoes</li>\r\n</ul>\r\n\r\n<p>Pick up schedule area:</p>\r\n\r\n<ul>\r\n	<li>Nusa dua - Jimbaran\r\n	<ul>\r\n		<li>Morning: 07.45 - 08.00</li>\r\n		<li>Afternoon: 11.45 -&nbsp; 12.00</li>\r\n	</ul>\r\n	</li>\r\n	<li>Kuta - Seminyak - Canggu\r\n	<ul>\r\n		<li>Morning: 08.00 - 08.30</li>\r\n		<li>Afternoon: 12.00 - 12.30</li>\r\n	</ul>\r\n	</li>\r\n	<li>Sanur\r\n	<ul>\r\n		<li>Morning: 08.30 - 09.00</li>\r\n		<li>Afternoon: 12.15 - 12.45</li>\r\n	</ul>\r\n	</li>\r\n	<li>Ubud\r\n	<ul>\r\n		<li>Morning: 09.00 - 09.30</li>\r\n		<li>Afternoon 12.30 - 13.00</li>\r\n	</ul>\r\n	</li>\r\n</ul>','2019-01-25 16:12:42','2019-01-25 17:02:19',NULL),
	(6,'ATV Taro Adventure','atv-taro-adventure','1548435391-baliquadbiking3.png','<p>here are many variations of passages of Lorem Ipsum available but the majority have an suffered alteration.</p>\r\n\r\n<p>injected humour or randomised words which don&#39;t look even slightly believable. If you to are going to use a passage of Lorem Ipsum you need to be sure there isn&#39;t is anything the embarrassing hidden in the middle of text.</p>\r\n\r\n<p>There are many variations of passages of Lorem Ipsum available but the majority have to suffered alteration in some form by injected humour or randomised words which don&#39;t a look even slightly believable. If you are going to use a passage of Lorem Ipsum you need to be sure there embarrassing hidden in the middle of text.</p>','[\"1548435392-atvred1.jpg\",\"1548435392-bali-pertiwi-atv.jpg\",\"1548435392-img2.jpg\"]','<p>AMAZING 2 MILES FRESH WATER RIVER TRACK<br />\r\nTreat and test your courage &amp; adrenalin In the quad bike on the best ATV track. Set through picturesque and adrenalin filled trips, drove between rock and caves. While enjoying panorama of real Bali&rsquo;s countryside in Taro Village. In approximately 2 hours on an ATV Ride ( The powerful off road machine ). Discover and explore breath taking of adventure ride true amazing countryside, rice paddy field, bamboo jungle, incredible dead river resemble to avatar cliff, wet river with their water discharge along track and muddy road make the ride event more challenging. You wouldn&rsquo;t find any ATV track like those ane where else.<br />\r\nYourkom satisfaction guaranteed as others have feeling because we are the best ATV Ride Adventure Company In Bali.</p>\r\n\r\n<p><br />\r\nTour includes :</p>\r\n\r\n<ul>\r\n	<li>Return Transfer</li>\r\n	<li>Welcome Drink</li>\r\n	<li>Coffee and Tea</li>\r\n	<li>Shower Facilities &amp; Locker</li>\r\n	<li>Lunch (Indonesian Set Menu )</li>\r\n	<li>Insurance</li>\r\n	<li>All Safety Equipment</li>\r\n</ul>\r\n\r\n<p>Pick up schedule:</p>\r\n\r\n<ul>\r\n	<li>Nusa Dua 07.30 AM</li>\r\n	<li>Kuta 08.00 AM</li>\r\n	<li>Sanur 08.30 AM</li>\r\n	<li>Ubud 09.00 AM</li>\r\n</ul>','2019-01-25 16:13:40','2019-01-25 16:56:32',NULL),
	(7,'Jungle Trekking, Meditation. Cleaning & Blessing','jungle-trekking-meditation-cleaning-blessing','1548432875-slider-4.jpg','<p>here are many variations of passages of Lorem Ipsum available but the majority have an suffered alteration.</p>\r\n\r\n<p>injected humour or randomised words which don&#39;t look even slightly believable. If you to are going to use a passage of Lorem Ipsum you need to be sure there isn&#39;t is anything the embarrassing hidden in the middle of text.</p>\r\n\r\n<p>There are many variations of passages of Lorem Ipsum available but the majority have to suffered alteration in some form by injected humour or randomised words which don&#39;t a look even slightly believable. If you are going to use a passage of Lorem Ipsum you need to be sure there embarrassing hidden in the middle of text.</p>','[\"1548432875-01.jpg\",\"1548432875-03.jpg\",\"1548432875-05.jpg\",\"1548432876-07.jpg\",\"1548432876-09.jpg\",\"1548432876-11.jpg\"]','<p>There are many variations of passages of Lorem Ipsum available but the majority have suffered alteration in some form by injected humour or randomised words which don&#39;t look even slightly believable. If you are going to use a passage of Lorem Ipsum you need to be sure there isn&#39;t is anything embarrassing hidden in the middle of text. There are many variations of passages of Lorem Ipsum available but the majority have suffered alteration in some form by injected humour or randomised words which don&#39;t look even slightly believable. If you are going to use a passage of Lorem Ipsum you need to be sure there isn&#39;t is anything embarrassing hidden in the middle of text.</p>\r\n\r\n<p>There are many variations of passages of Lorem Ipsum available but the majority have suffered alteration in some form by injected humour or randomised words which don&#39;t look even slightly believable. If you are going to use a passage of Lorem Ipsum you need to be sure there isn&#39;t is anything embarrassing hidden in the middle of text. There are many variations of passages of Lorem Ipsum available but the majority have suffered alteration in some form by on injected humour or randomised words which don&#39;t look even slightly believable.</p>','2019-01-25 16:14:36','2019-01-25 16:14:36',NULL),
	(8,'VW Classic Tour','vw-classic-tour','1548436872-0d6add09d8cdce934cfbb4f5f17b023c.jpg','<p>Not yet complete your vacation in Bali, if you have not tried riding a classic old car. see beautiful scenery and get fresh air from the countryside. enjoy nature with old cars.</p>','[\"1548436872-31af06750b4c0e48c10d3bf0e5daa9a8.jpg\",\"1548436872-tbe-bali_vw_safari1.jpg\",\"1548436872-wdw_camper-0_imagowestend61_20150203.jpg\"]','<ul>\r\n	<li>Tour itinerary:\r\n	<ul>\r\n		<li>Tegalalang Rice Terrace</li>\r\n		<li>Traditional Coffee Processing</li>\r\n		<li>Penglipuran ( Traditional Village )</li>\r\n		<li>Tukad Cepung</li>\r\n		<li>Tibumana Waterfall Tour Include&nbsp;</li>\r\n	</ul>\r\n	</li>\r\n	<li>English speaking driver</li>\r\n	<li>Ticket</li>\r\n	<li>Water drink</li>\r\n	<li>Lunch ( Indonesian menu )</li>\r\n</ul>\r\n\r\n<p>What to bring:</p>\r\n\r\n<ul>\r\n	<li>Walking / sport shoes recomended</li>\r\n	<li>Camera for hunting photo &amp; video</li>\r\n	<li>Cash money for payment and souvenirs</li>\r\n	<li>Changing clothes( In wet season)</li>\r\n</ul>\r\n\r\n<p>Pick up time:</p>\r\n\r\n<ul>\r\n	<li>07.30 Nusa dua / Jimbaran</li>\r\n	<li>07.30 -07.45 Kuta / Seminyak Area</li>\r\n	<li>07.30 - 08.00 Sanur Area</li>\r\n	<li>08.00 - 08.45 Ubud Area</li>\r\n</ul>','2019-01-25 16:15:31','2019-01-25 17:21:12',NULL);

/*!40000 ALTER TABLE `service` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table setting
# ------------------------------------------------------------

DROP TABLE IF EXISTS `setting`;

CREATE TABLE `setting` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `meta_category` varchar(255) DEFAULT NULL,
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` text,
  `status` tinyint(1) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `setting` WRITE;
/*!40000 ALTER TABLE `setting` DISABLE KEYS */;

INSERT INTO `setting` (`id`, `meta_category`, `meta_key`, `meta_value`, `status`, `created_at`, `updated_at`, `deleted_at`)
VALUES
	(1,'about','title','About Us',1,'2019-01-24 03:42:22','2019-01-24 12:21:47',NULL),
	(2,'about','image_banner_w','4096',1,'2019-01-24 03:42:22','2019-01-24 03:42:22',NULL),
	(3,'about','image_banner_h','4096',1,'2019-01-24 03:42:22','2019-01-24 03:42:22',NULL),
	(4,'about','description','<p><strong>Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in cul ed ut perspiciatis unde omnis iste natus.</strong></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\r\n\r\n<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur.</p>\r\n\r\n<p>But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure.</p>',1,'2019-01-24 03:42:22','2019-01-24 12:22:13',NULL),
	(5,'about','image_banner','1548301342-diy.jpg',1,'2019-01-24 03:42:22','2019-01-24 03:42:22',NULL),
	(6,'contact_us','facebook_link','https://www.facebook.com/baliadventure',1,'2019-01-24 11:23:11','2019-01-24 12:20:02',NULL),
	(7,'contact_us','email','tutresot12@gmail.COM',1,'2019-01-24 11:23:11','2019-01-24 12:20:02',NULL),
	(8,'contact_us','phone','081936598581',1,'2019-01-24 11:23:11','2019-01-24 12:20:02',NULL),
	(9,'contact_us','title','LET\'S TALK !',1,'2019-01-24 11:25:13','2019-01-24 11:25:13',NULL),
	(10,'contact_us','description','<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>',1,'2019-01-24 11:25:13','2019-01-24 11:25:13',NULL),
	(11,'about','image_banner_name','1548301342-diy.jpg',1,'2019-01-24 11:53:30','2019-01-24 11:53:30',NULL),
	(12,'socmed','twitter','https://twitter.com',1,'2019-01-24 12:15:58','2019-01-24 17:31:01',NULL),
	(13,'socmed','google','https://google.com',1,'2019-01-24 12:15:58','2019-01-24 17:31:01',NULL),
	(14,'socmed','instagram','https://instagram.com',1,'2019-01-24 12:15:58','2019-01-24 17:31:01',NULL),
	(15,'socmed','youtube','https://www.youtube.com/watch?v=ibuUmMhD2Pg',1,'2019-01-24 12:15:58','2019-01-24 17:30:29',NULL),
	(16,'socmed','whatsapp','6287862983711',1,'2019-01-24 12:15:58','2019-01-24 17:29:02',NULL),
	(17,'contact_us','address_name','Bali Adventure',1,'2019-01-24 14:03:54','2019-01-24 14:03:54',NULL),
	(18,'contact_us','address','Jalan Sidakarya No 163 Denpasar Bali\r\nIndonesia 80223',1,'2019-01-24 14:03:54','2019-01-24 14:03:54',NULL),
	(19,'contact_us','google_map','<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3943.8933734913085!2d115.2311208156103!3d-8.701675093748324!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x2dd24108ff4ef591%3A0xa6425a6cff8e10d3!2sJl.+Sidakarya+No.163%2C+Sidakarya%2C+Denpasar+Sel.%2C+Kota+Denpasar%2C+Bali+80224!5e0!3m2!1sid!2sid!4v1546851624844\" width=\"100%\" height=\"100%\" frameborder=\"0\" style=\"border:0\" allowfullscreen=\"\"></iframe>',1,'2019-01-24 14:03:54','2019-01-24 14:03:54',NULL),
	(20,'home','title','BALI ADVENTURE',1,'2019-01-25 11:39:31','2019-01-25 11:39:31',NULL),
	(21,'home','description','<p>Discover new cultures and have a wonderful rest with backpack story! Select the country you have like to visit with agents with an estimated time - they&#39;ll find and offer the most suitable tours and hotels.</p>\r\n\r\n<p>During our work we have organized countless journeys for our clients. We started as a small tour bureau, and soon we expanded our offers list. Today we have valuable experince travelling and we can advise the most stunning resorts, cities and countries to visit!</p>',1,'2019-01-25 11:39:31','2019-01-25 11:39:31',NULL),
	(22,'home','title_quotes','Quotes',1,'2019-01-25 11:39:31','2019-01-25 11:39:31',NULL),
	(23,'home','quotes','<p><strong>&lsquo;&rsquo; Travel early and travel often. Live abroad, if you can. Understand cultures other than your own. As your understanding of other cultures increases, your understanding of yourself and your own culture will increase exponentially. &lsquo;&rsquo;</strong></p>\r\n\r\n<p>A good traveler has no fixed plans, and is not intent on arriving.</p>',1,'2019-01-25 11:39:31','2019-01-25 11:39:31',NULL),
	(24,'home','image_about_name','1548419516-image-1.png',1,'2019-01-25 12:31:57','2019-01-25 12:32:33',NULL),
	(25,'home','image_about_w','4096',1,'2019-01-25 12:31:57','2019-01-25 12:31:57',NULL),
	(26,'home','image_about_h','4096',1,'2019-01-25 12:31:57','2019-01-25 12:31:57',NULL),
	(27,'home','image_quote_name','1548419516-image-2.png',1,'2019-01-25 12:31:57','2019-01-25 12:32:33',NULL),
	(28,'home','image_quote_w','4096',1,'2019-01-25 12:31:57','2019-01-25 12:31:57',NULL),
	(29,'home','image_quote_h','4096',1,'2019-01-25 12:31:57','2019-01-25 12:31:57',NULL),
	(30,'home','image_about','1548419516-image-1.png',1,'2019-01-25 12:31:57','2019-01-25 12:31:57',NULL),
	(31,'home','image_quote','1548419516-image-2.png',1,'2019-01-25 12:31:57','2019-01-25 12:31:57',NULL);

/*!40000 ALTER TABLE `setting` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `password`, `remember_token`, `created_at`, `updated_at`)
VALUES
	(1,1,'Admin','admin@rcdevgames.net','$2y$10$3eclG54/oBc14IcOlXnrMOQxSxfM.7os6yb94nj5H.r87CgGKAwh2','4tuDnvzIhFLfCLMRdN6HcPv7MJ7cqGoqIPBRemjZMTQmzaKb9t6OT9rPr8LA','2019-01-21 05:22:27','2019-01-21 05:22:27');

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table users_logs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users_logs`;

CREATE TABLE `users_logs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `action` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `action_model` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `action_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `users_logs` WRITE;
/*!40000 ALTER TABLE `users_logs` DISABLE KEYS */;

INSERT INTO `users_logs` (`id`, `user_id`, `action`, `action_model`, `action_id`, `created_at`, `updated_at`)
VALUES
	(1,1,'updated','users',1,'2019-01-21 06:10:05','2019-01-21 06:10:05'),
	(2,1,'updated','users',1,'2019-01-21 06:46:37','2019-01-21 06:46:37'),
	(3,1,'created','banner',1,'2019-01-21 06:58:30','2019-01-21 06:58:30'),
	(4,1,'updated','banner',1,'2019-01-21 06:58:58','2019-01-21 06:58:58'),
	(5,1,'updated','banner',1,'2019-01-21 07:01:01','2019-01-21 07:01:01'),
	(6,1,'updated','users',1,'2019-01-21 07:06:45','2019-01-21 07:06:45'),
	(7,1,'created','categorygallery',1,'2019-01-21 07:52:28','2019-01-21 07:52:28'),
	(8,1,'created','imagegallery',1,'2019-01-21 09:28:47','2019-01-21 09:28:47'),
	(9,1,'created','service',1,'2019-01-22 11:52:03','2019-01-22 11:52:03'),
	(10,1,'deleted','service',1,'2019-01-22 13:06:58','2019-01-22 13:06:58'),
	(11,1,'created','service',2,'2019-01-22 13:08:21','2019-01-22 13:08:21'),
	(12,1,'created','categoryvideo',1,'2019-01-23 04:01:24','2019-01-23 04:01:24'),
	(13,1,'deleted','service',2,'2019-01-24 12:22:34','2019-01-24 12:22:34'),
	(14,1,'deleted','banner',1,'2019-01-24 14:06:57','2019-01-24 14:06:57'),
	(15,1,'created','banner',2,'2019-01-24 14:07:40','2019-01-24 14:07:40'),
	(16,1,'created','banner',3,'2019-01-24 14:08:00','2019-01-24 14:08:00'),
	(17,1,'created','banner',4,'2019-01-24 14:08:17','2019-01-24 14:08:17'),
	(18,1,'created','banner',5,'2019-01-24 14:08:26','2019-01-24 14:08:26'),
	(19,1,'created','event',1,'2019-01-24 18:18:11','2019-01-24 18:18:11'),
	(20,1,'created','event',2,'2019-01-24 18:19:01','2019-01-24 18:19:01'),
	(21,1,'created','event',3,'2019-01-24 18:19:30','2019-01-24 18:19:30'),
	(22,1,'created','event',4,'2019-01-24 18:19:52','2019-01-24 18:19:52'),
	(23,1,'updated','event',4,'2019-01-24 18:47:48','2019-01-24 18:47:48'),
	(24,1,'updated','event',4,'2019-01-24 18:47:57','2019-01-24 18:47:57'),
	(25,1,'created','event',5,'2019-01-25 02:25:40','2019-01-25 02:25:40'),
	(26,1,'created','imagegallery',2,'2019-01-25 07:55:29','2019-01-25 07:55:29'),
	(27,1,'created','service',3,'2019-01-25 08:23:30','2019-01-25 08:23:30'),
	(28,1,'created','categoryblog',1,'2019-01-25 09:07:33','2019-01-25 09:07:33'),
	(29,1,'updated','categoryblog',1,'2019-01-25 09:08:10','2019-01-25 09:08:10'),
	(30,1,'created','articleblog',1,'2019-01-25 09:39:19','2019-01-25 09:39:19'),
	(31,1,'created','articleblog',1,'2019-01-25 09:39:19','2019-01-25 09:39:19'),
	(32,1,'updated','articleblog',1,'2019-01-25 09:47:21','2019-01-25 09:47:21'),
	(33,1,'updated','articleblog',1,'2019-01-25 09:47:21','2019-01-25 09:47:21'),
	(34,1,'updated','articleblog',1,'2019-01-25 09:48:30','2019-01-25 09:48:30'),
	(35,1,'updated','articleblog',1,'2019-01-25 09:48:30','2019-01-25 09:48:30'),
	(36,1,'updated','event',1,'2019-01-25 10:26:48','2019-01-25 10:26:48'),
	(37,1,'updated','event',2,'2019-01-25 10:26:51','2019-01-25 10:26:51'),
	(38,1,'updated','event',3,'2019-01-25 10:26:54','2019-01-25 10:26:54'),
	(39,1,'updated','event',4,'2019-01-25 10:26:57','2019-01-25 10:26:57'),
	(40,1,'updated','event',5,'2019-01-25 10:27:00','2019-01-25 10:27:00'),
	(41,1,'created','review',1,'2019-01-25 11:02:34','2019-01-25 11:02:34'),
	(42,1,'created','review',2,'2019-01-25 11:03:02','2019-01-25 11:03:02'),
	(43,1,'created','service',4,'2019-01-25 16:09:25','2019-01-25 16:09:25'),
	(44,1,'updated','service',3,'2019-01-25 16:10:40','2019-01-25 16:10:40'),
	(45,1,'created','service',5,'2019-01-25 16:12:42','2019-01-25 16:12:42'),
	(46,1,'created','service',6,'2019-01-25 16:13:40','2019-01-25 16:13:40'),
	(47,1,'created','service',7,'2019-01-25 16:14:36','2019-01-25 16:14:36'),
	(48,1,'created','service',8,'2019-01-25 16:15:31','2019-01-25 16:15:31'),
	(49,1,'updated','service',3,'2019-01-25 16:26:34','2019-01-25 16:26:34'),
	(50,1,'updated','service',3,'2019-01-25 16:27:16','2019-01-25 16:27:16'),
	(51,1,'updated','service',3,'2019-01-25 16:27:47','2019-01-25 16:27:47'),
	(52,1,'updated','service',4,'2019-01-25 16:41:06','2019-01-25 16:41:06'),
	(53,1,'updated','service',5,'2019-01-25 16:44:44','2019-01-25 16:44:44'),
	(54,1,'updated','service',5,'2019-01-25 16:51:22','2019-01-25 16:51:22'),
	(55,1,'updated','service',6,'2019-01-25 16:56:32','2019-01-25 16:56:32'),
	(56,1,'updated','service',5,'2019-01-25 17:02:19','2019-01-25 17:02:19'),
	(57,1,'updated','service',4,'2019-01-25 17:12:29','2019-01-25 17:12:29'),
	(58,1,'updated','service',8,'2019-01-25 17:21:12','2019-01-25 17:21:12'),
	(59,1,'updated','categorygallery',1,'2019-01-25 17:23:37','2019-01-25 17:23:37'),
	(60,1,'created','categorygallery',2,'2019-01-25 17:24:05','2019-01-25 17:24:05'),
	(61,1,'created','categorygallery',3,'2019-01-25 17:24:25','2019-01-25 17:24:25'),
	(62,1,'created','categorygallery',4,'2019-01-25 17:25:04','2019-01-25 17:25:04'),
	(63,1,'created','categorygallery',5,'2019-01-25 17:25:40','2019-01-25 17:25:40'),
	(64,1,'created','categorygallery',6,'2019-01-25 17:26:05','2019-01-25 17:26:05'),
	(65,1,'updated','imagegallery',1,'2019-01-25 17:26:52','2019-01-25 17:26:52'),
	(66,1,'updated','imagegallery',2,'2019-01-25 17:27:04','2019-01-25 17:27:04'),
	(67,1,'created','imagegallery',3,'2019-01-25 17:27:19','2019-01-25 17:27:19'),
	(68,1,'created','imagegallery',4,'2019-01-25 17:28:17','2019-01-25 17:28:17'),
	(69,1,'deleted','imagegallery',4,'2019-01-25 17:28:46','2019-01-25 17:28:46'),
	(70,1,'updated','imagegallery',2,'2019-01-25 17:29:04','2019-01-25 17:29:04'),
	(71,1,'updated','imagegallery',3,'2019-01-25 17:29:36','2019-01-25 17:29:36'),
	(72,1,'created','imagegallery',5,'2019-01-25 17:30:08','2019-01-25 17:30:08'),
	(73,1,'created','imagegallery',6,'2019-01-25 17:32:59','2019-01-25 17:32:59'),
	(74,1,'created','imagegallery',7,'2019-01-25 17:33:26','2019-01-25 17:33:26'),
	(75,1,'created','imagegallery',8,'2019-01-25 17:34:14','2019-01-25 17:34:14'),
	(76,1,'created','imagegallery',9,'2019-01-25 17:34:32','2019-01-25 17:34:32'),
	(77,1,'created','imagegallery',10,'2019-01-25 17:34:57','2019-01-25 17:34:57'),
	(78,1,'created','imagegallery',11,'2019-01-25 17:35:15','2019-01-25 17:35:15'),
	(79,1,'created','imagegallery',12,'2019-01-25 17:35:46','2019-01-25 17:35:46'),
	(80,1,'created','imagegallery',13,'2019-01-25 17:36:03','2019-01-25 17:36:03'),
	(81,1,'created','imagegallery',14,'2019-01-25 17:36:28','2019-01-25 17:36:28'),
	(82,1,'created','imagegallery',15,'2019-01-25 17:36:53','2019-01-25 17:36:53'),
	(83,1,'created','imagegallery',16,'2019-01-25 17:37:08','2019-01-25 17:37:08'),
	(84,1,'created','imagegallery',17,'2019-01-25 17:37:30','2019-01-25 17:37:30'),
	(85,1,'created','imagegallery',18,'2019-01-25 17:37:50','2019-01-25 17:37:50'),
	(86,1,'created','imagegallery',19,'2019-01-25 17:38:01','2019-01-25 17:38:01'),
	(87,1,'updated','imagegallery',15,'2019-01-25 17:40:13','2019-01-25 17:40:13'),
	(88,1,'updated','imagegallery',16,'2019-01-25 17:41:30','2019-01-25 17:41:30'),
	(89,1,'updated','imagegallery',3,'2019-01-25 17:42:05','2019-01-25 17:42:05'),
	(90,1,'updated','categoryvideo',1,'2019-01-25 17:43:23','2019-01-25 17:43:23'),
	(91,1,'created','categoryvideo',2,'2019-01-25 17:43:45','2019-01-25 17:43:45'),
	(92,1,'updated','categoryvideo',1,'2019-01-25 17:48:50','2019-01-25 17:48:50'),
	(93,1,'deleted','categoryvideo',2,'2019-01-25 17:49:07','2019-01-25 17:49:07'),
	(94,1,'deleted','categoryvideo',1,'2019-01-25 17:49:10','2019-01-25 17:49:10'),
	(95,1,'created','categoryvideo',3,'2019-01-25 17:49:17','2019-01-25 17:49:17'),
	(96,1,'created','categoryvideo',4,'2019-01-25 17:49:24','2019-01-25 17:49:24'),
	(97,1,'created','categoryblog',2,'2019-01-25 18:00:25','2019-01-25 18:00:25'),
	(98,1,'created','articleblog',2,'2019-01-25 18:03:01','2019-01-25 18:03:01'),
	(99,1,'created','articleblog',2,'2019-01-25 18:03:01','2019-01-25 18:03:01'),
	(100,1,'created','articleblog',3,'2019-01-25 18:03:47','2019-01-25 18:03:47'),
	(101,1,'created','articleblog',3,'2019-01-25 18:03:48','2019-01-25 18:03:48'),
	(102,1,'updated','articleblog',2,'2019-01-25 18:04:36','2019-01-25 18:04:36'),
	(103,1,'updated','articleblog',2,'2019-01-25 18:04:36','2019-01-25 18:04:36'),
	(104,1,'updated','articleblog',1,'2019-01-26 22:38:32','2019-01-26 22:38:32'),
	(105,1,'updated','articleblog',1,'2019-01-26 22:38:32','2019-01-26 22:38:32'),
	(106,1,'updated','articleblog',1,'2019-01-26 22:38:56','2019-01-26 22:38:56'),
	(107,1,'updated','articleblog',1,'2019-01-26 22:38:56','2019-01-26 22:38:56'),
	(108,1,'updated','articleblog',1,'2019-01-26 22:39:21','2019-01-26 22:39:21'),
	(109,1,'updated','articleblog',1,'2019-01-26 22:39:21','2019-01-26 22:39:21'),
	(110,1,'updated','articleblog',1,'2019-01-26 22:41:35','2019-01-26 22:41:35'),
	(111,1,'updated','articleblog',1,'2019-01-26 22:41:35','2019-01-26 22:41:35'),
	(112,1,'updated','articleblog',1,'2019-01-26 23:04:42','2019-01-26 23:04:42'),
	(113,1,'updated','articleblog',1,'2019-01-26 23:04:42','2019-01-26 23:04:42'),
	(114,1,'updated','event',1,'2019-01-27 04:40:23','2019-01-27 04:40:23'),
	(115,1,'updated','event',2,'2019-01-27 04:40:39','2019-01-27 04:40:39'),
	(116,1,'updated','event',3,'2019-01-27 04:40:49','2019-01-27 04:40:49'),
	(117,1,'updated','event',4,'2019-01-27 04:41:00','2019-01-27 04:41:00'),
	(118,1,'updated','event',1,'2019-01-27 04:43:37','2019-01-27 04:43:37'),
	(119,1,'updated','event',2,'2019-01-27 04:44:15','2019-01-27 04:44:15'),
	(120,1,'updated','event',3,'2019-01-27 04:44:25','2019-01-27 04:44:25'),
	(121,1,'updated','event',4,'2019-01-27 04:44:44','2019-01-27 04:44:44'),
	(122,1,'deleted','event',5,'2019-01-27 04:45:05','2019-01-27 04:45:05'),
	(123,1,'updated','articleblog',1,'2019-01-27 04:50:11','2019-01-27 04:50:11'),
	(124,1,'updated','articleblog',1,'2019-01-27 04:50:11','2019-01-27 04:50:11');

/*!40000 ALTER TABLE `users_logs` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
