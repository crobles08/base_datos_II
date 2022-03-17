/*
SQLyog Ultimate v11.11 (64 bit)
MySQL - 5.5.5-10.4.22-MariaDB : Database - parcial_robles
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`parcial_robles` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `parcial_robles`;

/*Table structure for table `academicperiodgroups` */

DROP TABLE IF EXISTS `academicperiodgroups`;

CREATE TABLE `academicperiodgroups` (
  `id` int(10) NOT NULL,
  `journeyId` int(10) DEFAULT NULL,
  `name` varchar(60) DEFAULT NULL,
  `degreeId` int(10) DEFAULT NULL,
  `groupId` int(10) DEFAULT NULL,
  `quota` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `degreeId` (`degreeId`),
  KEY `groupId` (`groupId`),
  KEY `journeyId` (`journeyId`),
  CONSTRAINT `academicperiodgroups_ibfk_1` FOREIGN KEY (`degreeId`) REFERENCES `degrees` (`id`),
  CONSTRAINT `academicperiodgroups_ibfk_2` FOREIGN KEY (`groupId`) REFERENCES `groups` (`id`),
  CONSTRAINT `academicperiodgroups_ibfk_3` FOREIGN KEY (`journeyId`) REFERENCES `journeys` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `academicperiodgroups` */

insert  into `academicperiodgroups`(`id`,`journeyId`,`name`,`degreeId`,`groupId`,`quota`) values (62,16,NULL,23,10,30),(63,16,NULL,24,10,30),(64,16,NULL,25,10,30),(65,16,NULL,26,10,30),(66,16,NULL,27,10,30),(67,16,NULL,28,10,30),(68,16,NULL,29,10,30),(69,16,NULL,30,10,40),(70,16,NULL,31,10,40),(71,16,NULL,32,10,35);

/*Table structure for table `degrees` */

DROP TABLE IF EXISTS `degrees`;

CREATE TABLE `degrees` (
  `id` int(10) NOT NULL,
  `name` varchar(60) DEFAULT NULL,
  `abbreviation` varchar(20) DEFAULT NULL,
  `levelId` int(10) DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `levelId` (`levelId`),
  CONSTRAINT `degrees_ibfk_1` FOREIGN KEY (`levelId`) REFERENCES `levels` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `degrees` */

insert  into `degrees`(`id`,`name`,`abbreviation`,`levelId`,`createdAt`,`updatedAt`) values (23,'Kínder\r\n',NULL,11,'2021-11-19 20:14:43',NULL),(24,'Preparatoria',NULL,11,'2021-11-19 20:15:05',NULL),(25,'Primero Primaria\r\n',NULL,11,'2021-11-19 20:15:15',NULL),(26,'Segundo Primaria\r\n',NULL,11,'2021-11-19 20:15:21',NULL),(27,'Tercero Primaria\r\n',NULL,12,'2021-11-19 20:15:46',NULL),(28,'Cuarto Primaria\r\n',NULL,12,'2021-11-19 20:15:52',NULL),(29,'Quinto Primaria\r\n',NULL,12,'2021-11-19 20:15:58',NULL),(30,'Sexto Primaria\r\n',NULL,12,'2021-11-19 20:16:04',NULL),(31,'Primero Básico\r\n',NULL,13,'2021-11-19 20:16:48',NULL),(32,'Segundo Básico\r\n',NULL,13,'2021-11-19 20:16:55',NULL);

/*Table structure for table `groups` */

DROP TABLE IF EXISTS `groups`;

CREATE TABLE `groups` (
  `id` int(10) NOT NULL,
  `name` varchar(60) DEFAULT NULL,
  `abbreviation` varchar(20) DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `groups` */

insert  into `groups`(`id`,`name`,`abbreviation`,`createdAt`,`updatedAt`) values (10,'Sección A\r\n','A','2021-11-19 19:44:22',NULL);

/*Table structure for table `journeys` */

DROP TABLE IF EXISTS `journeys`;

CREATE TABLE `journeys` (
  `id` int(10) NOT NULL,
  `name` varchar(60) DEFAULT NULL,
  `abbreviation` varchar(20) DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `journeys` */

insert  into `journeys`(`id`,`name`,`abbreviation`,`createdAt`,`updatedAt`) values (16,'Matutina','Mat.','2021-11-19 19:42:18','0000-00-00 00:00:00');

/*Table structure for table `levels` */

DROP TABLE IF EXISTS `levels`;

CREATE TABLE `levels` (
  `id` int(10) NOT NULL,
  `name` varchar(60) DEFAULT NULL,
  `abbreviation` varchar(20) DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `levels` */

insert  into `levels`(`id`,`name`,`abbreviation`,`createdAt`,`updatedAt`) values (11,'Preprimaria y Primaria Baja',NULL,'2021-11-19 19:42:18',NULL),(12,'Primaria Alta',NULL,'2021-11-19 20:15:35',NULL),(13,'Secundaria',NULL,'2021-11-19 20:16:39',NULL);

/*Table structure for table `matriculates` */

DROP TABLE IF EXISTS `matriculates`;

CREATE TABLE `matriculates` (
  `id` int(10) NOT NULL,
  `academicPeriodGroupId` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `academicPeriodGroupId` (`academicPeriodGroupId`),
  CONSTRAINT `matriculates_ibfk_1` FOREIGN KEY (`academicPeriodGroupId`) REFERENCES `academicperiodgroups` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `matriculates` */

insert  into `matriculates`(`id`,`academicPeriodGroupId`) values (0,NULL),(1,62),(2,62),(3,62),(4,62),(5,62),(6,62),(7,62),(8,62),(9,62),(10,62),(11,62),(12,62),(13,63),(14,63),(15,63),(16,63),(17,63),(18,63),(19,63),(20,63),(21,63),(22,63),(23,63),(24,63),(25,63),(26,63),(27,63),(28,63),(29,63),(30,63),(31,63),(32,63),(33,63),(34,64),(35,64),(36,64),(37,64),(38,64),(39,64),(40,64),(41,64),(42,64),(43,64),(44,64),(45,64),(46,64),(47,64),(48,64),(49,64),(50,64),(51,64),(52,64),(53,64),(54,64),(55,64),(56,64),(57,64),(58,64),(59,64),(60,64),(61,64),(62,65),(63,65),(64,65),(65,65),(66,65),(67,65),(68,65),(69,65),(70,65),(71,65),(72,65),(73,65),(74,65),(75,65),(76,65),(77,65),(78,65),(79,65),(80,65),(81,65),(82,65),(83,65),(84,65),(85,65),(86,65),(87,65),(88,65),(89,65),(90,65),(91,65),(92,65),(93,65),(94,66),(95,66),(96,66),(97,66),(98,66),(99,66),(100,66),(101,66),(102,66),(103,66),(104,66),(105,66),(106,66),(107,66),(108,66),(109,66),(110,66),(111,66),(112,66),(113,66),(114,66),(115,66),(116,66),(117,66),(118,66),(119,66),(120,66),(121,66),(122,66),(123,66),(124,67),(125,67),(126,67),(127,67),(128,67),(129,67),(130,67),(131,67),(132,67),(133,67),(134,67),(135,67),(136,67),(137,67),(138,67),(139,67),(140,67),(141,67),(142,67),(143,67),(144,67),(145,67),(146,67),(147,67),(148,67),(149,67),(150,67),(151,67),(152,67),(153,67),(154,68),(155,68),(156,68),(157,68),(158,68),(159,68),(160,68),(161,68),(162,68),(163,68),(164,68),(165,68),(166,68),(167,68),(168,68),(169,68),(170,68),(171,68),(172,68),(173,68),(174,68),(175,68),(176,68),(177,68),(178,68),(179,68),(180,68),(181,69),(182,69),(183,69),(184,69),(185,69),(186,69),(187,69),(188,69),(189,69),(190,69),(191,69),(192,69),(193,69),(194,69),(195,69),(196,69),(197,69),(198,69),(199,69),(200,69),(201,69),(202,69),(203,69),(204,69),(205,69),(206,69),(207,69),(208,69),(209,69),(210,69),(211,69),(212,69),(213,69),(214,69),(215,69),(216,69),(217,69),(218,69),(219,70),(220,70),(221,70),(222,70),(223,70),(224,70),(225,70),(226,70),(227,70),(228,70),(229,70),(230,70),(231,70),(232,70),(233,70),(234,70),(235,70),(236,70),(237,70),(238,70),(239,70),(240,70),(241,70),(242,70),(243,70),(244,70),(245,70),(246,70),(247,70),(248,70),(249,70),(250,70),(251,70),(252,70),(253,70),(254,70),(255,70),(256,71),(257,71),(258,71),(259,71),(260,71),(261,71),(262,71),(263,71),(264,71),(265,71),(266,71),(267,71),(268,71),(269,71),(270,71),(271,71),(272,71),(273,71),(274,71),(275,71),(276,71),(277,71),(278,71),(279,71),(280,71),(281,71),(282,71),(283,71),(284,71),(285,71),(286,71),(287,71),(288,71);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
