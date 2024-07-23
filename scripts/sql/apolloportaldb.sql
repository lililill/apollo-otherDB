CREATE TABLE "APOLLOPORTALDB"."App"
(
"Id" BIGINT IDENTITY(1, 1) NOT NULL,
"AppId" VARCHAR(64) DEFAULT 'default' NOT NULL,
"Name" VARCHAR(500) DEFAULT 'default' NOT NULL,
"OrgId" VARCHAR(32) DEFAULT 'default' NOT NULL,
"OrgName" VARCHAR(64) DEFAULT 'default' NOT NULL,
"OwnerName" VARCHAR(500) DEFAULT 'default' NOT NULL,
"OwnerEmail" VARCHAR(500) DEFAULT 'default' NOT NULL,
"IsDeleted" BIT DEFAULT 0 NOT NULL,
"DeletedAt" BIGINT DEFAULT 0 NOT NULL,
"DataChange_CreatedBy" VARCHAR(64) DEFAULT 'default' NOT NULL,
"DataChange_CreatedTime" TIMESTAMP(0) DEFAULT CURRENT_TIMESTAMP() NOT NULL,
"DataChange_LastModifiedBy" VARCHAR(64) DEFAULT '',
"DataChange_LastTime" TIMESTAMP(0) DEFAULT CURRENT_TIMESTAMP(),
NOT CLUSTER PRIMARY KEY("Id"),
CONSTRAINT "UK_AppId_DeletedAt" UNIQUE("AppId", "DeletedAt")) STORAGE(ON "apolloportaldb", CLUSTERBTR) ;

COMMENT ON TABLE "APOLLOPORTALDB"."App" IS '应用表';
COMMENT ON COLUMN "APOLLOPORTALDB"."App"."AppId" IS 'AppID';
COMMENT ON COLUMN "APOLLOPORTALDB"."App"."DataChange_CreatedBy" IS '创建人邮箱前缀';
COMMENT ON COLUMN "APOLLOPORTALDB"."App"."DataChange_CreatedTime" IS '创建时间';
COMMENT ON COLUMN "APOLLOPORTALDB"."App"."DataChange_LastModifiedBy" IS '最后修改人邮箱前缀';
COMMENT ON COLUMN "APOLLOPORTALDB"."App"."DataChange_LastTime" IS '最后修改时间';
COMMENT ON COLUMN "APOLLOPORTALDB"."App"."DeletedAt" IS 'Delete timestamp based on milliseconds';
COMMENT ON COLUMN "APOLLOPORTALDB"."App"."Id" IS '主键';
COMMENT ON COLUMN "APOLLOPORTALDB"."App"."IsDeleted" IS '1: deleted, 0: normal';
COMMENT ON COLUMN "APOLLOPORTALDB"."App"."Name" IS '应用名';
COMMENT ON COLUMN "APOLLOPORTALDB"."App"."OrgId" IS '部门Id';
COMMENT ON COLUMN "APOLLOPORTALDB"."App"."OrgName" IS '部门名字';
COMMENT ON COLUMN "APOLLOPORTALDB"."App"."OwnerEmail" IS 'ownerEmail';
COMMENT ON COLUMN "APOLLOPORTALDB"."App"."OwnerName" IS 'ownerName';


CREATE OR REPLACE  INDEX "APOLLOPORTALDB"."IX_Name" ON "APOLLOPORTALDB"."App"("Name" ASC) STORAGE(ON "apolloportaldb", CLUSTERBTR) ;
CREATE OR REPLACE  INDEX "APOLLOPORTALDB"."DataChange_LastTime" ON "APOLLOPORTALDB"."App"("DataChange_LastTime" ASC) STORAGE(ON "apolloportaldb", CLUSTERBTR) ;

CREATE TABLE "APOLLOPORTALDB"."AppNamespace"
(
"Id" BIGINT IDENTITY(1, 1) NOT NULL,
"Name" VARCHAR(32) DEFAULT '' NOT NULL,
"AppId" VARCHAR(64) DEFAULT '' NOT NULL,
"Format" VARCHAR(32) DEFAULT 'properties' NOT NULL,
"IsPublic" BIT DEFAULT 0 NOT NULL,
"Comment" VARCHAR(64) DEFAULT '' NOT NULL,
"IsDeleted" BIT DEFAULT 0 NOT NULL,
"DeletedAt" BIGINT DEFAULT 0 NOT NULL,
"DataChange_CreatedBy" VARCHAR(64) DEFAULT 'default' NOT NULL,
"DataChange_CreatedTime" TIMESTAMP(0) DEFAULT CURRENT_TIMESTAMP() NOT NULL,
"DataChange_LastModifiedBy" VARCHAR(64) DEFAULT '',
"DataChange_LastTime" TIMESTAMP(0) DEFAULT CURRENT_TIMESTAMP(),
NOT CLUSTER PRIMARY KEY("Id"),
CONSTRAINT "UK_AppId_Name_DeletedAt" UNIQUE("AppId", "Name", "DeletedAt")) STORAGE(ON "apolloportaldb", CLUSTERBTR) ;

COMMENT ON TABLE "APOLLOPORTALDB"."AppNamespace" IS '应用namespace定义';
COMMENT ON COLUMN "APOLLOPORTALDB"."AppNamespace"."AppId" IS 'app id';
COMMENT ON COLUMN "APOLLOPORTALDB"."AppNamespace"."Comment" IS '注释';
COMMENT ON COLUMN "APOLLOPORTALDB"."AppNamespace"."DataChange_CreatedBy" IS '创建人邮箱前缀';
COMMENT ON COLUMN "APOLLOPORTALDB"."AppNamespace"."DataChange_CreatedTime" IS '创建时间';
COMMENT ON COLUMN "APOLLOPORTALDB"."AppNamespace"."DataChange_LastModifiedBy" IS '最后修改人邮箱前缀';
COMMENT ON COLUMN "APOLLOPORTALDB"."AppNamespace"."DataChange_LastTime" IS '最后修改时间';
COMMENT ON COLUMN "APOLLOPORTALDB"."AppNamespace"."DeletedAt" IS 'Delete timestamp based on milliseconds';
COMMENT ON COLUMN "APOLLOPORTALDB"."AppNamespace"."Format" IS 'namespace的format类型';
COMMENT ON COLUMN "APOLLOPORTALDB"."AppNamespace"."Id" IS '自增主键';
COMMENT ON COLUMN "APOLLOPORTALDB"."AppNamespace"."IsDeleted" IS '1: deleted, 0: normal';
COMMENT ON COLUMN "APOLLOPORTALDB"."AppNamespace"."IsPublic" IS 'namespace是否为公共';
COMMENT ON COLUMN "APOLLOPORTALDB"."AppNamespace"."Name" IS 'namespace名字，注意，需要全局唯一';


CREATE OR REPLACE  INDEX "APOLLOPORTALDB"."INDEX157177343236700" ON "APOLLOPORTALDB"."AppNamespace"("DataChange_LastTime" ASC) STORAGE(ON "apolloportaldb", CLUSTERBTR) ;
CREATE OR REPLACE  INDEX "APOLLOPORTALDB"."Name_AppId" ON "APOLLOPORTALDB"."AppNamespace"("Name" ASC,"AppId" ASC) STORAGE(ON "apolloportaldb", CLUSTERBTR) ;

CREATE TABLE "APOLLOPORTALDB"."AuditLog"
(
"Id" BIGINT IDENTITY(1, 1) NOT NULL,
"TraceId" VARCHAR(32) DEFAULT '' NOT NULL,
"SpanId" VARCHAR(32) DEFAULT '' NOT NULL,
"ParentSpanId" VARCHAR(32),
"FollowsFromSpanId" VARCHAR(32),
"Operator" VARCHAR(64) DEFAULT 'anonymous' NOT NULL,
"OpType" VARCHAR(50) DEFAULT 'default' NOT NULL,
"OpName" VARCHAR(150) DEFAULT 'default' NOT NULL,
"Description" VARCHAR(200),
"IsDeleted" BIT DEFAULT 0 NOT NULL,
"DeletedAt" BIGINT DEFAULT 0 NOT NULL,
"DataChange_CreatedBy" VARCHAR(64),
"DataChange_CreatedTime" TIMESTAMP(0) DEFAULT CURRENT_TIMESTAMP() NOT NULL,
"DataChange_LastModifiedBy" VARCHAR(64) DEFAULT '',
"DataChange_LastTime" TIMESTAMP(0) DEFAULT CURRENT_TIMESTAMP(),
NOT CLUSTER PRIMARY KEY("Id")) STORAGE(ON "apolloportaldb", CLUSTERBTR) ;

COMMENT ON TABLE "APOLLOPORTALDB"."AuditLog" IS '审计日志表';
COMMENT ON COLUMN "APOLLOPORTALDB"."AuditLog"."DataChange_CreatedBy" IS '创建人邮箱前缀';
COMMENT ON COLUMN "APOLLOPORTALDB"."AuditLog"."DataChange_CreatedTime" IS '创建时间';
COMMENT ON COLUMN "APOLLOPORTALDB"."AuditLog"."DataChange_LastModifiedBy" IS '最后修改人邮箱前缀';
COMMENT ON COLUMN "APOLLOPORTALDB"."AuditLog"."DataChange_LastTime" IS '最后修改时间';
COMMENT ON COLUMN "APOLLOPORTALDB"."AuditLog"."DeletedAt" IS 'Delete timestamp based on milliseconds';
COMMENT ON COLUMN "APOLLOPORTALDB"."AuditLog"."Description" IS '备注';
COMMENT ON COLUMN "APOLLOPORTALDB"."AuditLog"."FollowsFromSpanId" IS '上一个兄弟跨度ID';
COMMENT ON COLUMN "APOLLOPORTALDB"."AuditLog"."Id" IS '主键';
COMMENT ON COLUMN "APOLLOPORTALDB"."AuditLog"."IsDeleted" IS '1: deleted, 0: normal';
COMMENT ON COLUMN "APOLLOPORTALDB"."AuditLog"."Operator" IS '操作人';
COMMENT ON COLUMN "APOLLOPORTALDB"."AuditLog"."OpName" IS '操作名称';
COMMENT ON COLUMN "APOLLOPORTALDB"."AuditLog"."OpType" IS '操作类型';
COMMENT ON COLUMN "APOLLOPORTALDB"."AuditLog"."ParentSpanId" IS '父跨度ID';
COMMENT ON COLUMN "APOLLOPORTALDB"."AuditLog"."SpanId" IS '跨度ID';
COMMENT ON COLUMN "APOLLOPORTALDB"."AuditLog"."TraceId" IS '链路全局唯一ID';


CREATE OR REPLACE  INDEX "APOLLOPORTALDB"."IX_DataChange_CreatedTime" ON "APOLLOPORTALDB"."AuditLog"("DataChange_CreatedTime" ASC) STORAGE(ON "apolloportaldb", CLUSTERBTR) ;
CREATE OR REPLACE  INDEX "APOLLOPORTALDB"."IX_Operator" ON "APOLLOPORTALDB"."AuditLog"("Operator" ASC) STORAGE(ON "apolloportaldb", CLUSTERBTR) ;
CREATE OR REPLACE  INDEX "APOLLOPORTALDB"."IX_OpName" ON "APOLLOPORTALDB"."AuditLog"("OpName" ASC) STORAGE(ON "apolloportaldb", CLUSTERBTR) ;
CREATE OR REPLACE  INDEX "APOLLOPORTALDB"."IX_TraceId" ON "APOLLOPORTALDB"."AuditLog"("TraceId" ASC) STORAGE(ON "apolloportaldb", CLUSTERBTR) ;

CREATE TABLE "APOLLOPORTALDB"."AuditLogDataInfluence"
(
"Id" BIGINT IDENTITY(1, 1) NOT NULL,
"SpanId" CHAR(32) DEFAULT '' NOT NULL,
"InfluenceEntityId" VARCHAR(50) DEFAULT '0' NOT NULL,
"InfluenceEntityName" VARCHAR(50) DEFAULT 'default' NOT NULL,
"FieldName" VARCHAR(50),
"FieldOldValue" VARCHAR(500),
"FieldNewValue" VARCHAR(500),
"IsDeleted" BIT DEFAULT 0 NOT NULL,
"DeletedAt" BIGINT DEFAULT 0 NOT NULL,
"DataChange_CreatedBy" VARCHAR(64),
"DataChange_CreatedTime" TIMESTAMP(0) DEFAULT CURRENT_TIMESTAMP() NOT NULL,
"DataChange_LastModifiedBy" VARCHAR(64) DEFAULT '',
"DataChange_LastTime" TIMESTAMP(0) DEFAULT CURRENT_TIMESTAMP(),
NOT CLUSTER PRIMARY KEY("Id")) STORAGE(ON "apolloportaldb", CLUSTERBTR) ;

COMMENT ON TABLE "APOLLOPORTALDB"."AuditLogDataInfluence" IS '审计日志数据变动表';
COMMENT ON COLUMN "APOLLOPORTALDB"."AuditLogDataInfluence"."DataChange_CreatedBy" IS '创建人邮箱前缀';
COMMENT ON COLUMN "APOLLOPORTALDB"."AuditLogDataInfluence"."DataChange_CreatedTime" IS '创建时间';
COMMENT ON COLUMN "APOLLOPORTALDB"."AuditLogDataInfluence"."DataChange_LastModifiedBy" IS '最后修改人邮箱前缀';
COMMENT ON COLUMN "APOLLOPORTALDB"."AuditLogDataInfluence"."DataChange_LastTime" IS '最后修改时间';
COMMENT ON COLUMN "APOLLOPORTALDB"."AuditLogDataInfluence"."DeletedAt" IS 'Delete timestamp based on milliseconds';
COMMENT ON COLUMN "APOLLOPORTALDB"."AuditLogDataInfluence"."FieldName" IS '字段名称';
COMMENT ON COLUMN "APOLLOPORTALDB"."AuditLogDataInfluence"."FieldNewValue" IS '字段新值';
COMMENT ON COLUMN "APOLLOPORTALDB"."AuditLogDataInfluence"."FieldOldValue" IS '字段旧值';
COMMENT ON COLUMN "APOLLOPORTALDB"."AuditLogDataInfluence"."Id" IS '主键';
COMMENT ON COLUMN "APOLLOPORTALDB"."AuditLogDataInfluence"."InfluenceEntityId" IS '记录ID';
COMMENT ON COLUMN "APOLLOPORTALDB"."AuditLogDataInfluence"."InfluenceEntityName" IS '表名';
COMMENT ON COLUMN "APOLLOPORTALDB"."AuditLogDataInfluence"."IsDeleted" IS '1: deleted, 0: normal';
COMMENT ON COLUMN "APOLLOPORTALDB"."AuditLogDataInfluence"."SpanId" IS '跨度ID';


CREATE OR REPLACE  INDEX "APOLLOPORTALDB"."IX_EntityId" ON "APOLLOPORTALDB"."AuditLogDataInfluence"("InfluenceEntityId" ASC) STORAGE(ON "apolloportaldb", CLUSTERBTR) ;
CREATE OR REPLACE  INDEX "APOLLOPORTALDB"."IX_SpanId" ON "APOLLOPORTALDB"."AuditLogDataInfluence"("SpanId" ASC) STORAGE(ON "apolloportaldb", CLUSTERBTR) ;
CREATE OR REPLACE  INDEX "APOLLOPORTALDB"."INDEX157177030710000" ON "APOLLOPORTALDB"."AuditLogDataInfluence"("DataChange_CreatedTime" ASC) STORAGE(ON "apolloportaldb", CLUSTERBTR) ;

CREATE TABLE "APOLLOPORTALDB"."Authorities"
(
"Id" BIGINT IDENTITY(2, 1) NOT NULL,
"Username" VARCHAR(64) NOT NULL,
"Authority" VARCHAR(50) NOT NULL,
NOT CLUSTER PRIMARY KEY("Id")) STORAGE(ON "apolloportaldb", CLUSTERBTR) ;

COMMENT ON COLUMN "APOLLOPORTALDB"."Authorities"."Id" IS '自增Id';


CREATE TABLE "APOLLOPORTALDB"."Consumer"
(
"Id" BIGINT IDENTITY(1, 1) NOT NULL,
"AppId" VARCHAR(64) DEFAULT 'default' NOT NULL,
"Name" VARCHAR(500) DEFAULT 'default' NOT NULL,
"OrgId" VARCHAR(32) DEFAULT 'default' NOT NULL,
"OrgName" VARCHAR(64) DEFAULT 'default' NOT NULL,
"OwnerName" VARCHAR(500) DEFAULT 'default' NOT NULL,
"OwnerEmail" VARCHAR(500) DEFAULT 'default' NOT NULL,
"IsDeleted" BIT DEFAULT 0 NOT NULL,
"DeletedAt" BIGINT DEFAULT 0 NOT NULL,
"DataChange_CreatedBy" VARCHAR(64) DEFAULT 'default' NOT NULL,
"DataChange_CreatedTime" TIMESTAMP(0) DEFAULT CURRENT_TIMESTAMP() NOT NULL,
"DataChange_LastModifiedBy" VARCHAR(64) DEFAULT '',
"DataChange_LastTime" TIMESTAMP(0) DEFAULT CURRENT_TIMESTAMP(),
NOT CLUSTER PRIMARY KEY("Id"),
UNIQUE("AppId", "DeletedAt")) STORAGE(ON "apolloportaldb", CLUSTERBTR) ;

COMMENT ON TABLE "APOLLOPORTALDB"."Consumer" IS '开放API消费者';
COMMENT ON COLUMN "APOLLOPORTALDB"."Consumer"."AppId" IS 'AppID';
COMMENT ON COLUMN "APOLLOPORTALDB"."Consumer"."DataChange_CreatedBy" IS '创建人邮箱前缀';
COMMENT ON COLUMN "APOLLOPORTALDB"."Consumer"."DataChange_CreatedTime" IS '创建时间';
COMMENT ON COLUMN "APOLLOPORTALDB"."Consumer"."DataChange_LastModifiedBy" IS '最后修改人邮箱前缀';
COMMENT ON COLUMN "APOLLOPORTALDB"."Consumer"."DataChange_LastTime" IS '最后修改时间';
COMMENT ON COLUMN "APOLLOPORTALDB"."Consumer"."DeletedAt" IS 'Delete timestamp based on milliseconds';
COMMENT ON COLUMN "APOLLOPORTALDB"."Consumer"."Id" IS '自增Id';
COMMENT ON COLUMN "APOLLOPORTALDB"."Consumer"."IsDeleted" IS '1: deleted, 0: normal';
COMMENT ON COLUMN "APOLLOPORTALDB"."Consumer"."Name" IS '应用名';
COMMENT ON COLUMN "APOLLOPORTALDB"."Consumer"."OrgId" IS '部门Id';
COMMENT ON COLUMN "APOLLOPORTALDB"."Consumer"."OrgName" IS '部门名字';
COMMENT ON COLUMN "APOLLOPORTALDB"."Consumer"."OwnerEmail" IS 'ownerEmail';
COMMENT ON COLUMN "APOLLOPORTALDB"."Consumer"."OwnerName" IS 'ownerName';


CREATE OR REPLACE  INDEX "APOLLOPORTALDB"."INDEX157177365591100" ON "APOLLOPORTALDB"."Consumer"("DataChange_LastTime" ASC) STORAGE(ON "apolloportaldb", CLUSTERBTR) ;

CREATE TABLE "APOLLOPORTALDB"."ConsumerAudit"
(
"Id" BIGINT IDENTITY(1, 1) NOT NULL,
"ConsumerId" BIGINT,
"Uri" VARCHAR(1024) DEFAULT '' NOT NULL,
"Method" VARCHAR(16) DEFAULT '' NOT NULL,
"DataChange_CreatedTime" TIMESTAMP(0) DEFAULT CURRENT_TIMESTAMP() NOT NULL,
"DataChange_LastTime" TIMESTAMP(0) DEFAULT CURRENT_TIMESTAMP(),
NOT CLUSTER PRIMARY KEY("Id"),
CHECK("ConsumerId" >= 0)) STORAGE(ON "apolloportaldb", CLUSTERBTR) ;

COMMENT ON TABLE "APOLLOPORTALDB"."ConsumerAudit" IS 'consumer审计表';
COMMENT ON COLUMN "APOLLOPORTALDB"."ConsumerAudit"."ConsumerId" IS 'Consumer Id';
COMMENT ON COLUMN "APOLLOPORTALDB"."ConsumerAudit"."DataChange_CreatedTime" IS '创建时间';
COMMENT ON COLUMN "APOLLOPORTALDB"."ConsumerAudit"."DataChange_LastTime" IS '最后修改时间';
COMMENT ON COLUMN "APOLLOPORTALDB"."ConsumerAudit"."Id" IS '自增Id';
COMMENT ON COLUMN "APOLLOPORTALDB"."ConsumerAudit"."Method" IS '访问的Method';
COMMENT ON COLUMN "APOLLOPORTALDB"."ConsumerAudit"."Uri" IS '访问的Uri';


CREATE OR REPLACE  INDEX "APOLLOPORTALDB"."IX_DataChange_LastTime" ON "APOLLOPORTALDB"."ConsumerAudit"("DataChange_LastTime" ASC) STORAGE(ON "apolloportaldb", CLUSTERBTR) ;
CREATE OR REPLACE  INDEX "APOLLOPORTALDB"."IX_ConsumerId" ON "APOLLOPORTALDB"."ConsumerAudit"("ConsumerId" ASC) STORAGE(ON "apolloportaldb", CLUSTERBTR) ;

CREATE TABLE "APOLLOPORTALDB"."ConsumerRole"
(
"Id" BIGINT IDENTITY(1, 1) NOT NULL,
"ConsumerId" BIGINT,
"RoleId" BIGINT,
"IsDeleted" BIT DEFAULT 0 NOT NULL,
"DeletedAt" BIGINT DEFAULT 0 NOT NULL,
"DataChange_CreatedBy" VARCHAR(64) DEFAULT 'default' NOT NULL,
"DataChange_CreatedTime" TIMESTAMP(0) DEFAULT CURRENT_TIMESTAMP() NOT NULL,
"DataChange_LastModifiedBy" VARCHAR(64) DEFAULT '',
"DataChange_LastTime" TIMESTAMP(0) DEFAULT CURRENT_TIMESTAMP(),
NOT CLUSTER PRIMARY KEY("Id"),
CONSTRAINT "UK_ConsumerId_RoleId_DeletedAt" UNIQUE("ConsumerId", "RoleId", "DeletedAt"),
CHECK("ConsumerId" >= 0)
,CHECK("RoleId" >= 0)) STORAGE(ON "apolloportaldb", CLUSTERBTR) ;

COMMENT ON TABLE "APOLLOPORTALDB"."ConsumerRole" IS 'consumer和role的绑定表';
COMMENT ON COLUMN "APOLLOPORTALDB"."ConsumerRole"."ConsumerId" IS 'Consumer Id';
COMMENT ON COLUMN "APOLLOPORTALDB"."ConsumerRole"."DataChange_CreatedBy" IS '创建人邮箱前缀';
COMMENT ON COLUMN "APOLLOPORTALDB"."ConsumerRole"."DataChange_CreatedTime" IS '创建时间';
COMMENT ON COLUMN "APOLLOPORTALDB"."ConsumerRole"."DataChange_LastModifiedBy" IS '最后修改人邮箱前缀';
COMMENT ON COLUMN "APOLLOPORTALDB"."ConsumerRole"."DataChange_LastTime" IS '最后修改时间';
COMMENT ON COLUMN "APOLLOPORTALDB"."ConsumerRole"."DeletedAt" IS 'Delete timestamp based on milliseconds';
COMMENT ON COLUMN "APOLLOPORTALDB"."ConsumerRole"."Id" IS '自增Id';
COMMENT ON COLUMN "APOLLOPORTALDB"."ConsumerRole"."IsDeleted" IS '1: deleted, 0: normal';
COMMENT ON COLUMN "APOLLOPORTALDB"."ConsumerRole"."RoleId" IS 'Role Id';


CREATE OR REPLACE  INDEX "APOLLOPORTALDB"."IX_RoleId" ON "APOLLOPORTALDB"."ConsumerRole"("RoleId" ASC) STORAGE(ON "apolloportaldb", CLUSTERBTR) ;
CREATE OR REPLACE  INDEX "APOLLOPORTALDB"."INDEX157177717251800" ON "APOLLOPORTALDB"."ConsumerRole"("DataChange_LastTime" ASC) STORAGE(ON "apolloportaldb", CLUSTERBTR) ;

CREATE TABLE "APOLLOPORTALDB"."ConsumerToken"
(
"Id" BIGINT IDENTITY(1, 1) NOT NULL,
"ConsumerId" BIGINT,
"Token" VARCHAR(128) DEFAULT '' NOT NULL,
"Expires" TIMESTAMP(0) DEFAULT '2099-01-01 00:00:00' NOT NULL,
"IsDeleted" BIT DEFAULT 0 NOT NULL,
"DeletedAt" BIGINT DEFAULT 0 NOT NULL,
"DataChange_CreatedBy" VARCHAR(64) DEFAULT 'default' NOT NULL,
"DataChange_CreatedTime" TIMESTAMP(0) DEFAULT CURRENT_TIMESTAMP() NOT NULL,
"DataChange_LastModifiedBy" VARCHAR(64) DEFAULT '',
"DataChange_LastTime" TIMESTAMP(0) DEFAULT CURRENT_TIMESTAMP(),
NOT CLUSTER PRIMARY KEY("Id"),
CONSTRAINT "UK_Token_DeletedAt" UNIQUE("Token", "DeletedAt"),
CHECK("ConsumerId" >= 0)) STORAGE(ON "apolloportaldb", CLUSTERBTR) ;

COMMENT ON TABLE "APOLLOPORTALDB"."ConsumerToken" IS 'consumer token表';
COMMENT ON COLUMN "APOLLOPORTALDB"."ConsumerToken"."ConsumerId" IS 'ConsumerId';
COMMENT ON COLUMN "APOLLOPORTALDB"."ConsumerToken"."DataChange_CreatedBy" IS '创建人邮箱前缀';
COMMENT ON COLUMN "APOLLOPORTALDB"."ConsumerToken"."DataChange_CreatedTime" IS '创建时间';
COMMENT ON COLUMN "APOLLOPORTALDB"."ConsumerToken"."DataChange_LastModifiedBy" IS '最后修改人邮箱前缀';
COMMENT ON COLUMN "APOLLOPORTALDB"."ConsumerToken"."DataChange_LastTime" IS '最后修改时间';
COMMENT ON COLUMN "APOLLOPORTALDB"."ConsumerToken"."DeletedAt" IS 'Delete timestamp based on milliseconds';
COMMENT ON COLUMN "APOLLOPORTALDB"."ConsumerToken"."Expires" IS 'token失效时间';
COMMENT ON COLUMN "APOLLOPORTALDB"."ConsumerToken"."Id" IS '自增Id';
COMMENT ON COLUMN "APOLLOPORTALDB"."ConsumerToken"."IsDeleted" IS '1: deleted, 0: normal';
COMMENT ON COLUMN "APOLLOPORTALDB"."ConsumerToken"."Token" IS 'token';


CREATE OR REPLACE  INDEX "APOLLOPORTALDB"."INDEX157177729287700" ON "APOLLOPORTALDB"."ConsumerToken"("DataChange_LastTime" ASC) STORAGE(ON "apolloportaldb", CLUSTERBTR) ;

CREATE TABLE "APOLLOPORTALDB"."Favorite"
(
"Id" BIGINT IDENTITY(23, 1) NOT NULL,
"UserId" VARCHAR(32) DEFAULT 'default' NOT NULL,
"AppId" VARCHAR(64) DEFAULT 'default' NOT NULL,
"Position" INT DEFAULT 10000 NOT NULL,
"IsDeleted" BIT DEFAULT 0 NOT NULL,
"DeletedAt" BIGINT DEFAULT 0 NOT NULL,
"DataChange_CreatedBy" VARCHAR(64) DEFAULT 'default' NOT NULL,
"DataChange_CreatedTime" TIMESTAMP(0) DEFAULT CURRENT_TIMESTAMP() NOT NULL,
"DataChange_LastModifiedBy" VARCHAR(64) DEFAULT '',
"DataChange_LastTime" TIMESTAMP(0) DEFAULT CURRENT_TIMESTAMP(),
NOT CLUSTER PRIMARY KEY("Id"),
CONSTRAINT "UK_UserId_AppId_DeletedAt" UNIQUE("UserId", "AppId", "DeletedAt")) STORAGE(ON "apolloportaldb", CLUSTERBTR) ;

COMMENT ON TABLE "APOLLOPORTALDB"."Favorite" IS '应用收藏表';
COMMENT ON COLUMN "APOLLOPORTALDB"."Favorite"."AppId" IS 'AppID';
COMMENT ON COLUMN "APOLLOPORTALDB"."Favorite"."DataChange_CreatedBy" IS '创建人邮箱前缀';
COMMENT ON COLUMN "APOLLOPORTALDB"."Favorite"."DataChange_CreatedTime" IS '创建时间';
COMMENT ON COLUMN "APOLLOPORTALDB"."Favorite"."DataChange_LastModifiedBy" IS '最后修改人邮箱前缀';
COMMENT ON COLUMN "APOLLOPORTALDB"."Favorite"."DataChange_LastTime" IS '最后修改时间';
COMMENT ON COLUMN "APOLLOPORTALDB"."Favorite"."DeletedAt" IS 'Delete timestamp based on milliseconds';
COMMENT ON COLUMN "APOLLOPORTALDB"."Favorite"."Id" IS '主键';
COMMENT ON COLUMN "APOLLOPORTALDB"."Favorite"."IsDeleted" IS '1: deleted, 0: normal';
COMMENT ON COLUMN "APOLLOPORTALDB"."Favorite"."Position" IS '收藏顺序';
COMMENT ON COLUMN "APOLLOPORTALDB"."Favorite"."UserId" IS '收藏的用户';


CREATE OR REPLACE  INDEX "APOLLOPORTALDB"."INDEX157177397681100" ON "APOLLOPORTALDB"."Favorite"("DataChange_LastTime" ASC) STORAGE(ON "apolloportaldb", CLUSTERBTR) ;
CREATE OR REPLACE  INDEX "APOLLOPORTALDB"."AppId" ON "APOLLOPORTALDB"."Favorite"("AppId" ASC) STORAGE(ON "apolloportaldb", CLUSTERBTR) ;

CREATE TABLE "APOLLOPORTALDB"."Permission"
(
"Id" BIGINT IDENTITY(1, 1) NOT NULL,
"PermissionType" VARCHAR(32) DEFAULT '' NOT NULL,
"TargetId" VARCHAR(256) DEFAULT '' NOT NULL,
"IsDeleted" BIT DEFAULT 0 NOT NULL,
"DeletedAt" BIGINT DEFAULT 0 NOT NULL,
"DataChange_CreatedBy" VARCHAR(64) DEFAULT 'default' NOT NULL,
"DataChange_CreatedTime" TIMESTAMP(0) DEFAULT CURRENT_TIMESTAMP() NOT NULL,
"DataChange_LastModifiedBy" VARCHAR(64) DEFAULT '',
"DataChange_LastTime" TIMESTAMP(0) DEFAULT CURRENT_TIMESTAMP(),
NOT CLUSTER PRIMARY KEY("Id"),
CONSTRAINT "UK_TargetId_PermissionType_DeletedAt" UNIQUE("TargetId", "PermissionType", "DeletedAt")) STORAGE(ON "apolloportaldb", CLUSTERBTR) ;

COMMENT ON TABLE "APOLLOPORTALDB"."Permission" IS 'permission表';
COMMENT ON COLUMN "APOLLOPORTALDB"."Permission"."DataChange_CreatedBy" IS '创建人邮箱前缀';
COMMENT ON COLUMN "APOLLOPORTALDB"."Permission"."DataChange_CreatedTime" IS '创建时间';
COMMENT ON COLUMN "APOLLOPORTALDB"."Permission"."DataChange_LastModifiedBy" IS '最后修改人邮箱前缀';
COMMENT ON COLUMN "APOLLOPORTALDB"."Permission"."DataChange_LastTime" IS '最后修改时间';
COMMENT ON COLUMN "APOLLOPORTALDB"."Permission"."DeletedAt" IS 'Delete timestamp based on milliseconds';
COMMENT ON COLUMN "APOLLOPORTALDB"."Permission"."Id" IS '自增Id';
COMMENT ON COLUMN "APOLLOPORTALDB"."Permission"."IsDeleted" IS '1: deleted, 0: normal';
COMMENT ON COLUMN "APOLLOPORTALDB"."Permission"."PermissionType" IS '权限类型';
COMMENT ON COLUMN "APOLLOPORTALDB"."Permission"."TargetId" IS '权限对象类型';


CREATE OR REPLACE  INDEX "APOLLOPORTALDB"."INDEX157177418400000" ON "APOLLOPORTALDB"."Permission"("DataChange_LastTime" ASC) STORAGE(ON "apolloportaldb", CLUSTERBTR) ;

CREATE TABLE "APOLLOPORTALDB"."Role"
(
"Id" BIGINT IDENTITY(1, 1) NOT NULL,
"RoleName" VARCHAR(256) DEFAULT '' NOT NULL,
"IsDeleted" BIT DEFAULT 0 NOT NULL,
"DeletedAt" BIGINT DEFAULT 0 NOT NULL,
"DataChange_CreatedBy" VARCHAR(64) DEFAULT 'default' NOT NULL,
"DataChange_CreatedTime" TIMESTAMP(0) DEFAULT CURRENT_TIMESTAMP() NOT NULL,
"DataChange_LastModifiedBy" VARCHAR(64) DEFAULT '',
"DataChange_LastTime" TIMESTAMP(0) DEFAULT CURRENT_TIMESTAMP(),
NOT CLUSTER PRIMARY KEY("Id"),
CONSTRAINT "UK_RoleName_DeletedAt" UNIQUE("RoleName", "DeletedAt")) STORAGE(ON "apolloportaldb", CLUSTERBTR) ;

COMMENT ON TABLE "APOLLOPORTALDB"."Role" IS '角色表';
COMMENT ON COLUMN "APOLLOPORTALDB"."Role"."DataChange_CreatedBy" IS '创建人邮箱前缀';
COMMENT ON COLUMN "APOLLOPORTALDB"."Role"."DataChange_CreatedTime" IS '创建时间';
COMMENT ON COLUMN "APOLLOPORTALDB"."Role"."DataChange_LastModifiedBy" IS '最后修改人邮箱前缀';
COMMENT ON COLUMN "APOLLOPORTALDB"."Role"."DataChange_LastTime" IS '最后修改时间';
COMMENT ON COLUMN "APOLLOPORTALDB"."Role"."DeletedAt" IS 'Delete timestamp based on milliseconds';
COMMENT ON COLUMN "APOLLOPORTALDB"."Role"."Id" IS '自增Id';
COMMENT ON COLUMN "APOLLOPORTALDB"."Role"."IsDeleted" IS '1: deleted, 0: normal';
COMMENT ON COLUMN "APOLLOPORTALDB"."Role"."RoleName" IS 'Role name';


CREATE OR REPLACE  INDEX "APOLLOPORTALDB"."INDEX157177429274200" ON "APOLLOPORTALDB"."Role"("DataChange_LastTime" ASC) STORAGE(ON "apolloportaldb", CLUSTERBTR) ;

CREATE TABLE "APOLLOPORTALDB"."RolePermission"
(
"Id" BIGINT IDENTITY(1, 1) NOT NULL,
"RoleId" BIGINT,
"PermissionId" BIGINT,
"IsDeleted" BIT DEFAULT 0 NOT NULL,
"DeletedAt" BIGINT DEFAULT 0 NOT NULL,
"DataChange_CreatedBy" VARCHAR(64) DEFAULT 'default' NOT NULL,
"DataChange_CreatedTime" TIMESTAMP(0) DEFAULT CURRENT_TIMESTAMP() NOT NULL,
"DataChange_LastModifiedBy" VARCHAR(64) DEFAULT '',
"DataChange_LastTime" TIMESTAMP(0) DEFAULT CURRENT_TIMESTAMP(),
NOT CLUSTER PRIMARY KEY("Id"),
CONSTRAINT "UK_RoleId_PermissionId_DeletedAt" UNIQUE("RoleId", "PermissionId", "DeletedAt"),
CHECK("RoleId" >= 0)
,CHECK("PermissionId" >= 0)) STORAGE(ON "apolloportaldb", CLUSTERBTR) ;

COMMENT ON TABLE "APOLLOPORTALDB"."RolePermission" IS '角色和权限的绑定表';
COMMENT ON COLUMN "APOLLOPORTALDB"."RolePermission"."DataChange_CreatedBy" IS '创建人邮箱前缀';
COMMENT ON COLUMN "APOLLOPORTALDB"."RolePermission"."DataChange_CreatedTime" IS '创建时间';
COMMENT ON COLUMN "APOLLOPORTALDB"."RolePermission"."DataChange_LastModifiedBy" IS '最后修改人邮箱前缀';
COMMENT ON COLUMN "APOLLOPORTALDB"."RolePermission"."DataChange_LastTime" IS '最后修改时间';
COMMENT ON COLUMN "APOLLOPORTALDB"."RolePermission"."DeletedAt" IS 'Delete timestamp based on milliseconds';
COMMENT ON COLUMN "APOLLOPORTALDB"."RolePermission"."Id" IS '自增Id';
COMMENT ON COLUMN "APOLLOPORTALDB"."RolePermission"."IsDeleted" IS '1: deleted, 0: normal';
COMMENT ON COLUMN "APOLLOPORTALDB"."RolePermission"."PermissionId" IS 'Permission Id';
COMMENT ON COLUMN "APOLLOPORTALDB"."RolePermission"."RoleId" IS 'Role Id';


CREATE OR REPLACE  INDEX "APOLLOPORTALDB"."INDEX157177741615700" ON "APOLLOPORTALDB"."RolePermission"("DataChange_LastTime" ASC) STORAGE(ON "apolloportaldb", CLUSTERBTR) ;
CREATE OR REPLACE  INDEX "APOLLOPORTALDB"."IX_PermissionId" ON "APOLLOPORTALDB"."RolePermission"("PermissionId" ASC) STORAGE(ON "apolloportaldb", CLUSTERBTR) ;

CREATE TABLE "APOLLOPORTALDB"."ServerConfig"
(
"Id" BIGINT IDENTITY(9, 1) NOT NULL,
"Key" VARCHAR(64) DEFAULT 'default' NOT NULL,
"Value" VARCHAR(2048) DEFAULT 'default' NOT NULL,
"Comment" VARCHAR(1024) DEFAULT '',
"IsDeleted" BIT DEFAULT 0 NOT NULL,
"DeletedAt" BIGINT DEFAULT 0 NOT NULL,
"DataChange_CreatedBy" VARCHAR(64) DEFAULT 'default' NOT NULL,
"DataChange_CreatedTime" TIMESTAMP(0) DEFAULT CURRENT_TIMESTAMP() NOT NULL,
"DataChange_LastModifiedBy" VARCHAR(64) DEFAULT '',
"DataChange_LastTime" TIMESTAMP(0) DEFAULT CURRENT_TIMESTAMP(),
NOT CLUSTER PRIMARY KEY("Id"),
CONSTRAINT "UK_Key_DeletedAt" UNIQUE("Key", "DeletedAt")) STORAGE(ON "apolloportaldb", CLUSTERBTR) ;

COMMENT ON TABLE "APOLLOPORTALDB"."ServerConfig" IS '配置服务自身配置';
COMMENT ON COLUMN "APOLLOPORTALDB"."ServerConfig"."Comment" IS '注释';
COMMENT ON COLUMN "APOLLOPORTALDB"."ServerConfig"."DataChange_CreatedBy" IS '创建人邮箱前缀';
COMMENT ON COLUMN "APOLLOPORTALDB"."ServerConfig"."DataChange_CreatedTime" IS '创建时间';
COMMENT ON COLUMN "APOLLOPORTALDB"."ServerConfig"."DataChange_LastModifiedBy" IS '最后修改人邮箱前缀';
COMMENT ON COLUMN "APOLLOPORTALDB"."ServerConfig"."DataChange_LastTime" IS '最后修改时间';
COMMENT ON COLUMN "APOLLOPORTALDB"."ServerConfig"."DeletedAt" IS 'Delete timestamp based on milliseconds';
COMMENT ON COLUMN "APOLLOPORTALDB"."ServerConfig"."Id" IS '自增Id';
COMMENT ON COLUMN "APOLLOPORTALDB"."ServerConfig"."IsDeleted" IS '1: deleted, 0: normal';
COMMENT ON COLUMN "APOLLOPORTALDB"."ServerConfig"."Key" IS '配置项Key';
COMMENT ON COLUMN "APOLLOPORTALDB"."ServerConfig"."Value" IS '配置项值';


CREATE OR REPLACE  INDEX "APOLLOPORTALDB"."INDEX157177461424200" ON "APOLLOPORTALDB"."ServerConfig"("DataChange_LastTime" ASC) STORAGE(ON "apolloportaldb", CLUSTERBTR) ;

CREATE TABLE "APOLLOPORTALDB"."SPRING_SESSION"
(
"PRIMARY_ID" CHAR(36) NOT NULL,
"SESSION_ID" CHAR(36) NOT NULL,
"CREATION_TIME" BIGINT NOT NULL,
"LAST_ACCESS_TIME" BIGINT NOT NULL,
"MAX_INACTIVE_INTERVAL" INT NOT NULL,
"EXPIRY_TIME" BIGINT NOT NULL,
"PRINCIPAL_NAME" VARCHAR(100),
NOT CLUSTER PRIMARY KEY("PRIMARY_ID"),
CONSTRAINT "SPRING_SESSION_IX1" UNIQUE("SESSION_ID")) STORAGE(ON "apolloportaldb", CLUSTERBTR) ;

CREATE OR REPLACE  INDEX "APOLLOPORTALDB"."SPRING_SESSION_IX2" ON "APOLLOPORTALDB"."SPRING_SESSION"("EXPIRY_TIME" ASC) STORAGE(ON "apolloportaldb", CLUSTERBTR) ;
CREATE OR REPLACE  INDEX "APOLLOPORTALDB"."SPRING_SESSION_IX3" ON "APOLLOPORTALDB"."SPRING_SESSION"("PRINCIPAL_NAME" ASC) STORAGE(ON "apolloportaldb", CLUSTERBTR) ;

CREATE TABLE "APOLLOPORTALDB"."SPRING_SESSION_ATTRIBUTES"
(
"SESSION_PRIMARY_ID" CHAR(36) NOT NULL,
"ATTRIBUTE_NAME" VARCHAR(200) NOT NULL,
"ATTRIBUTE_BYTES" BLOB NOT NULL,
NOT CLUSTER PRIMARY KEY("SESSION_PRIMARY_ID", "ATTRIBUTE_NAME"),
CONSTRAINT "SPRING_SESSION_ATTRIBUTES_FK" FOREIGN KEY("SESSION_PRIMARY_ID") REFERENCES "APOLLOPORTALDB"."SPRING_SESSION"("PRIMARY_ID") ON DELETE CASCADE  WITH INDEX ) STORAGE(ON "apolloportaldb", CLUSTERBTR) ;

CREATE TABLE "APOLLOPORTALDB"."UserRole"
(
"Id" BIGINT IDENTITY(1, 1) NOT NULL,
"UserId" VARCHAR(128) DEFAULT '',
"RoleId" BIGINT,
"IsDeleted" BIT DEFAULT 0 NOT NULL,
"DeletedAt" BIGINT DEFAULT 0 NOT NULL,
"DataChange_CreatedBy" VARCHAR(64) DEFAULT 'default' NOT NULL,
"DataChange_CreatedTime" TIMESTAMP(0) DEFAULT CURRENT_TIMESTAMP() NOT NULL,
"DataChange_LastModifiedBy" VARCHAR(64) DEFAULT '',
"DataChange_LastTime" TIMESTAMP(0) DEFAULT CURRENT_TIMESTAMP(),
NOT CLUSTER PRIMARY KEY("Id"),
CONSTRAINT "UK_UserId_RoleId_DeletedAt" UNIQUE("UserId", "RoleId", "DeletedAt"),
CHECK("RoleId" >= 0)) STORAGE(ON "apolloportaldb", CLUSTERBTR) ;

COMMENT ON TABLE "APOLLOPORTALDB"."UserRole" IS '用户和role的绑定表';
COMMENT ON COLUMN "APOLLOPORTALDB"."UserRole"."DataChange_CreatedBy" IS '创建人邮箱前缀';
COMMENT ON COLUMN "APOLLOPORTALDB"."UserRole"."DataChange_CreatedTime" IS '创建时间';
COMMENT ON COLUMN "APOLLOPORTALDB"."UserRole"."DataChange_LastModifiedBy" IS '最后修改人邮箱前缀';
COMMENT ON COLUMN "APOLLOPORTALDB"."UserRole"."DataChange_LastTime" IS '最后修改时间';
COMMENT ON COLUMN "APOLLOPORTALDB"."UserRole"."DeletedAt" IS 'Delete timestamp based on milliseconds';
COMMENT ON COLUMN "APOLLOPORTALDB"."UserRole"."Id" IS '自增Id';
COMMENT ON COLUMN "APOLLOPORTALDB"."UserRole"."IsDeleted" IS '1: deleted, 0: normal';
COMMENT ON COLUMN "APOLLOPORTALDB"."UserRole"."RoleId" IS 'Role Id';
COMMENT ON COLUMN "APOLLOPORTALDB"."UserRole"."UserId" IS '用户身份标识';


CREATE OR REPLACE  INDEX "APOLLOPORTALDB"."INDEX157177763142300" ON "APOLLOPORTALDB"."UserRole"("RoleId" ASC) STORAGE(ON "apolloportaldb", CLUSTERBTR) ;
CREATE OR REPLACE  INDEX "APOLLOPORTALDB"."INDEX157177775453000" ON "APOLLOPORTALDB"."UserRole"("DataChange_LastTime" ASC) STORAGE(ON "apolloportaldb", CLUSTERBTR) ;

CREATE TABLE "APOLLOPORTALDB"."Users"
(
"Id" BIGINT IDENTITY(2, 1) NOT NULL,
"Username" VARCHAR(64) DEFAULT 'default' NOT NULL,
"Password" VARCHAR(512) DEFAULT 'default' NOT NULL,
"UserDisplayName" VARCHAR(512) DEFAULT 'default' NOT NULL,
"Email" VARCHAR(64) DEFAULT 'default' NOT NULL,
"Enabled" TINYINT,
NOT CLUSTER PRIMARY KEY("Id"),
CONSTRAINT "UK_Username" UNIQUE("Username")) STORAGE(ON "apolloportaldb", CLUSTERBTR) ;

COMMENT ON TABLE "APOLLOPORTALDB"."Users" IS '用户表';
COMMENT ON COLUMN "APOLLOPORTALDB"."Users"."Email" IS '邮箱地址';
COMMENT ON COLUMN "APOLLOPORTALDB"."Users"."Enabled" IS '是否有效';
COMMENT ON COLUMN "APOLLOPORTALDB"."Users"."Id" IS '自增Id';
COMMENT ON COLUMN "APOLLOPORTALDB"."Users"."Password" IS '密码';
COMMENT ON COLUMN "APOLLOPORTALDB"."Users"."UserDisplayName" IS '用户名称';
COMMENT ON COLUMN "APOLLOPORTALDB"."Users"."Username" IS '用户登录账户';



INSERT INTO "APOLLOPORTALDB"."ServerConfig" ("Key", "Value", "Comment")
VALUES
    ('apollo.portal.envs', 'dev', '可支持的环境列表'),
    ('organizations', '[{"orgId":"TEST1","orgName":"样例部门1"},{"orgId":"TEST2","orgName":"样例部门2"}]', '部门列表'),
    ('superAdmin', 'apollo', 'Portal超级管理员'),
    ('api.readTimeout', '10000', 'http接口read timeout'),
    ('consumer.token.salt', 'someSalt', 'consumer token salt'),
    ('admin.createPrivateNamespace.switch', 'true', '是否允许项目管理员创建私有namespace'),
    ('configView.memberOnly.envs', 'pro', '只对项目成员显示配置信息的环境列表，多个env以英文逗号分隔'),
    ('apollo.portal.meta.servers', '{}', '各环境Meta Service列表');


INSERT INTO "APOLLOPORTALDB"."Users" ("Username", "Password", "UserDisplayName", "Email", "Enabled")
VALUES
	('apollo', '$2a$10$7r20uS.BQ9uBpf3Baj3uQOZvMVvB1RN3PYoKE94gtz2.WAOuiiwXS', 'apollo', 'apollo@acme.com', 1);

INSERT INTO "APOLLOPORTALDB"."Authorities" ("Username", "Authority") VALUES ('apollo', 'ROLE_user');