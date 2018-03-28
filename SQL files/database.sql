-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: grupparbete
-- ------------------------------------------------------
-- Server version	5.7.21-log

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
-- Table structure for table `addresses`
--

DROP TABLE IF EXISTS `addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `addresses` (
  `addressID` int(11) NOT NULL AUTO_INCREMENT,
  `streetAddress` varchar(45) COLLATE utf8mb4_swedish_ci DEFAULT NULL,
  `zipCode` varchar(20) COLLATE utf8mb4_swedish_ci DEFAULT NULL,
  `city` varchar(45) COLLATE utf8mb4_swedish_ci DEFAULT NULL,
  `state` varchar(45) COLLATE utf8mb4_swedish_ci DEFAULT NULL,
  `country` varchar(45) COLLATE utf8mb4_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`addressID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addresses`
--

LOCK TABLES `addresses` WRITE;
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
INSERT INTO `addresses` VALUES (5,'Kronsätersvägen 7','64693','Gnesta','Blekinge','Sweden'),(6,'Nekvägen 92','26139','Landskrona','Skåne','Sweden'),(7,'Yxkroken 2','78454','Borlänge','Dalarna','Sweden'),(8,'17 Partickhill Road','G128HN','Glasgow','Glasgow City','United Kingdom'),(9,'Högalidsvägen 420','38338','Mönsterås','Kalmar','Sweden');
/*!40000 ALTER TABLE `addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderdetails`
--

DROP TABLE IF EXISTS `orderdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orderdetails` (
  `orderNumber` int(11) NOT NULL,
  `productNumber` int(11) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `priceEach` double DEFAULT NULL,
  PRIMARY KEY (`orderNumber`,`productNumber`),
  KEY `fk_orderDetails_orders1_idx` (`orderNumber`),
  KEY `fk_orderDetails_products1_idx` (`productNumber`),
  CONSTRAINT `fk_orderDetails_orders1` FOREIGN KEY (`orderNumber`) REFERENCES `orders` (`orderNumber`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_orderDetails_products1` FOREIGN KEY (`productNumber`) REFERENCES `products` (`productNumber`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderdetails`
--

LOCK TABLES `orderdetails` WRITE;
/*!40000 ALTER TABLE `orderdetails` DISABLE KEYS */;
INSERT INTO `orderdetails` VALUES (1,2,7,7),(1,4,6,4),(2,1,21,5),(2,2,22,7),(2,3,3,5),(3,2,28,7),(3,4,10,4),(4,3,12,4),(5,4,25,4),(6,4,15,4),(9,1,4,5),(9,2,2,7),(9,3,11,4),(9,4,11,4),(10,4,24,4),(11,2,13,7),(12,1,30,5),(12,3,25,4),(13,1,22,5),(13,2,3,7),(14,2,8,7),(15,1,14,5),(15,2,24,7),(15,4,13,4),(16,1,21,5),(16,3,17,4),(17,2,4,7),(17,3,3,4),(18,1,7,5),(18,3,2,4),(19,1,11,5),(19,3,13,4),(20,2,4,7),(20,3,1,4);
/*!40000 ALTER TABLE `orderdetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `orderNumber` int(11) NOT NULL AUTO_INCREMENT,
  `orderDate` date DEFAULT NULL,
  `orderStatus` enum('PROCESSING','SHIPPED','FINISHED') COLLATE utf8mb4_swedish_ci DEFAULT NULL,
  `shippedDate` date DEFAULT NULL,
  `userID` int(11) DEFAULT NULL,
  PRIMARY KEY (`orderNumber`),
  KEY `UserID_idx` (`userID`),
  CONSTRAINT `UserID` FOREIGN KEY (`userID`) REFERENCES `users` (`userID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'2017-06-17','SHIPPED','2017-06-19',13),(2,'2017-08-05','SHIPPED','2017-08-06',6),(3,'2017-06-05','SHIPPED','2017-06-07',6),(4,'2017-06-25','SHIPPED','2017-06-28',6),(5,'2017-04-27','SHIPPED','2017-04-28',11),(6,'2017-07-11','SHIPPED','2017-07-12',12),(7,'2017-09-04','SHIPPED','2017-09-06',10),(8,'2017-07-02','SHIPPED','2017-07-03',10),(9,'2018-01-10','SHIPPED','2018-01-11',13),(10,'2018-02-10','SHIPPED','2018-02-11',11),(11,'2017-04-03','SHIPPED','2017-04-06',5),(12,'2017-11-15','SHIPPED','2017-11-16',9),(13,'2017-11-10','SHIPPED','2017-11-12',7),(14,'2017-04-12','SHIPPED','2017-04-13',13),(15,'2017-09-06','SHIPPED','2017-09-09',11),(16,'2017-05-12','SHIPPED','2017-05-13',8),(17,'2017-06-06','SHIPPED','2017-06-09',11),(18,'2017-04-08','SHIPPED','2017-04-10',11),(19,'2017-07-08','SHIPPED','2017-07-09',5),(20,'2017-07-02','SHIPPED','2017-07-04',10);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payments` (
  `paymentID` int(11) NOT NULL AUTO_INCREMENT,
  `paymentDate` date DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `orders_orderNumber` int(11) NOT NULL,
  PRIMARY KEY (`paymentID`),
  KEY `fk_payments_orders1_idx` (`orders_orderNumber`),
  CONSTRAINT `fk_payments_orders1` FOREIGN KEY (`orders_orderNumber`) REFERENCES `orders` (`orderNumber`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `productNumber` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8mb4_swedish_ci DEFAULT NULL,
  `price` double DEFAULT NULL,
  `supplier_supplierID` int(11) NOT NULL,
  PRIMARY KEY (`productNumber`),
  KEY `fk_products_supplier1_idx` (`supplier_supplierID`),
  CONSTRAINT `fk_products_supplier1` FOREIGN KEY (`supplier_supplierID`) REFERENCES `supplier` (`supplierID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Banana',5,1),(2,'Banana (Eco)',7,1),(3,'Granny Smith',4,2),(4,'Golden Delicious',4,2);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `roleID` int(11) NOT NULL AUTO_INCREMENT,
  `RoleName` varchar(45) COLLATE utf8mb4_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`roleID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'customer'),(2,'admin');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier`
--

DROP TABLE IF EXISTS `supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `supplier` (
  `supplierID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8mb4_swedish_ci DEFAULT NULL,
  `contactName` varchar(45) COLLATE utf8mb4_swedish_ci DEFAULT NULL,
  `phone` int(11) DEFAULT NULL,
  `orgnr` int(11) DEFAULT NULL,
  `AddressID` int(11) NOT NULL,
  PRIMARY KEY (`supplierID`),
  KEY `Address_idx` (`AddressID`),
  CONSTRAINT `Supplier_address` FOREIGN KEY (`AddressID`) REFERENCES `addresses` (`addressID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci COMMENT='			';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier`
--

LOCK TABLES `supplier` WRITE;
/*!40000 ALTER TABLE `supplier` DISABLE KEYS */;
INSERT INTO `supplier` VALUES (1,'Chiquita Banana','Stephen Banana',123456789,1337,5),(2,'Gärds Äpplen','Gärd Rosengren',987654321,8562,6),(3,'Nektarin Deluxe','Sabina Löfström',564738392,1740,8);
/*!40000 ALTER TABLE `supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `userID` int(11) NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(45) COLLATE utf8mb4_swedish_ci DEFAULT NULL,
  `LastName` varchar(45) COLLATE utf8mb4_swedish_ci DEFAULT NULL,
  `AddressID` int(11) DEFAULT NULL,
  `Email` varchar(45) COLLATE utf8mb4_swedish_ci DEFAULT NULL,
  `Password` varchar(45) COLLATE utf8mb4_swedish_ci DEFAULT NULL,
  `RoleID` int(11) DEFAULT NULL,
  PRIMARY KEY (`userID`),
  KEY `Role_idx` (`RoleID`),
  KEY `Address_idx` (`AddressID`),
  CONSTRAINT `Address` FOREIGN KEY (`AddressID`) REFERENCES `addresses` (`addressID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Role` FOREIGN KEY (`RoleID`) REFERENCES `roles` (`roleID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Helge','Hjerpe',5,'helge.hjerpe@mailinator.com','f9~SE4|;',1),(2,'Antonia','Mattiasson',6,'antonia.mattiasson@mailinater.com','~{X(3n)/',2),(3,'Signar','Sigfridsson',7,'signar.sigfridsson@mailmetrash.com','qPP{#Rj@',2),(4,'Peter','Sunesson',8,'peter.sunesson@dodgit.com','!XES7KGW',2),(5,'Lorentz','Bratt',9,'lorentz.bratt@dodgit.com','2C~3||x',2),(6,'Robin','Norström',7,'robin.norstrom@spamherelots.com',';/gwW&RJ',2),(7,'Vivan','Broberg',8,'vivan.broberg@spamherelots.com','9+P^3b=$',2),(8,'Andrea','Ferm',8,'andrea.ferm@dodgit.com','8/Bv{5mX',2),(9,'Margareth','Dahlin',7,'margareth.dahlin@mailinator.com','WvFi1=,:',2),(10,'Michael','Strömbäck',8,'michael.stromback@mailinator.com','=cq6OyeM',2),(11,'Vivan','Classon',9,'vivan.classon@mailinator.com','z@xVf9Eu',2),(12,'Ann-Christin','Hultqvist',6,'annchristin.hultqvist@mailinator.com','.){(Fd%$',2),(13,'Gärd','Rosengren',6,'gard.rosengren@dodgit.com','vOOkH/x%',2);
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

-- Dump completed on 2018-03-28 16:14:59
