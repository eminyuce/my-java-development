-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.1.48-community - MySQL Community Server (GPL)
-- Server OS:                    Win32
-- HeidiSQL version:             7.0.0.4140
-- Date/time:                    2012-06-06 15:41:07
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET FOREIGN_KEY_CHECKS=0 */;

-- Dumping structure for table app.producttype
CREATE TABLE IF NOT EXISTS `producttype` (
  `fldid` int(11) NOT NULL AUTO_INCREMENT,
  `fldname` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`fldid`),
  UNIQUE KEY `fldid` (`fldid`),
  UNIQUE KEY `fldname` (`fldname`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Dumping data for table app.producttype: ~3 rows (approximately)
/*!40000 ALTER TABLE `producttype` DISABLE KEYS */;
INSERT INTO `producttype` (`fldid`, `fldname`) VALUES
	(2, 'Döner'),
	(3, 'Kokoreç'),
	(1, 'Pizza');
/*!40000 ALTER TABLE `producttype` ENABLE KEYS */;
/*!40014 SET FOREIGN_KEY_CHECKS=1 */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
