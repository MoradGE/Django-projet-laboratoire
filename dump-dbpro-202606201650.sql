/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19-11.7.2-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: dbpro
-- ------------------------------------------------------
-- Server version	12.3.2-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*M!100616 SET @OLD_NOTE_VERBOSITY=@@NOTE_VERBOSITY, NOTE_VERBOSITY=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES
(1,'Can add log entry',1,'add_logentry'),
(2,'Can change log entry',1,'change_logentry'),
(3,'Can delete log entry',1,'delete_logentry'),
(4,'Can view log entry',1,'view_logentry'),
(5,'Can add permission',3,'add_permission'),
(6,'Can change permission',3,'change_permission'),
(7,'Can delete permission',3,'delete_permission'),
(8,'Can view permission',3,'view_permission'),
(9,'Can add group',2,'add_group'),
(10,'Can change group',2,'change_group'),
(11,'Can delete group',2,'delete_group'),
(12,'Can view group',2,'view_group'),
(13,'Can add user',4,'add_user'),
(14,'Can change user',4,'change_user'),
(15,'Can delete user',4,'delete_user'),
(16,'Can view user',4,'view_user'),
(17,'Can add content type',5,'add_contenttype'),
(18,'Can change content type',5,'change_contenttype'),
(19,'Can delete content type',5,'delete_contenttype'),
(20,'Can view content type',5,'view_contenttype'),
(21,'Can add session',6,'add_session'),
(22,'Can change session',6,'change_session'),
(23,'Can delete session',6,'delete_session'),
(24,'Can view session',6,'view_session'),
(25,'Can add record',7,'add_record'),
(26,'Can change record',7,'change_record'),
(27,'Can delete record',7,'delete_record'),
(28,'Can view record',7,'view_record'),
(29,'Can add projet recherche',9,'add_projetrecherche'),
(30,'Can change projet recherche',9,'change_projetrecherche'),
(31,'Can delete projet recherche',9,'delete_projetrecherche'),
(32,'Can view projet recherche',9,'view_projetrecherche'),
(33,'Can add chercheur',8,'add_chercheur'),
(34,'Can change chercheur',8,'change_chercheur'),
(35,'Can delete chercheur',8,'delete_chercheur'),
(36,'Can view chercheur',8,'view_chercheur'),
(37,'Can add Responsable',12,'add_responsable'),
(38,'Can change Responsable',12,'change_responsable'),
(39,'Can delete Responsable',12,'delete_responsable'),
(40,'Can view Responsable',12,'view_responsable'),
(41,'Can add Membre',11,'add_membre'),
(42,'Can change Membre',11,'change_membre'),
(43,'Can delete Membre',11,'delete_membre'),
(44,'Can view Membre',11,'view_membre'),
(45,'Can add Laboratoire',10,'add_laboratoire'),
(46,'Can change Laboratoire',10,'change_laboratoire'),
(47,'Can delete Laboratoire',10,'delete_laboratoire'),
(48,'Can view Laboratoire',10,'view_laboratoire'),
(49,'Can add equipment',13,'add_equipment'),
(50,'Can change equipment',13,'change_equipment'),
(51,'Can delete equipment',13,'delete_equipment'),
(52,'Can view equipment',13,'view_equipment'),
(53,'Can add profil',14,'add_profil'),
(54,'Can change profil',14,'change_profil'),
(55,'Can delete profil',14,'delete_profil'),
(56,'Can view profil',14,'view_profil'),
(57,'Can add client',15,'add_client'),
(58,'Can change client',15,'change_client'),
(59,'Can delete client',15,'delete_client'),
(60,'Can view client',15,'view_client'),
(61,'Can add Réservation de matériel',17,'add_reservationmateriel'),
(62,'Can change Réservation de matériel',17,'change_reservationmateriel'),
(63,'Can delete Réservation de matériel',17,'delete_reservationmateriel'),
(64,'Can view Réservation de matériel',17,'view_reservationmateriel'),
(65,'Can add Matériel de recherche',16,'add_materielrecherche'),
(66,'Can change Matériel de recherche',16,'change_materielrecherche'),
(67,'Can delete Matériel de recherche',16,'delete_materielrecherche'),
(68,'Can view Matériel de recherche',16,'view_materielrecherche'),
(69,'Can add experience',18,'add_experience'),
(70,'Can change experience',18,'change_experience'),
(71,'Can delete experience',18,'delete_experience'),
(72,'Can view experience',18,'view_experience'),
(73,'Can add publication',19,'add_publication'),
(74,'Can change publication',19,'change_publication'),
(75,'Can delete publication',19,'delete_publication'),
(76,'Can view publication',19,'view_publication'),
(77,'Can add resultat',20,'add_resultat'),
(78,'Can change resultat',20,'change_resultat'),
(79,'Can delete resultat',20,'delete_resultat'),
(80,'Can view resultat',20,'view_resultat');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES
(1,'pbkdf2_sha256$1200000$srh0duKHgVv0N5efvttqPc$QR6llT7DwIH6duks6EM3nmLUAwtZzS5WGWxhX2CBKac=','2026-06-20 15:32:37.672052',1,'mohamed','','','medouassemed@gmail.com',1,1,'2026-05-30 17:46:05.228076'),
(2,'pbkdf2_sha256$1200000$l9HuttfwEWFa5mKEc90ktE$HHbS+s9ieciNPLXiHFVZNDJl8rd9AZkco3l1EexhOtA=',NULL,0,'fzchahi','Fatima Zahra','Chahi','fzchahi@labo-nador.ma',0,1,'2026-06-20 06:06:37.567229'),
(3,'pbkdf2_sha256$1200000$udihZL7a1DNVFAJwAzEuSg$qgxJG5ua7gvUZTm50jiAwD+eh8duNwW7b1Hi8fHzTy8=',NULL,0,'helbairi','Hanae','El Bairi','helbairi@labo-nador.ma',0,1,'2026-06-20 06:06:38.023388'),
(4,'pbkdf2_sha256$1200000$eZhwg8tHhgeQol4yl45InS$8ZEotZULtTZJFdspm4m8ghAW0SrBRw8gY3th+aoLqKA=',NULL,0,'alammouti','Asmae','Lammouti','alammouti@labo-nador.ma',0,1,'2026-06-20 06:06:38.487197'),
(5,'pbkdf2_sha256$1200000$pS5ptvGIdcikxdXvGdftlX$WNmyBNiHgOWMZOBCTTKG14BkhLEwukXOSfyd8SbKdIc=',NULL,0,'ydarkik','Younes','Darkik','ydarkik@labo-nador.ma',0,1,'2026-06-20 06:06:38.940664'),
(6,'pbkdf2_sha256$1200000$aICjgmoXq9gpnzaBVLJPwz$3OvAwzPzGiylZOF/3xiu382aNx/Yi2L70vcDjO3NBFo=',NULL,0,'celbakkali','Chaimae','El Bakkali','celbakkali@labo-nador.ma',0,1,'2026-06-20 06:06:39.392352'),
(7,'pbkdf2_sha256$1200000$Tln5V7oYvLBaGO2ZwKX1Wc$LR8OkBz1DQxbOncQpGI64aXy+h+8bCil35Vr7N3lwq8=',NULL,0,'mchajjia','Mustapha','Chajjia','mchajjia@labo-nador.ma',1,1,'2026-06-20 06:06:39.867328');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_chercheur`
--

DROP TABLE IF EXISTS `core_chercheur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_chercheur` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) NOT NULL,
  `prenom` varchar(100) NOT NULL,
  `email` varchar(254) DEFAULT NULL,
  `specialite` varchar(100) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `core_chercheur_user_id_5138c5ef_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_chercheur`
--

LOCK TABLES `core_chercheur` WRITE;
/*!40000 ALTER TABLE `core_chercheur` DISABLE KEYS */;
INSERT INTO `core_chercheur` VALUES
(2,'Ouass','Mohamed','medouassemed@gmail.com','Data Scientist biomédical',NULL),
(3,'Soussan','Mohamed','Mohamed.soussan@ump.ac.ma','Bioinformatique',NULL),
(4,'Al Hammouti','Younes','','Biochimie moléculaire',NULL),
(5,'Kannouf','Nabil','','Génie Logiciel et Développement Web',NULL),
(6,'El haimeur','Aya','','Chimie analytique',NULL),
(7,'Chahi','Fatima Zahra',NULL,'Génomique et biologie cellulaire',NULL),
(8,'El Bairi','Hanae',NULL,'Microbiologie clinique',NULL),
(9,'Lammouti','Asmae',NULL,'Chimie des matériaux',NULL),
(10,'Darkik','Younes',NULL,'Physique des particules',NULL),
(11,'El Bakkali','Chaimae',NULL,'Intelligence artificielle biomédicale',NULL),
(12,'Chajjia','Mustapha',NULL,'Mathématiques appliquées',NULL);
/*!40000 ALTER TABLE `core_chercheur` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_projetrecherche`
--

DROP TABLE IF EXISTS `core_projetrecherche`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_projetrecherche` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `titre` varchar(200) NOT NULL,
  `description` longtext NOT NULL,
  `statut` varchar(20) NOT NULL,
  `date_debut` date NOT NULL,
  `date_fin` date DEFAULT NULL,
  `budget` decimal(10,2) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_projetrecherche`
--

LOCK TABLES `core_projetrecherche` WRITE;
/*!40000 ALTER TABLE `core_projetrecherche` DISABLE KEYS */;
INSERT INTO `core_projetrecherche` VALUES
(3,'Détection précoce du cancer par biomarqueurs','Détection précoce du cancer par biomarqueurs est un projet de recherche d\'avant-garde dédié au développement de méthodes de diagnostic non invasives et ultra-précises. En exploitant la puissance du profilage moléculaire et de l\'analyse avancée de données, le laboratoire s\'efforce d\'identifier des signaux biologiques subtils (tels que l\'ADN tumoral circulant ou des protéines spécifiques) dès les premiers stades de la maladie. L\'objectif ultime est de transformer la prise en charge oncologique en permettant des interventions thérapeutiques plus rapides, ciblées et personnalisées, augmentant ainsi considérablement les chances de guérison des patients.','planifie','2026-05-22','2028-08-10',400000.00,'2026-05-30 19:53:49.706551'),
(4,'Analyse des données génomiques par IA','Utilisation de modèles IA pour analyser les séquences génomiques humaines et détecter des anomalies.','en_cours','2024-01-15','2025-06-30',320000.00,'2026-05-30 21:19:25.000000'),
(5,'Étude de la résistance aux antibiotiques','Analyse des mécanismes de résistance bactérienne aux antibiotiques courants.','planifie','2025-09-01',NULL,125000.00,'2026-05-30 21:19:25.000000'),
(6,'Modélisation moléculaire des protéines','Simulation informatique des structures protéiques pour identifier de nouvelles cibles thérapeutiques.','termine','2023-03-01','2024-03-01',480000.00,'2026-05-30 21:19:25.000000'),
(8,'Impact des nanoparticules sur les cellules','Étude de l effets cytotoxiques des nanoparticules métalliques sur les cellules humaines.','suspendu','2023-11-01',NULL,85000.00,'2026-05-30 21:19:25.000000'),
(9,'Séquençage du génome humain local','Projet de séquençage génomique de la population du nord du Maroc.','planifie','2025-12-01',NULL,950000.00,'2026-05-30 21:19:25.000000');
/*!40000 ALTER TABLE `core_projetrecherche` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_projetrecherche_chercheurs`
--

DROP TABLE IF EXISTS `core_projetrecherche_chercheurs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_projetrecherche_chercheurs` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `projetrecherche_id` bigint(20) NOT NULL,
  `chercheur_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `core_projetrecherche_che_projetrecherche_id_cherc_420b468b_uniq` (`projetrecherche_id`,`chercheur_id`),
  KEY `core_projetrecherche_chercheur_id_c33657fc_fk_core_cher` (`chercheur_id`),
  CONSTRAINT `core_projetrecherche_chercheur_id_c33657fc_fk_core_cher` FOREIGN KEY (`chercheur_id`) REFERENCES `core_chercheur` (`id`),
  CONSTRAINT `core_projetrecherche_projetrecherche_id_e638223a_fk_core_proj` FOREIGN KEY (`projetrecherche_id`) REFERENCES `core_projetrecherche` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_projetrecherche_chercheurs`
--

LOCK TABLES `core_projetrecherche_chercheurs` WRITE;
/*!40000 ALTER TABLE `core_projetrecherche_chercheurs` DISABLE KEYS */;
INSERT INTO `core_projetrecherche_chercheurs` VALUES
(3,3,2),
(10,3,3),
(11,3,6),
(4,4,5),
(5,4,10),
(7,5,7),
(6,5,8),
(8,6,4),
(9,6,9),
(13,8,11),
(12,8,12),
(15,9,2),
(14,9,5);
/*!40000 ALTER TABLE `core_projetrecherche_chercheurs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_record`
--

DROP TABLE IF EXISTS `core_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_record` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `adress` varchar(100) NOT NULL,
  `city` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `zipcode` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_record`
--

LOCK TABLES `core_record` WRITE;
/*!40000 ALTER TABLE `core_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES
(1,'admin','logentry'),
(2,'auth','group'),
(3,'auth','permission'),
(4,'auth','user'),
(5,'contenttypes','contenttype'),
(8,'core','chercheur'),
(9,'core','projetrecherche'),
(7,'core','record'),
(13,'equipements','equipment'),
(18,'experiences','experience'),
(19,'experiences','publication'),
(20,'experiences','resultat'),
(10,'laboratoires','laboratoire'),
(11,'laboratoires','membre'),
(12,'laboratoires','responsable'),
(15,'reservations','client'),
(16,'reservations','materielrecherche'),
(17,'reservations','reservationmateriel'),
(6,'sessions','session'),
(14,'users','profil');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES
(1,'contenttypes','0001_initial','2026-05-30 17:43:12.685718'),
(2,'auth','0001_initial','2026-05-30 17:43:12.880863'),
(3,'admin','0001_initial','2026-05-30 17:43:12.924552'),
(4,'admin','0002_logentry_remove_auto_add','2026-05-30 17:43:12.929305'),
(5,'admin','0003_logentry_add_action_flag_choices','2026-05-30 17:43:12.935069'),
(6,'contenttypes','0002_remove_content_type_name','2026-05-30 17:43:12.971366'),
(7,'auth','0002_alter_permission_name_max_length','2026-05-30 17:43:12.991707'),
(8,'auth','0003_alter_user_email_max_length','2026-05-30 17:43:13.004995'),
(9,'auth','0004_alter_user_username_opts','2026-05-30 17:43:13.009316'),
(10,'auth','0005_alter_user_last_login_null','2026-05-30 17:43:13.027631'),
(11,'auth','0006_require_contenttypes_0002','2026-05-30 17:43:13.028862'),
(12,'auth','0007_alter_validators_add_error_messages','2026-05-30 17:43:13.032891'),
(13,'auth','0008_alter_user_username_max_length','2026-05-30 17:43:13.045769'),
(14,'auth','0009_alter_user_last_name_max_length','2026-05-30 17:43:13.058437'),
(15,'auth','0010_alter_group_name_max_length','2026-05-30 17:43:13.072495'),
(16,'auth','0011_update_proxy_permissions','2026-05-30 17:43:13.077850'),
(17,'auth','0012_alter_user_first_name_max_length','2026-05-30 17:43:13.092017'),
(18,'core','0001_initial','2026-05-30 17:43:13.099154'),
(19,'sessions','0001_initial','2026-05-30 17:43:13.117017'),
(20,'core','0002_chercheur_projetrecherche','2026-05-30 18:15:53.262437'),
(21,'core','0003_alter_chercheur_email','2026-06-20 02:31:44.645411'),
(22,'laboratoires','0001_initial','2026-06-20 02:31:44.705657'),
(23,'equipements','0001_initial','2026-06-20 04:05:28.906514'),
(24,'users','0001_initial','2026-06-20 04:23:33.091614'),
(25,'reservations','0001_initial','2026-06-20 04:44:00.865382'),
(26,'experiences','0001_initial','2026-06-20 05:01:46.622487');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES
('eox9zhtrocy68t70hfehjxbqp7qhrseq','.eJxVjMsOwiAQAP9lz4ZA5bH06L3f0CwLSNVAUtqT8d9Nkx70OjOZN8y0b2Xee1rnJcIICi6_LBA_Uz1EfFC9N8GtbusSxJGI03YxtZhet7P9GxTqBUZIyaBnhYMiP5hkWaP23kaVUUYd0JjgAlnORnFGyhpRXrP2ihyjkQ4-X9sJN5U:1wTOeV:OiVSz0RZdjSsKND9UHRck-tW8lbUWG_1eLzDaQ-NkgI','2026-06-13 18:43:19.552355'),
('vbiqsj1mphgimmdk729l3k0na1auos1k','.eJxVjEEOwiAQAP-yZ0No2QLt0btvIAu7SNWUpLQn499Nkx70OjOZNwTatxL2JmuYGSbo4PLLIqWnLIfgBy33qlJdtnWO6kjUaZu6VZbX9Wz_BoVagQm8F4OU2Y5GhLyliH2P6AfnrM4u-4690wYxoiOjDbI2MljEkXOiHOHzBdE6N4M:1waxgT:rgbS7bQEn7w4Biuts_xYsOhJZzuLWpIZmqmX20j_t7A','2026-07-04 15:32:37.673817');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipements_equipment`
--

DROP TABLE IF EXISTS `equipements_equipment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `equipements_equipment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `serial_number` varchar(100) NOT NULL,
  `status` varchar(20) NOT NULL,
  `availability` varchar(20) NOT NULL,
  `date_added` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `serial_number` (`serial_number`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipements_equipment`
--

LOCK TABLES `equipements_equipment` WRITE;
/*!40000 ALTER TABLE `equipements_equipment` DISABLE KEYS */;
INSERT INTO `equipements_equipment` VALUES
(1,'centrifugeuse de laboratoire','CFG-2022-011','fonctionnel','disponible','2026-06-20 04:07:54.212348'),
(2,'Microscope électronique à balayage','MEB-2024-001','fonctionnel','disponible','2026-06-20 07:03:35.000000'),
(3,'Centrifugeuse haute vitesse','CFG-2023-014','fonctionnel','utilise','2026-06-20 07:03:35.000000'),
(4,'Spectromètre de masse','SPM-2022-007','maintenance','indisponible','2026-06-20 07:03:35.000000'),
(5,'PCR thermocycleur','PCR-2024-022','fonctionnel','disponible','2026-06-20 07:03:35.000000'),
(6,'Chromatographe en phase gazeuse','CPG-2021-009','fonctionnel','reserve','2026-06-20 07:03:35.000000'),
(7,'Serveur de calcul GPU','GPU-2024-003','fonctionnel','disponible','2026-06-20 07:03:35.000000'),
(8,'Microscope à fluorescence','MFL-2023-018','panne','hors_service','2026-06-20 07:03:35.000000'),
(9,'Autoclave de stérilisation','AUT-2022-011','fonctionnel','disponible','2026-06-20 07:03:35.000000');
/*!40000 ALTER TABLE `equipements_equipment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `experiences_experience`
--

DROP TABLE IF EXISTS `experiences_experience`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `experiences_experience` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `titre` varchar(200) NOT NULL,
  `description` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `experiences_experience`
--

LOCK TABLES `experiences_experience` WRITE;
/*!40000 ALTER TABLE `experiences_experience` DISABLE KEYS */;
INSERT INTO `experiences_experience` VALUES
(1,'Étude de l\'expression génique sous stress thermique','Analyse de la réponse transcriptionnelle de cellules soumises à un choc thermique.'),
(2,'Test de résistance bactérienne aux antibiotiques','Évaluation de la sensibilité de souches bactériennes à différents antibiotiques.'),
(3,'Entraînement de modèle de classification d\'images médicales','Développement d\'un modèle IA pour la détection automatique d\'anomalies sur images.'),
(4,'Synthèse de nanoparticules métalliques','Production et caractérisation de nanoparticules d\'argent pour applications biomédicales.');
/*!40000 ALTER TABLE `experiences_experience` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `experiences_publication`
--

DROP TABLE IF EXISTS `experiences_publication`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `experiences_publication` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `titre` varchar(200) NOT NULL,
  `auteur` varchar(100) NOT NULL,
  `date_publication` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `experiences_publication`
--

LOCK TABLES `experiences_publication` WRITE;
/*!40000 ALTER TABLE `experiences_publication` DISABLE KEYS */;
INSERT INTO `experiences_publication` VALUES
(1,'Apprentissage profond pour la génomique computationnelle','Mohamed Ouass','2025-11-10'),
(2,'Mécanismes de résistance bactérienne en milieu hospitalier','Fatima Zahra Chahi','2025-08-22'),
(3,'Modélisation moléculaire appliquée à la découverte de médicaments','Younes Al Hammouti','2024-03-15'),
(4,'Nanomatériaux et leurs applications en biomédecine','Asmae Lammouti','2025-01-30'),
(5,'Intelligence artificielle et diagnostic médical assisté','Chaimae El Bakkali','2026-02-05');
/*!40000 ALTER TABLE `experiences_publication` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `experiences_resultat`
--

DROP TABLE IF EXISTS `experiences_resultat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `experiences_resultat` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `titre` varchar(200) NOT NULL,
  `description` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `experiences_resultat`
--

LOCK TABLES `experiences_resultat` WRITE;
/*!40000 ALTER TABLE `experiences_resultat` DISABLE KEYS */;
INSERT INTO `experiences_resultat` VALUES
(1,'Augmentation de 23% de la précision de détection','Le modèle IA entraîné a montré une amélioration significative par rapport à la baseline.'),
(2,'Identification de 3 nouvelles souches résistantes','Découverte de nouvelles souches bactériennes résistantes aux antibiotiques courants.'),
(3,'Synthèse réussie de nanoparticules stables','Les nanoparticules synthétisées présentent une stabilité supérieure à 6 mois.');
/*!40000 ALTER TABLE `experiences_resultat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `laboratoires_laboratoire`
--

DROP TABLE IF EXISTS `laboratoires_laboratoire`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `laboratoires_laboratoire` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nom_laboratoire` varchar(150) NOT NULL,
  `code_laboratoire` varchar(50) NOT NULL,
  `domaine` varchar(150) NOT NULL,
  `localisation` varchar(150) NOT NULL,
  `description` longtext NOT NULL,
  `date_creation` date NOT NULL,
  `statut` varchar(20) NOT NULL,
  `date_ajout` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code_laboratoire` (`code_laboratoire`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `laboratoires_laboratoire`
--

LOCK TABLES `laboratoires_laboratoire` WRITE;
/*!40000 ALTER TABLE `laboratoires_laboratoire` DISABLE KEYS */;
INSERT INTO `laboratoires_laboratoire` VALUES
(1,'NadorLAB','62000','Bioalimentaire','Nador, Barraka','','2003-01-19','actif','2026-06-20 03:29:54.109636'),
(2,'LabGénomique Nador','LGN-001','Génomique et biologie moléculaire','Nador, Faculté Pluridisciplinaire','Laboratoire spécialisé dans l\'analyse génomique et la biologie cellulaire.','2018-09-01','actif','2026-06-20 07:01:47.000000'),
(3,'LabMicroBio Oriental','LMO-002','Microbiologie','Nador, Bâtiment B','Recherche sur la résistance bactérienne et les agents pathogènes.','2019-03-15','actif','2026-06-20 07:01:47.000000'),
(4,'LabMatériaux Nador','LMN-003','Chimie des matériaux','Nador, Bâtiment Sciences','Étude des matériaux composites et nanomatériaux.','2017-01-10','actif','2026-06-20 07:01:47.000000'),
(5,'LabIA & Data','LIAD-004','Intelligence artificielle','Nador, Campus Numérique','Recherche en intelligence artificielle appliquée à la santé et aux data.','2021-06-01','actif','2026-06-20 07:01:47.000000'),
(6,'LabPhysique Appliquée','LPA-005','Physique des particules','Nador, Bâtiment Physique','Laboratoire de recherche en physique fondamentale et appliquée.','2016-11-20','en_attente','2026-06-20 07:01:47.000000'),
(7,'LabMaths & Modélisation','LMM-006','Mathématiques appliquées','Nador, Bâtiment C','Modélisation mathématique et statistique appliquée à la recherche.','2020-02-05','inactif','2026-06-20 07:01:47.000000');
/*!40000 ALTER TABLE `laboratoires_laboratoire` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `laboratoires_membre`
--

DROP TABLE IF EXISTS `laboratoires_membre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `laboratoires_membre` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) NOT NULL,
  `prenom` varchar(100) NOT NULL,
  `email` varchar(254) NOT NULL,
  `telephone` varchar(30) NOT NULL,
  `role` varchar(120) NOT NULL,
  `niveau` varchar(30) NOT NULL,
  `statut` varchar(20) NOT NULL,
  `date_ajout` datetime(6) NOT NULL,
  `laboratoire_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `laboratoires_membre_laboratoire_id_e62c753f_fk_laboratoi` (`laboratoire_id`),
  CONSTRAINT `laboratoires_membre_laboratoire_id_e62c753f_fk_laboratoi` FOREIGN KEY (`laboratoire_id`) REFERENCES `laboratoires_laboratoire` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `laboratoires_membre`
--

LOCK TABLES `laboratoires_membre` WRITE;
/*!40000 ALTER TABLE `laboratoires_membre` DISABLE KEYS */;
INSERT INTO `laboratoires_membre` VALUES
(1,'Ouass','Mohamed','m.ouass@labo-nador.ma','0612345600','Coordinateur technique','master','actif','2026-06-20 07:03:02.000000',2),
(2,'Chahi','Fatima Zahra','fz.chahi@labo-nador.ma','0612345607','Doctorante','doctorat','actif','2026-06-20 07:03:02.000000',2),
(3,'El Bakkali','Chaimae','c.elbakkali@labo-nador.ma','0612345608','Chercheuse','enseignant','actif','2026-06-20 07:03:02.000000',5),
(4,'Soussan','Mohamed','m.soussan@labo-nador.ma','0612345609','Étudiant chercheur','master','actif','2026-06-20 07:03:02.000000',4),
(5,'Al Hammouti','Younes','y.alhammouti@labo-nador.ma','0612345610','Technicien de laboratoire','technicien','actif','2026-06-20 07:03:02.000000',3),
(6,'El Haimeur','Aya','a.elhaimeur@labo-nador.ma','0612345611','Étudiante chercheuse','licence','inactif','2026-06-20 07:03:02.000000',6);
/*!40000 ALTER TABLE `laboratoires_membre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `laboratoires_responsable`
--

DROP TABLE IF EXISTS `laboratoires_responsable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `laboratoires_responsable` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) NOT NULL,
  `prenom` varchar(100) NOT NULL,
  `email` varchar(254) NOT NULL,
  `telephone` varchar(30) NOT NULL,
  `fonction` varchar(120) NOT NULL,
  `laboratoire_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `laboratoires_respons_laboratoire_id_f41b1a8f_fk_laboratoi` (`laboratoire_id`),
  CONSTRAINT `laboratoires_respons_laboratoire_id_f41b1a8f_fk_laboratoi` FOREIGN KEY (`laboratoire_id`) REFERENCES `laboratoires_laboratoire` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `laboratoires_responsable`
--

LOCK TABLES `laboratoires_responsable` WRITE;
/*!40000 ALTER TABLE `laboratoires_responsable` DISABLE KEYS */;
INSERT INTO `laboratoires_responsable` VALUES
(1,'Bouyaoumad','Chaymae','c.bouyaoumad@labo-nador.ma','0612345601','Directrice de laboratoire',2),
(2,'Sellami','Hanane','h.sellami@labo-nador.ma','0612345602','Responsable scientifique',3),
(3,'El Bairi','Hanae','h.elbairi@labo-nador.ma','0612345603','Responsable technique',4),
(4,'Lammouti','Asmae','a.lammouti@labo-nador.ma','0612345604','Directrice de laboratoire',5),
(5,'Darkik','Younes','y.darkik@labo-nador.ma','0612345605','Responsable scientifique',6),
(6,'Chajjia','Mustapha','m.chajjia@labo-nador.ma','0612345606','Directeur de laboratoire',7);
/*!40000 ALTER TABLE `laboratoires_responsable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservations_client`
--

DROP TABLE IF EXISTS `reservations_client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservations_client` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) NOT NULL,
  `email` varchar(254) NOT NULL,
  `telephone` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservations_client`
--

LOCK TABLES `reservations_client` WRITE;
/*!40000 ALTER TABLE `reservations_client` DISABLE KEYS */;
INSERT INTO `reservations_client` VALUES
(1,'Mohamed Ouass','m.ouass@labo-nador.ma','0612345600'),
(2,'Fatima Zahra Chahi','fz.chahi@labo-nador.ma','0612345607'),
(3,'Younes Al Hammouti','y.alhammouti@labo-nador.ma','0612345610');
/*!40000 ALTER TABLE `reservations_client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservations_materielrecherche`
--

DROP TABLE IF EXISTS `reservations_materielrecherche`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservations_materielrecherche` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nom` varchar(120) NOT NULL,
  `reference` varchar(50) NOT NULL,
  `laboratoire` varchar(120) NOT NULL,
  `description` longtext NOT NULL,
  `etat` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `reference` (`reference`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservations_materielrecherche`
--

LOCK TABLES `reservations_materielrecherche` WRITE;
/*!40000 ALTER TABLE `reservations_materielrecherche` DISABLE KEYS */;
INSERT INTO `reservations_materielrecherche` VALUES
(1,'Microscope confocal','MAT-001','LabGénomique Nador','Microscope confocal haute résolution','disponible'),
(2,'Spectrophotomètre UV-Vis','MAT-002','LabMicroBio Oriental','Analyse spectrophotométrique','disponible'),
(3,'Bioréacteur de paillasse','MAT-003','LabMicroBio Oriental','Culture cellulaire en milieu contrôlé','maintenance'),
(4,'Cluster de calcul GPU','MAT-004','LabIA & Data','Calcul intensif pour modèles IA','disponible'),
(5,'Banc optique laser','MAT-005','LabPhysique Appliquée','Expériences en optique et photonique','disponible');
/*!40000 ALTER TABLE `reservations_materielrecherche` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservations_reservationmateriel`
--

DROP TABLE IF EXISTS `reservations_reservationmateriel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservations_reservationmateriel` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `demandeur` varchar(120) NOT NULL,
  `email_demandeur` varchar(254) NOT NULL,
  `date_debut` datetime(6) NOT NULL,
  `date_fin` datetime(6) NOT NULL,
  `motif` longtext NOT NULL,
  `statut` varchar(20) NOT NULL,
  `date_creation` datetime(6) NOT NULL,
  `materiel_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `reservations_reserva_materiel_id_f8d5ffde_fk_reservati` (`materiel_id`),
  CONSTRAINT `reservations_reserva_materiel_id_f8d5ffde_fk_reservati` FOREIGN KEY (`materiel_id`) REFERENCES `reservations_materielrecherche` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservations_reservationmateriel`
--

LOCK TABLES `reservations_reservationmateriel` WRITE;
/*!40000 ALTER TABLE `reservations_reservationmateriel` DISABLE KEYS */;
INSERT INTO `reservations_reservationmateriel` VALUES
(1,'Mohamed Ouass','medouassemed@gmail.com','2026-07-01 09:00:00.000000','2026-07-01 17:00:00.000000','Analyse d\'échantillons pour le projet de recherche en génomique','validee','2026-06-20 07:05:30.000000',1),
(2,'Chaimae El Bakkali','c.elbakkali@labo-nador.ma','2026-07-05 08:00:00.000000','2026-07-10 18:00:00.000000','Entraînement de modèles IA pour la détection de biomarqueurs','en_attente','2026-06-20 07:05:30.000000',4),
(3,'Fatima Zahra Chahi','fz.chahi@labo-nador.ma','2026-06-25 10:00:00.000000','2026-06-25 14:00:00.000000','Mesures spectrophotométriques pour étude de résistance bactérienne','terminee','2026-06-20 07:05:30.000000',2),
(4,'Younes Darkik','y.darkik@labo-nador.ma','2026-07-15 09:00:00.000000','2026-07-16 17:00:00.000000','Expérience d\'optique pour projet de physique appliquée','en_attente','2026-06-20 07:05:30.000000',5);
/*!40000 ALTER TABLE `reservations_reservationmateriel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_profil`
--

DROP TABLE IF EXISTS `users_profil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_profil` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role` varchar(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `users_profil_user_id_fb78f081_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_profil`
--

LOCK TABLES `users_profil` WRITE;
/*!40000 ALTER TABLE `users_profil` DISABLE KEYS */;
INSERT INTO `users_profil` VALUES
(1,'CHERCHEUR',2),
(2,'CHERCHEUR',3),
(3,'ETUDIANT',4),
(4,'ETUDIANT',5),
(5,'CHERCHEUR',6),
(6,'ADMIN',7),
(7,'ADMIN',1);
/*!40000 ALTER TABLE `users_profil` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'dbpro'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*M!100616 SET NOTE_VERBOSITY=@OLD_NOTE_VERBOSITY */;

-- Dump completed on 2026-06-20 16:50:48
