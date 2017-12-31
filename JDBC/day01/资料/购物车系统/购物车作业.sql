/*
SQLyog Ultimate v9.30 
MySQL - 5.0.18-nt : Database - bookapp
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`bookapp` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `bookapp`;

/*Table structure for table `tb_book` */

DROP TABLE IF EXISTS `tb_book`;

CREATE TABLE `tb_book` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(54) default NULL,
  `author` varchar(54) default NULL,
  `publicationdate` date default NULL,
  `publication` varchar(150) default NULL,
  `price` double default NULL,
  `image` varchar(54) default NULL,
  `remark` varchar(600) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tb_book` */

insert  into `tb_book`(`id`,`name`,`author`,`publicationdate`,`publication`,`price`,`image`,`remark`) values (2,'编程思想','十年 编著','2008-11-01','电子工业出版社',59.2,'programmingIdeas.jpg','本书主要介绍如何以好的程序设计理念，实现代码的最优化'),(3,'疯狂Android讲义(含CD光盘1','李刚 编著','2011-07-01','电子工业出版社',60.6,'android.jpg','计算机便携化是未来的发展趋势，而Android作为最受欢迎的手机、平板电脑操作之一，其发展的上升势头是势不可当的。而Android应用选择了Java作为其开发语言，对于Java来说也是一次极好的机会。'),(4,'疯狂Ajax讲义(含CD光盘1张)','李刚 编著','2011-07-01','电子工业出版社',66.6,'ajax.jpg','异步访问技术,现在所有网站都在用.'),(7,'编程思想2','十年',NULL,NULL,101,'ajax.jpg','程序员开发宝典'),(8,'编程思想3','十年',NULL,NULL,101,'ajax.jpg','程序员开发宝典'),(9,'编程思想4','十年',NULL,NULL,101,'ajax.jpg','程序员开发宝典'),(10,'编程思想5','十年',NULL,NULL,101,'ajax.jpg','程序员开发宝典'),(11,'编程思想6','十年',NULL,NULL,101,'ajax.jpg','程序员开发宝典'),(12,'编程思想7','十年',NULL,NULL,101,'ajax.jpg','程序员开发宝典'),(13,'编程思想8','十年',NULL,NULL,101,'ajax.jpg','程序员开发宝典'),(15,'编程思想10','十年',NULL,NULL,101,'ajax.jpg','程序员开发宝典'),(16,'编程思想11','十年',NULL,NULL,101,'ajax.jpg','程序员开发宝典'),(17,'编程思想12','十年',NULL,NULL,101,'ajax.jpg','程序员开发宝典'),(18,'编程思想13','十年',NULL,NULL,101,'ajax.jpg','程序员开发宝典'),(19,'编程思想14','十年',NULL,NULL,101,'ajax.jpg','程序员开发宝典');

/*Table structure for table `tb_item` */

DROP TABLE IF EXISTS `tb_item`;

CREATE TABLE `tb_item` (
  `book_id` int(11) default NULL,
  `order_id` int(11) default NULL,
  `amount` int(11) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tb_item` */

insert  into `tb_item`(`book_id`,`order_id`,`amount`) values (2,34,2);

/*Table structure for table `tb_order` */

DROP TABLE IF EXISTS `tb_order`;

CREATE TABLE `tb_order` (
  `id` int(11) NOT NULL auto_increment,
  `order_No` varchar(90) default NULL,
  `cruedate` date default NULL,
  `outdate` date default NULL,
  `user_id` int(11) default NULL,
  `money` double default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tb_order` */

insert  into `tb_order`(`id`,`order_No`,`cruedate`,`outdate`,`user_id`,`money`) values (34,'PO-20160318154342','2016-03-18',NULL,0,118.4);

/*Table structure for table `tb_user` */

DROP TABLE IF EXISTS `tb_user`;

CREATE TABLE `tb_user` (
  `id` int(11) NOT NULL auto_increment,
  `loginname` varchar(90) default NULL,
  `username` varchar(60) default NULL,
  `address` varchar(60) default NULL,
  `tel` varchar(60) default NULL,
  `email` varchar(150) default NULL,
  `PASSWORD` varchar(90) default NULL,
  `bookId` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tb_user` */

insert  into `tb_user`(`id`,`loginname`,`username`,`address`,`tel`,`email`,`PASSWORD`,`bookId`) values (1,'admin','admin','广州','36652225','dsd','123456',NULL),(5,'十年','小龙女','广州疯狂java',NULL,NULL,'123456',NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
