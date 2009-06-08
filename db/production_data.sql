-- MySQL dump 10.11
--
-- Host: localhost    Database: mobiledic
-- ------------------------------------------------------
-- Server version	5.0.67-0ubuntu6

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
-- Table structure for table `open_id_authentication_associations`
--

DROP TABLE IF EXISTS `open_id_authentication_associations`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `open_id_authentication_associations` (
  `id` int(11) NOT NULL auto_increment,
  `issued` int(11) default NULL,
  `lifetime` int(11) default NULL,
  `handle` varchar(255) default NULL,
  `assoc_type` varchar(255) default NULL,
  `server_url` blob,
  `secret` blob,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `open_id_authentication_associations`
--

LOCK TABLES `open_id_authentication_associations` WRITE;
/*!40000 ALTER TABLE `open_id_authentication_associations` DISABLE KEYS */;
/*!40000 ALTER TABLE `open_id_authentication_associations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `open_id_authentication_nonces`
--

DROP TABLE IF EXISTS `open_id_authentication_nonces`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `open_id_authentication_nonces` (
  `id` int(11) NOT NULL auto_increment,
  `timestamp` int(11) NOT NULL,
  `server_url` varchar(255) default NULL,
  `salt` varchar(255) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `open_id_authentication_nonces`
--

LOCK TABLES `open_id_authentication_nonces` WRITE;
/*!40000 ALTER TABLE `open_id_authentication_nonces` DISABLE KEYS */;
/*!40000 ALTER TABLE `open_id_authentication_nonces` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `passwords`
--

DROP TABLE IF EXISTS `passwords`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `passwords` (
  `id` int(11) NOT NULL auto_increment,
  `user_id` int(11) default NULL,
  `reset_code` varchar(255) default NULL,
  `expiration_date` datetime default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `passwords`
--

LOCK TABLES `passwords` WRITE;
/*!40000 ALTER TABLE `passwords` DISABLE KEYS */;
/*!40000 ALTER TABLE `passwords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quiz_types`
--

DROP TABLE IF EXISTS `quiz_types`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `quiz_types` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `quiz_types`
--

LOCK TABLES `quiz_types` WRITE;
/*!40000 ALTER TABLE `quiz_types` DISABLE KEYS */;
INSERT INTO `quiz_types` VALUES (1,'Англи-Монгол','2009-06-08 03:18:29','2009-06-08 03:19:08'),(2,'Монгол-Англи','2009-06-08 03:19:17','2009-06-08 03:19:17'),(3,'Өгүүлбэр бөглөх','2009-06-08 03:19:25','2009-06-08 03:19:25');
/*!40000 ALTER TABLE `quiz_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quizzes`
--

DROP TABLE IF EXISTS `quizzes`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `quizzes` (
  `id` int(11) NOT NULL auto_increment,
  `word_id` int(11) default NULL,
  `quiz_type_id` int(11) default NULL,
  `question` text,
  `options` text,
  `correct` varchar(255) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `quizzes`
--

LOCK TABLES `quizzes` WRITE;
/*!40000 ALTER TABLE `quizzes` DISABLE KEYS */;
INSERT INTO `quizzes` VALUES (1,2,3,'A/an ____ person is someone who has a variety of skills and abilities and who is able to change easily from one sort of activity to another.','a convivial;a magnanimous;a greedy;a gullible;a chauvinistic;an illiterate;a bilingual;an indeatigable;an erudite;a scintillating;a vivacious','a versatile','2009-06-08 01:11:04','2009-06-08 01:11:15'),(2,3,3,'A/an ____ person is someone who is very friendly and fond of eating, drinking and good company.','a versatile;a magnanimous;a greedy;a gullible;a chauvinistic;an illiterate;a bilingual;an indeatigable;an erudite;a scintillating;a vivacious','a convivial','2009-06-08 01:13:16','2009-06-08 01:13:41'),(3,45,3,'The woman in charge of the hospital is called the ___. She has control over all the nurses. (But not the doctors!)','prescription;Maternity Ward;scald;infectious;contagious;hay fever;midwife;mumps;indigestion;antiseptic;measles;insomnia;constipated;crutches;X-ray;surgeon;sedative;general anaesthetis','matron','2009-06-08 02:22:16','2009-06-08 02:22:22'),(4,44,3,'Before you have an operation, you are usually given a ___ to make you unconscious so that you will not feel any pain during it.','prescription;Maternity Ward;scald;infectious;contagious;hay fever;midwife;mumps;indigestion;antiseptic;measles;insomnia;constipated;crutches;X-ray;surgeon;sedative;matron','general anaesthetic','2009-06-08 02:26:52','2009-06-08 02:26:56'),(5,4,3,'A/an ____ person is someone who is very generous towards other people.','a versatile;a convivial;a greedy;a gullible;a chauvinistic;an illiterate;a bilingual;an indeatigable;an erudite;a scintillating;a vivacious','a magnanimous','2009-06-08 02:27:35','2009-06-08 02:27:56'),(6,5,3,'A/an ____ person is someone who always wants more than his or her fair share of something-especially food, money or power.','a versatile;a convivial;a magnanimous;a gullible;a chauvinistic;an illiterate;a bilingual;an indeatigable;an erudite;a scintillating;a vivacious','a greedy','2009-06-08 02:28:38','2009-06-08 02:28:42'),(7,6,3,'A/an ____ person is someone who is easily taken in or tricked by others.','a versatile;a convivial;a magnanimous;a greedy;a chauvinistic;an illiterate;a bilingual;an indeatigable;an erudite;a scintillating;a vivacious','a gullible','2009-06-08 02:29:08','2009-06-08 03:25:36'),(8,7,3,'A/an ____ person is someone who believes that the sex he or she belongs to (male or female) is better than the oppposite sex in all ways.','a versatile;a convivial;a magnanimous;a greedy;a gullible;an illiterate;a bilingual;an indeatigable;an erudite;a scintillating;a vivacious','a chauvinistic','2009-06-08 02:29:29','2009-06-08 03:25:36'),(9,8,3,'He had changed so much since I last saw him that I hardly ___ him.','gazed;caught a glimpse of;distinguish;look at;glanced;peeped;glared;scrutinised;staring;eyed;peered;noticing;watch;catch his eye;observing','recognised','2009-06-08 02:29:56','2009-06-08 03:25:36'),(10,9,3,'The young girl ___ lovingly at the photograph of her boyfriend.','recognised;caught a glimpse of;distinguish;look at;glanced;peeped;glared;scrutinised;staring;eyed;peered;noticing;watch;catch his eye;observing','gazed','2009-06-08 02:30:17','2009-06-08 03:25:36');
/*!40000 ALTER TABLE `quizzes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `roles` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'admin');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles_users`
--

DROP TABLE IF EXISTS `roles_users`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `roles_users` (
  `role_id` int(11) default NULL,
  `user_id` int(11) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `roles_users`
--

LOCK TABLES `roles_users` WRITE;
/*!40000 ALTER TABLE `roles_users` DISABLE KEYS */;
INSERT INTO `roles_users` VALUES (1,1);
/*!40000 ALTER TABLE `roles_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20080929171348'),('20090607132818'),('20090607140616'),('20090607140817');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `sessions` (
  `id` int(11) NOT NULL auto_increment,
  `session_id` varchar(255) NOT NULL,
  `data` text,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`),
  KEY `index_sessions_on_session_id` (`session_id`),
  KEY `index_sessions_on_updated_at` (`updated_at`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES (2,'7a27ee661ab4a1aa7e70c3553c8c3f1b','BAh7CDoMdXNlcl9pZGkGIgpmbGFzaElDOidBY3Rpb25Db250cm9sbGVyOjpG\nbGFzaDo6Rmxhc2hIYXNoewAGOgpAdXNlZHsAOg5yZXR1cm5fdG8w\n','2009-06-07 14:51:37','2009-06-07 14:52:05'),(3,'9cfcbc4873df782db41ff9801ddfc098','BAh7CDoMdXNlcl9pZGkGIgpmbGFzaElDOidBY3Rpb25Db250cm9sbGVyOjpG\nbGFzaDo6Rmxhc2hIYXNoewAGOgpAdXNlZHsAOg5yZXR1cm5fdG8w\n','2009-06-07 14:52:39','2009-06-07 14:55:01'),(4,'cf2b76a9b30b0eceea9e4a5c0d0f4897','BAh7CDoMdXNlcl9pZGkGIgpmbGFzaElDOidBY3Rpb25Db250cm9sbGVyOjpG\nbGFzaDo6Rmxhc2hIYXNoewAGOgpAdXNlZHsAOg5yZXR1cm5fdG8w\n','2009-06-07 15:04:10','2009-06-07 15:39:04'),(5,'5be21d20c3ae0981a5107c1fc3899220','BAh7CDoMdXNlcl9pZGkGIgpmbGFzaElDOidBY3Rpb25Db250cm9sbGVyOjpG\nbGFzaDo6Rmxhc2hIYXNoewAGOgpAdXNlZHsAOg5yZXR1cm5fdG8w\n','2009-06-07 15:47:05','2009-06-07 15:47:11'),(6,'f1eeb627d52c3bbb5687e26d3d023319','BAh7ByIKZmxhc2hJQzonQWN0aW9uQ29udHJvbGxlcjo6Rmxhc2g6OkZsYXNo\nSGFzaHsABjoKQHVzZWR7ADoOcmV0dXJuX3RvIg0vcXVpenplcw==\n','2009-06-07 23:46:01','2009-06-07 23:46:01'),(7,'a8cc07f9ae576d7bf6618ed64df8d520','BAh7CDoMdXNlcl9pZGkGIgpmbGFzaElDOidBY3Rpb25Db250cm9sbGVyOjpG\nbGFzaDo6Rmxhc2hIYXNoewAGOgpAdXNlZHsAOg5yZXR1cm5fdG8w\n','2009-06-08 01:07:04','2009-06-08 03:26:01'),(8,'dc9026b0c0403028f56a22b4976f480a','BAh7CDoMdXNlcl9pZGkGIgpmbGFzaElDOidBY3Rpb25Db250cm9sbGVyOjpG\nbGFzaDo6Rmxhc2hIYXNoewAGOgpAdXNlZHsAOg5yZXR1cm5fdG8w\n','2009-06-08 02:45:38','2009-06-08 03:19:26');
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `users` (
  `id` int(11) NOT NULL auto_increment,
  `login` varchar(40) default NULL,
  `identity_url` varchar(255) default NULL,
  `name` varchar(100) default '',
  `email` varchar(100) default NULL,
  `crypted_password` varchar(40) default NULL,
  `salt` varchar(40) default NULL,
  `remember_token` varchar(40) default NULL,
  `activation_code` varchar(40) default NULL,
  `state` varchar(255) NOT NULL default 'passive',
  `remember_token_expires_at` datetime default NULL,
  `activated_at` datetime default NULL,
  `deleted_at` datetime default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `index_users_on_login` (`login`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin',NULL,'','ochkoo@gmail.com','ecdef0e0202f502ce815a3696889877f74a51280','2a3edb738e0d78e33e30660f50cf44825ed03fbe',NULL,NULL,'active',NULL,'2009-06-07 13:56:58',NULL,'2009-06-07 13:56:56','2009-06-07 13:56:58');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `words`
--

DROP TABLE IF EXISTS `words`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `words` (
  `id` int(11) NOT NULL auto_increment,
  `word` varchar(255) default NULL,
  `clause` varchar(255) default NULL,
  `pronunciation` varchar(255) default NULL,
  `english_definition` varchar(255) default NULL,
  `mongolian_definition` varchar(255) default NULL,
  `english_sentence` text,
  `mongolian_sentence` text,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `words`
--

LOCK TABLES `words` WRITE;
/*!40000 ALTER TABLE `words` DISABLE KEYS */;
INSERT INTO `words` VALUES (1,'an only','adj','[ohn-lee]','single person, with no brothers or sisters ','ганц, цорын ганц, айлын ганц хүүхэд','I have no siblings. I\'m an only son. ','Надад ах, эгч, дүү байхгүй. Би айлын ганц хүү.','2009-06-07 15:19:42','2009-06-07 15:19:42'),(2,'a versatile','adj','ˈvɜrsətl','capable of or adapted for turning easily from one to another of various tasks','хєдєлгєєнтэй, тогтворгїй, хувирамтгай','We have a versatile manager who knows both finance and administration well.','Бид санхүү болон удирдлагын талаархи сайн мэдлэгтэй чадварлаг зохицуулагчтай.','2009-06-08 01:10:22','2009-06-08 01:10:22'),(3,'a convivial','adj','kənˈvɪviəl','friendly; agreeable','найзархуу, нийцэрхүү','I am a convivial person with high hopes and regard for the future.','Би бол ирээдүйгээ сайхнаар төсөөлж өндөр найдвар өвөрлөж буй нийцэрхүү хүн.','2009-06-08 01:12:35','2009-06-08 01:12:35'),(4,'a magnanimous','adj','mægˈnænəməs','generous in forgiving an insult or injury','сайхан сэтгэлтэй, уужим санаатай','I hope you will be magnanimous enough to excuse any incorrect behaviour on my part.','Таныг миний зүгээс гарах ямар нэг буруу үйлдлийг минь уучлах уужим сэтгэлтэй гэдэгт найдаж байна','2009-06-08 01:19:51','2009-06-08 01:19:51'),(5,'a greedy','adj','ˈgridi','keenly desirous; eager','шунахай, ховдог','No matter who you are, as long as you have a flash of greedy thoughts, it will be hard to fulfill your desire.','Та хэн ч байсан гэсэн та жаахан ч гэсэн шунаг сэтгэл тээвээс сэтгэл хангалуун байж чадахгүй.','2009-06-08 01:20:36','2009-06-08 01:20:36'),(6,'a gullible','adj','ˈgʌləbəl','easily deceived or cheated','итгэмтгий, хууртамхай ','I am definitely a gullible person.','Би яах аргагүй итгэмтгий хүн.','2009-06-08 01:21:15','2009-06-08 01:21:15'),(7,'a chauvinistic','adj','ˈʃoʊvəˌnɪzəm','biased devotion to any group','дээрэнгүй үзэл','chauvinist - a person with a prejudiced belief in the superiority of his or her own kind','Дээрэнгүй үзэлтэн – өөрийгөө бусдаас илүүд үзэх бодолдоо бүрэн итгэсэн хүн.','2009-06-08 01:21:53','2009-06-08 01:21:53'),(8,'recognize','v','ˈrɛkəgˌnaɪz','identify a person or a thing seen before','мэдэх, таних, хүлээн зєвшєєрєх','There are three red buildings in that neighborhood, you can recognize it easily.','Тэр хавьд гурван улаан байшин байгаа, та амархан таних болно.','2009-06-08 01:24:03','2009-06-08 01:24:03'),(9,'gaze','v','geɪz','look at for a long time, stare, watch, observe','ширтэх, цоо ширтэх, шохоорхон харах','Everyone\'s gaze was focused on the teacher.','Бүгд багшийг ширтсэн байлаа.','2009-06-08 01:24:41','2009-06-08 01:24:41'),(10,'distinguish','v','dɪˈstɪŋgwɪʃ','mark as different; see as different; differentiate; recognize','ялгах, онцлох, ялгагдах, таних, олж харах','Can you distinguish between the Carlson\'s twins? They are so similar it\'s often difficult to distinguishone from the other. ','Та Карлсонгийн ихрүүдийг хооронд ялгаж чадах уу? Тэд хоорондоо маш адил учир ихэвчлэн нэгийг нь нөгөөгөөс нь ялгах хэцүү байдаг.','2009-06-08 01:25:30','2009-06-08 01:25:30'),(11,'glance','v','glæns','look quickly; shine, gleam; bounce off, strike at an angle','хальт харах, хурдхан харах, хальт анзаарах ','I\'m just going to glance over these documents, then we can go.','Би эдгээр бичиг баримтыг худрхан хараад тэгээд бид явж болно.','2009-06-08 01:26:18','2009-06-08 01:26:18'),(12,'scrutinize','v','ˈskrutnˌaɪz','examine, investigate, check closely, inspect','нягтлан харах, сайтар судлах','He scrutinized his likeness in the mirror.','Тэрээр өөрийн адил эсэхийг толинд нягтлан харав.','2009-06-08 01:27:29','2009-06-08 01:27:29'),(13,'peer','v','pɪər','look, glance;  person of equal rank; friend','нэвт шувт харах, шагайх; тэгш эрхтэй, нэг үеийн хүн','We peered into the back of the shop to see whether a salesman was around.','Бид худалдагч ойр байгаа эсэхийг нягтлан дэлгүүрийн арыг шагайж харав.','2009-06-08 01:28:37','2009-06-08 01:28:37'),(14,'catch his eye','v','kætʃ hɪz aɪ','captured a glance his, caused him to look','нүдэнд нь өртөх, анзаарагдах','The girl, standing over there, tried to catch his eye.','Тэрүүхэнд зогсож байсан  охин түүний нүдэнд өртөхийг оролдлоо.','2009-06-08 01:30:14','2009-06-08 01:30:14'),(15,'observe','v','əbˈzɜrv','o see, watch, perceive, or notice','ажиглах, судлах, мєрдєх, дагах, хэлэх','The students gathered in the operating theater to observe a surgery demonstration.','Оюутнууд мэс засал хийхийг ажиглахын тулд хагалгааны театрт цугларав.','2009-06-08 01:31:05','2009-06-08 01:31:05'),(16,'stride','v','straɪd','walk with long easy steps; go over in one long step','том том алхах, хол алхан гүйх','We stride into the new year with pride and confidence.','Бид бардам итгэлтэйгээр шинэ ондоо том алхан орлоо.','2009-06-08 01:31:54','2009-06-08 01:31:54'),(17,'march','v','mɑrtʃ','long journey by foot; coordinated steps of soldiers','алхаа, марш, аян, жагсаал','The British army is ready to march on the city.','Британы арми хотоор жагсан алхахад бэлэн боллоо.','2009-06-08 01:32:35','2009-06-08 01:32:35'),(18,'plod','v','plɒd','walk laboriously, walk heavily','гэлдрэх, арай гэж сажлах ','Mules plodded in a circle around a grindstone','Шарууд цайруулагчийг тойрон гэлдэрч байлаа.','2009-06-08 01:33:26','2009-06-08 01:33:26'),(19,'stumble','v','ˈstʌmbəl','to strike the foot against something, as in walking or running, so as to stagger or fall','бүдрэх, түгдрэх, алдах, тєєрєлдєх','If you stumble in a dream while walking or running, you will meet with disfavor, and obstructions will bar your path to success.','Хэрвээ та зүүдэндээ алхаж байгаад эсвэл гүйж байгаад бүдэрвэл, та ямар нэг хилэгнэлтэй учирч элдэв барцад амжилтад хүрэх замыг тань халхлах болно. ','2009-06-08 01:34:54','2009-06-08 01:34:54'),(20,'scamper','v','ˈskæmpər','run quickly and playfully, scurry, scuttle','хурдан гүйх, айж гүйх, зугтах','So terrified by the extraordinary ebbing of the sea that they scampered to higher ground.','Хүчтэй далайн таталтаас айсандаа тэд өндөрлөг газар руу гүйцгээлээ.','2009-06-08 01:42:38','2009-06-08 01:42:38'),(21,'loiter','v','ˈlɔɪtər','idle about; lag behind; waste time','сэлгүүцэх, гиюүрэх, сунжрах','The high school students like to loiter in the Central Square.','Ахлах сургуулийн сурагчид төв талбайд сэлгүүцэх дуртай байдаг.','2009-06-08 01:43:22','2009-06-08 01:43:22'),(22,'stagger','v','ˈstægər','to walk, move, or stand unsteadily','гуйван дайван явах, ганхах, зєрүүлэх','We can\'t hold the two meetings at the same time. We must stagger them.','Бид нэгэн зэрэг хоёр уулзалт явуулж чадахгүй. Бид тэдгээрийг зөрүүлэх хэрэгтэй.','2009-06-08 01:44:11','2009-06-08 01:44:11'),(23,'skip','v','skɪp','move forward in a series of light jumps; pass over; leave out, omit','дэвхрэх, цовхрох, харайх, орхих, алгасах','He gave a skip of joy as he heard the news.','Тэрээр мэдээ дуулаад баярлан дэвхцэв.','2009-06-08 01:44:51','2009-06-08 01:44:51'),(24,'tramp','v','træmp',' walk noisily, travel by foot','хүндээр алхлан явах, явган аялал хийх, тэнүүчлэх','You should excuse if you tramped on someone\'s foot.','Хүний хөл дээр гишгэсэн бол уучлал гуйж байх хэрэгтэй.','2009-06-08 01:45:26','2009-06-08 01:45:26'),(25,'stroll','v','stroʊl','walk in a leisurely way, take a walk','зугаалах, салхилах','Grandpa gets up at five o\'clock and takes a morning stroll every day.','Өвөө өдөр болгон өглөө таван цагт босож салхилдаг.','2009-06-08 01:46:04','2009-06-08 01:46:04'),(26,'limp','v','lɪmp','walk with difficulty because of an injured leg or foot, proceed with difficulty','доголох, хазганах, үлбэгэр байх','Because of the fever, my arms and legs were completely limp.','Халуурснаас болж миний гар хөл үлбийсэн байсан.','2009-06-08 01:46:38','2009-06-08 01:46:38'),(27,'creep','v','krip','crawl; climb; sneak, move along quietly and slowly','мєлхєх, гэтэх, мярайх','How old was the baby when he started creeping?','Хүүхэд хэдэн сартайдаа мөлхөж эхэлсэн бэ?','2009-06-08 01:47:13','2009-06-08 01:47:13'),(28,'prescription','n','prɪˈskrɪpʃən','written order for a medication; instruction','жор, найрлага, заавар, зєвлєлгєє','This drug is available only on prescription.','Энэ эмийг зөвхөн жорын дагуу олгоно.','2009-06-08 01:47:51','2009-06-08 01:47:51'),(29,'Maternity Ward','n','məˈtɜrnɪti wɔrd','hospital ward for women who are currently delivering babies or have recently given birth','төрөх тасаг','Some hospital websites now offer virtual tours of the maternity ward, which might be more convenient for you.','Зарим эмнэлгийн вэб төрөх тасгийн виртуал үйлчилгээ санал болгож байгаа нь танд илүү таатай байх болов уу.','2009-06-08 01:50:30','2009-06-08 01:50:30'),(30,'scald','v','skɔld','burn with hot liquid or steam',' шалзлах, түлэх, түлэгдэх','Don\'t scald your hands when you open the steamer. ','Уураар болгогчийг онгойлгохдоо гараа түлэхээс болгоомжил.','2009-06-08 01:51:00','2009-06-08 01:51:00'),(31,'infectious','adj','ɪnˈfɛkʃəs','causing infection; can be passed from one person to another',' халдвартай, халдаасан','The infectious disease became unstoppable.','Халдварт өвчин зогсоох аргагүй болжээ.','2009-06-08 01:51:34','2009-06-08 01:51:34'),(32,'hay fever','n','heɪ ˈfivər','allergy to some kinds of pollen that appear in the springtime','ургамлын, цэцгийн тоосны аллерги','Hay fever is the most common of all the allergic diseases.','Аллергины төрлийн өвчнөөс хамгийн элбэг тохиолддог нь ургамал, цэцгийн аллерги.','2009-06-08 01:52:34','2009-06-08 01:52:34'),(33,'midwife','n','ˈmɪdˌwaɪf','one who assists women in childbirth','эх баригч','With the help of the midwife, the baby was born successfully.','Эх баригчийн тусламжтай хүүхэд амжилттай төрөв.','2009-06-08 01:53:14','2009-06-08 01:53:14'),(34,'mumps','n','mʌmps','contagious virus characterized by swollen salivary glands','гахайн хавдар (євчин)','Mumps is an acute contagious viral infection.','Гахайн хавдар бол нэлээн ноцтой, вирусээр үүсгэгдсэн халдварт өвчин юм.','2009-06-08 01:53:45','2009-06-08 01:53:45'),(35,'indigestion','n','ˌɪndɪˈdʒɛstʃən','uncomfortable inability or difficulty in digesting food','ходоодны хямрал, хоолны шингэц муудах','An excess amount of hydrochloric acid in the stomach can cause indigestion.','Ходоодон дахь гидрохлорын хүчлийн илүүдэл нь ходоодны хямралд хүргэж болзошгүй.','2009-06-08 01:54:24','2009-06-08 01:54:24'),(36,'antiseptic','n','ˌæntəˈsɛptɪk','agent that cleans germs and other microorganism','ариутгагч бодис','New comers are all processed through antiseptic treatment.','Шинээр ирэгсэд бүгд ариутгагчаар ариутгагдсан.','2009-06-08 01:55:01','2009-06-08 01:55:01'),(37,'measles','n','ˈmizəlz','an acute infectious disease occurring mostly in children, characterized by catarrhal and febrile symptoms and an eruption of small red spots','улаан бурхан','There were three children down with the measles and he had a whitlow on her thumb.','Тэнд улаан бурхантай гурван хүүхэд байсан ба  тэр хүү эрхий хуруу нь ганц хуруутсан байсан.','2009-06-08 01:57:03','2009-06-08 01:57:03'),(38,'insomnia','n','ɪnˈsɒmniə','inability to get enough sleep, sleeplessness','нойргүйдэл, шєнє нойр хүрэхгүй байх','If I drink too much coffee, I will have insomnia.','Кофе их уувал шөнө миний нойр хүрэхээ байдаг.','2009-06-08 01:57:57','2009-06-08 01:57:57'),(39,'constipate','v','ˈkɒnstəˌpeɪt','to cause constipation in; to cause to become slow-moving or immobilized','өтгөн хатах, түгжрэх','Some people are very constipated and experience a lot of intestinal discomforts.','Зарим хүн байнга өтгөн нь хатаж/түгжирч гэдэс нь тавгүй явдаг.','2009-06-08 02:01:30','2009-06-08 02:01:30'),(40,'crutch','n','krʌtʃ','staff used to help a lame person walk; support','суга таяг','Crutches are medical devices that help people get around when they are unable to walk due to illness or injury.','Суга таяг бол өвчин, гэмтлээс болж алхаж чадахгүй байгаа хүмүүст ойр тойрондоо явахад нь тусалдаг хэрэгсэл юм.','2009-06-08 02:03:34','2009-06-08 02:03:34'),(41,'X-ray','n','ˈɛksˌreɪ','a type of ray used in medical imaging to diagnose diseases','рентген туяа','His chest X-ray shows that he doesn\'t have stomach cancer.','Цээжний рентген зургаас харахад тэр ходоодны хорт хавдаргүй байна.','2009-06-08 02:06:37','2009-06-08 02:06:37'),(42,'surgeon','n','ˈsɜrdʒən','a physician who specializes in surgery','мэс засалч,  цэргийн эмч ','As a surgeon, I cannot afford any mistakes, it would be dangerous for the patient. ','Мэс засалчийн хувьд, өвчтөнүүдийн амь настай холбоотой учир, надад алдаа хийх эрх байхгүй.','2009-06-08 02:08:14','2009-06-08 02:08:14'),(43,'sedative','n','ˈsɛdətɪv','drug which causes calmness and relaxation','тайвшруулах, євчин намдаах эм','His over-excited emotions gradually calmed down after taking the sedative.','Тайвшруулах эм уусны дараа түүний хэт хөөрсөн байдал аяндаа багач, нам тайван боллоо.','2009-06-08 02:10:27','2009-06-08 02:10:27'),(44,'general anaesthetic','n','ˈdʒɛnərəl ˌænəsˈθiʒə','an anesthetic that anesthetizes the entire body and causes loss of consciousness','мэдээ алдуулагч бодис','An anaesthetic is a drug or agent that produces a complete or partial loss of feeling.','Мэдээ алдуулагч бол бүх биеийн  болон хэсэгчилсэн мэдээ алдуулдаг эм юм.','2009-06-08 02:11:41','2009-06-08 02:11:41'),(45,'matron','n','ˈmeɪtrən','a woman serving as a guard, warden, or attendant for women or girls','нөхөртэй эмэгтэй, ахлах сувилагч, аж ахуйн эрхлэгч','During her time as Matron, Miss Ray  was involved with many nursing activities.','Ахлах сувилагч байх хугацаандаа хатагтай Рэй сувилахуйн олон арга хэмжээнд оролцож байсан.','2009-06-08 02:19:57','2009-06-08 02:19:57');
/*!40000 ALTER TABLE `words` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2009-06-08  4:00:14
