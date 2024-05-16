CREATE DATABASE  IF NOT EXISTS `bookstore` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `bookstore`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: bookstore
-- ------------------------------------------------------
-- Server version	8.0.37

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `__efmigrationshistory`
--

DROP TABLE IF EXISTS `__efmigrationshistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `__efmigrationshistory` (
  `MigrationId` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ProductVersion` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`MigrationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `__efmigrationshistory`
--

LOCK TABLES `__efmigrationshistory` WRITE;
/*!40000 ALTER TABLE `__efmigrationshistory` DISABLE KEYS */;
INSERT INTO `__efmigrationshistory` VALUES ('20240516122029_Initial','8.0.0'),('20240516125806_Created_Book_Entity','8.0.0');
/*!40000 ALTER TABLE `__efmigrationshistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `abpauditlogactions`
--

DROP TABLE IF EXISTS `abpauditlogactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `abpauditlogactions` (
  `Id` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `TenantId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci DEFAULT NULL,
  `AuditLogId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `ServiceName` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `MethodName` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Parameters` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `ExecutionTime` datetime(6) NOT NULL,
  `ExecutionDuration` int NOT NULL,
  `ExtraProperties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  PRIMARY KEY (`Id`),
  KEY `IX_AbpAuditLogActions_AuditLogId` (`AuditLogId`),
  KEY `IX_AbpAuditLogActions_TenantId_ServiceName_MethodName_Execution~` (`TenantId`,`ServiceName`,`MethodName`,`ExecutionTime`),
  CONSTRAINT `FK_AbpAuditLogActions_AbpAuditLogs_AuditLogId` FOREIGN KEY (`AuditLogId`) REFERENCES `abpauditlogs` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `abpauditlogactions`
--

LOCK TABLES `abpauditlogactions` WRITE;
/*!40000 ALTER TABLE `abpauditlogactions` DISABLE KEYS */;
INSERT INTO `abpauditlogactions` VALUES ('3a129391-4bc5-643c-ee43-e982be93a759',NULL,'3a129391-4bc3-6789-6577-8b304f860858','Volo.Abp.Account.Web.Pages.Account.LoginModel','OnPostAsync','{\"action\":\"Login\"}','2024-05-16 20:33:11.327156',3847,'{}');
/*!40000 ALTER TABLE `abpauditlogactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `abpauditlogs`
--

DROP TABLE IF EXISTS `abpauditlogs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `abpauditlogs` (
  `Id` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `ApplicationName` varchar(96) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `UserId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci DEFAULT NULL,
  `UserName` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `TenantId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci DEFAULT NULL,
  `TenantName` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `ImpersonatorUserId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci DEFAULT NULL,
  `ImpersonatorUserName` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `ImpersonatorTenantId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci DEFAULT NULL,
  `ImpersonatorTenantName` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `ExecutionTime` datetime(6) NOT NULL,
  `ExecutionDuration` int NOT NULL,
  `ClientIpAddress` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `ClientName` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `ClientId` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `CorrelationId` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `BrowserInfo` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `HttpMethod` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Url` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Exceptions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `Comments` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `HttpStatusCode` int DEFAULT NULL,
  `ExtraProperties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ConcurrencyStamp` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `IX_AbpAuditLogs_TenantId_ExecutionTime` (`TenantId`,`ExecutionTime`),
  KEY `IX_AbpAuditLogs_TenantId_UserId_ExecutionTime` (`TenantId`,`UserId`,`ExecutionTime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `abpauditlogs`
--

LOCK TABLES `abpauditlogs` WRITE;
/*!40000 ALTER TABLE `abpauditlogs` DISABLE KEYS */;
INSERT INTO `abpauditlogs` VALUES ('3a129391-4bc3-6789-6577-8b304f860858','Acme.BookStore.Web',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2024-05-16 20:33:11.248246',3940,'::1',NULL,NULL,'0ce31c5f7476441183ed9797610b0f4a','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36 Edg/124.0.0.0','POST','/Account/Login',NULL,'',302,'{}','a7fc221c045b47719d339565f9762cd3');
/*!40000 ALTER TABLE `abpauditlogs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `abpbackgroundjobs`
--

DROP TABLE IF EXISTS `abpbackgroundjobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `abpbackgroundjobs` (
  `Id` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `JobName` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `JobArgs` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `TryCount` smallint NOT NULL DEFAULT '0',
  `CreationTime` datetime(6) NOT NULL,
  `NextTryTime` datetime(6) NOT NULL,
  `LastTryTime` datetime(6) DEFAULT NULL,
  `IsAbandoned` tinyint(1) NOT NULL DEFAULT '0',
  `Priority` tinyint unsigned NOT NULL DEFAULT '15',
  `ExtraProperties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ConcurrencyStamp` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `IX_AbpBackgroundJobs_IsAbandoned_NextTryTime` (`IsAbandoned`,`NextTryTime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `abpbackgroundjobs`
--

LOCK TABLES `abpbackgroundjobs` WRITE;
/*!40000 ALTER TABLE `abpbackgroundjobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `abpbackgroundjobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `abpclaimtypes`
--

DROP TABLE IF EXISTS `abpclaimtypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `abpclaimtypes` (
  `Id` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `Name` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Required` tinyint(1) NOT NULL,
  `IsStatic` tinyint(1) NOT NULL,
  `Regex` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `RegexDescription` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Description` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `ValueType` int NOT NULL,
  `ExtraProperties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ConcurrencyStamp` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `abpclaimtypes`
--

LOCK TABLES `abpclaimtypes` WRITE;
/*!40000 ALTER TABLE `abpclaimtypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `abpclaimtypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `abpentitychanges`
--

DROP TABLE IF EXISTS `abpentitychanges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `abpentitychanges` (
  `Id` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `AuditLogId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `TenantId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci DEFAULT NULL,
  `ChangeTime` datetime(6) NOT NULL,
  `ChangeType` tinyint unsigned NOT NULL,
  `EntityTenantId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci DEFAULT NULL,
  `EntityId` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `EntityTypeFullName` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ExtraProperties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  PRIMARY KEY (`Id`),
  KEY `IX_AbpEntityChanges_AuditLogId` (`AuditLogId`),
  KEY `IX_AbpEntityChanges_TenantId_EntityTypeFullName_EntityId` (`TenantId`,`EntityTypeFullName`,`EntityId`),
  CONSTRAINT `FK_AbpEntityChanges_AbpAuditLogs_AuditLogId` FOREIGN KEY (`AuditLogId`) REFERENCES `abpauditlogs` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `abpentitychanges`
--

LOCK TABLES `abpentitychanges` WRITE;
/*!40000 ALTER TABLE `abpentitychanges` DISABLE KEYS */;
/*!40000 ALTER TABLE `abpentitychanges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `abpentitypropertychanges`
--

DROP TABLE IF EXISTS `abpentitypropertychanges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `abpentitypropertychanges` (
  `Id` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `TenantId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci DEFAULT NULL,
  `EntityChangeId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `NewValue` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `OriginalValue` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `PropertyName` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `PropertyTypeFullName` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `IX_AbpEntityPropertyChanges_EntityChangeId` (`EntityChangeId`),
  CONSTRAINT `FK_AbpEntityPropertyChanges_AbpEntityChanges_EntityChangeId` FOREIGN KEY (`EntityChangeId`) REFERENCES `abpentitychanges` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `abpentitypropertychanges`
--

LOCK TABLES `abpentitypropertychanges` WRITE;
/*!40000 ALTER TABLE `abpentitypropertychanges` DISABLE KEYS */;
/*!40000 ALTER TABLE `abpentitypropertychanges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `abpfeaturegroups`
--

DROP TABLE IF EXISTS `abpfeaturegroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `abpfeaturegroups` (
  `Id` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `Name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `DisplayName` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ExtraProperties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `IX_AbpFeatureGroups_Name` (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `abpfeaturegroups`
--

LOCK TABLES `abpfeaturegroups` WRITE;
/*!40000 ALTER TABLE `abpfeaturegroups` DISABLE KEYS */;
INSERT INTO `abpfeaturegroups` VALUES ('3a12938e-ff12-2a21-e502-d10a5406de10','SettingManagement','L:AbpSettingManagement,Feature:SettingManagementGroup','{}');
/*!40000 ALTER TABLE `abpfeaturegroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `abpfeatures`
--

DROP TABLE IF EXISTS `abpfeatures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `abpfeatures` (
  `Id` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `GroupName` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ParentName` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `DisplayName` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Description` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `DefaultValue` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `IsVisibleToClients` tinyint(1) NOT NULL,
  `IsAvailableToHost` tinyint(1) NOT NULL,
  `AllowedProviders` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `ValueType` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `ExtraProperties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `IX_AbpFeatures_Name` (`Name`),
  KEY `IX_AbpFeatures_GroupName` (`GroupName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `abpfeatures`
--

LOCK TABLES `abpfeatures` WRITE;
/*!40000 ALTER TABLE `abpfeatures` DISABLE KEYS */;
INSERT INTO `abpfeatures` VALUES ('3a12938e-ff1f-81f4-5e4f-8de169533637','SettingManagement','SettingManagement.Enable',NULL,'L:AbpSettingManagement,Feature:SettingManagementEnable','L:AbpSettingManagement,Feature:SettingManagementEnableDescription','true',1,0,NULL,'{\"name\":\"ToggleStringValueType\",\"properties\":{},\"validator\":{\"name\":\"BOOLEAN\",\"properties\":{}}}','{}'),('3a12938e-ff5d-2055-3d32-ec8f1ccb5178','SettingManagement','SettingManagement.AllowChangingEmailSettings','SettingManagement.Enable','L:AbpSettingManagement,Feature:AllowChangingEmailSettings',NULL,'false',1,0,NULL,'{\"name\":\"ToggleStringValueType\",\"properties\":{},\"validator\":{\"name\":\"BOOLEAN\",\"properties\":{}}}','{}');
/*!40000 ALTER TABLE `abpfeatures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `abpfeaturevalues`
--

DROP TABLE IF EXISTS `abpfeaturevalues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `abpfeaturevalues` (
  `Id` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `Name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Value` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ProviderName` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `ProviderKey` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `IX_AbpFeatureValues_Name_ProviderName_ProviderKey` (`Name`,`ProviderName`,`ProviderKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `abpfeaturevalues`
--

LOCK TABLES `abpfeaturevalues` WRITE;
/*!40000 ALTER TABLE `abpfeaturevalues` DISABLE KEYS */;
/*!40000 ALTER TABLE `abpfeaturevalues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `abplinkusers`
--

DROP TABLE IF EXISTS `abplinkusers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `abplinkusers` (
  `Id` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `SourceUserId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `SourceTenantId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci DEFAULT NULL,
  `TargetUserId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `TargetTenantId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `IX_AbpLinkUsers_SourceUserId_SourceTenantId_TargetUserId_Target~` (`SourceUserId`,`SourceTenantId`,`TargetUserId`,`TargetTenantId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `abplinkusers`
--

LOCK TABLES `abplinkusers` WRITE;
/*!40000 ALTER TABLE `abplinkusers` DISABLE KEYS */;
/*!40000 ALTER TABLE `abplinkusers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `abporganizationunitroles`
--

DROP TABLE IF EXISTS `abporganizationunitroles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `abporganizationunitroles` (
  `RoleId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `OrganizationUnitId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `TenantId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci DEFAULT NULL,
  `CreationTime` datetime(6) NOT NULL,
  `CreatorId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci DEFAULT NULL,
  PRIMARY KEY (`OrganizationUnitId`,`RoleId`),
  KEY `IX_AbpOrganizationUnitRoles_RoleId_OrganizationUnitId` (`RoleId`,`OrganizationUnitId`),
  CONSTRAINT `FK_AbpOrganizationUnitRoles_AbpOrganizationUnits_OrganizationUn~` FOREIGN KEY (`OrganizationUnitId`) REFERENCES `abporganizationunits` (`Id`) ON DELETE CASCADE,
  CONSTRAINT `FK_AbpOrganizationUnitRoles_AbpRoles_RoleId` FOREIGN KEY (`RoleId`) REFERENCES `abproles` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `abporganizationunitroles`
--

LOCK TABLES `abporganizationunitroles` WRITE;
/*!40000 ALTER TABLE `abporganizationunitroles` DISABLE KEYS */;
/*!40000 ALTER TABLE `abporganizationunitroles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `abporganizationunits`
--

DROP TABLE IF EXISTS `abporganizationunits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `abporganizationunits` (
  `Id` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `TenantId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci DEFAULT NULL,
  `ParentId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci DEFAULT NULL,
  `Code` varchar(95) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `DisplayName` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `EntityVersion` int NOT NULL,
  `ExtraProperties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ConcurrencyStamp` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `CreationTime` datetime(6) NOT NULL,
  `CreatorId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci DEFAULT NULL,
  `LastModificationTime` datetime(6) DEFAULT NULL,
  `LastModifierId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci DEFAULT NULL,
  `IsDeleted` tinyint(1) NOT NULL DEFAULT '0',
  `DeleterId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci DEFAULT NULL,
  `DeletionTime` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `IX_AbpOrganizationUnits_Code` (`Code`),
  KEY `IX_AbpOrganizationUnits_ParentId` (`ParentId`),
  CONSTRAINT `FK_AbpOrganizationUnits_AbpOrganizationUnits_ParentId` FOREIGN KEY (`ParentId`) REFERENCES `abporganizationunits` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `abporganizationunits`
--

LOCK TABLES `abporganizationunits` WRITE;
/*!40000 ALTER TABLE `abporganizationunits` DISABLE KEYS */;
/*!40000 ALTER TABLE `abporganizationunits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `abppermissiongrants`
--

DROP TABLE IF EXISTS `abppermissiongrants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `abppermissiongrants` (
  `Id` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `TenantId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci DEFAULT NULL,
  `Name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ProviderName` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ProviderKey` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `IX_AbpPermissionGrants_TenantId_Name_ProviderName_ProviderKey` (`TenantId`,`Name`,`ProviderName`,`ProviderKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `abppermissiongrants`
--

LOCK TABLES `abppermissiongrants` WRITE;
/*!40000 ALTER TABLE `abppermissiongrants` DISABLE KEYS */;
INSERT INTO `abppermissiongrants` VALUES ('3a12938b-9de5-fd8c-96b9-9a502e3a913d',NULL,'AbpIdentity.Roles','R','admin'),('3a12938b-9dfa-b373-f526-aa6a65d331ff',NULL,'AbpIdentity.Roles.Create','R','admin'),('3a12938b-9dfd-7361-7386-d8b2a7480ce2',NULL,'AbpIdentity.Roles.Delete','R','admin'),('3a12938b-9dfe-bf6b-0643-ab8f003d39a6',NULL,'AbpIdentity.Roles.ManagePermissions','R','admin'),('3a12938b-9dfd-eea1-ae7d-1b1a6c9acc40',NULL,'AbpIdentity.Roles.Update','R','admin'),('3a12938b-9dfe-0917-7785-e7b496e08f8f',NULL,'AbpIdentity.Users','R','admin'),('3a12938b-9dfe-b8e9-8cac-2a07d446bd28',NULL,'AbpIdentity.Users.Create','R','admin'),('3a12938b-9dff-ccc4-89ed-abefbcab0f05',NULL,'AbpIdentity.Users.Delete','R','admin'),('3a12938b-9dff-9b30-5fa4-20a794210448',NULL,'AbpIdentity.Users.ManagePermissions','R','admin'),('3a12938b-9dfe-461d-07d4-8e1caa8c5b82',NULL,'AbpIdentity.Users.Update','R','admin'),('3a12938b-9dff-da8b-9e3b-f324c1eb851b',NULL,'AbpIdentity.Users.Update.ManageRoles','R','admin'),('3a12938b-9e01-7fd4-f497-37d5ede6e9b3',NULL,'AbpTenantManagement.Tenants','R','admin'),('3a12938b-9e01-87f7-85f3-441afdbf4c91',NULL,'AbpTenantManagement.Tenants.Create','R','admin'),('3a12938b-9e04-4197-0ced-bcb75150f539',NULL,'AbpTenantManagement.Tenants.Delete','R','admin'),('3a12938b-9e05-c169-4ec5-e85d7cff871d',NULL,'AbpTenantManagement.Tenants.ManageConnectionStrings','R','admin'),('3a12938b-9e05-c897-b03a-f5e7c9d808c1',NULL,'AbpTenantManagement.Tenants.ManageFeatures','R','admin'),('3a12938b-9e04-10c8-f6c2-6e509d7cd799',NULL,'AbpTenantManagement.Tenants.Update','R','admin'),('3a12938b-9e00-91bb-2a09-7580208b6f06',NULL,'FeatureManagement.ManageHostFeatures','R','admin'),('3a12938b-9e00-9cf5-9e36-48f19616e074',NULL,'SettingManagement.Emailing','R','admin'),('3a12938b-9e00-d8d4-f789-53d2b13f15f6',NULL,'SettingManagement.Emailing.Test','R','admin'),('3a12938b-9e01-c0ab-2d50-20211e883101',NULL,'SettingManagement.TimeZone','R','admin');
/*!40000 ALTER TABLE `abppermissiongrants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `abppermissiongroups`
--

DROP TABLE IF EXISTS `abppermissiongroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `abppermissiongroups` (
  `Id` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `Name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `DisplayName` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ExtraProperties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `IX_AbpPermissionGroups_Name` (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `abppermissiongroups`
--

LOCK TABLES `abppermissiongroups` WRITE;
/*!40000 ALTER TABLE `abppermissiongroups` DISABLE KEYS */;
INSERT INTO `abppermissiongroups` VALUES ('3a12938e-ff13-3efa-31ca-cda4baf3f024','AbpIdentity','L:AbpIdentity,Permission:IdentityManagement','{}'),('3a12938e-ff25-1d96-93cc-9f23406693da','SettingManagement','L:AbpSettingManagement,Permission:SettingManagement','{}'),('3a12938e-ff25-44ec-09bd-a9368eedd998','FeatureManagement','L:AbpFeatureManagement,Permission:FeatureManagement','{}'),('3a12938e-ff2a-7843-b6f0-a0f43e4de975','AbpTenantManagement','L:AbpTenantManagement,Permission:TenantManagement','{}'),('3a12938e-ff2b-964b-3863-a507a95c9a7e','BookStore','F:BookStore','{}');
/*!40000 ALTER TABLE `abppermissiongroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `abppermissions`
--

DROP TABLE IF EXISTS `abppermissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `abppermissions` (
  `Id` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `GroupName` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ParentName` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `DisplayName` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `IsEnabled` tinyint(1) NOT NULL,
  `MultiTenancySide` tinyint unsigned NOT NULL,
  `Providers` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `StateCheckers` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `ExtraProperties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `IX_AbpPermissions_Name` (`Name`),
  KEY `IX_AbpPermissions_GroupName` (`GroupName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `abppermissions`
--

LOCK TABLES `abppermissions` WRITE;
/*!40000 ALTER TABLE `abppermissions` DISABLE KEYS */;
INSERT INTO `abppermissions` VALUES ('3a12938e-ff1e-80cc-40c7-06095007aaba','AbpIdentity','AbpIdentity.Roles',NULL,'L:AbpIdentity,Permission:RoleManagement',1,3,NULL,NULL,'{}'),('3a12938e-ff25-1b0c-8384-10e20bde2c44','AbpIdentity','AbpIdentity.Roles.ManagePermissions','AbpIdentity.Roles','L:AbpIdentity,Permission:ChangePermissions',1,3,NULL,NULL,'{}'),('3a12938e-ff25-4d8a-c783-276fd2f450e0','AbpIdentity','AbpIdentity.Roles.Create','AbpIdentity.Roles','L:AbpIdentity,Permission:Create',1,3,NULL,NULL,'{}'),('3a12938e-ff25-51b7-a6f1-eb693187f092','AbpIdentity','AbpIdentity.Users.Update','AbpIdentity.Users','L:AbpIdentity,Permission:Edit',1,3,NULL,NULL,'{}'),('3a12938e-ff25-5ecf-ceea-d00030e0bc5c','SettingManagement','SettingManagement.Emailing',NULL,'L:AbpSettingManagement,Permission:Emailing',1,3,NULL,NULL,'{}'),('3a12938e-ff25-6265-f295-2f3c445b2163','AbpIdentity','AbpIdentity.Users.Create','AbpIdentity.Users','L:AbpIdentity,Permission:Create',1,3,NULL,NULL,'{}'),('3a12938e-ff25-6df8-92c9-9452dc696b66','AbpIdentity','AbpIdentity.Users.Delete','AbpIdentity.Users','L:AbpIdentity,Permission:Delete',1,3,NULL,NULL,'{}'),('3a12938e-ff25-8de6-d6f1-086b47fda682','AbpIdentity','AbpIdentity.Users',NULL,'L:AbpIdentity,Permission:UserManagement',1,3,NULL,NULL,'{}'),('3a12938e-ff25-8f68-1642-db403704a939','FeatureManagement','FeatureManagement.ManageHostFeatures',NULL,'L:AbpFeatureManagement,Permission:FeatureManagement.ManageHostFeatures',1,2,NULL,NULL,'{}'),('3a12938e-ff25-aa72-3bf7-e2eac367d626','AbpIdentity','AbpIdentity.Roles.Update','AbpIdentity.Roles','L:AbpIdentity,Permission:Edit',1,3,NULL,NULL,'{}'),('3a12938e-ff25-cdf4-924a-2a6be5895874','AbpIdentity','AbpIdentity.Users.Update.ManageRoles','AbpIdentity.Users','L:AbpIdentity,Permission:ManageRoles',1,3,NULL,NULL,'{}'),('3a12938e-ff25-d05e-d869-777aebbc1443','AbpIdentity','AbpIdentity.Users.ManagePermissions','AbpIdentity.Users','L:AbpIdentity,Permission:ChangePermissions',1,3,NULL,NULL,'{}'),('3a12938e-ff25-e81d-7565-e8a54eb8a882','AbpIdentity','AbpIdentity.UserLookup',NULL,'L:AbpIdentity,Permission:UserLookup',1,3,'C',NULL,'{}'),('3a12938e-ff25-fb02-c88c-963ef2611050','AbpIdentity','AbpIdentity.Roles.Delete','AbpIdentity.Roles','L:AbpIdentity,Permission:Delete',1,3,NULL,NULL,'{}'),('3a12938e-ff2a-2047-baa5-d75bef82f19f','SettingManagement','SettingManagement.Emailing.Test','SettingManagement.Emailing','L:AbpSettingManagement,Permission:EmailingTest',1,3,NULL,NULL,'{}'),('3a12938e-ff2a-2f49-963b-590fcb203703','AbpTenantManagement','AbpTenantManagement.Tenants.Update','AbpTenantManagement.Tenants','L:AbpTenantManagement,Permission:Edit',1,2,NULL,NULL,'{}'),('3a12938e-ff2a-b14d-e048-fdcacc83d3b5','AbpTenantManagement','AbpTenantManagement.Tenants.Create','AbpTenantManagement.Tenants','L:AbpTenantManagement,Permission:Create',1,2,NULL,NULL,'{}'),('3a12938e-ff2a-e030-7858-4c430183014b','AbpTenantManagement','AbpTenantManagement.Tenants',NULL,'L:AbpTenantManagement,Permission:TenantManagement',1,2,NULL,NULL,'{}'),('3a12938e-ff2a-f90e-e7d3-5eeee0a407be','SettingManagement','SettingManagement.TimeZone',NULL,'L:AbpSettingManagement,Permission:TimeZone',1,3,NULL,NULL,'{}'),('3a12938e-ff2b-35ff-6076-d1cbefdb300a','AbpTenantManagement','AbpTenantManagement.Tenants.ManageFeatures','AbpTenantManagement.Tenants','L:AbpTenantManagement,Permission:ManageFeatures',1,2,NULL,NULL,'{}'),('3a12938e-ff2b-9572-f9cf-88f4d838bc96','AbpTenantManagement','AbpTenantManagement.Tenants.Delete','AbpTenantManagement.Tenants','L:AbpTenantManagement,Permission:Delete',1,2,NULL,NULL,'{}'),('3a12938e-ff2b-e2c1-6014-5509c4f381d8','AbpTenantManagement','AbpTenantManagement.Tenants.ManageConnectionStrings','AbpTenantManagement.Tenants','L:AbpTenantManagement,Permission:ManageConnectionStrings',1,2,NULL,NULL,'{}');
/*!40000 ALTER TABLE `abppermissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `abproleclaims`
--

DROP TABLE IF EXISTS `abproleclaims`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `abproleclaims` (
  `Id` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `RoleId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `TenantId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci DEFAULT NULL,
  `ClaimType` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ClaimValue` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `IX_AbpRoleClaims_RoleId` (`RoleId`),
  CONSTRAINT `FK_AbpRoleClaims_AbpRoles_RoleId` FOREIGN KEY (`RoleId`) REFERENCES `abproles` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `abproleclaims`
--

LOCK TABLES `abproleclaims` WRITE;
/*!40000 ALTER TABLE `abproleclaims` DISABLE KEYS */;
/*!40000 ALTER TABLE `abproleclaims` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `abproles`
--

DROP TABLE IF EXISTS `abproles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `abproles` (
  `Id` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `TenantId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci DEFAULT NULL,
  `Name` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `NormalizedName` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `IsDefault` tinyint(1) NOT NULL,
  `IsStatic` tinyint(1) NOT NULL,
  `IsPublic` tinyint(1) NOT NULL,
  `EntityVersion` int NOT NULL,
  `ExtraProperties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ConcurrencyStamp` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `IX_AbpRoles_NormalizedName` (`NormalizedName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `abproles`
--

LOCK TABLES `abproles` WRITE;
/*!40000 ALTER TABLE `abproles` DISABLE KEYS */;
INSERT INTO `abproles` VALUES ('3a12938b-9ace-89ad-eae0-bb7b799ee1df',NULL,'admin','ADMIN',0,1,1,0,'{}','1db46d3a7e0a47b2b19fb2b6f036a0d7');
/*!40000 ALTER TABLE `abproles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `abpsecuritylogs`
--

DROP TABLE IF EXISTS `abpsecuritylogs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `abpsecuritylogs` (
  `Id` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `TenantId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci DEFAULT NULL,
  `ApplicationName` varchar(96) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Identity` varchar(96) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Action` varchar(96) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `UserId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci DEFAULT NULL,
  `UserName` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `TenantName` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `ClientId` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `CorrelationId` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `ClientIpAddress` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `BrowserInfo` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `CreationTime` datetime(6) NOT NULL,
  `ExtraProperties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ConcurrencyStamp` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `IX_AbpSecurityLogs_TenantId_Action` (`TenantId`,`Action`),
  KEY `IX_AbpSecurityLogs_TenantId_ApplicationName` (`TenantId`,`ApplicationName`),
  KEY `IX_AbpSecurityLogs_TenantId_Identity` (`TenantId`,`Identity`),
  KEY `IX_AbpSecurityLogs_TenantId_UserId` (`TenantId`,`UserId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `abpsecuritylogs`
--

LOCK TABLES `abpsecuritylogs` WRITE;
/*!40000 ALTER TABLE `abpsecuritylogs` DISABLE KEYS */;
INSERT INTO `abpsecuritylogs` VALUES ('3a129391-4ab1-b0f8-3930-adabc41def64',NULL,'Acme.BookStore.Web','Identity','LoginSucceeded','3a12938b-95ba-0d29-14bb-3b0125298d63','admin',NULL,NULL,'0ce31c5f7476441183ed9797610b0f4a','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36 Edg/124.0.0.0','2024-05-16 20:33:14.918990','{}','c555d36e97794ae084cee03a784f1638');
/*!40000 ALTER TABLE `abpsecuritylogs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `abpsettingdefinitions`
--

DROP TABLE IF EXISTS `abpsettingdefinitions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `abpsettingdefinitions` (
  `Id` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `Name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `DisplayName` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Description` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `DefaultValue` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `IsVisibleToClients` tinyint(1) NOT NULL,
  `Providers` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `IsInherited` tinyint(1) NOT NULL,
  `IsEncrypted` tinyint(1) NOT NULL,
  `ExtraProperties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `IX_AbpSettingDefinitions_Name` (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `abpsettingdefinitions`
--

LOCK TABLES `abpsettingdefinitions` WRITE;
/*!40000 ALTER TABLE `abpsettingdefinitions` DISABLE KEYS */;
INSERT INTO `abpsettingdefinitions` VALUES ('3a12938e-ffd6-bad1-7f57-43c898378dbe','Abp.Localization.DefaultLanguage','L:AbpLocalization,DisplayName:Abp.Localization.DefaultLanguage','L:AbpLocalization,Description:Abp.Localization.DefaultLanguage','en',1,NULL,1,0,'{}'),('3a12938e-ffda-0478-e15a-1d00a4f6e523','Abp.Identity.User.IsEmailUpdateEnabled','L:AbpIdentity,DisplayName:Abp.Identity.User.IsEmailUpdateEnabled','L:AbpIdentity,Description:Abp.Identity.User.IsEmailUpdateEnabled','True',1,NULL,1,0,'{}'),('3a12938e-ffda-0d91-98e8-1de0532a914b','Abp.Identity.Lockout.MaxFailedAccessAttempts','L:AbpIdentity,DisplayName:Abp.Identity.Lockout.MaxFailedAccessAttempts','L:AbpIdentity,Description:Abp.Identity.Lockout.MaxFailedAccessAttempts','5',1,NULL,1,0,'{}'),('3a12938e-ffda-0f6b-3b3b-ba822800040c','Abp.Mailing.Smtp.Domain','L:AbpEmailing,DisplayName:Abp.Mailing.Smtp.Domain','L:AbpEmailing,Description:Abp.Mailing.Smtp.Domain',NULL,0,NULL,1,0,'{}'),('3a12938e-ffda-100d-84f7-6c88e206af84','Abp.Identity.Password.RequireDigit','L:AbpIdentity,DisplayName:Abp.Identity.Password.RequireDigit','L:AbpIdentity,Description:Abp.Identity.Password.RequireDigit','True',1,NULL,1,0,'{}'),('3a12938e-ffda-2552-3d73-bbc1684ec7d0','Abp.Identity.OrganizationUnit.MaxUserMembershipCount','L:AbpIdentity,Identity.OrganizationUnit.MaxUserMembershipCount','L:AbpIdentity,Identity.OrganizationUnit.MaxUserMembershipCount','2147483647',1,NULL,1,0,'{}'),('3a12938e-ffda-2f7c-a1a6-07e735d01f54','Abp.Mailing.Smtp.UserName','L:AbpEmailing,DisplayName:Abp.Mailing.Smtp.UserName','L:AbpEmailing,Description:Abp.Mailing.Smtp.UserName',NULL,0,NULL,1,0,'{}'),('3a12938e-ffda-32f4-70ac-260f0f1b60bc','Abp.Identity.SignIn.RequireConfirmedEmail','L:AbpIdentity,DisplayName:Abp.Identity.SignIn.RequireConfirmedEmail','L:AbpIdentity,Description:Abp.Identity.SignIn.RequireConfirmedEmail','False',1,NULL,1,0,'{}'),('3a12938e-ffda-372f-f10e-0d80a52fd2be','Abp.Mailing.Smtp.Host','L:AbpEmailing,DisplayName:Abp.Mailing.Smtp.Host','L:AbpEmailing,Description:Abp.Mailing.Smtp.Host','127.0.0.1',0,NULL,1,0,'{}'),('3a12938e-ffda-3caa-fef8-67f22a86e581','Abp.Timing.TimeZone','L:AbpTiming,DisplayName:Abp.Timing.Timezone','L:AbpTiming,Description:Abp.Timing.Timezone','UTC',1,NULL,1,0,'{}'),('3a12938e-ffda-3f16-bfe5-6c0308ecb031','Abp.Identity.Password.RequireNonAlphanumeric','L:AbpIdentity,DisplayName:Abp.Identity.Password.RequireNonAlphanumeric','L:AbpIdentity,Description:Abp.Identity.Password.RequireNonAlphanumeric','True',1,NULL,1,0,'{}'),('3a12938e-ffda-45bb-3700-d3f4531e1718','Abp.Identity.Password.ForceUsersToPeriodicallyChangePassword','L:AbpIdentity,DisplayName:Abp.Identity.Password.ForceUsersToPeriodicallyChangePassword','L:AbpIdentity,Description:Abp.Identity.Password.ForceUsersToPeriodicallyChangePassword','False',1,NULL,1,0,'{}'),('3a12938e-ffda-4909-15a0-61b2c1c16e84','Abp.Identity.Password.PasswordChangePeriodDays','L:AbpIdentity,DisplayName:Abp.Identity.Password.PasswordChangePeriodDays','L:AbpIdentity,Description:Abp.Identity.Password.PasswordChangePeriodDays','0',1,NULL,1,0,'{}'),('3a12938e-ffda-5352-f0cc-c2e7751a3d00','Abp.Identity.SignIn.RequireConfirmedPhoneNumber','L:AbpIdentity,DisplayName:Abp.Identity.SignIn.RequireConfirmedPhoneNumber','L:AbpIdentity,Description:Abp.Identity.SignIn.RequireConfirmedPhoneNumber','False',1,NULL,1,0,'{}'),('3a12938e-ffda-67cb-ed1c-1579e65d34ee','Abp.Identity.Password.RequireUppercase','L:AbpIdentity,DisplayName:Abp.Identity.Password.RequireUppercase','L:AbpIdentity,Description:Abp.Identity.Password.RequireUppercase','True',1,NULL,1,0,'{}'),('3a12938e-ffda-6a0a-f62b-3260effeb949','Abp.Mailing.Smtp.Port','L:AbpEmailing,DisplayName:Abp.Mailing.Smtp.Port','L:AbpEmailing,Description:Abp.Mailing.Smtp.Port','25',0,NULL,1,0,'{}'),('3a12938e-ffda-7f7f-b4c6-76e0661aa4a4','Abp.Mailing.Smtp.Password','L:AbpEmailing,DisplayName:Abp.Mailing.Smtp.Password','L:AbpEmailing,Description:Abp.Mailing.Smtp.Password',NULL,0,NULL,1,1,'{}'),('3a12938e-ffda-8687-1592-6012ae9717cf','Abp.Identity.Lockout.LockoutDuration','L:AbpIdentity,DisplayName:Abp.Identity.Lockout.LockoutDuration','L:AbpIdentity,Description:Abp.Identity.Lockout.LockoutDuration','300',1,NULL,1,0,'{}'),('3a12938e-ffda-a0da-66c0-67ebe1a49826','Abp.Mailing.Smtp.EnableSsl','L:AbpEmailing,DisplayName:Abp.Mailing.Smtp.EnableSsl','L:AbpEmailing,Description:Abp.Mailing.Smtp.EnableSsl','false',0,NULL,1,0,'{}'),('3a12938e-ffda-cf4f-37d3-59ba8b84f831','Abp.Identity.SignIn.EnablePhoneNumberConfirmation','L:AbpIdentity,DisplayName:Abp.Identity.SignIn.EnablePhoneNumberConfirmation','L:AbpIdentity,Description:Abp.Identity.SignIn.EnablePhoneNumberConfirmation','True',1,NULL,1,0,'{}'),('3a12938e-ffda-d018-1928-afac47478501','Abp.Identity.Password.RequiredUniqueChars','L:AbpIdentity,DisplayName:Abp.Identity.Password.RequiredUniqueChars','L:AbpIdentity,Description:Abp.Identity.Password.RequiredUniqueChars','1',1,NULL,1,0,'{}'),('3a12938e-ffda-d30e-ce61-46e446270bc2','Abp.Mailing.DefaultFromAddress','L:AbpEmailing,DisplayName:Abp.Mailing.DefaultFromAddress','L:AbpEmailing,Description:Abp.Mailing.DefaultFromAddress','noreply@abp.io',0,NULL,1,0,'{}'),('3a12938e-ffda-d46d-576b-346743d21745','Abp.Mailing.Smtp.UseDefaultCredentials','L:AbpEmailing,DisplayName:Abp.Mailing.Smtp.UseDefaultCredentials','L:AbpEmailing,Description:Abp.Mailing.Smtp.UseDefaultCredentials','true',0,NULL,1,0,'{}'),('3a12938e-ffda-d637-a751-336166af0942','Abp.Mailing.DefaultFromDisplayName','L:AbpEmailing,DisplayName:Abp.Mailing.DefaultFromDisplayName','L:AbpEmailing,Description:Abp.Mailing.DefaultFromDisplayName','ABP application',0,NULL,1,0,'{}'),('3a12938e-ffda-e188-8528-ee94c3359f5d','Abp.Identity.Lockout.AllowedForNewUsers','L:AbpIdentity,DisplayName:Abp.Identity.Lockout.AllowedForNewUsers','L:AbpIdentity,Description:Abp.Identity.Lockout.AllowedForNewUsers','True',1,NULL,1,0,'{}'),('3a12938e-ffda-e86a-da41-1dc1c0231470','Abp.Identity.User.IsUserNameUpdateEnabled','L:AbpIdentity,DisplayName:Abp.Identity.User.IsUserNameUpdateEnabled','L:AbpIdentity,Description:Abp.Identity.User.IsUserNameUpdateEnabled','True',1,NULL,1,0,'{}'),('3a12938e-ffda-ee61-8f81-65083cdec6c3','Abp.Identity.Password.RequireLowercase','L:AbpIdentity,DisplayName:Abp.Identity.Password.RequireLowercase','L:AbpIdentity,Description:Abp.Identity.Password.RequireLowercase','True',1,NULL,1,0,'{}'),('3a12938e-ffda-f0ee-70e9-8e047f3e6c3a','Abp.Identity.Password.RequiredLength','L:AbpIdentity,DisplayName:Abp.Identity.Password.RequiredLength','L:AbpIdentity,Description:Abp.Identity.Password.RequiredLength','6',1,NULL,1,0,'{}'),('3a12938e-ffdb-7c86-5510-b97a66c1d106','Abp.Account.EnableLocalLogin','L:AbpAccount,DisplayName:Abp.Account.EnableLocalLogin','L:AbpAccount,Description:Abp.Account.EnableLocalLogin','true',1,NULL,1,0,'{}'),('3a12938e-ffdb-a3ad-8564-4e734bcca27f','Abp.Account.IsSelfRegistrationEnabled','L:AbpAccount,DisplayName:Abp.Account.IsSelfRegistrationEnabled','L:AbpAccount,Description:Abp.Account.IsSelfRegistrationEnabled','true',1,NULL,1,0,'{}');
/*!40000 ALTER TABLE `abpsettingdefinitions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `abpsettings`
--

DROP TABLE IF EXISTS `abpsettings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `abpsettings` (
  `Id` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `Name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Value` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ProviderName` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `ProviderKey` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `IX_AbpSettings_Name_ProviderName_ProviderKey` (`Name`,`ProviderName`,`ProviderKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `abpsettings`
--

LOCK TABLES `abpsettings` WRITE;
/*!40000 ALTER TABLE `abpsettings` DISABLE KEYS */;
/*!40000 ALTER TABLE `abpsettings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `abptenantconnectionstrings`
--

DROP TABLE IF EXISTS `abptenantconnectionstrings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `abptenantconnectionstrings` (
  `TenantId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `Name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Value` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`TenantId`,`Name`),
  CONSTRAINT `FK_AbpTenantConnectionStrings_AbpTenants_TenantId` FOREIGN KEY (`TenantId`) REFERENCES `abptenants` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `abptenantconnectionstrings`
--

LOCK TABLES `abptenantconnectionstrings` WRITE;
/*!40000 ALTER TABLE `abptenantconnectionstrings` DISABLE KEYS */;
/*!40000 ALTER TABLE `abptenantconnectionstrings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `abptenants`
--

DROP TABLE IF EXISTS `abptenants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `abptenants` (
  `Id` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `Name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `NormalizedName` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `EntityVersion` int NOT NULL,
  `ExtraProperties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ConcurrencyStamp` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `CreationTime` datetime(6) NOT NULL,
  `CreatorId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci DEFAULT NULL,
  `LastModificationTime` datetime(6) DEFAULT NULL,
  `LastModifierId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci DEFAULT NULL,
  `IsDeleted` tinyint(1) NOT NULL DEFAULT '0',
  `DeleterId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci DEFAULT NULL,
  `DeletionTime` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `IX_AbpTenants_Name` (`Name`),
  KEY `IX_AbpTenants_NormalizedName` (`NormalizedName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `abptenants`
--

LOCK TABLES `abptenants` WRITE;
/*!40000 ALTER TABLE `abptenants` DISABLE KEYS */;
/*!40000 ALTER TABLE `abptenants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `abpuserclaims`
--

DROP TABLE IF EXISTS `abpuserclaims`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `abpuserclaims` (
  `Id` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `UserId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `TenantId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci DEFAULT NULL,
  `ClaimType` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ClaimValue` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `IX_AbpUserClaims_UserId` (`UserId`),
  CONSTRAINT `FK_AbpUserClaims_AbpUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `abpusers` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `abpuserclaims`
--

LOCK TABLES `abpuserclaims` WRITE;
/*!40000 ALTER TABLE `abpuserclaims` DISABLE KEYS */;
/*!40000 ALTER TABLE `abpuserclaims` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `abpuserdelegations`
--

DROP TABLE IF EXISTS `abpuserdelegations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `abpuserdelegations` (
  `Id` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `TenantId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci DEFAULT NULL,
  `SourceUserId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `TargetUserId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `StartTime` datetime(6) NOT NULL,
  `EndTime` datetime(6) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `abpuserdelegations`
--

LOCK TABLES `abpuserdelegations` WRITE;
/*!40000 ALTER TABLE `abpuserdelegations` DISABLE KEYS */;
/*!40000 ALTER TABLE `abpuserdelegations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `abpuserlogins`
--

DROP TABLE IF EXISTS `abpuserlogins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `abpuserlogins` (
  `UserId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `LoginProvider` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `TenantId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci DEFAULT NULL,
  `ProviderKey` varchar(196) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ProviderDisplayName` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`UserId`,`LoginProvider`),
  KEY `IX_AbpUserLogins_LoginProvider_ProviderKey` (`LoginProvider`,`ProviderKey`),
  CONSTRAINT `FK_AbpUserLogins_AbpUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `abpusers` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `abpuserlogins`
--

LOCK TABLES `abpuserlogins` WRITE;
/*!40000 ALTER TABLE `abpuserlogins` DISABLE KEYS */;
/*!40000 ALTER TABLE `abpuserlogins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `abpuserorganizationunits`
--

DROP TABLE IF EXISTS `abpuserorganizationunits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `abpuserorganizationunits` (
  `UserId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `OrganizationUnitId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `TenantId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci DEFAULT NULL,
  `CreationTime` datetime(6) NOT NULL,
  `CreatorId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci DEFAULT NULL,
  PRIMARY KEY (`OrganizationUnitId`,`UserId`),
  KEY `IX_AbpUserOrganizationUnits_UserId_OrganizationUnitId` (`UserId`,`OrganizationUnitId`),
  CONSTRAINT `FK_AbpUserOrganizationUnits_AbpOrganizationUnits_OrganizationUn~` FOREIGN KEY (`OrganizationUnitId`) REFERENCES `abporganizationunits` (`Id`) ON DELETE CASCADE,
  CONSTRAINT `FK_AbpUserOrganizationUnits_AbpUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `abpusers` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `abpuserorganizationunits`
--

LOCK TABLES `abpuserorganizationunits` WRITE;
/*!40000 ALTER TABLE `abpuserorganizationunits` DISABLE KEYS */;
/*!40000 ALTER TABLE `abpuserorganizationunits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `abpuserroles`
--

DROP TABLE IF EXISTS `abpuserroles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `abpuserroles` (
  `UserId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `RoleId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `TenantId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci DEFAULT NULL,
  PRIMARY KEY (`UserId`,`RoleId`),
  KEY `IX_AbpUserRoles_RoleId_UserId` (`RoleId`,`UserId`),
  CONSTRAINT `FK_AbpUserRoles_AbpRoles_RoleId` FOREIGN KEY (`RoleId`) REFERENCES `abproles` (`Id`) ON DELETE CASCADE,
  CONSTRAINT `FK_AbpUserRoles_AbpUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `abpusers` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `abpuserroles`
--

LOCK TABLES `abpuserroles` WRITE;
/*!40000 ALTER TABLE `abpuserroles` DISABLE KEYS */;
INSERT INTO `abpuserroles` VALUES ('3a12938b-95ba-0d29-14bb-3b0125298d63','3a12938b-9ace-89ad-eae0-bb7b799ee1df',NULL);
/*!40000 ALTER TABLE `abpuserroles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `abpusers`
--

DROP TABLE IF EXISTS `abpusers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `abpusers` (
  `Id` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `TenantId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci DEFAULT NULL,
  `UserName` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `NormalizedUserName` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Surname` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Email` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `NormalizedEmail` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `EmailConfirmed` tinyint(1) NOT NULL DEFAULT '0',
  `PasswordHash` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `SecurityStamp` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `IsExternal` tinyint(1) NOT NULL DEFAULT '0',
  `PhoneNumber` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `PhoneNumberConfirmed` tinyint(1) NOT NULL DEFAULT '0',
  `IsActive` tinyint(1) NOT NULL,
  `TwoFactorEnabled` tinyint(1) NOT NULL DEFAULT '0',
  `LockoutEnd` datetime(6) DEFAULT NULL,
  `LockoutEnabled` tinyint(1) NOT NULL DEFAULT '0',
  `AccessFailedCount` int NOT NULL DEFAULT '0',
  `ShouldChangePasswordOnNextLogin` tinyint(1) NOT NULL,
  `EntityVersion` int NOT NULL,
  `LastPasswordChangeTime` datetime(6) DEFAULT NULL,
  `ExtraProperties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ConcurrencyStamp` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `CreationTime` datetime(6) NOT NULL,
  `CreatorId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci DEFAULT NULL,
  `LastModificationTime` datetime(6) DEFAULT NULL,
  `LastModifierId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci DEFAULT NULL,
  `IsDeleted` tinyint(1) NOT NULL DEFAULT '0',
  `DeleterId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci DEFAULT NULL,
  `DeletionTime` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `IX_AbpUsers_Email` (`Email`),
  KEY `IX_AbpUsers_NormalizedEmail` (`NormalizedEmail`),
  KEY `IX_AbpUsers_NormalizedUserName` (`NormalizedUserName`),
  KEY `IX_AbpUsers_UserName` (`UserName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `abpusers`
--

LOCK TABLES `abpusers` WRITE;
/*!40000 ALTER TABLE `abpusers` DISABLE KEYS */;
INSERT INTO `abpusers` VALUES ('3a12938b-95ba-0d29-14bb-3b0125298d63',NULL,'admin','ADMIN','admin',NULL,'admin@abp.io','ADMIN@ABP.IO',0,'AQAAAAIAAYagAAAAEKE7xS4BdfiYvP23b85gkfZ6Q6Gz6KpWqnhN4awROQ6FnrM8IERBTPiugMgS91Sewg==','MSYFQB7GY4PRJIB7GWNE54IRDDN3PSAT',0,NULL,0,1,0,NULL,1,0,0,0,'2024-05-16 12:27:01.156830','{}','68d59c707f23404fbeb03c6f39f55c60','2024-05-16 20:27:01.518179',NULL,NULL,NULL,0,NULL,NULL);
/*!40000 ALTER TABLE `abpusers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `abpusertokens`
--

DROP TABLE IF EXISTS `abpusertokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `abpusertokens` (
  `UserId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `LoginProvider` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `TenantId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci DEFAULT NULL,
  `Value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  PRIMARY KEY (`UserId`,`LoginProvider`,`Name`),
  CONSTRAINT `FK_AbpUserTokens_AbpUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `abpusers` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `abpusertokens`
--

LOCK TABLES `abpusertokens` WRITE;
/*!40000 ALTER TABLE `abpusertokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `abpusertokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appbooks`
--

DROP TABLE IF EXISTS `appbooks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appbooks` (
  `Id` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `Name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Type` int NOT NULL,
  `PublishDate` datetime(6) NOT NULL,
  `Price` float NOT NULL,
  `ExtraProperties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ConcurrencyStamp` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `CreationTime` datetime(6) NOT NULL,
  `CreatorId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci DEFAULT NULL,
  `LastModificationTime` datetime(6) DEFAULT NULL,
  `LastModifierId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appbooks`
--

LOCK TABLES `appbooks` WRITE;
/*!40000 ALTER TABLE `appbooks` DISABLE KEYS */;
INSERT INTO `appbooks` VALUES ('3a1293a9-4f54-470b-ea3c-5d8758bbc00a','1984',3,'1949-06-08 00:00:00.000000',19.84,'{}','a235eecb681f4519b28bec73ef6d8657','2024-05-16 20:59:29.033457',NULL,NULL,NULL),('3a1293a9-515d-235b-530a-ca96b888e993','The Hitchhiker\'s Guide to the Galaxy',7,'1995-09-27 00:00:00.000000',42,'{}','04c526a16ac4401d8a90c339f105ee92','2024-05-16 20:59:29.502945',NULL,NULL,NULL);
/*!40000 ALTER TABLE `appbooks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `openiddictapplications`
--

DROP TABLE IF EXISTS `openiddictapplications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `openiddictapplications` (
  `Id` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `ApplicationType` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `ClientId` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `ClientSecret` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `ClientType` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `ConsentType` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `DisplayName` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `DisplayNames` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `JsonWebKeySet` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `Permissions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `PostLogoutRedirectUris` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `Properties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `RedirectUris` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `Requirements` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `Settings` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `ClientUri` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `LogoUri` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `ExtraProperties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ConcurrencyStamp` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `CreationTime` datetime(6) NOT NULL,
  `CreatorId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci DEFAULT NULL,
  `LastModificationTime` datetime(6) DEFAULT NULL,
  `LastModifierId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci DEFAULT NULL,
  `IsDeleted` tinyint(1) NOT NULL DEFAULT '0',
  `DeleterId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci DEFAULT NULL,
  `DeletionTime` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `IX_OpenIddictApplications_ClientId` (`ClientId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `openiddictapplications`
--

LOCK TABLES `openiddictapplications` WRITE;
/*!40000 ALTER TABLE `openiddictapplications` DISABLE KEYS */;
INSERT INTO `openiddictapplications` VALUES ('3a12938b-a147-7d8d-3735-308d12d3bb72',NULL,'BookStore_Web','AQAAAAEAACcQAAAAEEcwsj7UvA/g+SGe6QOdUhiXDBkq8BVBpXB0efkB2XQlsavu9GMlIrYVHAKbp3J1BA==','confidential','implicit','Web Application',NULL,NULL,'[\"rst:code id_token\",\"ept:logout\",\"gt:authorization_code\",\"rst:code\",\"ept:authorization\",\"ept:token\",\"ept:revocation\",\"ept:introspection\",\"gt:implicit\",\"rst:id_token\",\"scp:address\",\"scp:email\",\"scp:phone\",\"scp:profile\",\"scp:roles\",\"scp:BookStore\"]','[\"https://localhost:44354/signout-callback-oidc\"]',NULL,'[\"https://localhost:44354/signin-oidc\"]',NULL,NULL,'https://localhost:44354/',NULL,'{}','ca6a7f0cdd4f45e79b60731cf0f00d11','2024-05-16 20:27:04.039704',NULL,NULL,NULL,0,NULL,NULL),('3a12938b-a239-071c-8909-89b5e962b6c6',NULL,'BookStore_Swagger',NULL,'public','implicit','Swagger Application',NULL,NULL,'[\"ept:logout\",\"gt:authorization_code\",\"rst:code\",\"ept:authorization\",\"ept:token\",\"ept:revocation\",\"ept:introspection\",\"scp:address\",\"scp:email\",\"scp:phone\",\"scp:profile\",\"scp:roles\",\"scp:BookStore\"]',NULL,NULL,'[\"https://localhost:44358/swagger/oauth2-redirect.html\"]',NULL,NULL,'https://localhost:44358',NULL,'{}','addacee92cbb4c399df1e693bc2749ac','2024-05-16 20:27:04.124497',NULL,NULL,NULL,0,NULL,NULL);
/*!40000 ALTER TABLE `openiddictapplications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `openiddictauthorizations`
--

DROP TABLE IF EXISTS `openiddictauthorizations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `openiddictauthorizations` (
  `Id` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `ApplicationId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci DEFAULT NULL,
  `CreationDate` datetime(6) DEFAULT NULL,
  `Properties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `Scopes` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `Status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Subject` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `ExtraProperties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ConcurrencyStamp` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `CreationTime` datetime(6) NOT NULL,
  `CreatorId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci DEFAULT NULL,
  `LastModificationTime` datetime(6) DEFAULT NULL,
  `LastModifierId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci DEFAULT NULL,
  `IsDeleted` tinyint(1) NOT NULL DEFAULT '0',
  `DeleterId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci DEFAULT NULL,
  `DeletionTime` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `IX_OpenIddictAuthorizations_ApplicationId_Status_Subject_Type` (`ApplicationId`,`Status`,`Subject`,`Type`),
  CONSTRAINT `FK_OpenIddictAuthorizations_OpenIddictApplications_ApplicationId` FOREIGN KEY (`ApplicationId`) REFERENCES `openiddictapplications` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `openiddictauthorizations`
--

LOCK TABLES `openiddictauthorizations` WRITE;
/*!40000 ALTER TABLE `openiddictauthorizations` DISABLE KEYS */;
/*!40000 ALTER TABLE `openiddictauthorizations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `openiddictscopes`
--

DROP TABLE IF EXISTS `openiddictscopes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `openiddictscopes` (
  `Id` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `Description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `Descriptions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `DisplayName` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `DisplayNames` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `Name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Properties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `Resources` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `ExtraProperties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ConcurrencyStamp` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `CreationTime` datetime(6) NOT NULL,
  `CreatorId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci DEFAULT NULL,
  `LastModificationTime` datetime(6) DEFAULT NULL,
  `LastModifierId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci DEFAULT NULL,
  `IsDeleted` tinyint(1) NOT NULL DEFAULT '0',
  `DeleterId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci DEFAULT NULL,
  `DeletionTime` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `IX_OpenIddictScopes_Name` (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `openiddictscopes`
--

LOCK TABLES `openiddictscopes` WRITE;
/*!40000 ALTER TABLE `openiddictscopes` DISABLE KEYS */;
INSERT INTO `openiddictscopes` VALUES ('3a12938b-a03f-8500-96cb-5332507ca811',NULL,NULL,'BookStore API',NULL,'BookStore',NULL,'[\"BookStore\"]','{}','b6250e2beebc451aa6ee9bdcf47dc9ce','2024-05-16 20:27:03.708242',NULL,NULL,NULL,0,NULL,NULL);
/*!40000 ALTER TABLE `openiddictscopes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `openiddicttokens`
--

DROP TABLE IF EXISTS `openiddicttokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `openiddicttokens` (
  `Id` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `ApplicationId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci DEFAULT NULL,
  `AuthorizationId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci DEFAULT NULL,
  `CreationDate` datetime(6) DEFAULT NULL,
  `ExpirationDate` datetime(6) DEFAULT NULL,
  `Payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `Properties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `RedemptionDate` datetime(6) DEFAULT NULL,
  `ReferenceId` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Subject` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `ExtraProperties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ConcurrencyStamp` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `CreationTime` datetime(6) NOT NULL,
  `CreatorId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci DEFAULT NULL,
  `LastModificationTime` datetime(6) DEFAULT NULL,
  `LastModifierId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci DEFAULT NULL,
  `IsDeleted` tinyint(1) NOT NULL DEFAULT '0',
  `DeleterId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci DEFAULT NULL,
  `DeletionTime` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `IX_OpenIddictTokens_ApplicationId_Status_Subject_Type` (`ApplicationId`,`Status`,`Subject`,`Type`),
  KEY `IX_OpenIddictTokens_AuthorizationId` (`AuthorizationId`),
  KEY `IX_OpenIddictTokens_ReferenceId` (`ReferenceId`),
  CONSTRAINT `FK_OpenIddictTokens_OpenIddictApplications_ApplicationId` FOREIGN KEY (`ApplicationId`) REFERENCES `openiddictapplications` (`Id`),
  CONSTRAINT `FK_OpenIddictTokens_OpenIddictAuthorizations_AuthorizationId` FOREIGN KEY (`AuthorizationId`) REFERENCES `openiddictauthorizations` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `openiddicttokens`
--

LOCK TABLES `openiddicttokens` WRITE;
/*!40000 ALTER TABLE `openiddicttokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `openiddicttokens` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-17  6:31:56
