/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO,MYSQL323' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
DROP TABLE IF EXISTS `events`;
CREATE TABLE `events` (
  `id` int(11) NOT NULL default '0',
  `title` varchar(255) NOT NULL default '',
  `description` text NOT NULL,
  `website` varchar(255) NOT NULL default '',
  `contact_person` varchar(255) NOT NULL default '',
  `email` varchar(255) NOT NULL default '',
  `foreign_id` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) TYPE=MyISAM;


/*!40000 ALTER TABLE `events` DISABLE KEYS */;
LOCK TABLES `events` WRITE;
INSERT INTO `events` VALUES (502532,'No Shows','','','','',502530),(502530,'','','','','',0),(502561,'Demo Red','','','','',502559),(502535,'Cancelations','','','','',502530),(502560,'Demo Blue','','','','',502559),(502562,'Demo Yellow','','','','',502559),(502569,'Demo Blue','','','','',502568),(502570,'Demo Red','','','','',502568),(502571,'Demo Yellow','','','','',502568),(502578,'Demo Blue','','','','',502577),(502579,'Demo Red','','','','',502577),(502580,'Demo Yellow','','','','',502577);
UNLOCK TABLES;
/*!40000 ALTER TABLE `events` ENABLE KEYS */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

