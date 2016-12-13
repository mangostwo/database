-- ---------------------------------------- 
-- --        CLEAR DOWN THE TABLE        -- 
-- ---------------------------------------- 
TRUNCATE TABLE `achievement_reward`; 
-- ---------------------------------------- 
-- MySQL dump 10.13  Distrib 5.5.37, for Win32 (x86)
--
-- Host: localhost    Database: mangos2
-- ------------------------------------------------------
-- Server version	5.6.25-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@SESSION.TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Dumping data for table `achievement_reward`
--

LOCK TABLES `achievement_reward` WRITE;
/*!40000 ALTER TABLE `achievement_reward` DISABLE KEYS */;
INSERT INTO `achievement_reward` (`entry`, `gender`, `title_A`, `title_H`, `item`, `sender`, `subject`, `text`) VALUES 
(45,2,0,0,43348,28070,'You\'ve Been Around!','Well, look at ye!\n\nAnd I thought I had seen some things in this icy place! It seems obvious to this dwarf that you have the fire of the explorer burning in your eyes.\n\nWear this tabard with pride. That way your friends will know who to ask for directions when the time comes!\n\nKeep on the move!\n\nBrann Bronzebeard'),
(46,2,78,78,0,0,'',''),
(230,2,72,72,0,0,'',''),
(456,2,139,139,0,0,'',''),
(614,2,0,0,44223,29611,'For the Alliance!','War rages throughout our lands. Only the bravest heroes dare challenge strike the Horde where it hurts them most. You are among such heroes.\n\nThe blows you have delivered to the leadership of the Horde will open the door for our final assault. The Horde will bow down to the might of the Alliance.\n\nYour deeds will not go unrewarded. Ride on proudly!\n\n--Your King'),
(619,2,0,0,44224,4949,'For The Horde!','In this time of great turmoil true heroes rise from the misery. You are one such great hero.\n\nWar is upon us. Your efforts will further our cause on Azeroth. Your great feats shall go rewarded. Take this prize of Orgrimmar and ride to glory.\n\nFor the Horde!\n\nWarchief Thrall'),
(714,2,47,47,0,0,'',''),
(762,2,130,130,0,0,'',''),
(870,2,127,126,0,0,'',''),
(871,2,144,144,0,0,'',''),
(907,2,48,48,0,0,'',''),
(913,2,74,74,0,0,'',''),
(942,2,79,79,0,0,'',''),
(943,2,79,79,0,0,'',''),
(945,2,131,131,0,0,'',''),
(948,2,130,130,0,0,'',''),
(953,2,132,132,0,0,'',''),
(978,2,81,81,0,0,'',''),
(1015,2,77,77,0,0,'',''),
(1021,2,0,0,40643,29261,'Quite the Achiever','I couldn\'t help but notice what a fine collection of Tabards you\'ve managed to collect over the seasons. You might as well add this one to your collection. It\'s simply been gathering dust in my wardrobe.'),
(1038,2,75,75,0,0,'',''),
(1039,2,76,76,0,0,'',''),
(1174,2,82,82,0,0,'',''),
(1175,2,72,72,0,0,'',''),
(1250,2,0,0,40653,28951,'Stinker\'s New Home','I\'ve heard how well you take care of our furry friends. I hope you don\'t mind but I must get Stinker a new home. He just refuses to play nice with others.\n\nPlease make sure to feed him twice a day. And um... he has a thing for black cats.\n\n--Breanni'),
(1400,2,120,120,0,0,'',''),
(1402,2,122,122,0,0,'',''),
(1516,2,83,83,0,0,'',''),
(1563,2,84,84,0,0,'',''),
(1656,2,124,124,0,0,'',''),
(1657,2,124,124,0,0,'',''),
(1658,2,129,129,0,0,'',''),
(1681,2,125,125,43300,7999,'Greetings from Darnassus','Your accomplishments have been profound and far-reaching. Azeroth, with all of the recent turmoil, benefits greatly from those who seek to rid the land of evil.\n\nOnly those who take the time to know our lands understand the sacrifices of the fallen and the valor of our heroes. You are one such hero. Hopefully, you will recant the tales of your adventures for years to come.\n\nOn behalf of the Alliance, I thank you, Loremaster.'),
(1682,2,125,125,43300,3057,'','News of your accomplishments has traveled far. The winds of turmoil howl through our lands. Those who stand to challenge evil are our only hope.\n\nOnly those who listen to the winds understand the debts our fallen heroes have paid to protect our people. May a hero such as yourself live long to tell the tales of your adventures. For only then will we remember how much we have to be thankful for.\n\nOur appreciation runs deep, Loremaster.\n\nFor the Horde!\n\n--Cairne Bloodhoof'),
(1683,2,133,133,0,0,'',''),
(1684,2,133,133,0,0,'',''),
(1691,2,134,134,0,0,'',''),
(1692,2,134,134,0,0,'',''),
(1693,2,135,135,0,0,'',''),
(1707,2,135,135,0,0,'',''),
(1784,2,84,84,0,0,'',''),
(1793,0,138,138,0,0,NULL,NULL),
(1956,2,0,0,43824,16128,'Higher Learning','Congratulations on completing\nyour studies on The Schools of\nArcane Magic. In recognition of your\ndedication. I\'m enclosing this special\nvolume completing the series.\n\nI believe you\'ll find this tome\nparticularly entertaining. But I\'ll\nleave that for your discovery.\n\nSincerely,\n\nRhonin'),
(2051,2,140,140,0,0,'',''),
(2054,2,121,121,0,0,'',''),
(2096,2,0,0,44430,29478,'The Coin Master','Greetings and congratulations on collecting the full set of Dalaran coins! As a reward for all your hard work I have enclosed a freshly minted Titanium Seal of Dalaran. This is a special coin that we only grant to the most ardent of collectors.\n\nI hope you enjoy this special reward. You\'ve earned it!\n\nSincerely,\nJepetto Joybuzz'),
(2136,2,0,0,44160,26917,'Glory of the Hero','Champion,\n\nWord has traveled to Wyrmrest Temple\nof the great heroic deeds you have\naccomplished since arriving in\nNorthrend.\n\nYour bravery should not go\nunrecognized. Please accept this gift\non behalf of the Aspects. Together we\nshall rid Azeroth of evil, once and for\neternity.\n\nAlexstrasza the Life-Binder'),
(2143,2,0,0,44178,32216,'Leading the Cavalry','I couldn\'t help but to notice how good you are with the livestock. With all the activity around here, business has been better than ever for me. I don\'t suppose you\'d mind looking after this Albino Drake for me? I simply don\'t have enough spare minutes in the day to care for all of these animals. Yours, Mei'),
(2186,2,141,141,0,0,'',''),
(2187,2,142,142,0,0,'',''),
(2188,2,143,143,0,0,'',''),
(2336,2,145,145,0,0,NULL,NULL),
(2761,2,146,146,0,0,NULL,NULL),
(2760,2,147,147,0,0,NULL,NULL),
(2763,2,148,148,0,0,NULL,NULL),
(2764,2,149,149,0,0,NULL,NULL),
(2762,2,113,113,0,0,NULL,NULL),
(2765,2,150,150,0,0,NULL,NULL),
(2766,2,151,151,0,0,NULL,NULL),
(2767,2,152,152,0,0,NULL,NULL),
(2768,2,153,153,0,0,NULL,NULL),
(2769,2,154,154,0,0,NULL,NULL),
(2816,2,156,156,0,0,NULL,NULL),
(2817,2,156,156,0,0,NULL,NULL),
(2797,2,155,155,0,0,NULL,NULL),
(2798,2,155,155,0,0,NULL,NULL),
(3117,2,158,158,0,0,NULL,NULL),
(3259,2,159,159,0,0,NULL,NULL),
(2904,2,160,160,0,0,NULL,NULL),
(2903,2,161,161,0,0,NULL,NULL),
(3036,2,164,164,0,0,NULL,NULL),
(3037,2,165,165,0,0,NULL,NULL),
(3316,2,166,166,0,0,NULL,NULL),
(3478,2,168,168,44810,28951,'A Gobbler not yet Gobbled','Can you believe this Plump Turkey made it through November alive?\n\n\nSince all this friends have been served up on Bountiful Tables with sides of Cranberry Chutney and Spice Bread Stuffing and... ooo... I\'m getting hungry. But anyhow! He\'s all alone, now, so I was hoping you might be willing to take care of him. There simply isn\'t enough room left in my shop!\n\nJust keep him away from cooking fires, please. He gets this strange look in his eyes around them...'),
(3656,2,168,168,44810,28951,'A Gobbler not yet Gobbled','Can you believe this Plump Turkey made it through November alive?\n\n\nSince all this friends have been served up on Bountiful Tables with sides of Cranberry Chutney and Spice Bread Stuffing and... ooo... I\'m getting hungry. But anyhow! He\'s all alone, now, so I was hoping you might be willing to take care of him. There simply isn\'t enough room left in my shop!\n\nJust keep him away from cooking fires, please. He gets this strange look in his eyes around them...'),
(4078,2,170,170,0,0,NULL,NULL),
(4080,2,171,171,0,0,NULL,NULL),
(2536,2,0,0,44843,32216,'Mountain o\' Mounts','I\'ve heard your stables are nearly as extensive as mine, now. Impressive! Perhaps we can help one another... I\'ve one too many dragonhawks, and hoped you could give this one a home. Naturally its been trained as a mount and not a hunting pet, and you\'ll find it as loyal and tireless as any other steed I raise.\n\nYours again,\n\nMei'),
(2537,2,0,0,44842,32216,'Mountain o\' Mounts','I\'ve heard your stables are nearly as extensive as mine, now. Impressive! Perhaps we can help one another... I\'ve one too many dragonhawks, and hoped you could give this one a home. Naturally its been trained as a mount and not a hunting pet, and you\'ll find it as loyal and tireless as any other steed I raise.\n\nYours again,\n\nMei'),
(2516,2,0,0,44841,28951,'A Friend of Fawn Over','Hello!\n\nI understand you\'ve managed to give even that mischievous Stinker a warm and loving home... I was hoping you might consider taking in another wayward orphan?\n\n This little fawn is a shy one. But you\'ll have no trouble winning her friendship with the enclosed: her favorite salt lick!\n\n--Breanni'),
(2144,2,0,0,44177,26917,'Time and Time Again','With the drums of war pounding in the distance, it is easy for the denizens of Azeroth to forget all that life has to offer.\n\nYou, on the other hand, have maintained the dignity of the good races of Azeroth with your ability to remember what we fight for. To not celebrate our victories is another form of defeat. Remember that well, reveler.\n\nMay others be inspired by your good cheer.\n\nAlexstrasza the Life-Binder'),
(2145,2,0,0,44177,26917,'Time and Time Again','With the drums of war pounding in the distance, it is easy for the denizens of Azeroth to forget all that life has to offer.\n\nYou, on the other hand, have maintained the dignity of the good races of Azeroth with your ability to remember what we fight for. To not celebrate our victories is another form of defeat. Remember that well, reveler.\n\nMay others be inspired by your good cheer.\n\nAlexstrasza the Life-Binder'),
(4584,2,173,173,0,0,NULL,NULL),
(4530,2,175,175,0,0,NULL,NULL),
(4597,2,175,175,0,0,NULL,NULL),
(4598,2,176,176,0,0,NULL,NULL),
(4477,2,172,172,0,0,NULL,NULL),
(2957,2,0,0,45802,33235,'Glory of the Ulduar Raider','Dear $N,\n\nI hope ye\'re doing well and that ye\'ve had time to recover from our shennanigans in Ulduar. \n\nMe lads from the prospecting team happend upon this poor \'alf dead riding-drake hatchling. Must\'ve been on iron dwarf experiment of some sort.\n\nWe\'ve patched him back to health and you\'ll find he\'s not so wee anymore! None of us knows much about riding anything but rams and pack mules and since we owed ye one for what ye did bakc there... we thought perhaps you\'d accept him as a gift.\n\nYours,\nBrann Bronzebeard'),
(2958,2,0,0,45801,33235,'Glory of the Ulduar Raider','Dear $N,\n\nI hope ye\'re doing well and that ye\'ve had time to recover from our shennanigans in Ulduar. \n\nMe lads from the prospecting team happend upon this poor \'alf dead riding-drake hatchling. Must\'ve been on iron dwarf experiment of some sort.\n\nWe\'ve patched him back to health and you\'ll find he\'s not so wee anymore! None of us knows much about riding anything but rams and pack mules and since we owed ye one for what ye did bakc there... we thought perhaps you\'d accept him as a gift.\n\nYours,\nBrann Bronzebeard'),
(4602,2,0,0,51954,37120,'Glory of the Icecrown Raider','$N,\n\nAs the Lich King\'s influence wanes, some of his more powerful, minions have wrested free of his grasp.\n\nThis frost wyrm drake my men captured is a prime example. She has a will of her own and then some.\n\nOne of my men lost an arm breaking her in, but she how takes to riders fairly well -- provided they themselves are skilled and strong willed.\n\nPlease accept this magnificent beast as a gift from the knights of the Ebon Blade. It was a honor to fight along your side in this greatest of battles.\n\nWith honor,\nDarion Mograine'),
(4583,2,174,174,0,0,NULL,NULL),
(1793,1,137,137,0,0,NULL,NULL),
(13,2,0,0,41426,16128,'Level 80','Congratulations on your conviction to reach the 80th season of adventure. You are undoubtedly dedicated to the cause of ridding Azeroth of the evils which have plagued us.$B$BAnd while the journey thus far has been no minor feat, the true battle lies ahead.$B$BFight on!$B$BRhonin'),
(4785,2,0,0,0,37941,'Emblem Quartermasters in Dalaran\'s Sunreaver Sanctuary','Your achievements in Northrend have not gone unnoticed, friend.\n\nThe Emblems you have earned may be used to\n\npurchase equipment from the various Emblem Quartermasters in Dalaran.\n\nYou may find us there, in the Sunreaver Sanctuary, where each variety of Emblem has its own quartermaster.\n\nWe look forward to your arrival!'),
(4784,2,0,0,0,37942,'Emblem Quartermasters in Dalaran\'s Silver Enclave','Your achievements in Northrend have not gone unnoticed, friend.\n\nThe Emblems you have earned may be used to purchase equipment from the various Emblem Quartermasters in Dalaran.\n\nYou may find us there, in the Silver Enclave, where each variety of Emblem has its own quartermaster.\n\nWe look forward to your arrival!'),
(876,2,0,0,43349,29533,'Brutally Dedicated','I\'ve been watching you, kid.\n\nYou\'ve got quite a knack for throwing down in that arena. Keep this. Wear it with pride. Now get back in there and show them how it\'s done!\n\nUncle Sal'),
(3957,2,0,0,49054,34922,'Master of Isle of Conquest','Honorable $N,\n\nFor your deeds upon the Isle of Conquest,\n\nit is my honor to present you with this\n\ntabard. Wear it proudly.\n\nOverlord Agmar'),
(3857,2,0,0,49052,34924,'Master of Isle of Conquest','Honorable $N,\n\nFor your deeds upon the Isle of Conquest,\n\nit is my honor to present you with this\n\ntabard. Wear it proudly.\n\nHigh Commander Halford Wyrmbane'),
(4478,2,0,0,49912,32842,'P.U.G.','Dear very patient individual,\n\nWe\'d like to recognize your tenacity in running dungeons with people you probably haven\'t met before. Hopefully you even showed some rookies the ropes in your pick-up groups.\n\nIn short, we heard you like pugs. So here\'s a pug for your pug, so you can pug while you pug. Or something.\n\nHugs,\n\nYour friends on the WoW Dev Team.'),
(4603,2,0,0,51955,37120,'Heroic: Glory of the Icecrown Raider','$N,\n\nAs the Lich King\'s influence wanes, some of his more powerful, minions have wrested free of his grasp.\n\nThis frost wyrm drake my men captured is a prime example. She has a will of her own and then some.\n\nOne of my men lost an arm breaking her in, but she how takes to riders fairly well -- provided they themselves are skilled and strong willed.\n\nPlease accept this magnificent beast as a gift from the knights of the Ebon Blade. It was a honor to fight along your side in this greatest of battles.\n\nWith honor,\nDarion Mograine'),
(4079,2,0,0,49098,36095,'A Tribute to Immortality','Dear $N.\n\nTales of your recent performance in the Trial of the Grand Crusader will be told, and retold, for ages to come. As the Argent Crusade issued its call for the greatest champions of Azeroth to test their mettle in the crucible of the Coliseum. I hoped against hope that beacons of light such as you and your companions might emerge from the fray.\n\nWe will need your direly in the coming battle against the Lich King. But on this day, rejoice and celebrate your glorious accomplishment, and accept this gift of one of our very finest warhorses. When the Scourge see its banner looming on thee horizon. Hero, their end shall be nigh!\n\nYours with Honor.\nTirion Fordring'),
(4156,2,0,0,49096,36095,'A Tribute to Immortality','Dear $N.\n\nTales of your recent performance in the Trial of the Grand Crusader will be told, and retold, for ages to come. As the Argent Crusade issued its call for the greatest champions of Azeroth to test their mettle in the crucible of the Coliseum. I hoped against hope that beacons of light such as you and your companions might emerge from the fray.\n\nWe will need your direly in the coming battle against the Lich King. But on this day, rejoice and celebrate your glorious accomplishment, and accept this gift of one of our very finest warhorses. When the Scourge see its banner looming on thee horizon. Hero, their end shall be nigh!\n\nYours with Honor.\nTirion Fordring');
/*!40000 ALTER TABLE `achievement_reward` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-12-13  0:32:55
