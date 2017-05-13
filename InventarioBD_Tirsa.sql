CREATE DATABASE  IF NOT EXISTS `inventario` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `inventario`;
-- MySQL dump 10.13  Distrib 5.6.23, for Win32 (x86)
--
-- Host: localhost    Database: inventario
-- ------------------------------------------------------
-- Server version	5.6.24-log
--modificado el 13/05/2017
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
-- Table structure for table `abonos`
--

DROP TABLE IF EXISTS `abonos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `abonos` (
  `cod_abono` int(11) NOT NULL,
  `cod_factura` int(11) NOT NULL,
  `valor_abono` float NOT NULL,
  PRIMARY KEY (`cod_abono`),
  KEY `fk_cod_factura_idx` (`cod_factura`),
  CONSTRAINT `fk_cod_factura` FOREIGN KEY (`cod_factura`) REFERENCES `factura` (`cod_factura`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `abonos`
--

LOCK TABLES `abonos` WRITE;
/*!40000 ALTER TABLE `abonos` DISABLE KEYS */;
/*!40000 ALTER TABLE `abonos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categoria` (
  `cod_categoria` int(11) NOT NULL,
  `nombre_categoria` varchar(45) NOT NULL,
  PRIMARY KEY (`cod_categoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (1,'Accesorio'),(2,'Blusa'),(3,'Camisera'),(4,'Camiseta Polo'),(5,'Camiseta Tela Fria'),(6,'Camisa Manga Larga'),(7,'Jean'),(8,'Buso'),(9,'Chaleco');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_factura`
--

DROP TABLE IF EXISTS `detalle_factura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detalle_factura` (
  `cod_det_factura` int(11) NOT NULL AUTO_INCREMENT,
  `cod_factura` int(11) NOT NULL,
  `cod_producto` int(11) NOT NULL,
  PRIMARY KEY (`cod_det_factura`),
  KEY `cod_factura_idx` (`cod_factura`),
  KEY `cod_producto_idx` (`cod_producto`),
  CONSTRAINT `cod_factura` FOREIGN KEY (`cod_factura`) REFERENCES `factura` (`cod_factura`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `cod_producto` FOREIGN KEY (`cod_producto`) REFERENCES `producto` (`cod_producto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_factura`
--

LOCK TABLES `detalle_factura` WRITE;
/*!40000 ALTER TABLE `detalle_factura` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalle_factura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleado`
--

DROP TABLE IF EXISTS `empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `empleado` (
  `cod_empleado_persona` int(11) NOT NULL AUTO_INCREMENT,
  `login_empleado` varchar(45) NOT NULL,
  `password_empleado` varchar(45) NOT NULL,
  PRIMARY KEY (`cod_empleado_persona`),
  UNIQUE KEY `login_empleado_UNIQUE` (`login_empleado`),
  CONSTRAINT `cod_empleado_person` FOREIGN KEY (`cod_empleado_persona`) REFERENCES `persona` (`cod_persona`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleado`
--

LOCK TABLES `empleado` WRITE;
/*!40000 ALTER TABLE `empleado` DISABLE KEYS */;
/*!40000 ALTER TABLE `empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleado_rol`
--

DROP TABLE IF EXISTS `empleado_rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `empleado_rol` (
  `cod_empleado_rol` int(11) NOT NULL AUTO_INCREMENT,
  `cod_empleado_persona` int(11) NOT NULL,
  `cod_rol` int(11) NOT NULL,
  PRIMARY KEY (`cod_empleado_rol`),
  KEY `cod_rol_idx` (`cod_rol`),
  KEY `cod_empleado_persona_idx` (`cod_empleado_persona`),
  CONSTRAINT `cod_empleado_persona` FOREIGN KEY (`cod_empleado_persona`) REFERENCES `empleado` (`cod_empleado_persona`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `cod_rol` FOREIGN KEY (`cod_rol`) REFERENCES `rol` (`cod_rol`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleado_rol`
--

LOCK TABLES `empleado_rol` WRITE;
/*!40000 ALTER TABLE `empleado_rol` DISABLE KEYS */;
/*!40000 ALTER TABLE `empleado_rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `factura`
--

DROP TABLE IF EXISTS `factura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `factura` (
  `cod_factura` int(11) NOT NULL,
  `valor_factura` float NOT NULL,
  `fecha_factura` date NOT NULL,
  `tipo_pago_factura` varchar(45) NOT NULL,
  `cod_cliente` int(11) NOT NULL,
  `cod_empleado` int(11) NOT NULL,
  PRIMARY KEY (`cod_factura`),
  KEY `cod_empleado_idx` (`cod_empleado`),
  KEY `cod_cliente_idx` (`cod_cliente`),
  CONSTRAINT `cod_cliente` FOREIGN KEY (`cod_cliente`) REFERENCES `persona` (`cod_persona`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `cod_empleado` FOREIGN KEY (`cod_empleado`) REFERENCES `empleado` (`cod_empleado_persona`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `factura`
--

LOCK TABLES `factura` WRITE;
/*!40000 ALTER TABLE `factura` DISABLE KEYS */;
/*!40000 ALTER TABLE `factura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persona`
--

DROP TABLE IF EXISTS `persona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `persona` (
  `cod_persona` int(11) NOT NULL AUTO_INCREMENT,
  `num_documento` int(10) unsigned NOT NULL,
  `nombres_persona` varchar(45) NOT NULL,
  `apellidos_persona` varchar(45) NOT NULL,
  `correo_persona` varchar(45) DEFAULT NULL,
  `fecha_nac_persona` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`cod_persona`),
  UNIQUE KEY `correo_persona_UNIQUE` (`correo_persona`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persona`
--

LOCK TABLES `persona` WRITE;
/*!40000 ALTER TABLE `persona` DISABLE KEYS */;
/*!40000 ALTER TABLE `persona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `producto` (
  `cod_producto` int(11) NOT NULL,
  `nombre_producto` varchar(45) NOT NULL,
  `descr_producto` varchar(45) DEFAULT NULL,
  `valor_compra` float NOT NULL,
  `valor_venta_max` float NOT NULL,
  `cantidad` int(11) NOT NULL,
  `cod_categoria` int(11) NOT NULL,
  `valor_venta_min` float NOT NULL,
  PRIMARY KEY (`cod_producto`),
  KEY `cod_categoria_idx` (`cod_categoria`),
  CONSTRAINT `cod_categoria` FOREIGN KEY (`cod_categoria`) REFERENCES `categoria` (`cod_categoria`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rol`
--

DROP TABLE IF EXISTS `rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rol` (
  `cod_rol` int(11) NOT NULL,
  `nombre_rol` varchar(45) NOT NULL,
  PRIMARY KEY (`cod_rol`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol`
--

LOCK TABLES `rol` WRITE;
/*!40000 ALTER TABLE `rol` DISABLE KEYS */;
/*!40000 ALTER TABLE `rol` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-05-13 12:21:09
