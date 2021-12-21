-- MySQL dump 10.13  Distrib 8.0.18, for Linux (x86_64)
--
-- Host: localhost    Database: BD2
-- ------------------------------------------------------
-- Server version	8.0.18-google

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
-- Current Database: `BD2`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `BD2` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `BD2`;

--
-- Table structure for table `disciplina`
--

DROP TABLE IF EXISTS `disciplina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `disciplina` (
  `disciplina_uuid` binary(16) NOT NULL,
  `sigla_seq` char(5) NOT NULL,
  `nome_name` varchar(50) NOT NULL,
  PRIMARY KEY (`disciplina_uuid`),
  UNIQUE KEY `varSilga` (`sigla_seq`),
  UNIQUE KEY `varSilga_2` (`sigla_seq`),
  UNIQUE KEY `sigla_nome` (`sigla_seq`),
  UNIQUE KEY `sigla_seq` (`sigla_seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disciplina`
--

LOCK TABLES `disciplina` WRITE;
/*!40000 ALTER TABLE `disciplina` DISABLE KEYS */;
INSERT INTO `disciplina` VALUES (0x13F5F1165ADC11ECBF6B42010A9E0004,'HO3A3','Historia dos Ornitorrincos 3'),(0x1FC7F1925ADC11ECBF6B42010A9E0004,'BD2A3','Banco de Dados 2'),(0x2B5D980B5ADC11ECBF6B42010A9E0004,'LB1A6','Libras 1'),(0x3EEF722E5ADC11ECBF6B42010A9E0004,'FB1A2','Fritagem de Batatas 1'),(0xF44113E95ADB11ECBF6B42010A9E0004,'LG1A1','Lingua dos Galdeses 1');
/*!40000 ALTER TABLE `disciplina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `docente`
--

DROP TABLE IF EXISTS `docente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `docente` (
  `docente_uuid` binary(16) NOT NULL,
  `prontuario_seq` char(7) NOT NULL,
  `nome_name` varchar(50) NOT NULL,
  `escolar_seq` enum('fundamental','medio','tecnologo','bacharelado','licenciatura','mestrado','doutorado','posgraduacao','livredocencia') NOT NULL,
  `nasc_date` date NOT NULL,
  PRIMARY KEY (`docente_uuid`),
  UNIQUE KEY `varProntuario` (`prontuario_seq`),
  UNIQUE KEY `varProntuario_2` (`prontuario_seq`),
  UNIQUE KEY `varProntuario_3` (`prontuario_seq`),
  UNIQUE KEY `prontuario_name` (`prontuario_seq`),
  UNIQUE KEY `prontuario_seq` (`prontuario_seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `docente`
--

LOCK TABLES `docente` WRITE;
/*!40000 ALTER TABLE `docente` DISABLE KEYS */;
INSERT INTO `docente` VALUES (0x41999BA45ADB11ECBF6B42010A9E0004,'5665767','Professor Real 1','licenciatura','1900-11-24'),(0x5B4E55495ADB11ECBF6B42010A9E0004,'0998987','Maria Antonieta','posgraduacao','1970-11-11'),(0x7462EB5A5ADB11ECBF6B42010A9E0004,'3432321','Professor Real 2','mestrado','1981-02-07'),(0x9A780BBF5ADB11ECBF6B42010A9E0004,'7665456','Josep Sampaio','tecnologo','1990-05-14');
/*!40000 ALTER TABLE `docente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estudante`
--

DROP TABLE IF EXISTS `estudante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estudante` (
  `estudante_uuid` binary(16) NOT NULL,
  `prontuario_seq` char(7) NOT NULL,
  `nome_name` varchar(50) NOT NULL,
  `nasc_date` date NOT NULL,
  PRIMARY KEY (`estudante_uuid`),
  UNIQUE KEY `estudante_prontuario` (`prontuario_seq`),
  UNIQUE KEY `varProntuario` (`prontuario_seq`),
  UNIQUE KEY `varProntuario_2` (`prontuario_seq`),
  UNIQUE KEY `varProntuario_3` (`prontuario_seq`),
  UNIQUE KEY `varProntuario_4` (`prontuario_seq`),
  UNIQUE KEY `prontuario_name` (`prontuario_seq`),
  UNIQUE KEY `prontuario_seq` (`prontuario_seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estudante`
--

LOCK TABLES `estudante` WRITE;
/*!40000 ALTER TABLE `estudante` DISABLE KEYS */;
INSERT INTO `estudante` VALUES (0x8584204A5ADC11ECBF6B42010A9E0004,'5665432','Benedita Golcalvez Ledo','1995-06-18'),(0x9B6283655ADC11ECBF6B42010A9E0004,'3047245','Marcos Querino','1500-05-27'),(0xBB4894185ADC11ECBF6B42010A9E0004,'1234567','Aluno nota 10','2002-05-27'),(0xD0EF2FDB5ADC11ECBF6B42010A9E0004,'7234098','Ednaldo Pereira','1111-11-11'),(0xF2E1847F5ADC11ECBF6B42010A9E0004,'9447854','Nathan Ajudou Bastante','2021-12-01');
/*!40000 ALTER TABLE `estudante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estudos`
--

DROP TABLE IF EXISTS `estudos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estudos` (
  `estudante_uuid` binary(16) NOT NULL,
  `turma_uuid` binary(16) NOT NULL,
  UNIQUE KEY `estudante_uuid` (`estudante_uuid`,`turma_uuid`),
  KEY `turma_uuid` (`turma_uuid`),
  CONSTRAINT `estudos_ibfk_1` FOREIGN KEY (`estudante_uuid`) REFERENCES `estudante` (`estudante_uuid`),
  CONSTRAINT `estudos_ibfk_2` FOREIGN KEY (`turma_uuid`) REFERENCES `turma` (`turma_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estudos`
--

LOCK TABLES `estudos` WRITE;
/*!40000 ALTER TABLE `estudos` DISABLE KEYS */;
/*!40000 ALTER TABLE `estudos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lecionação`
--

DROP TABLE IF EXISTS `lecionação`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lecionação` (
  `docente_uuid` binary(16) NOT NULL,
  `disciplina_uuid` binary(16) NOT NULL,
  UNIQUE KEY `docente_uuid` (`docente_uuid`,`disciplina_uuid`),
  KEY `disciplina_uuid` (`disciplina_uuid`),
  CONSTRAINT `lecionação_ibfk_1` FOREIGN KEY (`docente_uuid`) REFERENCES `docente` (`docente_uuid`),
  CONSTRAINT `lecionação_ibfk_2` FOREIGN KEY (`disciplina_uuid`) REFERENCES `disciplina` (`disciplina_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lecionação`
--

LOCK TABLES `lecionação` WRITE;
/*!40000 ALTER TABLE `lecionação` DISABLE KEYS */;
/*!40000 ALTER TABLE `lecionação` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `turma`
--

DROP TABLE IF EXISTS `turma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `turma` (
  `turma_uuid` binary(16) NOT NULL,
  `dia_seq` enum('segunda','terca','quarta','quinta','sexta','sabado','domingo') NOT NULL,
  `periodo_seq` enum('matutino','verspertino','noturno') NOT NULL,
  PRIMARY KEY (`turma_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `turma`
--

LOCK TABLES `turma` WRITE;
/*!40000 ALTER TABLE `turma` DISABLE KEYS */;
INSERT INTO `turma` VALUES (0x392AA2415ADD11ECBF6B42010A9E0004,'segunda','noturno'),(0x45124E6F5ADD11ECBF6B42010A9E0004,'terca','noturno'),(0x4B4B4DC05ADD11ECBF6B42010A9E0004,'quarta','noturno'),(0x524659AA5ADD11ECBF6B42010A9E0004,'quinta','noturno'),(0x5BA5776D5ADD11ECBF6B42010A9E0004,'sexta','noturno'),(0x681FCDA25ADD11ECBF6B42010A9E0004,'sabado','matutino'),(0x7406212D5ADD11ECBF6B42010A9E0004,'domingo','verspertino');
/*!40000 ALTER TABLE `turma` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `turma_disciplina`
--

DROP TABLE IF EXISTS `turma_disciplina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `turma_disciplina` (
  `turma_uuid` binary(16) NOT NULL,
  `disciplina_uuid` binary(16) NOT NULL,
  `cria_date` timestamp NOT NULL,
  UNIQUE KEY `turma_uuid` (`turma_uuid`),
  KEY `disciplina_uuid` (`disciplina_uuid`),
  CONSTRAINT `turma_disciplina_ibfk_1` FOREIGN KEY (`turma_uuid`) REFERENCES `turma` (`turma_uuid`),
  CONSTRAINT `turma_disciplina_ibfk_2` FOREIGN KEY (`disciplina_uuid`) REFERENCES `disciplina` (`disciplina_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `turma_disciplina`
--

LOCK TABLES `turma_disciplina` WRITE;
/*!40000 ALTER TABLE `turma_disciplina` DISABLE KEYS */;
/*!40000 ALTER TABLE `turma_disciplina` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-12-18  0:45:00
