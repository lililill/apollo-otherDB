CREATE TABLE "APOLLOCONFIGDB"."AccessKey"
(
"Id" BIGINT IDENTITY(1, 1) NOT NULL,
"AppId" VARCHAR(64) DEFAULT 'default' NOT NULL,
"Secret" VARCHAR(128) DEFAULT '' NOT NULL,
"IsEnabled" BIT DEFAULT 0 NOT NULL,
"IsDeleted" BIT DEFAULT 0 NOT NULL,
"DeletedAt" BIGINT DEFAULT 0 NOT NULL,
"DataChange_CreatedBy" VARCHAR(64) DEFAULT 'default' NOT NULL,
"DataChange_CreatedTime" TIMESTAMP(0) DEFAULT CURRENT_TIMESTAMP() NOT NULL,
"DataChange_LastModifiedBy" VARCHAR(64) DEFAULT '',
"DataChange_LastTime" TIMESTAMP(0) DEFAULT CURRENT_TIMESTAMP() NOT NULL,
NOT CLUSTER PRIMARY KEY("Id"),
CONSTRAINT "UK_AppId_Secret_DeletedAt" UNIQUE("AppId", "Secret", "DeletedAt")) STORAGE(ON "apolloconfigdb", CLUSTERBTR) ;

COMMENT ON TABLE "APOLLOCONFIGDB"."AccessKey" IS '访问密钥';
COMMENT ON COLUMN "APOLLOCONFIGDB"."AccessKey"."AppId" IS 'AppID';
COMMENT ON COLUMN "APOLLOCONFIGDB"."AccessKey"."DataChange_CreatedBy" IS '创建人邮箱前缀';
COMMENT ON COLUMN "APOLLOCONFIGDB"."AccessKey"."DataChange_CreatedTime" IS '创建时间';
COMMENT ON COLUMN "APOLLOCONFIGDB"."AccessKey"."DataChange_LastModifiedBy" IS '最后修改人邮箱前缀';
COMMENT ON COLUMN "APOLLOCONFIGDB"."AccessKey"."DataChange_LastTime" IS '最后修改时间';
COMMENT ON COLUMN "APOLLOCONFIGDB"."AccessKey"."DeletedAt" IS 'Delete timestamp based on milliseconds';
COMMENT ON COLUMN "APOLLOCONFIGDB"."AccessKey"."Id" IS '自增主键';
COMMENT ON COLUMN "APOLLOCONFIGDB"."AccessKey"."IsDeleted" IS '1: deleted, 0: normal';
COMMENT ON COLUMN "APOLLOCONFIGDB"."AccessKey"."IsEnabled" IS '1: enabled, 0: disabled';
COMMENT ON COLUMN "APOLLOCONFIGDB"."AccessKey"."Secret" IS 'Secret';


CREATE OR REPLACE  INDEX "APOLLOCONFIGDB"."INDEX157260920624300" ON "APOLLOCONFIGDB"."AccessKey"("DataChange_LastTime" ASC) STORAGE(ON "apolloconfigdb", CLUSTERBTR) ;

CREATE TABLE "APOLLOCONFIGDB"."App"
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
CONSTRAINT "UK_AppId_DeletedAt" UNIQUE("AppId", "DeletedAt")) STORAGE(ON "apolloconfigdb", CLUSTERBTR) ;

COMMENT ON TABLE "APOLLOCONFIGDB"."App" IS '应用表';
COMMENT ON COLUMN "APOLLOCONFIGDB"."App"."AppId" IS 'AppID';
COMMENT ON COLUMN "APOLLOCONFIGDB"."App"."DataChange_CreatedBy" IS '创建人邮箱前缀';
COMMENT ON COLUMN "APOLLOCONFIGDB"."App"."DataChange_CreatedTime" IS '创建时间';
COMMENT ON COLUMN "APOLLOCONFIGDB"."App"."DataChange_LastModifiedBy" IS '最后修改人邮箱前缀';
COMMENT ON COLUMN "APOLLOCONFIGDB"."App"."DataChange_LastTime" IS '最后修改时间';
COMMENT ON COLUMN "APOLLOCONFIGDB"."App"."DeletedAt" IS 'Delete timestamp based on milliseconds';
COMMENT ON COLUMN "APOLLOCONFIGDB"."App"."Id" IS '主键';
COMMENT ON COLUMN "APOLLOCONFIGDB"."App"."IsDeleted" IS '1: deleted, 0: normal';
COMMENT ON COLUMN "APOLLOCONFIGDB"."App"."Name" IS '应用名';
COMMENT ON COLUMN "APOLLOCONFIGDB"."App"."OrgId" IS '部门Id';
COMMENT ON COLUMN "APOLLOCONFIGDB"."App"."OrgName" IS '部门名字';
COMMENT ON COLUMN "APOLLOCONFIGDB"."App"."OwnerEmail" IS 'ownerEmail';
COMMENT ON COLUMN "APOLLOCONFIGDB"."App"."OwnerName" IS 'ownerName';


CREATE OR REPLACE  INDEX "APOLLOCONFIGDB"."INDEX157260934188900" ON "APOLLOCONFIGDB"."App"("DataChange_LastTime" ASC) STORAGE(ON "apolloconfigdb", CLUSTERBTR) ;
CREATE OR REPLACE  INDEX "APOLLOCONFIGDB"."IX_Name" ON "APOLLOCONFIGDB"."App"("Name" ASC) STORAGE(ON "apolloconfigdb", CLUSTERBTR) ;

CREATE TABLE "APOLLOCONFIGDB"."AppNamespace"
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
CONSTRAINT "UK_AppId_Name_DeletedAt" UNIQUE("AppId", "Name", "DeletedAt")) STORAGE(ON "apolloconfigdb", CLUSTERBTR) ;

COMMENT ON TABLE "APOLLOCONFIGDB"."AppNamespace" IS '应用namespace定义';
COMMENT ON COLUMN "APOLLOCONFIGDB"."AppNamespace"."AppId" IS 'app id';
COMMENT ON COLUMN "APOLLOCONFIGDB"."AppNamespace"."Comment" IS '注释';
COMMENT ON COLUMN "APOLLOCONFIGDB"."AppNamespace"."DataChange_CreatedBy" IS '创建人邮箱前缀';
COMMENT ON COLUMN "APOLLOCONFIGDB"."AppNamespace"."DataChange_CreatedTime" IS '创建时间';
COMMENT ON COLUMN "APOLLOCONFIGDB"."AppNamespace"."DataChange_LastModifiedBy" IS '最后修改人邮箱前缀';
COMMENT ON COLUMN "APOLLOCONFIGDB"."AppNamespace"."DataChange_LastTime" IS '最后修改时间';
COMMENT ON COLUMN "APOLLOCONFIGDB"."AppNamespace"."DeletedAt" IS 'Delete timestamp based on milliseconds';
COMMENT ON COLUMN "APOLLOCONFIGDB"."AppNamespace"."Format" IS 'namespace的format类型';
COMMENT ON COLUMN "APOLLOCONFIGDB"."AppNamespace"."Id" IS '自增主键';
COMMENT ON COLUMN "APOLLOCONFIGDB"."AppNamespace"."IsDeleted" IS '1: deleted, 0: normal';
COMMENT ON COLUMN "APOLLOCONFIGDB"."AppNamespace"."IsPublic" IS 'namespace是否为公共';
COMMENT ON COLUMN "APOLLOCONFIGDB"."AppNamespace"."Name" IS 'namespace名字，注意，需要全局唯一';


CREATE OR REPLACE  INDEX "APOLLOCONFIGDB"."Name_AppId" ON "APOLLOCONFIGDB"."AppNamespace"("Name" ASC,"AppId" ASC) STORAGE(ON "apolloconfigdb", CLUSTERBTR) ;
CREATE OR REPLACE  INDEX "APOLLOCONFIGDB"."INDEX157260972368500" ON "APOLLOCONFIGDB"."AppNamespace"("DataChange_LastTime" ASC) STORAGE(ON "apolloconfigdb", CLUSTERBTR) ;

CREATE TABLE "APOLLOCONFIGDB"."Audit"
(
"Id" BIGINT IDENTITY(1, 1) NOT NULL,
"EntityName" VARCHAR(50) DEFAULT 'default' NOT NULL,
"EntityId" BIGINT,
"OpName" VARCHAR(50) DEFAULT 'default' NOT NULL,
"Comment" VARCHAR(500),
"IsDeleted" BIT DEFAULT 0 NOT NULL,
"DeletedAt" BIGINT DEFAULT 0 NOT NULL,
"DataChange_CreatedBy" VARCHAR(64) DEFAULT 'default' NOT NULL,
"DataChange_CreatedTime" TIMESTAMP(0) DEFAULT CURRENT_TIMESTAMP() NOT NULL,
"DataChange_LastModifiedBy" VARCHAR(64) DEFAULT '',
"DataChange_LastTime" TIMESTAMP(0) DEFAULT CURRENT_TIMESTAMP(),
NOT CLUSTER PRIMARY KEY("Id"),
CHECK("EntityId" >= 0)) STORAGE(ON "apolloconfigdb", CLUSTERBTR) ;

COMMENT ON TABLE "APOLLOCONFIGDB"."Audit" IS '日志审计表';
COMMENT ON COLUMN "APOLLOCONFIGDB"."Audit"."Comment" IS '备注';
COMMENT ON COLUMN "APOLLOCONFIGDB"."Audit"."DataChange_CreatedBy" IS '创建人邮箱前缀';
COMMENT ON COLUMN "APOLLOCONFIGDB"."Audit"."DataChange_CreatedTime" IS '创建时间';
COMMENT ON COLUMN "APOLLOCONFIGDB"."Audit"."DataChange_LastModifiedBy" IS '最后修改人邮箱前缀';
COMMENT ON COLUMN "APOLLOCONFIGDB"."Audit"."DataChange_LastTime" IS '最后修改时间';
COMMENT ON COLUMN "APOLLOCONFIGDB"."Audit"."DeletedAt" IS 'Delete timestamp based on milliseconds';
COMMENT ON COLUMN "APOLLOCONFIGDB"."Audit"."EntityId" IS '记录ID';
COMMENT ON COLUMN "APOLLOCONFIGDB"."Audit"."EntityName" IS '表名';
COMMENT ON COLUMN "APOLLOCONFIGDB"."Audit"."Id" IS '主键';
COMMENT ON COLUMN "APOLLOCONFIGDB"."Audit"."IsDeleted" IS '1: deleted, 0: normal';
COMMENT ON COLUMN "APOLLOCONFIGDB"."Audit"."OpName" IS '操作类型';


CREATE OR REPLACE  INDEX "APOLLOCONFIGDB"."INDEX157260985146100" ON "APOLLOCONFIGDB"."Audit"("DataChange_LastTime" ASC) STORAGE(ON "apolloconfigdb", CLUSTERBTR) ;

CREATE TABLE "APOLLOCONFIGDB"."AuditLog"
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
NOT CLUSTER PRIMARY KEY("Id")) STORAGE(ON "apolloconfigdb", CLUSTERBTR) ;

COMMENT ON TABLE "APOLLOCONFIGDB"."AuditLog" IS '审计日志表';
COMMENT ON COLUMN "APOLLOCONFIGDB"."AuditLog"."DataChange_CreatedBy" IS '创建人邮箱前缀';
COMMENT ON COLUMN "APOLLOCONFIGDB"."AuditLog"."DataChange_CreatedTime" IS '创建时间';
COMMENT ON COLUMN "APOLLOCONFIGDB"."AuditLog"."DataChange_LastModifiedBy" IS '最后修改人邮箱前缀';
COMMENT ON COLUMN "APOLLOCONFIGDB"."AuditLog"."DataChange_LastTime" IS '最后修改时间';
COMMENT ON COLUMN "APOLLOCONFIGDB"."AuditLog"."DeletedAt" IS 'Delete timestamp based on milliseconds';
COMMENT ON COLUMN "APOLLOCONFIGDB"."AuditLog"."Description" IS '备注';
COMMENT ON COLUMN "APOLLOCONFIGDB"."AuditLog"."FollowsFromSpanId" IS '上一个兄弟跨度ID';
COMMENT ON COLUMN "APOLLOCONFIGDB"."AuditLog"."Id" IS '主键';
COMMENT ON COLUMN "APOLLOCONFIGDB"."AuditLog"."IsDeleted" IS '1: deleted, 0: normal';
COMMENT ON COLUMN "APOLLOCONFIGDB"."AuditLog"."Operator" IS '操作人';
COMMENT ON COLUMN "APOLLOCONFIGDB"."AuditLog"."OpName" IS '操作名称';
COMMENT ON COLUMN "APOLLOCONFIGDB"."AuditLog"."OpType" IS '操作类型';
COMMENT ON COLUMN "APOLLOCONFIGDB"."AuditLog"."ParentSpanId" IS '父跨度ID';
COMMENT ON COLUMN "APOLLOCONFIGDB"."AuditLog"."SpanId" IS '跨度ID';
COMMENT ON COLUMN "APOLLOCONFIGDB"."AuditLog"."TraceId" IS '链路全局唯一ID';


CREATE OR REPLACE  INDEX "APOLLOCONFIGDB"."IX_Operator" ON "APOLLOCONFIGDB"."AuditLog"("Operator" ASC) STORAGE(ON "apolloconfigdb", CLUSTERBTR) ;
CREATE OR REPLACE  INDEX "APOLLOCONFIGDB"."IX_TraceId" ON "APOLLOCONFIGDB"."AuditLog"("TraceId" ASC) STORAGE(ON "apolloconfigdb", CLUSTERBTR) ;
CREATE OR REPLACE  INDEX "APOLLOCONFIGDB"."IX_OpName" ON "APOLLOCONFIGDB"."AuditLog"("OpName" ASC) STORAGE(ON "apolloconfigdb", CLUSTERBTR) ;
CREATE OR REPLACE  INDEX "APOLLOCONFIGDB"."IX_DataChange_CreatedTime" ON "APOLLOCONFIGDB"."AuditLog"("DataChange_CreatedTime" ASC) STORAGE(ON "apolloconfigdb", CLUSTERBTR) ;

CREATE TABLE "APOLLOCONFIGDB"."AuditLogDataInfluence"
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
NOT CLUSTER PRIMARY KEY("Id")) STORAGE(ON "apolloconfigdb", CLUSTERBTR) ;

COMMENT ON TABLE "APOLLOCONFIGDB"."AuditLogDataInfluence" IS '审计日志数据变动表';
COMMENT ON COLUMN "APOLLOCONFIGDB"."AuditLogDataInfluence"."DataChange_CreatedBy" IS '创建人邮箱前缀';
COMMENT ON COLUMN "APOLLOCONFIGDB"."AuditLogDataInfluence"."DataChange_CreatedTime" IS '创建时间';
COMMENT ON COLUMN "APOLLOCONFIGDB"."AuditLogDataInfluence"."DataChange_LastModifiedBy" IS '最后修改人邮箱前缀';
COMMENT ON COLUMN "APOLLOCONFIGDB"."AuditLogDataInfluence"."DataChange_LastTime" IS '最后修改时间';
COMMENT ON COLUMN "APOLLOCONFIGDB"."AuditLogDataInfluence"."DeletedAt" IS 'Delete timestamp based on milliseconds';
COMMENT ON COLUMN "APOLLOCONFIGDB"."AuditLogDataInfluence"."FieldName" IS '字段名称';
COMMENT ON COLUMN "APOLLOCONFIGDB"."AuditLogDataInfluence"."FieldNewValue" IS '字段新值';
COMMENT ON COLUMN "APOLLOCONFIGDB"."AuditLogDataInfluence"."FieldOldValue" IS '字段旧值';
COMMENT ON COLUMN "APOLLOCONFIGDB"."AuditLogDataInfluence"."Id" IS '主键';
COMMENT ON COLUMN "APOLLOCONFIGDB"."AuditLogDataInfluence"."InfluenceEntityId" IS '记录ID';
COMMENT ON COLUMN "APOLLOCONFIGDB"."AuditLogDataInfluence"."InfluenceEntityName" IS '表名';
COMMENT ON COLUMN "APOLLOCONFIGDB"."AuditLogDataInfluence"."IsDeleted" IS '1: deleted, 0: normal';
COMMENT ON COLUMN "APOLLOCONFIGDB"."AuditLogDataInfluence"."SpanId" IS '跨度ID';


CREATE OR REPLACE  INDEX "APOLLOCONFIGDB"."IX_EntityId" ON "APOLLOCONFIGDB"."AuditLogDataInfluence"("InfluenceEntityId" ASC) STORAGE(ON "apolloconfigdb", CLUSTERBTR) ;
CREATE OR REPLACE  INDEX "APOLLOCONFIGDB"."IX_SpanId" ON "APOLLOCONFIGDB"."AuditLogDataInfluence"("SpanId" ASC) STORAGE(ON "apolloconfigdb", CLUSTERBTR) ;
CREATE OR REPLACE  INDEX "APOLLOCONFIGDB"."INDEX157260453497800" ON "APOLLOCONFIGDB"."AuditLogDataInfluence"("DataChange_CreatedTime" ASC) STORAGE(ON "apolloconfigdb", CLUSTERBTR) ;

CREATE TABLE "APOLLOCONFIGDB"."Cluster"
(
"Id" BIGINT IDENTITY(1, 1) NOT NULL,
"Name" VARCHAR(32) DEFAULT '' NOT NULL,
"AppId" VARCHAR(64) DEFAULT '' NOT NULL,
"ParentClusterId" BIGINT DEFAULT 0 NOT NULL,
"IsDeleted" BIT DEFAULT 0 NOT NULL,
"DeletedAt" BIGINT DEFAULT 0 NOT NULL,
"DataChange_CreatedBy" VARCHAR(64) DEFAULT 'default' NOT NULL,
"DataChange_CreatedTime" TIMESTAMP(0) DEFAULT CURRENT_TIMESTAMP() NOT NULL,
"DataChange_LastModifiedBy" VARCHAR(64) DEFAULT '',
"DataChange_LastTime" TIMESTAMP(0) DEFAULT CURRENT_TIMESTAMP(),
NOT CLUSTER PRIMARY KEY("Id"),
UNIQUE("AppId", "Name", "DeletedAt"),
CHECK("ParentClusterId" >= 0)) STORAGE(ON "apolloconfigdb", CLUSTERBTR) ;

COMMENT ON TABLE "APOLLOCONFIGDB"."Cluster" IS '集群';
COMMENT ON COLUMN "APOLLOCONFIGDB"."Cluster"."AppId" IS 'App id';
COMMENT ON COLUMN "APOLLOCONFIGDB"."Cluster"."DataChange_CreatedBy" IS '创建人邮箱前缀';
COMMENT ON COLUMN "APOLLOCONFIGDB"."Cluster"."DataChange_CreatedTime" IS '创建时间';
COMMENT ON COLUMN "APOLLOCONFIGDB"."Cluster"."DataChange_LastModifiedBy" IS '最后修改人邮箱前缀';
COMMENT ON COLUMN "APOLLOCONFIGDB"."Cluster"."DataChange_LastTime" IS '最后修改时间';
COMMENT ON COLUMN "APOLLOCONFIGDB"."Cluster"."DeletedAt" IS 'Delete timestamp based on milliseconds';
COMMENT ON COLUMN "APOLLOCONFIGDB"."Cluster"."Id" IS '自增主键';
COMMENT ON COLUMN "APOLLOCONFIGDB"."Cluster"."IsDeleted" IS '1: deleted, 0: normal';
COMMENT ON COLUMN "APOLLOCONFIGDB"."Cluster"."Name" IS '集群名字';
COMMENT ON COLUMN "APOLLOCONFIGDB"."Cluster"."ParentClusterId" IS '父cluster';


CREATE OR REPLACE  INDEX "APOLLOCONFIGDB"."INDEX157261644931400" ON "APOLLOCONFIGDB"."Cluster"("DataChange_LastTime" ASC) STORAGE(ON "apolloconfigdb", CLUSTERBTR) ;
CREATE OR REPLACE  INDEX "APOLLOCONFIGDB"."IX_ParentClusterId" ON "APOLLOCONFIGDB"."Cluster"("ParentClusterId" ASC) STORAGE(ON "apolloconfigdb", CLUSTERBTR) ;

CREATE TABLE "APOLLOCONFIGDB"."Commit"
(
"Id" BIGINT IDENTITY(1, 1) NOT NULL,
"ChangeSets" CLOB NOT NULL,
"AppId" VARCHAR(64) DEFAULT 'default' NOT NULL,
"ClusterName" VARCHAR(500) DEFAULT 'default' NOT NULL,
"NamespaceName" VARCHAR(500) DEFAULT 'default' NOT NULL,
"Comment" VARCHAR(500),
"IsDeleted" BIT DEFAULT 0 NOT NULL,
"DeletedAt" BIGINT DEFAULT 0 NOT NULL,
"DataChange_CreatedBy" VARCHAR(64) DEFAULT 'default' NOT NULL,
"DataChange_CreatedTime" TIMESTAMP(0) DEFAULT CURRENT_TIMESTAMP() NOT NULL,
"DataChange_LastModifiedBy" VARCHAR(64) DEFAULT '',
"DataChange_LastTime" TIMESTAMP(0) DEFAULT CURRENT_TIMESTAMP(),
NOT CLUSTER PRIMARY KEY("Id")) STORAGE(ON "apolloconfigdb", CLUSTERBTR) ;

COMMENT ON TABLE "APOLLOCONFIGDB"."Commit" IS 'commit 历史表';
COMMENT ON COLUMN "APOLLOCONFIGDB"."Commit"."AppId" IS 'AppID';
COMMENT ON COLUMN "APOLLOCONFIGDB"."Commit"."ChangeSets" IS '修改变更集';
COMMENT ON COLUMN "APOLLOCONFIGDB"."Commit"."ClusterName" IS 'ClusterName';
COMMENT ON COLUMN "APOLLOCONFIGDB"."Commit"."Comment" IS '备注';
COMMENT ON COLUMN "APOLLOCONFIGDB"."Commit"."DataChange_CreatedBy" IS '创建人邮箱前缀';
COMMENT ON COLUMN "APOLLOCONFIGDB"."Commit"."DataChange_CreatedTime" IS '创建时间';
COMMENT ON COLUMN "APOLLOCONFIGDB"."Commit"."DataChange_LastModifiedBy" IS '最后修改人邮箱前缀';
COMMENT ON COLUMN "APOLLOCONFIGDB"."Commit"."DataChange_LastTime" IS '最后修改时间';
COMMENT ON COLUMN "APOLLOCONFIGDB"."Commit"."DeletedAt" IS 'Delete timestamp based on milliseconds';
COMMENT ON COLUMN "APOLLOCONFIGDB"."Commit"."Id" IS '主键';
COMMENT ON COLUMN "APOLLOCONFIGDB"."Commit"."IsDeleted" IS '1: deleted, 0: normal';
COMMENT ON COLUMN "APOLLOCONFIGDB"."Commit"."NamespaceName" IS 'namespaceName';


CREATE OR REPLACE  INDEX "APOLLOCONFIGDB"."DataChange_LastTime" ON "APOLLOCONFIGDB"."Commit"("DataChange_LastTime" ASC) STORAGE(ON "apolloconfigdb", CLUSTERBTR) ;
CREATE OR REPLACE  INDEX "APOLLOCONFIGDB"."AppId" ON "APOLLOCONFIGDB"."Commit"("AppId" ASC) STORAGE(ON "apolloconfigdb", CLUSTERBTR) ;
CREATE OR REPLACE  INDEX "APOLLOCONFIGDB"."ClusterName" ON "APOLLOCONFIGDB"."Commit"("ClusterName" ASC) STORAGE(ON "apolloconfigdb", CLUSTERBTR) ;
CREATE OR REPLACE  INDEX "APOLLOCONFIGDB"."NamespaceName" ON "APOLLOCONFIGDB"."Commit"("NamespaceName" ASC) STORAGE(ON "apolloconfigdb", CLUSTERBTR) ;

CREATE TABLE "APOLLOCONFIGDB"."GrayReleaseRule"
(
"Id" BIGINT IDENTITY(1, 1) NOT NULL,
"AppId" VARCHAR(64) DEFAULT 'default' NOT NULL,
"ClusterName" VARCHAR(32) DEFAULT 'default' NOT NULL,
"NamespaceName" VARCHAR(32) DEFAULT 'default' NOT NULL,
"BranchName" VARCHAR(32) DEFAULT 'default' NOT NULL,
"Rules" VARCHAR(16000) DEFAULT '[]',
"ReleaseId" BIGINT DEFAULT 0 NOT NULL,
"BranchStatus" TINYINT DEFAULT 1,
"IsDeleted" BIT DEFAULT 0 NOT NULL,
"DeletedAt" BIGINT DEFAULT 0 NOT NULL,
"DataChange_CreatedBy" VARCHAR(64) DEFAULT 'default' NOT NULL,
"DataChange_CreatedTime" TIMESTAMP(0) DEFAULT CURRENT_TIMESTAMP() NOT NULL,
"DataChange_LastModifiedBy" VARCHAR(64) DEFAULT '',
"DataChange_LastTime" TIMESTAMP(0) DEFAULT CURRENT_TIMESTAMP(),
NOT CLUSTER PRIMARY KEY("Id"),
CHECK("ReleaseId" >= 0)) STORAGE(ON "apolloconfigdb", CLUSTERBTR) ;

COMMENT ON TABLE "APOLLOCONFIGDB"."GrayReleaseRule" IS '灰度规则表';
COMMENT ON COLUMN "APOLLOCONFIGDB"."GrayReleaseRule"."AppId" IS 'AppID';
COMMENT ON COLUMN "APOLLOCONFIGDB"."GrayReleaseRule"."BranchName" IS 'branch name';
COMMENT ON COLUMN "APOLLOCONFIGDB"."GrayReleaseRule"."BranchStatus" IS '灰度分支状态: 0:删除分支,1:正在使用的规则 2：全量发布';
COMMENT ON COLUMN "APOLLOCONFIGDB"."GrayReleaseRule"."ClusterName" IS 'Cluster Name';
COMMENT ON COLUMN "APOLLOCONFIGDB"."GrayReleaseRule"."DataChange_CreatedBy" IS '创建人邮箱前缀';
COMMENT ON COLUMN "APOLLOCONFIGDB"."GrayReleaseRule"."DataChange_CreatedTime" IS '创建时间';
COMMENT ON COLUMN "APOLLOCONFIGDB"."GrayReleaseRule"."DataChange_LastModifiedBy" IS '最后修改人邮箱前缀';
COMMENT ON COLUMN "APOLLOCONFIGDB"."GrayReleaseRule"."DataChange_LastTime" IS '最后修改时间';
COMMENT ON COLUMN "APOLLOCONFIGDB"."GrayReleaseRule"."DeletedAt" IS 'Delete timestamp based on milliseconds';
COMMENT ON COLUMN "APOLLOCONFIGDB"."GrayReleaseRule"."Id" IS '主键';
COMMENT ON COLUMN "APOLLOCONFIGDB"."GrayReleaseRule"."IsDeleted" IS '1: deleted, 0: normal';
COMMENT ON COLUMN "APOLLOCONFIGDB"."GrayReleaseRule"."NamespaceName" IS 'Namespace Name';
COMMENT ON COLUMN "APOLLOCONFIGDB"."GrayReleaseRule"."ReleaseId" IS '灰度对应的release';
COMMENT ON COLUMN "APOLLOCONFIGDB"."GrayReleaseRule"."Rules" IS '灰度规则';


CREATE OR REPLACE  INDEX "APOLLOCONFIGDB"."INDEX157260995543900" ON "APOLLOCONFIGDB"."GrayReleaseRule"("DataChange_LastTime" ASC) STORAGE(ON "apolloconfigdb", CLUSTERBTR) ;
CREATE OR REPLACE  INDEX "APOLLOCONFIGDB"."IX_Namespace" ON "APOLLOCONFIGDB"."GrayReleaseRule"("AppId" ASC,"ClusterName" ASC,"NamespaceName" ASC) STORAGE(ON "apolloconfigdb", CLUSTERBTR) ;

CREATE TABLE "APOLLOCONFIGDB"."Instance"
(
"Id" BIGINT IDENTITY(1, 1) NOT NULL,
"AppId" VARCHAR(64) DEFAULT 'default' NOT NULL,
"ClusterName" VARCHAR(32) DEFAULT 'default' NOT NULL,
"DataCenter" VARCHAR(64) DEFAULT 'default' NOT NULL,
"Ip" VARCHAR(32) DEFAULT '' NOT NULL,
"DataChange_CreatedTime" TIMESTAMP(0) DEFAULT CURRENT_TIMESTAMP() NOT NULL,
"DataChange_LastTime" TIMESTAMP(0) DEFAULT CURRENT_TIMESTAMP() NOT NULL,
NOT CLUSTER PRIMARY KEY("Id"),
CONSTRAINT "IX_UNIQUE_KEY" UNIQUE("AppId", "ClusterName", "Ip", "DataCenter")) STORAGE(ON "apolloconfigdb", CLUSTERBTR) ;

COMMENT ON TABLE "APOLLOCONFIGDB"."Instance" IS '使用配置的应用实例';
COMMENT ON COLUMN "APOLLOCONFIGDB"."Instance"."AppId" IS 'AppID';
COMMENT ON COLUMN "APOLLOCONFIGDB"."Instance"."ClusterName" IS 'ClusterName';
COMMENT ON COLUMN "APOLLOCONFIGDB"."Instance"."DataCenter" IS 'Data Center Name';
COMMENT ON COLUMN "APOLLOCONFIGDB"."Instance"."DataChange_CreatedTime" IS '创建时间';
COMMENT ON COLUMN "APOLLOCONFIGDB"."Instance"."DataChange_LastTime" IS '最后修改时间';
COMMENT ON COLUMN "APOLLOCONFIGDB"."Instance"."Id" IS '自增Id';
COMMENT ON COLUMN "APOLLOCONFIGDB"."Instance"."Ip" IS 'instance ip';


CREATE OR REPLACE  INDEX "APOLLOCONFIGDB"."IX_IP" ON "APOLLOCONFIGDB"."Instance"("Ip" ASC) STORAGE(ON "apolloconfigdb", CLUSTERBTR) ;
CREATE OR REPLACE  INDEX "APOLLOCONFIGDB"."IX_DataChange_LastTime" ON "APOLLOCONFIGDB"."Instance"("DataChange_LastTime" ASC) STORAGE(ON "apolloconfigdb", CLUSTERBTR) ;

CREATE TABLE "APOLLOCONFIGDB"."InstanceConfig"
(
"Id" BIGINT IDENTITY(1, 1) NOT NULL,
"InstanceId" BIGINT,
"ConfigAppId" VARCHAR(64) DEFAULT 'default' NOT NULL,
"ConfigClusterName" VARCHAR(32) DEFAULT 'default' NOT NULL,
"ConfigNamespaceName" VARCHAR(32) DEFAULT 'default' NOT NULL,
"ReleaseKey" VARCHAR(64) DEFAULT '' NOT NULL,
"ReleaseDeliveryTime" TIMESTAMP(0),
"DataChange_CreatedTime" TIMESTAMP(0) DEFAULT CURRENT_TIMESTAMP() NOT NULL,
"DataChange_LastTime" TIMESTAMP(0) DEFAULT CURRENT_TIMESTAMP() NOT NULL,
NOT CLUSTER PRIMARY KEY("Id"),
UNIQUE("InstanceId", "ConfigAppId", "ConfigNamespaceName"),
CHECK("InstanceId" >= 0)) STORAGE(ON "apolloconfigdb", CLUSTERBTR) ;

COMMENT ON TABLE "APOLLOCONFIGDB"."InstanceConfig" IS '应用实例的配置信息';
COMMENT ON COLUMN "APOLLOCONFIGDB"."InstanceConfig"."ConfigAppId" IS 'Config App Id';
COMMENT ON COLUMN "APOLLOCONFIGDB"."InstanceConfig"."ConfigClusterName" IS 'Config Cluster Name';
COMMENT ON COLUMN "APOLLOCONFIGDB"."InstanceConfig"."ConfigNamespaceName" IS 'Config Namespace Name';
COMMENT ON COLUMN "APOLLOCONFIGDB"."InstanceConfig"."DataChange_CreatedTime" IS '创建时间';
COMMENT ON COLUMN "APOLLOCONFIGDB"."InstanceConfig"."DataChange_LastTime" IS '最后修改时间';
COMMENT ON COLUMN "APOLLOCONFIGDB"."InstanceConfig"."Id" IS '自增Id';
COMMENT ON COLUMN "APOLLOCONFIGDB"."InstanceConfig"."InstanceId" IS 'Instance Id';
COMMENT ON COLUMN "APOLLOCONFIGDB"."InstanceConfig"."ReleaseDeliveryTime" IS '配置获取时间';
COMMENT ON COLUMN "APOLLOCONFIGDB"."InstanceConfig"."ReleaseKey" IS '发布的Key';


CREATE OR REPLACE  INDEX "APOLLOCONFIGDB"."IX_Valid_Namespace" ON "APOLLOCONFIGDB"."InstanceConfig"("ConfigAppId" ASC,"ConfigClusterName" ASC,"ConfigNamespaceName" ASC,"DataChange_LastTime" ASC) STORAGE(ON "apolloconfigdb", CLUSTERBTR) ;
CREATE OR REPLACE  INDEX "APOLLOCONFIGDB"."IX_ReleaseKey" ON "APOLLOCONFIGDB"."InstanceConfig"("ReleaseKey" ASC) STORAGE(ON "apolloconfigdb", CLUSTERBTR) ;
CREATE OR REPLACE  INDEX "APOLLOCONFIGDB"."INDEX157261694563200" ON "APOLLOCONFIGDB"."InstanceConfig"("DataChange_LastTime" ASC) STORAGE(ON "apolloconfigdb", CLUSTERBTR) ;

CREATE TABLE "APOLLOCONFIGDB"."Item"
(
"Id" BIGINT IDENTITY(1, 1) NOT NULL,
"NamespaceId" BIGINT DEFAULT 0 NOT NULL,
"Key" VARCHAR(128) DEFAULT 'default' NOT NULL,
"Type" INT DEFAULT 0 NOT NULL,
"Value" CLOB NOT NULL,
"Comment" VARCHAR(1024) DEFAULT '',
"LineNum" BIGINT DEFAULT 0,
"IsDeleted" BIT DEFAULT 0 NOT NULL,
"DeletedAt" BIGINT DEFAULT 0 NOT NULL,
"DataChange_CreatedBy" VARCHAR(64) DEFAULT 'default' NOT NULL,
"DataChange_CreatedTime" TIMESTAMP(0) DEFAULT CURRENT_TIMESTAMP() NOT NULL,
"DataChange_LastModifiedBy" VARCHAR(64) DEFAULT '',
"DataChange_LastTime" TIMESTAMP(0) DEFAULT CURRENT_TIMESTAMP(),
NOT CLUSTER PRIMARY KEY("Id"),
CHECK("NamespaceId" >= 0)
,CHECK("Type" >= 0)
,CHECK("LineNum" >= 0)) STORAGE(ON "apolloconfigdb", CLUSTERBTR) ;

COMMENT ON TABLE "APOLLOCONFIGDB"."Item" IS '配置项目';
COMMENT ON COLUMN "APOLLOCONFIGDB"."Item"."Comment" IS '注释';
COMMENT ON COLUMN "APOLLOCONFIGDB"."Item"."DataChange_CreatedBy" IS '创建人邮箱前缀';
COMMENT ON COLUMN "APOLLOCONFIGDB"."Item"."DataChange_CreatedTime" IS '创建时间';
COMMENT ON COLUMN "APOLLOCONFIGDB"."Item"."DataChange_LastModifiedBy" IS '最后修改人邮箱前缀';
COMMENT ON COLUMN "APOLLOCONFIGDB"."Item"."DataChange_LastTime" IS '最后修改时间';
COMMENT ON COLUMN "APOLLOCONFIGDB"."Item"."DeletedAt" IS 'Delete timestamp based on milliseconds';
COMMENT ON COLUMN "APOLLOCONFIGDB"."Item"."Id" IS '自增Id';
COMMENT ON COLUMN "APOLLOCONFIGDB"."Item"."IsDeleted" IS '1: deleted, 0: normal';
COMMENT ON COLUMN "APOLLOCONFIGDB"."Item"."Key" IS '配置项Key';
COMMENT ON COLUMN "APOLLOCONFIGDB"."Item"."LineNum" IS '行号';
COMMENT ON COLUMN "APOLLOCONFIGDB"."Item"."NamespaceId" IS '集群NamespaceId';
COMMENT ON COLUMN "APOLLOCONFIGDB"."Item"."Type" IS '配置项类型，0: String，1: Number，2: Boolean，3: JSON';
COMMENT ON COLUMN "APOLLOCONFIGDB"."Item"."Value" IS '配置项值';


CREATE OR REPLACE  INDEX "APOLLOCONFIGDB"."INDEX157261040169600" ON "APOLLOCONFIGDB"."Item"("DataChange_LastTime" ASC) STORAGE(ON "apolloconfigdb", CLUSTERBTR) ;
CREATE OR REPLACE  INDEX "APOLLOCONFIGDB"."IX_GroupId" ON "APOLLOCONFIGDB"."Item"("NamespaceId" ASC) STORAGE(ON "apolloconfigdb", CLUSTERBTR) ;

CREATE TABLE "APOLLOCONFIGDB"."Namespace"
(
"Id" BIGINT IDENTITY(1, 1) NOT NULL,
"AppId" VARCHAR(64) DEFAULT 'default' NOT NULL,
"ClusterName" VARCHAR(500) DEFAULT 'default' NOT NULL,
"NamespaceName" VARCHAR(500) DEFAULT 'default' NOT NULL,
"IsDeleted" BIT DEFAULT 0 NOT NULL,
"DeletedAt" BIGINT DEFAULT 0 NOT NULL,
"DataChange_CreatedBy" VARCHAR(64) DEFAULT 'default' NOT NULL,
"DataChange_CreatedTime" TIMESTAMP(0) DEFAULT CURRENT_TIMESTAMP() NOT NULL,
"DataChange_LastModifiedBy" VARCHAR(64) DEFAULT '',
"DataChange_LastTime" TIMESTAMP(0) DEFAULT CURRENT_TIMESTAMP(),
NOT CLUSTER PRIMARY KEY("Id"),
CONSTRAINT "UK_AppId_ClusterName_NamespaceName_DeletedAt" UNIQUE("AppId", "ClusterName", "NamespaceName", "DeletedAt")) STORAGE(ON "apolloconfigdb", CLUSTERBTR) ;

COMMENT ON TABLE "APOLLOCONFIGDB"."Namespace" IS '命名空间';
COMMENT ON COLUMN "APOLLOCONFIGDB"."Namespace"."AppId" IS 'AppID';
COMMENT ON COLUMN "APOLLOCONFIGDB"."Namespace"."ClusterName" IS 'Cluster Name';
COMMENT ON COLUMN "APOLLOCONFIGDB"."Namespace"."DataChange_CreatedBy" IS '创建人邮箱前缀';
COMMENT ON COLUMN "APOLLOCONFIGDB"."Namespace"."DataChange_CreatedTime" IS '创建时间';
COMMENT ON COLUMN "APOLLOCONFIGDB"."Namespace"."DataChange_LastModifiedBy" IS '最后修改人邮箱前缀';
COMMENT ON COLUMN "APOLLOCONFIGDB"."Namespace"."DataChange_LastTime" IS '最后修改时间';
COMMENT ON COLUMN "APOLLOCONFIGDB"."Namespace"."DeletedAt" IS 'Delete timestamp based on milliseconds';
COMMENT ON COLUMN "APOLLOCONFIGDB"."Namespace"."Id" IS '自增主键';
COMMENT ON COLUMN "APOLLOCONFIGDB"."Namespace"."IsDeleted" IS '1: deleted, 0: normal';
COMMENT ON COLUMN "APOLLOCONFIGDB"."Namespace"."NamespaceName" IS 'Namespace Name';


CREATE OR REPLACE  INDEX "APOLLOCONFIGDB"."IX_NamespaceName" ON "APOLLOCONFIGDB"."Namespace"("NamespaceName" ASC) STORAGE(ON "apolloconfigdb", CLUSTERBTR) ;
CREATE OR REPLACE  INDEX "APOLLOCONFIGDB"."INDEX157261072506200" ON "APOLLOCONFIGDB"."Namespace"("DataChange_LastTime" ASC) STORAGE(ON "apolloconfigdb", CLUSTERBTR) ;

CREATE TABLE "APOLLOCONFIGDB"."NamespaceLock"
(
"Id" BIGINT IDENTITY(1, 1) NOT NULL,
"NamespaceId" BIGINT DEFAULT 0 NOT NULL,
"DataChange_CreatedBy" VARCHAR(64) DEFAULT 'default' NOT NULL,
"DataChange_CreatedTime" TIMESTAMP(0) DEFAULT CURRENT_TIMESTAMP() NOT NULL,
"DataChange_LastModifiedBy" VARCHAR(64) DEFAULT '',
"DataChange_LastTime" TIMESTAMP(0) DEFAULT CURRENT_TIMESTAMP(),
"IsDeleted" BIT DEFAULT 0,
"DeletedAt" BIGINT DEFAULT 0 NOT NULL,
NOT CLUSTER PRIMARY KEY("Id"),
CONSTRAINT "UK_NamespaceId_DeletedAt" UNIQUE("NamespaceId", "DeletedAt"),
CHECK("NamespaceId" >= 0)) STORAGE(ON "apolloconfigdb", CLUSTERBTR) ;

COMMENT ON TABLE "APOLLOCONFIGDB"."NamespaceLock" IS 'namespace的编辑锁';
COMMENT ON COLUMN "APOLLOCONFIGDB"."NamespaceLock"."DataChange_CreatedBy" IS '创建人邮箱前缀';
COMMENT ON COLUMN "APOLLOCONFIGDB"."NamespaceLock"."DataChange_CreatedTime" IS '创建时间';
COMMENT ON COLUMN "APOLLOCONFIGDB"."NamespaceLock"."DataChange_LastModifiedBy" IS '最后修改人邮箱前缀';
COMMENT ON COLUMN "APOLLOCONFIGDB"."NamespaceLock"."DataChange_LastTime" IS '最后修改时间';
COMMENT ON COLUMN "APOLLOCONFIGDB"."NamespaceLock"."DeletedAt" IS 'Delete timestamp based on milliseconds';
COMMENT ON COLUMN "APOLLOCONFIGDB"."NamespaceLock"."Id" IS '自增id';
COMMENT ON COLUMN "APOLLOCONFIGDB"."NamespaceLock"."IsDeleted" IS '软删除';
COMMENT ON COLUMN "APOLLOCONFIGDB"."NamespaceLock"."NamespaceId" IS '集群NamespaceId';


CREATE OR REPLACE  INDEX "APOLLOCONFIGDB"."INDEX157261708396700" ON "APOLLOCONFIGDB"."NamespaceLock"("DataChange_LastTime" ASC) STORAGE(ON "apolloconfigdb", CLUSTERBTR) ;

CREATE TABLE "APOLLOCONFIGDB"."Release"
(
"Id" BIGINT IDENTITY(1, 1) NOT NULL,
"ReleaseKey" VARCHAR(64) DEFAULT '' NOT NULL,
"Name" VARCHAR(64) DEFAULT 'default' NOT NULL,
"Comment" VARCHAR(256),
"AppId" VARCHAR(64) DEFAULT 'default' NOT NULL,
"ClusterName" VARCHAR(500) DEFAULT 'default' NOT NULL,
"NamespaceName" VARCHAR(500) DEFAULT 'default' NOT NULL,
"Configurations" CLOB NOT NULL,
"IsAbandoned" BIT DEFAULT 0 NOT NULL,
"IsDeleted" BIT DEFAULT 0 NOT NULL,
"DeletedAt" BIGINT DEFAULT 0 NOT NULL,
"DataChange_CreatedBy" VARCHAR(64) DEFAULT 'default' NOT NULL,
"DataChange_CreatedTime" TIMESTAMP(0) DEFAULT CURRENT_TIMESTAMP() NOT NULL,
"DataChange_LastModifiedBy" VARCHAR(64) DEFAULT '',
"DataChange_LastTime" TIMESTAMP(0) DEFAULT CURRENT_TIMESTAMP(),
NOT CLUSTER PRIMARY KEY("Id"),
CONSTRAINT "UK_ReleaseKey_DeletedAt" UNIQUE("ReleaseKey", "DeletedAt")) STORAGE(ON "apolloconfigdb", CLUSTERBTR) ;

COMMENT ON TABLE "APOLLOCONFIGDB"."Release" IS '发布';
COMMENT ON COLUMN "APOLLOCONFIGDB"."Release"."AppId" IS 'AppID';
COMMENT ON COLUMN "APOLLOCONFIGDB"."Release"."ClusterName" IS 'ClusterName';
COMMENT ON COLUMN "APOLLOCONFIGDB"."Release"."Comment" IS '发布说明';
COMMENT ON COLUMN "APOLLOCONFIGDB"."Release"."Configurations" IS '发布配置';
COMMENT ON COLUMN "APOLLOCONFIGDB"."Release"."DataChange_CreatedBy" IS '创建人邮箱前缀';
COMMENT ON COLUMN "APOLLOCONFIGDB"."Release"."DataChange_CreatedTime" IS '创建时间';
COMMENT ON COLUMN "APOLLOCONFIGDB"."Release"."DataChange_LastModifiedBy" IS '最后修改人邮箱前缀';
COMMENT ON COLUMN "APOLLOCONFIGDB"."Release"."DataChange_LastTime" IS '最后修改时间';
COMMENT ON COLUMN "APOLLOCONFIGDB"."Release"."DeletedAt" IS 'Delete timestamp based on milliseconds';
COMMENT ON COLUMN "APOLLOCONFIGDB"."Release"."Id" IS '自增主键';
COMMENT ON COLUMN "APOLLOCONFIGDB"."Release"."IsAbandoned" IS '是否废弃';
COMMENT ON COLUMN "APOLLOCONFIGDB"."Release"."IsDeleted" IS '1: deleted, 0: normal';
COMMENT ON COLUMN "APOLLOCONFIGDB"."Release"."Name" IS '发布名字';
COMMENT ON COLUMN "APOLLOCONFIGDB"."Release"."NamespaceName" IS 'namespaceName';
COMMENT ON COLUMN "APOLLOCONFIGDB"."Release"."ReleaseKey" IS '发布的Key';


CREATE OR REPLACE  INDEX "APOLLOCONFIGDB"."AppId_ClusterName_GroupName" ON "APOLLOCONFIGDB"."Release"("AppId" ASC,"ClusterName" ASC,"NamespaceName" ASC) STORAGE(ON "apolloconfigdb", CLUSTERBTR) ;
CREATE OR REPLACE  INDEX "APOLLOCONFIGDB"."INDEX157261096976300" ON "APOLLOCONFIGDB"."Release"("DataChange_LastTime" ASC) STORAGE(ON "apolloconfigdb", CLUSTERBTR) ;

CREATE TABLE "APOLLOCONFIGDB"."ReleaseHistory"
(
"Id" BIGINT IDENTITY(1, 1) NOT NULL,
"AppId" VARCHAR(64) DEFAULT 'default' NOT NULL,
"ClusterName" VARCHAR(32) DEFAULT 'default' NOT NULL,
"NamespaceName" VARCHAR(32) DEFAULT 'default' NOT NULL,
"BranchName" VARCHAR(32) DEFAULT 'default' NOT NULL,
"ReleaseId" BIGINT DEFAULT 0 NOT NULL,
"PreviousReleaseId" BIGINT DEFAULT 0 NOT NULL,
"Operation" INT DEFAULT 0 NOT NULL,
"OperationContext" CLOB NOT NULL,
"IsDeleted" BIT DEFAULT 0 NOT NULL,
"DeletedAt" BIGINT DEFAULT 0 NOT NULL,
"DataChange_CreatedBy" VARCHAR(64) DEFAULT 'default' NOT NULL,
"DataChange_CreatedTime" TIMESTAMP(0) DEFAULT CURRENT_TIMESTAMP() NOT NULL,
"DataChange_LastModifiedBy" VARCHAR(64) DEFAULT '',
"DataChange_LastTime" TIMESTAMP(0) DEFAULT CURRENT_TIMESTAMP(),
NOT CLUSTER PRIMARY KEY("Id"),
CHECK("ReleaseId" >= 0)
,CHECK("PreviousReleaseId" >= 0)
,CHECK("Operation" >= 0)) STORAGE(ON "apolloconfigdb", CLUSTERBTR) ;

COMMENT ON TABLE "APOLLOCONFIGDB"."ReleaseHistory" IS '发布历史';
COMMENT ON COLUMN "APOLLOCONFIGDB"."ReleaseHistory"."AppId" IS 'AppID';
COMMENT ON COLUMN "APOLLOCONFIGDB"."ReleaseHistory"."BranchName" IS '发布分支名';
COMMENT ON COLUMN "APOLLOCONFIGDB"."ReleaseHistory"."ClusterName" IS 'ClusterName';
COMMENT ON COLUMN "APOLLOCONFIGDB"."ReleaseHistory"."DataChange_CreatedBy" IS '创建人邮箱前缀';
COMMENT ON COLUMN "APOLLOCONFIGDB"."ReleaseHistory"."DataChange_CreatedTime" IS '创建时间';
COMMENT ON COLUMN "APOLLOCONFIGDB"."ReleaseHistory"."DataChange_LastModifiedBy" IS '最后修改人邮箱前缀';
COMMENT ON COLUMN "APOLLOCONFIGDB"."ReleaseHistory"."DataChange_LastTime" IS '最后修改时间';
COMMENT ON COLUMN "APOLLOCONFIGDB"."ReleaseHistory"."DeletedAt" IS 'Delete timestamp based on milliseconds';
COMMENT ON COLUMN "APOLLOCONFIGDB"."ReleaseHistory"."Id" IS '自增Id';
COMMENT ON COLUMN "APOLLOCONFIGDB"."ReleaseHistory"."IsDeleted" IS '1: deleted, 0: normal';
COMMENT ON COLUMN "APOLLOCONFIGDB"."ReleaseHistory"."NamespaceName" IS 'namespaceName';
COMMENT ON COLUMN "APOLLOCONFIGDB"."ReleaseHistory"."Operation" IS '发布类型，0: 普通发布，1: 回滚，2: 灰度发布，3: 灰度规则更新，4: 灰度合并回主分支发布，5: 主分支发布灰度自动发布，6: 主分支回滚灰度自动发布，7: 放弃灰度';
COMMENT ON COLUMN "APOLLOCONFIGDB"."ReleaseHistory"."OperationContext" IS '发布上下文信息';
COMMENT ON COLUMN "APOLLOCONFIGDB"."ReleaseHistory"."PreviousReleaseId" IS '前一次发布的ReleaseId';
COMMENT ON COLUMN "APOLLOCONFIGDB"."ReleaseHistory"."ReleaseId" IS '关联的Release Id';


CREATE OR REPLACE  INDEX "APOLLOCONFIGDB"."IX_ReleaseId" ON "APOLLOCONFIGDB"."ReleaseHistory"("ReleaseId" ASC) STORAGE(ON "apolloconfigdb", CLUSTERBTR) ;
CREATE OR REPLACE  INDEX "APOLLOCONFIGDB"."INDEX157261120493000" ON "APOLLOCONFIGDB"."ReleaseHistory"("AppId" ASC,"ClusterName" ASC,"NamespaceName" ASC,"BranchName" ASC) STORAGE(ON "apolloconfigdb", CLUSTERBTR) ;
CREATE OR REPLACE  INDEX "APOLLOCONFIGDB"."IX_PreviousReleaseId" ON "APOLLOCONFIGDB"."ReleaseHistory"("PreviousReleaseId" ASC) STORAGE(ON "apolloconfigdb", CLUSTERBTR) ;
CREATE OR REPLACE  INDEX "APOLLOCONFIGDB"."INDEX157261146560000" ON "APOLLOCONFIGDB"."ReleaseHistory"("DataChange_LastTime" ASC) STORAGE(ON "apolloconfigdb", CLUSTERBTR) ;

CREATE TABLE "APOLLOCONFIGDB"."ReleaseMessage"
(
"Id" BIGINT IDENTITY(1, 1) NOT NULL,
"Message" VARCHAR(1024) DEFAULT '' NOT NULL,
"DataChange_LastTime" TIMESTAMP(0) DEFAULT CURRENT_TIMESTAMP() NOT NULL,
NOT CLUSTER PRIMARY KEY("Id")) STORAGE(ON "apolloconfigdb", CLUSTERBTR) ;

COMMENT ON TABLE "APOLLOCONFIGDB"."ReleaseMessage" IS '发布消息';
COMMENT ON COLUMN "APOLLOCONFIGDB"."ReleaseMessage"."DataChange_LastTime" IS '最后修改时间';
COMMENT ON COLUMN "APOLLOCONFIGDB"."ReleaseMessage"."Id" IS '自增主键';
COMMENT ON COLUMN "APOLLOCONFIGDB"."ReleaseMessage"."Message" IS '发布的消息内容';


CREATE OR REPLACE  INDEX "APOLLOCONFIGDB"."IX_Message" ON "APOLLOCONFIGDB"."ReleaseMessage"("Message" ASC) STORAGE(ON "apolloconfigdb", CLUSTERBTR) ;
CREATE OR REPLACE  INDEX "APOLLOCONFIGDB"."INDEX157260510432900" ON "APOLLOCONFIGDB"."ReleaseMessage"("DataChange_LastTime" ASC) STORAGE(ON "apolloconfigdb", CLUSTERBTR) ;

CREATE TABLE "APOLLOCONFIGDB"."ServerConfig"
(
"Id" BIGINT IDENTITY(6, 1) NOT NULL,
"Key" VARCHAR(64) DEFAULT 'default' NOT NULL,
"Cluster" VARCHAR(32) DEFAULT 'default' NOT NULL,
"Value" VARCHAR(2048) DEFAULT 'default' NOT NULL,
"Comment" VARCHAR(1024) DEFAULT '',
"IsDeleted" BIT DEFAULT 0 NOT NULL,
"DeletedAt" BIGINT DEFAULT 0 NOT NULL,
"DataChange_CreatedBy" VARCHAR(64) DEFAULT 'default' NOT NULL,
"DataChange_CreatedTime" TIMESTAMP(0) DEFAULT CURRENT_TIMESTAMP() NOT NULL,
"DataChange_LastModifiedBy" VARCHAR(64) DEFAULT '',
"DataChange_LastTime" TIMESTAMP(0) DEFAULT CURRENT_TIMESTAMP(),
NOT CLUSTER PRIMARY KEY("Id"),
CONSTRAINT "UK_Key_Cluster_DeletedAt" UNIQUE("Key", "Cluster", "DeletedAt")) STORAGE(ON "apolloconfigdb", CLUSTERBTR) ;

COMMENT ON TABLE "APOLLOCONFIGDB"."ServerConfig" IS '配置服务自身配置';
COMMENT ON COLUMN "APOLLOCONFIGDB"."ServerConfig"."Cluster" IS '配置对应的集群，default为不针对特定的集群';
COMMENT ON COLUMN "APOLLOCONFIGDB"."ServerConfig"."Comment" IS '注释';
COMMENT ON COLUMN "APOLLOCONFIGDB"."ServerConfig"."DataChange_CreatedBy" IS '创建人邮箱前缀';
COMMENT ON COLUMN "APOLLOCONFIGDB"."ServerConfig"."DataChange_CreatedTime" IS '创建时间';
COMMENT ON COLUMN "APOLLOCONFIGDB"."ServerConfig"."DataChange_LastModifiedBy" IS '最后修改人邮箱前缀';
COMMENT ON COLUMN "APOLLOCONFIGDB"."ServerConfig"."DataChange_LastTime" IS '最后修改时间';
COMMENT ON COLUMN "APOLLOCONFIGDB"."ServerConfig"."DeletedAt" IS 'Delete timestamp based on milliseconds';
COMMENT ON COLUMN "APOLLOCONFIGDB"."ServerConfig"."Id" IS '自增Id';
COMMENT ON COLUMN "APOLLOCONFIGDB"."ServerConfig"."IsDeleted" IS '1: deleted, 0: normal';
COMMENT ON COLUMN "APOLLOCONFIGDB"."ServerConfig"."Key" IS '配置项Key';
COMMENT ON COLUMN "APOLLOCONFIGDB"."ServerConfig"."Value" IS '配置项值';


CREATE OR REPLACE  INDEX "APOLLOCONFIGDB"."INDEX157261160896900" ON "APOLLOCONFIGDB"."ServerConfig"("DataChange_LastTime" ASC) STORAGE(ON "apolloconfigdb", CLUSTERBTR) ;

CREATE TABLE "APOLLOCONFIGDB"."ServiceRegistry"
(
"Id" BIGINT IDENTITY(1, 1) NOT NULL,
"ServiceName" VARCHAR(64) NOT NULL,
"Uri" VARCHAR(64) NOT NULL,
"Cluster" VARCHAR(64) NOT NULL,
"Metadata" VARCHAR(1024) DEFAULT '{}' NOT NULL,
"DataChange_CreatedTime" TIMESTAMP(0) DEFAULT CURRENT_TIMESTAMP() NOT NULL,
"DataChange_LastTime" TIMESTAMP(0) DEFAULT CURRENT_TIMESTAMP() NOT NULL,
NOT CLUSTER PRIMARY KEY("Id"),
UNIQUE("ServiceName", "Uri")) STORAGE(ON "apolloconfigdb", CLUSTERBTR) ;

COMMENT ON TABLE "APOLLOCONFIGDB"."ServiceRegistry" IS '注册中心';
COMMENT ON COLUMN "APOLLOCONFIGDB"."ServiceRegistry"."Cluster" IS '集群，可以用来标识apollo.cluster或者网络分区';
COMMENT ON COLUMN "APOLLOCONFIGDB"."ServiceRegistry"."DataChange_CreatedTime" IS '创建时间';
COMMENT ON COLUMN "APOLLOCONFIGDB"."ServiceRegistry"."DataChange_LastTime" IS '最后修改时间';
COMMENT ON COLUMN "APOLLOCONFIGDB"."ServiceRegistry"."Id" IS '自增Id';
COMMENT ON COLUMN "APOLLOCONFIGDB"."ServiceRegistry"."Metadata" IS '元数据，key value结构的json object，为了方面后面扩展功能而不需要修改表结构';
COMMENT ON COLUMN "APOLLOCONFIGDB"."ServiceRegistry"."ServiceName" IS '服务名';
COMMENT ON COLUMN "APOLLOCONFIGDB"."ServiceRegistry"."Uri" IS '服务地址';


CREATE OR REPLACE  INDEX "APOLLOCONFIGDB"."INDEX157261178348500" ON "APOLLOCONFIGDB"."ServiceRegistry"("DataChange_LastTime" ASC) STORAGE(ON "apolloconfigdb", CLUSTERBTR) ;


INSERT INTO "APOLLOCONFIGDB"."ServerConfig" ("Key", "Cluster", "Value", "Comment")
VALUES
    ('eureka.service.url', 'default', 'http://localhost:8080/eureka/', 'Eureka服务Url，多个service以英文逗号分隔'),
    ('namespace.lock.switch', 'default', 'false', '一次发布只能有一个人修改开关'),
    ('item.key.length.limit', 'default', '128', 'item key 最大长度限制'),
    ('item.value.length.limit', 'default', '20000', 'item value最大长度限制'),
    ('config-service.cache.enabled', 'default', 'false', 'ConfigService是否开启缓存，开启后能提高性能，但是会增大内存消耗！');