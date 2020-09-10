-- MySQL dump 10.13  Distrib 8.0.21, for Linux (x86_64)
--
-- Host: localhost    Database: Mussie_Sirak_Info1d
-- ------------------------------------------------------
-- Server version	8.0.21

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `t_address`
--

DROP TABLE IF EXISTS `t_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_address` (
  `Id_Address` int NOT NULL AUTO_INCREMENT,
  `Rue` varchar(64) NOT NULL,
  `No_appartement` int NOT NULL,
  `Code_Postal` int NOT NULL,
  `Ville` int NOT NULL,
  `Pays` varchar(20) NOT NULL,
  PRIMARY KEY (`Id_Address`),
  KEY `Ville_?` (`Ville`),
  CONSTRAINT `T_Address_ibfk_1` FOREIGN KEY (`Id_Address`) REFERENCES `t_r_appartement_address` (`FK_Address`),
  CONSTRAINT `T_Address_ibfk_2` FOREIGN KEY (`Id_Address`) REFERENCES `t_r_gerance_address` (`FK_Address`),
  CONSTRAINT `Ville_?` FOREIGN KEY (`Ville`) REFERENCES `t_ville` (`Id_Ville`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_appartement`
--

DROP TABLE IF EXISTS `t_appartement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_appartement` (
  `Id_Appartement` int NOT NULL AUTO_INCREMENT,
  `No_Piece` decimal(2,0) NOT NULL,
  `Surface` int NOT NULL,
  `Etage` int NOT NULL,
  `Type` int NOT NULL,
  `Contact` int NOT NULL,
  `Gerance_Proprietier` int NOT NULL,
  `Rent` int NOT NULL,
  `Charges` int NOT NULL,
  PRIMARY KEY (`Id_Appartement`),
  KEY `Appartement_gerance` (`Gerance_Proprietier`),
  KEY `Id_Appartement` (`Id_Appartement`),
  KEY `Appartment_contact` (`Contact`),
  KEY `No_Piece` (`No_Piece`),
  CONSTRAINT `Appartement_address` FOREIGN KEY (`Id_Appartement`) REFERENCES `t_r_appartement_address` (`FK_Appartement`),
  CONSTRAINT `Appartment_contact` FOREIGN KEY (`Id_Appartement`) REFERENCES `t_r_appartement_contact` (`FK_Appartement`),
  CONSTRAINT `T_Appartement_ibfk_1` FOREIGN KEY (`Id_Appartement`) REFERENCES `t_r_gerance_appartement` (`FK_Appartement`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_contact`
--

DROP TABLE IF EXISTS `t_contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_contact` (
  `Id_contact` int NOT NULL,
  `Nom` varchar(64) NOT NULL,
  `Prenom` varchar(64) NOT NULL,
  `Telephone` int NOT NULL,
  `E-mail` varchar(128) NOT NULL,
  `Messagier` varchar(54) NOT NULL,
  `Compte_publicite` varchar(128) NOT NULL,
  PRIMARY KEY (`Id_contact`),
  KEY `Id_contact` (`Id_contact`),
  CONSTRAINT `T_Contact_ibfk_1` FOREIGN KEY (`Id_contact`) REFERENCES `t_r_gerance_contact` (`FK_Contact`),
  CONSTRAINT `T_Contact_ibfk_2` FOREIGN KEY (`Id_contact`) REFERENCES `t_r_appartement_contact` (`FK_Contact`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_conton`
--

DROP TABLE IF EXISTS `t_conton`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_conton` (
  `id_canton` varchar(2) NOT NULL,
  `Canton` varchar(64) NOT NULL,
  PRIMARY KEY (`id_canton`),
  KEY `id_canton` (`id_canton`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_email`
--

DROP TABLE IF EXISTS `t_email`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_email` (
  `id_email` int NOT NULL AUTO_INCREMENT,
  `email` varchar(256) NOT NULL,
  PRIMARY KEY (`id_email`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_features`
--

DROP TABLE IF EXISTS `t_features`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_features` (
  `Features` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_gerance_propritier`
--

DROP TABLE IF EXISTS `t_gerance_propritier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_gerance_propritier` (
  `Id_gerance_propritier` int NOT NULL AUTO_INCREMENT,
  `Nom_gerance` int NOT NULL,
  `Contact_gerance` int NOT NULL,
  `Address_gerance` int NOT NULL,
  `Fomulaire_inscription` int NOT NULL,
  PRIMARY KEY (`Id_gerance_propritier`),
  KEY `Gerance_contact` (`Contact_gerance`),
  KEY `Gerance_address` (`Address_gerance`),
  CONSTRAINT `Appartement_Gerance` FOREIGN KEY (`Id_gerance_propritier`) REFERENCES `t_r_gerance_appartement` (`FK_Gerance`),
  CONSTRAINT `Gerance_address` FOREIGN KEY (`Id_gerance_propritier`) REFERENCES `t_r_gerance_address` (`FK_gerance`),
  CONSTRAINT `Gerance_contact` FOREIGN KEY (`Id_gerance_propritier`) REFERENCES `t_r_gerance_contact` (`FK_Gerance`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_nationalite`
--

DROP TABLE IF EXISTS `t_nationalite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_nationalite` (
  `id_nationalite` int unsigned NOT NULL AUTO_INCREMENT,
  `nationalite` varchar(50) NOT NULL,
  `date` date NOT NULL COMMENT 'Date de modification',
  PRIMARY KEY (`id_nationalite`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_pays`
--

DROP TABLE IF EXISTS `t_pays`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_pays` (
  `id_pays` int unsigned NOT NULL AUTO_INCREMENT,
  `nom_pays` varchar(64) NOT NULL,
  `code_pays` varchar(4) NOT NULL,
  PRIMARY KEY (`id_pays`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_piece`
--

DROP TABLE IF EXISTS `t_piece`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_piece` (
  `Piece` decimal(10,2) NOT NULL,
  KEY `Piece` (`Piece`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_r_appartement_address`
--

DROP TABLE IF EXISTS `t_r_appartement_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_r_appartement_address` (
  `FK_Appartement` int NOT NULL,
  `FK_Address` int NOT NULL,
  `Date` date NOT NULL,
  KEY `FK_Appartement` (`FK_Appartement`),
  KEY `FK_Address` (`FK_Address`),
  CONSTRAINT `t_r_appartement_address_ibfk_1` FOREIGN KEY (`FK_Appartement`) REFERENCES `t_appartement` (`Id_Appartement`),
  CONSTRAINT `t_r_appartement_address_ibfk_2` FOREIGN KEY (`FK_Address`) REFERENCES `t_address` (`Id_Address`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_r_appartement_contact`
--

DROP TABLE IF EXISTS `t_r_appartement_contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_r_appartement_contact` (
  `FK_Contact` int NOT NULL,
  `FK_Appartement` int NOT NULL,
  `Date` date NOT NULL,
  KEY `FK_Contact` (`FK_Contact`),
  KEY `FK_Appartement` (`FK_Appartement`),
  CONSTRAINT `t_r_appartement_contact_ibfk_1` FOREIGN KEY (`FK_Contact`) REFERENCES `t_contact` (`Id_contact`),
  CONSTRAINT `t_r_appartement_contact_ibfk_2` FOREIGN KEY (`FK_Appartement`) REFERENCES `t_appartement` (`Id_Appartement`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_r_gerance_address`
--

DROP TABLE IF EXISTS `t_r_gerance_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_r_gerance_address` (
  `FK_gerance` int NOT NULL,
  `FK_Address` int NOT NULL,
  `Date` date NOT NULL,
  KEY `FK_Address` (`FK_Address`),
  KEY `FK_gerance` (`FK_gerance`),
  CONSTRAINT `R_gerance` FOREIGN KEY (`FK_gerance`) REFERENCES `t_gerance_propritier` (`Id_gerance_propritier`),
  CONSTRAINT `t_r_gerance_address_ibfk_1` FOREIGN KEY (`FK_Address`) REFERENCES `t_address` (`Id_Address`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_r_gerance_appartement`
--

DROP TABLE IF EXISTS `t_r_gerance_appartement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_r_gerance_appartement` (
  `FK_Gerance` int NOT NULL,
  `FK_Appartement` int NOT NULL,
  `Date` date NOT NULL,
  KEY `FK_Appartement` (`FK_Appartement`),
  KEY `FK_Gerance` (`FK_Gerance`),
  CONSTRAINT `t_r_gerance_appartement_ibfk_1` FOREIGN KEY (`FK_Gerance`) REFERENCES `t_gerance_propritier` (`Id_gerance_propritier`),
  CONSTRAINT `t_r_gerance_appartement_ibfk_2` FOREIGN KEY (`FK_Appartement`) REFERENCES `t_appartement` (`Id_Appartement`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_r_gerance_contact`
--

DROP TABLE IF EXISTS `t_r_gerance_contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_r_gerance_contact` (
  `FK_Gerance` int NOT NULL,
  `FK_Contact` int NOT NULL,
  `Date` date NOT NULL,
  KEY `FK_Gerance` (`FK_Gerance`),
  KEY `FK_Contact` (`FK_Contact`),
  CONSTRAINT `t_r_gerance_contact_ibfk_1` FOREIGN KEY (`FK_Gerance`) REFERENCES `t_gerance_propritier` (`Id_gerance_propritier`),
  CONSTRAINT `t_r_gerance_contact_ibfk_2` FOREIGN KEY (`FK_Contact`) REFERENCES `t_contact` (`Id_contact`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_r_user_address`
--

DROP TABLE IF EXISTS `t_r_user_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_r_user_address` (
  `fk_user` int NOT NULL,
  `fk_address` int NOT NULL,
  `date` date NOT NULL,
  UNIQUE KEY `fk_user` (`fk_user`),
  UNIQUE KEY `fk_address` (`fk_address`),
  KEY `fk_address_2` (`fk_address`),
  KEY `fk_user_2` (`fk_user`),
  CONSTRAINT `t_r_user_address_ibfk_1` FOREIGN KEY (`fk_user`) REFERENCES `t_user` (`id_user`),
  CONSTRAINT `t_r_user_address_ibfk_2` FOREIGN KEY (`fk_address`) REFERENCES `t_address` (`Id_Address`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_r_user_email`
--

DROP TABLE IF EXISTS `t_r_user_email`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_r_user_email` (
  `fk_user` int unsigned NOT NULL,
  `fk_email` int unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_telephone`
--

DROP TABLE IF EXISTS `t_telephone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_telephone` (
  `id_telephone` int NOT NULL AUTO_INCREMENT,
  `telephone` int NOT NULL,
  `Type` varchar(64) NOT NULL,
  PRIMARY KEY (`id_telephone`),
  UNIQUE KEY `Type_2` (`Type`),
  KEY `Type` (`Type`),
  KEY `Type_3` (`Type`),
  CONSTRAINT `t_telephone_ibfk_1` FOREIGN KEY (`Type`) REFERENCES `t_type_telephone` (`Type_telephone`),
  CONSTRAINT `t_telephone_ibfk_2` FOREIGN KEY (`id_telephone`) REFERENCES `t_contact` (`Id_contact`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_type`
--

DROP TABLE IF EXISTS `t_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_type` (
  `Id_type` int NOT NULL AUTO_INCREMENT,
  `Type` varchar(64) NOT NULL COMMENT 'Le type de l''appartement',
  PRIMARY KEY (`Id_type`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_type_telephone`
--

DROP TABLE IF EXISTS `t_type_telephone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_type_telephone` (
  `Type_telephone` varchar(64) NOT NULL,
  PRIMARY KEY (`Type_telephone`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_user`
--

DROP TABLE IF EXISTS `t_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_user` (
  `id_user` int NOT NULL AUTO_INCREMENT,
  `lastname` varchar(64) NOT NULL,
  `firstname` varchar(64) NOT NULL,
  `date_of_birth` date NOT NULL,
  `login_name` varchar(24) NOT NULL,
  `Password` varchar(128) NOT NULL,
  `username` varchar(20) NOT NULL,
  `img_gravatar` varchar(256) NOT NULL,
  `fk_nationalite` int NOT NULL,
  `confirmed` tinyint(1) NOT NULL DEFAULT '0',
  `Date_cre` date NOT NULL,
  `Date_modifie` date NOT NULL,
  PRIMARY KEY (`id_user`),
  UNIQUE KEY `User_name` (`login_name`),
  UNIQUE KEY `fk_nationalite` (`fk_nationalite`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_ville`
--

DROP TABLE IF EXISTS `t_ville`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_ville` (
  `Id_Ville` int NOT NULL AUTO_INCREMENT,
  `Nom_de_ville` varchar(64) NOT NULL,
  `NPA_ville` int NOT NULL,
  `Canton` varchar(2) NOT NULL,
  PRIMARY KEY (`Id_Ville`),
  KEY `Id_Ville` (`Id_Ville`),
  KEY `Canton` (`Canton`)
) ENGINE=InnoDB AUTO_INCREMENT=9400 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-09-08 12:16:19
