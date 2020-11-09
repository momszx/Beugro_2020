CREATE DATABASE  IF NOT EXISTS `cs_beugro` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */;
USE `cs_beugro`;
-- MySQL dump 10.13  Distrib 8.0.16, for Win64 (x86_64)
--
-- Host: htvvm592    Database: cs_beugro
-- ------------------------------------------------------
-- Server version	8.0.15

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `car`
--

DROP TABLE IF EXISTS `car`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `car` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `brand` varchar(45) NOT NULL,
  `model` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `car`
--

LOCK TABLES `car` WRITE;
/*!40000 ALTER TABLE `car` DISABLE KEYS */;
INSERT INTO `car` VALUES (1,'Opel','Vectra'),(2,'Opel','Astra'),(3,'Fiat','126'),(4,'Fiat','Seicento'),(5,'Suzuki','Swift'),(6,'Ford','Focus'),(7,'Ford','Mondeo');
/*!40000 ALTER TABLE `car` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `user` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Kozma Imre'),(2,'M�t� Benjamin'),(3,'Miksa �rmin'),(4,'Ol�h Adri�n'),(5,'Lakatos Kevin'),(6,'Kov�cs Erik'),(7,'Kis Domonkos'),(8,'Borb�ly Valentin'),(9,'Zobor Rudolf'),(10,'Farag� Gergo'),(11,'Moln�r Alexander'),(12,'B�cs Zsombor'),(13,'Varga Bendeg�z'),(14,'Szil�gyi Bertalan'),(15,'Dud�s Ferenc'),(16,'Mezei N�ndor'),(17,'So�s Gyula'),(18,'V�radi Jakab'),(19,'Bal�zs Szilveszter'),(20,'Hajd� Benj�min'),(21,'Orosz R�bert'),(22,'Kerekes L�szl�'),(23,'Kende �ron'),(24,'Tak�cs Martin'),(25,'Tam�s Vilmos'),(26,'Lakatos Mikl�s'),(27,'Apr�d Barna'),(28,'Bal�zs Norbert'),(29,'P�ter Don�t'),(30,'Barta Noel'),(31,'Egyed �rmin'),(32,'Nov�k Benedek'),(33,'Tam�s Csan�d'),(34,'So�s Antal'),(35,'Bakos Barnab�s'),(36,'G�sp�r Levente'),(37,'Simon Andr�s'),(38,'Balogh K�lm�n'),(39,'F�l�p Kriszti�n'),(40,'Budai Jakab');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_car`
--

DROP TABLE IF EXISTS `user_car`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `user_car` (
  `user` int(10) NOT NULL,
  `car` int(10) NOT NULL,
  KEY `FK_user_id_idx` (`user`),
  KEY `FK_car_id_idx` (`car`),
  CONSTRAINT `FK_car_id` FOREIGN KEY (`car`) REFERENCES `car` (`id`),
  CONSTRAINT `FK_user_id` FOREIGN KEY (`user`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_car`
--

LOCK TABLES `user_car` WRITE;
/*!40000 ALTER TABLE `user_car` DISABLE KEYS */;
INSERT INTO `user_car` VALUES (1,2),(1,4),(1,6),(2,5),(3,1),(3,3),(4,2),(5,1),(5,5),(6,7),(8,2),(10,4),(11,4),(12,2),(13,3),(14,2),(15,5),(17,6),(18,2),(19,3),(20,4),(21,7),(22,2),(23,2),(25,1),(25,2),(26,6),(28,5),(29,3),(30,3),(31,1),(32,3),(33,5),(34,1),(35,3),(37,7),(38,4),(39,4),(40,2);
/*!40000 ALTER TABLE `user_car` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-10-09 10:49:49
