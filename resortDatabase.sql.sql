-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: localhost    Database: hotel
-- ------------------------------------------------------
-- Server version	8.0.26

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
-- Table structure for table `manager`
--

DROP TABLE IF EXISTS `manager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `manager` (
  `manager_id` int NOT NULL,
  `manager_name` varchar(45) DEFAULT NULL,
  `manager_password` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`manager_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manager`
--

LOCK TABLES `manager` WRITE;
/*!40000 ALTER TABLE `manager` DISABLE KEYS */;
INSERT INTO `manager` VALUES (1,'Jordan','password');
/*!40000 ALTER TABLE `manager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu` (
  `menu_id` int NOT NULL,
  `menu_item` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservation` (
  `reservation_id` int NOT NULL AUTO_INCREMENT,
  `date_start` date DEFAULT NULL,
  `date_end` date DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `reservation_type` int DEFAULT NULL,
  PRIMARY KEY (`reservation_id`),
  KEY `user_id_idx` (`user_id`),
  KEY `reservation_type_idx` (`reservation_type`),
  CONSTRAINT `reservation_type` FOREIGN KEY (`reservation_type`) REFERENCES `reservation_type` (`res_type_id`),
  CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation`
--

LOCK TABLES `reservation` WRITE;
/*!40000 ALTER TABLE `reservation` DISABLE KEYS */;
INSERT INTO `reservation` VALUES (1,'2021-10-15','2021-10-20',1,1),(2,'2022-05-05','2022-06-05',NULL,1),(3,'2022-09-04','2022-09-26',NULL,1),(4,'2022-10-31','2022-11-27',NULL,1),(5,'2022-01-05','2022-01-20',NULL,1),(6,'2022-02-05','2022-02-22',NULL,1),(7,'2022-03-01','2022-03-11',NULL,1);
/*!40000 ALTER TABLE `reservation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation_type`
--

DROP TABLE IF EXISTS `reservation_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservation_type` (
  `res_type_id` int NOT NULL,
  `lakeside` int DEFAULT NULL,
  `bed_type` varchar(45) DEFAULT NULL,
  `room_type` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`res_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation_type`
--

LOCK TABLES `reservation_type` WRITE;
/*!40000 ALTER TABLE `reservation_type` DISABLE KEYS */;
INSERT INTO `reservation_type` VALUES (1,1,'King','Room');
/*!40000 ALTER TABLE `reservation_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restaraunt`
--

DROP TABLE IF EXISTS `restaraunt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `restaraunt` (
  `date` date NOT NULL,
  `reservation` varchar(45) DEFAULT NULL,
  `menu` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaraunt`
--

LOCK TABLES `restaraunt` WRITE;
/*!40000 ALTER TABLE `restaraunt` DISABLE KEYS */;
/*!40000 ALTER TABLE `restaraunt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restaraunt_reservation`
--

DROP TABLE IF EXISTS `restaraunt_reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `restaraunt_reservation` (
  `rest_res_id` int NOT NULL,
  `date` date DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`rest_res_id`),
  KEY `user_id_idx` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaraunt_reservation`
--

LOCK TABLES `restaraunt_reservation` WRITE;
/*!40000 ALTER TABLE `restaraunt_reservation` DISABLE KEYS */;
/*!40000 ALTER TABLE `restaraunt_reservation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restaraunt_table`
--

DROP TABLE IF EXISTS `restaraunt_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `restaraunt_table` (
  `table_id` int NOT NULL,
  `reserve` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`table_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaraunt_table`
--

LOCK TABLES `restaraunt_table` WRITE;
/*!40000 ALTER TABLE `restaraunt_table` DISABLE KEYS */;
/*!40000 ALTER TABLE `restaraunt_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room`
--

DROP TABLE IF EXISTS `room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `room` (
  `room_number` int NOT NULL,
  `floor` int NOT NULL,
  `bed` varchar(45) DEFAULT NULL,
  `vacancy` int DEFAULT NULL,
  `reservation_start` date DEFAULT NULL,
  `reservation_end` date DEFAULT NULL,
  `lakeview` int DEFAULT NULL,
  `reservation_id` int DEFAULT NULL,
  PRIMARY KEY (`room_number`,`floor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room`
--

LOCK TABLES `room` WRITE;
/*!40000 ALTER TABLE `room` DISABLE KEYS */;
INSERT INTO `room` VALUES (1,1,'1',1,'2021-10-15','2021-10-20',1,NULL),(1,2,'1',1,'2022-05-05','2022-06-05',1,NULL),(1,3,'1',1,'2022-09-04','2022-09-26',1,NULL),(1,4,'1',1,'2022-10-31','2022-11-27',1,NULL),(2,1,'1',0,NULL,NULL,1,NULL),(2,2,'1',0,NULL,NULL,1,NULL),(2,3,'1',0,NULL,NULL,1,NULL),(2,4,'1',0,NULL,NULL,1,NULL),(3,1,'1',0,NULL,NULL,1,NULL),(3,2,'1',0,NULL,NULL,1,NULL),(3,3,'1',0,NULL,NULL,1,NULL),(3,4,'1',0,NULL,NULL,1,NULL),(4,1,'1',0,NULL,NULL,1,NULL),(4,2,'1',0,NULL,NULL,1,NULL),(4,3,'1',0,NULL,NULL,1,NULL),(4,4,'1',0,NULL,NULL,1,NULL),(5,1,'1',1,'2022-01-05','2022-01-20',1,NULL),(5,2,'1',0,NULL,NULL,1,NULL),(5,3,'1',0,NULL,NULL,1,NULL),(5,4,'1',0,NULL,NULL,1,NULL),(6,1,'1',0,NULL,NULL,1,NULL),(6,2,'1',0,NULL,NULL,1,NULL),(6,3,'1',0,NULL,NULL,1,NULL),(6,4,'1',0,NULL,NULL,1,NULL),(7,1,'1',0,NULL,NULL,1,NULL),(7,2,'1',0,NULL,NULL,1,NULL),(7,3,'1',0,NULL,NULL,1,NULL),(7,4,'1',0,NULL,NULL,1,NULL),(8,1,'0',0,NULL,NULL,1,NULL),(8,2,'0',0,NULL,NULL,1,NULL),(8,3,'0',0,NULL,NULL,1,NULL),(8,4,'0',0,NULL,NULL,1,NULL),(9,1,'0',0,NULL,NULL,1,NULL),(9,2,'0',0,NULL,NULL,1,NULL),(9,3,'0',0,NULL,NULL,1,NULL),(9,4,'0',0,NULL,NULL,1,NULL),(10,1,'0',0,NULL,NULL,1,NULL),(10,2,'0',0,NULL,NULL,1,NULL),(10,3,'0',0,NULL,NULL,1,NULL),(10,4,'0',0,NULL,NULL,1,NULL),(11,1,'1',0,NULL,NULL,1,NULL),(11,2,'1',0,NULL,NULL,1,NULL),(11,3,'1',0,NULL,NULL,1,NULL),(11,4,'1',0,NULL,NULL,1,NULL),(12,1,'1',0,NULL,NULL,1,NULL),(12,2,'1',0,NULL,NULL,1,NULL),(12,3,'1',0,NULL,NULL,1,NULL),(12,4,'1',0,NULL,NULL,1,NULL),(13,1,'1',0,NULL,NULL,1,NULL),(13,2,'1',0,NULL,NULL,1,NULL),(13,3,'1',0,NULL,NULL,1,NULL),(13,4,'1',0,NULL,NULL,1,NULL),(14,1,'1',0,NULL,NULL,1,NULL),(14,2,'1',0,NULL,NULL,1,NULL),(14,3,'1',0,NULL,NULL,1,NULL),(14,4,'1',0,NULL,NULL,1,NULL),(15,1,'1',1,'2022-02-05','2022-02-22',1,NULL),(15,2,'1',0,NULL,NULL,1,NULL),(15,3,'1',0,NULL,NULL,1,NULL),(15,4,'1',0,NULL,NULL,1,NULL),(16,1,'1',0,NULL,NULL,1,NULL),(16,2,'1',0,NULL,NULL,2,NULL),(16,3,'1',0,NULL,NULL,2,NULL),(16,4,'1',0,NULL,NULL,2,NULL),(17,1,'1',1,'2022-03-01','2022-03-11',1,NULL),(17,2,'1',0,NULL,NULL,2,NULL),(17,3,'1',0,NULL,NULL,2,NULL),(17,4,'1',0,NULL,NULL,2,NULL),(18,1,'1',0,NULL,NULL,1,NULL),(18,2,'1',0,NULL,NULL,2,NULL),(18,3,'1',0,NULL,NULL,2,NULL),(18,4,'1',0,NULL,NULL,2,NULL),(19,1,'1',0,NULL,NULL,1,NULL),(19,2,'1',0,NULL,NULL,2,NULL),(19,3,'1',0,NULL,NULL,2,NULL),(19,4,'1',0,NULL,NULL,2,NULL),(20,1,'1',0,NULL,NULL,1,NULL),(20,2,'1',0,NULL,NULL,2,NULL),(20,3,'1',0,NULL,NULL,2,NULL),(20,4,'1',0,NULL,NULL,2,NULL),(21,1,'1',0,NULL,NULL,1,NULL),(21,2,'1',0,NULL,NULL,2,NULL),(21,3,'1',0,NULL,NULL,2,NULL),(21,4,'1',0,NULL,NULL,2,NULL),(22,1,'1',0,NULL,NULL,1,NULL),(22,2,'1',0,NULL,NULL,2,NULL),(22,3,'1',0,NULL,NULL,2,NULL),(22,4,'1',0,NULL,NULL,2,NULL),(23,1,'1',0,NULL,NULL,1,NULL),(23,2,'1',0,NULL,NULL,2,NULL),(23,3,'1',0,NULL,NULL,2,NULL),(23,4,'1',0,NULL,NULL,2,NULL),(24,1,'1',0,NULL,NULL,1,NULL),(24,2,'1',0,NULL,NULL,2,NULL),(24,3,'1',0,NULL,NULL,2,NULL),(24,4,'1',0,NULL,NULL,2,NULL),(25,1,'1',0,NULL,NULL,1,NULL),(25,2,'1',0,NULL,NULL,2,NULL),(25,3,'1',0,NULL,NULL,2,NULL),(25,4,'1',0,NULL,NULL,2,NULL);
/*!40000 ALTER TABLE `room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suite`
--

DROP TABLE IF EXISTS `suite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `suite` (
  `suite_number` int NOT NULL,
  `floor` int NOT NULL,
  `bed` varchar(45) DEFAULT NULL,
  `vacancy` int DEFAULT NULL,
  `reservation_start` date DEFAULT NULL,
  `reservation_end` date DEFAULT NULL,
  `lakeview` int DEFAULT NULL,
  PRIMARY KEY (`suite_number`,`floor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suite`
--

LOCK TABLES `suite` WRITE;
/*!40000 ALTER TABLE `suite` DISABLE KEYS */;
INSERT INTO `suite` VALUES (1,1,'1',0,NULL,NULL,1),(1,2,'1',0,NULL,NULL,1),(1,3,'1',0,NULL,NULL,2),(1,4,'1',0,NULL,NULL,2),(2,1,'1',1,'2022-05-02','2022-05-02',1),(2,2,'1',0,NULL,NULL,1),(2,3,'1',0,NULL,NULL,2),(2,4,'1',0,NULL,NULL,2),(3,1,'1',0,NULL,NULL,1),(3,2,'1',0,NULL,NULL,1),(3,3,'1',0,NULL,NULL,2),(3,4,'1',0,NULL,NULL,2),(4,1,'1',0,NULL,NULL,1),(4,2,'1',0,NULL,NULL,1),(4,3,'1',0,NULL,NULL,2),(4,4,'1',0,NULL,NULL,2),(5,1,'1',0,NULL,NULL,1),(5,2,'1',0,NULL,NULL,1),(5,3,'1',0,NULL,NULL,2),(5,4,'1',0,NULL,NULL,2);
/*!40000 ALTER TABLE `suite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `reservation` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Henry',NULL,NULL);
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

-- Dump completed on 2021-12-10 14:49:45
