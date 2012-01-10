-- MySQL dump 10.13  Distrib 5.1.55, for mandriva-linux-gnu (i586)
--
-- Host: localhost    Database: wargame
-- ------------------------------------------------------
-- Server version	5.1.55-log

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
-- Table structure for table `base_scale`
--

DROP TABLE IF EXISTS `base_scale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `base_scale` (
  `base` enum('1','S','P','C','B') COLLATE utf8_unicode_ci NOT NULL,
  `descr` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`base`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `base_scale`
--

LOCK TABLES `base_scale` WRITE;
/*!40000 ALTER TABLE `base_scale` DISABLE KEYS */;
INSERT INTO `base_scale` VALUES ('1','1 to 1'),('S','Squad'),('P','Platoon'),('C','Company'),('B','Battalion');
/*!40000 ALTER TABLE `base_scale` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `card_flags`
--

DROP TABLE IF EXISTS `card_flags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `card_flags` (
  `flag` int(11) NOT NULL,
  `notes` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`flag`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `card_flags`
--

LOCK TABLES `card_flags` WRITE;
/*!40000 ALTER TABLE `card_flags` DISABLE KEYS */;
INSERT INTO `card_flags` VALUES (1,'Turn End'),(2,'Active Turn End'),(4,'Reinforcement');
/*!40000 ALTER TABLE `card_flags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cards`
--

DROP TABLE IF EXISTS `cards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cards` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text COLLATE utf8_unicode_ci NOT NULL,
  `descr` text COLLATE utf8_unicode_ci NOT NULL,
  `flags` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cards`
--

LOCK TABLES `cards` WRITE;
/*!40000 ALTER TABLE `cards` DISABLE KEYS */;
/*!40000 ALTER TABLE `cards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ci_sessions`
--

DROP TABLE IF EXISTS `ci_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ci_sessions` (
  `session_id` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `ip_address` varchar(16) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `user_agent` varchar(120) COLLATE utf8_unicode_ci NOT NULL,
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  `user_data` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`session_id`),
  KEY `last_activity_idx` (`last_activity`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ci_sessions`
--

LOCK TABLES `ci_sessions` WRITE;
/*!40000 ALTER TABLE `ci_sessions` DISABLE KEYS */;
INSERT INTO `ci_sessions` VALUES ('ccfd10eb4b4194268817de4a54076f87','203.122.194.178','Mozilla/5.0 (X11; Linux i686; rv:8.0) Gecko/20100101 Firefox/8.0',1326175024,'a:4:{s:9:\"user_data\";s:0:\"\";s:7:\"user_id\";s:1:\"6\";s:8:\"username\";s:7:\"steveoc\";s:12:\"is_logged_in\";b:1;}'),('dab81fb02896c7e45f2982e39e417a1c','203.122.194.178','Mozilla/5.0 (X11; Linux i686; rv:9.0.1) Gecko/20100101 Firefox/9.0.1',1325762366,'a:4:{s:9:\"user_data\";s:0:\"\";s:7:\"user_id\";s:1:\"7\";s:8:\"username\";s:7:\"another\";s:12:\"is_logged_in\";b:1;}'),('f95bfe9778c942c460aca2e6f02043c8','66.249.67.193','Mediapartners-Google',1325944633,''),('270748806fd2f4db433f3fe4664517ce','66.249.67.193','Mediapartners-Google',1325944654,''),('04003caeb91daa9c6cad83af50e0a229','66.249.67.193','Mediapartners-Google',1325944672,''),('84a0d88e6488ab746376f8b1751a17b7','66.249.67.193','Mediapartners-Google',1325946436,''),('b9dff8998df262215ba551b9245a97d7','66.249.67.193','Mediapartners-Google',1325946488,''),('d86afd9aeedfd6d67e10225b9765bd51','66.249.67.193','Mediapartners-Google',1325951697,'');
/*!40000 ALTER TABLE `ci_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `command_system`
--

DROP TABLE IF EXISTS `command_system`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `command_system` (
  `command_system` enum('C','D','R') COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`command_system`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `command_system`
--

LOCK TABLES `command_system` WRITE;
/*!40000 ALTER TABLE `command_system` DISABLE KEYS */;
INSERT INTO `command_system` VALUES ('C','Corps'),('D','Division Group'),('R','Regimental Pool');
/*!40000 ALTER TABLE `command_system` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `command_types`
--

DROP TABLE IF EXISTS `command_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `command_types` (
  `id` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `radius` int(11) NOT NULL,
  `change_order` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `command_types`
--

LOCK TABLES `command_types` WRITE;
/*!40000 ALTER TABLE `command_types` DISABLE KEYS */;
INSERT INTO `command_types` VALUES ('E','Efficient',12,4),('F','Functional',12,6),('C','Cumbersome',10,7),('U','Useless',10,8);
/*!40000 ALTER TABLE `command_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drill_system`
--

DROP TABLE IF EXISTS `drill_system`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `drill_system` (
  `drill_system` enum('F','P','B','M') COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`drill_system`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drill_system`
--

LOCK TABLES `drill_system` WRITE;
/*!40000 ALTER TABLE `drill_system` DISABLE KEYS */;
INSERT INTO `drill_system` VALUES ('F','French'),('P','Prussian'),('B','British'),('M','Mob');
/*!40000 ALTER TABLE `drill_system` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `game`
--

DROP TABLE IF EXISTS `game`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `game` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `scenario_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `notes` text COLLATE utf8_unicode_ci NOT NULL,
  `date_played` datetime NOT NULL,
  `date_finished` datetime NOT NULL,
  `location` text COLLATE utf8_unicode_ci NOT NULL,
  `players` text COLLATE utf8_unicode_ci NOT NULL,
  `result` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `game`
--

LOCK TABLES `game` WRITE;
/*!40000 ALTER TABLE `game` DISABLE KEYS */;
INSERT INTO `game` VALUES (1,'Krookwust Hill',0,6,'<p>A great game was had by all</p>','2012-01-07 00:00:00','0000-00-00 00:00:00','Steve\'s Shed','Steve - French\nComputer - Allied',0);
/*!40000 ALTER TABLE `game` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `game_cards_drawn`
--

DROP TABLE IF EXISTS `game_cards_drawn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `game_cards_drawn` (
  `game_id` int(11) NOT NULL,
  `turn_id` int(11) NOT NULL,
  `deck_id` int(11) NOT NULL,
  `notes` text COLLATE utf8_unicode_ci NOT NULL,
  `realtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `game_cards_drawn`
--

LOCK TABLES `game_cards_drawn` WRITE;
/*!40000 ALTER TABLE `game_cards_drawn` DISABLE KEYS */;
/*!40000 ALTER TABLE `game_cards_drawn` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `game_turn`
--

DROP TABLE IF EXISTS `game_turn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `game_turn` (
  `game_id` int(11) NOT NULL,
  `seq` int(11) NOT NULL AUTO_INCREMENT,
  `time` datetime NOT NULL,
  `realtime` datetime NOT NULL,
  PRIMARY KEY (`game_id`,`seq`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `game_turn`
--

LOCK TABLES `game_turn` WRITE;
/*!40000 ALTER TABLE `game_turn` DISABLE KEYS */;
/*!40000 ALTER TABLE `game_turn` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logins`
--

DROP TABLE IF EXISTS `logins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `logins` (
  `user_id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_agent` text COLLATE utf8_unicode_ci NOT NULL,
  `ip_address` text COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `user_id` (`user_id`,`date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logins`
--

LOCK TABLES `logins` WRITE;
/*!40000 ALTER TABLE `logins` DISABLE KEYS */;
INSERT INTO `logins` VALUES (7,'2011-12-26 09:53:22','Mozilla/5.0 (X11; Linux i686; rv:8.0) Gecko/20100101 Firefox/8.0','203.122.194.178'),(7,'2011-12-26 09:52:40','Mozilla/5.0 (X11; Linux i686; rv:8.0) Gecko/20100101 Firefox/8.0','203.122.194.178'),(7,'2011-12-26 11:58:46','Mozilla/5.0 (X11; Linux i686; rv:8.0) Gecko/20100101 Firefox/8.0','203.122.194.178'),(7,'2011-12-26 22:53:18','Mozilla/5.0 (X11; Linux i686; rv:8.0) Gecko/20100101 Firefox/8.0','203.122.194.178'),(7,'2011-12-26 23:10:59','Mozilla/5.0 (X11; Linux i686; rv:8.0) Gecko/20100101 Firefox/8.0','203.122.194.178'),(7,'2011-12-27 01:30:31','Mozilla/5.0 (X11; Linux i686; rv:8.0) Gecko/20100101 Firefox/8.0','203.122.194.178'),(7,'2011-12-27 01:33:33','Mozilla/5.0 (X11; Linux i686; rv:8.0) Gecko/20100101 Firefox/8.0','203.122.194.178'),(7,'2011-12-27 01:48:59','Mozilla/5.0 (X11; Linux i686; rv:8.0) Gecko/20100101 Firefox/8.0','203.122.194.178'),(7,'2011-12-27 01:54:09','Mozilla/5.0 (X11; Linux i686; rv:8.0) Gecko/20100101 Firefox/8.0','203.122.194.178'),(7,'2011-12-27 01:58:11','Mozilla/5.0 (X11; Linux i686; rv:8.0) Gecko/20100101 Firefox/8.0','203.122.194.178'),(7,'2011-12-27 02:05:52','Mozilla/5.0 (X11; Linux i686; rv:8.0) Gecko/20100101 Firefox/8.0','203.122.194.178'),(7,'2011-12-27 02:06:04','Mozilla/5.0 (X11; Linux i686; rv:8.0) Gecko/20100101 Firefox/8.0','203.122.194.178'),(7,'2011-12-27 02:57:52','Mozilla/5.0 (X11; Linux i686; rv:8.0) Gecko/20100101 Firefox/8.0','203.122.194.178'),(7,'2011-12-27 03:30:10','Mozilla/5.0 (X11; Linux i686; rv:8.0) Gecko/20100101 Firefox/8.0','203.122.194.178'),(7,'2011-12-27 06:08:50','Mozilla/5.0 (X11; Linux i686; rv:8.0) Gecko/20100101 Firefox/8.0','203.122.194.178'),(7,'2011-12-27 07:01:04','Mozilla/5.0 (X11; Linux i686; rv:8.0) Gecko/20100101 Firefox/8.0','203.122.194.178'),(7,'2011-12-27 07:08:27','Mozilla/5.0 (X11; Linux i686; rv:8.0) Gecko/20100101 Firefox/8.0','203.122.194.178'),(7,'2011-12-27 07:09:16','Mozilla/5.0 (X11; Linux i686; rv:8.0) Gecko/20100101 Firefox/8.0','203.122.194.178'),(7,'2011-12-27 15:18:48','Mozilla/5.0 (X11; Linux i686; rv:8.0) Gecko/20100101 Firefox/8.0','203.122.194.178'),(6,'2011-12-27 17:47:43','Mozilla/5.0 (X11; Linux i686; rv:8.0) Gecko/20100101 Firefox/8.0','203.122.194.178'),(7,'2011-12-30 03:25:15','Mozilla/5.0 (X11; Linux i686; rv:8.0) Gecko/20100101 Firefox/8.0','203.122.194.178'),(6,'2011-12-30 03:27:43','Mozilla/5.0 (X11; Linux i686; rv:8.0) Gecko/20100101 Firefox/8.0','203.122.194.178'),(7,'2012-01-04 03:18:40','Mozilla/5.0 (X11; Linux i686; rv:8.0) Gecko/20100101 Firefox/8.0','203.122.194.178'),(6,'2012-01-04 03:38:34','Mozilla/5.0 (X11; Linux i686; rv:8.0) Gecko/20100101 Firefox/8.0','203.122.194.178'),(7,'2012-01-05 11:19:57','Mozilla/5.0 (X11; Linux i686; rv:9.0.1) Gecko/20100101 Firefox/9.0.1','203.122.194.178'),(6,'2012-01-06 13:58:30','Mozilla/5.0 (X11; Linux i686; rv:8.0) Gecko/20100101 Firefox/8.0','203.122.194.178'),(6,'2012-01-06 14:00:21','Mozilla/5.0 (X11; Linux i686; rv:8.0) Gecko/20100101 Firefox/8.0','203.122.194.178'),(6,'2012-01-06 14:10:28','Mozilla/5.0 (X11; Linux i686; rv:8.0) Gecko/20100101 Firefox/8.0','203.122.194.178');
/*!40000 ALTER TABLE `logins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nation`
--

DROP TABLE IF EXISTS `nation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `year` int(11) NOT NULL,
  `command_type` enum('E','F','C','U') COLLATE utf8_unicode_ci NOT NULL,
  `command_system` enum('C','D','R') COLLATE utf8_unicode_ci NOT NULL,
  `drill_system` enum('F','P','M') COLLATE utf8_unicode_ci NOT NULL,
  `descr` text COLLATE utf8_unicode_ci NOT NULL,
  `flag` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `music` text COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nation`
--

LOCK TABLES `nation` WRITE;
/*!40000 ALTER TABLE `nation` DISABLE KEYS */;
INSERT INTO `nation` VALUES (1,'France',1806,'E','C','F','<h1>France 1806</h1>\n<p><span style=\"font-size: small;\">Early French armies were composed of an uneasy mixture of trained veteran troops and militia levies. Eventually however, their new training system began to mass-produce excellent soldiers who, even though green, usually fought well from the outset. This kept the army on its feet long after many old soldiers had retired or died in action. The Imperial Guard was an elite formation headed by top grade veteran officers. Its size was smaller than its reputation and players should resist the temptation to build too many guard units. This list also includes Polish, Italian and Swiss troops in French service as well as German Duchy troops after 1808. Line artillery is veteran and guard artillery is elite grade morale. </span></p>\n<p><span style=\"font-size: small;\"> During the Early campaigns in Germany and Italy, the French Army used the \"division group\" system. By the 1805 campaign, the Corps system had been fully implemented. French command categories are: 1792-1795 = Cumbersome, 1796-1800 = Functional, 1805-1815 = Efficient. French system of formation change was used throughout the wars. </span></p>\n<p><span style=\"font-size: small;\">Recommended artillery ratios for Central/Eastern Europe: </span></p>\n<p><span style=\"font-size: small;\">1800 - 1806 = 1 battery per 12 bases. </span></p>\n<p><span style=\"font-size: small;\">1807 - 1809 = 1 battery per 8 bases. </span></p>\n<p><span style=\"font-size: small;\">1812 = 1 battery per 5 bases. </span></p>\n<p><span style=\"font-size: small;\">Recommended artillery ratios for the Peninsula: 1 battery per 10 bases. </span></p>\n<p><span style=\"font-size: small;\"><br /></span></p>\n<table border=\"0\" cellspacing=\"0\" cellpadding=\"0\" width=\"95%\">\n<tbody>\n<tr>\n<td>\n<table border=\"0\" width=\"600\">\n<tbody>\n<tr>\n<td bgcolor=\"ddddd0\"><strong>Infantry regiments</strong></td>\n<td bgcolor=\"ddddd0\"><strong>Size</strong></td>\n<td bgcolor=\"ddddd0\"><strong>Grade</strong></td>\n<td bgcolor=\"ddddd0\"><strong>Available skirmishers</strong></td>\n</tr>\n<tr>\n<td>Demi-Brigade (1797)</td>\n<td>4 bases</td>\n<td>Militia through Veteran</td>\n<td>one good</td>\n</tr>\n<tr>\n<td>\"A\" Line/Light (1805)</td>\n<td>3 bases</td>\n<td>Veteran</td>\n<td>All Good</td>\n</tr>\n<tr>\n<td>\"B\" Line (1805)</td>\n<td>4 bases</td>\n<td>Average</td>\n<td>one good</td>\n</tr>\n<tr>\n<td>Other Light</td>\n<td>3 bases</td>\n<td>Average</td>\n<td>All Good</td>\n</tr>\n<tr>\n<td><br /></td>\n<td><br /></td>\n<td><br /></td>\n<td><br /></td>\n</tr>\n<tr>\n<td>Line grenadier (1805-1807)</td>\n<td>5 bases</td>\n<td>Veteran</td>\n<td>one good</td>\n</tr>\n<tr>\n<td><br /></td>\n<td><br /></td>\n<td><br /></td>\n<td><br /></td>\n</tr>\n<tr>\n<td>Old Guard</td>\n<td>3 bases</td>\n<td>Elite</td>\n<td>All Excellent</td>\n</tr>\n<tr>\n<td>Middle Guard</td>\n<td>3 bases</td>\n<td>Veteran</td>\n<td>All Excellent</td>\n</tr>\n<tr>\n<td>Young Guard</td>\n<td>3 bases</td>\n<td>Average</td>\n<td>All Good</td>\n</tr>\n</tbody>\n</table>\n<table border=\"0\" width=\"600\">\n<tbody>\n<tr>\n<td bgcolor=\"ddddd0\"><strong>Cavalry brigades</strong></td>\n<td bgcolor=\"ddddd0\"><strong>Size</strong></td>\n<td bgcolor=\"ddddd0\"><strong>Grade</strong></td>\n<td bgcolor=\"ddddd0\"><strong>Type</strong></td>\n</tr>\n<tr>\n<td>Cuirassier</td>\n<td>3 bases</td>\n<td>Average</td>\n<td>Armored</td>\n</tr>\n<tr>\n<td>Dragoon/Uhlan</td>\n<td>4 bases</td>\n<td>Average</td>\n<td>Medium</td>\n</tr>\n<tr>\n<td>Hussar/Chasseur</td>\n<td>4 bases</td>\n<td>Average</td>\n<td>Light</td>\n</tr>\n<tr>\n<td>.</td>\n<td><br /></td>\n<td><br /></td>\n<td><br /></td>\n</tr>\n<tr>\n<td><strong>Guard regiments</strong>:</td>\n<td><br /></td>\n<td><br /></td>\n<td><br /></td>\n</tr>\n<tr>\n<td>Guard Chas. Cheval</td>\n<td>4 bases</td>\n<td>Elite</td>\n<td>Medium</td>\n</tr>\n<tr>\n<td>Guard Gren. Cheval</td>\n<td>3 bases</td>\n<td>Elite</td>\n<td>Heavy</td>\n</tr>\n<tr>\n<td>Guard lancers</td>\n<td>3 bases</td>\n<td>Elite</td>\n<td>Medium</td>\n</tr>\n<tr>\n<td>Other Guard Cav.</td>\n<td>3 bases</td>\n<td>Veteran</td>\n<td>Medium</td>\n</tr>\n</tbody>\n</table>\n<table border=\"0\" width=\"600\">\n<tbody>\n<tr>\n<td bgcolor=\"ddddd0\"><strong>Infantry Divisions</strong></td>\n<td bgcolor=\"ddddd0\"><strong>Infantry regiments</strong></td>\n<td bgcolor=\"ddddd0\"><strong>Artillery</strong></td>\n</tr>\n<tr>\n<td>1805</td>\n<td>1 Light, 2 Line</td>\n<td>1 light foot</td>\n</tr>\n<tr>\n<td>.</td>\n<td><br /></td>\n<td><br /></td>\n</tr>\n<tr>\n<td>1805 - 1808 (Old Guard)</td>\n<td>1 Chas., 1 Gren.</td>\n<td><br /></td>\n</tr>\n</tbody>\n</table>\n<table border=\"0\" width=\"600\">\n<tbody>\n<tr>\n<td bgcolor=\"ddddd0\"><strong>Infantry Corps</strong></td>\n<td bgcolor=\"ddddd0\"><strong>Infantry Divisions</strong></td>\n<td bgcolor=\"ddddd0\"><strong>Cavalry</strong></td>\n<td bgcolor=\"ddddd0\"><strong>Artillery</strong></td>\n</tr>\n<tr>\n<td>1805</td>\n<td>2 or 3 Line</td>\n<td>1 brigade light</td>\n<td>1 Heavy foot, 2 medium foot</td>\n</tr>\n</tbody>\n</table>\n</td>\n</tr>\n</tbody>\n</table>','fr1804_1.gif','<iframe width=\"640\" height=\"480\" src=\"http://www.youtube.com/embed/221UWotqwdo?rel=0&autoplay=1\" frameborder=\"0\" allowfullscreen></iframe>',6),(3,'Prussia',1806,'C','D','P','<h1>Prussia 1806</h1>\n<p>In 1806, the Prussian Army was one of the more intensely 						drilled and enthusiastic forces in the world, but it had not seen serious (or 						prolonged) combat in decades and its troops were heavily dependent on their 						supply train. The army was also hampered by its antiquated system of 						grand-tactical maneuver which restricted battlefield deployment and mobility.</p>\n<p>The 1806 Prussian Army used the \"Division Group\" system. 						German Duchies through 1807 will tend to use Prussian organization. Recommended 						artillery ratios: 1 battery per 7 bases (varied greatly). Command category is 						Cumbersome. The army never used the French maneuver system.</p>\n<table border=\"0\" width=\"600\">\n<tbody>\n<tr>\n<td bgcolor=\"ddddd0\"><strong>Infantry regiments</strong></td>\n<td bgcolor=\"ddddd0\"><strong>Size</strong></td>\n<td bgcolor=\"ddddd0\"><strong>Grade</strong></td>\n<td bgcolor=\"ddddd0\"><strong>Available skirmishers</strong></td>\n</tr>\n<tr>\n<td>Line</td>\n<td>3 bases</td>\n<td>Green</td>\n<td>-</td>\n</tr>\n<tr>\n<td>Grenadier (brigade)</td>\n<td>2 bases</td>\n<td>Average</td>\n<td>-</td>\n</tr>\n<tr>\n<td>Fusiler</td>\n<td>2 bases</td>\n<td>Green</td>\n<td>one poor</td>\n</tr>\n<tr>\n<td>Foot Guard</td>\n<td>3 or 4 bases</td>\n<td>Average</td>\n<td>-</td>\n</tr>\n<tr>\n<td>Jager</td>\n<td>1 base</td>\n<td>Green</td>\n<td>All Adequate</td>\n</tr>\n</tbody>\n</table>\n<table border=\"0\" width=\"600\">\n<tbody>\n<tr>\n<td bgcolor=\"ddddd0\"><strong>Cavalry brigades</strong></td>\n<td bgcolor=\"ddddd0\"><strong>Size</strong></td>\n<td bgcolor=\"ddddd0\"><strong>Grade</strong></td>\n<td bgcolor=\"ddddd0\"><strong>Type</strong></td>\n</tr>\n<tr>\n<td>Cuirassier</td>\n<td>3 bases</td>\n<td>Average</td>\n<td>Heavy</td>\n</tr>\n<tr>\n<td>Dragoon/Uhlan</td>\n<td>3 bases</td>\n<td>Average</td>\n<td>Medium</td>\n</tr>\n<tr>\n<td>Hussar</td>\n<td>3 bases</td>\n<td>Average</td>\n<td>Light</td>\n</tr>\n<tr>\n<td>Mounted Jager</td>\n<td>3 bases</td>\n<td>Average</td>\n<td>Light</td>\n</tr>\n</tbody>\n</table>','','<iframe width=\"640\" height=\"480\" src=\"http://www.youtube.com/embed/f_6AQA4uzD0?rel=0&autoplay=1\" frameborder=\"0\" allowfullscreen></iframe>',6),(5,'Austria',1809,'F','C','P','<h1>Austria 1809</h1>\n<p><span style=\"font-size: small;\">The Austrian Army of the Napoleonic Wars was usually composed of solid German and Hungarian line recruits, and considering the stubborn conservatism of the officer corps, the rank and file performed well. Early in the wars Austrian troops performed well, and through 1809, Austrian regiments maintained a constantly professional bearing. By 1812, Austria was at the end of its rope, with no money left in the treasury and barely any equipment left in the country. The force which marched into central Germany in 1813 was quite literally Austria\'s last and only available field army, it was poorly trained and equipped, and had very little winter clothing. </span></p>\n<p><span style=\"font-size: small;\">Austrian cavalry was considered very good through 1809, although like the rest of the army, it had not been trained in grand-tactical maneuver, and so could rarely counter the more nimble field maneuvers of its most common opponent. Austrian light infantry units were severely constrained by army doctrine, and even the better units like jagers and grenzers were not fully trained for, or employed in methods fully benefitting their theoretical roles. For game play, the artillery is usually average morale grade. </span></p>\n<p><span style=\"font-size: small;\">Through 1805, the Austrian Army was still using the \"Regimental Pool\" system, assigning units to leaders who commanded temporary \"columns\". By 1809 they had theoretically adopted the Corps system, but it was never truly instituted, and commanders continued to employ a kind of divisional group system through the end of the wars. Austrian command category in Functional. May start using French system of maneuver in 1812. Recommended artillery ratios: 1800 - 1809 = 1 battery per 7 bases. </span></p>\n<table border=\"0\" width=\"600\">\n<tbody>\n<tr>\n<td bgcolor=\"ddddd0\"><strong>Infantry regiments</strong></td>\n<td bgcolor=\"ddddd0\"><strong>Size</strong></td>\n<td bgcolor=\"ddddd0\"><strong>Grade</strong></td>\n<td bgcolor=\"ddddd0\"><strong>Available skirmishers</strong></td>\n</tr>\n<tr>\n<td>Line (1796)</td>\n<td>5 or 6 bases</td>\n<td>Average</td>\n<td>-</td>\n</tr>\n<tr>\n<td>Line (1805)</td>\n<td>4 or 5 bases</td>\n<td>Average/Green</td>\n<td>-</td>\n</tr>\n<tr>\n<td>Line (1809)</td>\n<td>5 or 6 bases</td>\n<td>Average</td>\n<td>-</td>\n</tr>\n<tr>\n<td>Line (1813)</td>\n<td>4 or 5 bases</td>\n<td>Green/Militia</td>\n<td>one poor</td>\n</tr>\n<tr>\n<td>Grenadier (brigade)</td>\n<td>5 bases</td>\n<td>Veteran/Elite</td>\n<td>-</td>\n</tr>\n<tr>\n<td>Jager</td>\n<td>2 bases</td>\n<td>Average</td>\n<td>All Adequate</td>\n</tr>\n<tr>\n<td>Grenzer</td>\n<td>1 or 2 bases</td>\n<td>Average</td>\n<td>All Poor</td>\n</tr>\n</tbody>\n</table>\n<table border=\"0\" width=\"600\">\n<tbody>\n<tr>\n<td bgcolor=\"ddddd0\"><strong>Cavalry brigades</strong></td>\n<td bgcolor=\"ddddd0\"><strong>Size</strong></td>\n<td bgcolor=\"ddddd0\"><strong>Grade</strong></td>\n<td bgcolor=\"ddddd0\"><strong>Type</strong></td>\n</tr>\n<tr>\n<td>Cuirassier</td>\n<td>4 bases</td>\n<td>Average</td>\n<td>Armored</td>\n</tr>\n<tr>\n<td>Dragoon/Uhlan</td>\n<td>4 bases</td>\n<td>Average</td>\n<td>Medium</td>\n</tr>\n<tr>\n<td>Hussar</td>\n<td>4 bases</td>\n<td>Average</td>\n<td>Light</td>\n</tr>\n</tbody>\n</table>\n<table border=\"0\" width=\"600\">\n<tbody>\n<tr>\n<td bgcolor=\"ddddd0\"><strong>Infantry Divisions</strong></td>\n<td bgcolor=\"ddddd0\"><strong>Infantry regiments</strong></td>\n<td bgcolor=\"ddddd0\"><strong>Cavalry</strong></td>\n<td bgcolor=\"ddddd0\"><strong>Artillery</strong></td>\n</tr>\n<tr>\n<td>1809-1814 Line</td>\n<td>4 Line</td>\n<td>none</td>\n<td>2 medium foot</td>\n</tr>\n<tr>\n<td>1809-1814 Light</td>\n<td>2 Jager &amp; Grenz bat.</td>\n<td>2 bases light cav.</td>\n<td>1 medium horse</td>\n</tr>\n<tr>\n<td>1809-1814 Grenadier</td>\n<td>2 Grenadier (brigades)</td>\n<td>none</td>\n<td>1 medium foot</td>\n</tr>\n</tbody>\n</table>\n<table border=\"0\" width=\"600\">\n<tbody>\n<tr>\n<td bgcolor=\"ddddd0\"><strong>Infantry Corps</strong></td>\n<td bgcolor=\"ddddd0\"><strong>Infantry Divisions</strong></td>\n<td bgcolor=\"ddddd0\"><strong>Cavalry</strong></td>\n<td bgcolor=\"ddddd0\"><strong>Artillery</strong></td>\n</tr>\n<tr>\n<td>1809-1814</td>\n<td>2 Line, 1 Light</td>\n<td>none</td>\n<td>2 Heavy foot art., 2 or 3 medium foot art.</td>\n</tr>\n</tbody>\n</table>','','<iframe width=\"640\" height=\"480\" src=\"http://www.youtube.com/embed/vPpZ-WttqH0?rel=0&autoplay=1\" frameborder=\"0\" allowfullscreen></iframe>',6),(6,'Russia',1807,'C','R','P','<h1>Russia 1807</h1>\n<table border=\"0\" cellspacing=\"0\" cellpadding=\"0\" width=\"95%\">\n<tbody>\n<tr>\n<td>\n<p><span style=\"font-size: small;\">The Russian Armies of the Napoleonic wars were famous for 						two things: their apparently endless numbers, and their apparently nonexistent 						supply system. Russian Armies coming to the \"aid\" of continental allies were 						commonly just as feared as the French because of the knowledge that the Russian 						troops would scour the land around them of all consumable items, usually 						brutalizing the population in the process. Indeed, on several occasions, the 						Austrian government nearly refused Russian aid for just this reason. The 						Russian Army itself performed very well when defending home territory, as was 						seen during the 1807 and 1812 campaigns. </span></p>\n<p><span style=\"font-size: small;\">When fighting outside of its 						territory, their initially brave and solid recruits tended to suffer greatly 						from lack of supply, especially food and medical services. The Russians which 						marched to Italy in 1799 arrived confidently, but within six months, poor 						supply and several rough encounters with the newly organized French armies had 						changed them. By the end of the year, one British observer noted \"...the 						Russians were almost totally demoralized...their withdrawal is due to the 						almost unanimous desire to return to Russia and to an evident dread of meeting 						the French.\" The Army sent into central Germany in 1813 was, like most others 						on both sides, a large, but nearly spent force, with many regiments operating 						at a fraction of their original strengths.</span></p>\n<p><span style=\"font-size: small;\">Through 1805, the Russian Army used the \"Regimental Pool\" 						system, drawing from a general unit pool and temporarily assigning them to 						\"column\" or \"wing\" leaders. In 1806-1807 they switched to the \"Division Group\" 						system and in 1811 they switched to the \"Corps/Army\" system for the rest of the 						wars. Russian command category in Cumbersome. The French system of formation 						change may be used after 1812, although this is seriously questionable, and 						players should probably keep the Russians on the Prussian system throughout. 						Recommended artillery ratios: 1807 = 1 battery per 7 bases. 1812 = 1 battery 						per 5 bases.</span></p>\n<table border=\"0\" width=\"600\">\n<tbody>\n<tr>\n<td bgcolor=\"ddddd0\"><strong>Infantry regiments</strong></td>\n<td bgcolor=\"ddddd0\"><strong>Size</strong></td>\n<td bgcolor=\"ddddd0\"><strong>Grade</strong></td>\n<td bgcolor=\"ddddd0\"><strong>Available skirmishers</strong></td>\n</tr>\n<tr>\n<td>Musketeer (Line)</td>\n<td>3 bases</td>\n<td>Average</td>\n<td>-</td>\n</tr>\n<tr>\n<td>Grenadier</td>\n<td>4 bases</td>\n<td>Average</td>\n<td>-</td>\n</tr>\n<tr>\n<td>Jager</td>\n<td>2 bases</td>\n<td>Average</td>\n<td>All Poor</td>\n</tr>\n<tr>\n<td>.</td>\n<td><br /></td>\n<td><br /></td>\n<td><br /></td>\n</tr>\n<tr>\n<td>Preobrajenski Guards</td>\n<td>4 bases</td>\n<td>Veteran</td>\n<td>-</td>\n</tr>\n<tr>\n<td>Other Guards</td>\n<td>3 bases</td>\n<td>Veteran</td>\n<td>-</td>\n</tr>\n<tr>\n<td>Guard Jagers</td>\n<td>2 bases</td>\n<td>Veteran</td>\n<td>All Good</td>\n</tr>\n</tbody>\n</table>\n<table border=\"0\" width=\"600\">\n<tbody>\n<tr>\n<td bgcolor=\"ddddd0\"><strong>Cavalry brigades</strong></td>\n<td bgcolor=\"ddddd0\"><strong>Size</strong></td>\n<td bgcolor=\"ddddd0\"><strong>Grade</strong></td>\n<td bgcolor=\"ddddd0\"><strong>Type</strong></td>\n</tr>\n<tr>\n<td>Cuirassier</td>\n<td>3 bases</td>\n<td>Average</td>\n<td>Heavy</td>\n</tr>\n<tr>\n<td>Dragoon</td>\n<td>3 bases</td>\n<td>Average</td>\n<td>Medium</td>\n</tr>\n<tr>\n<td>hussar/uhlan</td>\n<td>4 bases</td>\n<td>Average</td>\n<td>Light</td>\n</tr>\n<tr>\n<td>.</td>\n<td><br /></td>\n<td><br /></td>\n<td><br /></td>\n</tr>\n<tr>\n<td>Chev/horse Guards</td>\n<td>3 bases</td>\n<td>Veteran</td>\n<td>Heavy</td>\n</tr>\n<tr>\n<td>Dragoon/uhlan Guards</td>\n<td>3 bases</td>\n<td>Veteran</td>\n<td>Medium</td>\n</tr>\n<tr>\n<td>Guard Hussar/Cossack</td>\n<td>3 bases</td>\n<td>Veteran</td>\n<td>Light</td>\n</tr>\n</tbody>\n</table>\n<table border=\"0\" width=\"600\">\n<tbody>\n<tr>\n<td bgcolor=\"ddddd0\"><strong>Infantry Divisions</strong></td>\n<td bgcolor=\"ddddd0\"><strong>Infantry regiments</strong></td>\n<td bgcolor=\"ddddd0\"><strong>Cavalry</strong></td>\n<td bgcolor=\"ddddd0\"><strong>Artillery</strong></td>\n</tr>\n<tr>\n<td>1807</td>\n<td>1 grenadier, 1 jager, 4 musketeer</td>\n<td>1 brigade medium</td>\n<td>1 Heavy foot, 2 medium foot</td>\n</tr>\n<tr>\n<td>1812 Line</td>\n<td>4 musketeer, 2 jager</td>\n<td>none</td>\n<td>1 heavy foot, 2 medium foot</td>\n</tr>\n<tr>\n<td>1813 Line</td>\n<td>3 or 4 musketeer, 1 or 2 jager</td>\n<td>none</td>\n<td>none</td>\n</tr>\n</tbody>\n</table>\n<table border=\"0\" width=\"600\">\n<tbody>\n<tr>\n<td bgcolor=\"ddddd0\"><strong>Cavalry Divisions</strong></td>\n<td bgcolor=\"ddddd0\"><strong>Cavalry Brigades</strong></td>\n<td bgcolor=\"ddddd0\"><strong>Artillery</strong></td>\n</tr>\n<tr>\n<td>1812 Cuirassier</td>\n<td>2 or 3 cuirassier</td>\n<td>none</td>\n</tr>\n<tr>\n<td>1812 Dragoon</td>\n<td>2 dragoon, 1 hussar/uhlan</td>\n<td>1 medium horse</td>\n</tr>\n</tbody>\n</table>\n<table border=\"0\" width=\"600\">\n<tbody>\n<tr>\n<td bgcolor=\"ddddd0\"><strong>Infantry Corps</strong></td>\n<td bgcolor=\"ddddd0\"><strong>Infantry</strong></td>\n<td bgcolor=\"ddddd0\"><strong>Cavalry</strong></td>\n<td bgcolor=\"ddddd0\"><strong>Artillery</strong></td>\n</tr>\n<tr>\n<td>1812 Infantry</td>\n<td>2 Divisions</td>\n<td>1 brigade light or medium</td>\n<td>1 Heavy foot</td>\n</tr>\n<tr>\n<td>1812 Cavalry</td>\n<td>none</td>\n<td>2 Divisions</td>\n<td>none</td>\n</tr>\n<tr>\n<td>1813 Infantry</td>\n<td>2 Divisions</td>\n<td>none</td>\n<td>1 or 2 heavy foot, 2 medium foot</td>\n</tr>\n</tbody>\n</table>\n</td>\n</tr>\n</tbody>\n</table>','','<iframe width=\"640\" height=\"480\" src=\"http://www.youtube.com/embed/WxxGJ-Y2530?rel=0&autoplay=1\" frameborder=\"0\" allowfullscreen></iframe>',6),(13,'Saxony',1806,'C','D','P','<h1>Saxony 1806</h1>\n<p><span style=\"font-size: small;\">For the details of the Saxon army during the Jena- Auerstadt campaign in 1806, see the details on the Prussian army of 1806.</span></p>\n<p><span style=\"font-size: small;\">Organisation in the field is somewhat different to the Prussian units, as the smaller regiments were brigaded together to form large (4-5 battalion) brigade groups.</span></p>\n<p><span style=\"font-size: small;\">So the Saxon forces have a smaller number of larger manoevre units compared to the main Prussian force.</span></p>\n<p><br /><span style=\"font-size: small;\">The cavalry is excellent though, so should be rated as Veteran for scenario purposes. Unfortunately, the cavalry is distributed as a Divisional asset, so their use on the battlefield is limited to Divisional support operations. An independant Cavalry Division would be an excellent organisational change to make .. and indeed this is what the French did after they took over command of the Saxon forces after the Jena - Auerstadt campaign.</span></p>\n<p><span style=\"font-size: small;\">Skirmish capability is debatable ... some sources will show that the Prussian/Saxon army had some light troops, others will argue that due to command doctrine, they were never used in the field for the purpose they were trained for. Should leave that up to the players to determine, depending on the scenario ...&nbsp; Historically no, but assuming \'player command\' of a Saxon force, then maybe yes.<br /></span></p>\n<p><span style=\"font-size: small;\">One additional note is that the Prussian / Saxon forces still made use of battalion guns during this period ... so brigades may add a battalion gun model at the expense of a light field battery&nbsp; (1 field battery can be substituted for 2 battalion guns).</span></p>\n<p><span style=\"font-size: small;\">Battalion guns give an extra +1 fire factor to the brigade if deployed. Heavy rains may negate this battalion gun advantage though, as the rain event card denotes that fire bonuses for line formation and batalion guns can no longer be used for the remainder of the turn.</span></p>','','<iframe width=\"640\" height=\"480\" src=\"http://www.youtube.com/embed/c10agRRVBgY?rel=0&autoplay=1\" frameborder=\"0\" allowfullscreen></iframe>',6),(26,'France',1809,'E','C','F','<h1>France 1809</h1>\n<p><span style=\"font-size: small;\">Early French armies were composed of an uneasy mixture of trained veteran troops and militia levies. Eventually however, their new training system began to mass-produce excellent soldiers who, even though green, usually fought well from the outset. This kept the army on its feet long after many old soldiers had retired or died in action. The Imperial Guard was an elite formation headed by top grade veteran officers. Its size was smaller than its reputation and players should resist the temptation to build too many guard units. This list also includes Polish, Italian and Swiss troops in French service as well as German Duchy troops after 1808. Line artillery is veteran and guard artillery is elite grade morale. </span></p>\n<p><span style=\"font-size: small;\"> During the Early campaigns in Germany and Italy, the French Army used the \"division group\" system. By the 1805 campaign, the Corps system had been fully implemented. French command categories are: 1792-1795 = Cumbersome, 1796-1800 = Functional, 1805-1815 = Efficient. French system of formation change was used throughout the wars. </span></p>\n<p><span style=\"font-size: small;\">Recommended artillery ratios for Central/Eastern Europe: </span></p>\n<p><span style=\"font-size: small;\">1800 - 1806 = 1 battery per 12 bases. </span></p>\n<p><span style=\"font-size: small;\">1807 - 1809 = 1 battery per 8 bases. </span></p>\n<p><span style=\"font-size: small;\">1812 = 1 battery per 5 bases. </span></p>\n<p><span style=\"font-size: small;\">Recommended artillery ratios for the Peninsula: 1 battery per 10 bases. </span></p>\n<table border=\"0\" width=\"600\">\n<tbody>\n<tr>\n<td bgcolor=\"ddddd0\"><strong>Infantry regiments</strong></td>\n<td bgcolor=\"ddddd0\"><strong>Size</strong></td>\n<td bgcolor=\"ddddd0\"><strong>Grade</strong></td>\n<td bgcolor=\"ddddd0\"><strong>Available skirmishers</strong></td>\n</tr>\n<tr>\n<td>\"A\" Line/Light (1809)</td>\n<td>4 bases</td>\n<td>Veteran</td>\n<td>All Good</td>\n</tr>\n<tr>\n<td>\"B\" Line (1809)</td>\n<td>4 bases</td>\n<td>Green/Average</td>\n<td>one good</td>\n</tr>\n<tr>\n<td>Other Light</td>\n<td>3 bases</td>\n<td>Average</td>\n<td>All Good</td>\n</tr>\n<tr>\n<td><br /></td>\n<td><br /></td>\n<td><br /></td>\n<td><br /></td>\n</tr>\n<tr>\n<td>Old Guard</td>\n<td>3 bases</td>\n<td>Elite</td>\n<td>All Excellent</td>\n</tr>\n<tr>\n<td>Middle Guard</td>\n<td>3 bases</td>\n<td>Veteran</td>\n<td>All Excellent</td>\n</tr>\n<tr>\n<td>Young Guard</td>\n<td>3 bases</td>\n<td>Average</td>\n<td>All Good</td>\n</tr>\n</tbody>\n</table>\n<table border=\"0\" width=\"600\">\n<tbody>\n<tr>\n<td bgcolor=\"ddddd0\"><strong>Cavalry brigades</strong></td>\n<td bgcolor=\"ddddd0\"><strong>Size</strong></td>\n<td bgcolor=\"ddddd0\"><strong>Grade</strong></td>\n<td bgcolor=\"ddddd0\"><strong>Type</strong></td>\n</tr>\n<tr>\n<td>Cuirassier</td>\n<td>3 bases</td>\n<td>Average</td>\n<td>Armored</td>\n</tr>\n<tr>\n<td>Dragoon/Uhlan</td>\n<td>4 bases</td>\n<td>Average</td>\n<td>Medium</td>\n</tr>\n<tr>\n<td>Hussar/Chasseur</td>\n<td>4 bases</td>\n<td>Average</td>\n<td>Light</td>\n</tr>\n<tr>\n<td>.</td>\n<td><br /></td>\n<td><br /></td>\n<td><br /></td>\n</tr>\n<tr>\n<td><strong>Guard regiments</strong>:</td>\n<td><br /></td>\n<td><br /></td>\n<td><br /></td>\n</tr>\n<tr>\n<td>Guard Chas. Cheval</td>\n<td>4 bases</td>\n<td>Elite</td>\n<td>Medium</td>\n</tr>\n<tr>\n<td>Guard Gren. Cheval</td>\n<td>3 bases</td>\n<td>Elite</td>\n<td>Heavy</td>\n</tr>\n<tr>\n<td>Guard lancers</td>\n<td>3 bases</td>\n<td>Elite</td>\n<td>Medium</td>\n</tr>\n<tr>\n<td>Other Guard Cav.</td>\n<td>3 bases</td>\n<td>Veteran</td>\n<td>Medium</td>\n</tr>\n</tbody>\n</table>\n<table border=\"0\" width=\"600\">\n<tbody>\n<tr>\n<td bgcolor=\"ddddd0\"><strong>Infantry Divisions</strong></td>\n<td bgcolor=\"ddddd0\"><strong>Infantry regiments</strong></td>\n<td bgcolor=\"ddddd0\"><strong>Artillery</strong></td>\n</tr>\n<tr>\n<td>1809</td>\n<td>1 Light, 4 Line</td>\n<td>1 medium foot, 1 Light foot</td>\n</tr>\n<tr>\n<td>.</td>\n<td><br /></td>\n<td><br /></td>\n</tr>\n<tr>\n<td>1805 - 1808 (Old Guard)</td>\n<td>1 Chas., 1 Gren.</td>\n<td><br /></td>\n</tr>\n</tbody>\n</table>\n<table border=\"0\" width=\"600\">\n<tbody>\n<tr>\n<td bgcolor=\"ddddd0\"><strong>Infantry Corps</strong></td>\n<td bgcolor=\"ddddd0\"><strong>Infantry Divisions</strong></td>\n<td bgcolor=\"ddddd0\"><strong>Cavalry</strong></td>\n<td bgcolor=\"ddddd0\"><strong>Artillery</strong></td>\n</tr>\n<tr>\n<td>1809</td>\n<td>3 or 4 Line</td>\n<td>1 brigade light</td>\n<td>2 heavy foot</td>\n</tr>\n</tbody>\n</table>\n<p>&nbsp;</p>','','<iframe width=\"640\" height=\"480\" src=\"http://www.youtube.com/embed/zOclQKtBBWg?rel=0&autoplay=1\" frameborder=\"0\" allowfullscreen></iframe>',6),(27,'Turkey',1800,'C','R','M','<h1>Turkish Army</h1>\n<p><span style=\"font-size: small;\">The Turkish Army of this era was riddled with conflicting 						factions, some of whom supported the reforms of Selim III and some of whom were 						religious fanatics set against both Selim and his attempted improvements. The 						quality of the \"reformers\" such as the Nizam-I-Jedid tended to be better than 						that of the old style troops such as the Janissaries.</span></p>\n<p><span style=\"font-size: small;\">We have simulated the disorderly formations with which most 						of the Ottoman Army operated by artificially \"stunting\" some unit sizes and 						grades. Ottoman Turkish formations should not receive the assault bonus for 						being in line formation and cannot form square or echelon. Much of their 						artillery (over 60%) was composed of antique cannon, although the gunners 						themselves were of average or better quality. Turkish command category is 						Cumbersome. The French system of formation change is usable throughout, due 						either to French training, or the lack of any system to begin with.</span></p>\n<table border=\"0\" cellspacing=\"0\" cellpadding=\"0\" width=\"98%\">\n<tbody>\n<tr>\n<td>\n<table border=\"0\" width=\"600\">\n<tbody>\n<tr>\n<td bgcolor=\"ddddd0\"><strong>Infantry regiments</strong></td>\n<td bgcolor=\"ddddd0\"><strong>Size</strong></td>\n<td bgcolor=\"ddddd0\"><strong>Grade</strong></td>\n<td bgcolor=\"ddddd0\"><strong>Available skirmishers</strong></td>\n<td bgcolor=\"ddddd0\"><strong>Power base</strong></td>\n</tr>\n<tr>\n<td>Solaks (Sultan\'s Guards)</td>\n<td>2 bases</td>\n<td>Veteran</td>\n<td>-</td>\n<td>Turkey</td>\n</tr>\n<tr>\n<td>Janissaries</td>\n<td>3 bases</td>\n<td>Green</td>\n<td>one poor</td>\n<td>All</td>\n</tr>\n<tr>\n<td>Nizam-I-Jedid</td>\n<td>5 bases</td>\n<td>Average</td>\n<td>one poor</td>\n<td>Turkey</td>\n</tr>\n<tr>\n<td>Sekhans</td>\n<td>3 bases</td>\n<td>Green</td>\n<td>-</td>\n<td>Balkans</td>\n</tr>\n<tr>\n<td>Derbents (Martolos)</td>\n<td>1 bases</td>\n<td>Average</td>\n<td>All Adequate</td>\n<td>Greece</td>\n</tr>\n<tr>\n<td>Fellahin</td>\n<td>3 bases</td>\n<td>Militia</td>\n<td>-</td>\n<td>Egypt</td>\n</tr>\n</tbody>\n</table>\n<table border=\"0\" width=\"600\">\n<tbody>\n<tr>\n<td bgcolor=\"ddddd0\"><strong>Cavalry brigades</strong></td>\n<td bgcolor=\"ddddd0\"><strong>Size</strong></td>\n<td bgcolor=\"ddddd0\"><strong>Grade</strong></td>\n<td bgcolor=\"ddddd0\"><strong>Type</strong></td>\n<td bgcolor=\"ddddd0\"><strong>Power base</strong></td>\n</tr>\n<tr>\n<td>Guard</td>\n<td>3 bases</td>\n<td>Veteran</td>\n<td>Heavy</td>\n<td>Turkey</td>\n</tr>\n<tr>\n<td>Suvarileri</td>\n<td>4 bases</td>\n<td>Average</td>\n<td>Medium</td>\n<td>Turkey</td>\n</tr>\n<tr>\n<td>Sipahis</td>\n<td>2 bases</td>\n<td>Green</td>\n<td>Light or Medium</td>\n<td>Balkans</td>\n</tr>\n<tr>\n<td>Mamluks</td>\n<td>5 bases</td>\n<td>Average</td>\n<td>Medium</td>\n<td>Egypt</td>\n</tr>\n<tr>\n<td>Djellis</td>\n<td>1 base</td>\n<td>Veteran</td>\n<td>Light</td>\n<td>Balkans</td>\n</tr>\n<tr>\n<td>Yoruk</td>\n<td>3 bases</td>\n<td>Green</td>\n<td>Light</td>\n<td>Balkans</td>\n</tr>\n<tr>\n<td>Arabs</td>\n<td>1 base</td>\n<td>Militia</td>\n<td>Light</td>\n<td>Egypt</td>\n</tr>\n</tbody>\n</table>\n</td>\n</tr>\n</tbody>\n</table>','','<iframe width=\"640\" height=\"480\" src=\"http://www.youtube.com/embed/kPsa3KmlCSs?rel=0&autoplay=1\" frameborder=\"0\" allowfullscreen></iframe>',6),(28,'Bavaria',1809,'E','C','F','<p>Allied to France, operating as an integral part of the French Corps system.</p>','','<iframe width=\"640\" height=\"480\" src=\"http://www.youtube.com/embed/vLQETb42RiU?rel=0&autoplay=1\" frameborder=\"0\" allowfullscreen></iframe>',6),(29,'Baden - Wurttemburg',1809,'F','C','P','<p>Baden troops in French service</p>','','<iframe width=\"640\" height=\"480\" src=\"http://www.youtube.com/embed/70PAQ4-OTXc?rel=0&autoplay=1\" frameborder=\"0\" allowfullscreen></iframe>',6),(30,'Britain',1810,'F','D','','','','<iframe width=\"640\" height=\"480\" src=\"http://www.youtube.com/embed/1XPHL4Q86t4?rel=0&autoplay=1\" frameborder=\"0\" allowfullscreen></iframe>',6),(31,'Scotland',1815,'E','C','','','','<iframe width=\"853\" height=\"480\" src=\"http://www.youtube.com/embed/PSH0eRKq1lE?rel=0&autoplay=1\" frameborder=\"0\" allowfullscreen></iframe>',6),(32,'Poland',1809,'E','C','F','','','<iframe width=\"640\" height=\"480\" src=\"http://www.youtube.com/embed/r9D5xPMugrU?rel=0&autoplay=1\" frameborder=\"0\" allowfullscreen></iframe>',6),(33,'Spain',1810,'U','R','F','','','<iframe width=\"640\" height=\"480\" src=\"http://www.youtube.com/embed/x6dZqNAsw0w?rel=0&autoplay=1\" frameborder=\"0\" allowfullscreen></iframe>',6),(37,'a nonsense nation',0,'C','C','','','','',6);
/*!40000 ALTER TABLE `nation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scenario`
--

DROP TABLE IF EXISTS `scenario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scenario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `scenario` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `descr` text COLLATE utf8_unicode_ci NOT NULL,
  `year` varchar(4) COLLATE utf8_unicode_ci NOT NULL,
  `start_time` datetime NOT NULL,
  `turn_length` int(11) NOT NULL,
  `overall_map` text COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scenario`
--

LOCK TABLES `scenario` WRITE;
/*!40000 ALTER TABLE `scenario` DISABLE KEYS */;
INSERT INTO `scenario` VALUES (1,'Jena Auerstadt','<h2><span id=\"Overview\" class=\"mw-headline\">Overview</span></h2>\n<p>The battles began when elements of Napoleon\'s main force encountered  Hohenlohe\'s troops near Jena. Initially only 48,000 strong, the Emperor  took advantage of his carefully planned and flexible dispositions to  rapidly build up a crushing superiority. The Prussians were slow to  grasp the situation, and slower still to react. Before Ruchel\'s 15,000  men could arrive from <a title=\"Weimar\" href=\"http://en.wikipedia.org/wiki/Weimar\">Weimar</a>,  Hohenlohe\'s force was routed. Nevertheless, it was a fierce battle, and  Napoleon mistakenly believed that he had faced the main body of the  Prussian army.</p>\n<p>Further north at <a title=\"Auerstedt\" href=\"http://en.wikipedia.org/wiki/Auerstedt\">Auerstedt</a>,  both Davout and Bernadotte received orders to come to Napoleon\'s aid.  Davout attempted to comply via Ekartsberg; Bernadotte, via Dornburg.  Davout\'s route south, however, was blocked by the Prussian main force of  55,000 men, including the Prussian King, the Duke of Brunswick and  Field Marshals <a title=\"Wichard Joachim Heinrich von M&ouml;llendorf\" href=\"http://en.wikipedia.org/wiki/Wichard_Joachim_Heinrich_von_M%C3%B6llendorf\">von M&ouml;llendorf</a> and <a class=\"mw-redirect\" title=\"Friedrich Adolf Graf von Kalckreuth\" href=\"http://en.wikipedia.org/wiki/Friedrich_Adolf_Graf_von_Kalckreuth\">von Kalckreuth</a>.  A savage battle ensued. Although outnumbered two to one, Davout\'s  superbly trained and disciplined III Corps endured repeated attacks  before eventually taking the offensive and putting the Prussians to  flight. Though in sight of the battle, Bernadotte took no steps to come  to Davout\'s aid, for which he was later censured by Napoleon.</p>\n<div class=\"thumb tright\">\n<div class=\"thumbinner\" style=\"width: 302px;\"><a class=\"image\" href=\"http://en.wikipedia.org/wiki/File:Battle_of_Jena-Auerstedt_-_Map01.jpg\"><img class=\"thumbimage\" src=\"http://upload.wikimedia.org/wikipedia/commons/thumb/9/9f/Battle_of_Jena-Auerstedt_-_Map01.jpg/300px-Battle_of_Jena-Auerstedt_-_Map01.jpg\" alt=\"\" width=\"751\" height=\"575\" /></a>\n<div class=\"thumbcaption\">\n<div class=\"magnify\"><a class=\"internal\" title=\"Enlarge\" href=\"http://en.wikipedia.org/wiki/File:Battle_of_Jena-Auerstedt_-_Map01.jpg\"><img src=\"http://bits.wikimedia.org/skins-1.18/common/images/magnify-clip.png\" alt=\"\" width=\"15\" height=\"11\" /></a></div>\nBattles of Jena and Auerstedt</div>\n</div>\n</div>\n<h2><span id=\"Battle_of_Jena\" class=\"mw-headline\">Battle of Jena</span></h2>\n<div class=\"thumb tright\">\n<div class=\"thumbinner\" style=\"width: 302px;\"><a class=\"image\" href=\"http://en.wikipedia.org/wiki/File:Battle_of_Jena-Auerstedt_-_Map02.jpg\"></a></div>\n</div>\n<h3><span class=\"editsection\">&nbsp;</span><span id=\"Planning\" class=\"mw-headline\">Planning</span></h3>\n<p>Prussia\'s main weakness in 1806 was a very weak high command  structure that included command positions being held by multiple  officers. One such example is the position of Chief of Staff, held by  three different officers, General <a title=\"Karl Ludwig von Phull\" href=\"http://en.wikipedia.org/wiki/Karl_Ludwig_von_Phull\">Phull</a> (or <a title=\"Pfuel\" href=\"http://en.wikipedia.org/wiki/Pfuel\">Pfuel</a>), Colonel <a title=\"Gerhard von Scharnhorst\" href=\"http://en.wikipedia.org/wiki/Gerhard_von_Scharnhorst\">Gerhard von Scharnhorst</a> and Colonel Rudolf Massenbach. This confusing system led to delays and  complexities that resulted in over a month\'s delay before the final  order of battle was prepared. The Prussian army was divided into three  armies drawn from across Prussia. Another obstacle facing the Prussians  was the creation of a unified plan of battle. Five main plans emerged  for discussion; however, protracted planning and deliberating shifted  the initiative to the French. Thus, the Prussian plans became mere  reactions to Napoleon\'s movements.</p>\n<p>Although Prussia had begun its mobilization almost a month before  France, Napoleon had kept a high state of readiness after the Russian  refusal to accept the peace from the Third Coalition. Napoleon conceived  a plan to force Prussia into a decisive battle, like <a title=\"Battle of Austerlitz\" href=\"http://en.wikipedia.org/wiki/Battle_of_Austerlitz\">Austerlitz</a>,  and pre-empt the Prussian offensive. Napoleon had a major portion of  his Grande Arm&eacute;e in position in present day Baden-W&uuml;rttemberg in  southwest Germany, and thus decided on a northeast advance into <a title=\"Saxony\" href=\"http://en.wikipedia.org/wiki/Saxony\">Saxony</a> and onto <a title=\"Berlin\" href=\"http://en.wikipedia.org/wiki/Berlin\">Berlin</a>.</p>\n<p>&nbsp;</p>\n<h3><span id=\"The_Battle_of_Jena\" class=\"mw-headline\">The Battle of Jena</span></h3>\n<div class=\"thumb tright\">\n<div class=\"thumbinner\" style=\"width: 302px;\"><a class=\"image\" href=\"http://en.wikipedia.org/wiki/File:Battle_of_Jena_map.jpg\"><img class=\"thumbimage\" src=\"http://upload.wikimedia.org/wikipedia/commons/thumb/e/ec/Battle_of_Jena_map.jpg/300px-Battle_of_Jena_map.jpg\" alt=\"\" width=\"787\" height=\"545\" /></a>\n<div class=\"thumbcaption\">\n<div class=\"magnify\"><a class=\"internal\" title=\"Enlarge\" href=\"http://en.wikipedia.org/wiki/File:Battle_of_Jena_map.jpg\"><img src=\"http://bits.wikimedia.org/skins-1.18/common/images/magnify-clip.png\" alt=\"\" width=\"15\" height=\"11\" /></a></div>\nDetailed map of the Battle of Jena</div>\n</div>\n</div>\n<p>The battle commenced on the morning of 14 October, 1806, on the  grassy fields near Jena. The first movements of the French Army were  attacks on either flank of the Prussian lines. This gave the supporting  armies (making up the central attack) time to get into position. These  skirmishes had little decisive success save for a breakthrough by the  French General Saint-Hilaire who attacked and isolated the Prussian left  flank.</p>\n<p>At this time, French Marshal <a title=\"Michel Ney\" href=\"http://en.wikipedia.org/wiki/Michel_Ney\">Michel Ney</a> had completed his maneuvers and had taken up position as ordered by  Napoleon. However, once in position Ney decided to attack the Prussian  line despite having no orders to do so. This proved to be an almost  disastrous move. Ney\'s initial assault was a success, but he found  himself overextended and under heavy fire from Prussian artillery.  Recognizing this distressed salient, the Prussian general ordered a  counter attack and enveloped Ney\'s forces; Ney formed them into a square  to protect all their flanks. Napoleon recognized the situation Ney was  in and ordered Marshal <a title=\"Jean Lannes\" href=\"http://en.wikipedia.org/wiki/Jean_Lannes\">Lannes</a> to shift from the center of attack to help Ney. This action would leave  the French center weak. However, Napoleon deployed his reserve Imperial  Guard units to hold the French center until Ney could be rescued. This  adaptability was one of Napoleon\'s greatest strengths. He kept his  Imperial Guard under his direct command, and could order them to take  positions depending on the situation that the battle presented him. This  rescue worked and Ney\'s unit was able to retreat from the battle.  Although the French were in a troubling situation at this moment, the  Prussian commanders did not take the incentive to push at the French  weaknesses. This would later be considered their undoing. The inactivity  of the Prussian infantry left them open to artillery and light infantry  fire. One Prussian general later wrote \"the area around the entrance of  the village was the scene of the most terrible blood-letting and  slaughter\".</p>\n<p>It was at this time around one p.m. that Napoleon decided to make the  decisive move. He ordered his flanks to push hard and try to break  through the Prussian flanks and encircle the main center army, while the  French center would try to crush the Prussian center. The attacks on  the flanks proved to be a success and caused many of the Prussian  divisions on the flanks to flee the battlefield. With its flanks broken,  the Prussian army was forced to withdraw and Napoleon had won another  battle. In total the Prussian army suffered 10,000 casualties, 15,000  prisoners of war taken and had lost 150 artillery guns.</p>\n<h2><span id=\"Battle_of_Auerstedt\" class=\"mw-headline\">Battle of Auerstedt</span></h2>\n<div class=\"thumb tright\">\n<div class=\"thumbinner\" style=\"width: 302px;\"><a class=\"image\" href=\"http://en.wikipedia.org/wiki/File:Battle_of_Jena-Auerstedt_-_Map03.jpg\"></a></div>\n</div>\n<p>General <a title=\"Charles-&Eacute;tienne Gudin de La Sablonni&egrave;re\" href=\"http://en.wikipedia.org/wiki/Charles-%C3%89tienne_Gudin_de_La_Sablonni%C3%A8re\">Etienne Gudin\'s</a> French troops were on the move from Naumburg before 6:30 a.m. By 7 a.m. the 1st <a class=\"mw-redirect\" title=\"Chasseurs\" href=\"http://en.wikipedia.org/wiki/Chasseurs\">Chasseurs</a> were stopped cold in their tracks outside of <a class=\"mw-redirect\" title=\"Poppel\" href=\"http://en.wikipedia.org/wiki/Poppel\">Poppel</a> by Prussian cavalry and artillery. There was a heavy fog that had  lifted just as they approached the village. Once Davout became aware of  the Prussian force, he ordered Gudin to deploy his force at  Hassenhausen.</p>\n<p>The Prussian commander on the field was <a class=\"new\" title=\"Schmettau (page does not exist)\" href=\"http://en.wikipedia.org/w/index.php?title=Schmettau&amp;action=edit&amp;redlink=1\">Schmettau</a>.  His division was actually under orders to proceed down the very road  that Davout was on, to block his advance in the K&ouml;sen Pass. While  Schmettau\'s troops were deploying to attack Hassenhausen, <a title=\"Gebhard Leberecht von Bl&uuml;cher\" href=\"http://en.wikipedia.org/wiki/Gebhard_Leberecht_von_Bl%C3%BCcher\">Bl&uuml;cher</a> arrived with his cavalry and deployed on his left. Together they attacked Gudin\'s troops and pushed them back to the village.</p>\n<p>Wartensleben arrived at 8:30 a.m. with Brunswick, who ordered his  infantry to the left flank and his cavalry to the right. The rest of the  French cavalry arrived at 9 a.m. and was placed on Gudin\'s left.  General <a title=\"Louis Friant\" href=\"http://en.wikipedia.org/wiki/Louis_Friant\">Louis Friant</a>\'s  Division and the 12-pound artillery arrived at 9:30 a.m. and moved in  squares on Gudin\'s right. The advance of the French squares forced  Blucher\'s cavalry back. Seeing no other option available he ordered his  cavalry to attack. At this very moment two of Wartensleben\'s regiments  attacked Hassenhausen.</p>\n<div class=\"thumb tright\">\n<div class=\"thumbinner\" style=\"width: 252px;\"><a class=\"image\" href=\"http://en.wikipedia.org/wiki/File:Battle_of_Auerstaedt_map.jpg\"><img class=\"thumbimage\" src=\"http://upload.wikimedia.org/wikipedia/commons/thumb/3/3d/Battle_of_Auerstaedt_map.jpg/250px-Battle_of_Auerstaedt_map.jpg\" alt=\"\" width=\"732\" height=\"831\" /></a>\n<div class=\"thumbcaption\">\n<div class=\"magnify\"><a class=\"internal\" title=\"Enlarge\" href=\"http://en.wikipedia.org/wiki/File:Battle_of_Auerstaedt_map.jpg\"><img src=\"http://bits.wikimedia.org/skins-1.18/common/images/magnify-clip.png\" alt=\"\" width=\"15\" height=\"11\" /></a></div>\nDetailed map of the Battle of Auerstedt</div>\n</div>\n</div>\n<p>Everything failed: three Prussian cavalry regiments were routed and  the infantry fell back. At this critical point, Brunswick needed to take  drastic action. Shortly before 10 a.m. he ordered a full assault on  Hassenhausen. By 10 a.m. Brunswick was carried from the field mortally  wounded along with Schmettau who was also badly wounded. With the loss  of these two commanders the Prussian command broke down. The Prussian  army was in danger of collapse.</p>\n<p>Oswald\'s infantry and the Prince of Orange, the later <a title=\"William I of the Netherlands\" href=\"http://en.wikipedia.org/wiki/William_I_of_the_Netherlands\">William I of the Netherlands</a>,  arrived about 10:30 a.m., and the King made his only decision of the  day, to split Orange\'s command in two, half to each flank. On the French  side, <a class=\"mw-redirect\" title=\"Charles Morand\" href=\"http://en.wikipedia.org/wiki/Charles_Morand\">Morand</a>\'s  Division arrived and was sent to secure Gudin\'s left. Davout could now  see that the Prussians were wavering, so at 11 a.m. he ordered his  infantry to counter-attack. By noon Schmettau\'s center was broken and  forced back over the Lissbach Stream, Blucher\'s cavalry was blown, and  Wartensleben was trying to reposition his troops. The Prussians realized  all was now lost and the King ordered a withdrawal.</p>\n<h2><span id=\"Results\" class=\"mw-headline\">Results</span></h2>\n<div class=\"thumb tleft\">\n<div class=\"thumbinner\" style=\"width: 222px;\"><a class=\"image\" href=\"http://en.wikipedia.org/wiki/File:Charles_Meynier_-_Napoleon_in_Berlin.png\"></a></div>\n</div>\n<p>Napoleon initially did not believe that Davout\'s single Corps had  defeated the Prussian main body unaided, and responded to the first  report by saying \"Tell your Marshal he is seeing double\", a reference to  Davout\'s poor eyesight. As matters became clearer, however, the Emperor  was unstinting in his praise. Bernadotte was severely censured and came  within an ace of being dismissed on the spot &mdash; despite being within  earshot of Auerstedt and within marching distance of Jena, he ignored  his orders and did not participate in either battle. Davout was made  Duke of Auerstedt. Lannes, the hero of Jena, was not so honored,  possibly because Napoleon judged it best for reasons of prestige to keep  the glory for himself.</p>\n<p>On the Prussian side, Brunswick was mortally wounded at Auerstedt,  and over the next few days the remaining forces were unable to mount any  serious resistance to Murat\'s ruthless cavalry pursuit. In the <a title=\"Capitulation of Erfurt\" href=\"http://en.wikipedia.org/wiki/Capitulation_of_Erfurt\">Capitulation of Erfurt</a> on 16 October, a large body of Prussian troops became prisoners with hardly a shot being fired. Bernadotte crushed <a class=\"mw-redirect\" title=\"Eugene Frederick Henry, Duke of W&uuml;rttemberg\" href=\"http://en.wikipedia.org/wiki/Eugene_Frederick_Henry,_Duke_of_W%C3%BCrttemberg\">Eugene Frederick Henry, Duke of W&uuml;rttemberg</a>\'s Prussian Reserve on the 17th in the <a title=\"Battle of Halle\" href=\"http://en.wikipedia.org/wiki/Battle_of_Halle\">Battle of Halle</a>. Davout led his exhausted III Corps into Berlin on 25 October. Hohenlohe\'s force surrendered on 28 October after the <a title=\"Battle of Prenzlau\" href=\"http://en.wikipedia.org/wiki/Battle_of_Prenzlau\">Battle of Prenzlau</a>, followed soon after by the <a title=\"Capitulation of Pasewalk\" href=\"http://en.wikipedia.org/wiki/Capitulation_of_Pasewalk\">Capitulation of Pasewalk</a>. The French ran down and captured several small Prussian columns at <a title=\"Boldekow\" href=\"http://en.wikipedia.org/wiki/Boldekow\">Boldekow</a> on 30 October, <a title=\"Anklam\" href=\"http://en.wikipedia.org/wiki/Anklam\">Anklam</a> on 1 November, <a title=\"Wolgast\" href=\"http://en.wikipedia.org/wiki/Wolgast\">Wolgast</a> on 3 November, and <a title=\"Wismar\" href=\"http://en.wikipedia.org/wiki/Wismar\">Wismar</a> on 5 November. The corps of Bl&uuml;cher and Winning were destroyed at the <a title=\"Battle of L&uuml;beck\" href=\"http://en.wikipedia.org/wiki/Battle_of_L%C3%BCbeck\">Battle of L&uuml;beck</a> on 6 and 7 November. The <a title=\"Siege of Magdeburg (1806)\" href=\"http://en.wikipedia.org/wiki/Siege_of_Magdeburg_%281806%29\">Siege of Magdeburg</a> ended on 11 November with Ney\'s capture of the fortress. Isolated  Prussian resistance remained, but Napoleon\'s primary foe was now <a title=\"Russia\" href=\"http://en.wikipedia.org/wiki/Russia\">Russia</a>, and the <a title=\"Battle of Eylau\" href=\"http://en.wikipedia.org/wiki/Battle_of_Eylau\">Battle of Eylau</a> awaited.</p>','1806','0000-00-00 00:00:00',40,'<iframe width=\"800\" height=\"600\" frameborder=\"1\" scrolling=\"no\" marginheight=\"0\" marginwidth=\"0\" src=\"http://maps.google.com/?ie=UTF8&amp;hq=&amp;hnear=Adelaide+South+Australia,+Australia&amp;ll=51.007274,11.618042&amp;spn=0.26528,0.727158&amp;t=p&amp;z=11&amp;vpsrc=6&amp;output=embed\"></iframe><br /><small><a href=\"http://maps.google.com/?ie=UTF8&amp;hq=&amp;hnear=Adelaide+South+Australia,+Australia&amp;ll=51.007274,11.618042&amp;spn=0.26528,0.727158&amp;t=p&amp;z=11&amp;vpsrc=6&amp;source=embed\" style=\"color:#0000FF;text-align:left\">View Larger Map</a></small>',6);
/*!40000 ALTER TABLE `scenario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scenario_card`
--

DROP TABLE IF EXISTS `scenario_card`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scenario_card` (
  `scenario_id` int(11) NOT NULL,
  `card_id` int(11) NOT NULL,
  `count` int(11) NOT NULL,
  UNIQUE KEY `scenario_id` (`scenario_id`,`card_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scenario_card`
--

LOCK TABLES `scenario_card` WRITE;
/*!40000 ALTER TABLE `scenario_card` DISABLE KEYS */;
/*!40000 ALTER TABLE `scenario_card` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scenario_nation`
--

DROP TABLE IF EXISTS `scenario_nation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scenario_nation` (
  `scenario_id` int(11) NOT NULL,
  `nation_id` int(11) NOT NULL,
  `blinds` int(11) NOT NULL,
  `primes` int(11) NOT NULL,
  `primes_title` int(11) NOT NULL,
  `rallies` int(11) NOT NULL,
  `player_briefing` int(11) NOT NULL,
  `player_map` int(11) NOT NULL,
  PRIMARY KEY (`scenario_id`,`nation_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scenario_nation`
--

LOCK TABLES `scenario_nation` WRITE;
/*!40000 ALTER TABLE `scenario_nation` DISABLE KEYS */;
/*!40000 ALTER TABLE `scenario_nation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scenario_unit`
--

DROP TABLE IF EXISTS `scenario_unit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scenario_unit` (
  `scenario_id` int(11) NOT NULL,
  `unit_id` int(11) NOT NULL,
  `arrival` int(11) NOT NULL,
  `notes` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`scenario_id`,`unit_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scenario_unit`
--

LOCK TABLES `scenario_unit` WRITE;
/*!40000 ALTER TABLE `scenario_unit` DISABLE KEYS */;
/*!40000 ALTER TABLE `scenario_unit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `skirmish_rating`
--

DROP TABLE IF EXISTS `skirmish_rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `skirmish_rating` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `range` int(11) NOT NULL,
  `chance_to_hit` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skirmish_rating`
--

LOCK TABLES `skirmish_rating` WRITE;
/*!40000 ALTER TABLE `skirmish_rating` DISABLE KEYS */;
INSERT INTO `skirmish_rating` VALUES (1,'Excellent',3,7),(2,'Good',2,8),(3,'Adequate',2,9),(4,'Poor',1,10),(9,'None',0,0);
/*!40000 ALTER TABLE `skirmish_rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `troop_grades`
--

DROP TABLE IF EXISTS `troop_grades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `troop_grades` (
  `troop_grade` enum('E','V','R','G','M') COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `descr` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`troop_grade`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `troop_grades`
--

LOCK TABLES `troop_grades` WRITE;
/*!40000 ALTER TABLE `troop_grades` DISABLE KEYS */;
INSERT INTO `troop_grades` VALUES ('E','Elite',''),('V','Veteran',''),('R','Regular',''),('G','Green',''),('M','Militia','');
/*!40000 ALTER TABLE `troop_grades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unit`
--

DROP TABLE IF EXISTS `unit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nation_id` int(11) NOT NULL,
  `name` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `unit_type` int(11) NOT NULL,
  `leader` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `portrait` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `command_type` enum('E','F','C','U') COLLATE utf8_unicode_ci NOT NULL,
  `year` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `artillery` text COLLATE utf8_unicode_ci NOT NULL,
  `cavalry` text COLLATE utf8_unicode_ci NOT NULL,
  `infantry` text COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `num_bases` int(11) NOT NULL,
  `troop_grade` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `skirmishers` int(11) NOT NULL,
  `skirmish_rating` int(11) NOT NULL,
  `link` varchar(512) COLLATE utf8_unicode_ci NOT NULL,
  `photo` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `notes` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unit`
--

LOCK TABLES `unit` WRITE;
/*!40000 ALTER TABLE `unit` DISABLE KEYS */;
INSERT INTO `unit` VALUES (2,1,'108e Ligne',1,'Morand','','E',1806,3,'','','Line Infantry',6,4,'V',1,3,'','',''),(3,1,'III Corps - 1806',4,'Davout','','E',1809,1,'','','',6,0,'R',0,3,'','',''),(1,0,'',0,'','','F',0,1,'','','',6,0,'R',0,0,'','',''),(4,5,'IR17',1,'','','F',1809,1,'','','Line',6,5,'R',0,9,'','',''),(6,13,'Saxon Adv Guard',3,'Prinz Ferdinand','06342-1164_Prinz_Louis_Ferdinand_von_Preussen.jpeg','C',1806,16,'Medium Foot\nMedium Horse','Hussar Brigade','Line Brigade\nLight Infantry',6,12,'G',1,4,'http://15mm-madness.blogspot.com/2011/11/saxon-advanced-guard-division-jena-1806.html','ede82-2011-11-07_13-18-03.jpg',''),(25,37,'nonsense corps',4,'','','C',1811,1,'','','',7,0,'E',0,3,'','',''),(21,3,'IR 40 von Schimonsky',1,'','','C',1806,14,'','','Line',6,3,'G',0,9,'http://15mm-madness.blogspot.com/2011/11/prussian-ir-40-von-schimonsky-jena.html','cb8af-2011-11-09_09-15-19.jpg',''),(7,13,'von Trützchler Hussars',2,'','','C',1806,6,'','Hussars','',6,3,'V',0,9,'http://15mm-madness.blogspot.com/2011/11/saxon-von-trutzchler-hussars-jena-1806.html','ee283-2011-11-07_13-06-21.jpg',''),(8,13,'Brigade Belvilaqua',1,'','','C',1806,6,'','','Line',6,4,'G',0,9,'http://15mm-madness.blogspot.com/2011/11/infantry-brigade-belvilaqua-jena-1806.html','60d63-2011-11-07_13-14-37.jpg',''),(9,13,'Fusiliers von Pelet',1,'','','C',1806,6,'','','Light',6,3,'R',3,4,'http://15mm-madness.blogspot.com/2011/11/fusiliers-von-pelet-jena-1806.html','80475-2011-11-07_13-07-57.jpg',''),(10,3,'Adv Guard Blucher',3,'Blucher','60672-blucher.jpg','C',1806,17,'Light Horse','','',6,14,'G',1,4,'http://15mm-madness.blogspot.com/2011/10/advanced-guard-division-blucher-jena.html','e557e-2011-10-22_10-52-46.jpg','added some notes'),(11,3,'Brigade Von Oswald',1,'','','C',1806,10,'','','',6,0,'R',4,4,'http://15mm-madness.blogspot.com/2011/10/brigade-von-oswald-jena-auerstadt-1806.html','7acb3-2011-10-22_10-44-40.jpg',''),(12,3,'Brigade Von Blucher',2,'Blucher','7f895-blucher.jpg','C',1806,10,'','Hussars','',6,6,'V',0,9,'http://15mm-madness.blogspot.com/2011/10/brigade-von-blucher-jena-auerstadt-1806.html','0160b-2011-10-22_10-39-47.jpg',''),(13,3,'Brigade Von Irwing',2,'','','C',1806,10,'','Dragoons','',6,3,'V',0,9,'http://15mm-madness.blogspot.com/2011/10/brigade-von-irwing-jena-auerstadt-1806.html','0530f-2011-10-22_10-38-38.jpg',''),(14,3,'Prussian 3 Div',3,'von Schmettau','','C',1806,15,'2 Medium Foot','Dragoons\nKuirassiers','3 Line Regiments\n4 Grenadier Bn\n',6,24,'G',0,9,'http://15mm-madness.blogspot.com/2011/11/prussian-3rd-division-von-schmettau.html','71dde-2011-11-09_09-33-42.jpg',''),(15,3,'Prussians at Auerstadt (Nth)',7,'Blucher ','710ae-blucher.jpg','C',1806,17,'','','',6,0,'G',0,4,'','',''),(16,13,'Saxons at Jena (Sth)',7,'','','C',1806,17,'','','',6,0,'G',0,4,'','',''),(17,3,'Jena Prussians',8,'','','C',1806,1,'','','',6,0,'G',0,4,'','',''),(18,3,'IR 35 Prinz Heinrich',1,'','','C',1806,14,'','','Line',6,3,'G',0,9,'http://15mm-madness.blogspot.com/2011/11/prussian-ir-35-prinz-heinrich-jena.html','90a2b-2011-11-09_09-17-51.jpg',''),(19,3,'IR 33 Alvensleben',1,'','','C',1806,14,'','','Line',6,3,'G',0,9,'http://15mm-madness.blogspot.com/2011/11/prussian-ir-33-alvensleben-jena.html','162c8-2011-11-08_14-49-11.jpg',''),(20,3,'IR 28 Malschitzski',1,'','','C',1806,14,'','','Line',6,3,'G',0,9,'http://15mm-madness.blogspot.com/2011/11/ir-28-malschitzski-jena-auerstadt-1806.html','5a392-2011-11-08_14-39-02.jpg',''),(22,3,'Schack und Krafft Grenadiers',1,'','','C',1806,14,'','','Grenadier',6,4,'V',2,4,'http://15mm-madness.blogspot.com/2011/11/schack-und-krafft-grenadiers-jena.html','803ea-2011-11-08_14-44-32.jpg',''),(23,3,'Dragoons von Irving',2,'','','C',1806,14,'','Dragoons','',6,3,'V',0,9,'http://15mm-madness.blogspot.com/2011/11/prussian-dragoons-von-irving-jena.html','e83fa-2011-11-08_14-47-30.jpg',''),(24,3,'Kurassiers von Bunting',2,'','','C',1806,14,'','','',6,3,'V',0,9,'http://15mm-madness.blogspot.com/2011/11/prussian-kurassiers-von-bunting-jena.html','21b58-2011-11-09_09-21-33.jpg','');
/*!40000 ALTER TABLE `unit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unit_type`
--

DROP TABLE IF EXISTS `unit_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unit_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `descr` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unit_type`
--

LOCK TABLES `unit_type` WRITE;
/*!40000 ALTER TABLE `unit_type` DISABLE KEYS */;
INSERT INTO `unit_type` VALUES (1,'Infantry Regiment',''),(2,'Cavalry Regiment',''),(3,'Division',''),(4,'Corps',''),(5,'Artillery',''),(6,'Command / Logistics',''),(7,'Wing','A loose collection of regiments, under command systems where regiments are pooled to form Wings - left, centre, right, advanced guard.'),(8,'Army','Whole Army during a Campaign');
/*!40000 ALTER TABLE `unit_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `last_login` datetime NOT NULL,
  `email` text COLLATE utf8_unicode_ci NOT NULL,
  `admin` enum('T','F') COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (6,'steveoc','ce55e2ec19bea6c740de00ca4ee6d45e','2012-01-07 00:40:28','steveoc64@gmail.com','T'),(7,'another','b32d73e56ec99bc5ec8f83871cde708a','2012-01-05 21:49:57','another@yen.com','F');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2012-01-10 16:37:10
