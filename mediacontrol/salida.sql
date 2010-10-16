-- MySQL dump 10.13  Distrib 5.1.49, for debian-linux-gnu (i686)
--
-- Host: localhost    Database: rpnnicac_mediacontrol
-- ------------------------------------------------------
-- Server version	5.1.49-1ubuntu8

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_425ae3c4` (`group_id`),
  KEY `auth_group_permissions_1e014c8f` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_message`
--

DROP TABLE IF EXISTS `auth_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `message` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `auth_message_403f60f` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_message`
--

LOCK TABLES `auth_message` WRITE;
/*!40000 ALTER TABLE `auth_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  KEY `auth_permission_1bb8f392` (`content_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=49 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add permission',1,'add_permission'),(2,'Can change permission',1,'change_permission'),(3,'Can delete permission',1,'delete_permission'),(4,'Can add group',2,'add_group'),(5,'Can change group',2,'change_group'),(6,'Can delete group',2,'delete_group'),(7,'Can add user',3,'add_user'),(8,'Can change user',3,'change_user'),(9,'Can delete user',3,'delete_user'),(10,'Can add message',4,'add_message'),(11,'Can change message',4,'change_message'),(12,'Can delete message',4,'delete_message'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add site',7,'add_site'),(20,'Can change site',7,'change_site'),(21,'Can delete site',7,'delete_site'),(22,'Can add log entry',8,'add_logentry'),(23,'Can change log entry',8,'change_logentry'),(24,'Can delete log entry',8,'delete_logentry'),(25,'Can add Profesion',9,'add_profesion'),(26,'Can change Profesion',9,'change_profesion'),(27,'Can delete Profesion',9,'delete_profesion'),(28,'Can add Persona',10,'add_persona'),(29,'Can change Persona',10,'change_persona'),(30,'Can delete Persona',10,'delete_persona'),(31,'Can add Tipo',11,'add_tipo'),(32,'Can change Tipo',11,'change_tipo'),(33,'Can delete Tipo',11,'delete_tipo'),(34,'Can add Tematica',12,'add_tematica'),(35,'Can change Tematica',12,'change_tematica'),(36,'Can delete Tematica',12,'delete_tematica'),(37,'Can add Material',13,'add_material'),(38,'Can change Material',13,'change_material'),(39,'Can delete Material',13,'delete_material'),(40,'Can add Solicitud',14,'add_solicitud'),(41,'Can change Solicitud',14,'change_solicitud'),(42,'Can delete Solicitud',14,'delete_solicitud'),(43,'Can add migration history',15,'add_migrationhistory'),(44,'Can change migration history',15,'change_migrationhistory'),(45,'Can delete migration history',15,'delete_migrationhistory'),(46,'Can add agregado',16,'add_agregado'),(47,'Can change agregado',16,'change_agregado'),(48,'Can delete agregado',16,'delete_agregado');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(75) NOT NULL,
  `password` varchar(128) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `last_login` datetime NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'admin','','','helmygb@gmail.com','sha1$7dadc$9598ec34683241fd432fb93c5d43513a8cc92e39',1,1,1,'2010-10-16 10:26:42','2010-09-24 00:34:36');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_403f60f` (`user_id`),
  KEY `auth_user_groups_425ae3c4` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_403f60f` (`user_id`),
  KEY `auth_user_user_permissions_1e014c8f` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_agregado`
--

DROP TABLE IF EXISTS `core_agregado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_agregado` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `solicitud_id` int(11) NOT NULL,
  `material_id` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `core_agregado_579b8b39` (`solicitud_id`),
  KEY `core_agregado_54645bd` (`material_id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_agregado`
--

LOCK TABLES `core_agregado` WRITE;
/*!40000 ALTER TABLE `core_agregado` DISABLE KEYS */;
INSERT INTO `core_agregado` VALUES (1,1,1,5),(2,2,1,5),(3,3,1,5),(4,4,1,5),(5,5,1,5),(6,6,1,5),(7,7,1,5),(8,8,1,5),(9,9,1,5),(10,10,1,5),(11,10,2,5),(12,11,1,5),(13,12,1,5),(14,13,1,5),(15,14,1,2),(16,15,1,2),(17,16,1,2),(18,17,1,4),(19,18,1,2),(20,19,2,5);
/*!40000 ALTER TABLE `core_agregado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_material`
--

DROP TABLE IF EXISTS `core_material`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_material` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(100) NOT NULL,
  `titulo` varchar(200) NOT NULL,
  `autor` varchar(100) DEFAULT NULL,
  `tipo_id` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `codigo` (`codigo`),
  KEY `core_material_27e4f492` (`tipo_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_material`
--

LOCK TABLES `core_material` WRITE;
/*!40000 ALTER TABLE `core_material` DISABLE KEYS */;
INSERT INTO `core_material` VALUES (1,'001','Equidad de género','Luciernaga',1,18),(2,'002','Salud Sexual','Luciernaga',1,90);
/*!40000 ALTER TABLE `core_material` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_material_tematica`
--

DROP TABLE IF EXISTS `core_material_tematica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_material_tematica` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `material_id` int(11) NOT NULL,
  `tematica_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `material_id` (`material_id`,`tematica_id`),
  KEY `core_material_tematica_54645bd` (`material_id`),
  KEY `core_material_tematica_612f60fa` (`tematica_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_material_tematica`
--

LOCK TABLES `core_material_tematica` WRITE;
/*!40000 ALTER TABLE `core_material_tematica` DISABLE KEYS */;
INSERT INTO `core_material_tematica` VALUES (5,1,1),(6,2,1);
/*!40000 ALTER TABLE `core_material_tematica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_persona`
--

DROP TABLE IF EXISTS `core_persona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_persona` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `email` varchar(75) DEFAULT NULL,
  `telefono` varchar(30) DEFAULT NULL,
  `organizacion` varchar(200) NOT NULL,
  `sexo` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_persona`
--

LOCK TABLES `core_persona` WRITE;
/*!40000 ALTER TABLE `core_persona` DISABLE KEYS */;
INSERT INTO `core_persona` VALUES (1,'Helmy','Giacoman','helmygb@gmail.com','88796973','SIMAS','masculino'),(2,'Fanny','Franco','fanny@gmail.com','87654696','INATEC','femenino');
/*!40000 ALTER TABLE `core_persona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_persona_profesion`
--

DROP TABLE IF EXISTS `core_persona_profesion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_persona_profesion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `persona_id` int(11) NOT NULL,
  `profesion_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `persona_id` (`persona_id`,`profesion_id`),
  KEY `core_persona_profesion_1d834293` (`persona_id`),
  KEY `core_persona_profesion_46f6d68` (`profesion_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_persona_profesion`
--

LOCK TABLES `core_persona_profesion` WRITE;
/*!40000 ALTER TABLE `core_persona_profesion` DISABLE KEYS */;
INSERT INTO `core_persona_profesion` VALUES (6,1,1),(7,2,1);
/*!40000 ALTER TABLE `core_persona_profesion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_profesion`
--

DROP TABLE IF EXISTS `core_profesion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_profesion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_profesion`
--

LOCK TABLES `core_profesion` WRITE;
/*!40000 ALTER TABLE `core_profesion` DISABLE KEYS */;
INSERT INTO `core_profesion` VALUES (1,'Estudiante');
/*!40000 ALTER TABLE `core_profesion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_solicitud`
--

DROP TABLE IF EXISTS `core_solicitud`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_solicitud` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `persona_id` int(11) NOT NULL,
  `fecha` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `core_solicitud_1d834293` (`persona_id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_solicitud`
--

LOCK TABLES `core_solicitud` WRITE;
/*!40000 ALTER TABLE `core_solicitud` DISABLE KEYS */;
INSERT INTO `core_solicitud` VALUES (1,1,'2010-08-30 22:39:43'),(2,1,'2010-08-30 22:39:43'),(3,1,'2010-08-30 22:47:06'),(4,1,'2010-08-30 22:50:24'),(5,1,'2010-08-30 22:51:21'),(6,1,'2010-08-30 22:51:30'),(7,1,'2010-08-30 22:53:17'),(8,1,'2010-08-30 22:55:50'),(9,1,'2010-05-30 22:58:25'),(10,1,'2010-08-30 22:58:25'),(11,1,'2010-09-16 08:11:22'),(12,1,'2010-09-16 08:11:22'),(13,1,'2010-03-16 08:13:44'),(14,1,'2010-09-16 08:15:07'),(15,1,'2010-09-16 08:16:30'),(16,1,'2010-12-16 08:16:30'),(17,1,'2010-02-16 08:17:21'),(18,1,'2010-09-16 11:07:46'),(19,2,'2010-09-16 15:23:46');
/*!40000 ALTER TABLE `core_solicitud` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_tematica`
--

DROP TABLE IF EXISTS `core_tematica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_tematica` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_tematica`
--

LOCK TABLES `core_tematica` WRITE;
/*!40000 ALTER TABLE `core_tematica` DISABLE KEYS */;
INSERT INTO `core_tematica` VALUES (1,'Salud sexual y reproductiva');
/*!40000 ALTER TABLE `core_tematica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_tipo`
--

DROP TABLE IF EXISTS `core_tipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_tipo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_tipo`
--

LOCK TABLES `core_tipo` WRITE;
/*!40000 ALTER TABLE `core_tipo` DISABLE KEYS */;
INSERT INTO `core_tipo` VALUES (1,'Videos');
/*!40000 ALTER TABLE `core_tipo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_403f60f` (`user_id`),
  KEY `django_admin_log_1bb8f392` (`content_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2010-09-24 00:36:17',1,14,'1','Helmy',1,''),(2,'2010-09-24 00:37:06',1,14,'2','Helmy',3,''),(3,'2010-09-24 00:37:06',1,14,'1','Helmy',3,''),(4,'2010-09-24 00:45:21',1,13,'1','001-Equidad de género',2,'Modificado/a cantidad.'),(5,'2010-09-24 00:52:43',1,13,'1','001-Equidad de género',1,''),(6,'2010-09-30 23:18:00',1,14,'18','Helmy',3,''),(7,'2010-09-30 23:18:00',1,14,'17','Helmy',3,''),(8,'2010-09-30 23:18:00',1,14,'16','Helmy',3,''),(9,'2010-09-30 23:18:00',1,14,'15','Helmy',3,''),(10,'2010-09-30 23:18:00',1,14,'14','Helmy',3,''),(11,'2010-09-30 23:18:00',1,14,'13','Helmy',3,''),(12,'2010-09-30 23:18:00',1,14,'12','Helmy',3,''),(13,'2010-09-30 23:18:00',1,14,'11','Helmy',3,''),(14,'2010-09-30 23:18:00',1,14,'10','Helmy',3,''),(15,'2010-09-30 23:18:00',1,14,'9','Helmy',3,''),(16,'2010-09-30 23:18:00',1,14,'8','Helmy',3,''),(17,'2010-09-30 23:18:00',1,14,'7','Helmy',3,''),(18,'2010-09-30 23:18:00',1,14,'6','Helmy',3,''),(19,'2010-09-30 23:18:00',1,14,'5','Helmy',3,''),(20,'2010-09-30 23:18:00',1,14,'4','Helmy',3,''),(21,'2010-09-30 23:18:00',1,14,'3','Helmy',3,''),(22,'2010-10-16 11:39:07',1,14,'17','Helmy',2,'Modificado/a fecha.'),(23,'2010-10-16 11:39:54',1,14,'17','Helmy',2,'Modificado/a fecha.'),(24,'2010-10-16 11:40:18',1,14,'16','Helmy',2,'Modificado/a fecha.'),(25,'2010-10-16 12:04:10',1,14,'13','Helmy',2,'Modificado/a fecha.'),(26,'2010-10-16 12:04:49',1,14,'13','Helmy',2,'No ha cambiado ningún campo.'),(27,'2010-10-16 12:05:58',1,14,'9','Helmy',2,'Modificado/a fecha.'),(28,'2010-10-16 15:51:48',1,10,'1','Helmy Giacoman',2,'Modificado/a sexo.'),(29,'2010-10-16 15:52:58',1,10,'1','Helmy Giacoman',2,'Modificado/a sexo.'),(30,'2010-10-16 15:53:02',1,10,'1','Helmy Giacoman',2,'Modificado/a sexo.'),(31,'2010-10-16 16:52:48',1,10,'1','Helmy Giacoman',2,'No ha cambiado ningún campo.'),(32,'2010-10-16 16:52:52',1,10,'2','Fanny Franco',2,'Modificado/a sexo.');
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_label` (`app_label`,`model`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'permission','auth','permission'),(2,'group','auth','group'),(3,'user','auth','user'),(4,'message','auth','message'),(5,'content type','contenttypes','contenttype'),(6,'session','sessions','session'),(7,'site','sites','site'),(8,'log entry','admin','logentry'),(9,'Profesion','core','profesion'),(10,'Persona','core','persona'),(11,'Tipo','core','tipo'),(12,'Tematica','core','tematica'),(13,'Material','core','material'),(14,'Solicitud','core','solicitud'),(15,'migration history','south','migrationhistory'),(16,'agregado','core','agregado');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('fb6273f728c63edd509a3318c6ab3b6a','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEBdS4xMTE2MWU2ZTU0ZTUzNDk5YWRi\nM2IwOTA1ODFlNTAwNg==\n','2010-10-14 22:58:27'),('a09b89e80a153d3adf95965995b6bf48','gAJ9cQEuYWFiYTUyNjJmZjU1MmUzZTNmYzNkNTdmZTBjOTlmOGM=\n','2010-10-08 01:16:17'),('1eab4c7cfb8a5d716865cec45cf2310b','gAJ9cQEuYWFiYTUyNjJmZjU1MmUzZTNmYzNkNTdmZTBjOTlmOGM=\n','2010-10-30 17:50:24');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_site`
--

DROP TABLE IF EXISTS `django_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_site`
--

LOCK TABLES `django_site` WRITE;
/*!40000 ALTER TABLE `django_site` DISABLE KEYS */;
INSERT INTO `django_site` VALUES (1,'example.com','example.com');
/*!40000 ALTER TABLE `django_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `south_migrationhistory`
--

DROP TABLE IF EXISTS `south_migrationhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `south_migrationhistory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_name` varchar(255) NOT NULL,
  `migration` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `south_migrationhistory`
--

LOCK TABLES `south_migrationhistory` WRITE;
/*!40000 ALTER TABLE `south_migrationhistory` DISABLE KEYS */;
INSERT INTO `south_migrationhistory` VALUES (1,'core','0001_initial','2010-10-16 20:49:27'),(2,'core','0002_auto__add_field_persona_sexo','2010-10-16 20:51:16');
/*!40000 ALTER TABLE `south_migrationhistory` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-10-16 16:53:53
