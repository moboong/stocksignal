-- MariaDB dump 10.19  Distrib 10.6.4-MariaDB, for osx10.14 (x86_64)
--
-- Host: localhost    Database: pass
-- ------------------------------------------------------
-- Server version	10.6.4-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `PASS_APLY_MAS`
--

DROP TABLE IF EXISTS `PASS_APLY_MAS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PASS_APLY_MAS` (
  `USER_ID` varchar(50) NOT NULL,
  `APLY_SEQ` int(5) NOT NULL,
  `SYS_ID` varchar(10) NOT NULL,
  `SEC_KEY` varchar(100) DEFAULT NULL,
  `QR_DATA` text DEFAULT NULL,
  `PIN` varchar(6) DEFAULT NULL,
  `APLY_DTTM` datetime NOT NULL DEFAULT current_timestamp(),
  `AUTH_YN` char(1) NOT NULL DEFAULT 'N' COMMENT 'Y:인증, N:미인증',
  `AUTH_DTTM` datetime DEFAULT NULL,
  `REG_DTTM` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`USER_ID`,`APLY_SEQ`,`SYS_ID`),
  KEY `FK_SYS_MAS_TO_PASS_APLY_MAS_1` (`SYS_ID`),
  CONSTRAINT `FK_SYS_MAS_TO_PASS_APLY_MAS_1` FOREIGN KEY (`SYS_ID`) REFERENCES `SYS_MAS` (`SYS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PASS_APLY_MAS`
--

LOCK TABLES `PASS_APLY_MAS` WRITE;
/*!40000 ALTER TABLE `PASS_APLY_MAS` DISABLE KEYS */;
INSERT INTO `PASS_APLY_MAS` VALUES ('B0210E223',1,'01','1q2we3r4t5t','1q1w2e3r4t5y','123456','2022-01-18 18:24:06','N','2022-01-02 00:00:00','2022-01-18 18:24:06'),('C0023A238',2,'02','5t4r3e2w1q','1q1w2e3r4t5y22','443322','2022-01-20 16:08:28','Y','2022-01-20 00:00:00','2022-01-20 16:08:28'),('C7266D132',3,'01','9o8i7u6y5t','iu89oj9iu9uiowef3t','938475','2022-01-20 16:14:39','N','2022-01-21 00:00:00','2022-01-20 16:14:39');
/*!40000 ALTER TABLE `PASS_APLY_MAS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PASS_AUTH_HIS`
--

DROP TABLE IF EXISTS `PASS_AUTH_HIS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PASS_AUTH_HIS` (
  `AUTH_SEQ` int(11) NOT NULL,
  `SYS_ID` varchar(10) NOT NULL,
  `PASS_ID` varchar(50) NOT NULL,
  `AUTH_TYPE` char(1) NOT NULL COMMENT '1:수기,2:QR',
  `AUTH_DTTM` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`AUTH_SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PASS_AUTH_HIS`
--

LOCK TABLES `PASS_AUTH_HIS` WRITE;
/*!40000 ALTER TABLE `PASS_AUTH_HIS` DISABLE KEYS */;
/*!40000 ALTER TABLE `PASS_AUTH_HIS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PASS_MAS`
--

DROP TABLE IF EXISTS `PASS_MAS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PASS_MAS` (
  `PASS_ID` varchar(50) NOT NULL,
  `SYS_ID` varchar(10) NOT NULL,
  `SEC_KEY` varchar(100) NOT NULL,
  `PASS_ST` char(1) NOT NULL DEFAULT '1' COMMENT '1:정상,9:해지',
  `REG_DTTM` datetime NOT NULL DEFAULT current_timestamp(),
  `DEREG_DTTM` datetime DEFAULT NULL,
  `USER_ID` varchar(50) NOT NULL,
  `APLY_SEQ` int(11) NOT NULL,
  PRIMARY KEY (`PASS_ID`,`SYS_ID`),
  KEY `FK_SYS_MAS_TO_PASS_MAS_1` (`SYS_ID`),
  CONSTRAINT `FK_SYS_MAS_TO_PASS_MAS_1` FOREIGN KEY (`SYS_ID`) REFERENCES `SYS_MAS` (`SYS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PASS_MAS`
--

LOCK TABLES `PASS_MAS` WRITE;
/*!40000 ALTER TABLE `PASS_MAS` DISABLE KEYS */;
INSERT INTO `PASS_MAS` VALUES ('P012312','01','SE213KE442Y','1','2022-01-21 18:02:28',NULL,'C7266D132',1),('P772312','02','SE263KE462Y','1','2022-01-21 18:03:30',NULL,'B0210E223',2);
/*!40000 ALTER TABLE `PASS_MAS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QR_AUTH_SESS_HIS`
--

DROP TABLE IF EXISTS `QR_AUTH_SESS_HIS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `QR_AUTH_SESS_HIS` (
  `SESS_ID` varchar(100) NOT NULL,
  `SYS_ID` varchar(10) NOT NULL,
  `AUTH_YN` char(1) NOT NULL DEFAULT 'N' COMMENT 'Y:인증,N:미인증',
  `AUTH_DTTM` datetime DEFAULT NULL,
  `REG_DTTM` datetime NOT NULL DEFAULT current_timestamp(),
  `PASS_ID` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`SESS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QR_AUTH_SESS_HIS`
--

LOCK TABLES `QR_AUTH_SESS_HIS` WRITE;
/*!40000 ALTER TABLE `QR_AUTH_SESS_HIS` DISABLE KEYS */;
/*!40000 ALTER TABLE `QR_AUTH_SESS_HIS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SYS_MAS`
--

DROP TABLE IF EXISTS `SYS_MAS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SYS_MAS` (
  `SYS_ID` varchar(10) NOT NULL,
  `BIZ_NM` varchar(50) NOT NULL,
  `SYS_NM` varchar(50) DEFAULT NULL,
  `SYS_ST` char(1) NOT NULL COMMENT '1:정상,9:해지',
  `PASS_PTN_TYPE` char(1) NOT NULL COMMENT '1:영숫자,2:숫자',
  `PASS_SIZE` tinyint(2) NOT NULL,
  `QR_USE_YN` char(1) NOT NULL DEFAULT 'N' COMMENT 'Y:사용,N:미사용',
  `REG_DTTM` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`SYS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SYS_MAS`
--

LOCK TABLES `SYS_MAS` WRITE;
/*!40000 ALTER TABLE `SYS_MAS` DISABLE KEYS */;
INSERT INTO `SYS_MAS` VALUES ('01','TI','OS','1','1',3,'N','2022-01-18 18:20:35'),('02','HL','OS2','1','1',3,'N','2022-01-18 18:21:03');
/*!40000 ALTER TABLE `SYS_MAS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TRS_LOG_HIS`
--

DROP TABLE IF EXISTS `TRS_LOG_HIS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TRS_LOG_HIS` (
  `TRS_SEQ` varchar(20) NOT NULL,
  `TRS_DTTM` datetime NOT NULL DEFAULT current_timestamp(),
  `TRS_CD` varchar(4) DEFAULT NULL,
  `RES_CD` varchar(4) DEFAULT NULL,
  `REQ_MSG` text DEFAULT NULL,
  `RES_MSG` text DEFAULT NULL,
  `SYS_ID` varchar(10) DEFAULT NULL,
  `PASS_ID` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`TRS_SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TRS_LOG_HIS`
--

LOCK TABLES `TRS_LOG_HIS` WRITE;
/*!40000 ALTER TABLE `TRS_LOG_HIS` DISABLE KEYS */;
/*!40000 ALTER TABLE `TRS_LOG_HIS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(10) DEFAULT NULL,
  `password` varchar(12) NOT NULL,
  `firstName` varchar(10) DEFAULT NULL,
  `lastName` varchar(10) DEFAULT NULL,
  `age` tinyint(4) DEFAULT NULL,
  `salary` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'피카츄','1234','kachu','pi',1,100000),(2,'김하나','123123','hana','kim',28,3000000);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-01-27 16:31:37
