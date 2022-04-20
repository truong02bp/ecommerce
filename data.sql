-- MySQL dump 10.13  Distrib 8.0.28, for Linux (x86_64)
--
-- Host: localhost    Database: ecommerce
-- ------------------------------------------------------
-- Server version	8.0.28-0ubuntu0.20.04.3

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add category',7,'add_category'),(26,'Can change category',7,'change_category'),(27,'Can delete category',7,'delete_category'),(28,'Can view category',7,'view_category'),(29,'Can add item',8,'add_item'),(30,'Can change item',8,'change_item'),(31,'Can delete item',8,'delete_item'),(32,'Can view item',8,'view_item'),(33,'Can add producer',9,'add_producer'),(34,'Can change producer',9,'change_producer'),(35,'Can delete producer',9,'delete_producer'),(36,'Can view producer',9,'view_producer'),(37,'Can add user',10,'add_user'),(38,'Can change user',10,'change_user'),(39,'Can delete user',10,'delete_user'),(40,'Can view user',10,'view_user'),(41,'Can add laptop',11,'add_laptop'),(42,'Can change laptop',11,'change_laptop'),(43,'Can delete laptop',11,'delete_laptop'),(44,'Can view laptop',11,'view_laptop'),(45,'Can add publisher',12,'add_publisher'),(46,'Can change publisher',12,'change_publisher'),(47,'Can delete publisher',12,'delete_publisher'),(48,'Can view publisher',12,'view_publisher'),(49,'Can add author',13,'add_author'),(50,'Can change author',13,'change_author'),(51,'Can delete author',13,'delete_author'),(52,'Can view author',13,'view_author'),(53,'Can add book',14,'add_book'),(54,'Can change book',14,'change_book'),(55,'Can delete book',14,'delete_book'),(56,'Can view book',14,'view_book');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'bcrypt_sha256$$2b$12$JoARJcrLl.fg8oHa8iPxAeUi9U65EBzfAb9xmcl.Yyd3OSbvgWvtu','2022-04-19 15:55:53.282258',1,'truong','','','truong02.bp@gmail.com',1,1,'2022-04-19 08:05:54.338941');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2022-04-19 08:08:06.411845','1','Category object (1)',1,'[{\"added\": {}}]',7,1),(2,'2022-04-19 10:12:26.455653','1','1 - bhn',1,'[{\"added\": {}}]',8,1),(3,'2022-04-19 14:03:16.259255','2','2 - book',1,'[{\"added\": {}}]',7,1),(4,'2022-04-19 14:04:13.956004','3','3 - history',1,'[{\"added\": {}}]',7,1),(5,'2022-04-19 14:04:54.025313','4','4 - commics',1,'[{\"added\": {}}]',7,1),(6,'2022-04-19 14:05:18.722802','5','5 - business',1,'[{\"added\": {}}]',7,1),(7,'2022-04-19 14:05:39.489001','6','6 - biographies',1,'[{\"added\": {}}]',7,1),(8,'2022-04-19 14:05:55.494014','1','1 - bhn',3,'',8,1),(9,'2022-04-19 16:05:05.343075','2','2 - Apple MacBook Pro (2020) M1 Chip, 13.3 inch, 8GB, 512GB SSD',1,'[{\"added\": {}}]',8,1),(10,'2022-04-19 16:05:37.878808','1','1 - Apple',1,'[{\"added\": {}}]',9,1),(11,'2022-04-19 16:05:42.614168','1','1 - Apple MacBook Pro (2020) M1 Chip, 13.3 inch, 8GB, 512GB SSD',1,'[{\"added\": {}}]',11,1),(12,'2022-04-19 16:19:27.970885','3','3 - Apple MacBook Air (2020) M1 Chip, 13.3-inch, 8GB, 256GB SSD - 28990000.0',1,'[{\"added\": {}}]',8,1),(13,'2022-04-19 16:19:33.896329','2','2 - Apple MacBook Air (2020) M1 Chip, 13.3-inch, 8GB, 256GB SSD',1,'[{\"added\": {}}]',11,1),(14,'2022-04-20 03:35:05.841857','3','3 - Apple MacBook Air (2020) M1 Chip, 13.3-inch, 8GB, 256GB SSD - 28990000.0',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',8,1),(15,'2022-04-20 03:38:17.347377','2','2 - Apple MacBook Pro (2020) M1 Chip, 13.3 inch, 8GB, 512GB SSD - 42990000.0',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',8,1),(16,'2022-04-20 03:38:44.098782','3','3 - Apple MacBook Air (2020) M1 Chip, 13.3-inch, 8GB, 256GB SSD - 28990000.0',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',8,1),(17,'2022-04-20 03:39:13.040212','3','3 - Apple MacBook Air (2020) M1 Chip, 13.3-inch, 8GB, 256GB SSD - 28990000.0',2,'[]',8,1),(18,'2022-04-20 03:39:59.300309','4','4 - MacBook Air M1 13 inch 2020 512GB - MGN73 / MGNA3 / MGNE3 - 29.99',1,'[{\"added\": {}}]',8,1),(19,'2022-04-20 03:40:12.136197','4','4 - MacBook Air M1 13 inch 2020 512GB - MGN73 / MGNA3 / MGNE3 - 29990000.0',2,'[{\"changed\": {\"fields\": [\"Price\"]}}]',8,1),(20,'2022-04-20 04:30:29.746657','3','3 - MacBook Air M1 13 inch 2020 512GB - MGN73 / MGNA3 / MGNE3',1,'[{\"added\": {}}]',11,1),(21,'2022-04-20 04:44:58.493129','5','5 - MacBook Pro 16 inch 2019 1TB - MVVK2 / MVVM2 - 45000000.0',1,'[{\"added\": {}}]',8,1),(22,'2022-04-20 04:45:05.168642','4','4 - MacBook Pro 16 inch 2019 1TB - MVVK2 / MVVM2',1,'[{\"added\": {}}]',11,1),(23,'2022-04-20 04:54:21.689627','6','6 - MacBook Pro 16 inch 2019 512GB - MVVJ2 / MVVL2 - 33000000.0',1,'[{\"added\": {}}]',8,1),(24,'2022-04-20 04:54:28.292595','5','5 - MacBook Pro 16 inch 2019 512GB - MVVJ2 / MVVL2',1,'[{\"added\": {}}]',11,1),(25,'2022-04-20 04:57:10.712352','6','6 - MacBook Pro 16 inch 2019 512GB - MVVJ2 / MVVL2 - 33000000.0',2,'[{\"changed\": {\"fields\": [\"Discount\"]}}]',8,1),(26,'2022-04-20 04:58:30.082611','2','2 - Apple MacBook Pro (2020) M1 Chip, 13.3 inch, 8GB, 512GB SSD - 36000000.0',2,'[{\"changed\": {\"fields\": [\"Price\"]}}]',8,1),(27,'2022-04-20 04:58:46.938874','3','3 - Apple MacBook Air (2020) M1 Chip, 13.3-inch, 8GB, 256GB SSD - 23990000.0',2,'[{\"changed\": {\"fields\": [\"Price\"]}}]',8,1),(28,'2022-04-20 04:59:08.828187','2','2 - Apple MacBook Pro (2020) M1 Chip, 13.3 inch, 8GB, 512GB SSD - 30100000.0',2,'[{\"changed\": {\"fields\": [\"Price\"]}}]',8,1),(29,'2022-04-20 05:06:24.419604','7','7 - Macbook Pro 14 inch M1 Pro 2021 512Gb 8-Core - MKGP3/MKGR3 - 50700000.0',1,'[{\"added\": {}}]',8,1),(30,'2022-04-20 05:07:54.907452','8','8 - Macbook Pro 16 inch M1 Pro 2021 512Gb 10-Core - MK183 / MK1E3 - 70990000.0',1,'[{\"added\": {}}]',8,1),(31,'2022-04-20 05:09:02.701925','6','6 - Macbook Pro 14 inch M1 Pro 2021 512Gb 8-Core - MKGP3/MKGR3',1,'[{\"added\": {}}]',11,1),(32,'2022-04-20 05:09:10.070703','7','7 - Macbook Pro 16 inch M1 Pro 2021 512Gb 10-Core - MK183 / MK1E3',1,'[{\"added\": {}}]',11,1),(33,'2022-04-20 05:12:54.794549','9','9 - MacBook Pro 15 inch 2019 512GB - MV912 / MV932 - 41200000.0',1,'[{\"added\": {}}]',8,1),(34,'2022-04-20 05:13:14.203470','8','8 - MacBook Pro 15 inch 2019 512GB - MV912 / MV932',1,'[{\"added\": {}}]',11,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(13,'ecommerce','author'),(14,'ecommerce','book'),(7,'ecommerce','category'),(8,'ecommerce','item'),(11,'ecommerce','laptop'),(9,'ecommerce','producer'),(12,'ecommerce','publisher'),(10,'ecommerce','user'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2022-04-19 08:03:00.750259'),(2,'auth','0001_initial','2022-04-19 08:03:03.439303'),(3,'admin','0001_initial','2022-04-19 08:03:04.017319'),(4,'admin','0002_logentry_remove_auto_add','2022-04-19 08:03:04.423415'),(5,'admin','0003_logentry_add_action_flag_choices','2022-04-19 08:03:04.509243'),(6,'contenttypes','0002_remove_content_type_name','2022-04-19 08:03:05.050928'),(7,'auth','0002_alter_permission_name_max_length','2022-04-19 08:03:05.329418'),(8,'auth','0003_alter_user_email_max_length','2022-04-19 08:03:05.406126'),(9,'auth','0004_alter_user_username_opts','2022-04-19 08:03:05.429919'),(10,'auth','0005_alter_user_last_login_null','2022-04-19 08:03:05.645828'),(11,'auth','0006_require_contenttypes_0002','2022-04-19 08:03:05.665733'),(12,'auth','0007_alter_validators_add_error_messages','2022-04-19 08:03:05.709076'),(13,'auth','0008_alter_user_username_max_length','2022-04-19 08:03:05.961751'),(14,'auth','0009_alter_user_last_name_max_length','2022-04-19 08:03:06.216299'),(15,'auth','0010_alter_group_name_max_length','2022-04-19 08:03:06.309399'),(16,'auth','0011_update_proxy_permissions','2022-04-19 08:03:06.350598'),(17,'auth','0012_alter_user_first_name_max_length','2022-04-19 08:03:06.628819'),(18,'ecommerce','0001_initial','2022-04-19 08:03:07.776445'),(19,'sessions','0001_initial','2022-04-19 08:03:07.941513'),(20,'ecommerce','0002_item_quantity_item_title','2022-04-19 13:54:15.042716'),(21,'ecommerce','0003_author_publisher_book','2022-04-19 13:56:23.727543'),(22,'ecommerce','0004_book_category','2022-04-19 14:01:03.375916'),(23,'ecommerce','0005_remove_item_title_alter_item_description','2022-04-19 16:02:08.275038');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('2t0k2vwbg9sp377vmxy0ak6r77fhfpaf','.eJxVjMsOgjAQRf-la9OIQGfq0j3fQOaFRU1JKKyM_y4kLHR7zrn37Xpal9SvxeZ-VHd1lTv9MiZ5Wt6FPijfJy9TXuaR_Z74wxbfTWqv29H-HSQqaVszmABGEWkiI3KFA4RoNbYsETRoowYV2lBbIAJGFjuTtIE2dlFwny8MrzlQ:1ngis0:NhkKJMCt4FUsV8EGHOEBRU6kx2fEaR-ZGNJpU3-75FM','2022-05-03 08:05:56.709935'),('381qzryklura1hwnl3u5d6ffvf5zhf94','.eJxVjMsOgjAQRf-la9OIQGfq0j3fQOaFRU1JKKyM_y4kLHR7zrn37Xpal9SvxeZ-VHd1lTv9MiZ5Wt6FPijfJy9TXuaR_Z74wxbfTWqv29H-HSQqaVszmABGEWkiI3KFA4RoNbYsETRoowYV2lBbIAJGFjuTtIE2dlFwny8MrzlQ:1ngqCn:FCNrAApEuVVCE8DEEEFXMewKdjYGsvHc_HNGy4D8JvA','2022-05-03 15:55:53.297264');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ecommerce_author`
--

DROP TABLE IF EXISTS `ecommerce_author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ecommerce_author` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(256) NOT NULL,
  `description` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ecommerce_author`
--

LOCK TABLES `ecommerce_author` WRITE;
/*!40000 ALTER TABLE `ecommerce_author` DISABLE KEYS */;
/*!40000 ALTER TABLE `ecommerce_author` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ecommerce_book`
--

DROP TABLE IF EXISTS `ecommerce_book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ecommerce_book` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `page` int NOT NULL,
  `language` varchar(3) NOT NULL,
  `title` varchar(512) NOT NULL,
  `author_id` bigint NOT NULL,
  `item_id` bigint NOT NULL,
  `publisher_id` bigint NOT NULL,
  `category_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ecommerce_book_author_id_7e675390_fk_ecommerce_author_id` (`author_id`),
  KEY `ecommerce_book_item_id_25cf1ebd_fk_ecommerce_item_id` (`item_id`),
  KEY `ecommerce_book_publisher_id_513544ef_fk_ecommerce_publisher_id` (`publisher_id`),
  KEY `ecommerce_book_category_id_371028bc_fk_ecommerce_category_id` (`category_id`),
  CONSTRAINT `ecommerce_book_author_id_7e675390_fk_ecommerce_author_id` FOREIGN KEY (`author_id`) REFERENCES `ecommerce_author` (`id`),
  CONSTRAINT `ecommerce_book_category_id_371028bc_fk_ecommerce_category_id` FOREIGN KEY (`category_id`) REFERENCES `ecommerce_category` (`id`),
  CONSTRAINT `ecommerce_book_item_id_25cf1ebd_fk_ecommerce_item_id` FOREIGN KEY (`item_id`) REFERENCES `ecommerce_item` (`id`),
  CONSTRAINT `ecommerce_book_publisher_id_513544ef_fk_ecommerce_publisher_id` FOREIGN KEY (`publisher_id`) REFERENCES `ecommerce_publisher` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ecommerce_book`
--

LOCK TABLES `ecommerce_book` WRITE;
/*!40000 ALTER TABLE `ecommerce_book` DISABLE KEYS */;
/*!40000 ALTER TABLE `ecommerce_book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ecommerce_category`
--

DROP TABLE IF EXISTS `ecommerce_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ecommerce_category` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code` varchar(128) NOT NULL,
  `name` varchar(512) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ecommerce_category`
--

LOCK TABLES `ecommerce_category` WRITE;
/*!40000 ALTER TABLE `ecommerce_category` DISABLE KEYS */;
INSERT INTO `ecommerce_category` VALUES (1,'laptop','Máy tính xách tay'),(2,'book','Sách'),(3,'history','Lịch sử'),(4,'commics','Truyện tranh'),(5,'business','Kinh doanh'),(6,'biographies','Tiểu sử');
/*!40000 ALTER TABLE `ecommerce_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ecommerce_item`
--

DROP TABLE IF EXISTS `ecommerce_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ecommerce_item` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(512) NOT NULL,
  `description` longtext NOT NULL,
  `price` double NOT NULL,
  `discount` double NOT NULL,
  `image` varchar(100) NOT NULL,
  `category_id` bigint NOT NULL,
  `quantity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ecommerce_item_category_id_af0340c7_fk_ecommerce_category_id` (`category_id`),
  CONSTRAINT `ecommerce_item_category_id_af0340c7_fk_ecommerce_category_id` FOREIGN KEY (`category_id`) REFERENCES `ecommerce_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ecommerce_item`
--

LOCK TABLES `ecommerce_item` WRITE;
/*!40000 ALTER TABLE `ecommerce_item` DISABLE KEYS */;
INSERT INTO `ecommerce_item` VALUES (2,'Apple MacBook Pro (2020) M1 Chip, 13.3 inch, 8GB, 512GB SSD','Chip Apple M1 định nghĩa lại MacBook Pro 13 inch. Sở hữu CPU 8 lõi xử lý siêu tốc các luồng công việc phức tạp về hình ảnh, mã hóa, biên tập video cùng nhiều việc khác. GPU 8 lõi siêu mạnh xử lý gọn các tác vụ đồ họa khủng và chạy game siêu mượt. Neural Engine 16 lõi tiên tiến tăng cường sức mạnh công nghệ máy học tích hợp trong các ứng dụng yêu thích của bạn. Bộ nhớ thống nhất siêu nhanh cho mọi hoạt động mượt mà. Và thời lượng pin dài nhất từng có trên máy Mac, lên đến 20 giờ. (2) Đây chính là chiếc máy tính xách tay chuyên nghiệp thịnh hành nhất của Apple. Hiệu năng cao hơn hẳn, pro hơn hẳn. \r\n\r\nTính năng nổi bật \r\n•        Chip M1 do Apple thiết kế tạo ra một cú nhảy vọt về hiệu năng máy học, CPU và GPU \r\n•        Làm được nhiều việc hơn với thời lượng pin lên đến 20 giờ, thời lượng pin lâu nhất trong các dòng máy tính Mac từ trước đến nay (2) \r\n•        CPU 8 lõi cho hiệu năng nhanh hơn đến 2.8x, xử lý các luồng công việc nhanh hơn bao giờ hết (1) \r\n•        GPU 8 lõi với tốc độ xử lý đồ họa nhanh gấp 5x cho các ứng dụng và game có đồ họa khủng (1) \r\n•        Neural Engine 16 lõi cho công nghệ máy học hiện đại \r\n•        Bộ nhớ thống nhất 8GB giúp bạn làm việc gì cũng nhanh chóng và trôi chảy \r\n•        Ổ lưu trữ SSD siêu nhanh giúp mở các ứng dụng và tập tin chỉ trong tích tắc \r\n•        Hệ thống tản nhiệt chủ động mang lại hiệu năng tuyệt vời \r\n•        Màn hình Retina với độ sáng 500 nit cho màu sắc sống động và chi tiết ấn tượng (3) \r\n•        Camera FaceTime HD với bộ xử lý tín hiệu hình ảnh tiên tiến cho các cuộc gọi video đẹp hình, rõ tiếng hơn \r\n•        Ba micro phối hợp chuẩn studio thu giọng nói của bạn rõ hơn \r\n•        Wi-Fi 6 thế hệ mới giúp kết nối nhanh hơn \r\n•        Hai cổng Thunderbolt / USB 4 để sạc và kết nối phụ kiện \r\n•        Bàn phím Magic Keyboard có đèn nền và Touch ID giúp mở khóa và thanh toán an toàn hơn \r\n•        macOS Big Sur với thiết kế mới đầy táo bạo cùng nhiều cập nhật quan trọng cho các ứng dụng Safari, Messages và Maps \r\n•        Hiện có màu xám bạc và bạc  \r\n\r\nPháp lý \r\nHiện có sẵn các lựa chọn để nâng cấp. \r\n(1) So với thế hệ máy trước. \r\n(2) Thời lượng pin khác nhau tùy theo cách sử dụng và cấu hình. Truy cập apple.com/batteries để biết thêm thông tin. \r\n(3) Kích thước màn hình tính theo đường chéo.\r\n\r\nThông tin bảo hành:\r\nBảo hành: 12 tháng kể từ ngày kích hoạt sản phẩm.\r\nKích hoạt bảo hành tại: https://checkcoverage.apple.com/vn/en/\r\n\r\nHướng dẫn kiểm tra địa điểm bảo hành gần nhất:\r\nBước 1: Truy cập vào đường link https://getsupport.apple.com/?caller=grl&locale=en_VN \r\nBước 2: Chọn sản phẩm.\r\nBước 3: Điền Apple ID, nhập mật khẩu.\r\nSau khi hoàn tất, hệ thống sẽ gợi ý những trung tâm bảo hành gần nhất.\r\nSilver: MYDC2SA/A\r\nSpace Gray: MYD92SA/A',30100000,20,'uploads/images/pro-gray-m1-1400x1060.jpg',1,15),(3,'Apple MacBook Air (2020) M1 Chip, 13.3-inch, 8GB, 256GB SSD','Máy tính xách tay mỏng và nhẹ nhất của Apple, nay siêu mạnh mẽ với chip Apple M1. Xử lý công việc giúp bạn với CPU 8 lõi nhanh như chớp. Đưa các ứng dụng và game có đồ họa khủng lên một tầm cao mới với GPU 7 lõi. Đồng thời, tăng tốc các tác vụ máy học với Neural Engine 16 lõi. Tất cả gói gọn trong một thiết kế không quạt, giảm thiểu tiếng ồn, thời lượng pin dài nhất từ trước đến nay lên đến 18 giờ (1) MacBook Air. Vẫn cực kỳ cơ động. Mà mạnh mẽ hơn nhiều.\r\n \r\nTính năng nổi bật \r\n•       Chip M1 do Apple thiết kế tạo ra một cú nhảy vọt về hiệu năng máy học, CPU và GPU \r\n•       Tăng thời gian sử dụng với thời lượng pin lên đến 18 giờ (1) \r\n•       CPU 8 lõi cho tốc độ nhanh hơn đến 3.5x, xử lý công việc nhanh chóng hơn bao giờ hết (2)  \r\n•       GPU lên đến 7 lõi với tốc độ xử lý đồ họa nhanh hơn đến 5x cho các ứng dụng và game đồ họa khủng (2)  \r\n•       Neural Engine 16 lõi cho công nghệ máy học hiện đại \r\n•       Bộ nhớ thống nhất 8GB giúp bạn làm việc gì cũng nhanh chóng và trôi chảy  \r\n•       Ổ lưu trữ SSD siêu nhanh giúp mở các ứng dụng và tập tin chỉ trong tích tắc \r\n•       Thiết kế không quạt giảm tối đa tiếng ồn khi sử dụng  \r\n•       Màn hình Retina 13.3 inch với dải màu rộng P3 cho hình ảnh sống động và chi tiết ấn tượng (3)\r\n•       Camera FaceTime HD với bộ xử lý tín hiệu hình ảnh tiên tiến cho các cuộc gọi video đẹp hình, rõ tiếng hơn \r\n•       Bộ ba micro phối hợp tập trung thu giọng nói của bạn, không thu tạp âm môi trường \r\n•       Wi-Fi 6 thế hệ mới giúp kết nối nhanh hơn \r\n•       Hai cổng Thunderbolt / USB 4 để sạc và kết nối phụ kiện \r\n•       Bàn phím Magic Keyboard có đèn nền và Touch ID giúp mở khóa và thanh toán an toàn hơn \r\n•       macOS Big Sur với thiết kế mới đầy táo bạo cùng nhiều cập nhật quan trọng cho các ứng dụng Safari, Messages và Maps \r\n•       Hiện có màu vàng kim, xám bạc và bạc \r\n\r\nPháp lý \r\nHiện có sẵn các lựa chọn để nâng cấp. \r\n(1) Thời lượng pin khác nhau tùy theo cách sử dụng và cấu hình. Truy cập apple.com/batteries để biết thêm thông tin. \r\n(2) So với thế hệ máy trước. \r\n(3) Kích thước màn hình tính theo đường chéo. \r\n\r\nThông tin bảo hành:\r\nBảo hành: 12 tháng kể từ ngày kích hoạt sản phẩm',23990000,18,'uploads/images/Air-gray-m1-1400x1060.jpg',1,20),(4,'MacBook Air M1 13 inch 2020 512GB - MGN73 / MGNA3 / MGNE3','Máy tính xách tay mỏng và nhẹ nhất của Apple, nay siêu mạnh mẽ với chip Apple M1. Xử lý công việc giúp bạn với CPU 8 lõi nhanh như chớp. Đưa các ứng dụng và game có đồ họa khủng lên một tầm cao mới với GPU 7 lõi. Đồng thời, tăng tốc các tác vụ máy học với Neural Engine 16 lõi. Tất cả gói gọn trong một thiết kế không quạt, giảm thiểu tiếng ồn, thời lượng pin dài nhất từ trước đến nay lên đến 18 giờ (1) MacBook Air. Vẫn cực kỳ cơ động. Mà mạnh mẽ hơn nhiều.\r\n \r\nTính năng nổi bật \r\n•       Chip M1 do Apple thiết kế tạo ra một cú nhảy vọt về hiệu năng máy học, CPU và GPU \r\n•       Tăng thời gian sử dụng với thời lượng pin lên đến 18 giờ (1) \r\n•       CPU 8 lõi cho tốc độ nhanh hơn đến 3.5x, xử lý công việc nhanh chóng hơn bao giờ hết (2)  \r\n•       GPU lên đến 7 lõi với tốc độ xử lý đồ họa nhanh hơn đến 5x cho các ứng dụng và game đồ họa khủng (2)  \r\n•       Neural Engine 16 lõi cho công nghệ máy học hiện đại \r\n•       Bộ nhớ thống nhất 8GB giúp bạn làm việc gì cũng nhanh chóng và trôi chảy  \r\n•       Ổ lưu trữ SSD siêu nhanh giúp mở các ứng dụng và tập tin chỉ trong tích tắc \r\n•       Thiết kế không quạt giảm tối đa tiếng ồn khi sử dụng  \r\n•       Màn hình Retina 13.3 inch với dải màu rộng P3 cho hình ảnh sống động và chi tiết ấn tượng (3)\r\n•       Camera FaceTime HD với bộ xử lý tín hiệu hình ảnh tiên tiến cho các cuộc gọi video đẹp hình, rõ tiếng hơn \r\n•       Bộ ba micro phối hợp tập trung thu giọng nói của bạn, không thu tạp âm môi trường \r\n•       Wi-Fi 6 thế hệ mới giúp kết nối nhanh hơn \r\n•       Hai cổng Thunderbolt / USB 4 để sạc và kết nối phụ kiện \r\n•       Bàn phím Magic Keyboard có đèn nền và Touch ID giúp mở khóa và thanh toán an toàn hơn \r\n•       macOS Big Sur với thiết kế mới đầy táo bạo cùng nhiều cập nhật quan trọng cho các ứng dụng Safari, Messages và Maps \r\n•       Hiện có màu vàng kim, xám bạc và bạc \r\n\r\nPháp lý \r\nHiện có sẵn các lựa chọn để nâng cấp. \r\n(1) Thời lượng pin khác nhau tùy theo cách sử dụng và cấu hình. Truy cập apple.com/batteries để biết thêm thông tin. \r\n(2) So với thế hệ máy trước. \r\n(3) Kích thước màn hình tính theo đường chéo. \r\n\r\nThông tin bảo hành:\r\nBảo hành: 12 tháng kể từ ngày kích hoạt sản phẩm',29990000,0,'uploads/images/Air-gray-m1-1400x1060_ek3K0TX.jpg',1,50),(5,'MacBook Pro 16 inch 2019 1TB - MVVK2 / MVVM2','Tổng quan:\r\n\r\nDiện tích làm việc lớn hơn đáng kể do kích thước màn hình lớn hơn và độ phân giải hiển thị mặc định cao hơn\r\nBàn phím nổi hơn, thô hơn, hành trình phím gõ dài hơn, cảm giác gõ bồng bềnh và feedback ở mức trung bình\r\nTổng thể kích thước không to hơn nhiều so với MacBook 15\" cũ. Apple chọn giải pháp tăng kích thước làm việc và giữ nguyên kích thước tổng thể, thay vì giảm tổng thể và giữ nguyên kích thước làm việc như hầu hết các máy Windows viền mỏng khác.\r\nViền mỏng hơn không mang lại ấn tượng mạnh vì các cạnh trên và dưới vẫn dày, nếu so với các máy tính viền mỏng khác thì không có gì mới mẻ.\r\nKích thước và màn hình:\r\nCầm nó trên tay, bỏ vào balo, túi... sự thay đổi là gần như không thấy được. Tuy nhiên chúng ta lại có một không gian làm việc lớn hơn nhiều. Lớn hơn không chỉ bởi vì màn hình có kích thước lớn hơn (16\" so với 15\"4 trên màn hình tỉ lệ 16:10) mà còn vì độ phân giải hiển thị mặc định lớn hơn (1782x1120 so với 1650x1050). Những anh em từng dùng MacBook 17\" trước đây đã phải đợi bao nhiêu năm rồi, cuối cùng Apple cũng đã mang lại dòng máy màn hình lớn này.\r\nVà với anh em hiện đang dùng MacBook Pro 15\" một cách nghiêm túc thì sau này công việc đó sẽ được làm trên một chiếc máy lớn hơn. Apple cũng sẽ dừng không làm bản 15\" nữa. Không chỉ làm media như hình hay phim mới thấy ngon, mà với anh em thích làm việc với nhiều cửa sổ cùng lúc trên một màn hình cũng được hưởng lợi nhiều từ việc này.\r\n\r\nBàn phím và sự thay đổi:\r\nBàn phím mới thô hơn, hành trình dài hơn, cảm giác gõ bồng bềnh và phản hồi có phần kém hơn. Tuy nhiên đó mới chỉ là cảm giác nhanh của mình. Có thể khi trải nghiệm nhiều hơn thì nó sẽ khác. Bàn phím cánh bướm trước đây theo đánh giá của mình thì hành trình ngắn hơn, phản hồi tốt hơn, chắc chắn hơn. Tuy nhiên có quá nhiều anh em gặp rắc rối với nó, nên không chỉ anh em gặp phiền hà mà Apple cũng tốn kém không ít để sửa chữa, thay thế cho anh em.\r\nHầu hết mọi người nói là Apple thấy bàn phím cánh bướm lỗi nhiều quá nên phải chuyển qua bàn phím mới này (phiên bản mỏng hơn của MacBook đời từ 2012 đến 2016). Tuy nhiên theo quan sát của mình thì Apple dùng bàn phím bướm từ năm 2016, và những rắc rối cũng có từ thời đó. Nghĩa là bàn phím bướm đã hơn 4 tuổi rồi, nên việc ra mẫu máy mới với bàn phím kiểu mới cũng không phải là lạ. Có thể bàn phím được thay đổi theo lịch trình chứ không phải vì người ta gặp nhiều khó khăn với nó.\r\n\r\nGiá cả và cấu hình:\r\nGiá của MacBook Pro 16\" không thay đổi so với năm ngoái cho cấu hình cơ bản nhất. Và các lựa chọn cấu hình năm nay cũng có phần dễ chịu hơn. Năm ngoái để chọn cấu hình cao nhất (i9, 32GB RAM, SSD 4TB) thì anh em phải bỏ ra 6700$, trong khi năm nay chỉ cần 6100$ là anh em có thể chọn cấu hình cao nhất (i9, 64GB RAM và SSD 8TB).',45000000,0,'uploads/images/16tt-1400x1060.jpg',1,50),(6,'MacBook Pro 16 inch 2019 512GB - MVVJ2 / MVVL2','“Dành cho những người muốn phá bỏ những giới hạn và thay đổi thế giới, chiếc Macbook Pro này được xem là chiếc máy mạnh mẽ nhất mà chúng tôi từng tạo ra. Với màn hình Retina lên tới 16 inch, con chip tốc độ nhanh, hệ thống đồ hoạ và pin lớn nhất từ trước đến giờ, bàn phím Magic Keyboard cùng hệ thống lưu trữ lớn hơn bao giờ hết, chiếc Macbook này đích thực là một trợ thủ đắc lực cho những người dùng chuyên nghiệp.\"\r\nApple.\r\nKhông ngoa mà nói, chiếc Macbook 16 inch này chính là một chiếc máy mà rất nhiều người hằng mong đợi. Không có quá nhiều tính năng mới đột phá, Apple tập trung khắc phục những điểm yếu chết người mà người dùng phàn nàn về chiếc Macbook cũ: Bàn phím cánh bướm “chết người”, một viên pin lớn hơn mà vẫn được phép mang lên máy bay, màn hình rộng hơn…\r\nCải tiến đầu tiên:Màn hình 16 inch rộng lớn.\r\nMột trong những điểm nhấn đầu tiên trên chiếc Macbook Pro thế hệ mới này đó chính là về phần màn hình. Đối với một vài người dùng mới, họ chỉ quen thuộc với hai kích cỡ màn hình chính là 13 inch và 15 inch.\r\nNhưng trong quá khứ, Apple đã từng cho ra mắt dòng sản phẩm 17 inch. Song không hiểu vì lý do gì, Apple đã tạm ngừng ra mắt dòng sản phẩm màn hình lớn này từ năm 2011. Không ít người dùng đã cảm thấy tiếc nuối vì lý do có phần khó hiểu đến từ Apple.\r\n Khi Macbook Pro 16 inch ra mắt, nhiều người dùng đã cảm thấy hạnh phúc vì giấc mơ về một chiếc máy tính với màn hình lớn của họ đã thành hiện thực. Tuy không phải kích thước 17 inch như những dòng sản phẩm từ gần 10 năm về truớc, kích thước 16 inch của dòng Macbook mới này đã là đủ  Apple có thể tối ưu hoá trải nghiệm của người sử dụng.\r\n Rất nhiều người dùng đã nghĩ rằng, Apple sẽ cố gắng làm mỏng viền của chiếc Macbook Pro 15 inch để tạo ra một chiếc màn hình lớn hơn mà kích thước không đổi. Nhưng trên thực tế, sản phẩm này có khung to hơn khi đặt cạnh chiếc Macbook 15 inch.\r\nBên cạnh việc máy được nâng lên 16 inch, Độ phân giải cũng được nâng cấp lên 3072 X 1920 pixel. (So với 2560 X 1600 Pixel trên dòng sản phẩm 15 inch.) Chiếc máy vẫn được trang bị những công nghệ mới nhất như: Wide Color (P3), Công nghệ True Tone… \r\n\r\nCải tiến thứ hai: Viên Pin.\r\nLý do mà chiếc Macbook Pro 16 inch này dày hơn rõ rệt so với dòng Macbook Pro 15 inch cũ đến từ viên pin.\r\n  Trên dòng sản phẩm 16 inch , Apple đã trang bị viên pin có thời lượng sử dụng lên tới 11 tiếng và có thể ở chế độ chờ lên tới 30 ngày. \r\nBên cạnh đó, nếu bạn là một người thường xuyên phải đi công tác vì di chuyển bằng máy bay, chiếc Macbook Pro 16 inch chính là lựa chọn phù hợp của bạn. Ngoài việc sửa lại lỗi pin nghiêm trọng, chiếc Macbook này còn viên pin công suất là 100Wh. Đây chính là giới hạn lớn nhất về pin cho một thiết bị có thể được mang lên máy bay. Điều này khiến nhiều người dùng khá bất ngờ vì Apple hiếm nào lại hào phóng với người dùng đến như vậy.',33000000,31,'uploads/images/16t-1400x1060_2.jpg',1,40),(7,'Macbook Pro 14 inch M1 Pro 2021 512Gb 8-Core - MKGP3/MKGR3','Đánh giá tổng quan Macbook Pro M1 14 inch 2021 512Gb 8-Core\r\nMacbook Pro M1 14 inch 2021 là bản nâng cấp hoàn chỉnh kế thừa của những tinh hoa tốt nhất của dòng Macbook. Và được đánh giá là một cỗ máy mạnh nhất trong thời điểm hiện tại trong việc xử lý tối ưu công việc hiệu quả. Hãy cùng HNMAC điểm qua một số cải tiến về thiết kế và hiệu năng qua bài viết dưới đây nhé!\r\n\r\nThiết kế từ nhược điểm thành ưu điểm\r\nKhông còn nhẹ, không còn mỏng như những chiếc Macbook Pro trước. MacBook Pro M1 14 inch có thiết kế mang hơi hướng của 1 chiếc laptop workstation. Từ 1,4kg trên phiên bản Macbook Pro trước đó, chiếc Macbook Pro 14 inch này có trọng lượng 1,6kg nhưng vẫn thuộc loại nhẹ so với những chiếc workstation từ các hãng công nghệ khác.\r\n\r\nTại sao việc tăng trọng lượng và thay đổi thiết kế lại là ưu điểm chứ không phải nhược điểm của chiếc Macbook Pro M1 14 inch? Đơn giản đó là vì màn hình rộng rãi và chắc chắn hơn phiên bản macbook Pro 13 inch, giúp trải nghiệm ngon lành hơn và bền bỉ hơn. Và các góc cạnh được bo tròn, an toàn với da tay và hạn chế sứt mẻ như thiết kế của các phiên bản Pro cũ. Ngoài ra vì dày hơn, nên có chỗ để đặt nhiều cổng kết nối hơn và đặc biệt là sự trở lại của chiếc sạc Magsafe vô cùng an toàn.\r\nMàn hình XDR Liquid Retina siêu nét với màu sắc chính xác đến từng milimet \r\nSở hữu màn hình XDR Liquid Retina khiến chất lượng màu hiển thị trên Macbook Pro M1 14 inch rất đẹp, nhất là hiển thị màu đen sâu thăm thẳm rất đã con mắt. Nếu làm đồ hoạ hay thích xem phim thì đây là chiếc máy sở hữu tập hợp của những công nghệ đầu bảng trong lĩnh vực màn hình hiện nay. Sở hữu màn hình với độ phân giải siêu cao 3024 x 1964 pixels cho ra mật độ điểm ảnh là 254 ppi sắc nét đến từng điểm ảnh. \r\n\r\nMàn hình với tần số quét 120 Hz giúp mọi thứ trở nên mượt mà hơn bao giờ hết từ lướt web đến chơi những game nặng đô với đồ họa khủng. Màn hình trên chiếc Macbook Pro M1 14 inch này cũng tích hợp công nghệ tự động điều chỉnh tần số quét trên màn hình để phù hợp với nội dung bạn sử dụng, đem lại hình ảnh mượt mà hơn mà lại tiết kiệm điện năng.\r\nHiệu năng mạnh mẽ, xử lý tác vụ vượt mà\r\nVới cấu hình tối thiểu 16GB ram và sở hữu chip M1 Pro hoặc chip M1 Max, lại còn chưa có một model mới nào cạnh tranh, thì đây chính là chiếc Macbook khoẻ và tốt nhất dòng Macbook Pro. Nếu như Macbook từ trước xử lý đồ hoạ tốt thế nào, được yêu thích thế nào thì trên Macbook Pro M1 14 inch còn tốt hơn thế nữa.\r\n\r\nMacbook Pro 14 inch M1 sở hữu ổ cứng SSD 512GB cung cấp không gian lưu trữ vừa đủ để bạn lưu trữ thông tin về máy với tốc độ đọc ghi nhanh chóng, tăng tốc cho máy và giúp rút ngắn thời gian khởi động máy và mở các ứng dụng nhanh chóng.\r\n\r\nPin và nhiệt độ\r\nHệ thống tản nhiệt chính với cấu trúc quạt ở bên trong kết hợp với bảng mạch chủ thiết kế tạo không gian thoát nhiệt tốt hơn. Chiếc Macbook Pro M1 14 inch xứng đáng với danh hiệu cool boy cool girl vì quá lạnh lùng, không nóng, tác vụ nhanh như cách bạn tiêu hết lương tháng.\r\n\r\nCòn về pin, tất nhiên là sẽ trâu hơn một chút so với phiên bản tiền nhiệm, còn hỗ trợ sạc nhanh nữa. Macbook Pro 14 inch cho thời gian phát video lên tới 17 giờ và lướt web lên tới 11 giờ. Bạn có thể thoải mái sử dụng trong thời gian dài mà không cần quan tâm tới thời lượng pin',50700000,0,'uploads/images/photo_2021-10-19_11-20-19-1400x1060.jpg',1,50),(8,'Macbook Pro 16 inch M1 Pro 2021 512Gb 10-Core - MK183 / MK1E3','MacBook Pro (16 inch) mới mang đến hiệu năng cao ấn tượng cho người dùng pro. Lựa chọn M1 Pro mạnh mẽ hay M1 Max còn mạnh hơn thế để tăng tốc xử lý các luồng công việc đẳng cấp pro cùng thời lượng pin đáng kinh ngạc. Với màn hình Liquid Retina XDR 16 inch sống động và nhiều cổng kết nối chuyên nghiệp, bạn có thể làm\r\nđược nhiều việc hơn bao giờ hết với MacBook Pro.\r\n\r\n• Chip M1 Max hoặc M1 Pro do Apple thiết kế tạo ra một cú nhảy vọt về hiệu năng máy học, CPU và GPU \r\n• CPU lên đến 10 lõi cho hiệu năng nhanh hơn đến 2x, xử lý các luồng công việc chuyên nghiệp nhanh hơn bao giờ hết\r\n• GPU lên đến 32 lõi với tốc độ xử lý đồ họa nhanh hơn đến 4x cho các ứng dụng và game có đồ họa khủng\r\n• Neural Engine 16 lõi cho hiệu năng máy học nhanh hơn đến 5x\r\n• Thời lượng pin lâu hơn, lên đến 21 giờ\r\n• Bộ nhớ thống nhất lên đến 64GB giúp bạn làm việc gì cũng nhanh chóng và trôi chảy\r\n• Ổ lưu trữ SSD siêu nhanh lên đến 8TB giúp mở các ứng dụng và tập tin chỉ trong tích tắc\r\n• Màn hình Liquid Retina XDR 16 inch sắc nét với Extreme Dynamic Range và tỷ lệ tương phản cực cao\r\n• Camera FaceTime HD 1080p với bộ xử lý tín hiệu hình ảnh tiên tiến cho các cuộc gọi video sắc nét hơn\r\n• Hệ thống âm thanh 6 loa với loa trầm khử lực\r\n• Ba micro phối hợp chuẩn studio thu giọng nói của bạn rõ hơn\r\n• Ba cổng Thunderbolt 4, cổng HDMI, khe thẻ nhớ SDXC, jack cắm tai nghe, cổng MagSafe 3\r\n• Wi-Fi 6 thế hệ mới giúp kết nối nhanh hơn\r\n• Bàn phím Magic Keyboard có đèn nền và Touch ID giúp mở khóa và thanh toán an toàn hơn\r\n• macOS Monterey cho phép bạn kết nối, chia sẻ và sáng tạo hơn bao giờ hết, với các bản cập nhật FaceTime\r\nmới đầy thú vị và Safari đã được thiết kế lại\r\n• Hiện có màu xám bạc và bạc',70990000,0,'uploads/images/photo_2021-10-19_12-21-37-1400x1060.jpg',1,50),(9,'MacBook Pro 15 inch 2019 512GB - MV912 / MV932','MacBook Pro 2019 có những thay đổi không lớn, nhưng phản ánh những thay đổi lớn và lâu dài hơn của Apple khi nói về máy Mac.\r\n\r\n- CPU thế hệ thứ 9 mới nhất của Intel cho hiệu năng rất tốt nếu so với các thế hệ cũ. Truớc đây Apple thường không đu theo chip mới nhất nhưng họ đã thay đổi điều này từ năm ngoái. Con cấu hình cao cấp này dùng CPU Intel Core  i9-9980HK. Ram 32Gb, SSD 512GB. Tuỳ các phiên bản cấu hình sẽ khác nhau\r\n\r\n- Bàn phím thêm một lớp chặn bụi đi xuống duới. Cảm giác gõ thấy êm hơn nhưng phản ứng có vẻ không tốt bằng đời trước. (sẽ báo cáo sau khi sử dụng kỹ hơn).\r\n\r\n- VGA mới AMD Radeon Pro 560X với 4GB VRAM\r\n1. Về thiết kế\r\nĐây là năm thứ 4 cũng như đời máy thứ 4 Apple sử dụng chung một thiết kế. Trên máy cũng chỉ có 4 cổng kết nối chuẩn thunderbolt 3 (giao tiếp USB-C). Người dùng đã gần như quen với thiết kế và các cổng kết nối này được lặp lại đến điểm không còn nghĩ nhiều về nó khi mua máy. Dĩ nhiên là thiết kế này so với phần còn lại của thế giới laptop vẫn rất khác biệt, rất đẹp và đẳng cấp. Mức độ hoàn thiện cũng không có gì thay đổi, mọi thứ vẫn rất sắc xảo, rõ ràng và sạch sẽ.\r\n2. Về sức mạnh phần cứng\r\n Apple từ năm ngoái bắt đầu dùng những chiếc CPU mới nhất của Intel giống kiểu như tham gia vào cuộc chạy đua cấu hình thay vì từ từ một mình một thế giới như trước đây. Tức là họ cũng dùng những chiếc CPU loại mà Intel làm ra cho thị trường chung chứ không phải chỉ riêng cho Apple như trước đây. Do đó Macbook này mình trên tay cũng dùng CPU mới nhất của Intel là chiếc Core i9 thế hệ thứ 9 mã 9980HK\r\nVới SSD tốc độ cao, CPU tốt, VGA khá và nếu dùng thêm phần mềm Final Cut hay iMovie thì những chiếc Macbook Pro 2019 chắc chắn thoả mãn tốt yêu cầu dựng phim, chỉnh sửa hình ảnh hay xử lý nhạc của anh em.\r\nBàn phím với cấu trúc mới do Apple đưa ra gọi là Butterfly giúp cho máy mỏng hơn đáng kể, cảm giác gõ tốt với hành trình phím cực ngắn. Tuy nhiên trong suốt từ năm 2016 đến nay thì các sự cố của bàn phím luôn ám ảnh người dùng Macbook và Apple.\r\n\r\nỞ chiếc Macbook Pro 2019 này thì Apple tiếp tục nâng cấp bàn phím để cho nó trở nên ổn định hơn. Trong các video gỡ bên trong ra xem thì người ta thấy Apple thay đổi vật liệu làm tấm nẩy dưới bàn phím cũng như trang bị thêm lớp cao su mỏng giúp ngăn bụi đi vào bàn phím. Theo kinh nghiệm mình biết thì bụi là một trong những nguyên nhân dẫn đến bàn phím Macbook Pro bị hư.\r\nTrackpad thì vẫn tuyệt vời, chúng ta vẫn có một bàn rê rất lớn, cảm ứng đa điểm, nhận dạng thông minh (không nhận các lần chạm vô ý dẫn đến việc con chuột chạy lung tung) và có forcetouch bên dưới giúp phản hồi lại các lần bấm nhẹ và nặng rất chính xác.\r\nKết\r\n Macbook Pro 2019 không có thay đổi về ngoại hình, phần cứng thì nâng cấp theo chu kỳ phát triển của công nghệ. Không thay đổi đột phá so với Macbook 2018. Anh em cần mua thì cứ mua, anh em đang xài các đời 2017, 2018 không cần lắm thì vẫn xài máy cũ và đợi bản nâng cấp đột phá hơn có thể là cuối năm nay.',41200000,0,'uploads/images/15d1-1400x1060.jpg',1,50);
/*!40000 ALTER TABLE `ecommerce_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ecommerce_laptop`
--

DROP TABLE IF EXISTS `ecommerce_laptop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ecommerce_laptop` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `year_model` int NOT NULL,
  `item_id` bigint NOT NULL,
  `producer_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ecommerce_laptop_item_id_fe796588_fk_ecommerce_item_id` (`item_id`),
  KEY `ecommerce_laptop_producer_id_b8e64db7_fk_ecommerce_producer_id` (`producer_id`),
  CONSTRAINT `ecommerce_laptop_item_id_fe796588_fk_ecommerce_item_id` FOREIGN KEY (`item_id`) REFERENCES `ecommerce_item` (`id`),
  CONSTRAINT `ecommerce_laptop_producer_id_b8e64db7_fk_ecommerce_producer_id` FOREIGN KEY (`producer_id`) REFERENCES `ecommerce_producer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ecommerce_laptop`
--

LOCK TABLES `ecommerce_laptop` WRITE;
/*!40000 ALTER TABLE `ecommerce_laptop` DISABLE KEYS */;
INSERT INTO `ecommerce_laptop` VALUES (1,2020,2,1),(2,2020,3,1),(3,2020,4,1),(4,2019,5,1),(5,2019,6,1),(6,2021,7,1),(7,2021,8,1),(8,2019,9,1);
/*!40000 ALTER TABLE `ecommerce_laptop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ecommerce_producer`
--

DROP TABLE IF EXISTS `ecommerce_producer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ecommerce_producer` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `code` varchar(128) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ecommerce_producer`
--

LOCK TABLES `ecommerce_producer` WRITE;
/*!40000 ALTER TABLE `ecommerce_producer` DISABLE KEYS */;
INSERT INTO `ecommerce_producer` VALUES (1,'Apple','Apple');
/*!40000 ALTER TABLE `ecommerce_producer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ecommerce_publisher`
--

DROP TABLE IF EXISTS `ecommerce_publisher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ecommerce_publisher` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(512) NOT NULL,
  `address` varchar(512) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ecommerce_publisher`
--

LOCK TABLES `ecommerce_publisher` WRITE;
/*!40000 ALTER TABLE `ecommerce_publisher` DISABLE KEYS */;
/*!40000 ALTER TABLE `ecommerce_publisher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ecommerce_user`
--

DROP TABLE IF EXISTS `ecommerce_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ecommerce_user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(512) NOT NULL,
  `email` varchar(128) NOT NULL,
  `phone` varchar(12) NOT NULL,
  `address` varchar(128) NOT NULL,
  `username` varchar(128) NOT NULL,
  `password` varchar(128) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ecommerce_user`
--

LOCK TABLES `ecommerce_user` WRITE;
/*!40000 ALTER TABLE `ecommerce_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `ecommerce_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-20 16:47:50
