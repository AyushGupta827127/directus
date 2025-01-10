-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: directus
-- ------------------------------------------------------
-- Server version	8.0.40

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `directus_access`
--

DROP TABLE IF EXISTS `directus_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `directus_access` (
  `id` char(36) NOT NULL,
  `role` char(36) DEFAULT NULL,
  `user` char(36) DEFAULT NULL,
  `policy` char(36) NOT NULL,
  `sort` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `directus_access_role_foreign` (`role`),
  KEY `directus_access_user_foreign` (`user`),
  KEY `directus_access_policy_foreign` (`policy`),
  CONSTRAINT `directus_access_policy_foreign` FOREIGN KEY (`policy`) REFERENCES `directus_policies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `directus_access_role_foreign` FOREIGN KEY (`role`) REFERENCES `directus_roles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `directus_access_user_foreign` FOREIGN KEY (`user`) REFERENCES `directus_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `directus_access`
--

LOCK TABLES `directus_access` WRITE;
/*!40000 ALTER TABLE `directus_access` DISABLE KEYS */;
INSERT INTO `directus_access` VALUES ('8b2ed226-5ba1-4310-94ae-8af6000c4481',NULL,NULL,'abf8a154-5b1c-4a46-ac9c-7300570f4f17',1),('9cc46fc6-d2f7-4447-a086-5530fb959e47','c1f4465e-5614-4901-922c-13f389819f02',NULL,'06024559-ef4d-40fa-81ce-161496d9c2f6',NULL);
/*!40000 ALTER TABLE `directus_access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `directus_activity`
--

DROP TABLE IF EXISTS `directus_activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `directus_activity` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `action` varchar(45) NOT NULL,
  `user` char(36) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ip` varchar(50) DEFAULT NULL,
  `user_agent` text,
  `collection` varchar(64) NOT NULL,
  `item` varchar(255) NOT NULL,
  `origin` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `directus_activity_collection_foreign` (`collection`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `directus_activity`
--

LOCK TABLES `directus_activity` WRITE;
/*!40000 ALTER TABLE `directus_activity` DISABLE KEYS */;
INSERT INTO `directus_activity` VALUES (1,'login','fe82ad2d-c68e-4f6c-991c-6a279cb76a16','2025-01-10 05:28:26','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','directus_users','fe82ad2d-c68e-4f6c-991c-6a279cb76a16','http://localhost:8055'),(2,'login','fe82ad2d-c68e-4f6c-991c-6a279cb76a16','2025-01-10 07:02:06','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','directus_users','fe82ad2d-c68e-4f6c-991c-6a279cb76a16','http://127.0.0.1:8055');
/*!40000 ALTER TABLE `directus_activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `directus_collections`
--

DROP TABLE IF EXISTS `directus_collections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `directus_collections` (
  `collection` varchar(64) NOT NULL,
  `icon` varchar(64) DEFAULT NULL,
  `note` text,
  `display_template` varchar(255) DEFAULT NULL,
  `hidden` tinyint(1) NOT NULL DEFAULT '0',
  `singleton` tinyint(1) NOT NULL DEFAULT '0',
  `translations` json DEFAULT NULL,
  `archive_field` varchar(64) DEFAULT NULL,
  `archive_app_filter` tinyint(1) NOT NULL DEFAULT '1',
  `archive_value` varchar(255) DEFAULT NULL,
  `unarchive_value` varchar(255) DEFAULT NULL,
  `sort_field` varchar(64) DEFAULT NULL,
  `accountability` varchar(255) DEFAULT 'all',
  `color` varchar(255) DEFAULT NULL,
  `item_duplication_fields` json DEFAULT NULL,
  `sort` int DEFAULT NULL,
  `group` varchar(64) DEFAULT NULL,
  `collapse` varchar(255) NOT NULL DEFAULT 'open',
  `preview_url` varchar(255) DEFAULT NULL,
  `versioning` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`collection`),
  KEY `directus_collections_group_foreign` (`group`),
  CONSTRAINT `directus_collections_group_foreign` FOREIGN KEY (`group`) REFERENCES `directus_collections` (`collection`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `directus_collections`
--

LOCK TABLES `directus_collections` WRITE;
/*!40000 ALTER TABLE `directus_collections` DISABLE KEYS */;
/*!40000 ALTER TABLE `directus_collections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `directus_comments`
--

DROP TABLE IF EXISTS `directus_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `directus_comments` (
  `id` char(36) NOT NULL,
  `collection` varchar(64) NOT NULL,
  `item` varchar(255) NOT NULL,
  `comment` text NOT NULL,
  `date_created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `date_updated` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `user_created` char(36) DEFAULT NULL,
  `user_updated` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `directus_comments_user_created_foreign` (`user_created`),
  KEY `directus_comments_user_updated_foreign` (`user_updated`),
  CONSTRAINT `directus_comments_user_created_foreign` FOREIGN KEY (`user_created`) REFERENCES `directus_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `directus_comments_user_updated_foreign` FOREIGN KEY (`user_updated`) REFERENCES `directus_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `directus_comments`
--

LOCK TABLES `directus_comments` WRITE;
/*!40000 ALTER TABLE `directus_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `directus_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `directus_dashboards`
--

DROP TABLE IF EXISTS `directus_dashboards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `directus_dashboards` (
  `id` char(36) NOT NULL,
  `name` varchar(255) NOT NULL,
  `icon` varchar(64) NOT NULL DEFAULT 'dashboard',
  `note` text,
  `date_created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `user_created` char(36) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `directus_dashboards_user_created_foreign` (`user_created`),
  CONSTRAINT `directus_dashboards_user_created_foreign` FOREIGN KEY (`user_created`) REFERENCES `directus_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `directus_dashboards`
--

LOCK TABLES `directus_dashboards` WRITE;
/*!40000 ALTER TABLE `directus_dashboards` DISABLE KEYS */;
/*!40000 ALTER TABLE `directus_dashboards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `directus_extensions`
--

DROP TABLE IF EXISTS `directus_extensions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `directus_extensions` (
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `id` char(36) NOT NULL,
  `folder` varchar(255) NOT NULL,
  `source` varchar(255) NOT NULL,
  `bundle` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `directus_extensions`
--

LOCK TABLES `directus_extensions` WRITE;
/*!40000 ALTER TABLE `directus_extensions` DISABLE KEYS */;
/*!40000 ALTER TABLE `directus_extensions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `directus_fields`
--

DROP TABLE IF EXISTS `directus_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `directus_fields` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `collection` varchar(64) NOT NULL,
  `field` varchar(64) NOT NULL,
  `special` varchar(64) DEFAULT NULL,
  `interface` varchar(64) DEFAULT NULL,
  `options` json DEFAULT NULL,
  `display` varchar(64) DEFAULT NULL,
  `display_options` json DEFAULT NULL,
  `readonly` tinyint(1) NOT NULL DEFAULT '0',
  `hidden` tinyint(1) NOT NULL DEFAULT '0',
  `sort` int unsigned DEFAULT NULL,
  `width` varchar(30) DEFAULT 'full',
  `translations` json DEFAULT NULL,
  `note` text,
  `conditions` json DEFAULT NULL,
  `required` tinyint(1) DEFAULT '0',
  `group` varchar(64) DEFAULT NULL,
  `validation` json DEFAULT NULL,
  `validation_message` text,
  PRIMARY KEY (`id`),
  KEY `directus_fields_collection_foreign` (`collection`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `directus_fields`
--

LOCK TABLES `directus_fields` WRITE;
/*!40000 ALTER TABLE `directus_fields` DISABLE KEYS */;
/*!40000 ALTER TABLE `directus_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `directus_files`
--

DROP TABLE IF EXISTS `directus_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `directus_files` (
  `id` char(36) NOT NULL,
  `storage` varchar(255) NOT NULL,
  `filename_disk` varchar(255) DEFAULT NULL,
  `filename_download` varchar(255) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `folder` char(36) DEFAULT NULL,
  `uploaded_by` char(36) DEFAULT NULL,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by` char(36) DEFAULT NULL,
  `modified_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `charset` varchar(50) DEFAULT NULL,
  `filesize` bigint DEFAULT NULL,
  `width` int unsigned DEFAULT NULL,
  `height` int unsigned DEFAULT NULL,
  `duration` int unsigned DEFAULT NULL,
  `embed` varchar(200) DEFAULT NULL,
  `description` text,
  `location` text,
  `tags` text,
  `metadata` json DEFAULT NULL,
  `focal_point_x` int DEFAULT NULL,
  `focal_point_y` int DEFAULT NULL,
  `tus_id` varchar(64) DEFAULT NULL,
  `tus_data` json DEFAULT NULL,
  `uploaded_on` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `directus_files_uploaded_by_foreign` (`uploaded_by`),
  KEY `directus_files_modified_by_foreign` (`modified_by`),
  KEY `directus_files_folder_foreign` (`folder`),
  CONSTRAINT `directus_files_folder_foreign` FOREIGN KEY (`folder`) REFERENCES `directus_folders` (`id`) ON DELETE SET NULL,
  CONSTRAINT `directus_files_modified_by_foreign` FOREIGN KEY (`modified_by`) REFERENCES `directus_users` (`id`),
  CONSTRAINT `directus_files_uploaded_by_foreign` FOREIGN KEY (`uploaded_by`) REFERENCES `directus_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `directus_files`
--

LOCK TABLES `directus_files` WRITE;
/*!40000 ALTER TABLE `directus_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `directus_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `directus_flows`
--

DROP TABLE IF EXISTS `directus_flows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `directus_flows` (
  `id` char(36) NOT NULL,
  `name` varchar(255) NOT NULL,
  `icon` varchar(64) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `description` text,
  `status` varchar(255) NOT NULL DEFAULT 'active',
  `trigger` varchar(255) DEFAULT NULL,
  `accountability` varchar(255) DEFAULT 'all',
  `options` json DEFAULT NULL,
  `operation` char(36) DEFAULT NULL,
  `date_created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `user_created` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `directus_flows_operation_unique` (`operation`),
  KEY `directus_flows_user_created_foreign` (`user_created`),
  CONSTRAINT `directus_flows_user_created_foreign` FOREIGN KEY (`user_created`) REFERENCES `directus_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `directus_flows`
--

LOCK TABLES `directus_flows` WRITE;
/*!40000 ALTER TABLE `directus_flows` DISABLE KEYS */;
/*!40000 ALTER TABLE `directus_flows` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `directus_folders`
--

DROP TABLE IF EXISTS `directus_folders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `directus_folders` (
  `id` char(36) NOT NULL,
  `name` varchar(255) NOT NULL,
  `parent` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `directus_folders_parent_foreign` (`parent`),
  CONSTRAINT `directus_folders_parent_foreign` FOREIGN KEY (`parent`) REFERENCES `directus_folders` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `directus_folders`
--

LOCK TABLES `directus_folders` WRITE;
/*!40000 ALTER TABLE `directus_folders` DISABLE KEYS */;
/*!40000 ALTER TABLE `directus_folders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `directus_migrations`
--

DROP TABLE IF EXISTS `directus_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `directus_migrations` (
  `version` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `directus_migrations`
--

LOCK TABLES `directus_migrations` WRITE;
/*!40000 ALTER TABLE `directus_migrations` DISABLE KEYS */;
INSERT INTO `directus_migrations` VALUES ('20201028A','Remove Collection Foreign Keys','2025-01-10 10:51:37'),('20201029A','Remove System Relations','2025-01-10 10:51:37'),('20201029B','Remove System Collections','2025-01-10 10:51:37'),('20201029C','Remove System Fields','2025-01-10 10:51:37'),('20201105A','Add Cascade System Relations','2025-01-10 10:51:39'),('20201105B','Change Webhook URL Type','2025-01-10 10:51:39'),('20210225A','Add Relations Sort Field','2025-01-10 10:51:39'),('20210304A','Remove Locked Fields','2025-01-10 10:51:39'),('20210312A','Webhooks Collections Text','2025-01-10 10:51:39'),('20210331A','Add Refresh Interval','2025-01-10 10:51:40'),('20210415A','Make Filesize Nullable','2025-01-10 10:51:40'),('20210416A','Add Collections Accountability','2025-01-10 10:51:40'),('20210422A','Remove Files Interface','2025-01-10 10:51:40'),('20210506A','Rename Interfaces','2025-01-10 10:51:40'),('20210510A','Restructure Relations','2025-01-10 10:51:40'),('20210518A','Add Foreign Key Constraints','2025-01-10 10:51:40'),('20210519A','Add System Fk Triggers','2025-01-10 10:51:41'),('20210521A','Add Collections Icon Color','2025-01-10 10:51:41'),('20210525A','Add Insights','2025-01-10 10:51:41'),('20210608A','Add Deep Clone Config','2025-01-10 10:51:41'),('20210626A','Change Filesize Bigint','2025-01-10 10:51:42'),('20210716A','Add Conditions to Fields','2025-01-10 10:51:42'),('20210721A','Add Default Folder','2025-01-10 10:51:42'),('20210802A','Replace Groups','2025-01-10 10:51:42'),('20210803A','Add Required to Fields','2025-01-10 10:51:42'),('20210805A','Update Groups','2025-01-10 10:51:42'),('20210805B','Change Image Metadata Structure','2025-01-10 10:51:42'),('20210811A','Add Geometry Config','2025-01-10 10:51:42'),('20210831A','Remove Limit Column','2025-01-10 10:51:42'),('20210903A','Add Auth Provider','2025-01-10 10:51:42'),('20210907A','Webhooks Collections Not Null','2025-01-10 10:51:42'),('20210910A','Move Module Setup','2025-01-10 10:51:42'),('20210920A','Webhooks URL Not Null','2025-01-10 10:51:42'),('20210924A','Add Collection Organization','2025-01-10 10:51:43'),('20210927A','Replace Fields Group','2025-01-10 10:51:43'),('20210927B','Replace M2M Interface','2025-01-10 10:51:43'),('20210929A','Rename Login Action','2025-01-10 10:51:43'),('20211007A','Update Presets','2025-01-10 10:51:43'),('20211009A','Add Auth Data','2025-01-10 10:51:43'),('20211016A','Add Webhook Headers','2025-01-10 10:51:43'),('20211103A','Set Unique to User Token','2025-01-10 10:51:43'),('20211103B','Update Special Geometry','2025-01-10 10:51:43'),('20211104A','Remove Collections Listing','2025-01-10 10:51:43'),('20211118A','Add Notifications','2025-01-10 10:51:43'),('20211211A','Add Shares','2025-01-10 10:51:44'),('20211230A','Add Project Descriptor','2025-01-10 10:51:44'),('20220303A','Remove Default Project Color','2025-01-10 10:51:44'),('20220308A','Add Bookmark Icon and Color','2025-01-10 10:51:44'),('20220314A','Add Translation Strings','2025-01-10 10:51:44'),('20220322A','Rename Field Typecast Flags','2025-01-10 10:51:44'),('20220323A','Add Field Validation','2025-01-10 10:51:44'),('20220325A','Fix Typecast Flags','2025-01-10 10:51:44'),('20220325B','Add Default Language','2025-01-10 10:51:44'),('20220402A','Remove Default Value Panel Icon','2025-01-10 10:51:44'),('20220429A','Add Flows','2025-01-10 10:51:45'),('20220429B','Add Color to Insights Icon','2025-01-10 10:51:45'),('20220429C','Drop Non Null From IP of Activity','2025-01-10 10:51:45'),('20220429D','Drop Non Null From Sender of Notifications','2025-01-10 10:51:45'),('20220614A','Rename Hook Trigger to Event','2025-01-10 10:51:45'),('20220801A','Update Notifications Timestamp Column','2025-01-10 10:51:45'),('20220802A','Add Custom Aspect Ratios','2025-01-10 10:51:45'),('20220826A','Add Origin to Accountability','2025-01-10 10:51:45'),('20230401A','Update Material Icons','2025-01-10 10:51:46'),('20230525A','Add Preview Settings','2025-01-10 10:51:46'),('20230526A','Migrate Translation Strings','2025-01-10 10:51:46'),('20230721A','Require Shares Fields','2025-01-10 10:51:46'),('20230823A','Add Content Versioning','2025-01-10 10:51:47'),('20230927A','Themes','2025-01-10 10:51:47'),('20231009A','Update CSV Fields to Text','2025-01-10 10:51:47'),('20231009B','Update Panel Options','2025-01-10 10:51:47'),('20231010A','Add Extensions','2025-01-10 10:51:47'),('20231215A','Add Focalpoints','2025-01-10 10:51:47'),('20240122A','Add Report URL Fields','2025-01-10 10:51:47'),('20240204A','Marketplace','2025-01-10 10:51:47'),('20240305A','Change Useragent Type','2025-01-10 10:51:48'),('20240311A','Deprecate Webhooks','2025-01-10 10:51:48'),('20240422A','Public Registration','2025-01-10 10:51:48'),('20240515A','Add Session Window','2025-01-10 10:51:48'),('20240701A','Add Tus Data','2025-01-10 10:51:48'),('20240716A','Update Files Date Fields','2025-01-10 10:51:48'),('20240806A','Permissions Policies','2025-01-10 10:51:49'),('20240817A','Update Icon Fields Length','2025-01-10 10:51:50'),('20240909A','Separate Comments','2025-01-10 10:51:50'),('20240909B','Consolidate Content Versioning','2025-01-10 10:51:50'),('20240924A','Migrate Legacy Comments','2025-01-10 10:51:50'),('20240924B','Populate Versioning Deltas','2025-01-10 10:51:50');
/*!40000 ALTER TABLE `directus_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `directus_notifications`
--

DROP TABLE IF EXISTS `directus_notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `directus_notifications` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `status` varchar(255) DEFAULT 'inbox',
  `recipient` char(36) NOT NULL,
  `sender` char(36) DEFAULT NULL,
  `subject` varchar(255) NOT NULL,
  `message` text,
  `collection` varchar(64) DEFAULT NULL,
  `item` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `directus_notifications_recipient_foreign` (`recipient`),
  KEY `directus_notifications_sender_foreign` (`sender`),
  CONSTRAINT `directus_notifications_recipient_foreign` FOREIGN KEY (`recipient`) REFERENCES `directus_users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `directus_notifications_sender_foreign` FOREIGN KEY (`sender`) REFERENCES `directus_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `directus_notifications`
--

LOCK TABLES `directus_notifications` WRITE;
/*!40000 ALTER TABLE `directus_notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `directus_notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `directus_operations`
--

DROP TABLE IF EXISTS `directus_operations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `directus_operations` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `key` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `position_x` int NOT NULL,
  `position_y` int NOT NULL,
  `options` json DEFAULT NULL,
  `resolve` char(36) DEFAULT NULL,
  `reject` char(36) DEFAULT NULL,
  `flow` char(36) NOT NULL,
  `date_created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `user_created` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `directus_operations_resolve_unique` (`resolve`),
  UNIQUE KEY `directus_operations_reject_unique` (`reject`),
  KEY `directus_operations_flow_foreign` (`flow`),
  KEY `directus_operations_user_created_foreign` (`user_created`),
  CONSTRAINT `directus_operations_flow_foreign` FOREIGN KEY (`flow`) REFERENCES `directus_flows` (`id`) ON DELETE CASCADE,
  CONSTRAINT `directus_operations_reject_foreign` FOREIGN KEY (`reject`) REFERENCES `directus_operations` (`id`),
  CONSTRAINT `directus_operations_resolve_foreign` FOREIGN KEY (`resolve`) REFERENCES `directus_operations` (`id`),
  CONSTRAINT `directus_operations_user_created_foreign` FOREIGN KEY (`user_created`) REFERENCES `directus_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `directus_operations`
--

LOCK TABLES `directus_operations` WRITE;
/*!40000 ALTER TABLE `directus_operations` DISABLE KEYS */;
/*!40000 ALTER TABLE `directus_operations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `directus_panels`
--

DROP TABLE IF EXISTS `directus_panels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `directus_panels` (
  `id` char(36) NOT NULL,
  `dashboard` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `icon` varchar(64) DEFAULT NULL,
  `color` varchar(10) DEFAULT NULL,
  `show_header` tinyint(1) NOT NULL DEFAULT '0',
  `note` text,
  `type` varchar(255) NOT NULL,
  `position_x` int NOT NULL,
  `position_y` int NOT NULL,
  `width` int NOT NULL,
  `height` int NOT NULL,
  `options` json DEFAULT NULL,
  `date_created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `user_created` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `directus_panels_dashboard_foreign` (`dashboard`),
  KEY `directus_panels_user_created_foreign` (`user_created`),
  CONSTRAINT `directus_panels_dashboard_foreign` FOREIGN KEY (`dashboard`) REFERENCES `directus_dashboards` (`id`) ON DELETE CASCADE,
  CONSTRAINT `directus_panels_user_created_foreign` FOREIGN KEY (`user_created`) REFERENCES `directus_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `directus_panels`
--

LOCK TABLES `directus_panels` WRITE;
/*!40000 ALTER TABLE `directus_panels` DISABLE KEYS */;
/*!40000 ALTER TABLE `directus_panels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `directus_permissions`
--

DROP TABLE IF EXISTS `directus_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `directus_permissions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `collection` varchar(64) NOT NULL,
  `action` varchar(10) NOT NULL,
  `permissions` json DEFAULT NULL,
  `validation` json DEFAULT NULL,
  `presets` json DEFAULT NULL,
  `fields` text,
  `policy` char(36) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `directus_permissions_collection_foreign` (`collection`),
  KEY `directus_permissions_policy_foreign` (`policy`),
  CONSTRAINT `directus_permissions_policy_foreign` FOREIGN KEY (`policy`) REFERENCES `directus_policies` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `directus_permissions`
--

LOCK TABLES `directus_permissions` WRITE;
/*!40000 ALTER TABLE `directus_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `directus_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `directus_policies`
--

DROP TABLE IF EXISTS `directus_policies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `directus_policies` (
  `id` char(36) NOT NULL,
  `name` varchar(100) NOT NULL,
  `icon` varchar(64) NOT NULL DEFAULT 'badge',
  `description` text,
  `ip_access` text,
  `enforce_tfa` tinyint(1) NOT NULL DEFAULT '0',
  `admin_access` tinyint(1) NOT NULL DEFAULT '0',
  `app_access` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `directus_policies`
--

LOCK TABLES `directus_policies` WRITE;
/*!40000 ALTER TABLE `directus_policies` DISABLE KEYS */;
INSERT INTO `directus_policies` VALUES ('06024559-ef4d-40fa-81ce-161496d9c2f6','Administrator','verified','$t:admin_description',NULL,0,1,1),('abf8a154-5b1c-4a46-ac9c-7300570f4f17','$t:public_label','public','$t:public_description',NULL,0,0,0);
/*!40000 ALTER TABLE `directus_policies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `directus_presets`
--

DROP TABLE IF EXISTS `directus_presets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `directus_presets` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `bookmark` varchar(255) DEFAULT NULL,
  `user` char(36) DEFAULT NULL,
  `role` char(36) DEFAULT NULL,
  `collection` varchar(64) DEFAULT NULL,
  `search` varchar(100) DEFAULT NULL,
  `layout` varchar(100) DEFAULT 'tabular',
  `layout_query` json DEFAULT NULL,
  `layout_options` json DEFAULT NULL,
  `refresh_interval` int DEFAULT NULL,
  `filter` json DEFAULT NULL,
  `icon` varchar(64) DEFAULT 'bookmark',
  `color` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `directus_presets_collection_foreign` (`collection`),
  KEY `directus_presets_user_foreign` (`user`),
  KEY `directus_presets_role_foreign` (`role`),
  CONSTRAINT `directus_presets_role_foreign` FOREIGN KEY (`role`) REFERENCES `directus_roles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `directus_presets_user_foreign` FOREIGN KEY (`user`) REFERENCES `directus_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `directus_presets`
--

LOCK TABLES `directus_presets` WRITE;
/*!40000 ALTER TABLE `directus_presets` DISABLE KEYS */;
/*!40000 ALTER TABLE `directus_presets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `directus_relations`
--

DROP TABLE IF EXISTS `directus_relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `directus_relations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `many_collection` varchar(64) NOT NULL,
  `many_field` varchar(64) NOT NULL,
  `one_collection` varchar(64) DEFAULT NULL,
  `one_field` varchar(64) DEFAULT NULL,
  `one_collection_field` varchar(64) DEFAULT NULL,
  `one_allowed_collections` text,
  `junction_field` varchar(64) DEFAULT NULL,
  `sort_field` varchar(64) DEFAULT NULL,
  `one_deselect_action` varchar(255) NOT NULL DEFAULT 'nullify',
  PRIMARY KEY (`id`),
  KEY `directus_relations_many_collection_foreign` (`many_collection`),
  KEY `directus_relations_one_collection_foreign` (`one_collection`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `directus_relations`
--

LOCK TABLES `directus_relations` WRITE;
/*!40000 ALTER TABLE `directus_relations` DISABLE KEYS */;
/*!40000 ALTER TABLE `directus_relations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `directus_revisions`
--

DROP TABLE IF EXISTS `directus_revisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `directus_revisions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `activity` int unsigned NOT NULL,
  `collection` varchar(64) NOT NULL,
  `item` varchar(255) NOT NULL,
  `data` json DEFAULT NULL,
  `delta` json DEFAULT NULL,
  `parent` int unsigned DEFAULT NULL,
  `version` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `directus_revisions_collection_foreign` (`collection`),
  KEY `directus_revisions_parent_foreign` (`parent`),
  KEY `directus_revisions_activity_foreign` (`activity`),
  KEY `directus_revisions_version_foreign` (`version`),
  CONSTRAINT `directus_revisions_activity_foreign` FOREIGN KEY (`activity`) REFERENCES `directus_activity` (`id`) ON DELETE CASCADE,
  CONSTRAINT `directus_revisions_parent_foreign` FOREIGN KEY (`parent`) REFERENCES `directus_revisions` (`id`),
  CONSTRAINT `directus_revisions_version_foreign` FOREIGN KEY (`version`) REFERENCES `directus_versions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `directus_revisions`
--

LOCK TABLES `directus_revisions` WRITE;
/*!40000 ALTER TABLE `directus_revisions` DISABLE KEYS */;
/*!40000 ALTER TABLE `directus_revisions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `directus_roles`
--

DROP TABLE IF EXISTS `directus_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `directus_roles` (
  `id` char(36) NOT NULL,
  `name` varchar(100) NOT NULL,
  `icon` varchar(64) NOT NULL DEFAULT 'supervised_user_circle',
  `description` text,
  `parent` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `directus_roles_parent_foreign` (`parent`),
  CONSTRAINT `directus_roles_parent_foreign` FOREIGN KEY (`parent`) REFERENCES `directus_roles` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `directus_roles`
--

LOCK TABLES `directus_roles` WRITE;
/*!40000 ALTER TABLE `directus_roles` DISABLE KEYS */;
INSERT INTO `directus_roles` VALUES ('c1f4465e-5614-4901-922c-13f389819f02','Administrator','verified','$t:admin_description',NULL);
/*!40000 ALTER TABLE `directus_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `directus_sessions`
--

DROP TABLE IF EXISTS `directus_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `directus_sessions` (
  `token` varchar(64) NOT NULL,
  `user` char(36) DEFAULT NULL,
  `expires` timestamp NOT NULL,
  `ip` varchar(255) DEFAULT NULL,
  `user_agent` text,
  `share` char(36) DEFAULT NULL,
  `origin` varchar(255) DEFAULT NULL,
  `next_token` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`token`),
  KEY `directus_sessions_user_foreign` (`user`),
  KEY `directus_sessions_share_foreign` (`share`),
  CONSTRAINT `directus_sessions_share_foreign` FOREIGN KEY (`share`) REFERENCES `directus_shares` (`id`) ON DELETE CASCADE,
  CONSTRAINT `directus_sessions_user_foreign` FOREIGN KEY (`user`) REFERENCES `directus_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `directus_sessions`
--

LOCK TABLES `directus_sessions` WRITE;
/*!40000 ALTER TABLE `directus_sessions` DISABLE KEYS */;
INSERT INTO `directus_sessions` VALUES ('6jSwNjQnarG-hhIfUbanwkWi0Dc6dpj5eLS9mxJO0r7rVQAHGL4obTcAH7R3b9CG','fe82ad2d-c68e-4f6c-991c-6a279cb76a16','2025-01-10 13:01:40','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36',NULL,'http://127.0.0.1:8055','eFMZBYK5ksHLZMA1gamcwDaairmf3i8ue1WHfGzzT55izr9VOQnG4I0BtOzeC6Co'),('eFMZBYK5ksHLZMA1gamcwDaairmf3i8ue1WHfGzzT55izr9VOQnG4I0BtOzeC6Co','fe82ad2d-c68e-4f6c-991c-6a279cb76a16','2025-01-11 13:01:30','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36',NULL,'http://127.0.0.1:8055',NULL),('hpDpnyjaOc2GCszQAmoCSaNQv5HbReIs_N87vrf1Q2u9UrPYOMJa9E2JYFuHkevP','fe82ad2d-c68e-4f6c-991c-6a279cb76a16','2025-01-11 11:48:20','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36',NULL,'http://localhost:8055',NULL);
/*!40000 ALTER TABLE `directus_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `directus_settings`
--

DROP TABLE IF EXISTS `directus_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `directus_settings` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `project_name` varchar(100) NOT NULL DEFAULT 'Directus',
  `project_url` varchar(255) DEFAULT NULL,
  `project_color` varchar(255) NOT NULL DEFAULT '#6644FF',
  `project_logo` char(36) DEFAULT NULL,
  `public_foreground` char(36) DEFAULT NULL,
  `public_background` char(36) DEFAULT NULL,
  `public_note` text,
  `auth_login_attempts` int unsigned DEFAULT '25',
  `auth_password_policy` varchar(100) DEFAULT NULL,
  `storage_asset_transform` varchar(7) DEFAULT 'all',
  `storage_asset_presets` json DEFAULT NULL,
  `custom_css` text,
  `storage_default_folder` char(36) DEFAULT NULL,
  `basemaps` json DEFAULT NULL,
  `mapbox_key` varchar(255) DEFAULT NULL,
  `module_bar` json DEFAULT NULL,
  `project_descriptor` varchar(100) DEFAULT NULL,
  `default_language` varchar(255) NOT NULL DEFAULT 'en-US',
  `custom_aspect_ratios` json DEFAULT NULL,
  `public_favicon` char(36) DEFAULT NULL,
  `default_appearance` varchar(255) NOT NULL DEFAULT 'auto',
  `default_theme_light` varchar(255) DEFAULT NULL,
  `theme_light_overrides` json DEFAULT NULL,
  `default_theme_dark` varchar(255) DEFAULT NULL,
  `theme_dark_overrides` json DEFAULT NULL,
  `report_error_url` varchar(255) DEFAULT NULL,
  `report_bug_url` varchar(255) DEFAULT NULL,
  `report_feature_url` varchar(255) DEFAULT NULL,
  `public_registration` tinyint(1) NOT NULL DEFAULT '0',
  `public_registration_verify_email` tinyint(1) NOT NULL DEFAULT '1',
  `public_registration_role` char(36) DEFAULT NULL,
  `public_registration_email_filter` json DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `directus_settings_project_logo_foreign` (`project_logo`),
  KEY `directus_settings_public_foreground_foreign` (`public_foreground`),
  KEY `directus_settings_public_background_foreign` (`public_background`),
  KEY `directus_settings_storage_default_folder_foreign` (`storage_default_folder`),
  KEY `directus_settings_public_favicon_foreign` (`public_favicon`),
  KEY `directus_settings_public_registration_role_foreign` (`public_registration_role`),
  CONSTRAINT `directus_settings_project_logo_foreign` FOREIGN KEY (`project_logo`) REFERENCES `directus_files` (`id`),
  CONSTRAINT `directus_settings_public_background_foreign` FOREIGN KEY (`public_background`) REFERENCES `directus_files` (`id`),
  CONSTRAINT `directus_settings_public_favicon_foreign` FOREIGN KEY (`public_favicon`) REFERENCES `directus_files` (`id`),
  CONSTRAINT `directus_settings_public_foreground_foreign` FOREIGN KEY (`public_foreground`) REFERENCES `directus_files` (`id`),
  CONSTRAINT `directus_settings_public_registration_role_foreign` FOREIGN KEY (`public_registration_role`) REFERENCES `directus_roles` (`id`) ON DELETE SET NULL,
  CONSTRAINT `directus_settings_storage_default_folder_foreign` FOREIGN KEY (`storage_default_folder`) REFERENCES `directus_folders` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `directus_settings`
--

LOCK TABLES `directus_settings` WRITE;
/*!40000 ALTER TABLE `directus_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `directus_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `directus_shares`
--

DROP TABLE IF EXISTS `directus_shares`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `directus_shares` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `collection` varchar(64) NOT NULL,
  `item` varchar(255) NOT NULL,
  `role` char(36) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `user_created` char(36) DEFAULT NULL,
  `date_created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `date_start` timestamp NULL DEFAULT NULL,
  `date_end` timestamp NULL DEFAULT NULL,
  `times_used` int DEFAULT '0',
  `max_uses` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `directus_shares_role_foreign` (`role`),
  KEY `directus_shares_user_created_foreign` (`user_created`),
  KEY `directus_shares_collection_foreign` (`collection`),
  CONSTRAINT `directus_shares_collection_foreign` FOREIGN KEY (`collection`) REFERENCES `directus_collections` (`collection`) ON DELETE CASCADE,
  CONSTRAINT `directus_shares_role_foreign` FOREIGN KEY (`role`) REFERENCES `directus_roles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `directus_shares_user_created_foreign` FOREIGN KEY (`user_created`) REFERENCES `directus_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `directus_shares`
--

LOCK TABLES `directus_shares` WRITE;
/*!40000 ALTER TABLE `directus_shares` DISABLE KEYS */;
/*!40000 ALTER TABLE `directus_shares` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `directus_translations`
--

DROP TABLE IF EXISTS `directus_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `directus_translations` (
  `id` char(36) NOT NULL,
  `language` varchar(255) NOT NULL,
  `key` varchar(255) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `directus_translations`
--

LOCK TABLES `directus_translations` WRITE;
/*!40000 ALTER TABLE `directus_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `directus_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `directus_users`
--

DROP TABLE IF EXISTS `directus_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `directus_users` (
  `id` char(36) NOT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `email` varchar(128) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `description` text,
  `tags` json DEFAULT NULL,
  `avatar` char(36) DEFAULT NULL,
  `language` varchar(255) DEFAULT NULL,
  `tfa_secret` varchar(255) DEFAULT NULL,
  `status` varchar(16) NOT NULL DEFAULT 'active',
  `role` char(36) DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  `last_access` timestamp NULL DEFAULT NULL,
  `last_page` varchar(255) DEFAULT NULL,
  `provider` varchar(128) NOT NULL DEFAULT 'default',
  `external_identifier` varchar(255) DEFAULT NULL,
  `auth_data` json DEFAULT NULL,
  `email_notifications` tinyint(1) DEFAULT '1',
  `appearance` varchar(255) DEFAULT NULL,
  `theme_dark` varchar(255) DEFAULT NULL,
  `theme_light` varchar(255) DEFAULT NULL,
  `theme_light_overrides` json DEFAULT NULL,
  `theme_dark_overrides` json DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `directus_users_external_identifier_unique` (`external_identifier`),
  UNIQUE KEY `directus_users_email_unique` (`email`),
  UNIQUE KEY `directus_users_token_unique` (`token`),
  KEY `directus_users_role_foreign` (`role`),
  CONSTRAINT `directus_users_role_foreign` FOREIGN KEY (`role`) REFERENCES `directus_roles` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `directus_users`
--

LOCK TABLES `directus_users` WRITE;
/*!40000 ALTER TABLE `directus_users` DISABLE KEYS */;
INSERT INTO `directus_users` VALUES ('fe82ad2d-c68e-4f6c-991c-6a279cb76a16','Admin','User','ayushgupta.cspl@gmail.com','$argon2id$v=19$m=65536,t=3,p=4$ntLwKWVFzm3P2BglmT8o0Q$asHQmyEv5UCfQBIDHJvs8lg1Pmwx1tzH1OVX+YSfzDo',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'active','c1f4465e-5614-4901-922c-13f389819f02',NULL,'2025-01-10 13:01:30','/settings/data-model','default',NULL,NULL,1,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `directus_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `directus_versions`
--

DROP TABLE IF EXISTS `directus_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `directus_versions` (
  `id` char(36) NOT NULL,
  `key` varchar(64) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `collection` varchar(64) NOT NULL,
  `item` varchar(255) NOT NULL,
  `hash` varchar(255) DEFAULT NULL,
  `date_created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `date_updated` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `user_created` char(36) DEFAULT NULL,
  `user_updated` char(36) DEFAULT NULL,
  `delta` json DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `directus_versions_collection_foreign` (`collection`),
  KEY `directus_versions_user_created_foreign` (`user_created`),
  KEY `directus_versions_user_updated_foreign` (`user_updated`),
  CONSTRAINT `directus_versions_collection_foreign` FOREIGN KEY (`collection`) REFERENCES `directus_collections` (`collection`) ON DELETE CASCADE,
  CONSTRAINT `directus_versions_user_created_foreign` FOREIGN KEY (`user_created`) REFERENCES `directus_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `directus_versions_user_updated_foreign` FOREIGN KEY (`user_updated`) REFERENCES `directus_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `directus_versions`
--

LOCK TABLES `directus_versions` WRITE;
/*!40000 ALTER TABLE `directus_versions` DISABLE KEYS */;
/*!40000 ALTER TABLE `directus_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `directus_webhooks`
--

DROP TABLE IF EXISTS `directus_webhooks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `directus_webhooks` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `method` varchar(10) NOT NULL DEFAULT 'POST',
  `url` varchar(255) NOT NULL,
  `status` varchar(10) NOT NULL DEFAULT 'active',
  `data` tinyint(1) NOT NULL DEFAULT '1',
  `actions` varchar(100) NOT NULL,
  `collections` varchar(255) NOT NULL,
  `headers` json DEFAULT NULL,
  `was_active_before_deprecation` tinyint(1) NOT NULL DEFAULT '0',
  `migrated_flow` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `directus_webhooks_migrated_flow_foreign` (`migrated_flow`),
  CONSTRAINT `directus_webhooks_migrated_flow_foreign` FOREIGN KEY (`migrated_flow`) REFERENCES `directus_flows` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `directus_webhooks`
--

LOCK TABLES `directus_webhooks` WRITE;
/*!40000 ALTER TABLE `directus_webhooks` DISABLE KEYS */;
/*!40000 ALTER TABLE `directus_webhooks` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-01-10 19:10:38
