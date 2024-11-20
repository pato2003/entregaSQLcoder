-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: universidad
-- ------------------------------------------------------
-- Server version	8.0.39

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
-- Table structure for table `alumnos`
--

DROP TABLE IF EXISTS `alumnos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alumnos` (
  `legajo_alumno` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `apellido` varchar(255) NOT NULL,
  `fecha_nac` date NOT NULL,
  PRIMARY KEY (`legajo_alumno`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alumnos`
--

LOCK TABLES `alumnos` WRITE;
/*!40000 ALTER TABLE `alumnos` DISABLE KEYS */;
INSERT INTO `alumnos` VALUES (1,'Damien','Muckleston','1999-09-03'),(2,'Georgiana','Bastie','1975-09-08'),(3,'Dennison','Blazeby','1999-03-08'),(4,'Lane','Lerego','1980-04-14'),(5,'Elberta','Oatley','1949-04-23'),(6,'Sarena','Bofield','1966-06-06'),(7,'Storm','Goldstone','2014-12-08'),(8,'Lisle','Pattinson','2001-04-24'),(9,'Austin','Doumerc','1961-05-05'),(10,'Charlena','Grainge','1945-09-01'),(11,'Gusta','Cossor','2022-12-03'),(12,'Kirby','Sisson','1960-02-01'),(13,'Humfrey','MacIver','1975-08-19'),(14,'Carleton','Lyste','1975-05-18'),(15,'Fergus','Proudlove','1996-05-05'),(16,'Tammi','Stuehmeier','1934-11-08'),(17,'Prudi','Moakler','1949-04-19'),(18,'Daphene','Selbie','2019-02-14'),(19,'Meade','Jaskiewicz','1953-12-14'),(20,'Frederik','Tomczykiewicz','2005-10-23'),(21,'Verne','Luis','2022-07-13'),(22,'Deanne','Witham','1960-12-09'),(23,'Remus','Piesing','1991-12-16'),(24,'Petronella','Peidro','1979-09-05'),(25,'Janifer','Crossfield','1993-11-09'),(26,'Leslie','Adolfsen','1950-12-19'),(27,'Moe','Andrault','1978-07-14'),(28,'Craggie','Simmonett','1994-06-12'),(29,'Fiona','Gronaver','2024-02-07'),(30,'Anitra','Feeney','1944-12-15'),(31,'Patricio','Ferreyra','2003-03-20'),(32,'Victoria','Freires','1999-09-08'),(33,'Martin','Ferraro','1999-07-01');
/*!40000 ALTER TABLE `alumnos` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `log_insertar_alumno` AFTER INSERT ON `alumnos` FOR EACH ROW BEGIN
	INSERT INTO log_alumnos (legajo_alumno, nombre, apellido, fecha_nac, fecha, accion)
    VALUES (NEW.legajo_alumno, NEW.nombre, NEW.apellido, NEW.fecha_nac, NOW(), 'INSERT');

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `aula`
--

DROP TABLE IF EXISTS `aula`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aula` (
  `id_aula` int NOT NULL AUTO_INCREMENT,
  `id_facultad` int NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `ubicacion` varchar(255) NOT NULL,
  `capacidad` int DEFAULT NULL,
  PRIMARY KEY (`id_aula`),
  KEY `aula_ibfk_1` (`id_facultad`),
  CONSTRAINT `aula_ibfk_1` FOREIGN KEY (`id_facultad`) REFERENCES `facultad` (`id_facultad`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aula`
--

LOCK TABLES `aula` WRITE;
/*!40000 ALTER TABLE `aula` DISABLE KEYS */;
INSERT INTO `aula` VALUES (1,6,'Colville Wildrye','3-4-4',34),(2,1,'Rough Canada Goldenrod','2-4-1',29),(3,1,'Yellow Triteleia','1-4-8',23),(4,5,'Eastern Leatherwood','3-2-8',43),(5,2,'Fewleaf Spiderflower','4-4-7',31),(6,5,'Lotus Sweetjuice','4-1-2',31),(7,1,'Sticky Cinquefoil','4-4-6',46),(8,2,'Eranthemum','2-2-6',49),(9,2,'St. Johnswort','4-4-1',47),(10,1,'Musgo','2-1-8',31),(11,1,'Greenfruit Sedge','4-3-4',30),(12,4,'Pyramid Moss','1-4-5',24),(13,6,'Slimflower Lovegrass','4-3-3',46),(14,2,'California Tortula Moss','4-2-1',37),(15,4,'Gypsum Centaury','3-3-9',28),(16,4,'Moutan Peony','1-1-8',49),(17,5,'Cupey De Monte','3-3-1',46),(18,6,'Manena','2-2-1',26),(19,6,'Ngmui','1-1-10',23),(20,1,'Hasse\'s Psorotichia Lichen','3-3-5',27),(21,6,'Western Willow Dock','3-1-7',49),(22,2,'Entodontopsis Moss','1-1-6',36),(23,4,'Blepharipappus','1-4-2',45),(24,6,'Nakedstem Sunray','1-1-9',42),(25,1,'Flowering Quince','3-3-3',49),(26,4,'Yunnan Luculia','4-1-5',41),(27,6,'Largeleaf Wild Indigo','3-3-5',45),(28,4,'Carambola','2-3-3',48),(29,3,'Desert Sweet','2-3-3',35),(30,6,'Kittentail','3-2-6',31);
/*!40000 ALTER TABLE `aula` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `cant_alumnos_facultad_vw`
--

DROP TABLE IF EXISTS `cant_alumnos_facultad_vw`;
/*!50001 DROP VIEW IF EXISTS `cant_alumnos_facultad_vw`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `cant_alumnos_facultad_vw` AS SELECT 
 1 AS `nombre`,
 1 AS `direccion`,
 1 AS `cant_alumnos`,
 1 AS `telefono`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `cant_alumnos_profesores_vw`
--

DROP TABLE IF EXISTS `cant_alumnos_profesores_vw`;
/*!50001 DROP VIEW IF EXISTS `cant_alumnos_profesores_vw`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `cant_alumnos_profesores_vw` AS SELECT 
 1 AS `nombre`,
 1 AS `apellido`,
 1 AS `cant_alumnos`,
 1 AS `email`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `cant_aulas_facultad_vw`
--

DROP TABLE IF EXISTS `cant_aulas_facultad_vw`;
/*!50001 DROP VIEW IF EXISTS `cant_aulas_facultad_vw`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `cant_aulas_facultad_vw` AS SELECT 
 1 AS `nombre`,
 1 AS `direccion`,
 1 AS `cant_aulas`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `cant_materias_alumno_vw`
--

DROP TABLE IF EXISTS `cant_materias_alumno_vw`;
/*!50001 DROP VIEW IF EXISTS `cant_materias_alumno_vw`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `cant_materias_alumno_vw` AS SELECT 
 1 AS `legajo_alumno`,
 1 AS `nombre`,
 1 AS `apellido`,
 1 AS `cant_materias`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `cant_profesores_facultad_vw`
--

DROP TABLE IF EXISTS `cant_profesores_facultad_vw`;
/*!50001 DROP VIEW IF EXISTS `cant_profesores_facultad_vw`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `cant_profesores_facultad_vw` AS SELECT 
 1 AS `nombre`,
 1 AS `direccion`,
 1 AS `cant_profesores`,
 1 AS `telefono`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `facultad`
--

DROP TABLE IF EXISTS `facultad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `facultad` (
  `id_facultad` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `telefono` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id_facultad`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facultad`
--

LOCK TABLES `facultad` WRITE;
/*!40000 ALTER TABLE `facultad` DISABLE KEYS */;
INSERT INTO `facultad` VALUES (1,'Medicina','2 School Junction','+55 272 484 2723'),(2,'Ciencias Exactas','5482 Moulton Crossing','+966 265 428 5430'),(3,'Derecho','86654 Little Fleur Drive','+63 555 913 2324'),(4,'PsicologÃ­a','77283 Oakridge Park','+62 225 823 7123'),(5,'Bellas Artes','9543 Dapin Pass','+380 279 485 2135'),(6,'Veterinaria','15 Pepper Wood Point','+381 751 807 2231');
/*!40000 ALTER TABLE `facultad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `info_facultades_vw`
--

DROP TABLE IF EXISTS `info_facultades_vw`;
/*!50001 DROP VIEW IF EXISTS `info_facultades_vw`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `info_facultades_vw` AS SELECT 
 1 AS `nombre`,
 1 AS `cant_aulas`,
 1 AS `cant_alumnos`,
 1 AS `cant_profesores`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `log_alumnos`
--

DROP TABLE IF EXISTS `log_alumnos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_alumnos` (
  `log_id` int NOT NULL AUTO_INCREMENT,
  `legajo_alumno` int NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `apellido` varchar(255) NOT NULL,
  `fecha_nac` date NOT NULL,
  `fecha` datetime NOT NULL,
  `accion` varchar(50) NOT NULL,
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_alumnos`
--

LOCK TABLES `log_alumnos` WRITE;
/*!40000 ALTER TABLE `log_alumnos` DISABLE KEYS */;
INSERT INTO `log_alumnos` VALUES (1,32,'Victoria','Freires','1999-09-08','2024-10-28 17:24:42','INSERT'),(2,33,'Martin','Ferraro','1999-07-01','2024-11-20 15:49:51','INSERT');
/*!40000 ALTER TABLE `log_alumnos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_profesores`
--

DROP TABLE IF EXISTS `log_profesores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_profesores` (
  `log_id` int NOT NULL AUTO_INCREMENT,
  `legajo_profesor` int NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `apellido` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `fecha` datetime NOT NULL,
  `accion` varchar(50) NOT NULL,
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_profesores`
--

LOCK TABLES `log_profesores` WRITE;
/*!40000 ALTER TABLE `log_profesores` DISABLE KEYS */;
INSERT INTO `log_profesores` VALUES (1,32,'Profesor','Prueba','profesor@prueba.com','2024-11-20 16:02:39','INSERT');
/*!40000 ALTER TABLE `log_profesores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `materias`
--

DROP TABLE IF EXISTS `materias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `materias` (
  `id_materia` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  PRIMARY KEY (`id_materia`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materias`
--

LOCK TABLES `materias` WRITE;
/*!40000 ALTER TABLE `materias` DISABLE KEYS */;
INSERT INTO `materias` VALUES (1,'Psicoanalisis'),(2,'Anatomia'),(3,'Calculo I'),(4,'Calculo II'),(5,'Calculo III'),(6,'Algebra I'),(7,'Algebra II'),(8,'Fisica I'),(9,'Fisica II'),(10,'Fisica III'),(11,'Quimica'),(12,'Matematica I'),(13,'Matematica II');
/*!40000 ALTER TABLE `materias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `materias_alumnos`
--

DROP TABLE IF EXISTS `materias_alumnos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `materias_alumnos` (
  `legajo_alumno` int NOT NULL,
  `id_materia` int NOT NULL,
  KEY `materias_alumnos_ibfk_1` (`id_materia`),
  KEY `materias_alumnos_ibfk_2_idx` (`legajo_alumno`),
  CONSTRAINT `materias_alumnos_ibfk_1` FOREIGN KEY (`id_materia`) REFERENCES `materias` (`id_materia`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `materias_alumnos_ibfk_2` FOREIGN KEY (`legajo_alumno`) REFERENCES `alumnos` (`legajo_alumno`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materias_alumnos`
--

LOCK TABLES `materias_alumnos` WRITE;
/*!40000 ALTER TABLE `materias_alumnos` DISABLE KEYS */;
INSERT INTO `materias_alumnos` VALUES (1,3),(1,9),(1,10),(1,13),(2,2),(2,9),(3,1),(3,4),(3,5),(3,7),(3,8),(3,11),(4,2),(4,5),(4,6),(4,9),(5,6),(5,12),(5,13),(5,12),(6,13),(7,1),(8,9),(9,12),(10,10),(11,11),(12,12),(13,4),(14,4),(15,7),(16,4),(17,4),(18,8),(19,10),(20,4),(21,10),(22,8),(23,7),(24,3),(25,5),(26,8),(27,13),(5,13),(6,8),(7,1),(8,8),(9,11),(10,13),(11,7),(12,1),(13,10),(14,10),(15,10),(16,8),(17,1),(18,8),(19,8),(20,6),(21,1);
/*!40000 ALTER TABLE `materias_alumnos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profesores`
--

DROP TABLE IF EXISTS `profesores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profesores` (
  `legajo_profesor` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `apellido` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`legajo_profesor`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profesores`
--

LOCK TABLES `profesores` WRITE;
/*!40000 ALTER TABLE `profesores` DISABLE KEYS */;
INSERT INTO `profesores` VALUES (1,'Geralda','Tripet','gtripet0@dell.com'),(2,'Bradney','Billany','bbillany1@e-recht24.de'),(3,'Saundra','Tinker','stinker2@csmonitor.com'),(4,'Kim','Broadfield','kbroadfield3@tamu.edu'),(5,'Tobit','Lauderdale','tlauderdale4@state.tx.us'),(6,'Martyn','Kamenar','mkamenar5@scribd.com'),(7,'Cosetta','Heffy','cheffy6@baidu.com'),(8,'Robbie','Sword','rsword7@photobucket.com'),(9,'Arel','Cawdron','acawdron8@hostgator.com'),(10,'Elaine','Yarrall','eyarrall9@printfriendly.com'),(11,'Eleonore','Lammas','elammasa@feedburner.com'),(12,'Jerald','Dunthorne','jdunthorneb@furl.net'),(13,'Ailey','Wooster','awoosterc@theglobeandmail.com'),(14,'Cyndie','Gaythorpe','cgaythorped@blogger.com'),(15,'Denyse','Shepstone','dshepstonee@networkadvertising.org'),(16,'Fitzgerald','Elles','fellesf@about.com'),(17,'Hussein','Cossor','hcossorg@wired.com'),(18,'Desiri','Nijs','dnijsh@newsvine.com'),(19,'Hersh','Longmead','hlongmeadi@amazon.co.jp'),(20,'Letty','Wilsey','lwilseyj@shareasale.com'),(21,'Melessa','Corbridge','mcorbridgek@uol.com.br'),(22,'Titus','De Michetti','tdemichettil@reddit.com'),(23,'Faustina','Skittrell','fskittrellm@wunderground.com'),(24,'Geralda','Stickley','gstickleyn@state.gov'),(25,'Julieta','Moreby','jmorebyo@e-recht24.de'),(26,'Marena','O\'Lenechan','molenechanp@shop-pro.jp'),(27,'Essie','Louthe','eloutheq@cdc.gov'),(28,'Jervis','Patnelli','jpatnellir@telegraph.co.uk'),(29,'Anne-marie','Ashfull','aashfulls@google.de'),(30,'Salomon','Bransby','sbransbyt@biglobe.ne.jp'),(31,'Profesor','Prueba','profesor@prueba.com'),(32,'Profesor','Prueba','profesor@prueba.com');
/*!40000 ALTER TABLE `profesores` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `log_insertar_profesor` AFTER INSERT ON `profesores` FOR EACH ROW BEGIN
	INSERT INTO log_profesores (legajo_profesor, nombre, apellido, email, fecha, accion)
    VALUES (NEW.legajo_profesor, NEW.nombre, NEW.apellido, NEW.email, NOW(), 'INSERT');

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `profesores_alumnos`
--

DROP TABLE IF EXISTS `profesores_alumnos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profesores_alumnos` (
  `legajo_profesor` int NOT NULL,
  `legajo_alumno` int NOT NULL,
  KEY `LEGAJO_ALUMNO_idx` (`legajo_alumno`),
  KEY `profesores_alumnos_ibfk_2_idx` (`legajo_profesor`),
  CONSTRAINT `LEGAJO_ALUMNO` FOREIGN KEY (`legajo_alumno`) REFERENCES `alumnos` (`legajo_alumno`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `profesores_alumnos_ibfk_2` FOREIGN KEY (`legajo_profesor`) REFERENCES `profesores` (`legajo_profesor`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profesores_alumnos`
--

LOCK TABLES `profesores_alumnos` WRITE;
/*!40000 ALTER TABLE `profesores_alumnos` DISABLE KEYS */;
INSERT INTO `profesores_alumnos` VALUES (3,2),(5,3),(1,4),(4,4),(5,4),(1,6),(1,8),(4,8),(5,8),(4,10),(1,11),(5,11),(2,14),(2,15),(3,16),(1,17),(5,17),(2,20),(5,20),(2,21),(1,24),(1,25),(3,25),(1,27),(3,27),(3,29),(5,29);
/*!40000 ALTER TABLE `profesores_alumnos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profesores_facultades`
--

DROP TABLE IF EXISTS `profesores_facultades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profesores_facultades` (
  `legajo_profesor` int NOT NULL,
  `id_facultad` int NOT NULL,
  KEY `profesores_facultades_ibfk_1` (`id_facultad`),
  KEY `profesores_facultades_ibfk_2_idx` (`legajo_profesor`),
  CONSTRAINT `profesores_facultades_ibfk_1` FOREIGN KEY (`id_facultad`) REFERENCES `facultad` (`id_facultad`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `profesores_facultades_ibfk_2` FOREIGN KEY (`legajo_profesor`) REFERENCES `profesores` (`legajo_profesor`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profesores_facultades`
--

LOCK TABLES `profesores_facultades` WRITE;
/*!40000 ALTER TABLE `profesores_facultades` DISABLE KEYS */;
INSERT INTO `profesores_facultades` VALUES (1,3),(2,3),(3,6),(4,5),(5,5),(6,2),(7,1),(8,5),(9,6),(10,3),(11,5),(12,5),(13,2),(14,5),(15,2),(16,5),(17,2),(18,6),(19,3),(20,5),(21,6),(22,1),(23,6),(24,5),(25,6),(26,4),(27,4),(28,4),(29,3),(30,6);
/*!40000 ALTER TABLE `profesores_facultades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profesores_materias`
--

DROP TABLE IF EXISTS `profesores_materias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profesores_materias` (
  `legajo_profesor` int NOT NULL,
  `id_materia` int NOT NULL,
  KEY `profesores_materias_ibfk_1` (`id_materia`),
  KEY `profesores_materias_ibfk_2_idx` (`legajo_profesor`),
  CONSTRAINT `profesores_materias_ibfk_1` FOREIGN KEY (`id_materia`) REFERENCES `materias` (`id_materia`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `profesores_materias_ibfk_2` FOREIGN KEY (`legajo_profesor`) REFERENCES `profesores` (`legajo_profesor`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profesores_materias`
--

LOCK TABLES `profesores_materias` WRITE;
/*!40000 ALTER TABLE `profesores_materias` DISABLE KEYS */;
INSERT INTO `profesores_materias` VALUES (2,8),(2,9),(3,3),(3,6),(3,8),(4,6),(4,13),(8,11),(9,2),(10,13),(11,1),(16,3),(16,13),(17,4),(19,1),(20,12),(21,9),(21,11),(22,5),(22,12);
/*!40000 ALTER TABLE `profesores_materias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'universidad'
--
/*!50003 DROP FUNCTION IF EXISTS `cant_materias` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `cant_materias`(legajo int) RETURNS int
    READS SQL DATA
begin
	declare cant_materias int;
	select count(*) into cant_materias
    from materias_alumnos
    where materias_alumnos.legajo_alumno = legajo;
    return cant_materias;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `edad_persona` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `edad_persona`(fecha_nac date) RETURNS int
    READS SQL DATA
BEGIN
	DECLARE edad INT ;
    SET edad = floor(datediff(now(), fecha_nac)/365);


RETURN edad;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `inscribir_alumno` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `inscribir_alumno`(IN nom VARCHAR(255), IN apel VARCHAR(255), IN fecha DATE)
BEGIN
	IF (nom <> '' AND apel <> '') THEN
		INSERT INTO alumnos (nombre, apellido, fecha_nac) values (nom, apel, fecha);
	ELSE 
		SELECT 'ERROR: Los datos ingresados no son validos';
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `lista_alumnos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `lista_alumnos`(IN legajo_prof INT)
BEGIN
	SELECT a.*
    FROM profesores_alumnos pya
    JOIN alumnos a ON pya.legajo_alumno = a.legajo_alumno
    WHERE pya.legajo_profesor = legajo_prof;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `cant_alumnos_facultad_vw`
--

/*!50001 DROP VIEW IF EXISTS `cant_alumnos_facultad_vw`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `cant_alumnos_facultad_vw` AS select `f`.`nombre` AS `nombre`,`f`.`direccion` AS `direccion`,count(0) AS `cant_alumnos`,`f`.`telefono` AS `telefono` from ((`profesores_facultades` `pyf` left join `facultad` `f` on((`pyf`.`id_facultad` = `f`.`id_facultad`))) left join `profesores_alumnos` `pya` on((`pyf`.`legajo_profesor` = `pya`.`legajo_profesor`))) group by `f`.`id_facultad` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `cant_alumnos_profesores_vw`
--

/*!50001 DROP VIEW IF EXISTS `cant_alumnos_profesores_vw`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `cant_alumnos_profesores_vw` AS select `p`.`nombre` AS `nombre`,`p`.`apellido` AS `apellido`,count(0) AS `cant_alumnos`,`p`.`email` AS `email` from (`profesores_alumnos` `pya` join `profesores` `p` on((`p`.`legajo_profesor` = `pya`.`legajo_profesor`))) group by `p`.`legajo_profesor` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `cant_aulas_facultad_vw`
--

/*!50001 DROP VIEW IF EXISTS `cant_aulas_facultad_vw`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `cant_aulas_facultad_vw` AS select `f`.`nombre` AS `nombre`,`f`.`direccion` AS `direccion`,count(0) AS `cant_aulas` from (`facultad` `f` join `aula` `a` on((`a`.`id_facultad` = `f`.`id_facultad`))) group by `f`.`id_facultad` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `cant_materias_alumno_vw`
--

/*!50001 DROP VIEW IF EXISTS `cant_materias_alumno_vw`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `cant_materias_alumno_vw` AS select `a`.`legajo_alumno` AS `legajo_alumno`,`a`.`nombre` AS `nombre`,`a`.`apellido` AS `apellido`,count(0) AS `cant_materias` from (`materias_alumnos` `mya` join `alumnos` `a` on((`a`.`legajo_alumno` = `mya`.`legajo_alumno`))) group by `a`.`legajo_alumno` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `cant_profesores_facultad_vw`
--

/*!50001 DROP VIEW IF EXISTS `cant_profesores_facultad_vw`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `cant_profesores_facultad_vw` AS select `f`.`nombre` AS `nombre`,`f`.`direccion` AS `direccion`,count(0) AS `cant_profesores`,`f`.`telefono` AS `telefono` from (`profesores_facultades` `pyf` join `facultad` `f` on((`pyf`.`id_facultad` = `f`.`id_facultad`))) group by `f`.`id_facultad` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `info_facultades_vw`
--

/*!50001 DROP VIEW IF EXISTS `info_facultades_vw`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `info_facultades_vw` AS select `f`.`nombre` AS `nombre`,`cauf`.`cant_aulas` AS `cant_aulas`,`calf`.`cant_alumnos` AS `cant_alumnos`,`cpf`.`cant_profesores` AS `cant_profesores` from (((`facultad` `f` left join `cant_aulas_facultad_vw` `cauf` on((`f`.`nombre` = `cauf`.`nombre`))) left join `cant_alumnos_facultad_vw` `calf` on((`f`.`nombre` = `calf`.`nombre`))) left join `cant_profesores_facultad_vw` `cpf` on((`f`.`nombre` = `cpf`.`nombre`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-20 17:45:51
