-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.1.48-community - MySQL Community Server (GPL)
-- Server OS:                    Win32
-- HeidiSQL version:             7.0.0.4140
-- Date/time:                    2012-06-06 15:41:06
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET FOREIGN_KEY_CHECKS=0 */;

-- Dumping structure for table app.product
CREATE TABLE IF NOT EXISTS `product` (
  `fldid` int(11) NOT NULL AUTO_INCREMENT,
  `calcium` int(11) NOT NULL,
  `calorie` int(11) NOT NULL,
  `carbohydrate` int(11) NOT NULL,
  `cholesterol` int(11) NOT NULL,
  `fat` int(11) NOT NULL,
  `fiber` int(11) NOT NULL,
  `flddesc` text,
  `fldname` varchar(20) DEFAULT NULL,
  `iron` int(11) NOT NULL,
  `protein` int(11) NOT NULL,
  `salt` int(11) NOT NULL,
  `sodium` int(11) NOT NULL,
  `sugar` int(11) NOT NULL,
  `vit_a` int(11) DEFAULT NULL,
  `vit_c` int(11) DEFAULT NULL,
  `fldtype` int(11) DEFAULT NULL,
  `fldimage` int(11) DEFAULT NULL,
  PRIMARY KEY (`fldid`),
  UNIQUE KEY `fldid` (`fldid`),
  KEY `FKED8DCCEF90E910FD` (`fldimage`),
  KEY `FKED8DCCEFFC74FB4D` (`fldtype`),
  CONSTRAINT `FKED8DCCEF90E910FD` FOREIGN KEY (`fldimage`) REFERENCES `productimage` (`fldid`),
  CONSTRAINT `FKED8DCCEFFC74FB4D` FOREIGN KEY (`fldtype`) REFERENCES `producttype` (`fldid`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- Dumping data for table app.product: ~2 rows (approximately)
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` (`fldid`, `calcium`, `calorie`, `carbohydrate`, `cholesterol`, `fat`, `fiber`, `flddesc`, `fldname`, `iron`, `protein`, `salt`, `sodium`, `sugar`, `vit_a`, `vit_c`, `fldtype`, `fldimage`) VALUES
	(18, 2, 3, 4, 5, 6, 6, '44', '44', 5, 5, 6, 7, 4, 4, 4, 1, NULL),
	(19, 12, 23, 34, 45, 56, 56, '5', '5', 45, 4, 4, 3, 2, 2, 3, 2, NULL);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
/*!40014 SET FOREIGN_KEY_CHECKS=1 */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
