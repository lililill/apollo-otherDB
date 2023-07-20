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
	"Comment" character varying(64 char) NULL DEFAULT NULL::varchar,
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


-- "public"."Authorities" definition

-- Drop table

-- DROP TABLE "public"."Authorities";

CREATE TABLE "public"."Authorities" (
	"Id" bigint AUTO_INCREMENT,
	"Username" character varying(64 char) NOT NULL,
	"Authority" character varying(50 char) NOT NULL,
	CONSTRAINT "PRIMARY_64031CFC" PRIMARY KEY (Id)
);


-- "public"."Consumer" definition

-- Drop table

-- DROP TABLE "public"."Consumer";

CREATE TABLE "public"."Consumer" (
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
	CONSTRAINT "PRIMARY_DD828011" PRIMARY KEY (Id),
	CONSTRAINT "UK_AppId_DeletedAt_BAB36028" UNIQUE (AppId, DeletedAt)
);
CREATE INDEX DataChange_LastTime_4BB17865 ON public.Consumer USING btree (DataChange_LastTime);


-- "public"."ConsumerAudit" definition

-- Drop table

-- DROP TABLE "public"."ConsumerAudit";

CREATE TABLE "public"."ConsumerAudit" (
	"Id" bigint AUTO_INCREMENT,
	"ConsumerId" bigint NULL,
	"Uri" character varying(1024 char) NOT NULL DEFAULT NULL::varchar,
	"Method" character varying(16 char) NOT NULL DEFAULT NULL::varchar,
	"DataChange_CreatedTime" timestamp(0) without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
	"DataChange_LastTime" timestamp(0) without time zone NULL DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT "PRIMARY_86BC7B60" PRIMARY KEY (Id)
);
CREATE INDEX IX_ConsumerId_383A8FBC ON public.ConsumerAudit USING btree (ConsumerId);
CREATE INDEX IX_DataChange_LastTime_DC7C0112 ON public.ConsumerAudit USING btree (DataChange_LastTime);


-- "public"."ConsumerRole" definition

-- Drop table

-- DROP TABLE "public"."ConsumerRole";

CREATE TABLE "public"."ConsumerRole" (
	"Id" bigint AUTO_INCREMENT,
	"ConsumerId" bigint NULL,
	"RoleId" bigint NULL,
	"IsDeleted" integer NOT NULL DEFAULT 0,
	"DeletedAt" bigint NOT NULL DEFAULT 0,
	"DataChange_CreatedBy" character varying(64 char) NOT NULL DEFAULT 'default'::varchar,
	"DataChange_CreatedTime" timestamp(0) without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
	"DataChange_LastModifiedBy" character varying(64 char) NULL DEFAULT NULL::varchar,
	"DataChange_LastTime" timestamp(0) without time zone NULL DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT "PRIMARY_FFA18DA7" PRIMARY KEY (Id),
	CONSTRAINT "UK_ConsumerId_RoleId_DeletedAt_EAA023BE" UNIQUE (ConsumerId, RoleId, DeletedAt)
);
CREATE INDEX IX_DataChange_LastTime_936E3759 ON public.ConsumerRole USING btree (DataChange_LastTime);
CREATE INDEX IX_RoleId_EE4E3A43 ON public.ConsumerRole USING btree (RoleId);


-- "public"."ConsumerToken" definition

-- Drop table

-- DROP TABLE "public"."ConsumerToken";

CREATE TABLE "public"."ConsumerToken" (
	"Id" bigint AUTO_INCREMENT,
	"ConsumerId" bigint NULL,
	"Token" character varying(128 char) NOT NULL DEFAULT NULL::varchar,
	"Expires" timestamp(0) without time zone NOT NULL DEFAULT '2099-01-01 00:00:00'::timestamp without time zone,
	"IsDeleted" integer NOT NULL DEFAULT 0,
	"DeletedAt" bigint NOT NULL DEFAULT 0,
	"DataChange_CreatedBy" character varying(64 char) NOT NULL DEFAULT 'default'::varchar,
	"DataChange_CreatedTime" timestamp(0) without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
	"DataChange_LastModifiedBy" character varying(64 char) NULL DEFAULT NULL::varchar,
	"DataChange_LastTime" timestamp(0) without time zone NULL DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT "PRIMARY_B1B19D7E" PRIMARY KEY (Id),
	CONSTRAINT "UK_Token_DeletedAt_63E54ED5" UNIQUE (Token, DeletedAt)
);
CREATE INDEX DataChange_LastTime_52D88E18 ON public.ConsumerToken USING btree (DataChange_LastTime);


-- "public"."Favorite" definition

-- Drop table

-- DROP TABLE "public"."Favorite";

CREATE TABLE "public"."Favorite" (
	"Id" bigint AUTO_INCREMENT,
	"UserId" character varying(32 char) NOT NULL DEFAULT 'default'::varchar,
	"AppId" character varying(500 char) NOT NULL DEFAULT 'default'::varchar,
	"Position" integer NOT NULL DEFAULT 10000,
	"IsDeleted" integer NOT NULL DEFAULT 0,
	"DeletedAt" bigint NOT NULL DEFAULT 0,
	"DataChange_CreatedBy" character varying(64 char) NOT NULL DEFAULT 'default'::varchar,
	"DataChange_CreatedTime" timestamp(0) without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
	"DataChange_LastModifiedBy" character varying(64 char) NULL DEFAULT NULL::varchar,
	"DataChange_LastTime" timestamp(0) without time zone NULL DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT "PRIMARY_42F7B9B7" PRIMARY KEY (Id),
	CONSTRAINT "UK_UserId_AppId_DeletedAt_B770FDFE" UNIQUE (UserId, AppId, DeletedAt)
);
CREATE INDEX AppId_49B7595F ON public.Favorite USING btree (AppId);
CREATE INDEX DataChange_LastTime_588A287F ON public.Favorite USING btree (DataChange_LastTime);


-- "public"."Permission" definition

-- Drop table

-- DROP TABLE "public"."Permission";

CREATE TABLE "public"."Permission" (
	"Id" bigint AUTO_INCREMENT,
	"PermissionType" character varying(32 char) NOT NULL DEFAULT NULL::varchar,
	"TargetId" character varying(256 char) NOT NULL DEFAULT NULL::varchar,
	"IsDeleted" integer NOT NULL DEFAULT 0,
	"DeletedAt" bigint NOT NULL DEFAULT 0,
	"DataChange_CreatedBy" character varying(64 char) NOT NULL DEFAULT 'default'::varchar,
	"DataChange_CreatedTime" timestamp(0) without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
	"DataChange_LastModifiedBy" character varying(64 char) NULL DEFAULT NULL::varchar,
	"DataChange_LastTime" timestamp(0) without time zone NULL DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT "PRIMARY_CE267EA" PRIMARY KEY (Id),
	CONSTRAINT "UK_TargetId_PermissionType_DeletedAt_760562E1" UNIQUE (TargetId, PermissionType, DeletedAt)
);
CREATE INDEX IX_DataChange_LastTime_463D459C ON public.Permission USING btree (DataChange_LastTime);


-- "public"."Role" definition

-- Drop table

-- DROP TABLE "public"."Role";

CREATE TABLE "public"."Role" (
	"Id" bigint AUTO_INCREMENT,
	"RoleName" character varying(256 char) NOT NULL DEFAULT NULL::varchar,
	"IsDeleted" integer NOT NULL DEFAULT 0,
	"DeletedAt" bigint NOT NULL DEFAULT 0,
	"DataChange_CreatedBy" character varying(64 char) NOT NULL DEFAULT 'default'::varchar,
	"DataChange_CreatedTime" timestamp(0) without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
	"DataChange_LastModifiedBy" character varying(64 char) NULL DEFAULT NULL::varchar,
	"DataChange_LastTime" timestamp(0) without time zone NULL DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT "PRIMARY_7EFD8C91" PRIMARY KEY (Id),
	CONSTRAINT "UK_RoleName_DeletedAt_214A534" UNIQUE (RoleName, DeletedAt)
);
CREATE INDEX IX_DataChange_LastTime_FA840E43 ON public.Role USING btree (DataChange_LastTime);


-- "public"."RolePermission" definition

-- Drop table

-- DROP TABLE "public"."RolePermission";

CREATE TABLE "public"."RolePermission" (
	"Id" bigint AUTO_INCREMENT,
	"RoleId" bigint NULL,
	"PermissionId" bigint NULL,
	"IsDeleted" integer NOT NULL DEFAULT 0,
	"DeletedAt" bigint NOT NULL DEFAULT 0,
	"DataChange_CreatedBy" character varying(64 char) NOT NULL DEFAULT 'default'::varchar,
	"DataChange_CreatedTime" timestamp(0) without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
	"DataChange_LastModifiedBy" character varying(64 char) NULL DEFAULT NULL::varchar,
	"DataChange_LastTime" timestamp(0) without time zone NULL DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT "PRIMARY_63002D00" PRIMARY KEY (Id),
	CONSTRAINT "UK_RoleId_PermissionId_DeletedAt_6808A3F7" UNIQUE (RoleId, PermissionId, DeletedAt)
);
CREATE INDEX IX_DataChange_LastTime_BC9132B2 ON public.RolePermission USING btree (DataChange_LastTime);
CREATE INDEX IX_PermissionId_2062840E ON public.RolePermission USING btree (PermissionId);


-- "public"."SPRING_SESSION" definition

-- Drop table

-- DROP TABLE "public"."SPRING_SESSION";

CREATE TABLE "public"."SPRING_SESSION" (
	"PRIMARY_ID" character(36 char) NOT NULL,
	"SESSION_ID" character(36 char) NOT NULL,
	"CREATION_TIME" bigint NOT NULL,
	"LAST_ACCESS_TIME" bigint NOT NULL,
	"MAX_INACTIVE_INTERVAL" integer NOT NULL,
	"EXPIRY_TIME" bigint NOT NULL,
	"PRINCIPAL_NAME" character varying(100 char) NULL,
	CONSTRAINT "PRIMARY_65B44DBC" PRIMARY KEY (PRIMARY_ID),
	CONSTRAINT "SPRING_SESSION_IX1_51F0BCDE" UNIQUE (SESSION_ID)
);
CREATE INDEX SPRING_SESSION_IX2_A2002052 ON public.SPRING_SESSION USING btree (EXPIRY_TIME);
CREATE INDEX SPRING_SESSION_IX3_77A04504 ON public.SPRING_SESSION USING btree (PRINCIPAL_NAME);


-- "public"."SPRING_SESSION_ATTRIBUTES" definition

-- Drop table

-- DROP TABLE "public"."SPRING_SESSION_ATTRIBUTES";

CREATE TABLE "public"."SPRING_SESSION_ATTRIBUTES" (
	"SESSION_PRIMARY_ID" character(36 char) NOT NULL,
	"ATTRIBUTE_NAME" character varying(200 char) NOT NULL,
	"ATTRIBUTE_BYTES" blob NOT NULL,
	CONSTRAINT "PRIMARY_710A7420" PRIMARY KEY (ATTRIBUTE_NAME, SESSION_PRIMARY_ID)
);


-- "public"."ServerConfig" definition

-- Drop table

-- DROP TABLE "public"."ServerConfig";

CREATE TABLE "public"."ServerConfig" (
	"Id" bigint AUTO_INCREMENT,
	"Key" character varying(64 char) NOT NULL DEFAULT 'default'::varchar,
	"Value" character varying(2048 char) NOT NULL DEFAULT 'default'::varchar,
	"Comment" character varying(1024 char) NULL DEFAULT NULL::varchar,
	"IsDeleted" integer NOT NULL DEFAULT 0,
	"DeletedAt" bigint NOT NULL DEFAULT 0,
	"DataChange_CreatedBy" character varying(64 char) NOT NULL DEFAULT 'default'::varchar,
	"DataChange_CreatedTime" timestamp(0) without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
	"DataChange_LastModifiedBy" character varying(64 char) NULL DEFAULT NULL::varchar,
	"DataChange_LastTime" timestamp(0) without time zone NULL DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT "PRIMARY_81230E80" PRIMARY KEY (Id),
	CONSTRAINT "UK_Key_DeletedAt_62F63017" UNIQUE (Key, DeletedAt)
);
CREATE INDEX DataChange_LastTime_DE221456 ON public.ServerConfig USING btree (DataChange_LastTime);


-- "public"."UserRole" definition

-- Drop table

-- DROP TABLE "public"."UserRole";

CREATE TABLE "public"."UserRole" (
	"Id" bigint AUTO_INCREMENT,
	"UserId" character varying(128 char) NULL DEFAULT NULL::varchar,
	"RoleId" bigint NULL,
	"IsDeleted" bit(1) NOT NULL DEFAULT '0'::"bit",
	"DeletedAt" bigint NOT NULL DEFAULT 0,
	"DataChange_CreatedBy" character varying(64 char) NOT NULL DEFAULT 'default'::varchar,
	"DataChange_CreatedTime" timestamp(0) without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
	"DataChange_LastModifiedBy" character varying(64 char) NULL DEFAULT NULL::varchar,
	"DataChange_LastTime" timestamp(0) without time zone NULL DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT "PRIMARY_2EA9C8FC" PRIMARY KEY (Id),
	CONSTRAINT "UK_UserId_RoleId_DeletedAt_84DA91F3" UNIQUE (UserId, RoleId, DeletedAt)
);
CREATE INDEX IX_DataChange_LastTime_236BDEAE ON public.UserRole USING btree (DataChange_LastTime);
CREATE INDEX IX_RoleId_576FE1D8 ON public.UserRole USING btree (RoleId);


-- "public"."Users" definition

-- Drop table

-- DROP TABLE "public"."Users";

CREATE TABLE "public"."Users" (
	"Id" bigint AUTO_INCREMENT,
	"Username" character varying(64 char) NOT NULL DEFAULT 'default'::varchar,
	"Password" character varying(512 char) NOT NULL DEFAULT 'default'::varchar,
	"UserDisplayName" character varying(512 char) NOT NULL DEFAULT 'default'::varchar,
	"Email" character varying(64 char) NOT NULL DEFAULT 'default'::varchar,
	"Enabled" integer NULL,
	CONSTRAINT "PRIMARY_85B151E3" PRIMARY KEY (Id),
	CONSTRAINT "UK_Username_A3445096" UNIQUE (Username)
);