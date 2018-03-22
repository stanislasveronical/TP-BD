-- MySQL dump 10.13  Distrib 5.6.12, for Win32 (x86)
--
-- Host: localhost    Database: tennis
-- ------------------------------------------------------
-- Server version	5.6.12

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
-- Table structure for table `joueur`
--

DROP TABLE IF EXISTS `joueur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `joueur` (
  `NumLicence` int(11) NOT NULL,
  `NomJoueur` varchar(20) NOT NULL,
  `Prenom` varchar(20) NOT NULL,
  `AgeJoueur` int(11) NOT NULL,
  `Nation` varchar(3) NOT NULL,
  `NoSponsor` int(11) NOT NULL,
  `gain` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`NumLicence`),
  KEY `FK_joueur_NoSponsor` (`NoSponsor`),
  CONSTRAINT `FK_joueur_NoSponsor` FOREIGN KEY (`NoSponsor`) REFERENCES `sponsor` (`NoSponsor`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `joueur`
--

LOCK TABLES `joueur` WRITE;
/*!40000 ALTER TABLE `joueur` DISABLE KEYS */;
INSERT INTO `joueur` VALUES (1,'FEDERER','Roger',21,'SUI',3,NULL),(2,'BLAKE','James',19,'USA',2,NULL),(3,'GROSJEAN','Sébastien',25,'FRA',5,NULL),(4,'ROCHUS','Olivier',22,'BEL',1,NULL),(5,'SANTORO','Fabrice',23,'FRA',2,NULL),(6,'MOYA','Carlos',25,'ESP',5,NULL),(7,'HEWITT','Lleyton',23,'AUS',3,NULL),(8,'CLEMENT','Arnaud',31,'FRA',6,NULL),(9,'GOLDSTEIN','Paul',18,'USA',2,NULL),(10,'BENNETEAU','Julien',27,'FRA',3,NULL);
/*!40000 ALTER TABLE `joueur` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prix`
--

DROP TABLE IF EXISTS `prix`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prix` (
  `codeTournoi` int(11) NOT NULL,
  `rangJoueur` int(11) NOT NULL,
  `prix` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`codeTournoi`,`rangJoueur`),
  CONSTRAINT `fk_prix_codeTournoi` FOREIGN KEY (`codeTournoi`) REFERENCES `tournoi` (`CodeTournoi`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prix`
--

LOCK TABLES `prix` WRITE;
/*!40000 ALTER TABLE `prix` DISABLE KEYS */;
INSERT INTO `prix` VALUES (1,1,150000),(1,2,100000),(2,1,200000),(2,2,100000),(3,1,80000),(3,2,50000),(4,1,250000),(4,2,150000),(5,1,300000),(5,2,200000),(6,1,4000000),(6,2,250000);
/*!40000 ALTER TABLE `prix` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rencontre`
--

DROP TABLE IF EXISTS `rencontre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rencontre` (
  `CodeTournoi` int(11) NOT NULL,
  `NumRencontre` int(11) NOT NULL,
  `DateRencontre` date NOT NULL,
  `Score1` int(11) NOT NULL,
  `Score2` int(11) NOT NULL,
  `NumLicence1` int(11) NOT NULL,
  `NumLicence2` int(11) NOT NULL,
  PRIMARY KEY (`CodeTournoi`,`NumRencontre`),
  KEY `FK_rencontre_j1` (`NumLicence1`),
  KEY `FK_rencontre_j2` (`NumLicence2`),
  CONSTRAINT `FK_rencontre_j1` FOREIGN KEY (`NumLicence1`) REFERENCES `joueur` (`NumLicence`),
  CONSTRAINT `FK_rencontre_j2` FOREIGN KEY (`NumLicence2`) REFERENCES `joueur` (`NumLicence`),
  CONSTRAINT `FK_rencontre_tournoi` FOREIGN KEY (`CodeTournoi`) REFERENCES `tournoi` (`CodeTournoi`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rencontre`
--

LOCK TABLES `rencontre` WRITE;
/*!40000 ALTER TABLE `rencontre` DISABLE KEYS */;
INSERT INTO `rencontre` VALUES (1,1,'2006-05-02',3,0,1,2),(1,2,'2006-05-03',1,3,3,4),(2,1,'2006-05-03',2,3,5,6),(2,2,'2006-05-04',3,1,7,8),(2,3,'2006-05-05',3,2,4,10),(3,1,'2006-05-06',0,3,1,10),(3,2,'2006-05-07',3,1,4,9),(4,1,'2006-05-06',3,2,2,9),(5,2,'2006-05-09',1,3,4,7),(5,3,'2006-05-10',2,3,5,3),(5,4,'2006-05-12',3,0,6,8),(5,5,'2006-05-13',3,1,8,4),(6,1,'2006-05-14',3,2,4,8);
/*!40000 ALTER TABLE `rencontre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sponsor`
--

DROP TABLE IF EXISTS `sponsor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sponsor` (
  `NoSponsor` int(11) NOT NULL,
  `NomSponsor` char(20) DEFAULT NULL,
  `Nationalite` char(3) DEFAULT NULL,
  `ChiffreAffaires` decimal(6,0) DEFAULT NULL,
  PRIMARY KEY (`NoSponsor`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sponsor`
--

LOCK TABLES `sponsor` WRITE;
/*!40000 ALTER TABLE `sponsor` DISABLE KEYS */;
INSERT INTO `sponsor` VALUES (1,'REEBOOK','USA',5000),(2,'ADDIDAS','FRA',12000),(3,'NIKE','USA',125000),(4,'PUMA','USA',80000),(5,'LACOSTE','FRA',120000),(6,'ASICS','JAP',110000);
/*!40000 ALTER TABLE `sponsor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tournoi`
--

DROP TABLE IF EXISTS `tournoi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tournoi` (
  `CodeTournoi` int(11) NOT NULL,
  `NomTournoi` varchar(20) NOT NULL,
  `LieuTournoi` varchar(20) NOT NULL,
  PRIMARY KEY (`CodeTournoi`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tournoi`
--

LOCK TABLES `tournoi` WRITE;
/*!40000 ALTER TABLE `tournoi` DISABLE KEYS */;
INSERT INTO `tournoi` VALUES (1,'Monte-Carlo','Monaco'),(2,'Barcelone','Espagne'),(3,'Casablanca','Maroc'),(4,'Rome','Italie'),(5,'Roland Garros','France'),(6,'Wimbledon','Angleterre');
/*!40000 ALTER TABLE `tournoi` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-10-01 22:45:03
