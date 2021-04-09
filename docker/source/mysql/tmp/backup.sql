-- MySQL dump 10.13  Distrib 5.7.25, for Linux (x86_64)
--
-- Host: localhost    Database: db_oko
-- ------------------------------------------------------
-- Server version	5.7.25

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
-- Table structure for table `bttree_content`
--

DROP TABLE IF EXISTS `bttree_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bttree_content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `preview` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` smallint(6) DEFAULT '0',
  `category_id` int(11) DEFAULT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_keywords` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `published_at` timestamp NULL DEFAULT NULL,
  `author_id` int(11) DEFAULT NULL,
  `on_index` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_bttree_content_category_id` (`category_id`),
  KEY `fk_bttree_content_author` (`author_id`),
  CONSTRAINT `fk_bttree_content_author` FOREIGN KEY (`author_id`) REFERENCES `bttree_user_user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_bttree_content_category_id` FOREIGN KEY (`category_id`) REFERENCES `bttree_content_category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bttree_content`
--

LOCK TABLES `bttree_content` WRITE;
/*!40000 ALTER TABLE `bttree_content` DISABLE KEYS */;
/*!40000 ALTER TABLE `bttree_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bttree_content_category`
--

DROP TABLE IF EXISTS `bttree_content_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bttree_content_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL,
  `tree` int(11) DEFAULT NULL,
  `lft` int(11) NOT NULL,
  `rgt` int(11) NOT NULL,
  `depth` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `fk_bttree_content_category_parent_id` (`parent_id`),
  CONSTRAINT `fk_bttree_content_category_parent_id` FOREIGN KEY (`parent_id`) REFERENCES `bttree_content_category` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bttree_content_category`
--

LOCK TABLES `bttree_content_category` WRITE;
/*!40000 ALTER TABLE `bttree_content_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `bttree_content_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bttree_content_commet`
--

DROP TABLE IF EXISTS `bttree_content_commet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bttree_content_commet` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `name` varchar(250) NOT NULL,
  `email` varchar(250) NOT NULL,
  `text` text NOT NULL,
  `status` smallint(6) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_bttree_comment_content` (`content_id`),
  CONSTRAINT `fk_bttree_comment_content` FOREIGN KEY (`content_id`) REFERENCES `bttree_content` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bttree_content_commet`
--

LOCK TABLES `bttree_content_commet` WRITE;
/*!40000 ALTER TABLE `bttree_content_commet` DISABLE KEYS */;
/*!40000 ALTER TABLE `bttree_content_commet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bttree_content_image`
--

DROP TABLE IF EXISTS `bttree_content_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bttree_content_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `content_id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `description` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_bttree_content_image_content` (`content_id`),
  CONSTRAINT `fk_bttree_content_image_content` FOREIGN KEY (`content_id`) REFERENCES `bttree_content` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bttree_content_image`
--

LOCK TABLES `bttree_content_image` WRITE;
/*!40000 ALTER TABLE `bttree_content_image` DISABLE KEYS */;
/*!40000 ALTER TABLE `bttree_content_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bttree_exchanger_currency`
--

DROP TABLE IF EXISTS `bttree_exchanger_currency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bttree_exchanger_currency` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `entity_id` int(11) NOT NULL,
  `entity_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `alias` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sign` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `code_int` int(11) DEFAULT NULL,
  `site_id` int(11) NOT NULL,
  `status` int(11) DEFAULT '1',
  `sort` int(11) DEFAULT NULL,
  `type` int(11) DEFAULT '4',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=169 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bttree_exchanger_currency`
--

LOCK TABLES `bttree_exchanger_currency` WRITE;
/*!40000 ALTER TABLE `bttree_exchanger_currency` DISABLE KEYS */;
INSERT INTO `bttree_exchanger_currency` VALUES (55,'Яндекс.Деньги RUB',6,'Яндекс.Деньги RUB','yandex-money','₽','RUB',6,1,1,0,1,'2021-04-01 10:06:26','2021-04-06 20:48:43'),(56,'Сбербанк RUB',7,'Сбербанк RUB','sberbank','₽','RUB',42,1,1,2,2,'2021-04-01 10:06:26','2021-04-01 10:07:31'),(57,'Qiwi RUB',12,'Qiwi RUB','qiwi','₽','RUB',63,1,1,1,1,'2021-04-01 10:06:26','2021-04-01 10:07:41'),(58,'Bitcoin BTC',13,'Bitcoin BTC','bitcoin','₿','BTC',93,1,1,0,0,'2021-04-01 10:06:26','2021-04-01 10:07:50'),(59,'Bitcoin Cash BCH',14,'Bitcoin Cash BCH','bitcoin-cash','BCH','BCH',172,1,1,1,0,'2021-04-01 10:06:26','2021-04-01 10:06:26'),(60,'Dash DSH',15,'Dash DSH','dash','DASH','DASH',140,1,1,2,0,'2021-04-01 10:06:26','2021-04-01 10:06:26'),(61,'Ethereum ETH',16,'Ethereum ETH','ethereum','ETH','ETH',139,1,1,3,0,'2021-04-01 10:06:26','2021-04-01 10:09:59'),(62,'Litecoin LTC',17,'Litecoin LTC','litecoin','LTC','LTC',99,1,1,4,0,'2021-04-01 10:06:26','2021-04-01 10:06:26'),(63,'Monero XMR',18,'Monero XMR','monero','XMR','XMR',149,1,1,5,0,'2021-04-01 10:06:26','2021-04-01 10:06:26'),(64,'Ripple XRP',19,'Ripple XRP','ripple','XRP','XRP',161,1,1,6,0,'2021-04-01 10:06:26','2021-04-01 10:06:26'),(65,'Zcash ZEC',21,'Zcash ZEC','zcash','ZEC','ZEC',162,1,1,7,0,'2021-04-01 10:06:26','2021-04-01 10:20:38'),(66,'Tether Omni USDT',34,'Tether Omni USDT','tether','₽','USD',163,1,1,8,0,'2021-04-01 10:06:26','2021-04-01 10:06:26'),(67,'Tether ERC20 USDT',35,'Tether ERC20 USDT','tether-erc20','USDT','USDT',36,1,1,9,0,'2021-04-01 10:06:26','2021-04-01 10:06:26'),(68,'Тинькофф RUB',36,'Tinkoff-банк RUB','tinkoff','₽','RUB',105,1,1,3,2,'2021-04-01 10:06:26','2021-04-01 10:06:26'),(69,'VISA/MC USD',40,'Visa/Mastercard USD','visa-mastercard-usd','₽','RUB',58,1,0,4,2,'2021-04-01 10:06:26','2021-04-01 10:06:26'),(70,'VISA/MC RUB',41,'Visa/Mastercard RUB','visa-mastercard-rub','₽','RUB',59,1,1,0,2,'2021-04-01 10:06:26','2021-04-01 10:06:26'),(71,'NEM XEM',46,'NEM XEM','nem','XEM','XEM',173,1,1,10,0,'2021-04-01 10:06:26','2021-04-01 10:06:26'),(72,'Ether Classic ETC',50,'Ether Classic ETC','ethereum-classic','ETC','ETC',160,1,1,11,0,'2021-04-01 10:06:26','2021-04-01 10:06:26'),(73,'EOS EOS',51,'EOS EOS',NULL,'₽','RUB',NULL,1,0,0,4,'2021-04-01 10:06:26','2021-04-01 10:06:26'),(74,'Cardano ADA',52,'Cardano ADA','cardano','ADA','ADA',181,1,1,12,0,'2021-04-01 10:06:26','2021-04-01 10:06:26'),(75,'Наличные USD',56,'Наличные USD','dollar-cash','$','USD',89,1,0,0,3,'2021-04-01 10:06:26','2021-04-01 10:06:26'),(76,'Наличные RUB',57,'Наличные RUB','ruble-cash','₽','RUB',91,1,1,1,3,'2021-04-01 10:06:26','2021-04-01 10:06:26'),(77,'Stellar XLM',59,'Stellar XLM','stellar','₽','XLM',182,1,1,13,0,'2021-04-01 10:06:26','2021-04-01 10:06:26'),(78,'ВТБ RUB',60,'ВТБ24 RUB','vtb','₽','RUB',51,1,1,1,2,'2021-04-01 10:06:26','2021-04-01 10:06:26'),(79,'ВТБ RUB',61,'ВТБ24 RUB','vtb','₽','RUB',51,1,0,5,2,'2021-04-01 10:06:26','2021-04-01 10:06:26'),(80,'Альфа RUB',62,'Альфа-Клик RUB','alfaclick','₽','RUB',52,1,1,6,2,'2021-04-01 10:06:26','2021-04-01 10:06:26'),(81,'Cardano ADA',63,'Cardano ADA','cardano222','ADA','ADA',181,1,0,1,4,'2021-04-01 10:06:26','2021-04-01 10:28:36'),(82,'Ripple xrp2',64,'Ripple xrp2',NULL,'₽','RUB',NULL,1,0,2,4,'2021-04-01 10:06:26','2021-04-01 10:06:26'),(83,'Dogecoin DOGE',65,'Dogecoin DOGE','dogecoin','₽','DOGE',115,1,1,14,0,'2021-04-01 10:06:26','2021-04-01 10:06:26'),(84,'True USD TUSD',66,'True USD TUSD','trueusd','₽','TUSD',24,1,1,15,0,'2021-04-01 10:06:26','2021-04-01 10:06:26'),(85,'USD Coin USDC',67,'USD Coin USDC','usd-coin','₽','USDC',23,1,1,16,0,'2021-04-01 10:06:26','2021-04-01 10:06:26'),(86,'Binance Coin BNB',68,'Binance Coin BNB','binance-coin','₽','BNB',19,1,1,17,0,'2021-04-01 10:06:26','2021-04-01 10:06:26'),(87,'Tron TRX',69,'Tron TRX','tron','₽','TRX',185,1,1,18,0,'2021-04-01 10:06:26','2021-04-01 10:06:26'),(88,'Tether TRC-20 USD',70,'Tether TRC-20 USD','tether-trc20','₽','USD',10,1,1,19,0,'2021-04-01 10:06:26','2021-04-01 10:06:26'),(89,'Тинькофф Cash-in RUB',71,'Тинькофф Cash-in RUB','tinkoff-cash-in','₽','RUB',46,1,1,7,2,'2021-04-01 10:06:26','2021-04-01 10:06:26'),(90,'Альфа Сash-in RUB',72,'Альфа Сash-in RUB','alfabank-cash-in','₽','RUB',62,1,1,8,2,'2021-04-01 10:06:26','2021-04-01 10:06:26'),(91,'Binance Coin BNBMEMO2',73,'Binance Coin BNBMEMO2',NULL,'₽','RUB',NULL,1,0,3,4,'2021-04-01 10:06:26','2021-04-01 10:06:26'),(92,'Stellar XLMMEMO2',74,'Stellar XLMMEMO2',NULL,'₽','RUB',NULL,1,0,4,4,'2021-04-01 10:06:26','2021-04-01 10:06:26'),(93,'Любой банк RUB',75,'Любой Банк RUB','wire-rub','₽','RUB',71,1,1,9,2,'2021-04-01 10:06:26','2021-04-01 10:06:26'),(94,'Райффайзен RUB',76,'Райффайзен RUB','raiffeisen-bank','₽','RUB',157,1,1,10,2,'2021-04-01 10:06:26','2021-04-01 10:06:26'),(95,'Открытие RUB',77,'Открытие RUB','openbank','₽','RUB',176,1,1,11,2,'2021-04-01 10:06:26','2021-04-01 10:06:26'),(96,'Уралсиб RUB',78,'Уралсиб RUB',NULL,'₽','RUB',NULL,1,0,5,4,'2021-04-01 10:06:26','2021-04-01 10:06:26'),(97,'Кукуруза RUB',79,'Кукуруза RUB','kykyryza','₽','RUB',57,1,0,12,2,'2021-04-01 10:06:26','2021-04-01 10:06:26'),(98,'ПочтаБанк RUB',80,'ПочтаБанк RUB','post-bank','₽','RUB',170,1,0,13,2,'2021-04-01 10:06:26','2021-04-01 10:06:26'),(99,'Россельхозбанк RUB',81,'Россельхозбанк RUB','rosselhozbank','₽','RUB',34,1,0,14,2,'2021-04-01 10:06:26','2021-04-01 10:06:26'),(100,'Росбанк RUB',82,'Росбанк RUB','rosbank','₽','RUB',195,1,0,15,2,'2021-04-01 10:06:26','2021-04-01 10:06:26'),(101,'МТС Банк RUB',83,'МТС Банк RUB','mts-bank','₽','RUB',191,1,0,16,2,'2021-04-01 10:06:26','2021-04-01 10:06:26'),(102,'Промсвязьбанк RUB',84,'Промсвязьбанк RUB','psbank','₽','RUB',53,1,0,17,2,'2021-04-01 10:06:26','2021-04-01 10:06:26'),(103,'Авангард RUB',85,'Авангард RUB','avangard','₽','RUB',79,1,0,18,2,'2021-04-01 10:06:26','2021-04-01 10:06:26'),(104,'Русский Стандарт RUB',86,'Русский Стандарт RUB','russtandart','₽','RUB',64,1,0,19,2,'2021-04-01 10:06:26','2021-04-01 10:06:26'),(105,'Рокетбанк RUB',87,'Рокетбанк RUB','rocketbank','₽','RUB',25,1,0,20,2,'2021-04-01 10:06:26','2021-04-01 10:06:26'),(106,'Газпромбанк RUB',88,'Газпромбанк RUB','gazprombank','₽','RUB',95,1,1,21,2,'2021-04-01 10:06:26','2021-04-01 10:06:26'),(107,'Chainlink LINK',89,'Chainlink LINK','chainlink','LINK','LINK',197,1,1,20,0,'2021-04-01 10:06:26','2021-04-01 10:06:26'),(108,'Polkadot DOT',90,'Polkadot DOT','polkadot','DOT','DOT',200,1,1,21,0,'2021-04-01 10:06:26','2021-04-01 10:06:26'),(109,'Perfect Money USD',1,'Perfect Money USD','perfect-money-usd','USD','USD',NULL,27,1,0,4,'2021-04-06 21:18:19','2021-04-06 21:18:19'),(110,'Webmoney USD',3,'Webmoney USD','webmoney-usd','USD','USD',NULL,27,1,1,4,'2021-04-06 21:18:20','2021-04-06 21:18:20'),(111,'Приват24 UAH',5,'Приват24 UAH','privat24-uah','UAH','UAH',NULL,27,1,2,4,'2021-04-06 21:18:20','2021-04-06 21:18:20'),(112,'Яндекс.Деньги RUB',6,'Яндекс.Деньги RUB','andeksdengi-rub','RUB','RUB',NULL,27,1,0,1,'2021-04-06 21:18:20','2021-04-06 21:19:37'),(113,'Сбербанк RUB',7,'Сбербанк RUB','sberbank-rub','RUB','RUB',NULL,27,1,3,4,'2021-04-06 21:18:20','2021-04-06 21:18:20'),(114,'Advcash USD',10,'Advcash USD','advcash-usd','USD','USD',NULL,27,1,4,4,'2021-04-06 21:18:20','2021-04-06 21:18:20'),(115,'Payeer USD',11,'Payeer USD','payeer-usd','USD','USD',NULL,27,1,5,4,'2021-04-06 21:18:20','2021-04-06 21:18:20'),(116,'Qiwi RUB',12,'Qiwi RUB','qiwi-rub','RUB','RUB',NULL,27,1,1,1,'2021-04-06 21:18:20','2021-04-06 21:19:48'),(117,'Bitcoin BTC',13,'Bitcoin BTC','bitcoin-btc','BTC','BTC',NULL,27,1,0,0,'2021-04-06 21:18:20','2021-04-06 21:22:50'),(118,'Bitcoin Cash BCH',14,'Bitcoin Cash BCH','bitcoin-cash-bch','BCH','BCH',NULL,27,1,1,0,'2021-04-06 21:18:20','2021-04-06 21:23:17'),(119,'Dash DSH',15,'Dash DSH','dash-dsh','DSH','DSH',NULL,27,1,6,4,'2021-04-06 21:18:20','2021-04-06 21:18:20'),(120,'Ethereum ETH',16,'Ethereum ETH','ethereum-eth','ETH','ETH',NULL,27,1,7,4,'2021-04-06 21:18:20','2021-04-06 21:18:20'),(121,'Litecoin LTC',17,'Litecoin LTC','litecoin-ltc','LTC','LTC',NULL,27,1,8,4,'2021-04-06 21:18:20','2021-04-06 21:18:20'),(122,'Monero XMR',18,'Monero XMR','monero-xmr','XMR','XMR',NULL,27,1,9,4,'2021-04-06 21:18:20','2021-04-06 21:18:20'),(123,'Ripple XRP',19,'Ripple XRP','ripple-xrp','XRP','XRP',NULL,27,1,10,4,'2021-04-06 21:18:20','2021-04-06 21:18:20'),(124,'Waves WAVES',20,'Waves WAVES','waves-waves','WAVES','WAVES',NULL,27,1,11,4,'2021-04-06 21:18:20','2021-04-06 21:18:20'),(125,'Zcash ZEC',21,'Zcash ZEC','zcash-zec','ZEC','ZEC',NULL,27,1,12,4,'2021-04-06 21:18:20','2021-04-06 21:18:20'),(126,'Tether Omni USDT',34,'Tether Omni USDT','tether-omni-usdt','USDT','USDT',NULL,27,1,13,4,'2021-04-06 21:18:20','2021-04-06 21:18:20'),(127,'Tether ERC20 USDT',35,'Tether ERC20 USDT','tether-erc20-usdt','USDT','USDT',NULL,27,1,14,4,'2021-04-06 21:18:20','2021-04-06 21:18:20'),(128,'Tinkoff-банк RUB',36,'Tinkoff-банк RUB','tinkoff-bank-rub','RUB','RUB',NULL,27,1,0,2,'2021-04-06 21:18:20','2021-04-06 21:23:30'),(129,'WeChat CNY',38,'WeChat CNY','wechat-cny','CNY','CNY',NULL,27,1,15,4,'2021-04-06 21:18:20','2021-04-06 21:18:20'),(130,'VISA/MC USD',40,'VISA/MC USD','visamc-usd','USD','USD',NULL,27,1,16,4,'2021-04-06 21:18:20','2021-04-06 21:18:20'),(131,'VISA/MC RUB',41,'VISA/MC RUB','visamc-rub','RUB','RUB',NULL,27,1,17,4,'2021-04-06 21:18:20','2021-04-06 21:18:20'),(132,'VISA/MC UAH',42,'VISA/MC UAH','visamc-uah','UAH','UAH',NULL,27,1,18,4,'2021-04-06 21:18:20','2021-04-06 21:18:20'),(133,'UnionPay CNY',43,'UnionPay CNY','unionpay-cny','CNY','CNY',NULL,27,1,19,4,'2021-04-06 21:18:20','2021-04-06 21:18:20'),(134,'Казкоммерц KZT',44,'Казкоммерц KZT','kazkommerc-kzt','KZT','KZT',NULL,27,1,20,4,'2021-04-06 21:18:20','2021-04-06 21:18:20'),(135,'Kaspi Bank KZT',45,'Kaspi Bank KZT','kaspi-bank-kzt','KZT','KZT',NULL,27,1,21,4,'2021-04-06 21:18:20','2021-04-06 21:18:20'),(136,'NEM XEM',46,'NEM XEM','nem-xem','XEM','XEM',NULL,27,1,22,4,'2021-04-06 21:18:20','2021-04-06 21:18:20'),(137,'Монобанк UAH',47,'Монобанк UAH','monobank-uah','UAH','UAH',NULL,27,1,23,4,'2021-04-06 21:18:20','2021-04-06 21:18:20'),(138,'HalykBank KZT',48,'HalykBank KZT','halykbank-kzt','KZT','KZT',NULL,27,1,24,4,'2021-04-06 21:18:20','2021-04-06 21:18:20'),(139,'ForteBank KZT',49,'ForteBank KZT','fortebank-kzt','KZT','KZT',NULL,27,1,25,4,'2021-04-06 21:18:20','2021-04-06 21:18:20'),(140,'Ether Classic ETC',50,'Ether Classic ETC','ether-classic-etc','ETC','ETC',NULL,27,1,26,4,'2021-04-06 21:18:20','2021-04-06 21:18:20'),(141,'EOS EOS',51,'EOS EOS','eos-eos','EOS','EOS',NULL,27,1,27,4,'2021-04-06 21:18:20','2021-04-06 21:18:20'),(142,'Cardano ADA',52,'Cardano ADA','cardano-ada','ADA','ADA',NULL,27,1,28,4,'2021-04-06 21:18:20','2021-04-06 21:18:20'),(143,'Bitcoin SV BSV',53,'Bitcoin SV BSV','bitcoin-sv-bsv','BSV','BSV',NULL,27,1,29,4,'2021-04-06 21:18:20','2021-04-06 21:18:20'),(144,'Bitcoin Gold BTG',54,'Bitcoin Gold BTG','bitcoin-gold-btg','BTG','BTG',NULL,27,1,30,4,'2021-04-06 21:18:20','2021-04-06 21:18:20'),(145,'Alipay CNY',55,'Alipay CNY','alipay-cny','CNY','CNY',NULL,27,1,31,4,'2021-04-06 21:18:20','2021-04-06 21:18:20'),(146,'Наличные USD',56,'Наличные USD','nalicnye-usd','USD','USD',NULL,27,1,32,4,'2021-04-06 21:18:20','2021-04-06 21:18:20'),(147,'Наличные RUB',57,'Наличные RUB','nalicnye-rub','RUB','RUB',NULL,27,1,33,4,'2021-04-06 21:18:20','2021-04-06 21:18:20'),(148,'Наличные UAH',58,'Наличные UAH','nalicnye-uah','UAH','UAH',NULL,27,1,34,4,'2021-04-06 21:18:20','2021-04-06 21:18:20'),(149,'Stellar XLM',59,'Stellar XLM','stellar-xlm','XLM','XLM',NULL,27,1,35,4,'2021-04-06 21:18:20','2021-04-06 21:18:20'),(150,'Промсвязьбанк RUB',60,'Промсвязьбанк RUB','promsvazbank-rub','RUB','RUB',NULL,27,1,36,4,'2021-04-06 21:18:20','2021-04-06 21:18:20'),(151,'Dogecoin DOGE',61,'Dogecoin DOGE','dogecoin-doge','DOGE','DOGE',NULL,27,1,37,4,'2021-04-06 21:18:20','2021-04-06 21:18:20'),(152,'Tether ERC20 USDT',62,'Tether ERC20 USDT','tether-erc20-usdt','USDT','USDT',NULL,27,1,38,4,'2021-04-06 21:18:20','2021-04-06 21:18:20'),(153,'Банк Авангард RUB',63,'Банк Авангард RUB','bank-avangard-rub','RUB','RUB',NULL,27,1,39,4,'2021-04-06 21:18:20','2021-04-06 21:18:20'),(154,'Русский Стандарт RUB',64,'Русский Стандарт RUB','russkij-standart-rub','RUB','RUB',NULL,27,1,40,4,'2021-04-06 21:18:20','2021-04-06 21:18:20'),(155,'МТС Банк RUB',65,'МТС Банк RUB','mts-bank-rub','RUB','RUB',NULL,27,1,41,4,'2021-04-06 21:18:20','2021-04-06 21:18:20'),(156,'Россельхозбанк RUB',66,'Россельхозбанк RUB','rosselhozbank-rub','RUB','RUB',NULL,27,1,42,4,'2021-04-06 21:18:20','2021-04-06 21:18:20'),(157,'Binance Coin BNB',67,'Binance Coin BNB','binance-coin-bnb','BNB','BNB',NULL,27,1,43,4,'2021-04-06 21:18:20','2021-04-06 21:18:20'),(158,'Райффайзен RUB',68,'Райффайзен RUB','rajffajzen-rub','RUB','RUB',NULL,27,1,44,4,'2021-04-06 21:18:20','2021-04-06 21:18:20'),(159,'Открытие RUB',69,'Открытие RUB','otkrytie-rub','RUB','RUB',NULL,27,1,45,4,'2021-04-06 21:18:20','2021-04-06 21:18:20'),(160,'ВТБ24 RUB',70,'ВТБ24 RUB','vtb24-rub','RUB','RUB',NULL,27,1,1,2,'2021-04-06 21:18:20','2021-04-06 21:24:13'),(161,'Binance Coin BNBMEMO2',71,'Binance Coin BNBMEMO2','binance-coin-bnbmemo2','BNBMEMO2','BNBMEMO2',NULL,27,1,46,4,'2021-04-06 21:18:20','2021-04-06 21:18:20'),(162,'Stellar XLMMEMO2',72,'Stellar XLMMEMO2','stellar-xlmmemo2','XLMMEMO2','XLMMEMO2',NULL,27,1,47,4,'2021-04-06 21:18:20','2021-04-06 21:18:20'),(163,'Альфа-банк RUB',73,'Альфа-банк RUB','alfa-bank-rub','RUB','RUB',NULL,27,1,48,4,'2021-04-06 21:18:20','2021-04-06 21:18:20'),(164,'Tron TRX',74,'Tron TRX','tron-trx','TRX','TRX',NULL,27,1,49,4,'2021-04-06 21:18:20','2021-04-06 21:18:20'),(165,'Zcash ZEC',75,'Zcash ZEC','zcash-zec','ZEC','ZEC',NULL,27,1,50,4,'2021-04-06 21:18:20','2021-04-06 21:18:20'),(166,'Почта Банк RUB',76,'Почта Банк RUB','pocta-bank-rub','RUB','RUB',NULL,27,1,51,4,'2021-04-06 21:18:20','2021-04-06 21:18:20'),(167,'РНКБ RUB',77,'РНКБ RUB','rnkb-rub','RUB','RUB',NULL,27,1,52,4,'2021-04-06 21:18:20','2021-04-06 21:18:20'),(168,'Росбанк RUB',78,'Росбанк RUB','rosbank-rub','RUB','RUB',NULL,27,1,53,4,'2021-04-06 21:18:21','2021-04-06 21:18:21');
/*!40000 ALTER TABLE `bttree_exchanger_currency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bttree_exchanger_currency_direction`
--

DROP TABLE IF EXISTS `bttree_exchanger_currency_direction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bttree_exchanger_currency_direction` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `entity_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  `from_id` int(11) NOT NULL,
  `to_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2267 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bttree_exchanger_currency_direction`
--

LOCK TABLES `bttree_exchanger_currency_direction` WRITE;
/*!40000 ALTER TABLE `bttree_exchanger_currency_direction` DISABLE KEYS */;
INSERT INTO `bttree_exchanger_currency_direction` VALUES (1876,'Bitcoin (BTC) - Сбербанк (RUB)',14,1,13,7,'2021-04-01 10:17:49','2021-04-01 10:17:49'),(1877,'Сбербанк RUB → Bitcoin BTC',15,1,7,13,'2021-04-01 10:17:49','2021-04-01 10:17:49'),(1878,'Сбербанк RUB → Ethereum ETH',17,1,7,16,'2021-04-01 10:17:49','2021-04-01 10:17:49'),(1879,'Ethereum ETH → Сбербанк RUB',18,1,16,7,'2021-04-01 10:17:49','2021-04-01 10:17:49'),(1880,'Ripple XRP → Сбербанк RUB',19,1,19,7,'2021-04-01 10:17:49','2021-04-01 10:17:49'),(1881,'Сбербанк RUB → Ripple XRP',20,1,7,19,'2021-04-01 10:17:49','2021-04-01 10:17:49'),(1882,'Ether Classic ETC → Сбербанк RUB',21,1,50,7,'2021-04-01 10:17:49','2021-04-01 10:17:49'),(1883,'Сбербанк RUB → Ether Classic ETC',22,1,7,50,'2021-04-01 10:17:49','2021-04-01 10:17:49'),(1884,'Litecoin LTC → Сбербанк RUB',23,1,17,7,'2021-04-01 10:17:49','2021-04-01 10:17:49'),(1885,'Сбербанк RUB → Litecoin LTC',24,1,7,17,'2021-04-01 10:17:49','2021-04-01 10:17:49'),(1886,'Tether ERC20 USDT → Сбербанк RUB',25,1,35,7,'2021-04-01 10:17:49','2021-04-01 10:17:49'),(1887,'Сбербанк RUB → Tether ERC20 USDT',26,1,7,35,'2021-04-01 10:17:49','2021-04-01 10:17:49'),(1888,'Zcash ZEC → Сбербанк RUB',27,1,21,7,'2021-04-01 10:17:49','2021-04-01 10:17:49'),(1889,'Сбербанк RUB → Zcash ZEC',28,1,7,21,'2021-04-01 10:17:49','2021-04-01 10:17:49'),(1890,'Bitcoin Cash BCH → Сбербанк RUB',29,1,14,7,'2021-04-01 10:17:49','2021-04-01 10:17:49'),(1891,'Сбербанк RUB → Bitcoin Cash BCH',30,1,7,14,'2021-04-01 10:17:49','2021-04-01 10:17:49'),(1892,'Bitcoin BTC → Тинькофф RUB',31,1,13,36,'2021-04-01 10:17:49','2021-04-01 10:17:49'),(1893,'Тинькофф RUB → Bitcoin BTC',32,1,36,13,'2021-04-01 10:17:49','2021-04-01 10:17:49'),(1894,'Bitcoin Cash BCH → Тинькофф RUB',33,1,14,36,'2021-04-01 10:17:49','2021-04-01 10:17:49'),(1895,'Тинькофф RUB → Bitcoin Cash BCH',34,1,36,14,'2021-04-01 10:17:49','2021-04-01 10:17:49'),(1896,'Tether ERC20 USDT → Тинькофф RUB',35,1,35,36,'2021-04-01 10:17:49','2021-04-01 10:17:49'),(1897,'Тинькофф RUB → Tether ERC20 USDT',36,1,36,35,'2021-04-01 10:17:49','2021-04-01 10:17:49'),(1898,'Ethereum ETH → Тинькофф RUB',37,1,16,36,'2021-04-01 10:17:49','2021-04-01 10:17:49'),(1899,'Тинькофф RUB → Ethereum ETH',38,1,36,16,'2021-04-01 10:17:49','2021-04-01 10:17:49'),(1900,'Ether Classic ETC → Тинькофф RUB',39,1,50,36,'2021-04-01 10:17:49','2021-04-01 10:17:49'),(1901,'Тинькофф RUB → Ether Classic ETC',40,1,36,50,'2021-04-01 10:17:49','2021-04-01 10:17:49'),(1902,'Litecoin LTC → Тинькофф RUB',41,1,17,36,'2021-04-01 10:17:49','2021-04-01 10:17:49'),(1903,'Тинькофф RUB → Litecoin LTC',42,1,36,17,'2021-04-01 10:17:49','2021-04-01 10:17:49'),(1904,'Ripple XRP → Тинькофф RUB',43,1,19,36,'2021-04-01 10:17:49','2021-04-01 10:17:49'),(1905,'Тинькофф RUB → Ripple XRP',44,1,36,19,'2021-04-01 10:17:49','2021-04-01 10:17:49'),(1906,'Zcash ZEC → Тинькофф RUB',45,1,21,36,'2021-04-01 10:17:49','2021-04-01 10:17:49'),(1907,'Тинькофф RUB → Zcash ZEC',46,1,36,21,'2021-04-01 10:17:49','2021-04-01 10:17:49'),(1908,'Dash DSH → Сбербанк RUB',47,1,15,7,'2021-04-01 10:17:49','2021-04-01 10:17:49'),(1909,'Сбербанк RUB → Dash DSH',48,1,7,15,'2021-04-01 10:17:49','2021-04-01 10:17:49'),(1910,'Dash DSH → Тинькофф RUB',49,1,15,36,'2021-04-01 10:17:49','2021-04-01 10:17:49'),(1911,'Тинькофф RUB → Dash DSH',50,1,36,15,'2021-04-01 10:17:49','2021-04-01 10:17:49'),(1912,'Наличные RUB → Bitcoin BTC',51,1,57,13,'2021-04-01 10:17:49','2021-04-01 10:17:49'),(1913,'Bitcoin BTC → Наличные RUB',52,1,13,57,'2021-04-01 10:17:49','2021-04-01 10:17:49'),(1914,'Bitcoin Cash BCH → Наличные RUB',53,1,14,57,'2021-04-01 10:17:49','2021-04-01 10:17:49'),(1915,'Наличные RUB → Bitcoin Cash BCH',54,1,57,14,'2021-04-01 10:17:49','2021-04-01 10:17:49'),(1916,'Tether ERC20 USDT → Наличные RUB',55,1,35,57,'2021-04-01 10:17:49','2021-04-01 10:17:49'),(1917,'Наличные RUB → Tether ERC20 USDT',56,1,57,35,'2021-04-01 10:17:49','2021-04-01 10:17:49'),(1918,'Ethereum ETH → Наличные RUB',57,1,16,57,'2021-04-01 10:17:49','2021-04-01 10:17:49'),(1919,'Наличные RUB → Ethereum ETH',58,1,57,16,'2021-04-01 10:17:49','2021-04-01 10:17:49'),(1920,'Ether Classic ETC → Наличные RUB',59,1,50,57,'2021-04-01 10:17:49','2021-04-01 10:17:49'),(1921,'Наличные RUB → Ether Classic ETC',60,1,57,50,'2021-04-01 10:17:49','2021-04-01 10:17:49'),(1922,'Litecoin LTC → Наличные RUB',61,1,17,57,'2021-04-01 10:17:49','2021-04-01 10:17:49'),(1923,'Наличные RUB → Litecoin LTC',62,1,57,17,'2021-04-01 10:17:49','2021-04-01 10:17:49'),(1924,'Ripple XRP → Наличные RUB',63,1,19,57,'2021-04-01 10:17:49','2021-04-01 10:17:49'),(1925,'Наличные RUB → Ripple XRP',64,1,57,19,'2021-04-01 10:17:49','2021-04-01 10:17:49'),(1926,'Zcash ZEC → Наличные RUB',65,1,21,57,'2021-04-01 10:17:49','2021-04-01 10:17:49'),(1927,'Наличные RUB → Zcash ZEC',66,1,57,21,'2021-04-01 10:17:49','2021-04-01 10:17:49'),(1928,'Dash DSH → Наличные RUB',67,1,15,57,'2021-04-01 10:17:49','2021-04-01 10:17:49'),(1929,'Наличные USD → Ethereum ETH',70,1,56,16,'2021-04-01 10:17:49','2021-04-01 10:17:49'),(1930,'Наличные USD → Ether Classic ETC',73,1,56,50,'2021-04-01 10:17:49','2021-04-01 10:17:49'),(1931,'Bitcoin BTC → ВТБ RUB',76,1,13,61,'2021-04-01 10:17:49','2021-04-01 10:17:49'),(1932,'ВТБ RUB → Bitcoin BTC',77,1,61,13,'2021-04-01 10:17:49','2021-04-01 10:17:49'),(1933,'Bitcoin Cash BCH → ВТБ RUB',78,1,14,61,'2021-04-01 10:17:49','2021-04-01 10:17:49'),(1934,'ВТБ RUB → Bitcoin Cash BCH',79,1,61,14,'2021-04-01 10:17:49','2021-04-01 10:17:49'),(1935,'Tether ERC20 USDT → ВТБ RUB',80,1,35,61,'2021-04-01 10:17:49','2021-04-01 10:17:49'),(1936,'ВТБ RUB → Tether ERC20 USDT',81,1,61,35,'2021-04-01 10:17:49','2021-04-01 10:17:49'),(1937,'Ethereum ETH → ВТБ RUB',82,1,16,61,'2021-04-01 10:17:49','2021-04-01 10:17:49'),(1938,'ВТБ RUB → Ethereum ETH',83,1,61,16,'2021-04-01 10:17:49','2021-04-01 10:17:49'),(1939,'Ether Classic ETC → ВТБ RUB',84,1,50,61,'2021-04-01 10:17:49','2021-04-01 10:17:49'),(1940,'ВТБ RUB → Ether Classic ETC',85,1,61,50,'2021-04-01 10:17:49','2021-04-01 10:17:49'),(1941,'Litecoin LTC → ВТБ RUB',86,1,17,61,'2021-04-01 10:17:49','2021-04-01 10:17:49'),(1942,'ВТБ RUB → Litecoin LTC',87,1,61,17,'2021-04-01 10:17:49','2021-04-01 10:17:49'),(1943,'Ripple XRP → ВТБ RUB',88,1,19,61,'2021-04-01 10:17:49','2021-04-01 10:17:49'),(1944,'ВТБ RUB → Ripple XRP',89,1,61,19,'2021-04-01 10:17:49','2021-04-01 10:17:49'),(1945,'Zcash ZEC → ВТБ RUB',90,1,21,61,'2021-04-01 10:17:49','2021-04-01 10:17:49'),(1946,'ВТБ RUB → Zcash ZEC',91,1,61,21,'2021-04-01 10:17:49','2021-04-01 10:17:49'),(1947,'Dash DSH → ВТБ RUB',92,1,15,61,'2021-04-01 10:17:49','2021-04-01 10:17:49'),(1948,'ВТБ RUB → Dash DSH',93,1,61,15,'2021-04-01 10:17:50','2021-04-01 10:17:50'),(1949,'Альфа RUB → Bitcoin BTC',94,1,62,13,'2021-04-01 10:17:50','2021-04-01 10:17:50'),(1950,'Bitcoin BTC → Альфа RUB',95,1,13,62,'2021-04-01 10:17:50','2021-04-01 10:17:50'),(1951,'Альфа RUB → Bitcoin Cash BCH',96,1,62,14,'2021-04-01 10:17:50','2021-04-01 10:17:50'),(1952,'Bitcoin Cash BCH → Альфа RUB',97,1,14,62,'2021-04-01 10:17:50','2021-04-01 10:17:50'),(1953,'Альфа RUB → Tether ERC20 USDT',98,1,62,35,'2021-04-01 10:17:50','2021-04-01 10:17:50'),(1954,'Tether ERC20 USDT → Альфа RUB',99,1,35,62,'2021-04-01 10:17:50','2021-04-01 10:17:50'),(1955,'Альфа RUB → Ethereum ETH',100,1,62,16,'2021-04-01 10:17:50','2021-04-01 10:17:50'),(1956,'Ethereum ETH → Альфа RUB',101,1,16,62,'2021-04-01 10:17:50','2021-04-01 10:17:50'),(1957,'Альфа RUB → Ether Classic ETC',102,1,62,50,'2021-04-01 10:17:50','2021-04-01 10:17:50'),(1958,'Ether Classic ETC → Альфа RUB',103,1,50,62,'2021-04-01 10:17:50','2021-04-01 10:17:50'),(1959,'Альфа RUB → Litecoin LTC',104,1,62,17,'2021-04-01 10:17:50','2021-04-01 10:17:50'),(1960,'Litecoin LTC → Альфа RUB',105,1,17,62,'2021-04-01 10:17:50','2021-04-01 10:17:50'),(1961,'Альфа RUB → Ripple XRP',106,1,62,19,'2021-04-01 10:17:50','2021-04-01 10:17:50'),(1962,'Ripple XRP → Альфа RUB',107,1,19,62,'2021-04-01 10:17:50','2021-04-01 10:17:50'),(1963,'Альфа RUB → Zcash ZEC',108,1,62,21,'2021-04-01 10:17:50','2021-04-01 10:17:50'),(1964,'Zcash ZEC → Альфа RUB',109,1,21,62,'2021-04-01 10:17:50','2021-04-01 10:17:50'),(1965,'Альфа RUB → Dash DSH',110,1,62,15,'2021-04-01 10:17:50','2021-04-01 10:17:50'),(1966,'Dash DSH → Альфа RUB',111,1,15,62,'2021-04-01 10:17:50','2021-04-01 10:17:50'),(1967,'Bitcoin BTC → VISA/MC RUB',113,1,13,41,'2021-04-01 10:17:50','2021-04-01 10:17:50'),(1968,'Bitcoin Cash BCH → VISA/MC RUB',115,1,14,41,'2021-04-01 10:17:50','2021-04-01 10:17:50'),(1969,'Tether ERC20 USDT → VISA/MC RUB',117,1,35,41,'2021-04-01 10:17:50','2021-04-01 10:17:50'),(1970,'Ethereum ETH → VISA/MC RUB',119,1,16,41,'2021-04-01 10:17:50','2021-04-01 10:17:50'),(1971,'Ether Classic ETC → VISA/MC RUB',121,1,50,41,'2021-04-01 10:17:50','2021-04-01 10:17:50'),(1972,'Litecoin LTC → VISA/MC RUB',123,1,17,41,'2021-04-01 10:17:50','2021-04-01 10:17:50'),(1973,'Ripple XRP → VISA/MC RUB',125,1,19,41,'2021-04-01 10:17:50','2021-04-01 10:17:50'),(1974,'Zcash ZEC → VISA/MC RUB',127,1,21,41,'2021-04-01 10:17:50','2021-04-01 10:17:50'),(1975,'Dash DSH → VISA/MC RUB',129,1,15,41,'2021-04-01 10:17:50','2021-04-01 10:17:50'),(1976,'Cardano ADA → Сбербанк RUB',131,1,52,7,'2021-04-01 10:17:50','2021-04-01 10:17:50'),(1977,'Сбербанк RUB → EOS EOS',136,1,7,51,'2021-04-01 10:17:50','2021-04-01 10:17:50'),(1978,'Monero XMR → Наличные RUB',138,1,18,57,'2021-04-01 10:17:50','2021-04-01 10:17:50'),(1979,'Monero XMR → Сбербанк RUB',139,1,18,7,'2021-04-01 10:17:50','2021-04-01 10:17:50'),(1980,'Наличные RUB → Monero XMR',140,1,57,18,'2021-04-01 10:17:50','2021-04-01 10:17:50'),(1981,'Сбербанк RUB → Monero XMR',141,1,7,18,'2021-04-01 10:17:50','2021-04-01 10:17:50'),(1982,'Наличные RUB → Dash DSH',142,1,57,15,'2021-04-01 10:17:50','2021-04-01 10:17:50'),(1983,'Monero XMR → Тинькофф RUB',143,1,18,36,'2021-04-01 10:17:50','2021-04-01 10:17:50'),(1984,'Monero XMR → Альфа RUB',144,1,18,62,'2021-04-01 10:17:50','2021-04-01 10:17:50'),(1985,'Monero XMR → ВТБ RUB',145,1,18,61,'2021-04-01 10:17:50','2021-04-01 10:17:50'),(1986,'Тинькофф RUB → Monero XMR',146,1,36,18,'2021-04-01 10:17:50','2021-04-01 10:17:50'),(1987,'ВТБ RUB → Monero XMR',147,1,61,18,'2021-04-01 10:17:50','2021-04-01 10:17:50'),(1988,'Альфа RUB → Monero XMR',148,1,62,18,'2021-04-01 10:17:50','2021-04-01 10:17:50'),(1989,'Dogecoin DOGE → Сбербанк RUB',149,1,65,7,'2021-04-01 10:17:50','2021-04-01 10:17:50'),(1990,'Stellar XLM → Сбербанк RUB',150,1,59,7,'2021-04-01 10:17:50','2021-04-01 10:17:50'),(1991,'Bitcoin BTC → Яндекс.Деньги RUB',151,1,13,6,'2021-04-01 10:17:50','2021-04-01 10:17:50'),(1992,'Ethereum ETH → Яндекс.Деньги RUB',152,1,16,6,'2021-04-01 10:17:50','2021-04-01 10:17:50'),(1993,'Litecoin LTC → Яндекс.Деньги RUB',153,1,17,6,'2021-04-01 10:17:50','2021-04-01 10:17:50'),(1994,'Ripple XRP → Яндекс.Деньги RUB',154,1,19,6,'2021-04-01 10:17:50','2021-04-01 10:17:50'),(1995,'Zcash ZEC → Яндекс.Деньги RUB',155,1,21,6,'2021-04-01 10:17:50','2021-04-01 10:17:50'),(1996,'Bitcoin Cash BCH → Яндекс.Деньги RUB',156,1,14,6,'2021-04-01 10:17:50','2021-04-01 10:17:50'),(1997,'Dash DSH → Яндекс.Деньги RUB',157,1,15,6,'2021-04-01 10:17:50','2021-04-01 10:17:50'),(1998,'Tether Omni USDT → Яндекс.Деньги RUB',158,1,34,6,'2021-04-01 10:17:50','2021-04-01 10:17:50'),(1999,'Tether ERC20 USDT → Яндекс.Деньги RUB',159,1,35,6,'2021-04-01 10:17:50','2021-04-01 10:17:50'),(2000,'Dogecoin DOGE → Яндекс.Деньги RUB',160,1,65,6,'2021-04-01 10:17:50','2021-04-01 10:17:50'),(2001,'True USD TUSD → Яндекс.Деньги RUB',161,1,66,6,'2021-04-01 10:17:50','2021-04-01 10:17:50'),(2002,'USD Coin USDC → Яндекс.Деньги RUB',162,1,67,6,'2021-04-01 10:17:50','2021-04-01 10:17:50'),(2003,'Binance Coin BNB → Яндекс.Деньги RUB',163,1,68,6,'2021-04-01 10:17:50','2021-04-01 10:17:50'),(2004,'Stellar XLM → Яндекс.Деньги RUB',164,1,59,6,'2021-04-01 10:17:50','2021-04-01 10:17:50'),(2005,'Tron TRX → Яндекс.Деньги RUB',165,1,69,6,'2021-04-01 10:17:50','2021-04-01 10:17:50'),(2006,'Tether TRC-20 USD → Яндекс.Деньги RUB',166,1,70,6,'2021-04-01 10:17:50','2021-04-01 10:17:50'),(2007,'Dogecoin DOGE → Тинькофф RUB',167,1,65,36,'2021-04-01 10:17:50','2021-04-01 10:17:50'),(2008,'Dogecoin DOGE → Альфа RUB',168,1,65,62,'2021-04-01 10:17:50','2021-04-01 10:17:50'),(2009,'Dogecoin DOGE → ВТБ RUB',169,1,65,61,'2021-04-01 10:17:50','2021-04-01 10:17:50'),(2010,'Dogecoin DOGE → VISA/MC RUB',170,1,65,41,'2021-04-01 10:17:50','2021-04-01 10:17:50'),(2011,'True USD TUSD → Сбербанк RUB',171,1,66,7,'2021-04-01 10:17:50','2021-04-01 10:17:50'),(2012,'True USD TUSD → Тинькофф RUB',172,1,66,36,'2021-04-01 10:17:50','2021-04-01 10:17:50'),(2013,'True USD TUSD → Альфа RUB',173,1,66,62,'2021-04-01 10:17:50','2021-04-01 10:17:50'),(2014,'True USD TUSD → ВТБ RUB',174,1,66,61,'2021-04-01 10:17:50','2021-04-01 10:17:50'),(2015,'True USD TUSD → VISA/MC RUB',175,1,66,41,'2021-04-01 10:17:50','2021-04-01 10:17:50'),(2016,'USD Coin USDC → Сбербанк RUB',176,1,67,7,'2021-04-01 10:17:50','2021-04-01 10:17:50'),(2017,'USD Coin USDC → Тинькофф RUB',177,1,67,36,'2021-04-01 10:17:50','2021-04-01 10:17:50'),(2018,'USD Coin USDC → Альфа RUB',178,1,67,62,'2021-04-01 10:17:50','2021-04-01 10:17:50'),(2019,'USD Coin USDC → ВТБ RUB',179,1,67,61,'2021-04-01 10:17:50','2021-04-01 10:17:50'),(2020,'USD Coin USDC → VISA/MC RUB',180,1,67,41,'2021-04-01 10:17:50','2021-04-01 10:17:50'),(2021,'Binance Coin BNB → Сбербанк RUB',181,1,68,7,'2021-04-01 10:17:50','2021-04-01 10:17:50'),(2022,'Binance Coin BNB → Тинькофф RUB',182,1,68,36,'2021-04-01 10:17:50','2021-04-01 10:17:50'),(2023,'Binance Coin BNB → Альфа RUB',183,1,68,62,'2021-04-01 10:17:50','2021-04-01 10:17:50'),(2024,'Binance Coin BNB → ВТБ RUB',184,1,68,61,'2021-04-01 10:17:50','2021-04-01 10:17:50'),(2025,'Binance Coin BNB → VISA/MC RUB',185,1,68,41,'2021-04-01 10:17:50','2021-04-01 10:17:50'),(2026,'Stellar XLM → Сбербанк RUB',186,1,59,7,'2021-04-01 10:17:50','2021-04-01 10:17:50'),(2027,'Stellar XLM → Тинькофф RUB',187,1,59,36,'2021-04-01 10:17:50','2021-04-01 10:17:50'),(2028,'Stellar XLM → Альфа RUB',188,1,59,62,'2021-04-01 10:17:50','2021-04-01 10:17:50'),(2029,'Stellar XLM → ВТБ RUB',189,1,59,61,'2021-04-01 10:17:50','2021-04-01 10:17:50'),(2030,'Stellar XLM → VISA/MC RUB',190,1,59,41,'2021-04-01 10:17:50','2021-04-01 10:17:50'),(2031,'Tron TRX → Сбербанк RUB',191,1,69,7,'2021-04-01 10:17:50','2021-04-01 10:17:50'),(2032,'Tron TRX → Тинькофф RUB',192,1,69,36,'2021-04-01 10:17:50','2021-04-01 10:17:50'),(2033,'Tron TRX → Альфа RUB',193,1,69,62,'2021-04-01 10:17:50','2021-04-01 10:17:50'),(2034,'Tron TRX → ВТБ RUB',194,1,69,61,'2021-04-01 10:17:50','2021-04-01 10:17:50'),(2035,'Tron TRX → VISA/MC RUB',195,1,69,41,'2021-04-01 10:17:50','2021-04-01 10:17:50'),(2036,'Zcash ZEC → Qiwi RUB',202,1,21,12,'2021-04-01 10:17:50','2021-04-01 10:17:50'),(2037,'Tether TRC-20 USD → Сбербанк RUB',212,1,70,7,'2021-04-01 10:17:50','2021-04-01 10:17:50'),(2038,'Tether TRC-20 USD → Тинькофф RUB',213,1,70,36,'2021-04-01 10:17:50','2021-04-01 10:17:50'),(2039,'Tether TRC-20 USD → ВТБ RUB',214,1,70,61,'2021-04-01 10:17:50','2021-04-01 10:17:50'),(2040,'Tether TRC-20 USD → Альфа RUB',215,1,70,62,'2021-04-01 10:17:51','2021-04-01 10:17:51'),(2041,'Tether TRC-20 USD → VISA/MC RUB',216,1,70,41,'2021-04-01 10:17:51','2021-04-01 10:17:51'),(2042,'Dash DSH → Альфа Сash-in RUB',218,1,15,72,'2021-04-01 10:17:51','2021-04-01 10:17:51'),(2043,'Litecoin LTC → Альфа Сash-in RUB',219,1,17,72,'2021-04-01 10:17:51','2021-04-01 10:17:51'),(2044,'Bitcoin Cash BCH → Альфа Сash-in RUB',220,1,14,72,'2021-04-01 10:17:51','2021-04-01 10:17:51'),(2045,'Zcash ZEC → Альфа Сash-in RUB',221,1,21,72,'2021-04-01 10:17:51','2021-04-01 10:17:51'),(2046,'Ripple XRP → Альфа Сash-in RUB',222,1,19,72,'2021-04-01 10:17:51','2021-04-01 10:17:51'),(2047,'Bitcoin BTC → Альфа Сash-in RUB',223,1,13,72,'2021-04-01 10:17:51','2021-04-01 10:17:51'),(2048,'Tether ERC20 USDT → Альфа Сash-in RUB',224,1,35,72,'2021-04-01 10:17:51','2021-04-01 10:17:51'),(2049,'Dogecoin DOGE → Альфа Сash-in RUB',225,1,65,72,'2021-04-01 10:17:51','2021-04-01 10:17:51'),(2050,'USD Coin USDC → Альфа Сash-in RUB',226,1,67,72,'2021-04-01 10:17:51','2021-04-01 10:17:51'),(2051,'Binance Coin BNB → Альфа Сash-in RUB',227,1,68,72,'2021-04-01 10:17:51','2021-04-01 10:17:51'),(2052,'Stellar XLM → Альфа Сash-in RUB',228,1,59,72,'2021-04-01 10:17:51','2021-04-01 10:17:51'),(2053,'Tron TRX → Альфа Сash-in RUB',229,1,69,72,'2021-04-01 10:17:51','2021-04-01 10:17:51'),(2054,'True USD TUSD → Альфа Сash-in RUB',230,1,66,72,'2021-04-01 10:17:51','2021-04-01 10:17:51'),(2055,'Ethereum ETH → Альфа Сash-in RUB',231,1,16,72,'2021-04-01 10:17:51','2021-04-01 10:17:51'),(2056,'Tether TRC-20 USD → Альфа Сash-in RUB',232,1,70,72,'2021-04-01 10:17:51','2021-04-01 10:17:51'),(2057,'Tron TRX → Тинькофф Cash-in RUB',233,1,69,71,'2021-04-01 10:17:51','2021-04-01 10:17:51'),(2058,'USD Coin USDC → Тинькофф Cash-in RUB',234,1,67,71,'2021-04-01 10:17:51','2021-04-01 10:17:51'),(2059,'True USD TUSD → Тинькофф Cash-in RUB',235,1,66,71,'2021-04-01 10:17:51','2021-04-01 10:17:51'),(2060,'Litecoin LTC → Тинькофф Cash-in RUB',236,1,17,71,'2021-04-01 10:17:51','2021-04-01 10:17:51'),(2061,'Tether ERC20 USDT → Тинькофф Cash-in RUB',238,1,35,71,'2021-04-01 10:17:51','2021-04-01 10:17:51'),(2062,'Dash DSH → Тинькофф Cash-in RUB',239,1,15,71,'2021-04-01 10:17:51','2021-04-01 10:17:51'),(2063,'Zcash ZEC → Тинькофф Cash-in RUB',240,1,21,71,'2021-04-01 10:17:51','2021-04-01 10:17:51'),(2064,'Bitcoin Cash BCH → Тинькофф Cash-in RUB',241,1,14,71,'2021-04-01 10:17:51','2021-04-01 10:17:51'),(2065,'Ripple XRP → Тинькофф Cash-in RUB',242,1,19,71,'2021-04-01 10:17:51','2021-04-01 10:17:51'),(2066,'Ethereum ETH → Тинькофф Cash-in RUB',243,1,16,71,'2021-04-01 10:17:51','2021-04-01 10:17:51'),(2067,'Binance Coin BNB → Тинькофф Cash-in RUB',244,1,68,71,'2021-04-01 10:17:51','2021-04-01 10:17:51'),(2068,'Stellar XLM → Тинькофф Cash-in RUB',245,1,59,71,'2021-04-01 10:17:51','2021-04-01 10:17:51'),(2069,'Bitcoin BTC → Тинькофф Cash-in RUB',246,1,13,71,'2021-04-01 10:17:51','2021-04-01 10:17:51'),(2070,'Dogecoin DOGE → Тинькофф Cash-in RUB',247,1,65,71,'2021-04-01 10:17:51','2021-04-01 10:17:51'),(2071,'Tether TRC-20 USD → Тинькофф Cash-in RUB',248,1,70,71,'2021-04-01 10:17:51','2021-04-01 10:17:51'),(2072,'Monero XMR → VISA/MC RUB',249,1,18,41,'2021-04-01 10:17:51','2021-04-01 10:17:51'),(2073,'Monero XMR → Тинькофф Cash-in RUB',250,1,18,71,'2021-04-01 10:17:51','2021-04-01 10:17:51'),(2074,'Monero XMR → Альфа Сash-in RUB',251,1,18,72,'2021-04-01 10:17:51','2021-04-01 10:17:51'),(2075,'Monero XMR → Яндекс.Деньги RUB',253,1,18,6,'2021-04-01 10:17:51','2021-04-01 10:17:51'),(2076,'Тинькофф Cash-in RUB → Bitcoin BTC',254,1,71,13,'2021-04-01 10:17:51','2021-04-01 10:17:51'),(2077,'Тинькофф Cash-in RUB → Tether ERC20 USDT',255,1,71,35,'2021-04-01 10:17:51','2021-04-01 10:17:51'),(2078,'Тинькофф Cash-in RUB → Ethereum ETH',257,1,71,16,'2021-04-01 10:17:51','2021-04-01 10:17:51'),(2079,'Tether TRC-20 USD → Любой банк RUB',270,1,70,75,'2021-04-01 10:17:51','2021-04-01 10:17:51'),(2080,'Bitcoin BTC → Любой банк RUB',271,1,13,75,'2021-04-01 10:17:51','2021-04-01 10:17:51'),(2081,'Ethereum ETH → Любой банк RUB',272,1,16,75,'2021-04-01 10:17:51','2021-04-01 10:17:51'),(2082,'Bitcoin Cash BCH → Любой банк RUB',273,1,14,75,'2021-04-01 10:17:51','2021-04-01 10:17:51'),(2083,'Monero XMR → Любой банк RUB',274,1,18,75,'2021-04-01 10:17:51','2021-04-01 10:17:51'),(2084,'Dash DSH → Любой банк RUB',275,1,15,75,'2021-04-01 10:17:51','2021-04-01 10:17:51'),(2085,'Zcash ZEC → Любой банк RUB',276,1,21,75,'2021-04-01 10:17:51','2021-04-01 10:17:51'),(2086,'Litecoin LTC → Любой банк RUB',277,1,17,75,'2021-04-01 10:17:51','2021-04-01 10:17:51'),(2087,'Ripple XRP → Любой банк RUB',278,1,19,75,'2021-04-01 10:17:51','2021-04-01 10:17:51'),(2088,'Stellar XLM → Любой банк RUB',279,1,59,75,'2021-04-01 10:17:51','2021-04-01 10:17:51'),(2089,'Dogecoin DOGE → Любой банк RUB',280,1,65,75,'2021-04-01 10:17:51','2021-04-01 10:17:51'),(2090,'True USD TUSD → Любой банк RUB',281,1,66,75,'2021-04-01 10:17:51','2021-04-01 10:17:51'),(2091,'USD Coin USDC → Любой банк RUB',282,1,67,75,'2021-04-01 10:17:51','2021-04-01 10:17:51'),(2092,'Binance Coin BNB → Любой банк RUB',283,1,68,75,'2021-04-01 10:17:51','2021-04-01 10:17:51'),(2093,'Tron TRX → Любой банк RUB',284,1,69,75,'2021-04-01 10:17:51','2021-04-01 10:17:51'),(2094,'Tether ERC20 USDT → Любой банк RUB',285,1,35,75,'2021-04-01 10:17:51','2021-04-01 10:17:51'),(2095,'Ether Classic ETC → Любой банк RUB',286,1,50,75,'2021-04-01 10:17:51','2021-04-01 10:17:51'),(2096,'Cardano ADA → Тинькофф RUB',287,1,52,36,'2021-04-01 10:17:51','2021-04-01 10:17:51'),(2097,'Cardano ADA → ВТБ RUB',288,1,52,61,'2021-04-01 10:17:51','2021-04-01 10:17:51'),(2098,'Cardano ADA → Альфа RUB',289,1,52,62,'2021-04-01 10:17:51','2021-04-01 10:17:51'),(2099,'Cardano ADA → VISA/MC RUB',290,1,52,41,'2021-04-01 10:17:51','2021-04-01 10:17:51'),(2100,'Cardano ADA → Любой банк RUB',291,1,52,75,'2021-04-01 10:17:51','2021-04-01 10:17:51'),(2101,'Cardano ADA → Альфа Сash-in RUB',292,1,52,72,'2021-04-01 10:17:51','2021-04-01 10:17:51'),(2102,'Cardano ADA → Тинькофф Cash-in RUB',293,1,52,71,'2021-04-01 10:17:51','2021-04-01 10:17:51'),(2103,'Chainlink LINK → Сбербанк RUB',294,1,89,7,'2021-04-01 10:17:51','2021-04-01 10:17:51'),(2104,'Chainlink LINK → Тинькофф RUB',295,1,89,36,'2021-04-01 10:17:51','2021-04-01 10:17:51'),(2105,'Chainlink LINK → ВТБ RUB',296,1,89,61,'2021-04-01 10:17:51','2021-04-01 10:17:51'),(2106,'Chainlink LINK → Альфа RUB',297,1,89,62,'2021-04-01 10:17:51','2021-04-01 10:17:51'),(2107,'Chainlink LINK → VISA/MC RUB',298,1,89,41,'2021-04-01 10:17:51','2021-04-01 10:17:51'),(2108,'Chainlink LINK → Тинькофф Cash-in RUB',299,1,89,71,'2021-04-01 10:17:51','2021-04-01 10:17:51'),(2109,'Chainlink LINK → Альфа Сash-in RUB',300,1,89,72,'2021-04-01 10:17:51','2021-04-01 10:17:51'),(2110,'Bitcoin BTC → Газпромбанк RUB',301,1,13,88,'2021-04-01 10:17:51','2021-04-01 10:17:51'),(2111,'Ethereum ETH → Газпромбанк RUB',302,1,16,88,'2021-04-01 10:17:51','2021-04-01 10:17:51'),(2112,'Tether ERC20 USDT → Газпромбанк RUB',303,1,35,88,'2021-04-01 10:17:51','2021-04-01 10:17:51'),(2113,'Ripple XRP → Газпромбанк RUB',304,1,19,88,'2021-04-01 10:17:51','2021-04-01 10:17:51'),(2114,'Cardano ADA → Газпромбанк RUB',305,1,52,88,'2021-04-01 10:17:51','2021-04-01 10:17:51'),(2115,'Zcash ZEC → Газпромбанк RUB',306,1,21,88,'2021-04-01 10:17:51','2021-04-01 10:17:51'),(2116,'Monero XMR → Газпромбанк RUB',307,1,18,88,'2021-04-01 10:17:51','2021-04-01 10:17:51'),(2117,'Bitcoin Cash BCH → Газпромбанк RUB',308,1,14,88,'2021-04-01 10:17:51','2021-04-01 10:17:51'),(2118,'Dash DSH → Газпромбанк RUB',309,1,15,88,'2021-04-01 10:17:51','2021-04-01 10:17:51'),(2119,'Ether Classic ETC → Газпромбанк RUB',310,1,50,88,'2021-04-01 10:17:51','2021-04-01 10:17:51'),(2120,'Litecoin LTC → Газпромбанк RUB',311,1,17,88,'2021-04-01 10:17:51','2021-04-01 10:17:51'),(2121,'Stellar XLM → Газпромбанк RUB',312,1,59,88,'2021-04-01 10:17:51','2021-04-01 10:17:51'),(2122,'Dogecoin DOGE → Газпромбанк RUB',313,1,65,88,'2021-04-01 10:17:51','2021-04-01 10:17:51'),(2123,'Tether TRC-20 USD → Газпромбанк RUB',314,1,70,88,'2021-04-01 10:17:51','2021-04-01 10:17:51'),(2124,'True USD TUSD → Газпромбанк RUB',315,1,66,88,'2021-04-01 10:17:51','2021-04-01 10:17:51'),(2125,'USD Coin USDC → Газпромбанк RUB',316,1,67,88,'2021-04-01 10:17:51','2021-04-01 10:17:51'),(2126,'Binance Coin BNB → Газпромбанк RUB',317,1,68,88,'2021-04-01 10:17:51','2021-04-01 10:17:51'),(2127,'Tron TRX → Газпромбанк RUB',318,1,69,88,'2021-04-01 10:17:52','2021-04-01 10:17:52'),(2128,'Chainlink LINK → Газпромбанк RUB',319,1,89,88,'2021-04-01 10:17:52','2021-04-01 10:17:52'),(2129,'Bitcoin BTC → Райффайзен RUB',320,1,13,76,'2021-04-01 10:17:52','2021-04-01 10:17:52'),(2130,'Ethereum ETH → Райффайзен RUB',321,1,16,76,'2021-04-01 10:17:52','2021-04-01 10:17:52'),(2131,'Tether ERC20 USDT → Райффайзен RUB',322,1,35,76,'2021-04-01 10:17:52','2021-04-01 10:17:52'),(2132,'Bitcoin BTC → Открытие RUB',323,1,13,77,'2021-04-01 10:17:52','2021-04-01 10:17:52'),(2133,'Tether ERC20 USDT → Открытие RUB',324,1,35,77,'2021-04-01 10:17:52','2021-04-01 10:17:52'),(2134,'Ethereum ETH → Открытие RUB',325,1,16,77,'2021-04-01 10:17:52','2021-04-01 10:17:52'),(2135,'Ripple XRP → Райффайзен RUB',326,1,19,76,'2021-04-01 10:17:52','2021-04-01 10:17:52'),(2136,'Cardano ADA → Яндекс.Деньги RUB',327,1,52,6,'2021-04-01 10:17:52','2021-04-01 10:17:52'),(2137,'Ether Classic ETC → Яндекс.Деньги RUB',328,1,50,6,'2021-04-01 10:17:52','2021-04-01 10:17:52'),(2138,'Chainlink LINK → Яндекс.Деньги RUB',329,1,89,6,'2021-04-01 10:17:52','2021-04-01 10:17:52'),(2139,'Cardano ADA → Райффайзен RUB',330,1,52,76,'2021-04-01 10:17:52','2021-04-01 10:17:52'),(2140,'Zcash ZEC → Райффайзен RUB',331,1,21,76,'2021-04-01 10:17:52','2021-04-01 10:17:52'),(2141,'Monero XMR → Райффайзен RUB',333,1,18,76,'2021-04-01 10:17:52','2021-04-01 10:17:52'),(2142,'Bitcoin Cash BCH → Райффайзен RUB',334,1,14,76,'2021-04-01 10:17:52','2021-04-01 10:17:52'),(2143,'Dash DSH → Райффайзен RUB',338,1,15,76,'2021-04-01 10:17:52','2021-04-01 10:17:52'),(2144,'Ether Classic ETC → Райффайзен RUB',339,1,50,76,'2021-04-01 10:17:52','2021-04-01 10:17:52'),(2145,'Litecoin LTC → Райффайзен RUB',340,1,17,76,'2021-04-01 10:17:52','2021-04-01 10:17:52'),(2146,'Stellar XLM → Райффайзен RUB',341,1,59,76,'2021-04-01 10:17:52','2021-04-01 10:17:52'),(2147,'Райффайзен RUB → Bitcoin BTC',342,1,76,13,'2021-04-01 10:17:52','2021-04-01 10:17:52'),(2148,'Райффайзен RUB → Ethereum ETH',343,1,76,16,'2021-04-01 10:17:52','2021-04-01 10:17:52'),(2149,'Райффайзен RUB → Tether ERC20 USDT',344,1,76,35,'2021-04-01 10:17:52','2021-04-01 10:17:52'),(2150,'Райффайзен RUB → Ether Classic ETC',345,1,76,50,'2021-04-01 10:17:52','2021-04-01 10:17:52'),(2151,'Райффайзен RUB → Ripple XRP',346,1,76,19,'2021-04-01 10:17:52','2021-04-01 10:17:52'),(2152,'Райффайзен RUB → Litecoin LTC',347,1,76,17,'2021-04-01 10:17:52','2021-04-01 10:17:52'),(2153,'Райффайзен RUB → Zcash ZEC',348,1,76,21,'2021-04-01 10:17:52','2021-04-01 10:17:52'),(2154,'Dogecoin DOGE → Райффайзен RUB',349,1,65,76,'2021-04-01 10:17:52','2021-04-01 10:17:52'),(2155,'Tether TRC-20 USD → Райффайзен RUB',350,1,70,76,'2021-04-01 10:17:52','2021-04-01 10:17:52'),(2156,'Tron TRX → Райффайзен RUB',351,1,69,76,'2021-04-01 10:17:52','2021-04-01 10:17:52'),(2157,'Binance Coin BNB → Райффайзен RUB',352,1,68,76,'2021-04-01 10:17:52','2021-04-01 10:17:52'),(2158,'USD Coin USDC → Райффайзен RUB',353,1,67,76,'2021-04-01 10:17:52','2021-04-01 10:17:52'),(2159,'Chainlink LINK → Райффайзен RUB',354,1,89,76,'2021-04-01 10:17:52','2021-04-01 10:17:52'),(2160,'Ripple XRP → Открытие RUB',355,1,19,77,'2021-04-01 10:17:52','2021-04-01 10:17:52'),(2161,'Litecoin LTC → Открытие RUB',356,1,17,77,'2021-04-01 10:17:52','2021-04-01 10:17:52'),(2162,'Tron TRX → Открытие RUB',357,1,69,77,'2021-04-01 10:17:52','2021-04-01 10:17:52'),(2163,'Dogecoin DOGE → Открытие RUB',358,1,65,77,'2021-04-01 10:17:52','2021-04-01 10:17:52'),(2164,'Binance Coin BNB → Открытие RUB',359,1,68,77,'2021-04-01 10:17:52','2021-04-01 10:17:52'),(2165,'Tether TRC-20 USD → Открытие RUB',360,1,70,77,'2021-04-01 10:17:52','2021-04-01 10:17:52'),(2166,'USD Coin USDC → Открытие RUB',361,1,67,77,'2021-04-01 10:17:52','2021-04-01 10:17:52'),(2167,'Stellar XLM → Открытие RUB',362,1,59,77,'2021-04-01 10:17:52','2021-04-01 10:17:52'),(2168,'Monero XMR → Открытие RUB',363,1,18,77,'2021-04-01 10:17:52','2021-04-01 10:17:52'),(2169,'Dash DSH → Открытие RUB',364,1,15,77,'2021-04-01 10:17:52','2021-04-01 10:17:52'),(2170,'Cardano ADA → Открытие RUB',365,1,52,77,'2021-04-01 10:17:52','2021-04-01 10:17:52'),(2171,'Bitcoin Cash BCH → Открытие RUB',366,1,14,77,'2021-04-01 10:17:52','2021-04-01 10:17:52'),(2172,'Zcash ZEC → Открытие RUB',367,1,21,77,'2021-04-01 10:17:52','2021-04-01 10:17:52'),(2173,'Ether Classic ETC → Открытие RUB',368,1,50,77,'2021-04-01 10:17:52','2021-04-01 10:17:52'),(2174,'Chainlink LINK → Открытие RUB',369,1,89,77,'2021-04-01 10:17:52','2021-04-01 10:17:52'),(2175,'True USD TUSD → Открытие RUB',370,1,66,77,'2021-04-01 10:17:52','2021-04-01 10:17:52'),(2176,'Открытие RUB → Bitcoin BTC',371,1,77,13,'2021-04-01 10:17:52','2021-04-01 10:17:52'),(2177,'Открытие RUB → Ethereum ETH',372,1,77,16,'2021-04-01 10:17:52','2021-04-01 10:17:52'),(2178,'Открытие RUB → Tether ERC20 USDT',373,1,77,35,'2021-04-01 10:17:52','2021-04-01 10:17:52'),(2179,'Открытие RUB → Ether Classic ETC',374,1,77,50,'2021-04-01 10:17:52','2021-04-01 10:17:52'),(2180,'Открытие RUB → Ripple XRP',375,1,77,19,'2021-04-01 10:17:52','2021-04-01 10:17:52'),(2181,'Открытие RUB → Litecoin LTC',376,1,77,17,'2021-04-01 10:17:52','2021-04-01 10:17:52'),(2182,'USD Coin USDC → Наличные RUB',379,1,67,57,'2021-04-01 10:17:52','2021-04-01 10:17:52'),(2183,'NEM XEM → Сбербанк RUB',380,1,46,7,'2021-04-01 10:17:52','2021-04-01 10:17:52'),(2184,'NEM XEM → Tinkoff-банк RUB',381,1,46,36,'2021-04-01 10:17:52','2021-04-01 10:17:52'),(2185,'NEM XEM → Альфа-Клик RUB',382,1,46,62,'2021-04-01 10:17:52','2021-04-01 10:17:52'),(2186,'NEM XEM → ВТБ24 RUB',383,1,46,61,'2021-04-01 10:17:52','2021-04-01 10:17:52'),(2187,'NEM XEM → Visa/Mastercard RUB',384,1,46,41,'2021-04-01 10:17:52','2021-04-01 10:17:52'),(2188,'Bitcoin BTC → Сбербанк (RUB)',19,27,13,7,'2021-04-06 21:18:21','2021-04-06 21:18:21'),(2189,'Bitcoin BTC → Райффайзен RUB',31,27,13,68,'2021-04-06 21:18:21','2021-04-06 21:18:21'),(2190,'Bitcoin BTC → Открытие RUB',33,27,13,69,'2021-04-06 21:18:21','2021-04-06 21:18:21'),(2191,'Bitcoin BTC → Tinkoff-банк RUB',34,27,13,36,'2021-04-06 21:18:21','2021-04-06 21:18:21'),(2192,'Bitcoin BTC → ВТБ24 RUB',35,27,13,70,'2021-04-06 21:18:21','2021-04-06 21:18:21'),(2193,'Ethereum ETH → Tinkoff-банк RUB',36,27,16,36,'2021-04-06 21:18:21','2021-04-06 21:18:21'),(2194,'Ether Classic ETC → Tinkoff-банк RUB',37,27,50,36,'2021-04-06 21:18:21','2021-04-06 21:18:21'),(2195,'Dogecoin DOGE → Tinkoff-банк RUB',38,27,61,36,'2021-04-06 21:18:21','2021-04-06 21:18:21'),(2196,'Litecoin LTC → Tinkoff-банк RUB',39,27,17,36,'2021-04-06 21:18:21','2021-04-06 21:18:21'),(2197,'Dash DSH → Tinkoff-банк RUB',40,27,15,36,'2021-04-06 21:18:21','2021-04-06 21:18:21'),(2198,'Ethereum ETH → Сбербанк RUB',43,27,16,7,'2021-04-06 21:18:21','2021-04-06 21:18:21'),(2199,'Dogecoin DOGE → Сбербанк RUB',44,27,61,7,'2021-04-06 21:18:21','2021-04-06 21:18:21'),(2200,'Litecoin LTC → Сбербанк RUB',45,27,17,7,'2021-04-06 21:18:21','2021-04-06 21:18:21'),(2201,'Ether Classic ETC → Сбербанк RUB',46,27,50,7,'2021-04-06 21:18:21','2021-04-06 21:18:21'),(2202,'Dash DSH → Сбербанк RUB',47,27,15,7,'2021-04-06 21:18:21','2021-04-06 21:18:21'),(2203,'Ethereum ETH → ВТБ24 RUB',50,27,16,70,'2021-04-06 21:18:21','2021-04-06 21:18:21'),(2204,'Dogecoin DOGE → ВТБ24 RUB',51,27,61,70,'2021-04-06 21:18:21','2021-04-06 21:18:21'),(2205,'Litecoin LTC → ВТБ24 RUB',52,27,17,70,'2021-04-06 21:18:21','2021-04-06 21:18:21'),(2206,'Ether Classic ETC → ВТБ24 RUB',53,27,50,70,'2021-04-06 21:18:21','2021-04-06 21:18:21'),(2207,'Dash DSH → ВТБ24 RUB',54,27,15,70,'2021-04-06 21:18:21','2021-04-06 21:18:21'),(2208,'Bitcoin BTC → Яндекс.Деньги RUB',57,27,13,6,'2021-04-06 21:18:21','2021-04-06 21:18:21'),(2209,'Ethereum ETH → Яндекс.Деньги RUB',58,27,16,6,'2021-04-06 21:18:21','2021-04-06 21:18:21'),(2210,'Dogecoin DOGE → Яндекс.Деньги RUB',59,27,61,6,'2021-04-06 21:18:21','2021-04-06 21:18:21'),(2211,'Litecoin LTC → Яндекс.Деньги RUB',60,27,17,6,'2021-04-06 21:18:21','2021-04-06 21:18:21'),(2212,'Ether Classic ETC → Яндекс.Деньги RUB',61,27,50,6,'2021-04-06 21:18:21','2021-04-06 21:18:21'),(2213,'Dash DSH → Яндекс.Деньги RUB',62,27,15,6,'2021-04-06 21:18:21','2021-04-06 21:18:21'),(2214,'Ripple XRP → Яндекс.Деньги RUB',65,27,19,6,'2021-04-06 21:18:21','2021-04-06 21:18:21'),(2215,'Ripple XRP → Сбербанк RUB',66,27,19,7,'2021-04-06 21:18:21','2021-04-06 21:18:21'),(2216,'Ripple XRP → ВТБ24 RUB',68,27,19,70,'2021-04-06 21:18:21','2021-04-06 21:18:21'),(2217,'Ripple XRP → Tinkoff-банк RUB',69,27,19,36,'2021-04-06 21:18:21','2021-04-06 21:18:21'),(2218,'Monero XMR → Яндекс.Деньги RUB',70,27,18,6,'2021-04-06 21:18:21','2021-04-06 21:18:21'),(2219,'Monero XMR → Сбербанк RUB',71,27,18,7,'2021-04-06 21:18:21','2021-04-06 21:18:21'),(2220,'Monero XMR → ВТБ24 RUB',72,27,18,70,'2021-04-06 21:18:21','2021-04-06 21:18:21'),(2221,'Monero XMR → Tinkoff-банк RUB',74,27,18,36,'2021-04-06 21:18:21','2021-04-06 21:18:21'),(2222,'Stellar XLM → Яндекс.Деньги RUB',75,27,59,6,'2021-04-06 21:18:21','2021-04-06 21:18:21'),(2223,'Stellar XLM → Сбербанк RUB',76,27,59,7,'2021-04-06 21:18:21','2021-04-06 21:18:21'),(2224,'Stellar XLM → ВТБ24 RUB',78,27,59,70,'2021-04-06 21:18:21','2021-04-06 21:18:21'),(2225,'Stellar XLM → Tinkoff-банк RUB',79,27,59,36,'2021-04-06 21:18:21','2021-04-06 21:18:21'),(2226,'Ethereum ETH → Райффайзен RUB',91,27,16,68,'2021-04-06 21:18:21','2021-04-06 21:18:21'),(2227,'Dogecoin DOGE → Райффайзен RUB',92,27,61,68,'2021-04-06 21:18:21','2021-04-06 21:18:21'),(2228,'Litecoin LTC → Райффайзен RUB',93,27,17,68,'2021-04-06 21:18:21','2021-04-06 21:18:21'),(2229,'Ether Classic ETC → Райффайзен RUB',94,27,50,68,'2021-04-06 21:18:21','2021-04-06 21:18:21'),(2230,'Dash DSH → Райффайзен RUB',95,27,15,68,'2021-04-06 21:18:21','2021-04-06 21:18:21'),(2231,'Ripple XRP → Райффайзен RUB',98,27,19,68,'2021-04-06 21:18:21','2021-04-06 21:18:21'),(2232,'Monero XMR → Райффайзен RUB',99,27,18,68,'2021-04-06 21:18:21','2021-04-06 21:18:21'),(2233,'Stellar XLM → Райффайзен RUB',100,27,59,68,'2021-04-06 21:18:21','2021-04-06 21:18:21'),(2234,'Tether ERC20 USDT → Сбербанк RUB',101,27,35,7,'2021-04-06 21:18:21','2021-04-06 21:18:21'),(2235,'Tether ERC20 USDT → Tinkoff-банк RUB',102,27,35,36,'2021-04-06 21:18:21','2021-04-06 21:18:21'),(2236,'Tether ERC20 USDT → ВТБ24 RUB',104,27,35,70,'2021-04-06 21:18:21','2021-04-06 21:18:21'),(2237,'Tether ERC20 USDT → Яндекс.Деньги RUB',106,27,35,6,'2021-04-06 21:18:21','2021-04-06 21:18:21'),(2238,'Tether ERC20 USDT → Райффайзен RUB',107,27,35,68,'2021-04-06 21:18:21','2021-04-06 21:18:21'),(2239,'Tron TRX → Сбербанк RUB',108,27,74,7,'2021-04-06 21:18:21','2021-04-06 21:18:21'),(2240,'Tron TRX → Tinkoff-банк RUB',109,27,74,36,'2021-04-06 21:18:21','2021-04-06 21:18:21'),(2241,'Tron TRX → ВТБ24 RUB',110,27,74,70,'2021-04-06 21:18:21','2021-04-06 21:18:21'),(2242,'Tron TRX → Яндекс.Деньги RUB',112,27,74,6,'2021-04-06 21:18:21','2021-04-06 21:18:21'),(2243,'Tron TRX → Райффайзен RUB',114,27,74,68,'2021-04-06 21:18:21','2021-04-06 21:18:21'),(2244,'Zcash ZEC → Сбербанк RUB',115,27,75,7,'2021-04-06 21:18:21','2021-04-06 21:18:21'),(2245,'Zcash ZEC → Tinkoff-банк RUB',116,27,75,36,'2021-04-06 21:18:21','2021-04-06 21:18:21'),(2246,'Zcash ZEC → ВТБ24 RUB',117,27,75,70,'2021-04-06 21:18:21','2021-04-06 21:18:21'),(2247,'Zcash ZEC → Яндекс.Деньги RUB',118,27,75,6,'2021-04-06 21:18:21','2021-04-06 21:18:21'),(2248,'Zcash ZEC → Райффайзен RUB',121,27,75,68,'2021-04-06 21:18:21','2021-04-06 21:18:21'),(2249,'Tron TRX → Открытие RUB',161,27,74,69,'2021-04-06 21:18:21','2021-04-06 21:18:21'),(2250,'Ethereum ETH → Открытие RUB',164,27,16,69,'2021-04-06 21:18:21','2021-04-06 21:18:21'),(2251,'Tether ERC20 USDT → Bitcoin BTC',171,27,35,13,'2021-04-06 21:18:21','2021-04-06 21:18:21'),(2252,'Tether ERC20 USDT → Ethereum ETH',172,27,35,16,'2021-04-06 21:18:21','2021-04-06 21:18:21'),(2253,'Bitcoin BTC → Tether ERC20 USDT',173,27,13,35,'2021-04-06 21:18:21','2021-04-06 21:18:21'),(2254,'Ethereum ETH → Tether ERC20 USDT',174,27,16,35,'2021-04-06 21:18:21','2021-04-06 21:18:21'),(2255,'Dogecoin DOGE → Открытие RUB',180,27,61,69,'2021-04-06 21:18:21','2021-04-06 21:18:21'),(2256,'Litecoin LTC → Открытие RUB',181,27,17,69,'2021-04-06 21:18:21','2021-04-06 21:18:21'),(2257,'Ether Classic ETC → Открытие RUB',182,27,50,69,'2021-04-06 21:18:21','2021-04-06 21:18:21'),(2258,'Dash DSH → Открытие RUB',183,27,15,69,'2021-04-06 21:18:21','2021-04-06 21:18:21'),(2259,'Ripple XRP → Открытие RUB',186,27,19,69,'2021-04-06 21:18:21','2021-04-06 21:18:21'),(2260,'Monero XMR → Открытие RUB',187,27,18,69,'2021-04-06 21:18:21','2021-04-06 21:18:21'),(2261,'Stellar XLM → Открытие RUB',188,27,59,69,'2021-04-06 21:18:21','2021-04-06 21:18:21'),(2262,'Tether ERC20 USDT → Открытие RUB',189,27,35,69,'2021-04-06 21:18:21','2021-04-06 21:18:21'),(2263,'Zcash ZEC → Открытие RUB',190,27,75,69,'2021-04-06 21:18:21','2021-04-06 21:18:21'),(2264,'Bitcoin Cash BCH → Сбербанк RUB',228,27,14,7,'2021-04-06 21:18:21','2021-04-06 21:18:21'),(2265,'Bitcoin Cash BCH → Tinkoff-банк RUB',229,27,14,36,'2021-04-06 21:18:21','2021-04-06 21:18:21'),(2266,'Bitcoin Cash BCH → ВТБ24 RUB',230,27,14,70,'2021-04-06 21:18:21','2021-04-06 21:18:21');
/*!40000 ALTER TABLE `bttree_exchanger_currency_direction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bttree_exchanger_site`
--

DROP TABLE IF EXISTS `bttree_exchanger_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bttree_exchanger_site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `api_url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` int(11) DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bttree_exchanger_site`
--

LOCK TABLES `bttree_exchanger_site` WRITE;
/*!40000 ALTER TABLE `bttree_exchanger_site` DISABLE KEYS */;
INSERT INTO `bttree_exchanger_site` VALUES (1,'Обменко','https://obmenko.org/api.php?key=KB3ZtuUg3mgexHE3RlwZAx',1,'2021-03-19 13:16:10','2021-03-19 13:18:33'),(27,'Nordex','https://nordex.cc/api.php?key=KB3ZtuUg3mgexHE3RlwZAx',1,'2021-03-19 13:16:10','2021-03-19 13:18:33');
/*!40000 ALTER TABLE `bttree_exchanger_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bttree_rbac_auth_assignment`
--

DROP TABLE IF EXISTS `bttree_rbac_auth_assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bttree_rbac_auth_assignment` (
  `item_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`item_name`,`user_id`),
  CONSTRAINT `bttree_rbac_auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `bttree_rbac_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bttree_rbac_auth_assignment`
--

LOCK TABLES `bttree_rbac_auth_assignment` WRITE;
/*!40000 ALTER TABLE `bttree_rbac_auth_assignment` DISABLE KEYS */;
INSERT INTO `bttree_rbac_auth_assignment` VALUES ('admin','1',1616046563);
/*!40000 ALTER TABLE `bttree_rbac_auth_assignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bttree_rbac_auth_item`
--

DROP TABLE IF EXISTS `bttree_rbac_auth_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bttree_rbac_auth_item` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `type` int(11) NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `rule_name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` text COLLATE utf8_unicode_ci,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `is_system` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`name`),
  KEY `rule_name` (`rule_name`),
  KEY `idx-auth_item-type` (`type`),
  CONSTRAINT `bttree_rbac_auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `bttree_rbac_auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bttree_rbac_auth_item`
--

LOCK TABLES `bttree_rbac_auth_item` WRITE;
/*!40000 ALTER TABLE `bttree_rbac_auth_item` DISABLE KEYS */;
INSERT INTO `bttree_rbac_auth_item` VALUES ('admin',1,'Administrator',NULL,NULL,1616046460,1616046460,1),('bttree.content.manage-all',1,'Управление контентом',NULL,NULL,1616046462,1616046462,1),('bttree.content.manage-article',1,'Управление статьями',NULL,NULL,1616046462,1616046462,1),('bttree.content.manage-category',1,'Управление категориями',NULL,NULL,1616046462,1616046462,1),('bttree.content.manage-news',1,'Управление новостями',NULL,NULL,1616046462,1616046462,1),('bttree.content.manage-page',1,'Управление страницами',NULL,NULL,1616046462,1616046462,1),('bttree.exchanger.admin',1,'Администрирование обменником',NULL,NULL,1616159312,1616159312,1),('bttree.panel.dashboard',1,'Доступ к dashboard',NULL,NULL,1616046463,1616046463,1),('bttree.panel.manage-plugins',1,'Управление плагинами',NULL,NULL,1616046463,1616046463,1),('bttree.rbac.manage-roles',1,'Управление ролями пользователей',NULL,NULL,1616046461,1616046461,1),('bttree.settings.manage',1,'Управление настройками плагинов',NULL,NULL,1616046464,1616046464,1),('bttree.user.manage',1,'Управление пользователями',NULL,NULL,1616046461,1616046461,1);
/*!40000 ALTER TABLE `bttree_rbac_auth_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bttree_rbac_auth_item_child`
--

DROP TABLE IF EXISTS `bttree_rbac_auth_item_child`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bttree_rbac_auth_item_child` (
  `parent` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `child` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`parent`,`child`),
  KEY `child` (`child`),
  CONSTRAINT `bttree_rbac_auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `bttree_rbac_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `bttree_rbac_auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `bttree_rbac_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bttree_rbac_auth_item_child`
--

LOCK TABLES `bttree_rbac_auth_item_child` WRITE;
/*!40000 ALTER TABLE `bttree_rbac_auth_item_child` DISABLE KEYS */;
INSERT INTO `bttree_rbac_auth_item_child` VALUES ('admin','bttree.content.manage-all'),('bttree.content.manage-all','bttree.content.manage-article'),('bttree.content.manage-all','bttree.content.manage-category'),('bttree.content.manage-all','bttree.content.manage-news'),('bttree.content.manage-all','bttree.content.manage-page'),('admin','bttree.exchanger.admin'),('admin','bttree.panel.dashboard'),('admin','bttree.panel.manage-plugins'),('admin','bttree.rbac.manage-roles'),('admin','bttree.settings.manage'),('admin','bttree.user.manage');
/*!40000 ALTER TABLE `bttree_rbac_auth_item_child` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bttree_rbac_auth_rule`
--

DROP TABLE IF EXISTS `bttree_rbac_auth_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bttree_rbac_auth_rule` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `data` text COLLATE utf8_unicode_ci,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bttree_rbac_auth_rule`
--

LOCK TABLES `bttree_rbac_auth_rule` WRITE;
/*!40000 ALTER TABLE `bttree_rbac_auth_rule` DISABLE KEYS */;
/*!40000 ALTER TABLE `bttree_rbac_auth_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bttree_settings`
--

DROP TABLE IF EXISTS `bttree_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bttree_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `namespace` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci,
  `type` smallint(1) DEFAULT '0',
  `user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bttree_settings`
--

LOCK TABLES `bttree_settings` WRITE;
/*!40000 ALTER TABLE `bttree_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `bttree_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bttree_site`
--

DROP TABLE IF EXISTS `bttree_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bttree_site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `template_id` int(11) NOT NULL DEFAULT '1',
  `domain_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `domain_id` (`domain_id`),
  KEY `site_user_id_user_id` (`user_id`),
  KEY `site_template_id_template_id` (`template_id`),
  CONSTRAINT `site_template_id_template_id` FOREIGN KEY (`template_id`) REFERENCES `bttree_site_template` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `site_user_id_user_id` FOREIGN KEY (`user_id`) REFERENCES `bttree_user_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bttree_site`
--

LOCK TABLES `bttree_site` WRITE;
/*!40000 ALTER TABLE `bttree_site` DISABLE KEYS */;
/*!40000 ALTER TABLE `bttree_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bttree_site_page`
--

DROP TABLE IF EXISTS `bttree_site_page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bttree_site_page` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `keywords` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `main` tinyint(1) NOT NULL DEFAULT '0',
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content` text COLLATE utf8_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `menu_show` smallint(1) NOT NULL,
  `menu_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `root` int(11) DEFAULT NULL,
  `lft` int(11) NOT NULL,
  `rgt` int(11) NOT NULL,
  `lvl` smallint(5) NOT NULL,
  `icon` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `icon_type` smallint(1) NOT NULL DEFAULT '1',
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `selected` tinyint(1) NOT NULL DEFAULT '0',
  `disabled` tinyint(1) NOT NULL DEFAULT '0',
  `readonly` tinyint(1) NOT NULL DEFAULT '0',
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  `collapsed` tinyint(1) NOT NULL DEFAULT '0',
  `movable_u` tinyint(1) NOT NULL DEFAULT '1',
  `movable_d` tinyint(1) NOT NULL DEFAULT '1',
  `movable_l` tinyint(1) NOT NULL DEFAULT '1',
  `movable_r` tinyint(1) NOT NULL DEFAULT '1',
  `removable` tinyint(1) NOT NULL DEFAULT '1',
  `removable_all` tinyint(1) NOT NULL DEFAULT '0',
  `child_allowed` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `site_page_site_id_site_id` (`site_id`),
  CONSTRAINT `site_page_site_id_site_id` FOREIGN KEY (`site_id`) REFERENCES `bttree_site` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bttree_site_page`
--

LOCK TABLES `bttree_site_page` WRITE;
/*!40000 ALTER TABLE `bttree_site_page` DISABLE KEYS */;
/*!40000 ALTER TABLE `bttree_site_page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bttree_site_settings`
--

DROP TABLE IF EXISTS `bttree_site_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bttree_site_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `keywords` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `favicon` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `logo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `site_id` (`site_id`),
  CONSTRAINT `site_settings_site_id_site_id` FOREIGN KEY (`site_id`) REFERENCES `bttree_site` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bttree_site_settings`
--

LOCK TABLES `bttree_site_settings` WRITE;
/*!40000 ALTER TABLE `bttree_site_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `bttree_site_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bttree_site_template`
--

DROP TABLE IF EXISTS `bttree_site_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bttree_site_template` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `path` (`path`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bttree_site_template`
--

LOCK TABLES `bttree_site_template` WRITE;
/*!40000 ALTER TABLE `bttree_site_template` DISABLE KEYS */;
INSERT INTO `bttree_site_template` VALUES (1,'Default template','main','2021-03-18 05:47:44',NULL),(2,'Custom template','custom','2021-03-18 05:47:44',NULL);
/*!40000 ALTER TABLE `bttree_site_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bttree_user_profile`
--

DROP TABLE IF EXISTS `bttree_user_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bttree_user_profile` (
  `user_id` int(11) NOT NULL,
  `first_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `middle_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `avatar` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `fk_bttree_user_profile_user` (`user_id`),
  CONSTRAINT `fk_bttree_user_profile_user` FOREIGN KEY (`user_id`) REFERENCES `bttree_user_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bttree_user_profile`
--

LOCK TABLES `bttree_user_profile` WRITE;
/*!40000 ALTER TABLE `bttree_user_profile` DISABLE KEYS */;
INSERT INTO `bttree_user_profile` VALUES (1,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `bttree_user_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bttree_user_token`
--

DROP TABLE IF EXISTS `bttree_user_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bttree_user_token` (
  `user_id` int(11) NOT NULL,
  `code` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `type` smallint(6) NOT NULL,
  UNIQUE KEY `ux_bttree_user_token` (`user_id`,`code`,`type`),
  CONSTRAINT `fk_bttree_user_token_user_id` FOREIGN KEY (`user_id`) REFERENCES `bttree_user_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bttree_user_token`
--

LOCK TABLES `bttree_user_token` WRITE;
/*!40000 ALTER TABLE `bttree_user_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `bttree_user_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bttree_user_user`
--

DROP TABLE IF EXISTS `bttree_user_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bttree_user_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '1',
  `access_token` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_email_confirmed` smallint(1) DEFAULT '0',
  `visited_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ux_bttree_user_user_username` (`username`),
  UNIQUE KEY `ux_bttree_user_user_email` (`email`),
  KEY `ix_bttree_user_user_status` (`status`),
  KEY `ix_bttree_user_user_access_token` (`access_token`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bttree_user_user`
--

LOCK TABLES `bttree_user_user` WRITE;
/*!40000 ALTER TABLE `bttree_user_user` DISABLE KEYS */;
INSERT INTO `bttree_user_user` VALUES (1,'admin','7apEKVKflzuHuWc_pF-A_UIm7hlTdFgj','$2y$13$UxXqUY/Seke98aT5QfI17.8LfDv6A1/ss/k.hwnWaLzksrsQ580Hu','crazyxoma@gmail.com',1,'BpKpbmKyOSYELZTjr21gC20pfUl60nbR','2021-03-18 05:49:23','2021-03-18 05:49:23',0,'2021-03-31 12:56:53');
/*!40000 ALTER TABLE `bttree_user_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migration`
--

DROP TABLE IF EXISTS `migration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migration`
--

LOCK TABLES `migration` WRITE;
/*!40000 ALTER TABLE `migration` DISABLE KEYS */;
INSERT INTO `migration` VALUES ('m000000_000000_base',1616046460),('m000000_000001_bttree_site_template_base',1616046464),('m000000_000002_bttree_site_base',1616046464),('m000000_000003_bttree_site_settings_base',1616046464),('m000000_000004_bttree_site_page_base',1616046465),('m150114_160000_bttree_settings_settings_init',1616046464),('m150620_134000_bttree_user_user_table_init',1616046461),('m150913_145400_bttree_content_base',1616046462),('m150925_031000_bttree_rbac_init',1616046460),('m150926_141149_bttree_user_profile',1616046461),('m151016_092356_add_publish_date',1616046462),('m151229_033943_bttree_content_author_column',1616046462),('m151230_155623_bttree_rbac_default_roles',1616046460),('m160101_011023_bttree_content_default_roles',1616046462),('m160101_012012_bttree_panel_default_roles',1616046463),('m160101_023212_bttree_rbac_item_system_column',1616046461),('m160101_063254_bttree_settings_default_roles',1616046464),('m160101_063944_bttree_user_default_roles',1616046461),('m160202_230412_bttree_user_user_access_token',1616046461),('m160321_132258_add_token_table',1616046462),('m160321_133415_add_email_confirmation_field',1616046462),('m160407_152707_bttree_user_token_fix_timestamp',1616046462),('m160808_122613_add_user_visited_at',1616046462),('m170509_150203_add_content_images',1616046463),('m180125_142930_add_comment_table',1616046463),('m180129_183148_add_content_on_index',1616046463),('m180204_053846_add_category_data',1616046463),('m210319_133800_bttree_exchanger_base',1616159312),('m210326_154300_bttree_currency_base',1617107143),('m210329_171400_bttree_currency_directions_base',1617107143);
/*!40000 ALTER TABLE `migration` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-07  8:49:45
