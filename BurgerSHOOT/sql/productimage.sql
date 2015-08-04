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

-- Dumping structure for table app.productimage
CREATE TABLE IF NOT EXISTS `productimage` (
  `fldid` int(11) NOT NULL AUTO_INCREMENT,
  `fldimage` blob,
  `fldname` varchar(100) DEFAULT NULL,
  `fldtype` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`fldid`),
  UNIQUE KEY `fldid` (`fldid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table app.productimage: ~0 rows (approximately)
/*!40000 ALTER TABLE `productimage` DISABLE KEYS */;
/*!40000 ALTER TABLE `productimage` ENABLE KEYS */;
/*!40014 SET FOREIGN_KEY_CHECKS=1 */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
