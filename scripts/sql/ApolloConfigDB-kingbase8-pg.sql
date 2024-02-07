--
-- Kingbase database dump
--

-- Dumped from database version 12.1
-- Dumped by sys_dump version 12.1

-- Started on 2024-02-07 14:39:42

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', 'public', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;
SET comp_v7_program_para_def = on;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 298 (class 1259 OID 692282)
-- Name: AccessKey; Type: TABLE; Schema: public; Owner: system
--

CREATE TABLE public."AccessKey" (
    "Id" bigint NOT NULL,
    "AppId" character varying(64) DEFAULT 'default'::character varying NOT NULL,
    "Secret" character varying(128) DEFAULT ''::character varying NOT NULL,
    "IsEnabled" smallint DEFAULT 0 NOT NULL,
    "IsDeleted" boolean DEFAULT false NOT NULL,
    "DeletedAt" bigint DEFAULT 0 NOT NULL,
    "DataChange_CreatedBy" character varying(64) DEFAULT 'default'::character varying NOT NULL,
    "DataChange_CreatedTime" timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "DataChange_LastModifiedBy" character varying(64) DEFAULT ''::character varying,
    "DataChange_LastTime" timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."AccessKey" OWNER TO system;

--
-- TOC entry 297 (class 1259 OID 692280)
-- Name: AccessKey_Id_seq; Type: SEQUENCE; Schema: public; Owner: system
--

CREATE SEQUENCE public."AccessKey_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."AccessKey_Id_seq" OWNER TO system;

--
-- TOC entry 3996 (class 0 OID 0)
-- Dependencies: 297
-- Name: AccessKey_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: system
--

ALTER SEQUENCE public."AccessKey_Id_seq" OWNED BY public."AccessKey"."Id";


--
-- TOC entry 304 (class 1259 OID 692330)
-- Name: App; Type: TABLE; Schema: public; Owner: system
--

CREATE TABLE public."App" (
    "Id" bigint NOT NULL,
    "AppId" character varying(64) DEFAULT 'default'::character varying NOT NULL,
    "Name" character varying(500) DEFAULT 'default'::character varying NOT NULL,
    "OrgId" character varying(32) DEFAULT 'default'::character varying NOT NULL,
    "OrgName" character varying(64) DEFAULT 'default'::character varying NOT NULL,
    "OwnerName" character varying(500) DEFAULT 'default'::character varying NOT NULL,
    "OwnerEmail" character varying(500) DEFAULT 'default'::character varying NOT NULL,
    "IsDeleted" boolean DEFAULT false NOT NULL,
    "DeletedAt" bigint DEFAULT 0 NOT NULL,
    "DataChange_CreatedBy" character varying(64) DEFAULT 'default'::character varying NOT NULL,
    "DataChange_CreatedTime" timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "DataChange_LastModifiedBy" character varying(64) DEFAULT ''::character varying,
    "DataChange_LastTime" timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public."App" OWNER TO system;

--
-- TOC entry 278 (class 1259 OID 692094)
-- Name: AppNamespace; Type: TABLE; Schema: public; Owner: system
--

CREATE TABLE public."AppNamespace" (
    "Id" bigint NOT NULL,
    "Name" character varying(32) DEFAULT ''::character varying NOT NULL,
    "AppId" character varying(64) DEFAULT ''::character varying NOT NULL,
    "Format" character varying(32) DEFAULT 'properties'::character varying NOT NULL,
    "IsPublic" boolean DEFAULT false NOT NULL,
    "Comment" character varying(64) DEFAULT ''::character varying NOT NULL,
    "IsDeleted" boolean DEFAULT false NOT NULL,
    "DeletedAt" bigint DEFAULT 0 NOT NULL,
    "DataChange_CreatedBy" character varying(64) DEFAULT 'default'::character varying NOT NULL,
    "DataChange_CreatedTime" timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "DataChange_LastModifiedBy" character varying(64) DEFAULT ''::character varying,
    "DataChange_LastTime" timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public."AppNamespace" OWNER TO system;

--
-- TOC entry 277 (class 1259 OID 692092)
-- Name: AppNamespace_Id_seq; Type: SEQUENCE; Schema: public; Owner: system
--

CREATE SEQUENCE public."AppNamespace_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."AppNamespace_Id_seq" OWNER TO system;

--
-- TOC entry 3997 (class 0 OID 0)
-- Dependencies: 277
-- Name: AppNamespace_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: system
--

ALTER SEQUENCE public."AppNamespace_Id_seq" OWNED BY public."AppNamespace"."Id";


--
-- TOC entry 303 (class 1259 OID 692327)
-- Name: App_Id_seq; Type: SEQUENCE; Schema: public; Owner: system
--

CREATE SEQUENCE public."App_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."App_Id_seq" OWNER TO system;

--
-- TOC entry 3998 (class 0 OID 0)
-- Dependencies: 303
-- Name: App_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: system
--

ALTER SEQUENCE public."App_Id_seq" OWNED BY public."App"."Id";


--
-- TOC entry 276 (class 1259 OID 692061)
-- Name: Audit; Type: TABLE; Schema: public; Owner: system
--

CREATE TABLE public."Audit" (
    "Id" bigint NOT NULL,
    "EntityName" character varying(50) DEFAULT 'default'::character varying NOT NULL,
    "EntityId" bigint,
    "OpName" character varying(50) DEFAULT 'default'::character varying NOT NULL,
    "Comment" character varying(500),
    "IsDeleted" boolean DEFAULT false NOT NULL,
    "DeletedAt" bigint DEFAULT 0 NOT NULL,
    "DataChange_CreatedBy" character varying(64) DEFAULT 'default'::character varying NOT NULL,
    "DataChange_CreatedTime" timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "DataChange_LastModifiedBy" character varying(64) DEFAULT ''::character varying,
    "DataChange_LastTime" timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public."Audit" OWNER TO system;

--
-- TOC entry 282 (class 1259 OID 692125)
-- Name: AuditLog; Type: TABLE; Schema: public; Owner: system
--

CREATE TABLE public."AuditLog" (
    "Id" bigint NOT NULL,
    "TraceId" character varying(32) DEFAULT ''::character varying NOT NULL,
    "SpanId" character varying(32) DEFAULT ''::character varying NOT NULL,
    "ParentSpanId" character varying(32),
    "FollowsFromSpanId" character varying(32),
    "Operator" character varying(64) DEFAULT 'anonymous'::character varying NOT NULL,
    "OpType" character varying(50) DEFAULT 'default'::character varying NOT NULL,
    "OpName" character varying(150) DEFAULT 'default'::character varying NOT NULL,
    "Description" character varying(200),
    "IsDeleted" boolean DEFAULT false NOT NULL,
    "DeletedAt" bigint DEFAULT 0 NOT NULL,
    "DataChange_CreatedBy" character varying(64),
    "DataChange_CreatedTime" timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "DataChange_LastModifiedBy" character varying(64) DEFAULT ''::character varying,
    "DataChange_LastTime" timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public."AuditLog" OWNER TO system;

--
-- TOC entry 300 (class 1259 OID 692298)
-- Name: AuditLogDataInfluence; Type: TABLE; Schema: public; Owner: system
--

CREATE TABLE public."AuditLogDataInfluence" (
    "Id" bigint NOT NULL,
    "SpanId" character(32) DEFAULT ''::bpchar NOT NULL,
    "InfluenceEntityId" character varying(50) DEFAULT '0'::character varying NOT NULL,
    "InfluenceEntityName" character varying(50) DEFAULT 'default'::character varying NOT NULL,
    "FieldName" character varying(50),
    "FieldOldValue" character varying(500),
    "FieldNewValue" character varying(500),
    "IsDeleted" boolean DEFAULT false NOT NULL,
    "DeletedAt" bigint DEFAULT 0 NOT NULL,
    "DataChange_CreatedBy" character varying(64),
    "DataChange_CreatedTime" timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "DataChange_LastModifiedBy" character varying(64) DEFAULT ''::character varying,
    "DataChange_LastTime" timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public."AuditLogDataInfluence" OWNER TO system;

--
-- TOC entry 299 (class 1259 OID 692296)
-- Name: AuditLogDataInfluence_Id_seq; Type: SEQUENCE; Schema: public; Owner: system
--

CREATE SEQUENCE public."AuditLogDataInfluence_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."AuditLogDataInfluence_Id_seq" OWNER TO system;

--
-- TOC entry 3999 (class 0 OID 0)
-- Dependencies: 299
-- Name: AuditLogDataInfluence_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: system
--

ALTER SEQUENCE public."AuditLogDataInfluence_Id_seq" OWNED BY public."AuditLogDataInfluence"."Id";


--
-- TOC entry 281 (class 1259 OID 692123)
-- Name: AuditLog_Id_seq; Type: SEQUENCE; Schema: public; Owner: system
--

CREATE SEQUENCE public."AuditLog_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."AuditLog_Id_seq" OWNER TO system;

--
-- TOC entry 4000 (class 0 OID 0)
-- Dependencies: 281
-- Name: AuditLog_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: system
--

ALTER SEQUENCE public."AuditLog_Id_seq" OWNED BY public."AuditLog"."Id";


--
-- TOC entry 274 (class 1259 OID 692056)
-- Name: Audit_Id_seq; Type: SEQUENCE; Schema: public; Owner: system
--

CREATE SEQUENCE public."Audit_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Audit_Id_seq" OWNER TO system;

--
-- TOC entry 4001 (class 0 OID 0)
-- Dependencies: 274
-- Name: Audit_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: system
--

ALTER SEQUENCE public."Audit_Id_seq" OWNED BY public."Audit"."Id";


--
-- TOC entry 292 (class 1259 OID 692219)
-- Name: Cluster; Type: TABLE; Schema: public; Owner: system
--

CREATE TABLE public."Cluster" (
    "Id" bigint NOT NULL,
    "Name" character varying(32) DEFAULT ''::character varying NOT NULL,
    "AppId" character varying(64) DEFAULT ''::character varying NOT NULL,
    "ParentClusterId" bigint DEFAULT 0 NOT NULL,
    "IsDeleted" boolean DEFAULT false NOT NULL,
    "DeletedAt" bigint DEFAULT 0 NOT NULL,
    "DataChange_CreatedBy" character varying(64) DEFAULT 'default'::character varying NOT NULL,
    "DataChange_CreatedTime" timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "DataChange_LastModifiedBy" character varying(64) DEFAULT ''::character varying,
    "DataChange_LastTime" timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    "Comment" character varying(64)
);


ALTER TABLE public."Cluster" OWNER TO system;

--
-- TOC entry 290 (class 1259 OID 692208)
-- Name: Cluster_Id_seq; Type: SEQUENCE; Schema: public; Owner: system
--

CREATE SEQUENCE public."Cluster_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Cluster_Id_seq" OWNER TO system;

--
-- TOC entry 4002 (class 0 OID 0)
-- Dependencies: 290
-- Name: Cluster_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: system
--

ALTER SEQUENCE public."Cluster_Id_seq" OWNED BY public."Cluster"."Id";


--
-- TOC entry 284 (class 1259 OID 692145)
-- Name: Commit; Type: TABLE; Schema: public; Owner: system
--

CREATE TABLE public."Commit" (
    "Id" bigint NOT NULL,
    "ChangeSets" text NOT NULL,
    "AppId" character varying(64) DEFAULT 'default'::character varying NOT NULL,
    "ClusterName" character varying(500) DEFAULT 'default'::character varying NOT NULL,
    "NamespaceName" character varying(500) DEFAULT 'default'::character varying NOT NULL,
    "Comment" character varying(500),
    "IsDeleted" boolean DEFAULT false NOT NULL,
    "DeletedAt" bigint DEFAULT 0 NOT NULL,
    "DataChange_CreatedBy" character varying(64) DEFAULT 'default'::character varying NOT NULL,
    "DataChange_CreatedTime" timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "DataChange_LastModifiedBy" character varying(64) DEFAULT ''::character varying,
    "DataChange_LastTime" timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public."Commit" OWNER TO system;

--
-- TOC entry 283 (class 1259 OID 692143)
-- Name: Commit_Id_seq; Type: SEQUENCE; Schema: public; Owner: system
--

CREATE SEQUENCE public."Commit_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Commit_Id_seq" OWNER TO system;

--
-- TOC entry 4003 (class 0 OID 0)
-- Dependencies: 283
-- Name: Commit_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: system
--

ALTER SEQUENCE public."Commit_Id_seq" OWNED BY public."Commit"."Id";


--
-- TOC entry 294 (class 1259 OID 692237)
-- Name: GrayReleaseRule; Type: TABLE; Schema: public; Owner: system
--

CREATE TABLE public."GrayReleaseRule" (
    "Id" bigint NOT NULL,
    "AppId" character varying(64) DEFAULT 'default'::character varying NOT NULL,
    "ClusterName" character varying(32) DEFAULT 'default'::character varying NOT NULL,
    "NamespaceName" character varying(32) DEFAULT 'default'::character varying NOT NULL,
    "BranchName" character varying(32) DEFAULT 'default'::character varying NOT NULL,
    "Rules" text DEFAULT '[]'::text,
    "ReleaseId" bigint DEFAULT 0 NOT NULL,
    "BranchStatus" smallint DEFAULT 1,
    "IsDeleted" boolean DEFAULT false NOT NULL,
    "DeletedAt" bigint DEFAULT 0 NOT NULL,
    "DataChange_CreatedBy" character varying(64) DEFAULT 'default'::character varying NOT NULL,
    "DataChange_CreatedTime" timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "DataChange_LastModifiedBy" character varying(64) DEFAULT ''::character varying,
    "DataChange_LastTime" timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public."GrayReleaseRule" OWNER TO system;

--
-- TOC entry 293 (class 1259 OID 692235)
-- Name: GrayReleaseRule_Id_seq; Type: SEQUENCE; Schema: public; Owner: system
--

CREATE SEQUENCE public."GrayReleaseRule_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."GrayReleaseRule_Id_seq" OWNER TO system;

--
-- TOC entry 4004 (class 0 OID 0)
-- Dependencies: 293
-- Name: GrayReleaseRule_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: system
--

ALTER SEQUENCE public."GrayReleaseRule_Id_seq" OWNED BY public."GrayReleaseRule"."Id";


--
-- TOC entry 280 (class 1259 OID 692112)
-- Name: Instance; Type: TABLE; Schema: public; Owner: system
--

CREATE TABLE public."Instance" (
    "Id" bigint NOT NULL,
    "AppId" character varying(64) DEFAULT 'default'::character varying NOT NULL,
    "ClusterName" character varying(32) DEFAULT 'default'::character varying NOT NULL,
    "DataCenter" character varying(64) DEFAULT 'default'::character varying NOT NULL,
    "Ip" character varying(32) DEFAULT ''::character varying NOT NULL,
    "DataChange_CreatedTime" timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "DataChange_LastTime" timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."Instance" OWNER TO system;

--
-- TOC entry 306 (class 1259 OID 692352)
-- Name: InstanceConfig; Type: TABLE; Schema: public; Owner: system
--

CREATE TABLE public."InstanceConfig" (
    "Id" bigint NOT NULL,
    "InstanceId" bigint,
    "ConfigAppId" character varying(64) DEFAULT 'default'::character varying NOT NULL,
    "ConfigClusterName" character varying(32) DEFAULT 'default'::character varying NOT NULL,
    "ConfigNamespaceName" character varying(32) DEFAULT 'default'::character varying NOT NULL,
    "ReleaseKey" character varying(64) DEFAULT ''::character varying NOT NULL,
    "ReleaseDeliveryTime" timestamp(0) without time zone,
    "DataChange_CreatedTime" timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "DataChange_LastTime" timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."InstanceConfig" OWNER TO system;

--
-- TOC entry 305 (class 1259 OID 692350)
-- Name: InstanceConfig_Id_seq; Type: SEQUENCE; Schema: public; Owner: system
--

CREATE SEQUENCE public."InstanceConfig_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."InstanceConfig_Id_seq" OWNER TO system;

--
-- TOC entry 4005 (class 0 OID 0)
-- Dependencies: 305
-- Name: InstanceConfig_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: system
--

ALTER SEQUENCE public."InstanceConfig_Id_seq" OWNED BY public."InstanceConfig"."Id";


--
-- TOC entry 279 (class 1259 OID 692110)
-- Name: Instance_Id_seq; Type: SEQUENCE; Schema: public; Owner: system
--

CREATE SEQUENCE public."Instance_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Instance_Id_seq" OWNER TO system;

--
-- TOC entry 4006 (class 0 OID 0)
-- Dependencies: 279
-- Name: Instance_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: system
--

ALTER SEQUENCE public."Instance_Id_seq" OWNED BY public."Instance"."Id";


--
-- TOC entry 286 (class 1259 OID 692164)
-- Name: Item; Type: TABLE; Schema: public; Owner: system
--

CREATE TABLE public."Item" (
    "Id" bigint NOT NULL,
    "NamespaceId" bigint DEFAULT 0 NOT NULL,
    "Key" character varying(128) DEFAULT 'default'::character varying NOT NULL,
    "Type" smallint DEFAULT 0 NOT NULL,
    "Value" text NOT NULL,
    "Comment" character varying(1024) DEFAULT ''::character varying,
    "LineNum" bigint DEFAULT 0,
    "IsDeleted" boolean DEFAULT false NOT NULL,
    "DeletedAt" bigint DEFAULT 0 NOT NULL,
    "DataChange_CreatedBy" character varying(64) DEFAULT 'default'::character varying NOT NULL,
    "DataChange_CreatedTime" timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "DataChange_LastModifiedBy" character varying(64) DEFAULT ''::character varying,
    "DataChange_LastTime" timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public."Item" OWNER TO system;

--
-- TOC entry 285 (class 1259 OID 692162)
-- Name: Item_Id_seq; Type: SEQUENCE; Schema: public; Owner: system
--

CREATE SEQUENCE public."Item_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Item_Id_seq" OWNER TO system;

--
-- TOC entry 4007 (class 0 OID 0)
-- Dependencies: 285
-- Name: Item_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: system
--

ALTER SEQUENCE public."Item_Id_seq" OWNED BY public."Item"."Id";


--
-- TOC entry 308 (class 1259 OID 692365)
-- Name: Namespace; Type: TABLE; Schema: public; Owner: system
--

CREATE TABLE public."Namespace" (
    "Id" bigint NOT NULL,
    "AppId" character varying(64) DEFAULT 'default'::character varying NOT NULL,
    "ClusterName" character varying(500) DEFAULT 'default'::character varying NOT NULL,
    "NamespaceName" character varying(500) DEFAULT 'default'::character varying NOT NULL,
    "IsDeleted" boolean DEFAULT false NOT NULL,
    "DeletedAt" bigint DEFAULT 0 NOT NULL,
    "DataChange_CreatedBy" character varying(64) DEFAULT 'default'::character varying NOT NULL,
    "DataChange_CreatedTime" timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "DataChange_LastModifiedBy" character varying(64) DEFAULT ''::character varying,
    "DataChange_LastTime" timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public."Namespace" OWNER TO system;

--
-- TOC entry 302 (class 1259 OID 692315)
-- Name: NamespaceLock; Type: TABLE; Schema: public; Owner: system
--

CREATE TABLE public."NamespaceLock" (
    "Id" bigint NOT NULL,
    "NamespaceId" bigint DEFAULT 0 NOT NULL,
    "DataChange_CreatedBy" character varying(64) DEFAULT 'default'::character varying NOT NULL,
    "DataChange_CreatedTime" timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "DataChange_LastModifiedBy" character varying(64) DEFAULT ''::character varying,
    "DataChange_LastTime" timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    "IsDeleted" boolean DEFAULT false,
    "DeletedAt" bigint DEFAULT 0 NOT NULL
);


ALTER TABLE public."NamespaceLock" OWNER TO system;

--
-- TOC entry 301 (class 1259 OID 692310)
-- Name: NamespaceLock_Id_seq; Type: SEQUENCE; Schema: public; Owner: system
--

CREATE SEQUENCE public."NamespaceLock_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."NamespaceLock_Id_seq" OWNER TO system;

--
-- TOC entry 4008 (class 0 OID 0)
-- Dependencies: 301
-- Name: NamespaceLock_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: system
--

ALTER SEQUENCE public."NamespaceLock_Id_seq" OWNED BY public."NamespaceLock"."Id";


--
-- TOC entry 307 (class 1259 OID 692363)
-- Name: Namespace_Id_seq; Type: SEQUENCE; Schema: public; Owner: system
--

CREATE SEQUENCE public."Namespace_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Namespace_Id_seq" OWNER TO system;

--
-- TOC entry 4009 (class 0 OID 0)
-- Dependencies: 307
-- Name: Namespace_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: system
--

ALTER SEQUENCE public."Namespace_Id_seq" OWNED BY public."Namespace"."Id";


--
-- TOC entry 296 (class 1259 OID 692259)
-- Name: Release; Type: TABLE; Schema: public; Owner: system
--

CREATE TABLE public."Release" (
    "Id" bigint NOT NULL,
    "ReleaseKey" character varying(64) DEFAULT ''::character varying NOT NULL,
    "Name" character varying(64) DEFAULT 'default'::character varying NOT NULL,
    "Comment" character varying(256),
    "AppId" character varying(64) DEFAULT 'default'::character varying NOT NULL,
    "ClusterName" character varying(500) DEFAULT 'default'::character varying NOT NULL,
    "NamespaceName" character varying(500) DEFAULT 'default'::character varying NOT NULL,
    "Configurations" text NOT NULL,
    "IsAbandoned" boolean DEFAULT false NOT NULL,
    "IsDeleted" boolean DEFAULT false NOT NULL,
    "DeletedAt" bigint DEFAULT 0 NOT NULL,
    "DataChange_CreatedBy" character varying(64) DEFAULT 'default'::character varying NOT NULL,
    "DataChange_CreatedTime" timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "DataChange_LastModifiedBy" character varying(64) DEFAULT ''::character varying,
    "DataChange_LastTime" timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public."Release" OWNER TO system;

--
-- TOC entry 288 (class 1259 OID 692181)
-- Name: ReleaseHistory; Type: TABLE; Schema: public; Owner: system
--

CREATE TABLE public."ReleaseHistory" (
    "Id" bigint NOT NULL,
    "AppId" character varying(64) DEFAULT 'default'::character varying NOT NULL,
    "ClusterName" character varying(32) DEFAULT 'default'::character varying NOT NULL,
    "NamespaceName" character varying(32) DEFAULT 'default'::character varying NOT NULL,
    "BranchName" character varying(32) DEFAULT 'default'::character varying NOT NULL,
    "ReleaseId" bigint DEFAULT 0 NOT NULL,
    "PreviousReleaseId" bigint DEFAULT 0 NOT NULL,
    "Operation" smallint DEFAULT 0 NOT NULL,
    "OperationContext" text NOT NULL,
    "IsDeleted" boolean DEFAULT false NOT NULL,
    "DeletedAt" bigint DEFAULT 0 NOT NULL,
    "DataChange_CreatedBy" character varying(64) DEFAULT 'default'::character varying NOT NULL,
    "DataChange_CreatedTime" timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "DataChange_LastModifiedBy" character varying(64) DEFAULT ''::character varying,
    "DataChange_LastTime" timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public."ReleaseHistory" OWNER TO system;

--
-- TOC entry 287 (class 1259 OID 692170)
-- Name: ReleaseHistory_Id_seq; Type: SEQUENCE; Schema: public; Owner: system
--

CREATE SEQUENCE public."ReleaseHistory_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."ReleaseHistory_Id_seq" OWNER TO system;

--
-- TOC entry 4010 (class 0 OID 0)
-- Dependencies: 287
-- Name: ReleaseHistory_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: system
--

ALTER SEQUENCE public."ReleaseHistory_Id_seq" OWNED BY public."ReleaseHistory"."Id";


--
-- TOC entry 310 (class 1259 OID 692384)
-- Name: ReleaseMessage; Type: TABLE; Schema: public; Owner: system
--

CREATE TABLE public."ReleaseMessage" (
    "Id" bigint NOT NULL,
    "Message" character varying(1024) DEFAULT ''::character varying NOT NULL,
    "DataChange_LastTime" timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."ReleaseMessage" OWNER TO system;

--
-- TOC entry 309 (class 1259 OID 692380)
-- Name: ReleaseMessage_Id_seq; Type: SEQUENCE; Schema: public; Owner: system
--

CREATE SEQUENCE public."ReleaseMessage_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."ReleaseMessage_Id_seq" OWNER TO system;

--
-- TOC entry 4011 (class 0 OID 0)
-- Dependencies: 309
-- Name: ReleaseMessage_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: system
--

ALTER SEQUENCE public."ReleaseMessage_Id_seq" OWNED BY public."ReleaseMessage"."Id";


--
-- TOC entry 295 (class 1259 OID 692246)
-- Name: Release_Id_seq; Type: SEQUENCE; Schema: public; Owner: system
--

CREATE SEQUENCE public."Release_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Release_Id_seq" OWNER TO system;

--
-- TOC entry 4012 (class 0 OID 0)
-- Dependencies: 295
-- Name: Release_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: system
--

ALTER SEQUENCE public."Release_Id_seq" OWNED BY public."Release"."Id";


--
-- TOC entry 275 (class 1259 OID 692058)
-- Name: ServerConfig; Type: TABLE; Schema: public; Owner: system
--

CREATE TABLE public."ServerConfig" (
    "Id" bigint NOT NULL,
    "Key" character varying(64) DEFAULT 'default'::character varying NOT NULL,
    "Cluster" character varying(32) DEFAULT 'default'::character varying NOT NULL,
    "Value" character varying(2048) DEFAULT 'default'::character varying NOT NULL,
    "Comment" character varying(1024) DEFAULT ''::character varying,
    "IsDeleted" boolean DEFAULT false NOT NULL,
    "DeletedAt" bigint DEFAULT 0 NOT NULL,
    "DataChange_CreatedBy" character varying(64) DEFAULT 'default'::character varying NOT NULL,
    "DataChange_CreatedTime" timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "DataChange_LastModifiedBy" character varying(64) DEFAULT ''::character varying,
    "DataChange_LastTime" timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public."ServerConfig" OWNER TO system;

--
-- TOC entry 273 (class 1259 OID 692054)
-- Name: ServerConfig_Id_seq; Type: SEQUENCE; Schema: public; Owner: system
--

CREATE SEQUENCE public."ServerConfig_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."ServerConfig_Id_seq" OWNER TO system;

--
-- TOC entry 4013 (class 0 OID 0)
-- Dependencies: 273
-- Name: ServerConfig_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: system
--

ALTER SEQUENCE public."ServerConfig_Id_seq" OWNED BY public."ServerConfig"."Id";


--
-- TOC entry 291 (class 1259 OID 692210)
-- Name: ServiceRegistry; Type: TABLE; Schema: public; Owner: system
--

CREATE TABLE public."ServiceRegistry" (
    "Id" bigint NOT NULL,
    "ServiceName" character varying(64) NOT NULL,
    "Uri" character varying(64) NOT NULL,
    "Cluster" character varying(64) NOT NULL,
    "Metadata" character varying(1024) DEFAULT '{}'::character varying NOT NULL,
    "DataChange_CreatedTime" timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "DataChange_LastTime" timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."ServiceRegistry" OWNER TO system;

--
-- TOC entry 289 (class 1259 OID 692206)
-- Name: ServiceRegistry_Id_seq; Type: SEQUENCE; Schema: public; Owner: system
--

CREATE SEQUENCE public."ServiceRegistry_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."ServiceRegistry_Id_seq" OWNER TO system;

--
-- TOC entry 4014 (class 0 OID 0)
-- Dependencies: 289
-- Name: ServiceRegistry_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: system
--

ALTER SEQUENCE public."ServiceRegistry_Id_seq" OWNED BY public."ServiceRegistry"."Id";


--
-- TOC entry 3636 (class 2604 OID 692285)
-- Name: AccessKey Id; Type: DEFAULT; Schema: public; Owner: system
--

ALTER TABLE ONLY public."AccessKey" ALTER COLUMN "Id" SET DEFAULT nextval('public."AccessKey_Id_seq"'::regclass);


--
-- TOC entry 3663 (class 2604 OID 692333)
-- Name: App Id; Type: DEFAULT; Schema: public; Owner: system
--

ALTER TABLE ONLY public."App" ALTER COLUMN "Id" SET DEFAULT nextval('public."App_Id_seq"'::regclass);


--
-- TOC entry 3529 (class 2604 OID 692097)
-- Name: AppNamespace Id; Type: DEFAULT; Schema: public; Owner: system
--

ALTER TABLE ONLY public."AppNamespace" ALTER COLUMN "Id" SET DEFAULT nextval('public."AppNamespace_Id_seq"'::regclass);


--
-- TOC entry 3520 (class 2604 OID 692068)
-- Name: Audit Id; Type: DEFAULT; Schema: public; Owner: system
--

ALTER TABLE ONLY public."Audit" ALTER COLUMN "Id" SET DEFAULT nextval('public."Audit_Id_seq"'::regclass);


--
-- TOC entry 3548 (class 2604 OID 692128)
-- Name: AuditLog Id; Type: DEFAULT; Schema: public; Owner: system
--

ALTER TABLE ONLY public."AuditLog" ALTER COLUMN "Id" SET DEFAULT nextval('public."AuditLog_Id_seq"'::regclass);


--
-- TOC entry 3646 (class 2604 OID 692301)
-- Name: AuditLogDataInfluence Id; Type: DEFAULT; Schema: public; Owner: system
--

ALTER TABLE ONLY public."AuditLogDataInfluence" ALTER COLUMN "Id" SET DEFAULT nextval('public."AuditLogDataInfluence_Id_seq"'::regclass);


--
-- TOC entry 3599 (class 2604 OID 692223)
-- Name: Cluster Id; Type: DEFAULT; Schema: public; Owner: system
--

ALTER TABLE ONLY public."Cluster" ALTER COLUMN "Id" SET DEFAULT nextval('public."Cluster_Id_seq"'::regclass);


--
-- TOC entry 3560 (class 2604 OID 692148)
-- Name: Commit Id; Type: DEFAULT; Schema: public; Owner: system
--

ALTER TABLE ONLY public."Commit" ALTER COLUMN "Id" SET DEFAULT nextval('public."Commit_Id_seq"'::regclass);


--
-- TOC entry 3610 (class 2604 OID 692240)
-- Name: GrayReleaseRule Id; Type: DEFAULT; Schema: public; Owner: system
--

ALTER TABLE ONLY public."GrayReleaseRule" ALTER COLUMN "Id" SET DEFAULT nextval('public."GrayReleaseRule_Id_seq"'::regclass);


--
-- TOC entry 3541 (class 2604 OID 692115)
-- Name: Instance Id; Type: DEFAULT; Schema: public; Owner: system
--

ALTER TABLE ONLY public."Instance" ALTER COLUMN "Id" SET DEFAULT nextval('public."Instance_Id_seq"'::regclass);


--
-- TOC entry 3676 (class 2604 OID 692355)
-- Name: InstanceConfig Id; Type: DEFAULT; Schema: public; Owner: system
--

ALTER TABLE ONLY public."InstanceConfig" ALTER COLUMN "Id" SET DEFAULT nextval('public."InstanceConfig_Id_seq"'::regclass);


--
-- TOC entry 3570 (class 2604 OID 692167)
-- Name: Item Id; Type: DEFAULT; Schema: public; Owner: system
--

ALTER TABLE ONLY public."Item" ALTER COLUMN "Id" SET DEFAULT nextval('public."Item_Id_seq"'::regclass);


--
-- TOC entry 3684 (class 2604 OID 692368)
-- Name: Namespace Id; Type: DEFAULT; Schema: public; Owner: system
--

ALTER TABLE ONLY public."Namespace" ALTER COLUMN "Id" SET DEFAULT nextval('public."Namespace_Id_seq"'::regclass);


--
-- TOC entry 3656 (class 2604 OID 692319)
-- Name: NamespaceLock Id; Type: DEFAULT; Schema: public; Owner: system
--

ALTER TABLE ONLY public."NamespaceLock" ALTER COLUMN "Id" SET DEFAULT nextval('public."NamespaceLock_Id_seq"'::regclass);


--
-- TOC entry 3624 (class 2604 OID 692263)
-- Name: Release Id; Type: DEFAULT; Schema: public; Owner: system
--

ALTER TABLE ONLY public."Release" ALTER COLUMN "Id" SET DEFAULT nextval('public."Release_Id_seq"'::regclass);


--
-- TOC entry 3582 (class 2604 OID 692187)
-- Name: ReleaseHistory Id; Type: DEFAULT; Schema: public; Owner: system
--

ALTER TABLE ONLY public."ReleaseHistory" ALTER COLUMN "Id" SET DEFAULT nextval('public."ReleaseHistory_Id_seq"'::regclass);


--
-- TOC entry 3693 (class 2604 OID 692387)
-- Name: ReleaseMessage Id; Type: DEFAULT; Schema: public; Owner: system
--

ALTER TABLE ONLY public."ReleaseMessage" ALTER COLUMN "Id" SET DEFAULT nextval('public."ReleaseMessage_Id_seq"'::regclass);


--
-- TOC entry 3510 (class 2604 OID 692062)
-- Name: ServerConfig Id; Type: DEFAULT; Schema: public; Owner: system
--

ALTER TABLE ONLY public."ServerConfig" ALTER COLUMN "Id" SET DEFAULT nextval('public."ServerConfig_Id_seq"'::regclass);


--
-- TOC entry 3595 (class 2604 OID 692213)
-- Name: ServiceRegistry Id; Type: DEFAULT; Schema: public; Owner: system
--

ALTER TABLE ONLY public."ServiceRegistry" ALTER COLUMN "Id" SET DEFAULT nextval('public."ServiceRegistry_Id_seq"'::regclass);


--
-- TOC entry 3985 (class 2613 OID 694838)
-- Name: 694838; Type: BLOB; Schema: -; Owner: system
--

SELECT pg_catalog.lo_create('694838');


ALTER LARGE OBJECT 694838 OWNER TO system;

--
-- TOC entry 3986 (class 2613 OID 694839)
-- Name: 694839; Type: BLOB; Schema: -; Owner: system
--

SELECT pg_catalog.lo_create('694839');


ALTER LARGE OBJECT 694839 OWNER TO system;

--
-- TOC entry 3972 (class 0 OID 692282)
-- Dependencies: 298
-- Data for Name: AccessKey; Type: TABLE DATA; Schema: public; Owner: system
--

COPY public."AccessKey" ("Id", "AppId", "Secret", "IsEnabled", "IsDeleted", "DeletedAt", "DataChange_CreatedBy", "DataChange_CreatedTime", "DataChange_LastModifiedBy", "DataChange_LastTime") FROM stdin;
\.


--
-- TOC entry 3978 (class 0 OID 692330)
-- Dependencies: 304
-- Data for Name: App; Type: TABLE DATA; Schema: public; Owner: system
--

COPY public."App" ("Id", "AppId", "Name", "OrgId", "OrgName", "OwnerName", "OwnerEmail", "IsDeleted", "DeletedAt", "DataChange_CreatedBy", "DataChange_CreatedTime", "DataChange_LastModifiedBy", "DataChange_LastTime") FROM stdin;
1	aaa	aaa	TEST1	样例部门1	apollo	apollo@acme.com	t	1707287785549	apollo	2024-02-07 14:22:40	apollo	2024-02-07 14:36:26
2	bbb	bbb	TEST1	样例部门1	apollo	apollo@acme.com	f	0	apollo	2024-02-07 14:36:40	apollo	2024-02-07 14:36:40
\.


--
-- TOC entry 3952 (class 0 OID 692094)
-- Dependencies: 278
-- Data for Name: AppNamespace; Type: TABLE DATA; Schema: public; Owner: system
--

COPY public."AppNamespace" ("Id", "Name", "AppId", "Format", "IsPublic", "Comment", "IsDeleted", "DeletedAt", "DataChange_CreatedBy", "DataChange_CreatedTime", "DataChange_LastModifiedBy", "DataChange_LastTime") FROM stdin;
1	application	aaa	properties	f	default app namespace	t	1707287786	apollo	2024-02-07 14:22:41	apollo	2024-02-07 14:22:41
2	application	bbb	properties	f	default app namespace	f	0	apollo	2024-02-07 14:36:40	apollo	2024-02-07 14:36:40
\.


--
-- TOC entry 3950 (class 0 OID 692061)
-- Dependencies: 276
-- Data for Name: Audit; Type: TABLE DATA; Schema: public; Owner: system
--

COPY public."Audit" ("Id", "EntityName", "EntityId", "OpName", "Comment", "IsDeleted", "DeletedAt", "DataChange_CreatedBy", "DataChange_CreatedTime", "DataChange_LastModifiedBy", "DataChange_LastTime") FROM stdin;
1	App	1	INSERT	\N	f	0	apollo	2024-02-07 14:22:41	\N	2024-02-07 14:22:41
2	AppNamespace	1	INSERT	\N	f	0	apollo	2024-02-07 14:22:41	\N	2024-02-07 14:22:41
3	Cluster	1	INSERT	\N	f	0	apollo	2024-02-07 14:22:41	\N	2024-02-07 14:22:41
4	Namespace	1	INSERT	\N	f	0	apollo	2024-02-07 14:22:41	\N	2024-02-07 14:22:41
5	Item	1	INSERT	\N	f	0	apollo	2024-02-07 14:22:57	\N	2024-02-07 14:22:57
6	Namespace	1	DELETE	\N	f	0	apollo	2024-02-07 14:36:25	\N	2024-02-07 14:36:25
7	Cluster	1	DELETE	\N	f	0	apollo	2024-02-07 14:36:26	\N	2024-02-07 14:36:26
8	App	1	DELETE	\N	f	0	apollo	2024-02-07 14:36:26	\N	2024-02-07 14:36:26
9	App	2	INSERT	\N	f	0	apollo	2024-02-07 14:36:40	\N	2024-02-07 14:36:40
10	AppNamespace	2	INSERT	\N	f	0	apollo	2024-02-07 14:36:40	\N	2024-02-07 14:36:40
11	Cluster	2	INSERT	\N	f	0	apollo	2024-02-07 14:36:40	\N	2024-02-07 14:36:40
12	Namespace	2	INSERT	\N	f	0	apollo	2024-02-07 14:36:40	\N	2024-02-07 14:36:40
13	Item	2	INSERT	\N	f	0	apollo	2024-02-07 14:36:55	\N	2024-02-07 14:36:55
14	Release	1	INSERT	\N	f	0	apollo	2024-02-07 14:37:01	\N	2024-02-07 14:37:01
15	ReleaseHistory	1	INSERT	\N	f	0	apollo	2024-02-07 14:37:01	\N	2024-02-07 14:37:01
16	Item	2	UPDATE	\N	f	0	apollo	2024-02-07 14:37:19	\N	2024-02-07 14:37:19
17	Release	2	INSERT	\N	f	0	apollo	2024-02-07 14:37:21	\N	2024-02-07 14:37:21
18	ReleaseHistory	2	INSERT	\N	f	0	apollo	2024-02-07 14:37:21	\N	2024-02-07 14:37:21
\.


--
-- TOC entry 3956 (class 0 OID 692125)
-- Dependencies: 282
-- Data for Name: AuditLog; Type: TABLE DATA; Schema: public; Owner: system
--

COPY public."AuditLog" ("Id", "TraceId", "SpanId", "ParentSpanId", "FollowsFromSpanId", "Operator", "OpType", "OpName", "Description", "IsDeleted", "DeletedAt", "DataChange_CreatedBy", "DataChange_CreatedTime", "DataChange_LastModifiedBy", "DataChange_LastTime") FROM stdin;
1	25339dd96df94288a9e21f131da76dbb	3ad2af639d3b462380fa2b0ac1b911f4	706d068b715248679e3c67496fcd2ca6	\N	apollo	CREATE	App.create	no description	f	0	\N	2024-02-07 14:22:41	\N	2024-02-07 14:22:41
2	25339dd96df94288a9e21f131da76dbb	95f12e1f69e643dd933e0226ea43dcfd	706d068b715248679e3c67496fcd2ca6	\N	apollo	CREATE	AppNamespace.createDefault	no description	f	0	\N	2024-02-07 14:22:41	\N	2024-02-07 14:22:41
3	b19961b68a054fa2ae0fe01ef85db150	8a680bc616f64322b8ab69734222453f	59395fd50de64be1bc981222a664cf96	\N	apollo	DELETE	App.delete	no description	f	0	\N	2024-02-07 14:36:26	\N	2024-02-07 14:36:26
4	27114c86cddb4c598829c732528487c7	deefc6f0a3b74990b410ec5217f654b2	0e786dca41ff4c2d89c22820d19bf330	\N	apollo	CREATE	App.create	no description	f	0	\N	2024-02-07 14:36:40	\N	2024-02-07 14:36:40
5	27114c86cddb4c598829c732528487c7	f73bf00be8f3414599b5b5bdd5880c2f	0e786dca41ff4c2d89c22820d19bf330	\N	apollo	CREATE	AppNamespace.createDefault	no description	f	0	\N	2024-02-07 14:36:40	\N	2024-02-07 14:36:40
\.


--
-- TOC entry 3974 (class 0 OID 692298)
-- Dependencies: 300
-- Data for Name: AuditLogDataInfluence; Type: TABLE DATA; Schema: public; Owner: system
--

COPY public."AuditLogDataInfluence" ("Id", "SpanId", "InfluenceEntityId", "InfluenceEntityName", "FieldName", "FieldOldValue", "FieldNewValue", "IsDeleted", "DeletedAt", "DataChange_CreatedBy", "DataChange_CreatedTime", "DataChange_LastModifiedBy", "DataChange_LastTime") FROM stdin;
1	3ad2af639d3b462380fa2b0ac1b911f4	1	App	Name	\N	aaa	f	0	\N	2024-02-07 14:22:41	\N	2024-02-07 14:22:41
2	3ad2af639d3b462380fa2b0ac1b911f4	1	App	AppId	\N	aaa	f	0	\N	2024-02-07 14:22:41	\N	2024-02-07 14:22:41
3	95f12e1f69e643dd933e0226ea43dcfd	1	AppNamespace	Name	\N	application	f	0	\N	2024-02-07 14:22:41	\N	2024-02-07 14:22:41
4	95f12e1f69e643dd933e0226ea43dcfd	1	AppNamespace	AppId	\N	aaa	f	0	\N	2024-02-07 14:22:41	\N	2024-02-07 14:22:41
5	95f12e1f69e643dd933e0226ea43dcfd	1	AppNamespace	Format	\N	properties	f	0	\N	2024-02-07 14:22:41	\N	2024-02-07 14:22:41
6	95f12e1f69e643dd933e0226ea43dcfd	1	AppNamespace	IsPublic	\N	false	f	0	\N	2024-02-07 14:22:41	\N	2024-02-07 14:22:41
7	8a680bc616f64322b8ab69734222453f	1	App	Name	aaa	\N	f	0	\N	2024-02-07 14:36:26	\N	2024-02-07 14:36:26
8	8a680bc616f64322b8ab69734222453f	1	App	AppId	aaa	\N	f	0	\N	2024-02-07 14:36:26	\N	2024-02-07 14:36:26
9	deefc6f0a3b74990b410ec5217f654b2	2	App	Name	\N	bbb	f	0	\N	2024-02-07 14:36:40	\N	2024-02-07 14:36:40
10	deefc6f0a3b74990b410ec5217f654b2	2	App	AppId	\N	bbb	f	0	\N	2024-02-07 14:36:40	\N	2024-02-07 14:36:40
11	f73bf00be8f3414599b5b5bdd5880c2f	2	AppNamespace	Name	\N	application	f	0	\N	2024-02-07 14:36:40	\N	2024-02-07 14:36:40
12	f73bf00be8f3414599b5b5bdd5880c2f	2	AppNamespace	AppId	\N	bbb	f	0	\N	2024-02-07 14:36:40	\N	2024-02-07 14:36:40
13	f73bf00be8f3414599b5b5bdd5880c2f	2	AppNamespace	Format	\N	properties	f	0	\N	2024-02-07 14:36:40	\N	2024-02-07 14:36:40
14	f73bf00be8f3414599b5b5bdd5880c2f	2	AppNamespace	IsPublic	\N	false	f	0	\N	2024-02-07 14:36:40	\N	2024-02-07 14:36:40
\.


--
-- TOC entry 3966 (class 0 OID 692219)
-- Dependencies: 292
-- Data for Name: Cluster; Type: TABLE DATA; Schema: public; Owner: system
--

COPY public."Cluster" ("Id", "Name", "AppId", "ParentClusterId", "IsDeleted", "DeletedAt", "DataChange_CreatedBy", "DataChange_CreatedTime", "DataChange_LastModifiedBy", "DataChange_LastTime", "Comment") FROM stdin;
1	default	aaa	0	t	1707287785524	apollo	2024-02-07 14:22:41	apollo	2024-02-07 14:36:26	\N
2	default	bbb	0	f	0	apollo	2024-02-07 14:36:40	apollo	2024-02-07 14:36:40	\N
\.


--
-- TOC entry 3958 (class 0 OID 692145)
-- Dependencies: 284
-- Data for Name: Commit; Type: TABLE DATA; Schema: public; Owner: system
--

COPY public."Commit" ("Id", "ChangeSets", "AppId", "ClusterName", "NamespaceName", "Comment", "IsDeleted", "DeletedAt", "DataChange_CreatedBy", "DataChange_CreatedTime", "DataChange_LastModifiedBy", "DataChange_LastTime") FROM stdin;
1	694839	aaa	default	application	\N	t	1707287786	apollo	2024-02-07 14:22:57	apollo	2024-02-07 14:22:57
2	{"createItems":[{"namespaceId":2,"key":"bfdbdf","type":0,"value":"bfdb","lineNum":1,"id":2,"isDeleted":false,"deletedAt":0,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2024-02-07 14:36:55","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2024-02-07 14:36:55"}],"updateItems":[],"deleteItems":[]}	bbb	default	application	\N	f	0	apollo	2024-02-07 14:36:55	apollo	2024-02-07 14:36:55
3	{"createItems":[],"updateItems":[{"oldItem":{"namespaceId":2,"key":"bfdbdf","type":0,"value":"bfdb","lineNum":1,"id":2,"isDeleted":false,"deletedAt":0,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2024-02-07 14:36:55","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2024-02-07 14:36:55"},"newItem":{"namespaceId":2,"key":"bfdbdf","type":0,"value":"bfdb4565464","comment":"","lineNum":1,"id":2,"isDeleted":false,"deletedAt":0,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2024-02-07 14:36:55","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2024-02-07 14:37:19"}}],"deleteItems":[]}	bbb	default	application	\N	f	0	apollo	2024-02-07 14:37:19	apollo	2024-02-07 14:37:19
\.


--
-- TOC entry 3968 (class 0 OID 692237)
-- Dependencies: 294
-- Data for Name: GrayReleaseRule; Type: TABLE DATA; Schema: public; Owner: system
--

COPY public."GrayReleaseRule" ("Id", "AppId", "ClusterName", "NamespaceName", "BranchName", "Rules", "ReleaseId", "BranchStatus", "IsDeleted", "DeletedAt", "DataChange_CreatedBy", "DataChange_CreatedTime", "DataChange_LastModifiedBy", "DataChange_LastTime") FROM stdin;
\.


--
-- TOC entry 3954 (class 0 OID 692112)
-- Dependencies: 280
-- Data for Name: Instance; Type: TABLE DATA; Schema: public; Owner: system
--

COPY public."Instance" ("Id", "AppId", "ClusterName", "DataCenter", "Ip", "DataChange_CreatedTime", "DataChange_LastTime") FROM stdin;
\.


--
-- TOC entry 3980 (class 0 OID 692352)
-- Dependencies: 306
-- Data for Name: InstanceConfig; Type: TABLE DATA; Schema: public; Owner: system
--

COPY public."InstanceConfig" ("Id", "InstanceId", "ConfigAppId", "ConfigClusterName", "ConfigNamespaceName", "ReleaseKey", "ReleaseDeliveryTime", "DataChange_CreatedTime", "DataChange_LastTime") FROM stdin;
\.


--
-- TOC entry 3960 (class 0 OID 692164)
-- Dependencies: 286
-- Data for Name: Item; Type: TABLE DATA; Schema: public; Owner: system
--

COPY public."Item" ("Id", "NamespaceId", "Key", "Type", "Value", "Comment", "LineNum", "IsDeleted", "DeletedAt", "DataChange_CreatedBy", "DataChange_CreatedTime", "DataChange_LastModifiedBy", "DataChange_LastTime") FROM stdin;
1	1	123	0	694838	\N	1	t	1707287786	apollo	2024-02-07 14:22:57	apollo	2024-02-07 14:22:57
2	2	bfdbdf	0	bfdb4565464		1	f	0	apollo	2024-02-07 14:36:55	apollo	2024-02-07 14:37:19
\.


--
-- TOC entry 3982 (class 0 OID 692365)
-- Dependencies: 308
-- Data for Name: Namespace; Type: TABLE DATA; Schema: public; Owner: system
--

COPY public."Namespace" ("Id", "AppId", "ClusterName", "NamespaceName", "IsDeleted", "DeletedAt", "DataChange_CreatedBy", "DataChange_CreatedTime", "DataChange_LastModifiedBy", "DataChange_LastTime") FROM stdin;
1	aaa	default	application	t	1707287785484	apollo	2024-02-07 14:22:41	apollo	2024-02-07 14:36:26
2	bbb	default	application	f	0	apollo	2024-02-07 14:36:40	apollo	2024-02-07 14:36:40
\.


--
-- TOC entry 3976 (class 0 OID 692315)
-- Dependencies: 302
-- Data for Name: NamespaceLock; Type: TABLE DATA; Schema: public; Owner: system
--

COPY public."NamespaceLock" ("Id", "NamespaceId", "DataChange_CreatedBy", "DataChange_CreatedTime", "DataChange_LastModifiedBy", "DataChange_LastTime", "IsDeleted", "DeletedAt") FROM stdin;
\.


--
-- TOC entry 3970 (class 0 OID 692259)
-- Dependencies: 296
-- Data for Name: Release; Type: TABLE DATA; Schema: public; Owner: system
--

COPY public."Release" ("Id", "ReleaseKey", "Name", "Comment", "AppId", "ClusterName", "NamespaceName", "Configurations", "IsAbandoned", "IsDeleted", "DeletedAt", "DataChange_CreatedBy", "DataChange_CreatedTime", "DataChange_LastModifiedBy", "DataChange_LastTime") FROM stdin;
1	20240207143701-673085f77d06b90c	20240207143700-release		bbb	default	application	{"bfdbdf":"bfdb"}	f	f	0	apollo	2024-02-07 14:37:01	apollo	2024-02-07 14:37:01
2	20240207143720-673085f77d06b90d	20240207143720-release		bbb	default	application	{"bfdbdf":"bfdb4565464"}	f	f	0	apollo	2024-02-07 14:37:21	apollo	2024-02-07 14:37:21
\.


--
-- TOC entry 3962 (class 0 OID 692181)
-- Dependencies: 288
-- Data for Name: ReleaseHistory; Type: TABLE DATA; Schema: public; Owner: system
--

COPY public."ReleaseHistory" ("Id", "AppId", "ClusterName", "NamespaceName", "BranchName", "ReleaseId", "PreviousReleaseId", "Operation", "OperationContext", "IsDeleted", "DeletedAt", "DataChange_CreatedBy", "DataChange_CreatedTime", "DataChange_LastModifiedBy", "DataChange_LastTime") FROM stdin;
1	bbb	default	application	default	1	0	0	{"isEmergencyPublish":false}	f	0	apollo	2024-02-07 14:37:01	apollo	2024-02-07 14:37:01
2	bbb	default	application	default	2	1	0	{"isEmergencyPublish":false}	f	0	apollo	2024-02-07 14:37:21	apollo	2024-02-07 14:37:21
\.


--
-- TOC entry 3984 (class 0 OID 692384)
-- Dependencies: 310
-- Data for Name: ReleaseMessage; Type: TABLE DATA; Schema: public; Owner: system
--

COPY public."ReleaseMessage" ("Id", "Message", "DataChange_LastTime") FROM stdin;
1	aaa+default+application	2024-02-07 14:36:26
3	bbb+default+application	2024-02-07 14:37:21
\.


--
-- TOC entry 3949 (class 0 OID 692058)
-- Dependencies: 275
-- Data for Name: ServerConfig; Type: TABLE DATA; Schema: public; Owner: system
--

COPY public."ServerConfig" ("Id", "Key", "Cluster", "Value", "Comment", "IsDeleted", "DeletedAt", "DataChange_CreatedBy", "DataChange_CreatedTime", "DataChange_LastModifiedBy", "DataChange_LastTime") FROM stdin;
1	eureka.service.url	default	http://localhost:8080/eureka/	Eureka服务Url，多个service以英文逗号分隔	f	0	default	2024-02-04 09:42:37		2024-02-04 09:42:37
2	namespace.lock.switch	default	false	一次发布只能有一个人修改开关	f	0	default	2024-02-04 09:42:37		2024-02-04 09:42:37
3	item.key.length.limit	default	128	item key 最大长度限制	f	0	default	2024-02-04 09:42:37		2024-02-04 09:42:37
4	item.value.length.limit	default	20000	item value最大长度限制	f	0	default	2024-02-04 09:42:37		2024-02-04 09:42:37
5	config-service.cache.enabled	default	false	ConfigService是否开启缓存，开启后能提高性能，但是会增大内存消耗！	f	0	default	2024-02-04 09:42:37		2024-02-04 09:42:37
\.


--
-- TOC entry 3965 (class 0 OID 692210)
-- Dependencies: 291
-- Data for Name: ServiceRegistry; Type: TABLE DATA; Schema: public; Owner: system
--

COPY public."ServiceRegistry" ("Id", "ServiceName", "Uri", "Cluster", "Metadata", "DataChange_CreatedTime", "DataChange_LastTime") FROM stdin;
\.


--
-- TOC entry 4015 (class 0 OID 0)
-- Dependencies: 297
-- Name: AccessKey_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: system
--

SELECT pg_catalog.setval('public."AccessKey_Id_seq"', 1, false);


--
-- TOC entry 4016 (class 0 OID 0)
-- Dependencies: 277
-- Name: AppNamespace_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: system
--

SELECT pg_catalog.setval('public."AppNamespace_Id_seq"', 2, true);


--
-- TOC entry 4017 (class 0 OID 0)
-- Dependencies: 303
-- Name: App_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: system
--

SELECT pg_catalog.setval('public."App_Id_seq"', 2, true);


--
-- TOC entry 4018 (class 0 OID 0)
-- Dependencies: 299
-- Name: AuditLogDataInfluence_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: system
--

SELECT pg_catalog.setval('public."AuditLogDataInfluence_Id_seq"', 14, true);


--
-- TOC entry 4019 (class 0 OID 0)
-- Dependencies: 281
-- Name: AuditLog_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: system
--

SELECT pg_catalog.setval('public."AuditLog_Id_seq"', 5, true);


--
-- TOC entry 4020 (class 0 OID 0)
-- Dependencies: 274
-- Name: Audit_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: system
--

SELECT pg_catalog.setval('public."Audit_Id_seq"', 18, true);


--
-- TOC entry 4021 (class 0 OID 0)
-- Dependencies: 290
-- Name: Cluster_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: system
--

SELECT pg_catalog.setval('public."Cluster_Id_seq"', 2, true);


--
-- TOC entry 4022 (class 0 OID 0)
-- Dependencies: 283
-- Name: Commit_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: system
--

SELECT pg_catalog.setval('public."Commit_Id_seq"', 3, true);


--
-- TOC entry 4023 (class 0 OID 0)
-- Dependencies: 293
-- Name: GrayReleaseRule_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: system
--

SELECT pg_catalog.setval('public."GrayReleaseRule_Id_seq"', 1, false);


--
-- TOC entry 4024 (class 0 OID 0)
-- Dependencies: 305
-- Name: InstanceConfig_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: system
--

SELECT pg_catalog.setval('public."InstanceConfig_Id_seq"', 1, false);


--
-- TOC entry 4025 (class 0 OID 0)
-- Dependencies: 279
-- Name: Instance_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: system
--

SELECT pg_catalog.setval('public."Instance_Id_seq"', 1, false);


--
-- TOC entry 4026 (class 0 OID 0)
-- Dependencies: 285
-- Name: Item_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: system
--

SELECT pg_catalog.setval('public."Item_Id_seq"', 2, true);


--
-- TOC entry 4027 (class 0 OID 0)
-- Dependencies: 301
-- Name: NamespaceLock_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: system
--

SELECT pg_catalog.setval('public."NamespaceLock_Id_seq"', 1, false);


--
-- TOC entry 4028 (class 0 OID 0)
-- Dependencies: 307
-- Name: Namespace_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: system
--

SELECT pg_catalog.setval('public."Namespace_Id_seq"', 2, true);


--
-- TOC entry 4029 (class 0 OID 0)
-- Dependencies: 287
-- Name: ReleaseHistory_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: system
--

SELECT pg_catalog.setval('public."ReleaseHistory_Id_seq"', 2, true);


--
-- TOC entry 4030 (class 0 OID 0)
-- Dependencies: 309
-- Name: ReleaseMessage_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: system
--

SELECT pg_catalog.setval('public."ReleaseMessage_Id_seq"', 3, true);


--
-- TOC entry 4031 (class 0 OID 0)
-- Dependencies: 295
-- Name: Release_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: system
--

SELECT pg_catalog.setval('public."Release_Id_seq"', 2, true);


--
-- TOC entry 4032 (class 0 OID 0)
-- Dependencies: 273
-- Name: ServerConfig_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: system
--

SELECT pg_catalog.setval('public."ServerConfig_Id_seq"', 6, false);


--
-- TOC entry 4033 (class 0 OID 0)
-- Dependencies: 289
-- Name: ServiceRegistry_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: system
--

SELECT pg_catalog.setval('public."ServiceRegistry_Id_seq"', 1, false);


--
-- TOC entry 3987 (class 0 OID 0)
-- Data for Name: BLOBS; Type: BLOBS; Schema: -; Owner: -
--

BEGIN;

SELECT pg_catalog.lo_open('694838', 131072);
SELECT pg_catalog.lowrite(0, '\x313233');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('694839', 131072);
SELECT pg_catalog.lowrite(0, '\x7b226372656174654974656d73223a5b7b226e616d6573706163654964223a312c226b6579223a22313233222c2274797065223a302c2276616c7565223a22313233222c226c696e654e756d223a312c226964223a312c22697344656c65746564223a66616c73652c2264656c657465644174223a302c22646174614368616e6765437265617465644279223a2261706f6c6c6f222c22646174614368616e67654372656174656454696d65223a22323032342d30322d30372031343a32323a3537222c22646174614368616e67654c6173744d6f6469666965644279223a2261706f6c6c6f222c22646174614368616e67654c6173744d6f64696669656454696d65223a22323032342d30322d30372031343a32323a3537227d5d2c227570646174654974656d73223a5b5d2c2264656c6574654974656d73223a5b5d7d');
SELECT pg_catalog.lo_close(0);

COMMIT;

--
-- TOC entry 3713 (class 2606 OID 692487)
-- Name: Instance IX_UNIQUE_KEY_2550120B; Type: CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public."Instance"
    ADD CONSTRAINT "IX_UNIQUE_KEY_2550120B" UNIQUE ("AppId", "ClusterName", "Ip", "DataCenter");


--
-- TOC entry 3740 (class 2606 OID 692466)
-- Name: ServiceRegistry IX_UNIQUE_KEY_BBAF7141; Type: CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public."ServiceRegistry"
    ADD CONSTRAINT "IX_UNIQUE_KEY_BBAF7141" UNIQUE ("ServiceName", "Uri");


--
-- TOC entry 3783 (class 2606 OID 692493)
-- Name: InstanceConfig IX_UNIQUE_KEY_C15CA8A1; Type: CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public."InstanceConfig"
    ADD CONSTRAINT "IX_UNIQUE_KEY_C15CA8A1" UNIQUE ("InstanceId", "ConfigAppId", "ConfigNamespaceName");


--
-- TOC entry 3768 (class 2606 OID 692421)
-- Name: AuditLogDataInfluence PRIMARY_11ECE35D; Type: CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public."AuditLogDataInfluence"
    ADD CONSTRAINT "PRIMARY_11ECE35D" PRIMARY KEY ("Id");


--
-- TOC entry 3737 (class 2606 OID 692407)
-- Name: ReleaseHistory PRIMARY_1956E4A8; Type: CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public."ReleaseHistory"
    ADD CONSTRAINT "PRIMARY_1956E4A8" PRIMARY KEY ("Id");


--
-- TOC entry 3715 (class 2606 OID 692401)
-- Name: Instance PRIMARY_3BD172B0; Type: CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public."Instance"
    ADD CONSTRAINT "PRIMARY_3BD172B0" PRIMARY KEY ("Id");


--
-- TOC entry 3746 (class 2606 OID 692415)
-- Name: Cluster PRIMARY_51F39D5; Type: CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public."Cluster"
    ADD CONSTRAINT "PRIMARY_51F39D5" PRIMARY KEY ("Id");


--
-- TOC entry 3742 (class 2606 OID 692405)
-- Name: ServiceRegistry PRIMARY_6259EDED; Type: CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public."ServiceRegistry"
    ADD CONSTRAINT "PRIMARY_6259EDED" PRIMARY KEY ("Id");


--
-- TOC entry 3727 (class 2606 OID 692403)
-- Name: Commit PRIMARY_694B0B52; Type: CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public."Commit"
    ADD CONSTRAINT "PRIMARY_694B0B52" PRIMARY KEY ("Id");


--
-- TOC entry 3698 (class 2606 OID 692427)
-- Name: ServerConfig PRIMARY_81230E80; Type: CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public."ServerConfig"
    ADD CONSTRAINT "PRIMARY_81230E80" PRIMARY KEY ("Id");


--
-- TOC entry 3731 (class 2606 OID 692409)
-- Name: Item PRIMARY_83F2AD2E; Type: CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public."Item"
    ADD CONSTRAINT "PRIMARY_83F2AD2E" PRIMARY KEY ("Id");


--
-- TOC entry 3796 (class 2606 OID 692453)
-- Name: ReleaseMessage PRIMARY_8BBABA1B; Type: CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public."ReleaseMessage"
    ADD CONSTRAINT "PRIMARY_8BBABA1B" PRIMARY KEY ("Id");


--
-- TOC entry 3790 (class 2606 OID 692436)
-- Name: Namespace PRIMARY_91682336; Type: CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public."Namespace"
    ADD CONSTRAINT "PRIMARY_91682336" PRIMARY KEY ("Id");


--
-- TOC entry 3707 (class 2606 OID 692397)
-- Name: AppNamespace PRIMARY_9906B455; Type: CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public."AppNamespace"
    ADD CONSTRAINT "PRIMARY_9906B455" PRIMARY KEY ("Id");


--
-- TOC entry 3721 (class 2606 OID 692399)
-- Name: AuditLog PRIMARY_AF43F384; Type: CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public."AuditLog"
    ADD CONSTRAINT "PRIMARY_AF43F384" PRIMARY KEY ("Id");


--
-- TOC entry 3752 (class 2606 OID 692413)
-- Name: GrayReleaseRule PRIMARY_AF6BA51B; Type: CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public."GrayReleaseRule"
    ADD CONSTRAINT "PRIMARY_AF6BA51B" PRIMARY KEY ("Id");


--
-- TOC entry 3771 (class 2606 OID 692417)
-- Name: NamespaceLock PRIMARY_C1165101; Type: CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public."NamespaceLock"
    ADD CONSTRAINT "PRIMARY_C1165101" PRIMARY KEY ("Id");


--
-- TOC entry 3761 (class 2606 OID 692414)
-- Name: AccessKey PRIMARY_CDB19436; Type: CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public."AccessKey"
    ADD CONSTRAINT "PRIMARY_CDB19436" PRIMARY KEY ("Id");


--
-- TOC entry 3777 (class 2606 OID 692423)
-- Name: App PRIMARY_E21D63FC; Type: CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public."App"
    ADD CONSTRAINT "PRIMARY_E21D63FC" PRIMARY KEY ("Id");


--
-- TOC entry 3786 (class 2606 OID 692438)
-- Name: InstanceConfig PRIMARY_EB1C4252; Type: CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public."InstanceConfig"
    ADD CONSTRAINT "PRIMARY_EB1C4252" PRIMARY KEY ("Id");


--
-- TOC entry 3703 (class 2606 OID 692395)
-- Name: Audit PRIMARY_F2E059B6; Type: CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public."Audit"
    ADD CONSTRAINT "PRIMARY_F2E059B6" PRIMARY KEY ("Id");


--
-- TOC entry 3756 (class 2606 OID 692419)
-- Name: Release PRIMARY_F7D995E2; Type: CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public."Release"
    ADD CONSTRAINT "PRIMARY_F7D995E2" PRIMARY KEY ("Id");


--
-- TOC entry 3792 (class 2606 OID 692492)
-- Name: Namespace UK_AppId_ClusterName_NamespaceName_DeletedAt_DD5; Type: CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public."Namespace"
    ADD CONSTRAINT "UK_AppId_ClusterName_NamespaceName_DeletedAt_DD5" UNIQUE ("AppId", "ClusterName", "NamespaceName", "DeletedAt");


--
-- TOC entry 3779 (class 2606 OID 692482)
-- Name: App UK_AppId_DeletedAt_3DEBF313; Type: CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public."App"
    ADD CONSTRAINT "UK_AppId_DeletedAt_3DEBF313" UNIQUE ("AppId", "DeletedAt");


--
-- TOC entry 3748 (class 2606 OID 692483)
-- Name: Cluster UK_AppId_Name_DeletedAt_4C43E912; Type: CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public."Cluster"
    ADD CONSTRAINT "UK_AppId_Name_DeletedAt_4C43E912" UNIQUE ("AppId", "Name", "DeletedAt");


--
-- TOC entry 3709 (class 2606 OID 692461)
-- Name: AppNamespace UK_AppId_Name_DeletedAt_DE2CC392; Type: CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public."AppNamespace"
    ADD CONSTRAINT "UK_AppId_Name_DeletedAt_DE2CC392" UNIQUE ("AppId", "Name", "DeletedAt");


--
-- TOC entry 3763 (class 2606 OID 692464)
-- Name: AccessKey UK_AppId_Secret_DeletedAt_5E6B3CBD; Type: CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public."AccessKey"
    ADD CONSTRAINT "UK_AppId_Secret_DeletedAt_5E6B3CBD" UNIQUE ("AppId", "Secret", "DeletedAt");


--
-- TOC entry 3700 (class 2606 OID 692473)
-- Name: ServerConfig UK_Key_Cluster_DeletedAt_63B6F937; Type: CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public."ServerConfig"
    ADD CONSTRAINT "UK_Key_Cluster_DeletedAt_63B6F937" UNIQUE ("Key", "Cluster", "DeletedAt");


--
-- TOC entry 3773 (class 2606 OID 692480)
-- Name: NamespaceLock UK_NamespaceId_DeletedAt_8CE3CD98; Type: CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public."NamespaceLock"
    ADD CONSTRAINT "UK_NamespaceId_DeletedAt_8CE3CD98" UNIQUE ("NamespaceId", "DeletedAt");


--
-- TOC entry 3758 (class 2606 OID 692484)
-- Name: Release UK_ReleaseKey_DeletedAt_F480B233; Type: CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public."Release"
    ADD CONSTRAINT "UK_ReleaseKey_DeletedAt_F480B233" UNIQUE ("ReleaseKey", "DeletedAt");


--
-- TOC entry 3753 (class 1259 OID 692441)
-- Name: AppId_ClusterName_GroupName_61CE7C50; Type: INDEX; Schema: public; Owner: system
--

CREATE INDEX "AppId_ClusterName_GroupName_61CE7C50" ON public."Release" USING btree ("AppId", "ClusterName", "NamespaceName");


--
-- TOC entry 3722 (class 1259 OID 692425)
-- Name: AppId_EDCE3B24; Type: INDEX; Schema: public; Owner: system
--

CREATE INDEX "AppId_EDCE3B24" ON public."Commit" USING btree ("AppId");


--
-- TOC entry 3723 (class 1259 OID 692433)
-- Name: ClusterName_5E2E5644; Type: INDEX; Schema: public; Owner: system
--

CREATE INDEX "ClusterName_5E2E5644" ON public."Commit" USING btree ("ClusterName");


--
-- TOC entry 3704 (class 1259 OID 692428)
-- Name: DataChange_LastTime_2F675AA1; Type: INDEX; Schema: public; Owner: system
--

CREATE INDEX "DataChange_LastTime_2F675AA1" ON public."AppNamespace" USING btree ("DataChange_LastTime");


--
-- TOC entry 3749 (class 1259 OID 692444)
-- Name: DataChange_LastTime_49F5279B; Type: INDEX; Schema: public; Owner: system
--

CREATE INDEX "DataChange_LastTime_49F5279B" ON public."GrayReleaseRule" USING btree ("DataChange_LastTime");


--
-- TOC entry 3743 (class 1259 OID 692445)
-- Name: DataChange_LastTime_65CEC521; Type: INDEX; Schema: public; Owner: system
--

CREATE INDEX "DataChange_LastTime_65CEC521" ON public."Cluster" USING btree ("DataChange_LastTime");


--
-- TOC entry 3759 (class 1259 OID 692439)
-- Name: DataChange_LastTime_743FB260; Type: INDEX; Schema: public; Owner: system
--

CREATE INDEX "DataChange_LastTime_743FB260" ON public."AccessKey" USING btree ("DataChange_LastTime");


--
-- TOC entry 3754 (class 1259 OID 692459)
-- Name: DataChange_LastTime_7BC6A034; Type: INDEX; Schema: public; Owner: system
--

CREATE INDEX "DataChange_LastTime_7BC6A034" ON public."Release" USING btree ("DataChange_LastTime");


--
-- TOC entry 3701 (class 1259 OID 692424)
-- Name: DataChange_LastTime_7C38DCE0; Type: INDEX; Schema: public; Owner: system
--

CREATE INDEX "DataChange_LastTime_7C38DCE0" ON public."Audit" USING btree ("DataChange_LastTime");


--
-- TOC entry 3787 (class 1259 OID 692465)
-- Name: DataChange_LastTime_8278360; Type: INDEX; Schema: public; Owner: system
--

CREATE INDEX "DataChange_LastTime_8278360" ON public."Namespace" USING btree ("DataChange_LastTime");


--
-- TOC entry 3724 (class 1259 OID 692449)
-- Name: DataChange_LastTime_A1F060C4; Type: INDEX; Schema: public; Owner: system
--

CREATE INDEX "DataChange_LastTime_A1F060C4" ON public."Commit" USING btree ("DataChange_LastTime");


--
-- TOC entry 3774 (class 1259 OID 692450)
-- Name: DataChange_LastTime_C007005A; Type: INDEX; Schema: public; Owner: system
--

CREATE INDEX "DataChange_LastTime_C007005A" ON public."App" USING btree ("DataChange_LastTime");


--
-- TOC entry 3769 (class 1259 OID 692448)
-- Name: DataChange_LastTime_C2508D75; Type: INDEX; Schema: public; Owner: system
--

CREATE INDEX "DataChange_LastTime_C2508D75" ON public."NamespaceLock" USING btree ("DataChange_LastTime");


--
-- TOC entry 3696 (class 1259 OID 692446)
-- Name: DataChange_LastTime_DE221456; Type: INDEX; Schema: public; Owner: system
--

CREATE INDEX "DataChange_LastTime_DE221456" ON public."ServerConfig" USING btree ("DataChange_LastTime");


--
-- TOC entry 3793 (class 1259 OID 692472)
-- Name: DataChange_LastTime_E1A329B; Type: INDEX; Schema: public; Owner: system
--

CREATE INDEX "DataChange_LastTime_E1A329B" ON public."ReleaseMessage" USING btree ("DataChange_LastTime");


--
-- TOC entry 3728 (class 1259 OID 692429)
-- Name: DataChange_LastTime_E8FBDC68; Type: INDEX; Schema: public; Owner: system
--

CREATE INDEX "DataChange_LastTime_E8FBDC68" ON public."Item" USING btree ("DataChange_LastTime");


--
-- TOC entry 3764 (class 1259 OID 692442)
-- Name: IX_DataChange_CreatedTime_17772E57; Type: INDEX; Schema: public; Owner: system
--

CREATE INDEX "IX_DataChange_CreatedTime_17772E57" ON public."AuditLogDataInfluence" USING btree ("DataChange_CreatedTime");


--
-- TOC entry 3716 (class 1259 OID 692434)
-- Name: IX_DataChange_CreatedTime_AA27E93E; Type: INDEX; Schema: public; Owner: system
--

CREATE INDEX "IX_DataChange_CreatedTime_AA27E93E" ON public."AuditLog" USING btree ("DataChange_CreatedTime");


--
-- TOC entry 3738 (class 1259 OID 692430)
-- Name: IX_DataChange_LastTime_65A3FF9F; Type: INDEX; Schema: public; Owner: system
--

CREATE INDEX "IX_DataChange_LastTime_65A3FF9F" ON public."ServiceRegistry" USING btree ("DataChange_LastTime");


--
-- TOC entry 3732 (class 1259 OID 692431)
-- Name: IX_DataChange_LastTime_67DF4A5A; Type: INDEX; Schema: public; Owner: system
--

CREATE INDEX "IX_DataChange_LastTime_67DF4A5A" ON public."ReleaseHistory" USING btree ("DataChange_LastTime");


--
-- TOC entry 3710 (class 1259 OID 692432)
-- Name: IX_DataChange_LastTime_BB5FB862; Type: INDEX; Schema: public; Owner: system
--

CREATE INDEX "IX_DataChange_LastTime_BB5FB862" ON public."Instance" USING btree ("DataChange_LastTime");


--
-- TOC entry 3780 (class 1259 OID 692454)
-- Name: IX_DataChange_LastTime_D6338004; Type: INDEX; Schema: public; Owner: system
--

CREATE INDEX "IX_DataChange_LastTime_D6338004" ON public."InstanceConfig" USING btree ("DataChange_LastTime");


--
-- TOC entry 3765 (class 1259 OID 692469)
-- Name: IX_EntityId_96BFAB9E; Type: INDEX; Schema: public; Owner: system
--

CREATE INDEX "IX_EntityId_96BFAB9E" ON public."AuditLogDataInfluence" USING btree ("InfluenceEntityId");


--
-- TOC entry 3729 (class 1259 OID 692443)
-- Name: IX_GroupId_71BF7EDC; Type: INDEX; Schema: public; Owner: system
--

CREATE INDEX "IX_GroupId_71BF7EDC" ON public."Item" USING btree ("NamespaceId");


--
-- TOC entry 3711 (class 1259 OID 692451)
-- Name: IX_IP_E0B74CF8; Type: INDEX; Schema: public; Owner: system
--

CREATE INDEX "IX_IP_E0B74CF8" ON public."Instance" USING btree ("Ip");


--
-- TOC entry 3794 (class 1259 OID 692485)
-- Name: IX_Message_BD8E7B2D; Type: INDEX; Schema: public; Owner: system
--

CREATE INDEX "IX_Message_BD8E7B2D" ON public."ReleaseMessage" USING btree ("Message");


--
-- TOC entry 3775 (class 1259 OID 692456)
-- Name: IX_Name_EB95B6C; Type: INDEX; Schema: public; Owner: system
--

CREATE INDEX "IX_Name_EB95B6C" ON public."App" USING btree ("Name");


--
-- TOC entry 3788 (class 1259 OID 692475)
-- Name: IX_NamespaceName_B2846D08; Type: INDEX; Schema: public; Owner: system
--

CREATE INDEX "IX_NamespaceName_B2846D08" ON public."Namespace" USING btree ("NamespaceName");


--
-- TOC entry 3733 (class 1259 OID 692447)
-- Name: IX_Namespace_7002504; Type: INDEX; Schema: public; Owner: system
--

CREATE INDEX "IX_Namespace_7002504" ON public."ReleaseHistory" USING btree ("AppId", "ClusterName", "NamespaceName", "BranchName");


--
-- TOC entry 3750 (class 1259 OID 692467)
-- Name: IX_Namespace_7EE2727B; Type: INDEX; Schema: public; Owner: system
--

CREATE INDEX "IX_Namespace_7EE2727B" ON public."GrayReleaseRule" USING btree ("AppId", "ClusterName", "NamespaceName");


--
-- TOC entry 3717 (class 1259 OID 692488)
-- Name: IX_OpName_35A45D96; Type: INDEX; Schema: public; Owner: system
--

CREATE INDEX "IX_OpName_35A45D96" ON public."AuditLog" USING btree ("OpName");


--
-- TOC entry 3718 (class 1259 OID 692468)
-- Name: IX_Operator_1683F3E6; Type: INDEX; Schema: public; Owner: system
--

CREATE INDEX "IX_Operator_1683F3E6" ON public."AuditLog" USING btree ("Operator");


--
-- TOC entry 3744 (class 1259 OID 692458)
-- Name: IX_ParentClusterId_7248B867; Type: INDEX; Schema: public; Owner: system
--

CREATE INDEX "IX_ParentClusterId_7248B867" ON public."Cluster" USING btree ("ParentClusterId");


--
-- TOC entry 3734 (class 1259 OID 692455)
-- Name: IX_PreviousReleaseId_1159BAFA; Type: INDEX; Schema: public; Owner: system
--

CREATE INDEX "IX_PreviousReleaseId_1159BAFA" ON public."ReleaseHistory" USING btree ("PreviousReleaseId");


--
-- TOC entry 3735 (class 1259 OID 692470)
-- Name: IX_ReleaseId_4FF892FA; Type: INDEX; Schema: public; Owner: system
--

CREATE INDEX "IX_ReleaseId_4FF892FA" ON public."ReleaseHistory" USING btree ("ReleaseId");


--
-- TOC entry 3781 (class 1259 OID 692474)
-- Name: IX_ReleaseKey_DC9F17BC; Type: INDEX; Schema: public; Owner: system
--

CREATE INDEX "IX_ReleaseKey_DC9F17BC" ON public."InstanceConfig" USING btree ("ReleaseKey");


--
-- TOC entry 3766 (class 1259 OID 692489)
-- Name: IX_SpanId_781FF521; Type: INDEX; Schema: public; Owner: system
--

CREATE INDEX "IX_SpanId_781FF521" ON public."AuditLogDataInfluence" USING btree ("SpanId");


--
-- TOC entry 3719 (class 1259 OID 692494)
-- Name: IX_TraceId_E33D4416; Type: INDEX; Schema: public; Owner: system
--

CREATE INDEX "IX_TraceId_E33D4416" ON public."AuditLog" USING btree ("TraceId");


--
-- TOC entry 3784 (class 1259 OID 692476)
-- Name: IX_Valid_Namespace_CE304898; Type: INDEX; Schema: public; Owner: system
--

CREATE INDEX "IX_Valid_Namespace_CE304898" ON public."InstanceConfig" USING btree ("ConfigAppId", "ConfigClusterName", "ConfigNamespaceName", "DataChange_LastTime");


--
-- TOC entry 3705 (class 1259 OID 692440)
-- Name: Name_AppId_B47ED639; Type: INDEX; Schema: public; Owner: system
--

CREATE INDEX "Name_AppId_B47ED639" ON public."AppNamespace" USING btree ("Name", "AppId");


--
-- TOC entry 3725 (class 1259 OID 692457)
-- Name: NamespaceName_6E25E6E4; Type: INDEX; Schema: public; Owner: system
--

CREATE INDEX "NamespaceName_6E25E6E4" ON public."Commit" USING btree ("NamespaceName");


--
-- TOC entry 3993 (class 0 OID 0)
-- Dependencies: 400
-- Name: FUNCTION qps(); Type: ACL; Schema: pg_catalog; Owner: system
--

REVOKE ALL ON FUNCTION pg_catalog.qps() FROM PUBLIC;
GRANT ALL ON FUNCTION pg_catalog.qps() TO pg_monitor;


--
-- TOC entry 3994 (class 0 OID 0)
-- Dependencies: 399
-- Name: FUNCTION tps(); Type: ACL; Schema: pg_catalog; Owner: system
--

REVOKE ALL ON FUNCTION pg_catalog.tps() FROM PUBLIC;
GRANT ALL ON FUNCTION pg_catalog.tps() TO pg_monitor;


--
-- TOC entry 3995 (class 0 OID 0)
-- Dependencies: 270
-- Name: TABLE pg_triggers; Type: ACL; Schema: pg_catalog; Owner: system
--

GRANT SELECT ON TABLE pg_catalog.pg_triggers TO PUBLIC;


-- Completed on 2024-02-07 14:39:42

--
-- Kingbase database dump complete
--

