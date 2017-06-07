CREATE DATABASE  IF NOT EXISTS `inventario` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `inventario`;
-- MySQL dump 10.13  Distrib 5.6.23, for Win32 (x86)
--
-- Host: localhost    Database: inventario
-- ------------------------------------------------------
-- Server version	5.6.24-log

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
  `valor_abono` float NOT NULL,
  `cod_factura` int(11) NOT NULL,
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
INSERT INTO `abonos` VALUES (1,50000,1),(2,60000,2),(3,30000,5),(4,20000,14),(5,20000,14),(6,50000,13),(7,50000,15),(8,30000,14),(9,5000,15);
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
INSERT INTO `categoria` VALUES (1,'Accesorio'),(2,'Blusa'),(3,'Camisera'),(4,'Camiseta Polo'),(5,'Camiseta Tela Fria'),(6,'Camisa Manga Larga'),(7,'Jean'),(8,'Buso'),(9,'Chaleco'),(10,'pruebaCallable'),(34,'insertandoporprocedimiento'),(56532,'nnnnn');
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
  `cantidad_producto` int(11) NOT NULL,
  `valor_producto` float NOT NULL,
  PRIMARY KEY (`cod_det_factura`),
  KEY `cod_factura_idx` (`cod_factura`),
  KEY `cod_producto_idx` (`cod_producto`),
  CONSTRAINT `cod_factura` FOREIGN KEY (`cod_factura`) REFERENCES `factura` (`cod_factura`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `cod_producto` FOREIGN KEY (`cod_producto`) REFERENCES `producto` (`cod_producto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_factura`
--

LOCK TABLES `detalle_factura` WRITE;
/*!40000 ALTER TABLE `detalle_factura` DISABLE KEYS */;
INSERT INTO `detalle_factura` VALUES (2,1,123,1,90000),(3,1,123,2,180000),(4,1,123,1,90000),(5,2,123,1,90000),(6,2,432,1,160000),(7,2,432,1,160000),(8,3,432,4,640000),(9,4,432,1,160000),(10,7,432,1,160000),(11,9,432,1,160000),(12,10,1,1,10000),(13,10,1,1,10000),(14,11,1,1,10000),(15,12,1,1,10000),(16,12,1,1,10000),(17,13,222,1,55000),(18,14,222,2,110000),(19,15,222,1,55000);
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
  `num_accesos` int(11) DEFAULT NULL,
  `bloqueado` char(1) DEFAULT NULL,
  PRIMARY KEY (`cod_empleado_persona`),
  UNIQUE KEY `login_empleado_UNIQUE` (`login_empleado`),
  CONSTRAINT `cod_empleado_person` FOREIGN KEY (`cod_empleado_persona`) REFERENCES `persona` (`cod_persona`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleado`
--

LOCK TABLES `empleado` WRITE;
/*!40000 ALTER TABLE `empleado` DISABLE KEYS */;
INSERT INTO `empleado` VALUES (1,'CarolVasquezB','carol123',2,'F'),(12,'admin','12345678',1,'F'),(111,'carol','111',2,'F');
/*!40000 ALTER TABLE `empleado` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `inventario`.`empleado_BEFORE_UPDATE` BEFORE UPDATE ON `empleado` FOR EACH ROW
BEGIN
		if old.num_accesos = 2 then
			update empleado set bloqueado='T' ;
		end if;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleado_rol`
--

LOCK TABLES `empleado_rol` WRITE;
/*!40000 ALTER TABLE `empleado_rol` DISABLE KEYS */;
INSERT INTO `empleado_rol` VALUES (1,1,1);
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
INSERT INTO `factura` VALUES (1,360000,'2017-06-01',1,1),(2,410000,'2017-06-02',1,1),(3,640000,'2017-06-01',1,1),(4,160000,'2017-06-06',1,1),(5,160000,'2017-06-06',1,1),(6,0,'2017-06-06',1,1),(7,160000,'2017-06-01',1,1),(8,170000,'2017-06-01',1,1),(9,160000,'2017-06-01',1,1),(10,20000,'2017-06-01',1,1),(11,10000,'2017-06-02',1,1),(12,20000,'2017-06-02',1,1),(13,55000,'2017-06-02',2,1),(14,110000,'2017-06-09',2,1),(15,55000,'2017-06-10',2,1);
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
  `fecha_nac_persona` date DEFAULT NULL,
  PRIMARY KEY (`cod_persona`),
  UNIQUE KEY `correo_persona_UNIQUE` (`correo_persona`)
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persona`
--

LOCK TABLES `persona` WRITE;
/*!40000 ALTER TABLE `persona` DISABLE KEYS */;
INSERT INTO `persona` VALUES (1,1061785255,'Carol Elizabeth','Vasquez Burbano','carolvasquezb@gmail.com','1995-10-19'),(2,123,'Elizabeth','Vasquez','carolvasquez@gmail.com','2017-06-08'),(12,1061785255,'prueba','nn','rrr@g.com','1995-10-02'),(111,106178522,'Carol','Vasquez','gatitosh','2017-06-02');
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
  `stock_producto` int(11) NOT NULL,
  `cod_categoria` int(11) NOT NULL,
  `valor_venta_min` float NOT NULL,
  `fecha_compra` date NOT NULL,
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
INSERT INTO `producto` VALUES (1,'Blusa',NULL,25000,35000,10,2,10000,'2017-06-02'),(123,'pulsera','material plata tejido nuevo',80000,100000,5,1,90000,'2017-05-20'),(222,'Jean','		',50000,60000,20,7,55000,'2017-06-02'),(432,'reloj','prueba descripcion',150000,170000,10,1,160000,'2017-05-20');
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
INSERT INTO `rol` VALUES (1,'Administrador'),(2,'Vendedorcita'),(3,'Vendedora'),(33,'Gatosh');
/*!40000 ALTER TABLE `rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'inventario'
--
/*!50003 DROP PROCEDURE IF EXISTS `consultar_facturas_reporte` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `consultar_facturas_reporte`(in fecha_factura1 varchar(20),in fecha_factura2 varchar(20))
BEGIN
select * from factura where fecha_factura BETWEEN fecha_factura1 and fecha_factura2; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InsertarCategoria` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarCategoria`(codigo_categoria int,nombre_categoria varchar(45))
BEGIN
Insert into categoria (cod_categoria, nombre_categoria) values(codigo_categoria,nombre_categoria); 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Reporte_Fechas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Reporte_Fechas`(in fecha_factura1 varchar(15),in fecha_factura2 varchar(15),out total int,out sum_total_facturas float(15))
BEGIN
select * from factura where fecha_factura BETWEEN fecha_factura1 and fecha_factura2; 
select count(*)into total from(select * from factura where fecha_factura BETWEEN fecha_factura1 and fecha_factura2)t1; 

select sum(valor_factura)into sum_total_facturas from(select * from factura where fecha_factura BETWEEN fecha_factura1 and fecha_factura2)t2;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-06-07 14:25:40
