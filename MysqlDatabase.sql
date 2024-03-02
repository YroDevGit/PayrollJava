-- --------------------------------------------------------
-- Host:                         localhost
-- Server version:               10.4.24-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for payroll
Drop database payroll;
CREATE DATABASE IF NOT EXISTS `payroll` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `payroll`;

-- Dumping structure for table payroll.mailer
CREATE TABLE IF NOT EXISTS `mailer` (
  `mail_id` int(11) NOT NULL AUTO_INCREMENT,
  `vcode` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `stat` int(11) DEFAULT NULL,
  PRIMARY KEY (`mail_id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table payroll.mailer: ~11 rows (approximately)
INSERT INTO `mailer` (`mail_id`, `vcode`, `password`, `stat`) VALUES
	(11, 'NLCHREE687tyronemalocon@gmail.comOG5', '4TOPR', 0),
	(37, '8IYC3GA72Dtyrone.malocon@ecddigital.com.auF91', 'BODI9', 0),
	(38, '8G46A9JCEYlojabi9156@mcuma.comR3B', 'GE9R3', 0),
	(39, 'RY7GHTOIC3tyrone.malocon+23@ecddigital.com.auEBF', 'N59E2', 0),
	(40, '8NTG7LHPA3tyrone.malocon+234@ecddigital.com.auYEI', 'H6AGB', 0),
	(41, 'LTPI517BC2tyrone.malocon+2323@ecddigital.com.auYAE', '8BY1F', 0),
	(42, '9H25BTA7ECtyrone.malocon+232@ecddigital.com.auE1F', '85FCR', 0),
	(43, 'JGPO9IACFTtyrone.malocon+02@ecddigital.com.au61B', 'NFE91', 0),
	(44, 'HDOGE76CF3tyrone.malocon+012@ecddigital.com.auT9Y', 'R8Y3H', 0),
	(45, '4L6NJFD359tyrone.malocon+112@ecddigital.com.auC2E', 'R9PLC', 0),
	(46, 'O3TA5RHCJ4malocon.tyrence@gmail.com1G7', '7EL9I', 0);

-- Dumping structure for table payroll.roles
CREATE TABLE IF NOT EXISTS `roles` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_desc` varchar(200) DEFAULT NULL,
  `Salary` double DEFAULT NULL,
  `date_added` date DEFAULT NULL,
  `role_stat` int(11) DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=114 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table payroll.roles: ~15 rows (approximately)
INSERT INTO `roles` (`role_id`, `role_desc`, `Salary`, `date_added`, `role_stat`) VALUES
	(1, 'ADMIN', 500000, '2024-02-27', 0),
	(2, 'Junior Front End Developer', 30000, '2024-02-27', 0),
	(3, 'Junior Back End Developer', 35000, '2024-02-27', 0),
	(4, 'Mid Level Back End Developer', 60000, '2024-02-27', 0),
	(5, 'Mid Level Front End Developer', 50000, '2024-02-27', 0),
	(6, 'Senior Front End Developer', 90000, '2024-02-27', 0),
	(7, 'Senior Front End Developer', 110000, '2024-02-27', 0),
	(8, 'IT Tech Lead', 150000, '2024-02-27', 0),
	(9, 'IT Project Manager', 130000, '2024-02-27', 0),
	(10, 'Web Designer 1', 20000, '2024-02-27', 0),
	(11, 'Web Designer 2', 30000, '2024-02-27', 0),
	(12, 'Web Designer 3', 40000, '2024-02-27', 0),
	(13, 'Software Tester', 35000, '2024-02-27', 0),
	(14, 'IT Administrator', 90000, '2024-02-27', 0),
	(15, 'Intern Front End Developer', 25000, '2024-02-27', 0);

-- Dumping structure for table payroll.timesheet
CREATE TABLE IF NOT EXISTS `timesheet` (
  `t_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `task_name` varchar(50) DEFAULT NULL,
  `task_hours` double DEFAULT NULL,
  `task_date` date DEFAULT NULL,
  `stat` int(11) DEFAULT NULL,
  PRIMARY KEY (`t_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table payroll.timesheet: ~1 rows (approximately)
INSERT INTO `timesheet` (`t_id`, `user_id`, `task_name`, `task_hours`, `task_date`, `stat`) VALUES
	(1, 63, 'Task1', 3, '2024-03-02', 0);

-- Dumping structure for table payroll.users
CREATE TABLE IF NOT EXISTS `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `full_name` varchar(400) DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `contact` varchar(50) DEFAULT NULL,
  `address` varchar(1000) DEFAULT NULL,
  `role` int(11) DEFAULT NULL,
  `hire_date` date DEFAULT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `img` varchar(1000) DEFAULT NULL,
  `stat` int(11) DEFAULT NULL,
  `notified` int(11) DEFAULT 0,
  `vcode` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table payroll.users: ~3 rows (approximately)
INSERT INTO `users` (`user_id`, `full_name`, `birth_date`, `contact`, `address`, `role`, `hire_date`, `username`, `password`, `img`, `stat`, `notified`, `vcode`) VALUES
	(1, 'Hannah Limen', '2024-02-27', '0931826123', 'Pasig', 1, '2024-02-27', 'admin', 'admin', 'null', 0, 1, 'f34534f5345f'),
	(37, 'Tyrone Emz', '2024-02-21', '09232842734', 'Bacolod', 3, '2024-02-07', 'tyronemalocon@gmail.com', '4TOPR', 'notSet', 0, 0, 'NLCHREE687tyronemalocon@gmail.comOG5'),
	(63, 'Strong', '2024-02-02', '3247234', 'Address', 8, '2024-01-31', 'hannah', 'hannah', 'notSet', -1, 0, '8IYC3GA72Dtyrone.malocon@ecddigital.com.auF91');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
