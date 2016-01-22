-- MySQL dump 10.11
--
-- Host: localhost    Database: prjman
-- ------------------------------------------------------
-- Server version	5.0.51b-community-nt

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
-- Table structure for table `Blogs`
--

DROP TABLE IF EXISTS `Blogs`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `Blogs` (
  `id` int(4) unsigned NOT NULL auto_increment,
  `pid` int(4) NOT NULL COMMENT 'dir id',
  `uid` int(4) NOT NULL COMMENT 'user id',
  `createDate` timestamp NOT NULL default '0000-00-00 00:00:00' on update CURRENT_TIMESTAMP,
  `title` varchar(100) NOT NULL,
  `content` text NOT NULL,
  `channelID` int(4) default NULL,
  `checkState` int(4) default '1',
  `downloadNum` int(4) NOT NULL default '0',
  `tags` varchar(50) default NULL,
  PRIMARY KEY  (`id`),
  KEY `downloadNum` (`downloadNum`),
  KEY `createDate` (`createDate`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `Blogs`
--

LOCK TABLES `Blogs` WRITE;
/*!40000 ALTER TABLE `Blogs` DISABLE KEYS */;
INSERT INTO `Blogs` VALUES (1,-1,1,'2011-10-22 03:32:36','å¸…å“¥çŒ«å’ª','<p>\r\n	1.å¨æ­¦å“¥<img alt=\"devil\" height=\"20\" src=\"http://localhost/static/js/ckeditor/plugins/smiley/images/devil_smile.gif\" title=\"devil\" width=\"20\" /></p>\r\n<p>\r\n	<img alt=\"\" src=\"/resource/rescontrol.php?pid=1&amp;path=image/cat/cat1.jpg\" /></p>\r\n<p>\r\n	2.æˆ‘å°±ä¸è¯´è‡ªå·±æ™’</p>\r\n<p>\r\n	<img alt=\"\" src=\"/resource/rescontrol.php?url=d7cb3c2133f765e1fc32600c34f28fac \" /></p>\r\n<p>\r\n	3.å°ç½—èŽ‰ï¼Œæ±‚ä¿å…»</p>\r\n<p>\r\n	<img alt=\"\" src=\"/resource/rescontrol.php?url=599775b739be8eadc1c307807382bafc\" /></p>\r\n',500,1,1,NULL),(2,-1,1,'2011-10-22 03:43:13','çº¯çœŸå¹´ä»£','<p>\r\n	<img alt=\"\" src=\"/resource/rescontrol.php?url=51f82574509f56bbc41d4584da52f463 \" /></p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	<img alt=\"\" src=\"/resource/rescontrol.php?url=e40f00f2a6c1448c60952abe2cb61c8c \" /></p>\r\n',100,1,1,NULL),(3,-1,1,'2011-10-22 03:53:59','å¤ªç©º','<p>\r\n	<img alt=\"\" src=\"/resource/rescontrol.php?url=ba1383540b9d6f92bd0b0c46cfd622e4 \" width=\"700\" /><img alt=\"\" src=\"/resource/rescontrol.php?url=0539deb27fcc1ee5f0d5a2cd0f693da0\" width=\"700\" /></p>\r\n',200,1,0,NULL),(4,-1,1,'2011-10-22 03:55:24','é£žé©¬','<p>\r\n	<img alt=\"\" src=\"/resource/rescontrol.php?url=0bfb2858852bac8bf427cc41cdb8e601\" /></p>\r\n',400,1,0,NULL),(5,-1,1,'2011-10-22 17:30:46','åŽŸæ¥ã€‚ã€‚ã€‚åˆ°äº†å¤å¤©å…¨ä¸–ç•Œçš„å®…ï¼Œéƒ½æ˜¯ä¸€ä¸ªå¾·è¡Œã€‚ ','<p>\r\n	<img alt=\"\" src=\"/resource/rescontrol.php?url=9886759a2cb44aef274d989f4c778bbb \" /></p>\r\n',500,1,4,NULL),(6,-1,1,'2011-10-22 23:40:11','ç”·äººçš„å†…å¿ƒ','<p>\r\n	&ldquo;è§è¿‡å¾ˆå¤šç±»åž‹çš„ç”·äººåŽï¼Œæœ€ç»ˆè§‰å¾—ç”·äººæœ€å¤§çš„ç‰¹ç‚¹å°±æ˜¯å•çº¯ï¼Œå³ä¾¿å¹´çºªå¤§äº†ä¹Ÿè¿˜æ˜¯åƒå°å­©å­çš„æ„Ÿè§‰ã€‚å¦‚æžœä¸€ä¸ªç”·äººæ€»è®©å¥³å‹æ„Ÿåˆ°ä»–çš„æˆç†Ÿã€‚é‚£ä¹ˆæˆ‘æƒ³ï¼Œè¿™ä¸ªå¥³äººå¯èƒ½æ²¡æœ‰èƒ½èµ°è¿›ä»–çš„å†…å¿ƒã€‚&rdquo;----è‹äº•ç©º</p>\r\n<p style=\"text-align: right\">\r\n	&nbsp;</p>\r\n<p>\r\n	<img alt=\"\" src=\"/resource/rescontrol.php?url=a8faded902f4ce383f3aa3109a45492a \" /></p>\r\n<p>\r\n	&nbsp;</p>\r\n',300,1,4,NULL),(7,-1,1,'2011-10-22 04:32:49','æ¨Šå°‘çš‡','<p>\r\n	<img alt=\"\" src=\"/resource/rescontrol.php?url=36a399c290a625cc8cbc19ca54cc0eaa \" /></p>\r\n',100,1,1,NULL),(8,-1,1,'2011-10-22 04:56:54','Cè¯­è¨€æ¼”åŒ–--çºªå¿µ Dennis M. Ritchie','<p>\r\n	&nbsp;</p>\r\n<p>\r\n	åœ¨è¿‡åŽ»çš„åå¹´ä¸­ï¼ŒCè¯­è¨€ä¸æ–­æ¼”åŒ–ï¼Œè™½ç„¶å˜åŒ–çš„é€ŸçŽ‡å¾ˆç¼“æ…¢ã€‚ANSIæ ‡å‡†æ­£å¼åœ°æŽ¥å—äº†è¿™äº›æ”¹å˜ï¼Œå¹¶ä¸”ä¹ŸåŠ å…¥äº†ä¸€äº›å…¶è‡ªèº«çš„ç‰¹æ€§ã€‚ç”±ç¼–è¯‘å™¨è¿›è¡Œçš„é”™è¯¯æ£€æŸ¥çš„æ•°é‡ä¸€ç›´åœ¨ç¨³æ­¥ä¸Šå‡ï¼šè™½ç„¶è¯­è¨€ä¸­å¯¹ä½ çš„æ‰€ä½œæ‰€ä¸ºçš„çº¦æŸä¾æ—§ä¸å¤šï¼Œä½†çŽ°åœ¨å½“ä½ åšå‡ºä¸€äº›å¥‡æ€ªçš„äº‹æƒ…å‰ï¼Œä½ éœ€è¦æ›´å¤šæ˜¾å¼åœ°ç¡®è®¤ä½ çš„æ“ä½œã€‚<br />\r\n	<br />\r\n	åœ¨æŽ¥ä¸‹æ¥çš„è‹¥å¹²å¹´ï¼ŒCè¯­è¨€å¯èƒ½èµ°å‘ä½•æ–¹ï¼Ÿæœ€æœ‰å¯èƒ½çš„æ¼”åŒ–å°±æ˜¯ç»§ç»­ç›®å‰è¿™ç§ç¼“æ…¢ä½†ç¨³å®šçš„æ”¹è¿›ï¼Œè°¨æ…Žåœ°æ·»åŠ ä¸€äº›æ–°çš„ç‰¹æ€§ã€‚è°¨æ…Žæ˜¯å¿…è¦çš„ï¼Œå› ä¸ºä¸Žç›®å‰å·²ç»å­˜åœ¨çš„åºžå¤§æ•°é‡çš„Cä»£ç ä¿æŒå…¼å®¹æ˜¯æžå…¶é‡è¦çš„ã€‚æˆ‘ä»¬ä¸èƒ½æ— ç¼˜æ— æ•…åœ°åšå‡ºæ”¹å˜ã€‚<br />\r\n	<br />\r\n	å®žäº‹æ±‚æ˜¯åœ°è¯´ï¼ŒCè¯­è¨€æœ¬èº«ä¸å¯èƒ½è¿›è¡Œè¾ƒå¤§ç¨‹åº¦çš„æ”¹å˜äº†ï¼›åè€Œä¸€äº›æ–°è¯­è¨€å°†æºè‡ªäºŽCè¯­è¨€ã€‚C++å°±æ˜¯ä¸€ä¸ªä¾‹å­ï¼Œå®ƒæä¾›äº†æ•°æ®æŠ½è±¡ä»¥åŠé¢å‘å¯¹è±¡ç¼–ç¨‹çš„è®¾æ–½ï¼Œè€Œä¸”å‡ ä¹Žå®Œæ•´åœ°ä¿ç•™äº†ä¸ŽCçš„å…¼å®¹æ€§ï¼ˆå‚è§&quot;æ›´å¥½çš„Cï¼Ÿ&quot;)ã€‚ä¸Žæ­¤åŒæ—¶ï¼Œéšç€ä½ ä½¿ç”¨Cè¯­è¨€ç»éªŒçš„å¢žåŠ ï¼ŒCæœ¬èº«ä¾ç„¶ç»ä¹…è€ç”¨ã€‚ä¼´éšç€15å¹´çš„Cè¯­è¨€ä½¿ç”¨ç»éªŒï¼Œæˆ‘ä»¬ä»ç„¶æœ‰è¿™æ ·çš„æ„Ÿè§‰ã€‚</p>\r\n',300,1,0,NULL),(9,-1,1,'2011-10-22 05:04:22','åˆ˜æ˜Žåº·ï¼šä¸­å›½é“¶è¡Œä¸šå¯æ‰¿å—æˆ¿åœ°äº§æŠµæŠ¼å“ä¸‹è·Œ40%','<p>\r\n	æœ€æ–°åŽ‹åŠ›æµ‹è¯•ç»“æžœæ˜¾ç¤ºé“¶è¡Œä¸šæˆ¿åœ°äº§é£Žé™©å¯æŽ§ã€‚ç›®å‰çº¦98%ä¸ªäººæŒ‰æ­è´·æ¬¾&ldquo;è´·æ¬¾æˆ¿ä»·æ¯”(LTV)&rdquo;ä½ŽäºŽ80%ï¼ŒæŒ‰æ­è´·æ¬¾å¹³å‡&ldquo;å¿å€ºæ”¶å…¥æ¯”&rdquo;ä¸º33%ï¼Œè¶…è¿‡1/2æŒ‰æ­è´·æ¬¾å’Œå¼€å‘è´·æ¬¾éƒ½æ˜¯åœ¨2009å¹´æˆ¿ä»·é«˜ä¼ä¹‹å‰å‘æ”¾çš„ï¼Œå¼€å‘è´·æ¬¾å¹³å‡æŠ¼å“æ¯”ä¾‹ä¹Ÿè¾¾189%ã€‚</p>\r\n<p>\r\n	&nbsp;</p>\r\n',300,1,0,NULL),(10,-1,1,'2011-10-23 03:43:55','æ€å¿µä¸‰é²œæ°´é¥ºæŸ¥å‡ºé‡‘é»„è‰²è‘¡è„çƒèŒ å¯å¼•å‘è‚ºç‚Žç”šè‡³è´¥è¡€ç—…','<p>\r\n	çŸ¥åå“ç‰Œæ€å¿µä¸‰é²œæ°´é¥ºè¢«æ£€å‡ºå¯å¼•èµ·è‚ºç‚Žçš„é‡‘é»„è‰²è‘¡è„çƒèŒï¼ŒçŽ°è¯¥æ‰¹æ¬¡æ°´é¥ºå·²ç»è¢«åŒ—äº¬å¸‚åœæ­¢é”€å”®ã€‚è¯¥èŒæ˜¯äººç±»åŒ–è„“æ„ŸæŸ“ä¸­æœ€å¸¸è§çš„ç—…åŽŸèŒï¼Œå¯å¼•èµ·å±€éƒ¨åŒ–è„“æ„ŸæŸ“ï¼Œä¹Ÿå¯å¼•èµ·è‚ºç‚Žã€ä¼ªè†œæ€§è‚ ç‚Žã€å¿ƒåŒ…ç‚Žç­‰ï¼Œç”šè‡³è´¥è¡€ç—‡ã€è„“æ¯’ç—‡ç­‰å…¨èº«æ„ŸæŸ“ã€‚</p>\r\n',300,1,7,NULL),(11,-1,1,'2011-10-22 05:08:23','ç»¿é¢†å·¾','<p>\r\n	&ldquo;ä½ å­¦ä¹ ä¸å¥½ï¼Œæˆ´ç»¿é¢†å·¾ï¼Œæˆ‘æ‰æ˜¯çœŸæ­£çš„çº¢é¢†å·¾&hellip;&hellip;&rdquo;è¥¿å®‰å¸‚æœªå¤®åŒºç¬¬ä¸€å®žéªŒå°å­¦é—¨å£ï¼Œæ¥æŽ¥ä½©æˆ´ç»¿é¢†å·¾å­©å­çš„å®¶é•¿çš„è¡¨æƒ…å°´å°¬ã€‚ä¸€äº›å®¶é•¿è¡¨ç¤ºï¼Œ&ldquo;å­©å­å¹´é¾„å†å°ä¹Ÿæœ‰è‡ªå°Šï¼Œå­¦æ ¡æ­¤æ³•æ¬ å¦¥ã€‚&rdquo;å­¦æ ¡å›žåº”ç§°ï¼Œè¯¥åšæ³•æ˜¯ä¸ºæ¿€åŠ±ä¸Šè¿›ï¼Œå¹¶éžæ­§è§†ã€‚</p>\r\n<p>\r\n	<img alt=\"\" src=\"http://imgs.dapenti2.com:88/dapenti/Bs0vd0dw/14rmlF.jpg\" style=\"width: 640px; height: 427px; \" /></p>\r\n',-1,1,0,NULL),(12,-1,1,'2011-10-22 05:11:02','èƒ¡é€‚æ—¥è®°','<p>\r\n	ä¸€ä¸ªè‚®è„çš„å›½å®¶ï¼Œå¦‚æžœäººäººéƒ½å¼€å§‹è®²è§„åˆ™è€Œä¸æ˜¯è°ˆé“å¾·ï¼æœ€ç»ˆä¼šå˜æˆä¸€ä¸ªæœ‰äººå‘³å„¿çš„æ­£å¸¸å›½å®¶ï¼Œé“å¾·è‡ªç„¶ä¼šé€æ¸å›žå½’ï¼ä¸€ä¸ªå¹²å‡€çš„å›½å®¶ï¼Œå¦‚æžœäººäººéƒ½ä¸è®²è§„åˆ™å´å¤§è°ˆé“å¾·ï¼Œäººäººéƒ½äº‰å½“é«˜å°šï¼Œå¤©å¤©æ²¡äº‹å„¿å°±è°ˆé“å¾·è§„èŒƒï¼äººäººéƒ½å¤§å…¬æ— ç§ï¼Œæœ€ç»ˆè¿™ä¸ªå›½å®¶ä¼šå •è½æˆä¸ºä¸€ä¸ªä¼ªå›éå¸ƒçš„è‚®è„å›½å®¶ï¼</p>\r\n',300,1,0,NULL),(13,-1,1,'2011-10-22 05:12:32','è‹±å›½å‘çƒ§å‹ä¸ºä¹°iPhone 4SæŽ’é˜Ÿ10å¤©','<p>\r\n	14æ—¥æ˜¯è‹¹æžœå…¬å¸iPhone 4Sä¸Šå¸‚ç¬¬ä¸€å¤©ï¼Œè‹¹æžœå…¬å¸ä¼¦æ•¦è€ƒæ–‡ç‰¹èŠ±å›­åº—æ—©å°±æŽ’èµ·äº†é•¿é˜Ÿï¼Œè´­å¾—çš„äººå…´å¥‹å¾—&ldquo;å‡ è¿‘å´©æºƒ&rdquo;ã€‚ç¬¬ä¸€ä¸ªä¹°åˆ°iPhone 4Sçš„æ˜¯æ¥è‡ªè€ƒæ–‡åž‚çš„ä¸€ä¸ªåå«ç½—ä¼¯çš„è€å…„ï¼Œä»–ä¸ºäº†æŠ¢å…ˆæŽ’äº†æ•´æ•´10å¤©é˜Ÿã€‚è‹¹æžœiPhone 4Sé¢„è®¡æœ¬å‘¨æœ«å¯å”®å‡º300ä¸‡éƒ¨ï¼Œé¢„å®šçš„100ä¸‡éƒ¨å·²ç»å”®å‡ºã€‚</p>\r\n<p>\r\n	<img alt=\"\" src=\"http://imgs.dapenti2.com:88/dapenti/BrytKjHr/9pLn5.jpg\" style=\"width: 425px; height: 287px; \" /></p>\r\n',300,1,0,NULL),(14,-1,1,'2011-10-22 05:13:36','æ–‡åŒ–å¼ºå›½','<p>\r\n	æ‰“é€ æ–‡åŒ–å¼ºå›½éœ€è¦ä¸‰ä¸ªå‰ææ¡ä»¶ï¼š1,æ”¹é©å†…å®¹å®¡æŸ¥åˆ¶åº¦,ç»™æ€æƒ³å’Œåˆ›ä½œä¸€ç‰‡æ›´åŠ è‡ªç”±çš„å¤©ç©ºã€‚2,å…è®¸ç»å¤§å¤šæ•°åª’ä½“èµ°å‘&ldquo;äº§ä¸š&rdquo;,å¹¶ä¸”æ˜¯å½»åº•äº§ä¸šåŒ–,è€Œä¸æ˜¯åª’ä½“ç•™åœ¨ä½“åˆ¶å†…ã€è¿è¥å‰¥åˆ°ä½“åˆ¶å¤–çš„&ldquo;ä¸¤å±‚çš®&rdquo;æ¨¡å¼ã€‚3,ä»Žä¸Šè‡³ä¸‹å‡å°‘è¯´å‡è¯,ä¸€ä¸ªå‡è¯æ¯”çœŸè¯è¯´å¾—è¿˜æºœçš„æ°‘æ—æ²¡æœ‰èƒ½åŠ›ã€ä¹Ÿæ²¡æœ‰èµ„æ ¼å‘ä¸–ç•Œè¾“å‡ºæ–‡åŒ–ã€‚</p>\r\n',300,1,0,NULL),(15,-1,1,'2011-10-22 05:15:17','çŠ¯é”™è¯¯çš„å±é™©ç•™ç»™äº†è‡ªå·±','<p>\r\n	æ‰€è°“å„¿ç«¥ä¸å®œã€å…¶å®žå°±æ˜¯å¤§äººä»¬ä»¤äººæ„ŸåŠ¨åœ°æŠŠçŠ¯é”™è¯¯çš„å±é™©ç•™ç»™äº†è‡ªå·±</p>\r\n<p>\r\n	<img alt=\"\" src=\"http://imgs.dapenti2.com:88/dapenti/BrT24a0d/12FrFH.jpg\" style=\"width: 645px; height: 543px; \" /></p>\r\n',300,1,0,NULL),(16,-1,1,'2011-10-22 05:16:45','å°æ¹¾å…„å¦¹20å¹´é—´ç»™æ¯äº²æ2è‚¾1è‚','<p>\r\n	å°æ¹¾å¦‡å¥³ç®€æ•¬å­å‘½è¿å¤šèˆ›ï¼Œ20å¹´å‰è‚¾è¡°ç«­ï¼Œå„¿å­æè‚¾æ•‘æ¯ï¼Œ8å¹´å‰è‚¾åˆå‡ºé—®é¢˜ï¼Œå¥³å„¿æè‚¾ã€‚ä»Šå¹´6æœˆï¼Œç®€å¦‡è‚ç¡¬åŒ–æ¿’æ­»ï¼Œå¥³å„¿æ¯…ç„¶å†æè‚ï¼Œå„¿å¥³ä»¬è¡¨ç¤ºï¼Œæ¯äº²æ•™è‚²å¾—å¥½ï¼Œè¿™äº›äº‹å¯¹ä»–ä»¬å°±åƒå‘¼å¸ä¸€æ ·è‡ªç„¶ï¼</p>\r\n<p>\r\n	<img alt=\"\" src=\"http://imgs.dapenti2.com:88/dapenti/Brzh6qaW/GFhrl.jpg\" style=\"width: 329px; height: 247px; \" /></p>\r\n',300,1,0,NULL),(17,-1,1,'2011-10-22 05:17:45','é»‘ç¤¾ä¼šçš„','<p>\r\n	å¤§è¿žä¸€æˆ¿åœ°äº§å¼€å‘å•†è¦æ”¶è´­ä¸€å—è€•åœ°å¼€æ”¾æ¥¼ç›˜ï¼Œå¼€å‘å•†ä¸Žå†œæ°‘ä»·é’±æ²¡æœ‰è°ˆå¥½ä½†æ€¥äºŽå¼€æ”¾ï¼Œå°±æ‰¾äº†äº›é»‘ç¤¾ä¼šçš„åŽ»å†œæ°‘å®¶é‡Œå¤šæ¬¡å¨èƒæå“ï¼Œç”šè‡³å¤§æ‰“å‡ºæ‰‹ã€‚æ²¡æƒ³åˆ°ï¼Œè¿™ä¸ªå†œæ°‘æ‰¾æ¥ä¸€ä¸ªäº²æˆšï¼Œäº²æˆšå¸¦æ¥200å¤šä¸ªé»‘ç¤¾ä¼šçš„ï¼ŒæŠŠå¼€å‘å•†çš„å”®æ¥¼å¤„åŒ…å›´ï¼Œå¼€å‘å•†å®æ­»ä¸æ•¢å‡ºåŽ»ï¼ŒåŽæ¥æŒ‰ç…§å†œæ°‘çš„è¦æ±‚ç»™äº†é’±è¿˜å¤šç»™6ä¸‡å…ƒå¼Ÿå…„ä»¬å–é…’é’±ã€‚</p>\r\n<p>\r\n	<img alt=\"\" src=\"http://imgs.dapenti2.com:88/dapenti/BryrsY7Y/nCFSg.jpg\" style=\"width: 512px; height: 348px; \" /></p>\r\n',300,1,1,NULL),(18,-1,1,'2011-10-22 05:21:35','æˆ‘æ°¸è¿œæ˜¯ä¸­å›½çš„æµ·è¿ª','<p>\r\n	&nbsp;</p>\r\n<p>\r\n	ï¼ˆåŒ—äº¬æ™šæŠ¥ï¼‰è®°è€…æ°ä¸Žä¸­å›½æ®‹ç–¾äººè”åˆä¼šä¸»å¸­å¼ æµ·è¿ªåŒä¹˜ä¸€æž¶é£žæœºï¼Œå¥¹å¦è¯šè®¤çœŸåœ°è¡¨è¾¾å‡ºè‡ªå·±å¯¹è¿‘æ¥&ldquo;å¾®åš&rdquo;ä¸Šæœ‰å…³å¥¹æ˜¯å¦åŠ å…¥å¾·å›½å›½ç±ä¸€äº‹çš„çœ‹æ³•ï¼Œå¥¹è¯´ï¼š&ldquo;æˆ‘æ°¸è¿œæ˜¯ä¸­å›½çš„æµ·è¿ªï¼&rdquo;</p>\r\n<p>\r\n	å…³äºŽå¼ æµ·è¿ªå¼€è½¦çš„å‡ ä¸ªç–‘é—®ï¼šä¸€ï¼Œåœ¨å›½å®¶æ²¡æœ‰ç›¸å…³æ³•å¾‹å…è®¸é«˜ä½æˆªç˜«æ‚£è€…é©¾è½¦ä¸Šè·¯æ—¶ï¼Œç»™å¼ æµ·è¿ªå‘é©¾é©¶æ‰§ç…§ç®—ä¸ç®—æ˜¯ä¸€ç§ç‰¹æƒï¼ŸäºŒï¼Œå¼ æµ·è¿ªé©¾é©¶æœªåŠ æ”¹è£…çš„è½¦å­ä¸Šè·¯å¯¹ä»–äººæ˜¯ä¸æ˜¯ä¸€ç§å¨èƒï¼Œæ˜¯å¦å±žäºŽå±é™©é©¾é©¶ï¼ŸäºŒï¼Œä¸€ä¸ªé«˜ä½æˆªç˜«ç—…äººï¼Œè‡ªå·±æ€Žä¹ˆä¸Šè½¦ï¼Œä¸Šè½¦åŽæ€Žä¹ˆæŠŠè½®æ¤…æ¬åˆ°è½¦ä¸Šï¼Œä¸‹è½¦åŽåˆæ€Žä¹ˆæ¬ä¸‹æ¥ï¼Œå†åä¸ŠåŽ»ï¼Ÿ</p>\r\n<p>\r\n	<img alt=\"\" src=\"http://imgs.dapenti2.com:88/dapenti/BrygfMdq/Ny2wt.jpg\" style=\"width: 409px; height: 325px; \" /></p>\r\n<p>\r\n	&nbsp;</p>\r\n',300,1,0,NULL),(19,-1,1,'2011-10-23 02:24:43','å…±åŒå¯Œè£•','<p>\r\n	<img alt=\"\" src=\"http://imgs.dapenti2.com:88/dapenti/BrybNo9F/6UoCb.jpg\" style=\"width: 400px; height: 287px; \" /></p>\r\n<p>\r\n	é‡åº†æ‹Ÿè§„å®šå…¬å¸åˆ©æ¶¦ä¸Šæ¶¨å‘˜å·¥å¯è¦æ±‚åŠ è–ªï¼Œæ ¹æ®ã€Šé‡åº†å¸‚å·¥èµ„é›†ä½“åå•†æ¡ä¾‹ï¼ˆè‰æ¡ˆï¼‰ã€‹è§„å®šï¼š1ï¼‰ä¼ä¸šåˆ©æ¶¦ä¸Šæ¶¨ï¼ŒèŒå·¥çš„å·¥èµ„ä¹Ÿè¦éšä¹‹å¢žåŠ ï¼›2ï¼‰åŒæ–¹å¼€å±•å·¥èµ„é›†ä½“åå•†å‰ï¼Œå‘˜å·¥ä¸€æ–¹åº”å½“é¦–å…ˆæˆç«‹å·¥ä¼šï¼›3ï¼‰èµ„æ–¹å¦‚æ‹’ç»å·¥èµ„åå•†ï¼Œæœ€é«˜å¯ç½šæ¬¾1ä¸‡å…ƒã€‚</p>\r\n<p>\r\n	&nbsp;</p>\r\n',300,1,10,NULL),(20,-1,5,'2011-10-24 21:38:55','ä¸¤è½¦ç¢¾çƒ‚å¥³ç«¥ä¸‹åŠèº« å†·è¡€è¡Œäººè·¯è¿‡ä¸å±‘ä¸€é¡¾','<p>\r\n	ä¸€å¥³ç«¥åœ¨å¸‚åœºçŽ©è€æ—¶è¢«é¢åŒ…è½¦æ’žå€’ï¼Œå‰è½®åŽ‹è¿‡ï¼Œå¸æœºåˆåŠ æ²¹é—¨åŽè½®ä»Žå¥³ç«¥èº«ä¸ŠåŽ‹è¿‡ã€‚æŽ¥ç€ä¸¤ä¸ªè¡Œäººè·¯è¿‡ï¼Œçœ‹åˆ°å¥³ç«¥èººåœ¨åœ°ä¸Šï¼Œä¸å±‘ä¸€é¡¾ã€‚å¥³ç«¥åˆè¢«å°è´§è½¦åŽ‹è¿‡ã€‚å‰å‰åŽåŽï¼Œ10ä¸ªäººç»è¿‡ï¼Œæœ€åŽä¸€ä½æ¡åžƒåœ¾çš„é˜¿å§¨ï¼ŒæŠŠå¥³ç«¥æ‹‰èµ·æ¥&hellip;&hellip;æ­¤æƒ…æ­¤æ™¯ï¼Œè®©äººæ±—æ¯›è€¸ç«‹ï¼Œè¡€éƒ½å†·äº†ï¼</p>\r\n<p>\r\n	<img alt=\"\" src=\"/resource/rescontrol.php?url=3d054f68b27aa168132c433a6d4f5f31 \" /></p>\r\n',300,1,20,NULL),(21,-1,5,'2011-10-24 21:38:52','æ‚¦æ‚¦çš„çˆ¶æ¯åˆšæ‰æ‰¾åˆ°äº†','<p>\r\n	æ‚¦æ‚¦çš„çˆ¶æ¯åˆšæ‰æ‰¾åˆ°äº†ï¼Œ13æ—¥çŽ°åœºæŠ±èµ·æ‚¦æ‚¦çš„è€äººï¼Œå¤«å¦»åŒè†è·ªåœ°ç­”è°¢è¿™ä½èº«æçŸ®å°çš„è€äººï¼Œè¿™ä¸€è·ªä¼šè·ªå€’å¤šå°‘å†·æ¼ çš„äººå‘€&hellip;&hellip;</p>\r\n',300,1,18,NULL),(22,-1,5,'2011-10-24 21:39:06','æ‹¾è’å©†å©†â€”â€”é™ˆè´¤å¦¹','<p>\r\n	å¥¹å°±æ˜¯å”¯ä¸€ä¸€ä¸ªæ•‘èµ·å°æ‚¦æ‚¦çš„æ‹¾è’å©†å©†&mdash;&mdash;é™ˆè´¤å¦¹ã€‚å©†å©†ä»Šå¹´58å²äº†ï¼Œå©†å©†è¯´å¥¹æ•‘æ‚¦æ‚¦çš„æ—¶å€™ä»€ä¹ˆéƒ½æ²¡æƒ³ï¼Œåªæƒ³åˆ°æ•‘å¥¹ã€‚åœ¨æ˜¨å¤©å†…å¿ƒè¢«å†°å†·ä¸€å¤©åŽï¼Œä»Šå¤©æ€»ç®—æœ‰äº†ä¸€ä¸æ¸©æš–ã€‚è°¢è°¢é™ˆå©†å©†è®©æˆ‘çŸ¥é“ä¸–ä¸Šè¿˜æœ‰æœ‰å¿ƒäººã€‚</p>\r\n<p>\r\n	<img alt=\"\" src=\"/resource/rescontrol.php?url=40d1ef6914dec090a092257cf8563bd7\" style=\"width: 352px; height: 471px; \" /></p>\r\n',300,1,26,NULL),(23,-1,5,'2011-10-24 21:44:40','æ¿€åŠ¨çš„è·ªä¸‹äº†','<p>\r\n	æ‚¦æ‚¦å¦ˆå¦ˆä¸€è§é˜¿å§¨å°±æ¿€åŠ¨çš„è·ªä¸‹äº†ã€‚</p>\r\n<p>\r\n	<img alt=\"\" src=\"http://imgs.dapenti2.com:88/dapenti/BrSueh9W/3vP2V.jpg\" style=\"width: 352px; height: 471px; \" /></p>\r\n<p>\r\n	å¯¹äºŽæœ‰åª’ä½“æŠ¥é“ç§°å°æ‚¦æ‚¦å·²ç»è„‘æ­»äº¡çš„è¯´æ³•ï¼Œæ–‡åŒ»ç”Ÿäºˆä»¥å¦è®¤ï¼Œå¹¶è¡¨ç¤ºç›®å‰ä»åœ¨æŠ¢æ•‘æ²»ç–—é˜¶æ®µï¼Œä¸è¿‡å°æ‚¦æ‚¦ä»å¾ˆå±é™©ï¼Œç›®å‰ä¸»è¦æ˜¯ç»´æŒå…¶ç”Ÿå‘½ä½“å¾ã€‚</p>\r\n<p>\r\n	<img alt=\"\" src=\"http://imgs.dapenti2.com:88/dapenti/BrSItejt/Pbccq.jpg\" style=\"width: 440px; height: 347px; \" /></p>\r\n<p>\r\n	&nbsp;</p>\r\n',300,1,24,NULL),(24,-1,5,'2011-10-24 21:39:10','æˆ‘æ•‘äººä¸æ˜¯ä¸ºäº†é’±','<p>\r\n	&nbsp;</p>\r\n<p>\r\n	æ®æ–°å¿«æŠ¥ï¼Œé™„è¿‘è¡—åŠå¾—çŸ¥é™ˆè´¤å¦¹æ•‘å°æ‚¦æ‚¦çš„äº‹ï¼Œåªæœ‰å°‘æ•°äººå¯¹å¥¹è®¤å¯ã€‚è®°è€…è¯¢é—®è¡—åŠçœ‹æ³•ï¼Œå¤§éƒ¨åˆ†äººå¹¶æ²¡å…³å¿ƒå­©å­çŽ°çŠ¶ï¼Œè€Œæ˜¯è¿½é—®&ldquo;æ¡ç ´çƒ‚çš„é™ˆå§¨å¥–åŠ±å‡ å¤šé’±ï¼Ÿ&rdquo;å½“å¾—æ‚‰æ…°é—®é‡‘æœ‰2ä¸‡å¤šæ—¶ï¼Œä»–ä»¬ç«Ÿå˜˜å£°ä¸€ç‰‡ï¼Œè¯´&ldquo;é™ˆé˜¿å§¨å‘è¾¾å•¦ï¼&rdquo;&ldquo;å¥½å½©å•Šï¼&rdquo;</p>\r\n<p>\r\n	æ­¤å‰æ•‘èµ·ä¸¤å²å¥³ç«¥å°æ‚¦æ‚¦çš„æ‹¾è’é˜¿å§¨é™ˆè´¤å¦¹è¿‘æ—¥å¼•èµ·å…¨å›½åª’ä½“çš„å…³æ³¨ï¼Œå›½å†…å¤–ä¸Šç™¾å®¶åª’ä½“çº·çº·èµ¶æ¥é‡‡è®¿æŠ¥é“ï¼Œé™ˆè´¤å¦¹è¡¨ç¤ºï¼Œ&ldquo;è¿™åªæ˜¯ä»¶å°äº‹æƒ…ï¼Œæˆ‘å½“æ—¶åªæƒ³å¸®ä¸€ä¸‹ï¼Œæ²¡æœ‰æƒ³å¤ªå¤šï¼Œæ²¡ä»€ä¹ˆå¥½è®²çš„ã€‚&rdquo;</p>\r\n<p>\r\n	<img border=\"0\" src=\"http://imgs.dapenti2.com:88/dapenti/Bs0HxOaJ/ZGJqp.jpg\" style=\"border-right-width: 0px; border-right-style: initial; border-right-color: rgb(0, 0, 0); border-left-width: 0px; border-left-style: initial; border-left-color: rgb(0, 0, 0); border-bottom-width: 0px; border-bottom-style: initial; border-bottom-color: rgb(0, 0, 0); border-top-color: rgb(0, 0, 0); \" /></p>\r\n<p>\r\n	10æœˆ17æ—¥ï¼Œå¹¿ä¸œä½›å±±ï¼Œé™ˆè´¤å¦¹æŽ¥å—å—æµ·åŒºæ–‡æ˜ŽåŠžçš„æ…°é—®ï¼Œååˆ†ä¸æƒ…æ„¿åœ°æŽ¥å—äº†æ…°é—®é‡‘ï¼Œæœ´å®žåœ°å¥¹ä¸åœé‡å¤ï¼Œ&ldquo;æˆ‘æ•‘äººä¸æ˜¯ä¸ºäº†é’±ã€‚&rdquo;</p>\r\n',300,1,38,NULL),(25,-1,5,'2011-10-24 21:45:12','æ‚¦æ‚¦è¿˜æ˜¯ç¦»å¼€äº†æˆ‘ä»¬','<p>\r\n	@christopherjing(å…‹é‡Œæ–¯æ‰˜å¤«é‡‘) æ˜¨å¤©å‡Œæ™¨ï¼Œæ·±æ·±ç‰µåŠ¨æµ·å†…å¤–äººå¿ƒçš„æ‚¦æ‚¦è¿˜æ˜¯ç¦»å¼€äº†æˆ‘ä»¬ï¼Œå¥¹ä¸åº”èµ°å¾—é‚£ä¹ˆæ€¥ï¼Œå› ä¸ºå¥¹æ‰æ¥åˆ°äººé—´ä¸åˆ°ä¸¤å¹´ï¼Œå¥¹ä¹Ÿè®¸å‘½ä¸­æ³¨å®šè¦è¿œç¦»è¿™ä¸ªå†°å†·ç¤¾ä¼šï¼Œå¥¹æœ€åŽä¸€åˆ»åªçœ‹åˆ°å‘¼å•¸çš„è´§è½¦å’Œæ¼ ç„¶çš„è·¯äººï¼Œå¥¹æœ¬åº”å’Œæ‰€æœ‰åŒé¾„äººä¸€èµ·é•¿å¤§ï¼Œä½†å´æ— å£°æ¯å¤­æŠ˜åœ¨å¤ªé˜³åˆšåˆšå‡èµ·çš„ç¥žå·žå¤§åœ°ã€‚å°æ‚¦æ‚¦ï¼Œå®‰æ¯å§ï¼Œä¸€è·¯èµ°å¥½ï¼ @christopherjing(å…‹é‡Œæ–¯æ‰˜å¤«é‡‘) å¦‚æžœæˆ‘æ˜¯æ‚¦æ‚¦çš„çˆ¶æ¯ï¼š1ï¼‰ä¸ºå¥³å„¿æ·±æ·±ç¥ˆç¥·ï¼Œæ²¡æœ‰ç…§é¡¾å¥½2å²çš„å¥¹ï¼Œæ˜¯æ‚²å‰§ç¬¬ä¸€åŽŸå› ï¼Œè¦æ‰¿æ‹…ç¬¬ä¸€è´£ä»»ï¼›2ï¼‰ä¸æ˜¯ä¸ªäººè€Œæ˜¯ç¤¾ä¼šå‡ºäº†é—®é¢˜ï¼Œä¸­å›½äººæ˜¯å–„è‰¯çš„ï¼Œæœ‰å†·è¡€è¿‡è·¯äººï¼Œæ›´æœ‰çƒ­å¿ƒæ‹¾è’è€…ï¼›3ï¼‰å®½æ•è‚‡äº‹å¸æœºï¼Œç»™ä»–ä»¬ä¸€ä¸ªæœºä¼šï¼Œè®©æ³•å¾‹ä¸»æŒå…¬é“ï¼›4ï¼‰è®©æœ‰å…¬ä¿¡åŠ›çš„æœºæž„æ‰“ç‚¹æèµ ï¼›5ï¼‰æ„Ÿæ©é˜¿å©†ï¼Œä¼ é€’çˆ±å¿ƒï¼Œæ›´åŠ å…³çˆ±åˆ«äººã€‚&nbsp;</p>\r\n',300,1,67,NULL);
/*!40000 ALTER TABLE `Blogs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ConstValue`
--

DROP TABLE IF EXISTS `ConstValue`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `ConstValue` (
  `id` int(10) unsigned zerofill NOT NULL auto_increment,
  `name` varchar(100) NOT NULL,
  `value` varchar(200) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `ConstValue`
--

LOCK TABLES `ConstValue` WRITE;
/*!40000 ALTER TABLE `ConstValue` DISABLE KEYS */;
INSERT INTO `ConstValue` VALUES (0000000001,'VersionUpdateDate','2011-10-13');
/*!40000 ALTER TABLE `ConstValue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PrjBug`
--

DROP TABLE IF EXISTS `PrjBug`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `PrjBug` (
  `id` int(4) unsigned NOT NULL auto_increment,
  `pid` int(4) NOT NULL,
  `reportDate` timestamp NOT NULL default '0000-00-00 00:00:00' on update CURRENT_TIMESTAMP,
  `desc` text NOT NULL,
  `author` varchar(50) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `PrjBug`
--

LOCK TABLES `PrjBug` WRITE;
/*!40000 ALTER TABLE `PrjBug` DISABLE KEYS */;
/*!40000 ALTER TABLE `PrjBug` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PrjGuest`
--

DROP TABLE IF EXISTS `PrjGuest`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `PrjGuest` (
  `id` int(4) unsigned NOT NULL auto_increment,
  `pid` int(4) NOT NULL,
  `name` varchar(50) default NULL,
  `createDate` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `message` text NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `PrjGuest`
--

LOCK TABLES `PrjGuest` WRITE;
/*!40000 ALTER TABLE `PrjGuest` DISABLE KEYS */;
INSERT INTO `PrjGuest` VALUES (5,2,'jerry','2011-10-19 00:57:44','å¥½çŽ©ã€‚');
/*!40000 ALTER TABLE `PrjGuest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PrjVersion`
--

DROP TABLE IF EXISTS `PrjVersion`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `PrjVersion` (
  `id` int(4) unsigned NOT NULL auto_increment,
  `pid` int(4) NOT NULL,
  `releaseDate` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `desc` text NOT NULL,
  `url` char(100) NOT NULL,
  `title` char(100) NOT NULL,
  `downloadNum` int(4) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `downloadNum` (`downloadNum`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `PrjVersion`
--

LOCK TABLES `PrjVersion` WRITE;
/*!40000 ALTER TABLE `PrjVersion` DISABLE KEYS */;
INSERT INTO `PrjVersion` VALUES (2,1,'2011-10-24 21:49:25','flash ç‰ˆæœ¬','/resource/rescontrol.php?url=a13768b9eca79261ff8681d6b26eec40','1.0.1',110),(3,2,'2011-10-24 18:17:13','å”¯ä¸€flashç‰ˆæœ¬','/resource/rescontrol.php?url=904f7456d0d1631c9ae756afd61423d5','1.0.1',38),(4,3,'2011-10-24 21:43:27','flashå”¯ä¸€ç‰ˆæœ¬','/resource/rescontrol.php?url=85e35be80067c3c1fa71792de1c316c0','1.0.1',18),(5,4,'2011-10-22 02:51:35','1.0.1','/resource/rescontrol.php?pid=1&path=webgl/star/star.htm','1.0.1',44),(6,5,'2011-10-23 02:28:19','0.1.3','  /resource/rescontrol.php?pid=1&path=soft/project-3.rar','0.1.3',10),(11,7,'2011-10-14 02:20:09','åè¿‡æ¥æƒ³,æ€»æ˜¯åè¿‡æ¥æƒ³','http://www.dapenti.com/blog/more.asp?name=xilei&id=51382','ã€å–·åšå›¾å¦20111013ã€‘',3),(12,7,'2011-10-22 02:52:37','å¥¹æœ‰æ—¶ä¹Ÿä¼šæ€è€ƒâ€œä»€ä¹ˆæ˜¯ç”Ÿå‘½çš„æ„ä¹‰â€','http://www.dapenti.com/blog/more.asp?name=xilei&id=51485','ã€å–·åšå›¾å¦20111015ã€‘å¥¹æœ‰æ—¶ä¹Ÿä¼šæ€è€ƒâ€œä»€ä¹ˆæ˜¯ç”Ÿå‘½çš„æ„ä¹‰â€',6),(14,8,'2011-10-24 21:38:55','ä¸€å¥³ç«¥åœ¨å¸‚åœºçŽ©è€æ—¶è¢«é¢åŒ…è½¦æ’žå€’','/blog/blogcontrol.php?action=getblog&amp;bid=20','[2011-10-16]',20),(15,8,'2011-10-24 21:38:51','æ‚¦æ‚¦çš„çˆ¶æ¯åˆšæ‰æ‰¾åˆ°äº†','/blog/blogcontrol.php?action=getblog&amp;bid=21','[2011-10-16]-2',17),(16,8,'2011-10-24 21:39:06','æ‹¾è’å©†å©†â€”â€”é™ˆè´¤å¦¹  ','/blog/blogcontrol.php?action=getblog&amp;bid=22','[2011-10-17]',26),(17,8,'2011-10-24 21:44:40','æ¿€åŠ¨çš„è·ªä¸‹äº† ','/blog/blogcontrol.php?action=getblog&amp;bid=23','11-10-18',25),(18,8,'2011-10-24 21:39:10','æˆ‘æ•‘äººä¸æ˜¯ä¸ºäº†é’±','/blog/blogcontrol.php?action=getblog&amp;bid=24','11-10-19',34),(20,8,'2011-10-24 21:44:36','æ‚¦æ‚¦è¿˜æ˜¯ç¦»å¼€äº†æˆ‘ä»¬','/blog/blogcontrol.php?action=getblog&amp;bid=25','11-10-21',65);
/*!40000 ALTER TABLE `PrjVersion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Projects`
--

DROP TABLE IF EXISTS `Projects`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `Projects` (
  `id` int(4) unsigned NOT NULL auto_increment,
  `name` char(100) NOT NULL,
  `desc` text NOT NULL,
  `createDate` timestamp NOT NULL default '0000-00-00 00:00:00' on update CURRENT_TIMESTAMP,
  `updateVersion` varchar(100) default NULL,
  `updateVID` int(4) default NULL,
  `updateDate` date NOT NULL,
  `authorID` int(11) default NULL,
  `headImg` varchar(100) default NULL,
  `downloadNum` int(11) default '0',
  `channelID` int(4) default '0',
  `checkState` int(4) default '0',
  `tags` varchar(50) default NULL,
  PRIMARY KEY  (`id`),
  KEY `updateDate` (`updateDate`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `Projects`
--

LOCK TABLES `Projects` WRITE;
/*!40000 ALTER TABLE `Projects` DISABLE KEYS */;
INSERT INTO `Projects` VALUES (1,'å°é£žæœº',' é€šè¿‡é¼ æ ‡æŽ§åˆ¶çš„é£žè¡Œflashæ¸¸æˆ','2011-10-24 21:49:25','1.0.1',2,'2011-10-10',1,'/resource/rescontrol.php?pid=1&path=game/pic/fly.png',110,300,0,NULL),(2,'å¹³è¡¡çˆ†ç ´','å¹³è¡¡çˆ†ç ´','2011-10-24 18:17:13','&lt;p&gt;0.1.dfs&lt;/dsl&gt;',3,'2011-10-19',1,'/resource/rescontrol.php?url=71cb306d868ad97b9b8c8edefd97cab3',41,200,0,NULL),(3,'éšè—å°„å‡»','å°„å‡»flashæ¸¸æˆ','2011-10-24 21:43:27','1.0.1',4,'2011-10-10',1,' /resource/rescontrol.php?url=8a134e5981e369af04b787e2c96c0276',18,300,0,NULL),(4,'æ˜Ÿå…‰é—ªé—ª',' é—ªçƒçš„æ˜Ÿæ˜Ÿ\néœ€è¦ä½¿ç”¨æ”¯æŒwebglçš„æµè§ˆå™¨ï¼Œ\nå¦‚chrome,firefox,safari,isee','2011-10-22 02:51:35','1.0.1',5,'2011-10-11',1,'/resource/rescontrol.php?pid=1&path=webgl/star/star.png ',44,100,0,NULL),(5,'goosle',' å…·æœ‰cè¯­æ³•çš„è„šæœ¬è¯­è¨€ï¼Œ\niseeæµè§ˆå™¨ä½¿ç”¨è¿™ä¸ªå¼€æºé¡¹ç›®\nå¼€å‘3Dæ¸¸æˆã€‚','2011-10-23 02:28:19','0.1.3',6,'2011-10-11',1,'',10,500,0,NULL),(7,'æ¯å¤©ä¸€å›¾å¦ï¼Œè®©æˆ‘ä»¬æ›´æ¸…æ¥šåœ°äº†è§£è¿™ä¸ªä¸–ç•Œ','   è½¬è‡ªâ€œæ‰“å–·åšâ€ç½‘','2011-10-22 02:52:37','ã€å–·åšå›¾å¦20111015ã€‘å¥¹æœ‰æ—¶ä¹Ÿä¼šæ€è€ƒâ€œä»€ä¹ˆæ˜¯ç”Ÿå‘½çš„æ„ä¹‰â€',12,'2011-10-16',1,'/resource/rescontrol.php?pid=1&amp;path=dapengti/www.dapenti.jpg',9,400,0,NULL),(8,'ç¤¾ä¼šé“å¾·çš„åŽæžœ-æ‚¦æ‚¦è¿˜æ˜¯ç¦»å¼€äº†æˆ‘ä»¬','å°æ‚¦æ‚¦äº‹ä»¶æŠ¥é“','2011-10-24 21:44:40','11-10-21',20,'2011-10-22',5,'http://localhost/resource/rescontrol.php?url=40d1ef6914dec090a092257cf8563bd7',188,400,0,NULL);
/*!40000 ALTER TABLE `Projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Resources`
--

DROP TABLE IF EXISTS `Resources`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `Resources` (
  `id` int(4) unsigned NOT NULL auto_increment,
  `pid` int(4) NOT NULL,
  `path` varchar(100) NOT NULL,
  `url` char(50) NOT NULL COMMENT 'url=md5(uid+useType+localPath+filename)',
  `resType` char(1) NOT NULL COMMENT 'img|sound|video|htm|program|download',
  `mimeType` char(50) NOT NULL,
  `upDate` timestamp NOT NULL default '0000-00-00 00:00:00' on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `Resources`
--

LOCK TABLES `Resources` WRITE;
/*!40000 ALTER TABLE `Resources` DISABLE KEYS */;
INSERT INTO `Resources` VALUES (1,1,'flash/fly.swf','a13768b9eca79261ff8681d6b26eec40','F','application/x-shockwave-flash','2011-10-10 19:37:35'),(2,1,'flash/house.SWF','904f7456d0d1631c9ae756afd61423d5','F','application/x-shockwave-flash','2011-10-10 19:37:36'),(3,1,'flash/kill.swf','85e35be80067c3c1fa71792de1c316c0','F','application/x-shockwave-flash','2011-10-10 19:37:38'),(4,1,'game/pic/fly.png','d2bf2068613923395548a0167aa20331','I','image/png','2011-10-10 17:43:04'),(5,1,'game/pic/kill.png','8a134e5981e369af04b787e2c96c0276','I','image/png','2011-10-10 17:43:04'),(6,1,'game/pic/house.png','71cb306d868ad97b9b8c8edefd97cab3','I','image/png','2011-10-10 17:43:04'),(10,1,'webgl/star/ga.js','8634362a96e56daf4ddd406c38fc0138','P','application/x-javascript','2011-10-11 01:05:17'),(11,1,'webgl/star/glMatrix-0.9.5.min.js','3bf32cdde7b8eff539e6ada46954347c','P','application/x-javascript','2011-10-11 01:05:17'),(12,1,'webgl/star/start.gif','68bdfa3ae5ed3c8d5fe60b3aef928526','P','image/gif','2011-10-11 01:05:17'),(13,1,'webgl/star/webgl-utils.js','4f6970544aa5ff53e366da59a2268400','P','application/x-javascript','2011-10-11 01:05:17'),(14,1,'webgl/star/star.png','361139d0fa201aa7627779b16b7be189','P','image/png','2011-10-11 01:13:06'),(15,1,'webgl/star/star.htm','75ff33021822ad0335e39d69d77a6791','H','text/html','2011-10-11 01:15:44'),(16,1,'soft/project-3.rar','0a2e6754f15e546b945bca3554ea5fbd','D','application/octet-stream','2011-10-11 03:10:35'),(18,1,'pic/b1.jpg','51f82574509f56bbc41d4584da52f463','I','image/jpeg','2011-10-11 03:29:49'),(20,1,'b3.jpg','e40f00f2a6c1448c60952abe2cb61c8c','I','image/jpeg','2011-10-11 03:30:00'),(21,1,'horse.jpg','0bfb2858852bac8bf427cc41cdb8e601','I','image/jpeg','2011-10-11 03:30:05'),(22,1,'image/cat/cat3.jpg','d7cb3c2133f765e1fc32600c34f28fac','I','image/jpeg','2011-10-11 03:47:16'),(23,1,'image/cat/cat2.jpg','599775b739be8eadc1c307807382bafc','I','image/jpeg','2011-10-11 03:47:16'),(24,1,'image/cat/cat1.jpg','b19d45699db4d3fdaf0510adb1c547fc','I','image/jpeg','2011-10-11 03:47:16'),(25,1,'image/plat/plat1.jpg','ba1383540b9d6f92bd0b0c46cfd622e4','I','image/jpeg','2011-10-11 03:48:13'),(26,1,'image/plat/plat2.jpg','0539deb27fcc1ee5f0d5a2cd0f693da0','I','image/jpeg','2011-10-11 03:48:13'),(27,1,'dapengti/www.dapenti.jpg','e92e5491e70f73a029c7257f13593d04','I','image/jpeg','2011-10-14 00:52:29'),(28,1,'11-10-21/zainv01.jpg','9886759a2cb44aef274d989f4c778bbb','I','image/pjpeg','2011-10-22 04:01:07'),(29,1,'11-10-21/canjinkong1.jpg','a8faded902f4ce383f3aa3109a45492a','I','image/pjpeg','2011-10-22 04:04:04'),(30,1,'11-10-21/pansaohuang.jpg','36a399c290a625cc8cbc19ca54cc0eaa','I','image/pjpeg','2011-10-22 04:09:25'),(31,5,'yueyue/yuyu1.jpg','3d054f68b27aa168132c433a6d4f5f31','I','image/jpeg','2011-10-22 18:31:27'),(32,5,'yueyue/yueyue2.jpg','40d1ef6914dec090a092257cf8563bd7','I','image/jpeg','2011-10-22 18:36:24');
/*!40000 ALTER TABLE `Resources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `UpdateCache`
--

DROP TABLE IF EXISTS `UpdateCache`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `UpdateCache` (
  `updateDate` date NOT NULL,
  `cache` text NOT NULL,
  `type` char(1) NOT NULL,
  PRIMARY KEY  (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `UpdateCache`
--

LOCK TABLES `UpdateCache` WRITE;
/*!40000 ALTER TABLE `UpdateCache` DISABLE KEYS */;
INSERT INTO `UpdateCache` VALUES ('2011-10-24','<div> <div class=\"band-hint\">çƒ­é—¨é¡¹ç›®</div><ul><li> <a target=\"_blank\" href=\"/project/prjcontrol.php?action=playversion&vid=2\">å°é£žæœº---1.0.1</a></li><li> <a target=\"_blank\" href=\"/project/prjcontrol.php?action=playversion&vid=20\">ç¤¾ä¼šé“å¾·çš„åŽæžœ-æ‚¦æ‚¦è¿˜æ˜¯ç¦»å¼€äº†æˆ‘ä»¬---11-10-21</a></li><li> <a target=\"_blank\" href=\"/project/prjcontrol.php?action=playversion&vid=5\">æ˜Ÿå…‰é—ªé—ª---1.0.1</a></li><li> <a target=\"_blank\" href=\"/project/prjcontrol.php?action=playversion&vid=3\">å¹³è¡¡çˆ†ç ´---1.0.1</a></li><li> <a target=\"_blank\" href=\"/project/prjcontrol.php?action=playversion&vid=18\">ç¤¾ä¼šé“å¾·çš„åŽæžœ-æ‚¦æ‚¦è¿˜æ˜¯ç¦»å¼€äº†æˆ‘ä»¬---11-10-19</a></li></ul></div><div> <div class=\"band-hint\">çƒ­é—¨æ–‡ç« </div><ul><li> <a target=\"_blank\" href=\"/blog/blogcontrol.php?action=playblog&bid=25\">æ‚¦æ‚¦è¿˜æ˜¯ç¦»å¼€äº†æˆ‘ä»¬</a></li><li> <a target=\"_blank\" href=\"/blog/blogcontrol.php?action=playblog&bid=24\">æˆ‘æ•‘äººä¸æ˜¯ä¸ºäº†é’±</a></li><li> <a target=\"_blank\" href=\"/blog/blogcontrol.php?action=playblog&bid=22\">æ‹¾è’å©†å©†â€”â€”é™ˆè´¤å¦¹</a></li><li> <a target=\"_blank\" href=\"/blog/blogcontrol.php?action=playblog&bid=21\">æ‚¦æ‚¦çš„çˆ¶æ¯åˆšæ‰æ‰¾åˆ°äº†</a></li><li> <a target=\"_blank\" href=\"/blog/blogcontrol.php?action=playblog&bid=23\">æ¿€åŠ¨çš„è·ªä¸‹äº†</a></li></ul></div><div> <div class=\"band-hint\">çƒ­é—¨ä½œå®¶</div><ul><li> <a target=\"_blank\" href=\"/blog/blogcontrol.php?action=showauthor&uid=5\">åŒ¹å¤«</a></li><li> <a target=\"_blank\" href=\"/blog/blogcontrol.php?action=showauthor&uid=1\">è‹¯ç”²åŸº</a></li><li> <a target=\"_blank\" href=\"/blog/blogcontrol.php?action=showauthor&uid=2\">é˜¿å®½</a></li><li> <a target=\"_blank\" href=\"/blog/blogcontrol.php?action=showauthor&uid=3\">å¦‚æ–¯ä¹Ž</a></li><li> <a target=\"_blank\" href=\"/blog/blogcontrol.php?action=showauthor&uid=4\">è›‹å®š</a></li></ul></div>','P');
/*!40000 ALTER TABLE `UpdateCache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `UserAccept`
--

DROP TABLE IF EXISTS `UserAccept`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `UserAccept` (
  `ID` int(4) unsigned NOT NULL auto_increment,
  `userID` int(4) NOT NULL,
  `authorID` int(4) NOT NULL,
  `lastViewDate` datetime default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `UserAccept`
--

LOCK TABLES `UserAccept` WRITE;
/*!40000 ALTER TABLE `UserAccept` DISABLE KEYS */;
/*!40000 ALTER TABLE `UserAccept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `UserRelease`
--

DROP TABLE IF EXISTS `UserRelease`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `UserRelease` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `title` varchar(150) NOT NULL,
  `url` varchar(150) NOT NULL,
  `channelID` int(11) NOT NULL,
  `checkState` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `UserRelease`
--

LOCK TABLES `UserRelease` WRITE;
/*!40000 ALTER TABLE `UserRelease` DISABLE KEYS */;
/*!40000 ALTER TABLE `UserRelease` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Users`
--

DROP TABLE IF EXISTS `Users`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `Users` (
  `id` int(4) unsigned NOT NULL auto_increment,
  `role` char(4) NOT NULL default 'c' COMMENT 'Common|Supper|Manager',
  `name` char(30) NOT NULL,
  `pwd` char(16) NOT NULL,
  `email` char(30) NOT NULL,
  `age` tinyint(4) NOT NULL default '0',
  `createDate` timestamp NOT NULL default '0000-00-00 00:00:00' on update CURRENT_TIMESTAMP,
  `gender` tinyint(4) NOT NULL default '0',
  `prjNum` int(4) NOT NULL default '0',
  `logNum` int(4) NOT NULL default '0',
  `headImg` varchar(100) default NULL,
  `downloadNum` int(4) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='name,email,pwd must be filled ,other uses default value';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `Users`
--

LOCK TABLES `Users` WRITE;
/*!40000 ALTER TABLE `Users` DISABLE KEYS */;
INSERT INTO `Users` VALUES (1,'S','è‹¯ç”²åŸº','gamelive','bluecode@qq.com',0,'2011-10-24 21:49:25',0,0,0,NULL,105),(2,'C','é˜¿å®½','gamelive','akuan.li@gamil.com',0,'2011-10-22 17:45:23',0,0,0,NULL,0),(3,'C','å¦‚æ–¯ä¹Ž','gamelive','rushifu@163.com',0,'2011-10-22 17:40:30',0,0,0,NULL,0),(4,'M','è›‹å®š','gamelive','followwater@qq.com',0,'2011-10-22 17:42:56',0,0,0,NULL,0),(5,'C','åŒ¹å¤«','gamelive','pifu@163.com',0,'2011-10-24 21:45:12',0,0,0,NULL,381);
/*!40000 ALTER TABLE `Users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `UserSave`
--

DROP TABLE IF EXISTS `UserSave`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `UserSave` (
  `id` int(4) unsigned NOT NULL auto_increment,
  `uid` int(4) NOT NULL,
  `vid` int(4) NOT NULL,
  `vtype` char(255) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `UserSave`
--

LOCK TABLES `UserSave` WRITE;
/*!40000 ALTER TABLE `UserSave` DISABLE KEYS */;
/*!40000 ALTER TABLE `UserSave` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2011-10-24 23:15:55
