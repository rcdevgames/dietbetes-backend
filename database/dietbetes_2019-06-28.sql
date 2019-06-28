# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: localhost (MySQL 5.7.23)
# Database: dietbetes
# Generation Time: 2019-06-27 18:02:42 +0000
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
	(2,1,'Makan Siang','Makan Siang','23:13','0',1,'2019-02-24 22:22:18','2019-02-24 22:22:18',NULL),
	(3,1,'Makan Malam','Makan Malam','23:16','1,2,3,7,8',1,'2019-02-24 22:30:05','2019-02-24 22:30:05',NULL);

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
	(4,'V',1900,60,48,299),
	(5,'VI',2100,62,53,319),
	(6,'VII',2300,73,59,369),
	(7,'VIII',2500,80,62,396),
	(8,'IV',1700,55.5,36.5,275);

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
  `type` int(10) DEFAULT NULL,
  `time` varchar(2) DEFAULT NULL,
  `title` varchar(55) DEFAULT NULL,
  `ingredients` text,
  `tutorial` text,
  `image` varchar(255) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `food_receipt` WRITE;
/*!40000 ALTER TABLE `food_receipt` DISABLE KEYS */;

INSERT INTO `food_receipt` (`id`, `type`, `time`, `title`, `ingredients`, `tutorial`, `image`, `status`, `created_at`, `updated_at`)
VALUES
	(1,1100,'MP','Bubur Ayam','<p dir=\"ltr\"> Bahan :</p><ul><li dir=\"ltr\"><p dir=\"ltr\"> 30 gr Beras</p></li><li dir=\"ltr\"><p dir=\"ltr\"> 25 gr daging ayam, tanpa kulit</p></li><li dir=\"ltr\"><p dir=\"ltr\"> 1 butir telur</p></li><li dir=\"ltr\"><p dir=\"ltr\"> 1 sdt seledri cincang</p></li><li dir=\"ltr\"><p dir=\"ltr\"> Garam dan lada secukupnya</p></li><li dir=\"ltr\"><p dir=\"ltr\"> 1 gelas air kaldu ayam</p></li></ul> <br/>','<p dir=\"ltr\"> Sambal Tomat</p><ul><li dir=\"ltr\"><p dir=\"ltr\"> 2 buah cabai merah</p></li><li dir=\"ltr\"><p dir=\"ltr\"> 1 buah tomat, dipotong kecil-kecil</p></li><li dir=\"ltr\"><p dir=\"ltr\"> Garam dan terasi secukupnya</p></li></ul><p dir=\"ltr\"> Cara Membuat Sambal Tomat :</p><p dir=\"ltr\"> Haluskan dan aduk rata cabai merah, tomat garam dan terasi</p><p dir=\"ltr\"> Cara Membuat bubur:</p><p dir=\"ltr\"> Bubur</p><ol><li dir=\"ltr\"><p dir=\"ltr\"> Rebus daging ayam dan kacang kedelai sampai matang, lalu sisihkan. Ambil daging ayam dan suwir-suwir. Sisihkan</p></li><li dir=\"ltr\"><p dir=\"ltr\"> Didihkan kaldu, lalu masukkan beras. Masak sampai menjadi bubur dan beras terasa lunak. Jika air sudah habis dan beras belum lunak, tambahkan air lagi secukupnya. Beri garam dan lada sebelum diangkat</p></li><li dir=\"ltr\"><p dir=\"ltr\"> Buat dadar tipis menggunakan pendadar anti lengket, kemudian dipotong tipis-tipis</p></li><li dir=\"ltr\"><p dir=\"ltr\"> Letakkan bubur di atas mangkuk saji, taburi dengan suwiran ayam, kacang kedelai, telur dadar dan seledri cincang</p></li><li dir=\"ltr\"><p dir=\"ltr\"> Sajikan dengan sambal tomat</p></li></ol>',NULL,1,'2019-06-15 12:42:18',NULL),
	(2,1100,'SP','Smooties Mangga','<p dir=\"ltr\"> Bahan :</p><p dir=\"ltr\"> 50 gram mangga manis</p><p dir=\"ltr\"> 250 ml Susu Ultra UHT</p> <br/>','<ol><li dir=\"ltr\"><p dir=\"ltr\"> Cuci bersih mangga dan potong menjadi ukuran lebih kecil</p></li><li dir=\"ltr\"><p dir=\"ltr\"> Masukkan mangga dan susu UHT untuk di blender menjadi satu</p></li></ol>',NULL,1,'2019-06-15 12:43:33',NULL),
	(3,1100,'MS','Tumis Ayam Kemangi','<p dir=\"ltr\"> Bahan :</p><ol><li dir=\"ltr\"><p dir=\"ltr\"> 50 gram daging ayam tanpa kulit bagian dada 95 kkal,10 gr protein,6 lemak</p></li><li dir=\"ltr\"><p dir=\"ltr\"> 25 gram daun kemangi, petiki daunnya saja 25 kkal,1,5 gr protein, 5 kh</p></li><li dir=\"ltr\"><p dir=\"ltr\"> 2 siung bawang merah, cincang halus</p></li><li dir=\"ltr\"><p dir=\"ltr\"> 1 siung bawang putih, cincang halus</p></li><li dir=\"ltr\"><p dir=\"ltr\"> 2 buah cabai merah, iris tipis</p></li><li dir=\"ltr\"><p dir=\"ltr\"> 1 cm lengkuas, sisihkan</p></li><li dir=\"ltr\"><p dir=\"ltr\"> 2 lembar daun salam</p></li><li dir=\"ltr\"><p dir=\"ltr\"> ½ sdt ketumbar bubuk</p></li><li dir=\"ltr\"><p dir=\"ltr\"> 2 sdm kecap manis 60 kkal, 15 kh</p></li><li dir=\"ltr\"><p dir=\"ltr\"> ½ sdt garam dan lada</p></li><li dir=\"ltr\"><p dir=\"ltr\"> 100 ml air</p></li><li dir=\"ltr\"><p dir=\"ltr\"> 1 sdm minyak goreng, untuk menumis 90 kkal, 10 gr lemak</p></li><li dir=\"ltr\"><p dir=\"ltr\"> 50 gram tomat</p></li><li dir=\"ltr\"><p dir=\"ltr\"> 50 gram selada untuk lalapan</p></li></ol><br/>','<p dir=\"ltr\"> Cara membuat :</p><ol><li dir=\"ltr\"><p dir=\"ltr\"> Panaskan minyak di atas wajan. Tumis bawang merah, bawang putih, cabai, lengkuas, dan daun salam hingga harum.</p></li><li dir=\"ltr\"><p dir=\"ltr\"> Masukkan ketumbar bubuk, kecap manis, garam, dan merica. Aduk rata.</p></li><li dir=\"ltr\"><p dir=\"ltr\"> Tambahkan ayam dan air. Masak hingga bumbu meresap. Masukkan daun kemangi, aduk rata. Angkat.</p></li><li dir=\"ltr\"><p dir=\"ltr\"> Sajikan segera ditemani nasi putih dengan lalapan</p></li></ol>',NULL,1,'2019-06-15 12:45:31',NULL),
	(4,1100,'MM','Salad Sayuran','<p dir=\"ltr\"> Bahan :</p><ol><li dir=\"ltr\"><p dir=\"ltr\"> 30 gram wortel</p></li><li dir=\"ltr\"><p dir=\"ltr\"> 30 gram kol</p></li><li dir=\"ltr\"><p dir=\"ltr\"> 1 sdm mayonais rendah lemak</p></li><li dir=\"ltr\"><p dir=\"ltr\"> Daun selada</p></li></ol> <br/>','<p dir=\"ltr\"> Cara membuat :</p><ol><li dir=\"ltr\"><p dir=\"ltr\"> Iris wortel dan kol tipis-tipis berukuran Panjang 3 cm, campur dengan mayones</p></li><li dir=\"ltr\"><p dir=\"ltr\"> Sajikan di piring ceper dengan daun selada</p></li></ol>',NULL,1,'2019-06-15 12:46:43',NULL),
	(5,1100,'SP','Jus Pepaya','<p dir=\"ltr\"> Bahan :</p><ol><li dir=\"ltr\"><p dir=\"ltr\"> 100 gram pepaya</p></li><li dir=\"ltr\"><p dir=\"ltr\"> 50 ml susu low fat</p></li><li dir=\"ltr\"><p dir=\"ltr\"> Es batu jika suka</p></li></ol> <br/>','<p dir=\"ltr\"> Cara membuat :</p><p dir=\"ltr\"> Blender semua bahan hingga papaya hancur sempurna</p><div> <br/></div>',NULL,1,'2019-06-15 12:48:38',NULL),
	(6,1100,'MP','Bubur Oatmeal','<p dir=\"ltr\"> Bahan :</p><ul><li dir=\"ltr\"><p dir=\"ltr\"> 5 ½ sdm Oatmeal Instant</p></li><li dir=\"ltr\"><p dir=\"ltr\"> 150 ml air panas</p></li><li dir=\"ltr\"><p dir=\"ltr\"> 2 sdm madu</p></li><li dir=\"ltr\"><p dir=\"ltr\"> ½ buah apel</p></li></ul>','<p dir=\"ltr\"> Cara Membuat :</p><ol><li dir=\"ltr\"><p dir=\"ltr\"> Seduh oatmeal menggunakan air panas, aduk rata, diamkan sebentar sampai tekstur mengental</p></li><li dir=\"ltr\"><p dir=\"ltr\"> Berikan madu dan potongan apel pada permukaan oatmeal</p></li><li dir=\"ltr\"><p dir=\"ltr\"> Santap selagi hangat.</p></li></ol>',NULL,1,'2019-06-15 12:52:04',NULL),
	(7,1100,'MS','Bihun Siram','<p dir=\"ltr\"> Bahan :</p><ol><li dir=\"ltr\"><p dir=\"ltr\"> 50 gram bihun</p></li><li dir=\"ltr\"><p dir=\"ltr\"> 25 gram udang buang kulitnya</p></li><li dir=\"ltr\"><p dir=\"ltr\"> 2 buah bakso sapi</p></li><li dir=\"ltr\"><p dir=\"ltr\"> 50 gram caisim</p></li><li dir=\"ltr\"><p dir=\"ltr\"> 1 butir telur, kocok lepas</p></li><li dir=\"ltr\"><p dir=\"ltr\"> 3 siung bawang putih, haluskan</p></li><li dir=\"ltr\"><p dir=\"ltr\"> 1 ikat daun bawang seledri, Rajang halus</p></li><li dir=\"ltr\"><p dir=\"ltr\"> ½ sdt lada dan ½ sdt garam</p></li><li dir=\"ltr\"><p dir=\"ltr\"> Air secukupnya</p></li><li dir=\"ltr\"><p dir=\"ltr\"> Jeruk nipis, jika suka rasa sedikit asam</p></li><li dir=\"ltr\"><p dir=\"ltr\"> 1 sdm minyak untuk menumis</p></li></ol><br/>','<p dir=\"ltr\"> Cara membuat :</p><ul><li dir=\"ltr\"><p dir=\"ltr\"> Rebus bihun 5 mnit lalu tiriskan.</p></li><li dir=\"ltr\"><p dir=\"ltr\"> Panaskan minyak,tumis bawang putih hingga harum,masukkan udang..tumis hingga udang berubah warna.</p></li><li dir=\"ltr\"><p dir=\"ltr\"> Masukan bakso, sayuran,daun bawang dan seledri..beri air secukupnya,tambahkan garam,lada,dan jeruk nipis..test rasa,</p></li><li dir=\"ltr\"><p dir=\"ltr\"> Jika sudah mendidih masukkan telur,aduk2 sampai semua tercampur rata.</p></li><li dir=\"ltr\"><p dir=\"ltr\"> Jika kuah sudah agak mengental,matikan api.sajikan bihun di piring atau mangkuk lalu siram kuah diatasnya.</p></li></ul>',NULL,1,'2019-06-15 12:56:51',NULL),
	(8,1100,'MM','Tumis Brokoli','<p dir=\"ltr\"> Bahan :</p><ol><li dir=\"ltr\"><p dir=\"ltr\"> 100 gram brokoli</p></li><li dir=\"ltr\"><p dir=\"ltr\"> 2 siung bawang putih, cincang halus</p></li><li dir=\"ltr\"><p dir=\"ltr\"> ¼ buah bawang Bombay, cincang kasar</p></li><li dir=\"ltr\"><p dir=\"ltr\"> 1 butir telur ayam</p></li><li dir=\"ltr\"><p dir=\"ltr\"> 50 gram jagung kuning muda</p></li><li dir=\"ltr\"><p dir=\"ltr\"> 2 sdm minyak goreng</p></li></ol><br/>','<p dir=\"ltr\"> Cara membuat :</p><ol><li dir=\"ltr\"><p dir=\"ltr\"> Panaskan minyak goreng, tumis bawang putih dan bawang Bombay</p></li><li dir=\"ltr\"><p dir=\"ltr\"> Masukkan brokoli dan jagung muda, aduk rata sampai brokoli dan jagung muda sedikit layu</p></li><li dir=\"ltr\"><p dir=\"ltr\"> Tuangkan air ke dalamnya, beri sedikit garam dan lada untuk perasa</p></li><li dir=\"ltr\"><p dir=\"ltr\"> Kocok lepas telur, lalu tuangkan ketika masakan sudah hampir mendidih, aduk rata</p></li><li dir=\"ltr\"><p dir=\"ltr\"> Siap disajikan</p></li></ol>',NULL,1,'2019-06-15 12:59:21',NULL),
	(9,1300,'MP','Bubur Oriental','<p dir=\"ltr\"> Bahan :</p><ol><li dir=\"ltr\"><p dir=\"ltr\"> 40 gram dada ayam, potong sesuai selera</p></li><li dir=\"ltr\"><p dir=\"ltr\"> 2 cm jahe, memarkan</p></li><li dir=\"ltr\"><p dir=\"ltr\"> 200 gram beras,cuci, tiriskan</p></li><li dir=\"ltr\"><p dir=\"ltr\"> 800 ml air</p></li><li dir=\"ltr\"><p dir=\"ltr\"> Garam dan merica secukupnya</p></li></ol> <br/><p dir=\"ltr\"> Pelengkap :</p><p dir=\"ltr\"> Seledri, tongcai, kecap asin dan kecap manis secukupnya</p> <br/>','<p dir=\"ltr\"> Cara membuat:</p><ol><li dir=\"ltr\"><p dir=\"ltr\"> Didihkan air, masukkan ayam, jahe, garam dan merica.</p></li><li dir=\"ltr\"><p dir=\"ltr\"> Masukkan beras, masak hingga menjadi bubur kental</p></li><li dir=\"ltr\"><p dir=\"ltr\"> Sajikan dengan pelengkap</p></li></ol>',NULL,1,'2019-06-15 13:08:08',NULL),
	(10,1300,'MS','Mie Selat','<p dir=\"ltr\"> Bahan :</p><ol><li dir=\"ltr\"><p dir=\"ltr\"> 100 gram mie basah, siram air mendidih, tiriskan</p></li><li dir=\"ltr\"><p dir=\"ltr\"> ½ buah tahu putih, goreng, potong dadu</p></li><li dir=\"ltr\"><p dir=\"ltr\"> 1 buah kentang, rebus dan kupas serta potong ½ cm</p></li><li dir=\"ltr\"><p dir=\"ltr\"> 5 lonjor kacang Panjang, rebus, potong 3 cm</p></li><li dir=\"ltr\"><p dir=\"ltr\"> 1 buah mentimun kecil, iris ½ cm</p></li><li dir=\"ltr\"><p dir=\"ltr\"> 2 lembar daun selada</p></li></ol> <br/><p dir=\"ltr\"> Saus kacang :</p><ol><li dir=\"ltr\"><p dir=\"ltr\"> 75 gram kacang tanah, goreng</p></li><li dir=\"ltr\"><p dir=\"ltr\"> 2 buah kemiri</p></li><li dir=\"ltr\"><p dir=\"ltr\"> 2 siung bawang putih</p></li><li dir=\"ltr\"><p dir=\"ltr\"> 2 buah cabai merah</p></li><li dir=\"ltr\"><p dir=\"ltr\"> 1 sdt garam</p></li><li dir=\"ltr\"><p dir=\"ltr\"> 2 sdm gula pasir</p></li><li dir=\"ltr\"><p dir=\"ltr\"> 100 ml air matang</p></li><li dir=\"ltr\"><p dir=\"ltr\"> 1 sdt cuka beras</p></li><li dir=\"ltr\"><p dir=\"ltr\"> 1 sdm kecap manis</p></li></ol> <br/>','<p dir=\"ltr\"> Cara membuat :</p><ol><li dir=\"ltr\"><p dir=\"ltr\"> Saus kacang : haluskan kacang, kemiri, bawang putih, cabai, garam dan gula. Beri air matang, cuka dan kecap aduk rata</p></li><li dir=\"ltr\"><p dir=\"ltr\"> Tata mie, tahu, kentang, kacang Panjang, mentimun dan selada. Siram dengan saus kacang, sajikan</p></li></ol>',NULL,1,'2019-06-15 13:11:41',NULL),
	(11,1300,'SS','Agar agar Sirsak','<p dir=\"ltr\"> Bahan:</p><ol><li dir=\"ltr\"><p dir=\"ltr\"> 60 gram sirsak, blender</p></li><li dir=\"ltr\"><p dir=\"ltr\"> 1/2 bungkus agar agar plain</p></li><li dir=\"ltr\"><p dir=\"ltr\"> 1 sdm gula pasir</p></li><li dir=\"ltr\"><p dir=\"ltr\"> 150 ml air putih</p></li></ol> <br/>','<p dir=\"ltr\"> Cara membuat :</p><ol><li dir=\"ltr\"><p dir=\"ltr\"> Campurkan agar agar dengan air</p></li><li dir=\"ltr\"><p dir=\"ltr\"> Tambahkan gula dan jus sirsak, nyalakan api, masak hingga matang</p></li></ol>',NULL,1,'2019-06-15 13:11:48',NULL),
	(12,1300,'MP','Kentang Panggang','<p dir=\"ltr\"> Bahan :</p><ol><li dir=\"ltr\"><p dir=\"ltr\"> 200 gram kentang</p></li><li dir=\"ltr\"><p dir=\"ltr\"> Merica, garam dan oregano secukupnya</p></li><li dir=\"ltr\"><p dir=\"ltr\"> Alumunium foil secukupnya</p></li><li dir=\"ltr\"><p dir=\"ltr\"> 100 gram wortel, potong dadu kecil</p></li><li dir=\"ltr\"><p dir=\"ltr\"> 100 gram buncis, potong bulat kecil</p></li></ol> <br/>','<p dir=\"ltr\"> Cara membuat:</p><ol><li dir=\"ltr\"><p dir=\"ltr\"> Kukus kentang hingga matang, angkat dan tiriskan</p></li><li dir=\"ltr\"><p dir=\"ltr\"> Rebus wortel dan buncis sampai setengah matang</p></li><li dir=\"ltr\"><p dir=\"ltr\"> Belah silang kentang hingga kedalaman 1/3 bagian tekan bagian bawahnya dan isi di dalamnya dengan sayuran yang telah di rebus tadi. Tambahkan sedikit garam, merica dan oregano diatasnya</p></li><li dir=\"ltr\"><p dir=\"ltr\"> Bungkus rapat kentang dengan alumunium foil, panggang di atas panggangan hingga kecoklatan.</p></li><li dir=\"ltr\"><p dir=\"ltr\"> Sajikan dengan saus sambal kesukaan anda</p></li></ol>',NULL,1,'2019-06-15 13:11:53',NULL),
	(13,1300,'MP','Orak Arik Telur','<p dir=\"ltr\"> Bahan:</p><ol><li dir=\"ltr\"><p dir=\"ltr\"> 1 butir telur</p></li><li dir=\"ltr\"><p dir=\"ltr\"> 1 sdm minyak goreng</p></li><li dir=\"ltr\"><p dir=\"ltr\"> 2 siung bawang putih, iris</p></li><li dir=\"ltr\"><p dir=\"ltr\"> 2 siung bawang merah, iris</p></li><li dir=\"ltr\"><p dir=\"ltr\"> 1 buah cabai merah, iris</p></li><li dir=\"ltr\"><p dir=\"ltr\"> 1 buah cabai hijau, iris</p></li><li dir=\"ltr\"><p dir=\"ltr\"> 1 buah tomat</p></li><li dir=\"ltr\"><p dir=\"ltr\"> 1 batang seledri</p></li></ol> <br/>','<p dir=\"ltr\"> Cara membuat :</p><ol><li dir=\"ltr\"><p dir=\"ltr\"> Tumis bawang hingga harum, masukkan cabai,seledri dan tomat, aduk hingga layu</p></li><li dir=\"ltr\"><p dir=\"ltr\"> Tambahkan kocokan telur yang sudah diberikan garam, lada secukupnya</p></li><li dir=\"ltr\"><p dir=\"ltr\"> Angkat dan sajikan</p></li></ol>',NULL,1,'2019-06-15 13:11:56',NULL),
	(14,1300,'MM','Nasi Kebuli Rempah Ayam','<p dir=\"ltr\"> Bahan :</p><ol><li dir=\"ltr\"><p dir=\"ltr\"> 1 sdm minyak goreng</p></li><li dir=\"ltr\"><p dir=\"ltr\"> 100 gram beras</p></li><li dir=\"ltr\"><p dir=\"ltr\"> 40 gram ayam fillet</p></li><li dir=\"ltr\"><p dir=\"ltr\"> 300 ml air</p></li><li dir=\"ltr\"><p dir=\"ltr\"> Bunga pala, secukupnya</p></li></ol> <br/><p dir=\"ltr\"> Bumbu:</p><ol><li dir=\"ltr\"><p dir=\"ltr\"> 1 siung bawang putih, haluskan</p></li><li dir=\"ltr\"><p dir=\"ltr\"> 3 butir bawang merah, haluskan</p></li><li dir=\"ltr\"><p dir=\"ltr\"> ½ sdt ketumbar bubuk</p></li><li dir=\"ltr\"><p dir=\"ltr\"> ¼ sdt jintan bubuk</p></li><li dir=\"ltr\"><p dir=\"ltr\"> 2 cm lengkuas, memarkan</p></li><li dir=\"ltr\"><p dir=\"ltr\"> 1 batang serai, memarkan</p></li><li dir=\"ltr\"><p dir=\"ltr\"> 3 cm kayu manis</p></li><li dir=\"ltr\"><p dir=\"ltr\"> ½ sdt garam</p></li><li dir=\"ltr\"><p dir=\"ltr\"> 1 butir cengkih</p></li></ol> <br/><p dir=\"ltr\"> Pelengkap :</p><ol><li dir=\"ltr\"><p dir=\"ltr\"> Bawang goreng</p></li><li dir=\"ltr\"><p dir=\"ltr\"> Mentimun iris</p></li><li dir=\"ltr\"><p dir=\"ltr\"> Sambal</p></li><li dir=\"ltr\"><p dir=\"ltr\"> Daun kemangi</p></li></ol> <br/>','<p dir=\"ltr\"> Cara membuat:</p><ol><li dir=\"ltr\"><p dir=\"ltr\"> Tumis bawang hingga harum, masukkan bumbu lainnya</p></li><li dir=\"ltr\"><p dir=\"ltr\"> Masukan ayam, aduk aduk, tambahkan air dan masak hingga ayam empuk. Sisihkan air rebusan ayam</p></li><li dir=\"ltr\"><p dir=\"ltr\"> Goreng ayam dengan 1 sdm minyak goreng hingga matang</p></li><li dir=\"ltr\"><p dir=\"ltr\"> Masukkan beras dan air rebusan ke dalam rice cooker, masak hingga matang, diamkan 5 menit sajikan dengan pelengkap</p></li></ol>',NULL,1,'2019-06-15 13:12:02',NULL),
	(15,1300,'MS','Tempe Bumbu Woku','<p dir=\"ltr\"> Bahan :</p><ol><li dir=\"ltr\"><p dir=\"ltr\"> 1 sdm minyak goreng</p></li><li dir=\"ltr\"><p dir=\"ltr\"> 50 gram tempe, potong dadu, bakar tanpa minyak hingga matang</p></li><li dir=\"ltr\"><p dir=\"ltr\"> 1 batang serai, memarkan</p></li><li dir=\"ltr\"><p dir=\"ltr\"> 2 lembar daun jeruk</p></li><li dir=\"ltr\"><p dir=\"ltr\"> 12 buah cabai rawit</p></li><li dir=\"ltr\"><p dir=\"ltr\"> 1 buah tomat sayur hijau, potong 4</p></li><li dir=\"ltr\"><p dir=\"ltr\"> 10 tangkai daun kemangi</p></li><li dir=\"ltr\"><p dir=\"ltr\"> 2 batang daun bawang, potong serong 2 cm</p></li><li dir=\"ltr\"><p dir=\"ltr\"> Garam dan gula secukupnya</p></li></ol> <br/><p dir=\"ltr\"> Bumbu halus :</p><ol><li dir=\"ltr\"><p dir=\"ltr\"> 6 butir bawang merah</p></li><li dir=\"ltr\"><p dir=\"ltr\"> 2 cm jahe</p></li><li dir=\"ltr\"><p dir=\"ltr\"> 2 cm kunyit bakar</p></li><li dir=\"ltr\"><p dir=\"ltr\"> 3 buah cabai hijau</p></li></ol> <br/>','<p dir=\"ltr\"> Cara membuat :</p><ol><li dir=\"ltr\"><p dir=\"ltr\"> Tumis bumbu halus hingga harum. Masukkan serai, daun jeruk, cabai rawit, tomat dan aduk rata</p></li><li dir=\"ltr\"><p dir=\"ltr\"> Tambahkan tempe, air, garam dan gula, masak hingga mendidih dan bumbu meresap</p></li><li dir=\"ltr\"><p dir=\"ltr\"> Taburi kemangi dan daun bawang, aduk aduk , angkat dan sajikan</p></li></ol>',NULL,1,'2019-06-15 13:12:06',NULL),
	(16,1300,'MP','Bubur Havermout Buah','<p dir=\"ltr\"> Bahan :</p><ul><li dir=\"ltr\"><p dir=\"ltr\"> 5 ½ sdm Oatmeal Instant</p></li><li dir=\"ltr\"><p dir=\"ltr\"> 150 ml air panas</p></li><li dir=\"ltr\"><p dir=\"ltr\"> 1 sdm madu</p></li><li dir=\"ltr\"><p dir=\"ltr\"> 10 gram almond</p></li><li dir=\"ltr\"><p dir=\"ltr\"> 110 gram pepaya</p></li><li dir=\"ltr\"> <br/></li></ul><br/>','<p dir=\"ltr\"> Cara Membuat :</p><ol><li dir=\"ltr\"><p dir=\"ltr\"> Seduh oatmeal menggunakan air panas, aduk rata, diamkan sebentar sampai tekstur mengental</p></li><li dir=\"ltr\"><p dir=\"ltr\"> Berikan madu,almond dan potongan pepaya pada permukaan oatmeal</p></li><li dir=\"ltr\"><p dir=\"ltr\"> Santap selagi hangat</p></li></ol>',NULL,1,'2019-06-15 13:12:12',NULL),
	(17,1500,'MP','Omelet Sayur','<p dir=\'ltr\'> Bahan :</p><ol><li dir=\'ltr\'><p dir=\'ltr\'> 1 Butir Telur</p></li><li dir=\'ltr\'><p dir=\'ltr\'> 1 Sdm Minyak Goreng</p></li><li dir=\'ltr\'><p dir=\'ltr\'> 100 Gram Buncis, Wortel Dan Tomat, Rebus Sebntar Untuk Buncis Dan Wortel</p></li><li dir=\'ltr\'><p dir=\'ltr\'> 2 Siung Bawang Putih</p></li><li dir=\'ltr\'><p dir=\'ltr\'> 1 Siung Bawang Merah</p></li></ol> <br/>','<p dir=\'ltr\'> Cara Membuat :</p><ol><li dir=\'ltr\'><p dir=\'ltr\'> Tumis Semua Bawang Hingga Harum,</p></li><li dir=\'ltr\'><p dir=\'ltr\'> Kocok Lepas Telur Dan Berikan Sedikit Garam Dan Lada, Masukkan Buncis Dan Wortel, Aduk Rata</p></li><li dir=\'ltr\'><p dir=\'ltr\'> Siram Diatas Tumisan Bawang, Bolak Balik Sampai Matang, Sajikan.</p></li></ol>',NULL,1,'2019-06-15 14:30:17','2019-06-15 14:30:17'),
	(18,1500,'SP','Sandwich Gulung','<p dir=\"ltr\"> Bahan :</p><ol><li dir=\"ltr\"><p dir=\"ltr\"> 2 lembar roti tawar gandum</p></li><li dir=\"ltr\"><p dir=\"ltr\"> 50 gram wortel kupas, potong tipis bentuk korek api, rebus sebentar</p></li><li dir=\"ltr\"><p dir=\"ltr\"> 2 lembar daun selada</p></li></ol><p dir=\"ltr\"> <strong id=\"docs-internal-guid-3cee9fd9-7fff-4f27-0833-f805ca2b3dec\"> <br/> </strong></p><p dir=\"ltr\"> Isian :</p><ol><li dir=\"ltr\"><p dir=\"ltr\"> 60 gram daging buah alpukat</p></li><li dir=\"ltr\"><p dir=\"ltr\"> ¼ sdt merica bubuk</p></li><li dir=\"ltr\"><p dir=\"ltr\"> ¼ sdt garam</p></li><li dir=\"ltr\"><p dir=\"ltr\"> 1 sdm timun cincang</p></li><li dir=\"ltr\"><p dir=\"ltr\"> 2 sdm kacang merah segar, rendam terlebih dahulu lalu cincang</p></li></ol>','<p dir=\"ltr\"> Cara membuat :</p><ol><li dir=\"ltr\"><p dir=\"ltr\"> Isian : campur seluruh bahan hingga rata</p></li><li dir=\"ltr\"><p dir=\"ltr\"> Roti tawar dibuang bagian pinggirnya, agar roti tidak patah ketika digulung. Gilas ringan agar roti agak pipih</p></li><li dir=\"ltr\"><p dir=\"ltr\"> Taruh 1 lembar roti diatas selembar serbet putih atau kertas tisu dapur. Ratakan bahan olesan di permukaan roti, beri daun selada dan wortel secukupnya. Gulung roti sambil dipadatkan dan ditahan dengan serbet/kertas tisu. Bungkus, punter kedua ujungnya. Diamkan hingga seluruh bahan abis</p></li></ol>',NULL,1,'2019-06-16 20:34:09','2019-06-16 20:34:09'),
	(19,1500,'MP','Sandwitch Ayam','<p dir=\"ltr\"> Bahan :</p><ol><li dir=\"ltr\"><p dir=\"ltr\"> 2 lembar roti gandum</p></li><li dir=\"ltr\"><p dir=\"ltr\"> 50 gram dada ayam fillet</p></li><li dir=\"ltr\"><p dir=\"ltr\"> 100 gram selada segar dan tomat</p></li><li dir=\"ltr\"><p dir=\"ltr\"> Perasan jeruk lemon</p></li><li dir=\"ltr\"><p dir=\"ltr\"> Garam dan lada secukupnya</p></li></ol> <br/>','<p dir=\"ltr\"> Cara membuat:</p><ol><li dir=\"ltr\"><p dir=\"ltr\"> Cuci bersih ayam dan bumbui dengan garam dan lada secukupnya dan berikan perasan jeruk lemon secukupnya</p></li><li dir=\"ltr\"><p dir=\"ltr\"> Panggang ayam tanpa menggunakan minyak sampai matang, iris tipis</p></li><li dir=\"ltr\"><p dir=\"ltr\"> Siapkan roti gandum, tata selada dan tomat lalu berikan irisan ayam yang sudah matang.</p></li><li dir=\"ltr\"><p dir=\"ltr\"> Sajikan selagi hangat.</p></li></ol>',NULL,1,'2019-06-17 17:25:18',NULL),
	(20,1500,'MM','Brokoli Rice Bowl','<p dir=\"ltr\"> Bahan :</p><ol><li dir=\"ltr\"><p dir=\"ltr\"> 100 gram nasi merah</p></li><li dir=\"ltr\"><p dir=\"ltr\"> 50 gram brokoli</p></li><li dir=\"ltr\"><p dir=\"ltr\"> 100 gram tahu putih</p></li><li dir=\"ltr\"><p dir=\"ltr\"> 25 gram daging sapi</p></li><li dir=\"ltr\"><p dir=\"ltr\"> ½ sdm minyak</p></li><li dir=\"ltr\"><p dir=\"ltr\"> 2 siung bawang putih</p></li><li dir=\"ltr\"><p dir=\"ltr\"> ¼ buah bawang bombay</p></li><li dir=\"ltr\"><p dir=\"ltr\"> Garam dan lada secukupnya</p></li><li dir=\"ltr\"><p dir=\"ltr\"> Kecap manis secukupnya</p></li><li dir=\"ltr\"><p dir=\"ltr\"> Saus tiram secukupnya</p></li><li dir=\"ltr\"><p dir=\"ltr\"> Wijen secukupnya</p></li></ol><br/>','<p dir=\"ltr\"> Cara membuat:</p><ol><li dir=\"ltr\"><p dir=\"ltr\"> Tumis bawang putih dan bawang Bombay hingga harum</p></li><li dir=\"ltr\"><p dir=\"ltr\"> Masukkan ayam dan tahu putih, tumis hingga harum</p></li><li dir=\"ltr\"><p dir=\"ltr\"> Tambahkan brokoli yang sudah direbus dan dicuci dengan air garam</p></li><li dir=\"ltr\"><p dir=\"ltr\"> Berikan sedikit air, masak hingga matang. Berikan sedikit garam dan lada serta kecap manis dan saus tiram, test rasa sampai terasa pas</p></li><li dir=\"ltr\"><p dir=\"ltr\"> Sajikan diatas nasi merah hangat yang disajikan diatas mangkok</p></li><li dir=\"ltr\"><p dir=\"ltr\"> Taburi biji wijen sebagai penambah aroma</p></li></ol>',NULL,1,'2019-06-17 17:25:18',NULL),
	(21,1500,'MP','Burrito Sayur','<p dir=\"ltr\"> Bahan :</p><ol><li dir=\"ltr\"><p dir=\"ltr\"> 1 lembar tortilla</p></li><li dir=\"ltr\"><p dir=\"ltr\"> 1 butir telur</p></li><li dir=\"ltr\"><p dir=\"ltr\"> ¼ buah paprika</p></li><li dir=\"ltr\"><p dir=\"ltr\"> 3 iris Tomat</p></li><li dir=\"ltr\"><p dir=\"ltr\"> 25 gram Wortel</p></li><li dir=\"ltr\"><p dir=\"ltr\"> Selada air</p></li><li dir=\"ltr\"><p dir=\"ltr\"> ½ sdt margarin</p></li></ol><br/>','<p dir=\"ltr\"> Cara membuat :</p><ol><li dir=\"ltr\"><p dir=\"ltr\"> Parut wortel Panjang-panjang, rebus sebentar sampai agak lunak</p></li><li dir=\"ltr\"><p dir=\"ltr\"> Rebus telur lalu iris-iris sesuai selera</p></li><li dir=\"ltr\"><p dir=\"ltr\"> Panggang kulit tortilla dengan menggunakan Teflon dengan menggunakan sedikit margarin</p></li><li dir=\"ltr\"><p dir=\"ltr\"> Tata paprika, wortel, irisan telur rebus, dan selada air di atas tortilla.</p></li><li dir=\"ltr\"><p dir=\"ltr\"> Berikan saus tomat atau saus sambal secukupnya sesuai selera.</p></li></ol>',NULL,1,'2019-06-17 17:25:18',NULL),
	(22,1500,'MS','Spageti Bolognaise','<p dir=\"ltr\"> Bahan :</p><ol><li dir=\"ltr\"><p dir=\"ltr\"> 100 gram spaghetti</p></li><li dir=\"ltr\"><p dir=\"ltr\"> sdm minyak goreng</p></li><li dir=\"ltr\"><p dir=\"ltr\"> Saus Bolognaise :</p></li><li dir=\"ltr\"><p dir=\"ltr\"> 1 sendok teh minyak goreng</p></li><li dir=\"ltr\"><p dir=\"ltr\"> ½ buah bawang bombay, cincang halus</p></li><li dir=\"ltr\"><p dir=\"ltr\"> 3 siung bawang putih, cincang halus</p></li><li dir=\"ltr\"><p dir=\"ltr\"> 100 gram ayam cincang</p></li><li dir=\"ltr\"><p dir=\"ltr\"> 4 buah tomat</p></li><li dir=\"ltr\"><p dir=\"ltr\"> Cabai rawit/cabai merah diblender, secukupnya</p></li><li dir=\"ltr\"><p dir=\"ltr\"> Garam, merica bubuk, dan gula pasir secukupnya</p></li></ol><br/>','<p dir=\"ltr\"> Cara membuat :</p><ol><li dir=\"ltr\"><p dir=\"ltr\"> Rebus spaghetti dengan air dan garam hingga kenyal, angkat dan tiriskann</p></li><li dir=\"ltr\"><p dir=\"ltr\"> Beri ½ sdm minyak goreng diatas spaghetti agar spaghetti tidak menempel</p></li><li dir=\"ltr\"><p dir=\"ltr\"> Saus : panaskan minyak, tumis bawang bombay dan bawang putih hingga harum. Masukkan daging giling, masak hingga berubah warna.</p></li><li dir=\"ltr\"><p dir=\"ltr\"> Masukkan saus tomat, saus sambal, garam, merica bubuk, dan gula pasir, masak hingga matang.</p></li><li dir=\"ltr\"><p dir=\"ltr\"> Susun tahu dalam piring saji, lalu siram saus bologrnaise di atasnya. Sajikan.</p></li></ol>',NULL,1,'2019-06-17 17:25:18',NULL),
	(23,1500,'MS','Tahu Goreng Bumbu Kuning','<p dir=\"ltr\"> Bahan :</p><ol><li dir=\"ltr\"><p dir=\"ltr\"> 50 gram tahu putih</p></li><li dir=\"ltr\"><p dir=\"ltr\"> 1 sdt minyak jagung</p></li></ol> <br/><p dir=\"ltr\"> Bumbu yang dihaluskan:</p><ol><li dir=\"ltr\"><p dir=\"ltr\"> 1 siung bawang putih</p></li><li dir=\"ltr\"><p dir=\"ltr\"> ½ sdt ketumbar</p></li><li dir=\"ltr\"><p dir=\"ltr\"> ¼ ruas jari kunyit</p></li><li dir=\"ltr\"><p dir=\"ltr\"> Garam secukupnya</p></li></ol> <br/>','<p dir=\"ltr\"> Cara membuat :</p><ol><li dir=\"ltr\"><p dir=\"ltr\"> Larutkan bumbu halus dengan sedikit air (25 cc). rendam tahu selama 5 menit</p></li><li dir=\"ltr\"><p dir=\"ltr\"> Panaskan minyak jagung dalam wajan, goreng tahu sampai matang</p></li></ol>',NULL,1,'2019-06-17 17:25:18',NULL),
	(24,1500,'SS','Spinach Banana Oat Smoothies','<p dir=\"ltr\"> Bahan :</p><ol><li dir=\"ltr\"><p dir=\"ltr\"> 75 gram pisang matang</p></li><li dir=\"ltr\"><p dir=\"ltr\"> 200 ml susu UHT low fat</p></li><li dir=\"ltr\"><p dir=\"ltr\"> 100 gram bayam segar,ambil daunnya saja</p></li><li dir=\"ltr\"><p dir=\"ltr\"> 2sdm oatmeal</p></li><li dir=\"ltr\"><p dir=\"ltr\"> 1 sdt bubuk kayu manis</p></li></ol> <br/>','<p dir=\"ltr\"> Cara membuat :</p><ol><li dir=\"ltr\"><p dir=\"ltr\"> Potong potong pisang dan masukkan bayam dan pisang ke dalam blender</p></li><li dir=\"ltr\"><p dir=\"ltr\"> Tambahkan susu dan oatmeal serta kayu manis</p></li><li dir=\"ltr\"><p dir=\"ltr\"> Blender jadi satu hingga halus dan tercampur rata</p></li><li dir=\"ltr\"><p dir=\"ltr\"> Sajikan dengan es batu lebih nikmat</p></li></ol>',NULL,1,'2019-06-17 17:25:18',NULL),
	(25,1700,'MP','Tahu Telur','<p dir=\"ltr\"> Bahan :</p><p dir=\"ltr\"> 50 gram tahu putih</p><p dir=\"ltr\"> 1 butir telur ayam</p><p dir=\"ltr\"> 1 batang daun bawang</p><p dir=\"ltr\"> 1 sdt minyak jagung</p><p dir=\"ltr\"> Bumbu :</p><p dir=\"ltr\"> Sedikit garam dan lada halus untuk memberi rasa gurih</p><br/>','<p dir=\"ltr\"> Cara membuat :</p><p dir=\"ltr\"> 1. Potong tahu seperti dadu kecil (ukuran 1 cm x 1 cm)</p><p dir=\"ltr\"> 2. Iris daun bawang tipis-tipis</p><p dir=\"ltr\"> 3. Kocok telur ayam dalam piring dan beri sedikit garam dan lada</p><p dir=\"ltr\"> 4. Masukkan potongan tahu putih dan aduk</p><p dir=\"ltr\"> 5. Panaskan minyak dalam wajan, goreng campuran tahu telur dengan menggunakan sendok makan sebagai cetakan</p><p> 6. Angakt setelah tahu berwarna kecoklatan</p>',NULL,1,'2019-06-17 18:20:17',NULL),
	(26,1700,'MS','Shabu-Shabu Tenggiri Caisin','<p dir=\"ltr\"> Bahan :</p><ol><li dir=\"ltr\"><p dir=\"ltr\"> 50 gram tenggiri</p></li><li dir=\"ltr\"><p dir=\"ltr\"> 50 gram caisin dipotong 3 cm</p></li><li dir=\"ltr\"><p dir=\"ltr\"> 2 batang daun bawang, potong serong</p></li><li dir=\"ltr\"><p dir=\"ltr\"> 300 cc air</p></li></ol> <br/><p dir=\"ltr\"> Bumbu :</p><ol><li dir=\"ltr\"><p dir=\"ltr\"> 2 siung bawang putih (digeprek)</p></li><li dir=\"ltr\"><p dir=\"ltr\"> 1 ruas jari jahe(dicincang)</p></li><li dir=\"ltr\"><p dir=\"ltr\"> 1 sdt bubuk kaldu ikan</p></li><li dir=\"ltr\"><p dir=\"ltr\"> ½ sdt mirin</p></li><li dir=\"ltr\"><p dir=\"ltr\"> Lada halus secukupnya</p></li><li dir=\"ltr\"><p dir=\"ltr\"> Garam secukupnya</p></li></ol> <br/><p dir=\"ltr\"> Bumbu Saus</p><ol><li dir=\"ltr\"><p dir=\"ltr\"> 1 sdt kecap kedelai</p></li><li dir=\"ltr\"><p dir=\"ltr\"> 1 sdt kecap asin</p></li><li dir=\"ltr\"><p dir=\"ltr\"> 1 sdt wijen</p></li></ol> <br/>','<p dir=\"ltr\"> Cara membuat :</p><p dir=\"ltr\"> 1) Buat saus shabu-shabu dengan mencampur kecap manis, kecap asin dan wijen, sisihkan</p><p dir=\"ltr\"> 2) Siapkan hotpot atau panci, isi air 300 ml dan didihkan</p><p dir=\"ltr\"> 3) Masukkan bawang putih, jahe cincang, garam,mirin dan kaldu ikan</p><p dir=\"ltr\"> 4) Tambahkan ikan tenggiri, masak hingga masak</p><p dir=\"ltr\"> 5) Masukkan caisin dan daun bawang saat akan diangkan</p><p dir=\"ltr\"> 6) Hidangkan panas-panas dengan saus shabu-shabu</p><div> <br/></div>',NULL,1,'2019-06-17 18:20:17',NULL),
	(27,1700,'MS','Tahu Goreng Bumbu Kuning','<p dir=\"ltr\"> Bahan :</p><ol><li dir=\"ltr\"><p dir=\"ltr\"> 50 gram tahu putih</p></li><li dir=\"ltr\"><p dir=\"ltr\"> 1 sdt minyak jagung</p></li></ol> <br/><p dir=\"ltr\"> Bumbu yang dihaluskan:</p><ol><li dir=\"ltr\"><p dir=\"ltr\"> 1 siung bawang putih</p></li><li dir=\"ltr\"><p dir=\"ltr\"> ½ sdt ketumbar</p></li><li dir=\"ltr\"><p dir=\"ltr\"> ¼ ruas jari kunyit</p></li><li dir=\"ltr\"><p dir=\"ltr\"> Garam secukupnya</p></li></ol> <br/>','<p dir=\"ltr\"> Cara membuat :</p><ol><li dir=\"ltr\"><p dir=\"ltr\"> Larutkan bumbu halus dengan sedikit air (25 cc). rendam tahu selama 5 menit</p></li><li dir=\"ltr\"><p dir=\"ltr\"> Panaskan minyak jagung dalam wajan, goreng tahu sampai matang</p></li></ol>',NULL,1,'2019-06-17 18:20:17',NULL),
	(28,1700,'MM','Ayam Saus Teriyaki','<p dir=\"ltr\"> Bahan :</p><ol><li dir=\"ltr\"><p dir=\"ltr\"> 25 gram ayam fillet, potong ukuran 2x2 cm</p></li><li dir=\"ltr\"><p dir=\"ltr\"> ¼ suing (25 gram) bawang Bombay, diiris tipis dan bulat</p></li><li dir=\"ltr\"><p dir=\"ltr\"> 25 cc air</p></li></ol><p dir=\"ltr\"> Bumbu :</p><ol><li dir=\"ltr\"><p dir=\"ltr\"> 2 sdt kecap teriyaki</p></li><li dir=\"ltr\"><p dir=\"ltr\"> 2 sdt kecap asin</p></li><li dir=\"ltr\"><p dir=\"ltr\"> 1 sdt minyak wijen</p></li><li dir=\"ltr\"><p dir=\"ltr\"> 2 siung bawang putih, geprek atau gerus kasar</p></li><li dir=\"ltr\"><p dir=\"ltr\"> ½ sdt lada halus</p></li><li dir=\"ltr\"><p dir=\"ltr\"> Garam halus secukupnya</p></li></ol><br/>','<p dir=\"ltr\"> Cara membuat :</p><p dir=\"ltr\"> 1. Campur ayam yang sudah dipotong-potong dengan kecap teriyaki,kecap asin, bawangputih, lada halus dan garam, diamkan 15 menit</p><p dir=\"ltr\"> 2. Panaskan minyak dalam wajan, tumis bawnag putih, bawang Bombay dan lada halus</p><p dir=\"ltr\"> 3. Masukkan daging ayam dan tumis 5 menit. Tambahkan air 25 cc dan masukkan semuabumbu yang tersisa</p><p dir=\"ltr\"> 4. Biarkan mendidih diatas api kecil sampai matang dan harum. Masukkan irisan bawang Bombay, angkat</p><p dir=\"ltr\"> 5. Sajikan dengan salad sayuran</p><div> <br/></div>',NULL,1,'2019-06-17 18:20:17',NULL),
	(29,1700,'SP','Setup Jambu Biji','<p dir=\"ltr\"> Bahan :</p><ol><li dir=\"ltr\"><p dir=\"ltr\"> 50 gram jambu biji</p></li><li dir=\"ltr\"><p dir=\"ltr\"> 1 buah sedang (50 gram) jeruk manis, ambil airnya</p></li></ol><br/>','<p dir=\"ltr\"> Cara membuat :</p><ol><li dir=\"ltr\"><p dir=\"ltr\"> Ambil bagian daging jambu biji dan potong bentuk dadu. Letakkan dalam mangkuk dan siram air jeruk manis</p></li></ol>',NULL,1,'2019-06-17 18:20:17',NULL),
	(30,1700,'MP','Rujak Mie Mentimun','<p dir=\"ltr\"> Bahan :</p><ol><li dir=\"ltr\"><p dir=\"ltr\"> 30 gram mie basah, bilas dengan air panas</p></li><li dir=\"ltr\"><p dir=\"ltr\"> 20 gram soun kering, rendam dengan air panas, tiriskan</p></li><li dir=\"ltr\"><p dir=\"ltr\"> 30 gram tauge, buang akarnya</p></li><li dir=\"ltr\"><p dir=\"ltr\"> 50 gram mentimun, iris dadu kecil</p></li><li dir=\"ltr\"><p dir=\"ltr\"> 1 sdt ebi</p></li><li dir=\"ltr\"><p dir=\"ltr\"> Garam dan gula aren secukupnya</p></li></ol> <br/><p dir=\"ltr\"> Bumbu yang dihaluskan:</p><ul><li dir=\"ltr\"><p dir=\"ltr\"> 3 siung bawang putih</p></li><li dir=\"ltr\"><p dir=\"ltr\"> 3 buah cabai rawit merah</p></li><li dir=\"ltr\"><p dir=\"ltr\"> 2 buah cabai merah keriting</p></li><li dir=\"ltr\"><p dir=\"ltr\"> ½ sdt ebi</p></li><li dir=\"ltr\"><p dir=\"ltr\"> Garam dan gula aren secukupnya</p></li></ul> <br/>','<p dir=\"ltr\"> Cara membuat :</p><p dir=\"ltr\"> 1. Campurkan bumbu yang dihaluskan dengan air dan gula aren, masak hingga mendidih</p><p dir=\"ltr\"> 2. Angkat, saring , dinginkan, tambahkan sedikit cuka lalu masak kembali dan aduk rata</p><p dir=\"ltr\"> 3. Atur mie, soun, toge dan mentimun dalam mangkuk</p><p dir=\"ltr\"> 4. Siram dengan bumbu, taburi dengan ebi, dan sajikan</p><div> <br/></div>',NULL,1,'2019-06-17 18:20:17',NULL),
	(31,1700,'MM','Sup Kacang merah sayuran','<p dir=\"ltr\"> Bahan :</p><ol><li dir=\"ltr\"><p dir=\"ltr\"> 40 gram kacang merah</p></li><li dir=\"ltr\"><p dir=\"ltr\"> 100 gram wortel dan buncis, iris iris</p></li><li dir=\"ltr\"><p dir=\"ltr\"> 300 cc kaldu ayam</p></li><li dir=\"ltr\"><p dir=\"ltr\"> Garam dan lada secukupnya</p></li></ol> <br/>','<p dir=\"ltr\"> Cara membuat :</p><p dir=\"ltr\"> 1. Rendam kacang merah selama 10 menit</p><p dir=\"ltr\"> 2. Rebus kacang merah dengan air kaldu</p><p dir=\"ltr\"> 3. Tambahkan wortel dan buncis, masak sampai lunak</p><p dir=\"ltr\"> 4. Tambahkan garam dan gula , masak hingga matang</p><p dir=\"ltr\"> 5. Sajikan</p><div> <br/></div>',NULL,1,'2019-06-17 18:20:17',NULL),
	(32,1700,NULL,'Cah Ayam Pare','<p dir=\"ltr\"> Bahan:</p><ol><li dir=\"ltr\"><p dir=\"ltr\"> 50 gram daging ayam, rebus dan suwir-suwir</p></li><li dir=\"ltr\"><p dir=\"ltr\"> 50 gram pare</p></li><li dir=\"ltr\"><p dir=\"ltr\"> ½ sdt minyak jagung, untuk menumis</p></li><li dir=\"ltr\"><p dir=\"ltr\"> 3 siung bawang merah, cincang halus</p></li><li dir=\"ltr\"><p dir=\"ltr\"> 1 buah cabai merah, iris serong</p></li><li dir=\"ltr\"><p dir=\"ltr\"> 50 cc air</p></li><li dir=\"ltr\"><p dir=\"ltr\"> ½ sdt tepung maizena</p></li><li dir=\"ltr\"><p dir=\"ltr\"> Kecap asin secukupnya</p></li></ol> <br/>','<p dir=\"ltr\"> Bumbu yang dihaluskan:</p><ol><li dir=\"ltr\"><p dir=\"ltr\"> 2 siung bawang putih</p></li><li dir=\"ltr\"><p dir=\"ltr\"> ½ ruas jahe</p></li><li dir=\"ltr\"><p dir=\"ltr\"> Gula secukupnya</p></li></ol> <br/><p dir=\"ltr\"> Cara membuat :</p><p dir=\"ltr\"> 1. Belah pare menjadi 2 bagian memanjang, buang bijinya, iris melintnag setebal ½ cm</p><p dir=\"ltr\"> 2. Lumuri pare dengan garam, lalu remas-remas. Sisihkan selama 10 menit agar pare tidak kaku</p><p dir=\"ltr\"> 3. Cuci bersih, peras airnya supaya rasa pahirnya hilang, sisihkan</p><p dir=\"ltr\"> 4. Tumis bumbu halus, masukkan bawang merah dan cabai. Aduk sampai baunya harum</p><p dir=\"ltr\"> 5. Masukkan pare, masak sampai pare setengah matang. Tambhakn suwiran daging ayam, aduk sampai berubah warna. Tuang air dan bubuhkan kecap asin masak sampai bahan cukup matang</p><p dir=\"ltr\"> 6. Masukkan larutan tepung maizena, aduk sampai kental, angkat</p><div> <br/></div>',NULL,1,'2019-06-17 18:20:17',NULL),
	(33,1900,'MP','Nasi Tim Ayam','<p dir=\"ltr\"> Bahan:</p><ol><li dir=\"ltr\"><p dir=\"ltr\"> Nasi : 1 gelas (150g)</p></li><li dir=\"ltr\"><p dir=\"ltr\"> Tahu : 1 bh besar (110g)</p></li><li dir=\"ltr\"><p dir=\"ltr\"> ayam fillet : 1 ptg sdg (40g)</p></li><li dir=\"ltr\"><p dir=\"ltr\"> tomat : 1/2 buah</p></li><li dir=\"ltr\"><p dir=\"ltr\"> margarin : 1 sdt (5g)</p></li><li dir=\"ltr\"><p dir=\"ltr\"> Saos tiram : 1 sdm</p></li><li dir=\"ltr\"><p dir=\"ltr\"> Air : 150 ml</p></li><li dir=\"ltr\"><p dir=\"ltr\"> Garam : secukupnya</p></li><li dir=\"ltr\"><p dir=\"ltr\"> Bawang putih : 1 siung</p></li></ol><br/>','<p dir=\"ltr\"> Cara membuat:</p><ul><li dir=\"ltr\"><p dir=\"ltr\"> Cincang halus bawang putih, sisihkan</p></li><li dir=\"ltr\"><p dir=\"ltr\"> Potong dadu ayam, tahu dan tomat, sisihkan</p></li><li dir=\"ltr\"><p dir=\"ltr\"> Masukan margarin ke wajan yang sudah dipanaskan</p></li><li dir=\"ltr\"><p dir=\"ltr\"> Masukan bawang putih yang sudah dicincang, dan tumis hingga wangi/agak kecoklatan</p></li><li dir=\"ltr\"><p dir=\"ltr\"> Masukan ayam dan tahu yang sudah dipotong, tumis sebentar</p></li><li dir=\"ltr\"><p dir=\"ltr\"> Masukan saos tiram dan air sebanyak 50 ml, simpan sisanya (100 ml)</p></li><li dir=\"ltr\"><p dir=\"ltr\"> Tambahkan garam sesuai selera</p></li><li dir=\"ltr\"><p dir=\"ltr\"> Masak hingga daging ayam matang</p></li><li dir=\"ltr\"><p dir=\"ltr\"> Ambil mangkuk nasi untuk mengukus nasi tim</p></li><li dir=\"ltr\"><p dir=\"ltr\"> Masukan nasi dan ratakan, tambahkan air yang sudah disisihkan (100ml)</p></li><li dir=\"ltr\"><p dir=\"ltr\"> Kukus hingga nasi menjadi lembek</p></li><li dir=\"ltr\"><p dir=\"ltr\"> Keluarkan nasi dari mangkuk, tuangkan tumisan ayam. Sajikan</p></li></ul>',NULL,1,'2019-06-17 18:37:07',NULL),
	(34,1900,'MS','Tumis Sayur Labu','<p dir=\"ltr\"> Bahan:</p><ol><li dir=\"ltr\"><p dir=\"ltr\"> Labu siam : ½ buah</p></li><li dir=\"ltr\"><p dir=\"ltr\"> Jagung muda : 1 gelas (100g)</p></li><li dir=\"ltr\"><p dir=\"ltr\"> Tempe : 2 potong sedang (50g)</p></li><li dir=\"ltr\"><p dir=\"ltr\"> Bawang putih : 1 siung</p></li><li dir=\"ltr\"><p dir=\"ltr\"> Cabai merah besar : 1 buah</p></li><li dir=\"ltr\"><p dir=\"ltr\"> Minyak kelapa : 1 sdt (5g)</p></li><li dir=\"ltr\"><p dir=\"ltr\"> Garam : secukupnya</p></li><li dir=\"ltr\"><p dir=\"ltr\"> Air : secukupnya (50ml)</p></li></ol>','<p dir=\"ltr\"> Cara membuat:</p><ul><li dir=\"ltr\"><p dir=\"ltr\"> Potong korek labu siam dan tempe</p></li><li dir=\"ltr\"><p dir=\"ltr\"> Potong jagung muda secara menyerong</p></li><li dir=\"ltr\"><p dir=\"ltr\"> Iris tipis bawang putih dan cabai merah besar</p></li><li dir=\"ltr\"><p dir=\"ltr\"> Panaskan minyak diatas api kecil</p></li><li dir=\"ltr\"><p dir=\"ltr\"> Masukkan bawang putih dan cabai merah dan tumis hingga wangi</p></li><li dir=\"ltr\"><p dir=\"ltr\"> Tambahkan jagung muda, tempe, dan labu siam</p></li><li dir=\"ltr\"><p dir=\"ltr\"> Oseng sebentar</p></li><li dir=\"ltr\"><p dir=\"ltr\"> Tambahkan air dan garam, masak hingga matang</p></li></ul>',NULL,1,'2019-06-17 18:37:07',NULL),
	(35,1900,'MS','Daging Sapi Teriyaki','<p dir=\"ltr\"> Bahan:</p><ol><li dir=\"ltr\"><p dir=\"ltr\"> Daging sapi teriyaki : 100 g</p></li><li dir=\"ltr\"><p dir=\"ltr\"> Minyak : 3 sdt (15g)</p></li><li dir=\"ltr\"><p dir=\"ltr\"> Saus teriyaki : 3 sdm</p></li><li dir=\"ltr\"><p dir=\"ltr\"> Bawang bombay : ½ buah</p></li><li dir=\"ltr\"><p dir=\"ltr\"> Air : 50 ml</p></li></ol><br/>','<p dir=\"ltr\"> Cara membuat:</p><ul><li dir=\"ltr\"><p dir=\"ltr\"> Potong memanjang bawang bombay</p></li><li dir=\"ltr\"><p dir=\"ltr\"> Panaskan minyak di api kecil</p></li><li dir=\"ltr\"><p dir=\"ltr\"> Tumis bawang bombay hingga sedikit kecoklatan</p></li><li dir=\"ltr\"><p dir=\"ltr\"> Masukkan daging sapi, oseng sebentar</p></li><li dir=\"ltr\"><p dir=\"ltr\"> Masukkan saus teriyaki dan air</p></li><li dir=\"ltr\"><p dir=\"ltr\"> Masak hingga daging matang</p></li></ul>',NULL,1,'2019-06-17 18:37:07',NULL),
	(36,1900,'MS','Sup Daging Kacang Merah','<p dir=\"ltr\"> Bahan:</p><ol><li dir=\"ltr\"><p dir=\"ltr\"> Kacang merah : 100g</p></li><li dir=\"ltr\"><p dir=\"ltr\"> Daging Sapi : 165g</p></li><li dir=\"ltr\"><p dir=\"ltr\"> Kentang : 500g</p></li><li dir=\"ltr\"><p dir=\"ltr\"> Kol : 500g</p></li><li dir=\"ltr\"><p dir=\"ltr\"> Kaldu instan : 10g/4 blok/2 bungkus</p></li><li dir=\"ltr\"><p dir=\"ltr\"> Air :1500 ml</p></li></ol><br/>','<p dir=\"ltr\"> Cara Membuat:</p><ul><li dir=\"ltr\"><p dir=\"ltr\"> bersihkan daging sapi, kacang merah, kentang dan kol</p></li><li dir=\"ltr\"><p dir=\"ltr\"> potong potong daging sapi, kentang dan kol menjadi ukuran kecil</p></li><li dir=\"ltr\"><p dir=\"ltr\"> masukkan air kedalam panci, panaskan</p></li><li dir=\"ltr\"><p dir=\"ltr\"> ketika air mulai mendidih, masukkan daging sapi, kacang merah, dan kentang</p></li><li dir=\"ltr\"><p dir=\"ltr\"> biarkan selama 10 menit, masukkan kol</p></li><li dir=\"ltr\"><p dir=\"ltr\"> masukan kaldu instan</p></li><li dir=\"ltr\"><p dir=\"ltr\"> masak hingga daging matang</p></li></ul>',NULL,1,'2019-06-17 18:37:07',NULL),
	(37,1900,'MM','Mie Goreng Ayam Oriental','<p dir=\"ltr\"> Bahan:</p><ol><li dir=\"ltr\"><p dir=\"ltr\"> Mie kering : 200gr/ 400g setelah dimasak</p></li><li dir=\"ltr\"><p dir=\"ltr\"> Tahu : 220g</p></li><li dir=\"ltr\"><p dir=\"ltr\"> Fillet ayam : 80g (cincang)</p></li><li dir=\"ltr\"><p dir=\"ltr\"> Tepung terigu : 100</p></li><li dir=\"ltr\"><p dir=\"ltr\"> Caisim : 2 gelas (200g)</p></li><li dir=\"ltr\"><p dir=\"ltr\"> Minyak Kelapa : 4 sdt (20g)</p></li><li dir=\"ltr\"><p dir=\"ltr\"> Bawang merah : 4 buah</p></li><li dir=\"ltr\"><p dir=\"ltr\"> Bawang Putih : 2 siung</p></li><li dir=\"ltr\"><p dir=\"ltr\"> Garam : secukupnya</p></li><li dir=\"ltr\"><p dir=\"ltr\"> Air : 20 ml</p></li></ol><br/>','<p dir=\"ltr\"> Cara Membuat:</p><ul><li dir=\"ltr\"><p dir=\"ltr\"> Masak mie hingga matang jika menggunakan mie kering. Sisihkan</p></li><li dir=\"ltr\"><p dir=\"ltr\"> Bersihkan caisim</p></li><li dir=\"ltr\"><p dir=\"ltr\"> Campurkan daging ayam yang sudah dicincang dengan tepung, tahu, dan garam secukupnya hingga merata. Sisihkan</p></li><li dir=\"ltr\"><p dir=\"ltr\"> Cincang halus bawang merah, dan bawang putih</p></li><li dir=\"ltr\"><p dir=\"ltr\"> Masukan minyak dan panaskan diatas wajan dengan api kecil</p></li><li dir=\"ltr\"><p dir=\"ltr\"> Tumis bawang merah dan putih yang sudah dicincang hingga kecoklatan</p></li><li dir=\"ltr\"><p dir=\"ltr\"> Masukkan adonan daging yang sudah dibuat</p></li><li dir=\"ltr\"><p dir=\"ltr\"> Oseng oseng hingga setengah matang</p></li><li dir=\"ltr\"><p dir=\"ltr\"> Tambahkan caisim dan mie, masukkan air</p></li><li dir=\"ltr\"><p dir=\"ltr\"> Campur hingga rata dan tambahakan garam sesuai selera</p></li></ul>',NULL,1,'2019-06-17 18:37:07',NULL),
	(38,1900,'SS','Jus Jambu Biji','<p dir=\"ltr\"> Bahan:</p><ol><li dir=\"ltr\"><p dir=\"ltr\"> Jambu biji : 1 buah (85g)</p></li><li dir=\"ltr\"><p dir=\"ltr\"> Gula pasir : 1 sdm (13g)</p></li><li dir=\"ltr\"><p dir=\"ltr\"> Air dingin : 100ml/ ½ gelas</p></li></ol><br/>','<p dir=\"ltr\"> Cara membuat:</p><ul><li dir=\"ltr\"><p dir=\"ltr\"> Cuci bersih jambu biji, potong hingga menjadi ¼ bagian</p></li><li dir=\"ltr\"><p dir=\"ltr\"> Masukkan jambu biji, gula, dan air kedalam blender</p></li><li dir=\"ltr\"><p dir=\"ltr\"> Nyalakan blender dengan kecepatan sedang-tinggi</p></li><li dir=\"ltr\"><p dir=\"ltr\"> Saat dituang ke gelas, saring jus agar terpisah dengan biji yang belum halus</p></li></ul>',NULL,1,'2019-06-17 18:37:07',NULL),
	(39,2500,'MP','Sandwich Gandum','<p dir=\"ltr\"> Bahan :</p><ol><li dir=\"ltr\"><p dir=\"ltr\"> Roti gandum 2 iris</p></li><li dir=\"ltr\"><p dir=\"ltr\"> irisan selada dan tomat (sesukanya)</p></li><li dir=\"ltr\"><p dir=\"ltr\"> 1 buah telur kocok</p></li><li dir=\"ltr\"><p dir=\"ltr\"> minyak untuk menggoreng</p></li></ol><br/>','<p dir=\"ltr\"> Cara membuat :</p><p dir=\"ltr\"> 1. Kocok telur di mangkuk</p><p dir=\"ltr\"> 2. Panaskan penggorengan yang telah diberi minyak goreng</p><p dir=\"ltr\"> 3. Goreng telur menjadi dadar tipis</p><p dir=\"ltr\"> 4. Iris tomat dan selada</p><p> 5. Tata roti gandum, telur, irisan tomat dan selada.</p>',NULL,1,'2019-06-17 18:50:37',NULL),
	(40,2500,'SP','Bihun Goreng','<p dir=\"ltr\"> Bahan :</p><ol><li dir=\"ltr\"><p dir=\"ltr\"> Bihun mentah</p></li><li dir=\"ltr\"><p dir=\"ltr\"> Merica halus</p></li><li dir=\"ltr\"><p dir=\"ltr\"> 2 buah bawang merah</p></li><li dir=\"ltr\"><p dir=\"ltr\"> 1 buah bawang putih</p></li><li dir=\"ltr\"><p dir=\"ltr\"> garam secukupnya</p></li><li dir=\"ltr\"><p dir=\"ltr\"> minyak goreng</p></li></ol><br/>','<p dir=\"ltr\"> Cara Membuat :</p><p dir=\"ltr\"> 1. Rendam bihun dengan air panas sampai lunak</p><p dir=\"ltr\"> 2. Siapkan penggorengan dan beri minyak</p><p dir=\"ltr\"> 3. Masukkan bawang merah dan bawang putih yang sudah dihaluskan kemudian tumis</p><p dir=\"ltr\"> 4.Masukkan bihun ke penggorengan dan beri garam secukupnya</p><p> 5. Angkat dan sajikan</p>',NULL,1,'2019-06-17 18:50:37',NULL),
	(41,2500,'SS','Smoothies Bayam','<p dir=\"ltr\"> Bahan :</p><ol><li dir=\"ltr\"><p dir=\"ltr\"> 150 gram Bayam</p></li><li dir=\"ltr\"><p dir=\"ltr\"> 200 ml susu UHT low fat</p></li><li dir=\"ltr\"><p dir=\"ltr\"> 2 sdm oat bubuk (quaker)</p></li><li dir=\"ltr\"><p dir=\"ltr\"> 1 sdm madu</p></li><li dir=\"ltr\"><p dir=\"ltr\"> 1 buah Pisang ukuran sedang</p></li></ol><br/>','<p dir=\"ltr\"> Cara membuat :</p><p dir=\"ltr\"> 1.Potong potong daun bayam , masukkan kedalam mangkuk blender. Tambahkan air hingga sayur lumat</p><p dir=\"ltr\"> 2. Campurkan oatmeal , pisang, susu, dan madu ke dalam blender</p><p> 3. Tuang ke gelas dan sajikan selagi dingin</p> <br/>',NULL,1,'2019-06-17 18:50:37',NULL),
	(42,2500,'MM','Puding Roti Kukus','<p dir=\"ltr\"> Bahan :</p><ol><li dir=\"ltr\"><p dir=\"ltr\"> 2 iris roti putih potong kotak kecil</p></li><li dir=\"ltr\"><p dir=\"ltr\"> 1/2 sdm mentega</p></li><li dir=\"ltr\"><p dir=\"ltr\"> 1 butir telur</p></li><li dir=\"ltr\"><p dir=\"ltr\"> 1/4 sdt vanili</p></li><li dir=\"ltr\"><p dir=\"ltr\"> 1/2 sachet skm putih</p></li><li dir=\"ltr\"><p dir=\"ltr\"> susu cair 200 ml</p></li></ol> <br/>','<p dir=\"ltr\"> Cara membuat :</p><p dir=\"ltr\"> 1. Mixer telur, susu cair, skm sampai tercampur rata</p><p dir=\"ltr\"> 2. Tambahkan roti tawar dan aduk hingga rata</p><p dir=\"ltr\"> 3. Tuang adonan kke wadah yang sudah diolesi mentega</p><p dir=\"ltr\"> 4. Kukus kira kira 15 menit sampai matang</p><p> 5. Siap disajikan</p>',NULL,1,'2019-06-17 18:50:37',NULL),
	(43,2500,'SS','Puding Buah Naga','<p dir=\"ltr\"> Bahan :</p><ol><li dir=\"ltr\"><p dir=\"ltr\"> 1 buah naga merah (kupas ambil daging buah, haluskan dengan blender atau potong kotak sesuai selera)</p></li><li dir=\"ltr\"><p dir=\"ltr\"> 1 bungkus agar-agar putih.</p></li><li dir=\"ltr\"><p dir=\"ltr\"> 125 gram gula pasir.</p></li><li dir=\"ltr\"><p dir=\"ltr\"> Vanili bubuk (secukupnya, kira-kira 1/2 sdt)</p></li><li dir=\"ltr\"><p dir=\"ltr\"> Susu putih cair (secukupnya, bila suka)</p></li><li dir=\"ltr\"><p dir=\"ltr\"> 600 ml air putih.</p></li></ol><br/>','<p dir=\"ltr\"> Cara Memasak :</p><p dir=\"ltr\"> Siapkan panci yang sudah diberi air. Selanjutnya, masukkan agar-agar, gula pasir dan bubuk vanili. Aduk rata hingga semua bahan tercampur rata. Rebus hingga sedikit mendidih.</p><p dir=\"ltr\"> Tambahkan buah naga ke dalam adonan, aduk rata.</p><p dir=\"ltr\"> Tambahkan pula susu kental manis lalu masak hingga mendidih sambil terus diaduk.</p><p dir=\"ltr\"> Matikan kompor lalu angkat dan tuang dalam cetakan.</p><p dir=\"ltr\"> Masukkan ke dalam lemari es agar puding makin segar dan lezat.</p><div> <br/></div>',NULL,1,'2019-06-17 18:50:37',NULL),
	(45,2300,'SS','Smoothies Bayam','<p dir=\"ltr\"> Bahan :</p><ol><li dir=\"ltr\"><p dir=\"ltr\"> 150 gram Bayam</p></li><li dir=\"ltr\"><p dir=\"ltr\"> 200 ml susu UHT low fat</p></li><li dir=\"ltr\"><p dir=\"ltr\"> 2 sdm oat bubuk (quaker)</p></li><li dir=\"ltr\"><p dir=\"ltr\"> 1 sdm madu</p></li><li dir=\"ltr\"><p dir=\"ltr\"> 1 buah Pisang ukuran sedang</p></li></ol><br/>','<p dir=\"ltr\"> Cara membuat :</p><p dir=\"ltr\"> 1.Potong potong daun bayam , masukkan kedalam mangkuk blender. Tambahkan air hingga sayur lumat</p><p dir=\"ltr\"> 2. Campurkan oatmeal , pisang, susu, dan madu ke dalam blender</p><p> 3. Tuang ke gelas dan sajikan selagi dingin</p> <br/>',NULL,1,'2019-06-17 18:50:37',NULL),
	(46,2300,'SS','Puding Buah Naga','<p dir=\"ltr\"> Bahan :</p><ol><li dir=\"ltr\"><p dir=\"ltr\"> 1 buah naga merah (kupas ambil daging buah, haluskan dengan blender atau potong kotak sesuai selera)</p></li><li dir=\"ltr\"><p dir=\"ltr\"> 1 bungkus agar-agar putih.</p></li><li dir=\"ltr\"><p dir=\"ltr\"> 125 gram gula pasir.</p></li><li dir=\"ltr\"><p dir=\"ltr\"> Vanili bubuk (secukupnya, kira-kira 1/2 sdt)</p></li><li dir=\"ltr\"><p dir=\"ltr\"> Susu putih cair (secukupnya, bila suka)</p></li><li dir=\"ltr\"><p dir=\"ltr\"> 600 ml air putih.</p></li></ol><br/>','<p dir=\"ltr\"> Cara Memasak :</p><p dir=\"ltr\"> Siapkan panci yang sudah diberi air. Selanjutnya, masukkan agar-agar, gula pasir dan bubuk vanili. Aduk rata hingga semua bahan tercampur rata. Rebus hingga sedikit mendidih.</p><p dir=\"ltr\"> Tambahkan buah naga ke dalam adonan, aduk rata.</p><p dir=\"ltr\"> Tambahkan pula susu kental manis lalu masak hingga mendidih sambil terus diaduk.</p><p dir=\"ltr\"> Matikan kompor lalu angkat dan tuang dalam cetakan.</p><p dir=\"ltr\"> Masukkan ke dalam lemari es agar puding makin segar dan lezat.</p><div> <br/></div>',NULL,1,'2019-06-17 18:50:37',NULL),
	(49,2300,'MP','Sandwich Gandum','<p dir=\"ltr\"> Bahan :</p><ol><li dir=\"ltr\"><p dir=\"ltr\"> Roti gandum 2 iris</p></li><li dir=\"ltr\"><p dir=\"ltr\"> irisan selada dan tomat (sesukanya)</p></li><li dir=\"ltr\"><p dir=\"ltr\"> 1 buah telur kocok</p></li><li dir=\"ltr\"><p dir=\"ltr\"> minyak untuk menggoreng</p></li></ol><br/>','<p dir=\"ltr\"> Cara membuat :</p><p dir=\"ltr\"> 1. Kocok telur di mangkuk</p><p dir=\"ltr\"> 2. Panaskan penggorengan yang telah diberi minyak goreng</p><p dir=\"ltr\"> 3. Goreng telur menjadi dadar tipis</p><p dir=\"ltr\"> 4. Iris tomat dan selada</p><p> 5. Tata roti gandum, telur, irisan tomat dan selada.</p>',NULL,1,'2019-06-17 18:50:37',NULL),
	(50,2300,'SP','Bihun Goreng','<p dir=\"ltr\"> Bahan :</p><ol><li dir=\"ltr\"><p dir=\"ltr\"> Bihun mentah</p></li><li dir=\"ltr\"><p dir=\"ltr\"> Merica halus</p></li><li dir=\"ltr\"><p dir=\"ltr\"> 2 buah bawang merah</p></li><li dir=\"ltr\"><p dir=\"ltr\"> 1 buah bawang putih</p></li><li dir=\"ltr\"><p dir=\"ltr\"> garam secukupnya</p></li><li dir=\"ltr\"><p dir=\"ltr\"> minyak goreng</p></li></ol><br/>','<p dir=\"ltr\"> Cara Membuat :</p><p dir=\"ltr\"> 1. Rendam bihun dengan air panas sampai lunak</p><p dir=\"ltr\"> 2. Siapkan penggorengan dan beri minyak</p><p dir=\"ltr\"> 3. Masukkan bawang merah dan bawang putih yang sudah dihaluskan kemudian tumis</p><p dir=\"ltr\"> 4.Masukkan bihun ke penggorengan dan beri garam secukupnya</p><p> 5. Angkat dan sajikan</p>',NULL,1,'2019-06-17 18:50:37',NULL),
	(51,2300,'MM','Puding Roti Kukus','<p dir=\"ltr\"> Bahan :</p><ol><li dir=\"ltr\"><p dir=\"ltr\"> 2 iris roti putih potong kotak kecil</p></li><li dir=\"ltr\"><p dir=\"ltr\"> 1/2 sdm mentega</p></li><li dir=\"ltr\"><p dir=\"ltr\"> 1 butir telur</p></li><li dir=\"ltr\"><p dir=\"ltr\"> 1/4 sdt vanili</p></li><li dir=\"ltr\"><p dir=\"ltr\"> 1/2 sachet skm putih</p></li><li dir=\"ltr\"><p dir=\"ltr\"> susu cair 200 ml</p></li></ol> <br/>','<p dir=\"ltr\"> Cara membuat :</p><p dir=\"ltr\"> 1. Mixer telur, susu cair, skm sampai tercampur rata</p><p dir=\"ltr\"> 2. Tambahkan roti tawar dan aduk hingga rata</p><p dir=\"ltr\"> 3. Tuang adonan kke wadah yang sudah diolesi mentega</p><p dir=\"ltr\"> 4. Kukus kira kira 15 menit sampai matang</p><p> 5. Siap disajikan</p>',NULL,1,'2019-06-17 18:50:37',NULL);

/*!40000 ALTER TABLE `food_receipt` ENABLE KEYS */;
UNLOCK TABLES;


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
	(23,'{\"id\":\"3d7a17f8-1eca-4797-95e2-91d4ef3682ce\",\"recipients\":1,\"external_id\":null}','2019-03-06 13:12:05','2019-03-06 13:12:05'),
	(24,'{\"id\":\"4ac1d401-cbc2-4f9a-9683-10d508c6c97a\",\"recipients\":1,\"external_id\":null}','2019-03-12 13:12:01','2019-03-12 13:12:01'),
	(25,'{\"id\":\"92ac78e1-aaa6-44c1-a91e-7d37cb31174c\",\"recipients\":1,\"external_id\":null}','2019-03-13 13:12:01','2019-03-13 13:12:01'),
	(26,'{\"id\":\"19924455-ad4b-4f8e-9cfe-a6e0148ca1fe\",\"recipients\":1,\"external_id\":null}','2019-03-14 13:12:02','2019-03-14 13:12:02'),
	(27,'{\"id\":\"67e4ca88-4fa5-4aa5-aeac-500db5e54bb9\",\"recipients\":1,\"external_id\":null}','2019-03-17 13:11:01','2019-03-17 13:11:01'),
	(28,'{\"id\":\"bc7a9969-788c-47f3-80a2-088d9166511b\",\"recipients\":1,\"external_id\":null}','2019-03-17 13:12:01','2019-03-17 13:12:01'),
	(29,'{\"id\":\"0877b7a1-2b5c-424b-a7bc-806406790b93\",\"recipients\":1,\"external_id\":null}','2019-03-18 13:12:03','2019-03-18 13:12:03'),
	(30,'{\"id\":\"96abb76e-41fb-4114-ba03-bbcc36cb5e00\",\"recipients\":1,\"external_id\":null}','2019-03-19 13:12:01','2019-03-19 13:12:01'),
	(31,'{\"id\":\"d974d5d2-4098-435d-8b3e-2d3fa8623f0e\",\"recipients\":1,\"external_id\":null}','2019-03-22 13:12:02','2019-03-22 13:12:02'),
	(32,'{\"id\":\"8b62e1c4-c350-4cab-b8ab-21ac4b3be9c8\",\"recipients\":1,\"external_id\":null}','2019-03-26 12:12:02','2019-03-26 12:12:02'),
	(33,'{\"multicast_id\":7634748141684322206,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1559664781163657%5616b98b5616b98b\"}]}','2019-06-04 23:13:01','2019-06-04 23:13:01'),
	(34,'{\"multicast_id\":9003714563568392355,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1559664961083135%5616b98b5616b98b\"}]}','2019-06-04 23:16:01','2019-06-04 23:16:01'),
	(35,'{\"multicast_id\":8034684886974682513,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1560183180905802%5616b98b5616b98b\"}]}','2019-06-10 23:13:00','2019-06-10 23:13:00'),
	(36,'{\"multicast_id\":6693106791431032490,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1560442382458729%5616b98b5616b98b\"}]}','2019-06-13 23:13:01','2019-06-13 23:13:01'),
	(37,'{\"multicast_id\":4752082890053005654,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1560701582565435%5616b98b5616b98b\"}]}','2019-06-16 23:13:02','2019-06-16 23:13:02'),
	(38,'{\"multicast_id\":5623965342841753456,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1560701762038712%5616b98b5616b98b\"}]}','2019-06-16 23:16:01','2019-06-16 23:16:01');

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
	(17,1,1300,192,45,35,'2019-03-07 16:02:18','2019-03-07 16:02:18'),
	(18,1,1300,192,45,35,'2019-03-30 11:12:28','2019-03-30 11:12:28'),
	(19,1,1300,192,45,35,'2019-03-31 15:17:21','2019-03-31 15:17:21'),
	(20,1,1300,192,45,35,'2019-06-04 23:11:10','2019-06-04 23:11:10'),
	(21,1,1300,192,45,35,'2019-06-15 13:45:54','2019-06-15 13:45:54');

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
	(1,'admin@dietbetes.com','$2y$10$vemGZj4iPnji9hd856ElR.laY28lYv9Nolu90cjmzp1bIvkhZ8xAm','eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOjEsImlzcyI6Imh0dHA6Ly8xMC4wLjAuMy9hcGkvdjEvYXV0aC9sb2dpbiIsImlhdCI6MTU1OTY2NTYxMSwiZXhwIjoxNTYyMjU3NjExLCJuYmYiOjE1NTk2NjU2MTEsImp0aSI6IjR1VUw5V2RBR2xZdUlQTVgifQ.Mg-wB2SCqcGkwYkBzupwrNqJ4munqVB40q0JP_3Fo90',NULL,'dR3OffdA9Tc:APA91bFicCKe_G4sbQk_PWfYHurqxSYeicOBDrGLLBnHZ3vA5bwXbuYoB0GTGJYSpVv6DeWnWJg9-HLOfqAIkV5dDmXZ8L4s6cwS6fo52360bkfqIXlh8NFQOp4TZcmZNo1CBoECL3de','hqhyovzs-1548784355.jpg','2019-06-04 23:26:51',1,'2019-01-28 18:32:06','2019-06-04 23:26:51'),
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
