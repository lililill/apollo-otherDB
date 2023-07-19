-- "public"."AccessKey" definition

-- Drop table

-- DROP TABLE "public"."AccessKey";

CREATE TABLE "public"."AccessKey" (
	"Id" bigint AUTO_INCREMENT,
	"AppId" character varying(500 char) NOT NULL DEFAULT 'default'::varchar,
	"Secret" character varying(128 char) NOT NULL DEFAULT NULL::varchar,
	"IsEnabled" integer NOT NULL DEFAULT 0,
	"IsDeleted" integer NOT NULL DEFAULT 0,
	"DeletedAt" bigint NOT NULL DEFAULT 0,
	"DataChange_CreatedBy" character varying(64 char) NOT NULL DEFAULT 'default'::varchar,
	"DataChange_CreatedTime" timestamp(0) without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
	"DataChange_LastModifiedBy" character varying(64 char) NULL DEFAULT NULL::varchar,
	"DataChange_LastTime" timestamp(0) without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT "PRIMARY_CDB19436" PRIMARY KEY (Id),
	CONSTRAINT "UK_AppId_Secret_DeletedAt_5E6B3CBD" UNIQUE (AppId, Secret, DeletedAt)
);
CREATE INDEX DataChange_LastTime_743FB260 ON public.AccessKey USING btree (DataChange_LastTime);


-- "public"."App" definition

-- Drop table

-- DROP TABLE "public"."App";

CREATE TABLE "public"."App" (
	"Id" bigint AUTO_INCREMENT,
	"AppId" character varying(500 char) NOT NULL DEFAULT 'default'::varchar,
	"Name" character varying(500 char) NOT NULL DEFAULT 'default'::varchar,
	"OrgId" character varying(32 char) NOT NULL DEFAULT 'default'::varchar,
	"OrgName" character varying(64 char) NOT NULL DEFAULT 'default'::varchar,
	"OwnerName" character varying(500 char) NOT NULL DEFAULT 'default'::varchar,
	"OwnerEmail" character varying(500 char) NOT NULL DEFAULT 'default'::varchar,
	"IsDeleted" integer NOT NULL DEFAULT 0,
	"DeletedAt" bigint NOT NULL DEFAULT 0,
	"DataChange_CreatedBy" character varying(64 char) NOT NULL DEFAULT 'default'::varchar,
	"DataChange_CreatedTime" timestamp(0) without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
	"DataChange_LastModifiedBy" character varying(64 char) NULL DEFAULT NULL::varchar,
	"DataChange_LastTime" timestamp(0) without time zone NULL DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT "PRIMARY_E21D63FC" PRIMARY KEY (Id),
	CONSTRAINT "UK_AppId_DeletedAt_3DEBF313" UNIQUE (AppId, DeletedAt)
);
CREATE INDEX DataChange_LastTime_C007005A ON public.App USING btree (DataChange_LastTime);
CREATE INDEX IX_Name_EB95B6C ON public.App USING btree (Name);


-- "public"."AppNamespace" definition

-- Drop table

-- DROP TABLE "public"."AppNamespace";

CREATE TABLE "public"."AppNamespace" (
	"Id" bigint AUTO_INCREMENT,
	"Name" character varying(32 char) NOT NULL DEFAULT NULL::varchar,
	"AppId" character varying(64 char) NOT NULL DEFAULT NULL::varchar,
	"Format" character varying(32 char) NOT NULL DEFAULT 'properties'::varchar,
	"IsPublic" integer NOT NULL DEFAULT 0,
	"Comment" character varying(64 char) NOT NULL DEFAULT NULL::varchar,
	"IsDeleted" integer NOT NULL DEFAULT 0,
	"DeletedAt" bigint NOT NULL DEFAULT 0,
	"DataChange_CreatedBy" character varying(64 char) NOT NULL DEFAULT 'default'::varchar,
	"DataChange_CreatedTime" timestamp(0) without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
	"DataChange_LastModifiedBy" character varying(64 char) NULL DEFAULT NULL::varchar,
	"DataChange_LastTime" timestamp(0) without time zone NULL DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT "PRIMARY_9906B455" PRIMARY KEY (Id),
	CONSTRAINT "UK_AppId_Name_DeletedAt_DE2CC392" UNIQUE (AppId, Name, DeletedAt)
);
CREATE INDEX DataChange_LastTime_2F675AA1 ON public.AppNamespace USING btree (DataChange_LastTime);
CREATE INDEX Name_AppId_B47ED639 ON public.AppNamespace USING btree (Name, AppId);


-- "public"."Audit" definition

-- Drop table

-- DROP TABLE "public"."Audit";

CREATE TABLE "public"."Audit" (
	"Id" bigint AUTO_INCREMENT,
	"EntityName" character varying(50 char) NOT NULL DEFAULT 'default'::varchar,
	"EntityId" bigint NULL,
	"OpName" character varying(50 char) NOT NULL DEFAULT 'default'::varchar,
	"Comment" character varying(500 char) NULL,
	"IsDeleted" integer NOT NULL DEFAULT 0,
	"DeletedAt" bigint NOT NULL DEFAULT 0,
	"DataChange_CreatedBy" character varying(64 char) NOT NULL DEFAULT 'default'::varchar,
	"DataChange_CreatedTime" timestamp(0) without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
	"DataChange_LastModifiedBy" character varying(64 char) NULL DEFAULT NULL::varchar,
	"DataChange_LastTime" timestamp(0) without time zone NULL DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT "PRIMARY_F2E059B6" PRIMARY KEY (Id)
);
CREATE INDEX DataChange_LastTime_7C38DCE0 ON public.Audit USING btree (DataChange_LastTime);


-- "public"."Cluster" definition

-- Drop table

-- DROP TABLE "public"."Cluster";

CREATE TABLE "public"."Cluster" (
	"Id" bigint AUTO_INCREMENT,
	"Name" character varying(32 char) NOT NULL DEFAULT NULL::varchar,
	"AppId" character varying(64 char) NOT NULL DEFAULT NULL::varchar,
	"ParentClusterId" bigint NOT NULL DEFAULT 0,
	"IsDeleted" integer NOT NULL DEFAULT 0,
	"DeletedAt" bigint NOT NULL DEFAULT 0,
	"DataChange_CreatedBy" character varying(64 char) NOT NULL DEFAULT 'default'::varchar,
	"DataChange_CreatedTime" timestamp(0) without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
	"DataChange_LastModifiedBy" character varying(64 char) NULL DEFAULT NULL::varchar,
	"DataChange_LastTime" timestamp(0) without time zone NULL DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT "PRIMARY_51F39D5" PRIMARY KEY (Id),
	CONSTRAINT "UK_AppId_Name_DeletedAt_4C43E912" UNIQUE (AppId, Name, DeletedAt)
);
CREATE INDEX DataChange_LastTime_65CEC521 ON public.Cluster USING btree (DataChange_LastTime);
CREATE INDEX IX_ParentClusterId_7248B867 ON public.Cluster USING btree (ParentClusterId);


-- "public"."Commit" definition

-- Drop table

-- DROP TABLE "public"."Commit";

CREATE TABLE "public"."Commit" (
	"Id" bigint AUTO_INCREMENT,
	"ChangeSets" text NOT NULL,
	"AppId" character varying(500 char) NOT NULL DEFAULT 'default'::varchar,
	"ClusterName" character varying(500 char) NOT NULL DEFAULT 'default'::varchar,
	"NamespaceName" character varying(500 char) NOT NULL DEFAULT 'default'::varchar,
	"Comment" character varying(500 char) NULL,
	"IsDeleted" integer NOT NULL DEFAULT 0,
	"DeletedAt" bigint NOT NULL DEFAULT 0,
	"DataChange_CreatedBy" character varying(64 char) NOT NULL DEFAULT 'default'::varchar,
	"DataChange_CreatedTime" timestamp(0) without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
	"DataChange_LastModifiedBy" character varying(64 char) NULL DEFAULT NULL::varchar,
	"DataChange_LastTime" timestamp(0) without time zone NULL DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT "PRIMARY_694B0B52" PRIMARY KEY (Id)
);
CREATE INDEX AppId_EDCE3B24 ON public.Commit USING btree (AppId);
CREATE INDEX ClusterName_5E2E5644 ON public.Commit USING btree (ClusterName);
CREATE INDEX DataChange_LastTime_A1F060C4 ON public.Commit USING btree (DataChange_LastTime);
CREATE INDEX NamespaceName_6E25E6E4 ON public.Commit USING btree (NamespaceName);


-- "public"."GrayReleaseRule" definition

-- Drop table

-- DROP TABLE "public"."GrayReleaseRule";

CREATE TABLE "public"."GrayReleaseRule" (
	"Id" bigint AUTO_INCREMENT,
	"AppId" character varying(64 char) NOT NULL DEFAULT 'default'::varchar,
	"ClusterName" character varying(32 char) NOT NULL DEFAULT 'default'::varchar,
	"NamespaceName" character varying(32 char) NOT NULL DEFAULT 'default'::varchar,
	"BranchName" character varying(32 char) NOT NULL DEFAULT 'default'::varchar,
	"Rules" text NULL DEFAULT '[]'::text,
	"ReleaseId" bigint NOT NULL DEFAULT 0,
	"BranchStatus" integer NULL DEFAULT 1,
	"IsDeleted" integer NOT NULL DEFAULT 0,
	"DeletedAt" bigint NOT NULL DEFAULT 0,
	"DataChange_CreatedBy" character varying(64 char) NOT NULL DEFAULT 'default'::varchar,
	"DataChange_CreatedTime" timestamp(0) without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
	"DataChange_LastModifiedBy" character varying(64 char) NULL DEFAULT NULL::varchar,
	"DataChange_LastTime" timestamp(0) without time zone NULL DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT "PRIMARY_AF6BA51B" PRIMARY KEY (Id)
);
CREATE INDEX DataChange_LastTime_49F5279B ON public.GrayReleaseRule USING btree (DataChange_LastTime);
CREATE INDEX IX_Namespace_7EE2727B ON public.GrayReleaseRule USING btree (AppId, ClusterName, NamespaceName);


-- "public"."Instance" definition

-- Drop table

-- DROP TABLE "public"."Instance";

CREATE TABLE "public"."Instance" (
	"Id" bigint AUTO_INCREMENT,
	"AppId" character varying(64 char) NOT NULL DEFAULT 'default'::varchar,
	"ClusterName" character varying(32 char) NOT NULL DEFAULT 'default'::varchar,
	"DataCenter" character varying(64 char) NOT NULL DEFAULT 'default'::varchar,
	"Ip" character varying(32 char) NOT NULL DEFAULT NULL::varchar,
	"DataChange_CreatedTime" timestamp(0) without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
	"DataChange_LastTime" timestamp(0) without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT "IX_UNIQUE_KEY_2550120B" UNIQUE (AppId, ClusterName, Ip, DataCenter),
	CONSTRAINT "PRIMARY_3BD172B0" PRIMARY KEY (Id)
);
CREATE INDEX IX_DataChange_LastTime_BB5FB862 ON public.Instance USING btree (DataChange_LastTime);
CREATE INDEX IX_IP_E0B74CF8 ON public.Instance USING btree (Ip);


-- "public"."InstanceConfig" definition

-- Drop table

-- DROP TABLE "public"."InstanceConfig";

CREATE TABLE "public"."InstanceConfig" (
	"Id" bigint AUTO_INCREMENT,
	"InstanceId" bigint NULL,
	"ConfigAppId" character varying(64 char) NOT NULL DEFAULT 'default'::varchar,
	"ConfigClusterName" character varying(32 char) NOT NULL DEFAULT 'default'::varchar,
	"ConfigNamespaceName" character varying(32 char) NOT NULL DEFAULT 'default'::varchar,
	"ReleaseKey" character varying(64 char) NOT NULL DEFAULT NULL::varchar,
	"ReleaseDeliveryTime" timestamp(0) without time zone NULL,
	"DataChange_CreatedTime" timestamp(0) without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
	"DataChange_LastTime" timestamp(0) without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT "IX_UNIQUE_KEY_C15CA8A1" UNIQUE (InstanceId, ConfigAppId, ConfigNamespaceName),
	CONSTRAINT "PRIMARY_EB1C4252" PRIMARY KEY (Id)
);
CREATE INDEX IX_DataChange_LastTime_D6338004 ON public.InstanceConfig USING btree (DataChange_LastTime);
CREATE INDEX IX_ReleaseKey_DC9F17BC ON public.InstanceConfig USING btree (ReleaseKey);
CREATE INDEX IX_Valid_Namespace_CE304898 ON public.InstanceConfig USING btree (ConfigAppId, ConfigClusterName, ConfigNamespaceName, DataChange_LastTime);


-- "public"."Item" definition

-- Drop table

-- DROP TABLE "public"."Item";

CREATE TABLE "public"."Item" (
	"Id" bigint AUTO_INCREMENT,
	"NamespaceId" bigint NOT NULL DEFAULT 0,
	"Key" character varying(128 char) NOT NULL DEFAULT 'default'::varchar,
	"Value" text NOT NULL,
	"Comment" character varying(1024 char) NULL DEFAULT NULL::varchar,
	"LineNum" bigint NULL DEFAULT 0,
	"IsDeleted" integer NOT NULL DEFAULT 0,
	"DeletedAt" bigint NOT NULL DEFAULT 0,
	"DataChange_CreatedBy" character varying(64 char) NOT NULL DEFAULT 'default'::varchar,
	"DataChange_CreatedTime" timestamp(0) without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
	"DataChange_LastModifiedBy" character varying(64 char) NULL DEFAULT NULL::varchar,
	"DataChange_LastTime" timestamp(0) without time zone NULL DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT "PRIMARY_83F2AD2E" PRIMARY KEY (Id)
);
CREATE INDEX DataChange_LastTime_E8FBDC68 ON public.Item USING btree (DataChange_LastTime);
CREATE INDEX IX_GroupId_71BF7EDC ON public.Item USING btree (NamespaceId);


-- "public"."Namespace" definition

-- Drop table

-- DROP TABLE "public"."Namespace";

CREATE TABLE "public"."Namespace" (
	"Id" bigint AUTO_INCREMENT,
	"AppId" character varying(500 char) NOT NULL DEFAULT 'default'::varchar,
	"ClusterName" character varying(500 char) NOT NULL DEFAULT 'default'::varchar,
	"NamespaceName" character varying(500 char) NOT NULL DEFAULT 'default'::varchar,
	"IsDeleted" integer NOT NULL DEFAULT 0,
	"DeletedAt" bigint NOT NULL DEFAULT 0,
	"DataChange_CreatedBy" character varying(64 char) NOT NULL DEFAULT 'default'::varchar,
	"DataChange_CreatedTime" timestamp(0) without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
	"DataChange_LastModifiedBy" character varying(64 char) NULL DEFAULT NULL::varchar,
	"DataChange_LastTime" timestamp(0) without time zone NULL DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT "PRIMARY_91682336" PRIMARY KEY (Id),
	CONSTRAINT "UK_AppId_ClusterName_NamespaceName_DeletedAt_DD5" UNIQUE (AppId, ClusterName, NamespaceName, DeletedAt)
);
CREATE INDEX DataChange_LastTime_8278360 ON public.Namespace USING btree (DataChange_LastTime);
CREATE INDEX IX_NamespaceName_B2846D08 ON public.Namespace USING btree (NamespaceName);


-- "public"."NamespaceLock" definition

-- Drop table

-- DROP TABLE "public"."NamespaceLock";

CREATE TABLE "public"."NamespaceLock" (
	"Id" bigint AUTO_INCREMENT,
	"NamespaceId" bigint NOT NULL DEFAULT 0,
	"DataChange_CreatedBy" character varying(64 char) NOT NULL DEFAULT 'default'::varchar,
	"DataChange_CreatedTime" timestamp(0) without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
	"DataChange_LastModifiedBy" character varying(64 char) NULL DEFAULT NULL::varchar,
	"DataChange_LastTime" timestamp(0) without time zone NULL DEFAULT CURRENT_TIMESTAMP,
	"IsDeleted" integer NULL DEFAULT 0,
	"DeletedAt" bigint NOT NULL DEFAULT 0,
	CONSTRAINT "PRIMARY_C1165101" PRIMARY KEY (Id),
	CONSTRAINT "UK_NamespaceId_DeletedAt_8CE3CD98" UNIQUE (NamespaceId, DeletedAt)
);
CREATE INDEX DataChange_LastTime_C2508D75 ON public.NamespaceLock USING btree (DataChange_LastTime);


-- "public"."Release" definition

-- Drop table

-- DROP TABLE "public"."Release";

CREATE TABLE "public"."Release" (
	"Id" bigint AUTO_INCREMENT,
	"ReleaseKey" character varying(64 char) NOT NULL DEFAULT NULL::varchar,
	"Name" character varying(64 char) NOT NULL DEFAULT 'default'::varchar,
	"Comment" character varying(256 char) NULL,
	"AppId" character varying(500 char) NOT NULL DEFAULT 'default'::varchar,
	"ClusterName" character varying(500 char) NOT NULL DEFAULT 'default'::varchar,
	"NamespaceName" character varying(500 char) NOT NULL DEFAULT 'default'::varchar,
	"Configurations" text NOT NULL,
	"IsAbandoned" integer NOT NULL DEFAULT 0,
	"IsDeleted" integer NOT NULL DEFAULT 0,
	"DeletedAt" bigint NOT NULL DEFAULT 0,
	"DataChange_CreatedBy" character varying(64 char) NOT NULL DEFAULT 'default'::varchar,
	"DataChange_CreatedTime" timestamp(0) without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
	"DataChange_LastModifiedBy" character varying(64 char) NULL DEFAULT NULL::varchar,
	"DataChange_LastTime" timestamp(0) without time zone NULL DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT "PRIMARY_F7D995E2" PRIMARY KEY (Id),
	CONSTRAINT "UK_ReleaseKey_DeletedAt_F480B233" UNIQUE (ReleaseKey, DeletedAt)
);
CREATE INDEX AppId_ClusterName_GroupName_61CE7C50 ON public.Release USING btree (AppId, ClusterName, NamespaceName);
CREATE INDEX DataChange_LastTime_7BC6A034 ON public.Release USING btree (DataChange_LastTime);


-- "public"."ReleaseHistory" definition

-- Drop table

-- DROP TABLE "public"."ReleaseHistory";

CREATE TABLE "public"."ReleaseHistory" (
	"Id" bigint AUTO_INCREMENT,
	"AppId" character varying(64 char) NOT NULL DEFAULT 'default'::varchar,
	"ClusterName" character varying(32 char) NOT NULL DEFAULT 'default'::varchar,
	"NamespaceName" character varying(32 char) NOT NULL DEFAULT 'default'::varchar,
	"BranchName" character varying(32 char) NOT NULL DEFAULT 'default'::varchar,
	"ReleaseId" bigint NOT NULL DEFAULT 0,
	"PreviousReleaseId" bigint NOT NULL DEFAULT 0,
	"Operation" smallint NOT NULL DEFAULT 0,
	"OperationContext" text NOT NULL,
	"IsDeleted" integer NOT NULL DEFAULT 0,
	"DeletedAt" bigint NOT NULL DEFAULT 0,
	"DataChange_CreatedBy" character varying(64 char) NOT NULL DEFAULT 'default'::varchar,
	"DataChange_CreatedTime" timestamp(0) without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
	"DataChange_LastModifiedBy" character varying(64 char) NULL DEFAULT NULL::varchar,
	"DataChange_LastTime" timestamp(0) without time zone NULL DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT "PRIMARY_1956E4A8" PRIMARY KEY (Id)
);
CREATE INDEX IX_DataChange_LastTime_67DF4A5A ON public.ReleaseHistory USING btree (DataChange_LastTime);
CREATE INDEX IX_Namespace_7002504 ON public.ReleaseHistory USING btree (AppId, ClusterName, NamespaceName, BranchName);
CREATE INDEX IX_ReleaseId_4FF892FA ON public.ReleaseHistory USING btree (ReleaseId);


-- "public"."ReleaseMessage" definition

-- Drop table

-- DROP TABLE "public"."ReleaseMessage";

CREATE TABLE "public"."ReleaseMessage" (
	"Id" bigint AUTO_INCREMENT,
	"Message" character varying(1024 char) NOT NULL DEFAULT NULL::varchar,
	"DataChange_LastTime" timestamp(0) without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT "PRIMARY_8BBABA1B" PRIMARY KEY (Id)
);
CREATE INDEX DataChange_LastTime_E1A329B ON public.ReleaseMessage USING btree (DataChange_LastTime);
CREATE INDEX IX_Message_BD8E7B2D ON public.ReleaseMessage USING btree (Message);


-- "public"."ServerConfig" definition

-- Drop table

-- DROP TABLE "public"."ServerConfig";

CREATE TABLE "public"."ServerConfig" (
	"Id" bigint AUTO_INCREMENT,
	"Key" character varying(64 char) NOT NULL DEFAULT 'default'::varchar,
	"Cluster" character varying(32 char) NOT NULL DEFAULT 'default'::varchar,
	"Value" character varying(2048 char) NOT NULL DEFAULT 'default'::varchar,
	"Comment" character varying(1024 char) NULL DEFAULT NULL::varchar,
	"IsDeleted" integer NOT NULL DEFAULT 0,
	"DeletedAt" bigint NOT NULL DEFAULT 0,
	"DataChange_CreatedBy" character varying(64 char) NOT NULL DEFAULT 'default'::varchar,
	"DataChange_CreatedTime" timestamp(0) without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
	"DataChange_LastModifiedBy" character varying(64 char) NULL DEFAULT NULL::varchar,
	"DataChange_LastTime" timestamp(0) without time zone NULL DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT "PRIMARY_81230E80" PRIMARY KEY (Id),
	CONSTRAINT "UK_Key_Cluster_DeletedAt_63B6F937" UNIQUE (Key, Cluster, DeletedAt)
);
CREATE INDEX DataChange_LastTime_DE221456 ON public.ServerConfig USING btree (DataChange_LastTime);



INSERT INTO "public"."AccessKey"
("AppId", "Secret", "IsEnabled", "IsDeleted", "DeletedAt", "DataChange_CreatedBy", "DataChange_CreatedTime", "DataChange_LastModifiedBy", "DataChange_LastTime")
VALUES('default'::varchar, NULL::varchar, 0, 0, 0, 'default'::varchar, CURRENT_TIMESTAMP, NULL::varchar, CURRENT_TIMESTAMP);
INSERT INTO "public"."App"
("AppId", "Name", "OrgId", "OrgName", "OwnerName", "OwnerEmail", "IsDeleted", "DeletedAt", "DataChange_CreatedBy", "DataChange_CreatedTime", "DataChange_LastModifiedBy", "DataChange_LastTime")
VALUES('default'::varchar, 'default'::varchar, 'default'::varchar, 'default'::varchar, 'default'::varchar, 'default'::varchar, 0, 0, 'default'::varchar, CURRENT_TIMESTAMP, NULL::varchar, CURRENT_TIMESTAMP);
INSERT INTO "public"."AppNamespace"
("Name", "AppId", "Format", "IsPublic", "Comment", "IsDeleted", "DeletedAt", "DataChange_CreatedBy", "DataChange_CreatedTime", "DataChange_LastModifiedBy", "DataChange_LastTime")
VALUES(NULL::varchar, NULL::varchar, 'properties'::varchar, 0, NULL::varchar, 0, 0, 'default'::varchar, CURRENT_TIMESTAMP, NULL::varchar, CURRENT_TIMESTAMP);
INSERT INTO "public"."Audit"
("EntityName", "EntityId", "OpName", "Comment", "IsDeleted", "DeletedAt", "DataChange_CreatedBy", "DataChange_CreatedTime", "DataChange_LastModifiedBy", "DataChange_LastTime")
VALUES('default'::varchar, 0, 'default'::varchar, '', 0, 0, 'default'::varchar, CURRENT_TIMESTAMP, NULL::varchar, CURRENT_TIMESTAMP);
INSERT INTO "public"."Cluster"
("Name", "AppId", "ParentClusterId", "IsDeleted", "DeletedAt", "DataChange_CreatedBy", "DataChange_CreatedTime", "DataChange_LastModifiedBy", "DataChange_LastTime")
VALUES(NULL::varchar, NULL::varchar, 0, 0, 0, 'default'::varchar, CURRENT_TIMESTAMP, NULL::varchar, CURRENT_TIMESTAMP);
INSERT INTO "public"."Commit"
("ChangeSets", "AppId", "ClusterName", "NamespaceName", "Comment", "IsDeleted", "DeletedAt", "DataChange_CreatedBy", "DataChange_CreatedTime", "DataChange_LastModifiedBy", "DataChange_LastTime")
VALUES('', 'default'::varchar, 'default'::varchar, 'default'::varchar, '', 0, 0, 'default'::varchar, CURRENT_TIMESTAMP, NULL::varchar, CURRENT_TIMESTAMP);
INSERT INTO "public"."GrayReleaseRule"
("AppId", "ClusterName", "NamespaceName", "BranchName", "Rules", "ReleaseId", "BranchStatus", "IsDeleted", "DeletedAt", "DataChange_CreatedBy", "DataChange_CreatedTime", "DataChange_LastModifiedBy", "DataChange_LastTime")
VALUES('default'::varchar, 'default'::varchar, 'default'::varchar, 'default'::varchar, '[]'::text, 0, 1, 0, 0, 'default'::varchar, CURRENT_TIMESTAMP, NULL::varchar, CURRENT_TIMESTAMP);
INSERT INTO "public"."Instance"
("AppId", "ClusterName", "DataCenter", "Ip", "DataChange_CreatedTime", "DataChange_LastTime")
VALUES('default'::varchar, 'default'::varchar, 'default'::varchar, NULL::varchar, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO "public"."InstanceConfig"
("InstanceId", "ConfigAppId", "ConfigClusterName", "ConfigNamespaceName", "ReleaseKey", "ReleaseDeliveryTime", "DataChange_CreatedTime", "DataChange_LastTime")
VALUES(0, 'default'::varchar, 'default'::varchar, 'default'::varchar, NULL::varchar, '', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO "public"."Item"
("NamespaceId", "Key", "Value", "Comment", "LineNum", "IsDeleted", "DeletedAt", "DataChange_CreatedBy", "DataChange_CreatedTime", "DataChange_LastModifiedBy", "DataChange_LastTime")
VALUES(0, 'default'::varchar, '', NULL::varchar, 0, 0, 0, 'default'::varchar, CURRENT_TIMESTAMP, NULL::varchar, CURRENT_TIMESTAMP);
INSERT INTO "public"."Namespace"
("AppId", "ClusterName", "NamespaceName", "IsDeleted", "DeletedAt", "DataChange_CreatedBy", "DataChange_CreatedTime", "DataChange_LastModifiedBy", "DataChange_LastTime")
VALUES('default'::varchar, 'default'::varchar, 'default'::varchar, 0, 0, 'default'::varchar, CURRENT_TIMESTAMP, NULL::varchar, CURRENT_TIMESTAMP);
INSERT INTO "public"."NamespaceLock"
("NamespaceId", "DataChange_CreatedBy", "DataChange_CreatedTime", "DataChange_LastModifiedBy", "DataChange_LastTime", "IsDeleted", "DeletedAt")
VALUES(0, 'default'::varchar, CURRENT_TIMESTAMP, NULL::varchar, CURRENT_TIMESTAMP, 0, 0);
INSERT INTO "public"."Release"
("ReleaseKey", "Name", "Comment", "AppId", "ClusterName", "NamespaceName", "Configurations", "IsAbandoned", "IsDeleted", "DeletedAt", "DataChange_CreatedBy", "DataChange_CreatedTime", "DataChange_LastModifiedBy", "DataChange_LastTime")
VALUES(NULL::varchar, 'default'::varchar, '', 'default'::varchar, 'default'::varchar, 'default'::varchar, '', 0, 0, 0, 'default'::varchar, CURRENT_TIMESTAMP, NULL::varchar, CURRENT_TIMESTAMP);
INSERT INTO "public"."ReleaseHistory"
("AppId", "ClusterName", "NamespaceName", "BranchName", "ReleaseId", "PreviousReleaseId", "Operation", "OperationContext", "IsDeleted", "DeletedAt", "DataChange_CreatedBy", "DataChange_CreatedTime", "DataChange_LastModifiedBy", "DataChange_LastTime")
VALUES('default'::varchar, 'default'::varchar, 'default'::varchar, 'default'::varchar, 0, 0, 0, '', 0, 0, 'default'::varchar, CURRENT_TIMESTAMP, NULL::varchar, CURRENT_TIMESTAMP);
INSERT INTO "public"."ReleaseMessage"
("Message", "DataChange_LastTime")
VALUES(NULL::varchar, CURRENT_TIMESTAMP);
INSERT INTO "public"."ServerConfig"
("Key", "Cluster", "Value", "Comment", "IsDeleted", "DeletedAt", "DataChange_CreatedBy", "DataChange_CreatedTime", "DataChange_LastModifiedBy", "DataChange_LastTime")
VALUES('default'::varchar, 'default'::varchar, 'default'::varchar, NULL::varchar, 0, 0, 'default'::varchar, CURRENT_TIMESTAMP, NULL::varchar, CURRENT_TIMESTAMP);
