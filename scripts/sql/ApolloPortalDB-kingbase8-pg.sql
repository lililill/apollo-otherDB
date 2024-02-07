--
-- Kingbase database dump
--

-- Dumped from database version 12.1
-- Dumped by sys_dump version 12.1

-- Started on 2024-02-07 14:40:28

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
-- TOC entry 292 (class 1259 OID 693845)
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
-- TOC entry 306 (class 1259 OID 693960)
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
-- TOC entry 305 (class 1259 OID 693958)
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
-- TOC entry 3933 (class 0 OID 0)
-- Dependencies: 305
-- Name: AppNamespace_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: system
--

ALTER SEQUENCE public."AppNamespace_Id_seq" OWNED BY public."AppNamespace"."Id";


--
-- TOC entry 291 (class 1259 OID 693843)
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
-- TOC entry 3934 (class 0 OID 0)
-- Dependencies: 291
-- Name: App_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: system
--

ALTER SEQUENCE public."App_Id_seq" OWNED BY public."App"."Id";


--
-- TOC entry 278 (class 1259 OID 693736)
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
-- TOC entry 298 (class 1259 OID 693904)
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
-- TOC entry 297 (class 1259 OID 693902)
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
-- TOC entry 3935 (class 0 OID 0)
-- Dependencies: 297
-- Name: AuditLogDataInfluence_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: system
--

ALTER SEQUENCE public."AuditLogDataInfluence_Id_seq" OWNED BY public."AuditLogDataInfluence"."Id";


--
-- TOC entry 277 (class 1259 OID 693734)
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
-- TOC entry 3936 (class 0 OID 0)
-- Dependencies: 277
-- Name: AuditLog_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: system
--

ALTER SEQUENCE public."AuditLog_Id_seq" OWNED BY public."AuditLog"."Id";


--
-- TOC entry 276 (class 1259 OID 693729)
-- Name: Authorities; Type: TABLE; Schema: public; Owner: system
--

CREATE TABLE public."Authorities" (
    "Id" bigint NOT NULL,
    "Username" character varying(64) NOT NULL,
    "Authority" character varying(50) NOT NULL
);


ALTER TABLE public."Authorities" OWNER TO system;

--
-- TOC entry 275 (class 1259 OID 693727)
-- Name: Authorities_Id_seq; Type: SEQUENCE; Schema: public; Owner: system
--

CREATE SEQUENCE public."Authorities_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Authorities_Id_seq" OWNER TO system;

--
-- TOC entry 3937 (class 0 OID 0)
-- Dependencies: 275
-- Name: Authorities_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: system
--

ALTER SEQUENCE public."Authorities_Id_seq" OWNED BY public."Authorities"."Id";


--
-- TOC entry 284 (class 1259 OID 693786)
-- Name: Consumer; Type: TABLE; Schema: public; Owner: system
--

CREATE TABLE public."Consumer" (
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


ALTER TABLE public."Consumer" OWNER TO system;

--
-- TOC entry 280 (class 1259 OID 693756)
-- Name: ConsumerAudit; Type: TABLE; Schema: public; Owner: system
--

CREATE TABLE public."ConsumerAudit" (
    "Id" bigint NOT NULL,
    "ConsumerId" bigint,
    "Uri" character varying(1024) DEFAULT ''::character varying NOT NULL,
    "Method" character varying(16) DEFAULT ''::character varying NOT NULL,
    "DataChange_CreatedTime" timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "DataChange_LastTime" timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public."ConsumerAudit" OWNER TO system;

--
-- TOC entry 279 (class 1259 OID 693754)
-- Name: ConsumerAudit_Id_seq; Type: SEQUENCE; Schema: public; Owner: system
--

CREATE SEQUENCE public."ConsumerAudit_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."ConsumerAudit_Id_seq" OWNER TO system;

--
-- TOC entry 3938 (class 0 OID 0)
-- Dependencies: 279
-- Name: ConsumerAudit_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: system
--

ALTER SEQUENCE public."ConsumerAudit_Id_seq" OWNED BY public."ConsumerAudit"."Id";


--
-- TOC entry 288 (class 1259 OID 693826)
-- Name: ConsumerRole; Type: TABLE; Schema: public; Owner: system
--

CREATE TABLE public."ConsumerRole" (
    "Id" bigint NOT NULL,
    "ConsumerId" bigint,
    "RoleId" bigint,
    "IsDeleted" boolean DEFAULT false NOT NULL,
    "DeletedAt" bigint DEFAULT 0 NOT NULL,
    "DataChange_CreatedBy" character varying(64) DEFAULT 'default'::character varying NOT NULL,
    "DataChange_CreatedTime" timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "DataChange_LastModifiedBy" character varying(64) DEFAULT ''::character varying,
    "DataChange_LastTime" timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public."ConsumerRole" OWNER TO system;

--
-- TOC entry 287 (class 1259 OID 693824)
-- Name: ConsumerRole_Id_seq; Type: SEQUENCE; Schema: public; Owner: system
--

CREATE SEQUENCE public."ConsumerRole_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."ConsumerRole_Id_seq" OWNER TO system;

--
-- TOC entry 3939 (class 0 OID 0)
-- Dependencies: 287
-- Name: ConsumerRole_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: system
--

ALTER SEQUENCE public."ConsumerRole_Id_seq" OWNED BY public."ConsumerRole"."Id";


--
-- TOC entry 296 (class 1259 OID 693889)
-- Name: ConsumerToken; Type: TABLE; Schema: public; Owner: system
--

CREATE TABLE public."ConsumerToken" (
    "Id" bigint NOT NULL,
    "ConsumerId" bigint,
    "Token" character varying(128) DEFAULT ''::character varying NOT NULL,
    "Expires" timestamp(0) without time zone DEFAULT '2099-01-01 00:00:00'::timestamp without time zone NOT NULL,
    "IsDeleted" boolean DEFAULT false NOT NULL,
    "DeletedAt" bigint DEFAULT 0 NOT NULL,
    "DataChange_CreatedBy" character varying(64) DEFAULT 'default'::character varying NOT NULL,
    "DataChange_CreatedTime" timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "DataChange_LastModifiedBy" character varying(64) DEFAULT ''::character varying,
    "DataChange_LastTime" timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public."ConsumerToken" OWNER TO system;

--
-- TOC entry 295 (class 1259 OID 693884)
-- Name: ConsumerToken_Id_seq; Type: SEQUENCE; Schema: public; Owner: system
--

CREATE SEQUENCE public."ConsumerToken_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."ConsumerToken_Id_seq" OWNER TO system;

--
-- TOC entry 3940 (class 0 OID 0)
-- Dependencies: 295
-- Name: ConsumerToken_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: system
--

ALTER SEQUENCE public."ConsumerToken_Id_seq" OWNED BY public."ConsumerToken"."Id";


--
-- TOC entry 283 (class 1259 OID 693784)
-- Name: Consumer_Id_seq; Type: SEQUENCE; Schema: public; Owner: system
--

CREATE SEQUENCE public."Consumer_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Consumer_Id_seq" OWNER TO system;

--
-- TOC entry 3941 (class 0 OID 0)
-- Dependencies: 283
-- Name: Consumer_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: system
--

ALTER SEQUENCE public."Consumer_Id_seq" OWNED BY public."Consumer"."Id";


--
-- TOC entry 282 (class 1259 OID 693770)
-- Name: Favorite; Type: TABLE; Schema: public; Owner: system
--

CREATE TABLE public."Favorite" (
    "Id" bigint NOT NULL,
    "UserId" character varying(32) DEFAULT 'default'::character varying NOT NULL,
    "AppId" character varying(64) DEFAULT 'default'::character varying NOT NULL,
    "Position" integer DEFAULT 10000 NOT NULL,
    "IsDeleted" boolean DEFAULT false NOT NULL,
    "DeletedAt" bigint DEFAULT 0 NOT NULL,
    "DataChange_CreatedBy" character varying(64) DEFAULT 'default'::character varying NOT NULL,
    "DataChange_CreatedTime" timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "DataChange_LastModifiedBy" character varying(64) DEFAULT ''::character varying,
    "DataChange_LastTime" timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public."Favorite" OWNER TO system;

--
-- TOC entry 281 (class 1259 OID 693768)
-- Name: Favorite_Id_seq; Type: SEQUENCE; Schema: public; Owner: system
--

CREATE SEQUENCE public."Favorite_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Favorite_Id_seq" OWNER TO system;

--
-- TOC entry 3942 (class 0 OID 0)
-- Dependencies: 281
-- Name: Favorite_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: system
--

ALTER SEQUENCE public."Favorite_Id_seq" OWNED BY public."Favorite"."Id";


--
-- TOC entry 302 (class 1259 OID 693931)
-- Name: Permission; Type: TABLE; Schema: public; Owner: system
--

CREATE TABLE public."Permission" (
    "Id" bigint NOT NULL,
    "PermissionType" character varying(32) DEFAULT ''::character varying NOT NULL,
    "TargetId" character varying(256) DEFAULT ''::character varying NOT NULL,
    "IsDeleted" boolean DEFAULT false NOT NULL,
    "DeletedAt" bigint DEFAULT 0 NOT NULL,
    "DataChange_CreatedBy" character varying(64) DEFAULT 'default'::character varying NOT NULL,
    "DataChange_CreatedTime" timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "DataChange_LastModifiedBy" character varying(64) DEFAULT ''::character varying,
    "DataChange_LastTime" timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public."Permission" OWNER TO system;

--
-- TOC entry 301 (class 1259 OID 693929)
-- Name: Permission_Id_seq; Type: SEQUENCE; Schema: public; Owner: system
--

CREATE SEQUENCE public."Permission_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Permission_Id_seq" OWNER TO system;

--
-- TOC entry 3943 (class 0 OID 0)
-- Dependencies: 301
-- Name: Permission_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: system
--

ALTER SEQUENCE public."Permission_Id_seq" OWNED BY public."Permission"."Id";


--
-- TOC entry 304 (class 1259 OID 693946)
-- Name: Role; Type: TABLE; Schema: public; Owner: system
--

CREATE TABLE public."Role" (
    "Id" bigint NOT NULL,
    "RoleName" character varying(256) DEFAULT ''::character varying NOT NULL,
    "IsDeleted" boolean DEFAULT false NOT NULL,
    "DeletedAt" bigint DEFAULT 0 NOT NULL,
    "DataChange_CreatedBy" character varying(64) DEFAULT 'default'::character varying NOT NULL,
    "DataChange_CreatedTime" timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "DataChange_LastModifiedBy" character varying(64) DEFAULT ''::character varying,
    "DataChange_LastTime" timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public."Role" OWNER TO system;

--
-- TOC entry 290 (class 1259 OID 693840)
-- Name: RolePermission; Type: TABLE; Schema: public; Owner: system
--

CREATE TABLE public."RolePermission" (
    "Id" bigint NOT NULL,
    "RoleId" bigint,
    "PermissionId" bigint,
    "IsDeleted" boolean DEFAULT false NOT NULL,
    "DeletedAt" bigint DEFAULT 0 NOT NULL,
    "DataChange_CreatedBy" character varying(64) DEFAULT 'default'::character varying NOT NULL,
    "DataChange_CreatedTime" timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "DataChange_LastModifiedBy" character varying(64) DEFAULT ''::character varying,
    "DataChange_LastTime" timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public."RolePermission" OWNER TO system;

--
-- TOC entry 289 (class 1259 OID 693838)
-- Name: RolePermission_Id_seq; Type: SEQUENCE; Schema: public; Owner: system
--

CREATE SEQUENCE public."RolePermission_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."RolePermission_Id_seq" OWNER TO system;

--
-- TOC entry 3944 (class 0 OID 0)
-- Dependencies: 289
-- Name: RolePermission_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: system
--

ALTER SEQUENCE public."RolePermission_Id_seq" OWNED BY public."RolePermission"."Id";


--
-- TOC entry 303 (class 1259 OID 693940)
-- Name: Role_Id_seq; Type: SEQUENCE; Schema: public; Owner: system
--

CREATE SEQUENCE public."Role_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Role_Id_seq" OWNER TO system;

--
-- TOC entry 3945 (class 0 OID 0)
-- Dependencies: 303
-- Name: Role_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: system
--

ALTER SEQUENCE public."Role_Id_seq" OWNED BY public."Role"."Id";


--
-- TOC entry 300 (class 1259 OID 693926)
-- Name: SPRING_SESSION; Type: TABLE; Schema: public; Owner: system
--

CREATE TABLE public."SPRING_SESSION" (
    "PRIMARY_ID" character(36) NOT NULL,
    "SESSION_ID" character(36) NOT NULL,
    "CREATION_TIME" bigint NOT NULL,
    "LAST_ACCESS_TIME" bigint NOT NULL,
    "MAX_INACTIVE_INTERVAL" integer NOT NULL,
    "EXPIRY_TIME" bigint NOT NULL,
    "PRINCIPAL_NAME" character varying(100)
);


ALTER TABLE public."SPRING_SESSION" OWNER TO system;

--
-- TOC entry 299 (class 1259 OID 693920)
-- Name: SPRING_SESSION_ATTRIBUTES; Type: TABLE; Schema: public; Owner: system
--

CREATE TABLE public."SPRING_SESSION_ATTRIBUTES" (
    "SESSION_PRIMARY_ID" character(36) NOT NULL,
    "ATTRIBUTE_NAME" character varying(200) NOT NULL,
    "ATTRIBUTE_BYTES" bytea NOT NULL
);


ALTER TABLE public."SPRING_SESSION_ATTRIBUTES" OWNER TO system;

--
-- TOC entry 286 (class 1259 OID 693808)
-- Name: ServerConfig; Type: TABLE; Schema: public; Owner: system
--

CREATE TABLE public."ServerConfig" (
    "Id" bigint NOT NULL,
    "Key" character varying(64) DEFAULT 'default'::character varying NOT NULL,
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
-- TOC entry 285 (class 1259 OID 693805)
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
-- TOC entry 3946 (class 0 OID 0)
-- Dependencies: 285
-- Name: ServerConfig_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: system
--

ALTER SEQUENCE public."ServerConfig_Id_seq" OWNED BY public."ServerConfig"."Id";


--
-- TOC entry 294 (class 1259 OID 693875)
-- Name: UserRole; Type: TABLE; Schema: public; Owner: system
--

CREATE TABLE public."UserRole" (
    "Id" bigint NOT NULL,
    "UserId" character varying(128) DEFAULT ''::character varying,
    "RoleId" bigint,
    "IsDeleted" boolean DEFAULT false NOT NULL,
    "DeletedAt" bigint DEFAULT 0 NOT NULL,
    "DataChange_CreatedBy" character varying(64) DEFAULT 'default'::character varying NOT NULL,
    "DataChange_CreatedTime" timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "DataChange_LastModifiedBy" character varying(64) DEFAULT ''::character varying,
    "DataChange_LastTime" timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public."UserRole" OWNER TO system;

--
-- TOC entry 293 (class 1259 OID 693873)
-- Name: UserRole_Id_seq; Type: SEQUENCE; Schema: public; Owner: system
--

CREATE SEQUENCE public."UserRole_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."UserRole_Id_seq" OWNER TO system;

--
-- TOC entry 3947 (class 0 OID 0)
-- Dependencies: 293
-- Name: UserRole_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: system
--

ALTER SEQUENCE public."UserRole_Id_seq" OWNED BY public."UserRole"."Id";


--
-- TOC entry 274 (class 1259 OID 693715)
-- Name: Users; Type: TABLE; Schema: public; Owner: system
--

CREATE TABLE public."Users" (
    "Id" bigint NOT NULL,
    "Username" character varying(64) DEFAULT 'default'::character varying NOT NULL,
    "Password" character varying(512) DEFAULT 'default'::character varying NOT NULL,
    "UserDisplayName" character varying(512) DEFAULT 'default'::character varying NOT NULL,
    "Email" character varying(64) DEFAULT 'default'::character varying NOT NULL,
    "Enabled" smallint
);


ALTER TABLE public."Users" OWNER TO system;

--
-- TOC entry 273 (class 1259 OID 693713)
-- Name: Users_Id_seq; Type: SEQUENCE; Schema: public; Owner: system
--

CREATE SEQUENCE public."Users_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Users_Id_seq" OWNER TO system;

--
-- TOC entry 3948 (class 0 OID 0)
-- Dependencies: 273
-- Name: Users_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: system
--

ALTER SEQUENCE public."Users_Id_seq" OWNED BY public."Users"."Id";


--
-- TOC entry 307 (class 1259 OID 694467)
-- Name: spring_session; Type: TABLE; Schema: public; Owner: system
--

CREATE TABLE public.spring_session (
    primary_id character(36) NOT NULL,
    session_id character(36) NOT NULL,
    creation_time bigint NOT NULL,
    last_access_time bigint NOT NULL,
    max_inactive_interval integer NOT NULL,
    expiry_time bigint NOT NULL,
    principal_name character varying(100)
);


ALTER TABLE public.spring_session OWNER TO system;

--
-- TOC entry 308 (class 1259 OID 694482)
-- Name: spring_session_attributes; Type: TABLE; Schema: public; Owner: system
--

CREATE TABLE public.spring_session_attributes (
    session_primary_id character(36) NOT NULL,
    attribute_name character varying(200) NOT NULL,
    attribute_bytes bytea NOT NULL
);


ALTER TABLE public.spring_session_attributes OWNER TO system;

--
-- TOC entry 3573 (class 2604 OID 693850)
-- Name: App Id; Type: DEFAULT; Schema: public; Owner: system
--

ALTER TABLE ONLY public."App" ALTER COLUMN "Id" SET DEFAULT nextval('public."App_Id_seq"'::regclass);


--
-- TOC entry 3630 (class 2604 OID 693963)
-- Name: AppNamespace Id; Type: DEFAULT; Schema: public; Owner: system
--

ALTER TABLE ONLY public."AppNamespace" ALTER COLUMN "Id" SET DEFAULT nextval('public."AppNamespace_Id_seq"'::regclass);


--
-- TOC entry 3510 (class 2604 OID 693739)
-- Name: AuditLog Id; Type: DEFAULT; Schema: public; Owner: system
--

ALTER TABLE ONLY public."AuditLog" ALTER COLUMN "Id" SET DEFAULT nextval('public."AuditLog_Id_seq"'::regclass);


--
-- TOC entry 3603 (class 2604 OID 693907)
-- Name: AuditLogDataInfluence Id; Type: DEFAULT; Schema: public; Owner: system
--

ALTER TABLE ONLY public."AuditLogDataInfluence" ALTER COLUMN "Id" SET DEFAULT nextval('public."AuditLogDataInfluence_Id_seq"'::regclass);


--
-- TOC entry 3508 (class 2604 OID 693732)
-- Name: Authorities Id; Type: DEFAULT; Schema: public; Owner: system
--

ALTER TABLE ONLY public."Authorities" ALTER COLUMN "Id" SET DEFAULT nextval('public."Authorities_Id_seq"'::regclass);


--
-- TOC entry 3536 (class 2604 OID 693789)
-- Name: Consumer Id; Type: DEFAULT; Schema: public; Owner: system
--

ALTER TABLE ONLY public."Consumer" ALTER COLUMN "Id" SET DEFAULT nextval('public."Consumer_Id_seq"'::regclass);


--
-- TOC entry 3520 (class 2604 OID 693759)
-- Name: ConsumerAudit Id; Type: DEFAULT; Schema: public; Owner: system
--

ALTER TABLE ONLY public."ConsumerAudit" ALTER COLUMN "Id" SET DEFAULT nextval('public."ConsumerAudit_Id_seq"'::regclass);


--
-- TOC entry 3559 (class 2604 OID 693829)
-- Name: ConsumerRole Id; Type: DEFAULT; Schema: public; Owner: system
--

ALTER TABLE ONLY public."ConsumerRole" ALTER COLUMN "Id" SET DEFAULT nextval('public."ConsumerRole_Id_seq"'::regclass);


--
-- TOC entry 3594 (class 2604 OID 693892)
-- Name: ConsumerToken Id; Type: DEFAULT; Schema: public; Owner: system
--

ALTER TABLE ONLY public."ConsumerToken" ALTER COLUMN "Id" SET DEFAULT nextval('public."ConsumerToken_Id_seq"'::regclass);


--
-- TOC entry 3526 (class 2604 OID 693773)
-- Name: Favorite Id; Type: DEFAULT; Schema: public; Owner: system
--

ALTER TABLE ONLY public."Favorite" ALTER COLUMN "Id" SET DEFAULT nextval('public."Favorite_Id_seq"'::regclass);


--
-- TOC entry 3612 (class 2604 OID 693934)
-- Name: Permission Id; Type: DEFAULT; Schema: public; Owner: system
--

ALTER TABLE ONLY public."Permission" ALTER COLUMN "Id" SET DEFAULT nextval('public."Permission_Id_seq"'::regclass);


--
-- TOC entry 3621 (class 2604 OID 693949)
-- Name: Role Id; Type: DEFAULT; Schema: public; Owner: system
--

ALTER TABLE ONLY public."Role" ALTER COLUMN "Id" SET DEFAULT nextval('public."Role_Id_seq"'::regclass);


--
-- TOC entry 3566 (class 2604 OID 693848)
-- Name: RolePermission Id; Type: DEFAULT; Schema: public; Owner: system
--

ALTER TABLE ONLY public."RolePermission" ALTER COLUMN "Id" SET DEFAULT nextval('public."RolePermission_Id_seq"'::regclass);


--
-- TOC entry 3549 (class 2604 OID 693811)
-- Name: ServerConfig Id; Type: DEFAULT; Schema: public; Owner: system
--

ALTER TABLE ONLY public."ServerConfig" ALTER COLUMN "Id" SET DEFAULT nextval('public."ServerConfig_Id_seq"'::regclass);


--
-- TOC entry 3586 (class 2604 OID 693878)
-- Name: UserRole Id; Type: DEFAULT; Schema: public; Owner: system
--

ALTER TABLE ONLY public."UserRole" ALTER COLUMN "Id" SET DEFAULT nextval('public."UserRole_Id_seq"'::regclass);


--
-- TOC entry 3503 (class 2604 OID 693718)
-- Name: Users Id; Type: DEFAULT; Schema: public; Owner: system
--

ALTER TABLE ONLY public."Users" ALTER COLUMN "Id" SET DEFAULT nextval('public."Users_Id_seq"'::regclass);


--
-- TOC entry 3908 (class 0 OID 693845)
-- Dependencies: 292
-- Data for Name: App; Type: TABLE DATA; Schema: public; Owner: system
--

COPY public."App" ("Id", "AppId", "Name", "OrgId", "OrgName", "OwnerName", "OwnerEmail", "IsDeleted", "DeletedAt", "DataChange_CreatedBy", "DataChange_CreatedTime", "DataChange_LastModifiedBy", "DataChange_LastTime") FROM stdin;
1	test	test	TEST1	样例部门1	apollo	apollo@acme.com	t	1707286575	apollo	2024-02-07 10:38:03	apollo	2024-02-07 10:38:03
2	test	test	TEST1	样例部门1	apollo	apollo@acme.com	t	1707286715	apollo	2024-02-07 14:16:25	apollo	2024-02-07 14:16:25
3	aaa	aaa	TEST1	样例部门1	apollo	apollo@acme.com	t	1707286947	apollo	2024-02-07 14:18:52	apollo	2024-02-07 14:18:52
4	aaa	aaa	TEST1	样例部门1	apollo	apollo@acme.com	t	1707287786	apollo	2024-02-07 14:22:40	apollo	2024-02-07 14:22:40
5	bbb	bbb	TEST1	样例部门1	apollo	apollo@acme.com	f	0	apollo	2024-02-07 14:36:40	apollo	2024-02-07 14:36:40
\.


--
-- TOC entry 3922 (class 0 OID 693960)
-- Dependencies: 306
-- Data for Name: AppNamespace; Type: TABLE DATA; Schema: public; Owner: system
--

COPY public."AppNamespace" ("Id", "Name", "AppId", "Format", "IsPublic", "Comment", "IsDeleted", "DeletedAt", "DataChange_CreatedBy", "DataChange_CreatedTime", "DataChange_LastModifiedBy", "DataChange_LastTime") FROM stdin;
1	application	test	properties	f	default app namespace	t	1707286575	apollo	2024-02-07 10:38:03	apollo	2024-02-07 10:38:03
2	application	test	properties	f	default app namespace	t	1707286715	apollo	2024-02-07 14:16:25	apollo	2024-02-07 14:16:25
3	application	aaa	properties	f	default app namespace	t	1707286947	apollo	2024-02-07 14:18:52	apollo	2024-02-07 14:18:52
4	application	aaa	properties	f	default app namespace	t	1707287786	apollo	2024-02-07 14:22:40	apollo	2024-02-07 14:22:40
5	application	bbb	properties	f	default app namespace	f	0	apollo	2024-02-07 14:36:40	apollo	2024-02-07 14:36:40
\.


--
-- TOC entry 3894 (class 0 OID 693736)
-- Dependencies: 278
-- Data for Name: AuditLog; Type: TABLE DATA; Schema: public; Owner: system
--

COPY public."AuditLog" ("Id", "TraceId", "SpanId", "ParentSpanId", "FollowsFromSpanId", "Operator", "OpType", "OpName", "Description", "IsDeleted", "DeletedAt", "DataChange_CreatedBy", "DataChange_CreatedTime", "DataChange_LastModifiedBy", "DataChange_LastTime") FROM stdin;
1	2bee2c12f9bc4e6495c1906f073f9210	e787c906db1741d3ab0582bc87896d8a	\N	\N	apollo	CREATE	App.create	no description	f	0	\N	2024-02-07 10:38:03	\N	2024-02-07 10:38:03
2	2bee2c12f9bc4e6495c1906f073f9210	2c7b02cd05144ee798cadc899a6d15e9	e787c906db1741d3ab0582bc87896d8a	\N	apollo	CREATE	App.create	no description	f	0	\N	2024-02-07 10:38:03	\N	2024-02-07 10:38:03
3	2bee2c12f9bc4e6495c1906f073f9210	647f039f71f340c5841953610fde5076	2c7b02cd05144ee798cadc899a6d15e9	\N	apollo	CREATE	AppNamespace.create	createDefaultAppNamespace	f	0	\N	2024-02-07 10:38:03	\N	2024-02-07 10:38:03
4	2bee2c12f9bc4e6495c1906f073f9210	e1d2c3df8bfc4bfe882c33cc137b4b22	2c7b02cd05144ee798cadc899a6d15e9	647f039f71f340c5841953610fde5076	apollo	CREATE	Auth.assignRoleToUsers	no description	f	0	\N	2024-02-07 10:38:03	\N	2024-02-07 10:38:03
5	2bee2c12f9bc4e6495c1906f073f9210	8dcdcd8dd48c47c79f4afaa65894d991	2c7b02cd05144ee798cadc899a6d15e9	e1d2c3df8bfc4bfe882c33cc137b4b22	apollo	CREATE	Auth.assignRoleToUsers	no description	f	0	\N	2024-02-07 10:38:03	\N	2024-02-07 10:38:03
6	2bee2c12f9bc4e6495c1906f073f9210	d09a9d37cfc3433282fc4beb3af37a6e	2c7b02cd05144ee798cadc899a6d15e9	8dcdcd8dd48c47c79f4afaa65894d991	apollo	CREATE	Auth.assignRoleToUsers	no description	f	0	\N	2024-02-07 10:38:03	\N	2024-02-07 10:38:03
7	2bee2c12f9bc4e6495c1906f073f9210	27c8b14b058f4ffdad42356bafd7f32c	2c7b02cd05144ee798cadc899a6d15e9	d09a9d37cfc3433282fc4beb3af37a6e	apollo	RPC	App.createInRemote	no description	f	0	\N	2024-02-07 10:38:03	\N	2024-02-07 10:38:03
8	8a15e11970674fb7afed892d6799e589	258584aa673c4dcd865e6458ea823caa	\N	\N	apollo	RPC	App.delete	no description	f	0	\N	2024-02-07 11:03:57	\N	2024-02-07 11:03:57
10	003c7abcfebc4dd0be34c7dd3b03016e	1fa0d582e22847f4bdfe27f9a1e225b2	\N	\N	apollo	RPC	App.delete	no description	f	0	\N	2024-02-07 11:18:24	\N	2024-02-07 11:18:24
12	ff57ca75c7fd481b80ef3bcc36787628	b5ad9ae52cc14c4a9f1a80824be3e052	\N	\N	apollo	RPC	App.delete	no description	f	0	\N	2024-02-07 11:19:22	\N	2024-02-07 11:19:22
14	1f63cc0ad96d4446afc07fc0486b4314	938dbd73d0924c31bfade2c87aedc015	\N	\N	apollo	RPC	App.delete	no description	f	0	\N	2024-02-07 11:19:31	\N	2024-02-07 11:19:31
16	9d9170bdcd4e41e8bb613883d3762798	b52c652f21cf4da588516e3a0252fcc0	\N	\N	apollo	RPC	App.delete	no description	f	0	\N	2024-02-07 11:39:14	\N	2024-02-07 11:39:14
18	ee01af3fa6c24121a674d7caad768b7d	563735ef485d46ed8ccc52777c757d40	\N	\N	apollo	RPC	App.delete	no description	f	0	\N	2024-02-07 13:08:08	\N	2024-02-07 13:08:08
20	fc4af7cee3af4eb68e4aa308010eb031	6118fc75214846489a3964e2707f7f0d	\N	\N	apollo	RPC	App.delete	no description	f	0	\N	2024-02-07 13:08:19	\N	2024-02-07 13:08:19
22	5065129be39c48b1903da2d3c41d63f3	442bf91acc974037be1b8eadc9b25ec7	\N	\N	apollo	RPC	App.delete	no description	f	0	\N	2024-02-07 13:26:47	\N	2024-02-07 13:26:47
24	b0285e5a164949c68ffcb7f1872e84f5	61cd55b1d0de4910b97e60a7ce576609	\N	\N	apollo	RPC	App.delete	no description	f	0	\N	2024-02-07 13:29:51	\N	2024-02-07 13:29:51
26	baa9cd22b58048cda7a8887c4e8a718f	2a7fb1af65144449b1a79fe6f6b14c69	\N	\N	apollo	RPC	App.delete	no description	f	0	\N	2024-02-07 13:32:12	\N	2024-02-07 13:32:12
29	ff07e2496c7d4c78aad106b169df1d09	ca3274fed4cf493eabb948cee19bb8fb	\N	\N	apollo	RPC	App.delete	no description	f	0	\N	2024-02-07 14:00:11	\N	2024-02-07 14:00:11
32	64b7017d2c97473db2c49c7e8e378fb9	fd69db70411e410e96c3ff46391f7ab9	\N	\N	apollo	RPC	App.delete	no description	f	0	\N	2024-02-07 14:03:29	\N	2024-02-07 14:03:29
35	87cb808654334d2496d4ab1c990b6dc1	d5ce453df1864ebd9c7ea57a589a33e9	\N	\N	apollo	RPC	App.delete	no description	f	0	\N	2024-02-07 14:09:15	\N	2024-02-07 14:09:15
38	4e5b63cfbc2c43d7a425c4825d099912	ab5b776c70714f83a41b4846434141e3	\N	\N	apollo	RPC	App.delete	no description	f	0	\N	2024-02-07 14:10:43	\N	2024-02-07 14:10:43
41	f5dbdd2fe71749b7b37dfb5c78f6658d	c0865a1dfeeb4f7a8ca2de91db70563d	\N	\N	apollo	RPC	App.delete	no description	f	0	\N	2024-02-07 14:16:15	\N	2024-02-07 14:16:15
42	f5dbdd2fe71749b7b37dfb5c78f6658d	e2c305d6bf9c4e73866f7b040ae02b8b	c0865a1dfeeb4f7a8ca2de91db70563d	\N	apollo	DELETE	App.delete	no description	f	0	\N	2024-02-07 14:16:15	\N	2024-02-07 14:16:15
43	f5dbdd2fe71749b7b37dfb5c78f6658d	76b5c8fbf4364445b60521c65976617a	e2c305d6bf9c4e73866f7b040ae02b8b	\N	apollo	DELETE	AppNamespace.batchDeleteByAppId	batchDeleteByAppId	f	0	\N	2024-02-07 14:16:15	\N	2024-02-07 14:16:15
44	4251211bb1e142ccb565bbc726d2a576	66c24f01e07040c9a07d913bc61777da	\N	\N	apollo	CREATE	App.create	no description	f	0	\N	2024-02-07 14:16:25	\N	2024-02-07 14:16:25
45	4251211bb1e142ccb565bbc726d2a576	d4a69268b97f4ec3a8367c1745bcce25	66c24f01e07040c9a07d913bc61777da	\N	apollo	CREATE	App.create	no description	f	0	\N	2024-02-07 14:16:25	\N	2024-02-07 14:16:25
46	4251211bb1e142ccb565bbc726d2a576	b2ba16dcb4b54b47ab67264cd72454b2	d4a69268b97f4ec3a8367c1745bcce25	\N	apollo	CREATE	AppNamespace.create	createDefaultAppNamespace	f	0	\N	2024-02-07 14:16:25	\N	2024-02-07 14:16:25
47	4251211bb1e142ccb565bbc726d2a576	1a1d13348ba0477dab2aec015e950010	d4a69268b97f4ec3a8367c1745bcce25	b2ba16dcb4b54b47ab67264cd72454b2	apollo	CREATE	Auth.assignRoleToUsers	no description	f	0	\N	2024-02-07 14:16:25	\N	2024-02-07 14:16:25
48	4251211bb1e142ccb565bbc726d2a576	2795b7304b9341268cad473092c32256	d4a69268b97f4ec3a8367c1745bcce25	1a1d13348ba0477dab2aec015e950010	apollo	CREATE	Auth.assignRoleToUsers	no description	f	0	\N	2024-02-07 14:16:25	\N	2024-02-07 14:16:25
49	4251211bb1e142ccb565bbc726d2a576	bafba8b422334637a1b8f37eb57df6e9	d4a69268b97f4ec3a8367c1745bcce25	2795b7304b9341268cad473092c32256	apollo	CREATE	Auth.assignRoleToUsers	no description	f	0	\N	2024-02-07 14:16:25	\N	2024-02-07 14:16:25
50	c576a036c896489ab660169fb7b707d6	f43c8f7deae844b4a2101550ce473704	\N	\N	apollo	RPC	App.delete	no description	f	0	\N	2024-02-07 14:18:34	\N	2024-02-07 14:18:34
51	c576a036c896489ab660169fb7b707d6	3a0b6220ae3a47eab8fcce83a49c1b39	f43c8f7deae844b4a2101550ce473704	\N	apollo	DELETE	App.delete	no description	f	0	\N	2024-02-07 14:18:34	\N	2024-02-07 14:18:34
52	c576a036c896489ab660169fb7b707d6	b3d87c1bdf484fda88d7eaee79717e41	3a0b6220ae3a47eab8fcce83a49c1b39	\N	apollo	DELETE	AppNamespace.batchDeleteByAppId	batchDeleteByAppId	f	0	\N	2024-02-07 14:18:34	\N	2024-02-07 14:18:34
53	c576a036c896489ab660169fb7b707d6	5f95cc7a23314d8986601bf83669f74a	f43c8f7deae844b4a2101550ce473704	3a0b6220ae3a47eab8fcce83a49c1b39	apollo	RPC	App.deleteInRemote	no description	f	0	\N	2024-02-07 14:18:34	\N	2024-02-07 14:18:34
54	231dd0f6ab4e4ab38aa8f0bf6ab1fec4	2254340beb0a4647b9e58dcf2a271b1c	\N	\N	apollo	CREATE	App.create	no description	f	0	\N	2024-02-07 14:18:52	\N	2024-02-07 14:18:52
55	231dd0f6ab4e4ab38aa8f0bf6ab1fec4	e11309d12f97459cb3f93bcffd046684	2254340beb0a4647b9e58dcf2a271b1c	\N	apollo	CREATE	App.create	no description	f	0	\N	2024-02-07 14:18:52	\N	2024-02-07 14:18:52
56	231dd0f6ab4e4ab38aa8f0bf6ab1fec4	7ee3b42c3ef349168afff941ddcc2439	e11309d12f97459cb3f93bcffd046684	\N	apollo	CREATE	AppNamespace.create	createDefaultAppNamespace	f	0	\N	2024-02-07 14:18:52	\N	2024-02-07 14:18:52
57	231dd0f6ab4e4ab38aa8f0bf6ab1fec4	7b761b5a3a8c40a5b53da60ebbaab3fd	e11309d12f97459cb3f93bcffd046684	7ee3b42c3ef349168afff941ddcc2439	apollo	CREATE	Auth.assignRoleToUsers	no description	f	0	\N	2024-02-07 14:18:52	\N	2024-02-07 14:18:52
58	231dd0f6ab4e4ab38aa8f0bf6ab1fec4	87b9f38172d74bc59084d2fbd744a254	e11309d12f97459cb3f93bcffd046684	7b761b5a3a8c40a5b53da60ebbaab3fd	apollo	CREATE	Auth.assignRoleToUsers	no description	f	0	\N	2024-02-07 14:18:52	\N	2024-02-07 14:18:52
59	231dd0f6ab4e4ab38aa8f0bf6ab1fec4	c6ef0c67a9ae4b7eba68a0f8e886e8f2	e11309d12f97459cb3f93bcffd046684	87b9f38172d74bc59084d2fbd744a254	apollo	CREATE	Auth.assignRoleToUsers	no description	f	0	\N	2024-02-07 14:18:52	\N	2024-02-07 14:18:52
60	231dd0f6ab4e4ab38aa8f0bf6ab1fec4	e010ffd62de84daba51e4c824499a160	e11309d12f97459cb3f93bcffd046684	c6ef0c67a9ae4b7eba68a0f8e886e8f2	apollo	RPC	App.createInRemote	no description	f	0	\N	2024-02-07 14:18:52	\N	2024-02-07 14:18:52
61	5869fcad45ca4aaeaca22213fecb450f	6770f56514d44f65a1c72a0a2afff88e	\N	\N	apollo	RPC	App.delete	no description	f	0	\N	2024-02-07 14:22:27	\N	2024-02-07 14:22:27
62	5869fcad45ca4aaeaca22213fecb450f	f9a8751c4687496293fc766d21d6cce5	6770f56514d44f65a1c72a0a2afff88e	\N	apollo	DELETE	App.delete	no description	f	0	\N	2024-02-07 14:22:27	\N	2024-02-07 14:22:27
63	5869fcad45ca4aaeaca22213fecb450f	c51a56ab65ab4f2c88c9a44556524e90	f9a8751c4687496293fc766d21d6cce5	\N	apollo	DELETE	AppNamespace.batchDeleteByAppId	batchDeleteByAppId	f	0	\N	2024-02-07 14:22:27	\N	2024-02-07 14:22:27
64	5869fcad45ca4aaeaca22213fecb450f	7693dcdc22ae4cfcaf028641d2aef32b	6770f56514d44f65a1c72a0a2afff88e	f9a8751c4687496293fc766d21d6cce5	apollo	RPC	App.deleteInRemote	no description	f	0	\N	2024-02-07 14:22:27	\N	2024-02-07 14:22:27
65	25339dd96df94288a9e21f131da76dbb	8152d3c3b6fc4166b45e8ff458f900d5	\N	\N	apollo	CREATE	App.create	no description	f	0	\N	2024-02-07 14:22:40	\N	2024-02-07 14:22:40
66	25339dd96df94288a9e21f131da76dbb	d314c4d930324af4bf1e3f718e4dea45	8152d3c3b6fc4166b45e8ff458f900d5	\N	apollo	CREATE	App.create	no description	f	0	\N	2024-02-07 14:22:40	\N	2024-02-07 14:22:40
67	25339dd96df94288a9e21f131da76dbb	a8df9b05acd4497fa0fe9271d456ad70	d314c4d930324af4bf1e3f718e4dea45	\N	apollo	CREATE	AppNamespace.create	createDefaultAppNamespace	f	0	\N	2024-02-07 14:22:40	\N	2024-02-07 14:22:40
68	25339dd96df94288a9e21f131da76dbb	73932711746d460eac540721d02ce813	d314c4d930324af4bf1e3f718e4dea45	a8df9b05acd4497fa0fe9271d456ad70	apollo	CREATE	Auth.assignRoleToUsers	no description	f	0	\N	2024-02-07 14:22:40	\N	2024-02-07 14:22:40
69	25339dd96df94288a9e21f131da76dbb	310c024184f9467c98afd1b27ed2b853	d314c4d930324af4bf1e3f718e4dea45	73932711746d460eac540721d02ce813	apollo	CREATE	Auth.assignRoleToUsers	no description	f	0	\N	2024-02-07 14:22:40	\N	2024-02-07 14:22:40
70	25339dd96df94288a9e21f131da76dbb	d58d9ab2fe3a49bab872c1bb93de4955	d314c4d930324af4bf1e3f718e4dea45	310c024184f9467c98afd1b27ed2b853	apollo	CREATE	Auth.assignRoleToUsers	no description	f	0	\N	2024-02-07 14:22:40	\N	2024-02-07 14:22:40
71	25339dd96df94288a9e21f131da76dbb	706d068b715248679e3c67496fcd2ca6	d314c4d930324af4bf1e3f718e4dea45	d58d9ab2fe3a49bab872c1bb93de4955	apollo	RPC	App.createInRemote	no description	f	0	\N	2024-02-07 14:22:40	\N	2024-02-07 14:22:40
72	b19961b68a054fa2ae0fe01ef85db150	bd33507ca8364cd5aea6930957ed423e	\N	\N	apollo	RPC	App.delete	no description	f	0	\N	2024-02-07 14:36:25	\N	2024-02-07 14:36:25
73	b19961b68a054fa2ae0fe01ef85db150	9fedad030b1c49d38551b40f365342b6	bd33507ca8364cd5aea6930957ed423e	\N	apollo	DELETE	App.delete	no description	f	0	\N	2024-02-07 14:36:25	\N	2024-02-07 14:36:25
74	b19961b68a054fa2ae0fe01ef85db150	0932f0cb707945c18cd47f11867ee6bd	9fedad030b1c49d38551b40f365342b6	\N	apollo	DELETE	AppNamespace.batchDeleteByAppId	batchDeleteByAppId	f	0	\N	2024-02-07 14:36:25	\N	2024-02-07 14:36:25
75	b19961b68a054fa2ae0fe01ef85db150	59395fd50de64be1bc981222a664cf96	bd33507ca8364cd5aea6930957ed423e	9fedad030b1c49d38551b40f365342b6	apollo	RPC	App.deleteInRemote	no description	f	0	\N	2024-02-07 14:36:25	\N	2024-02-07 14:36:25
76	27114c86cddb4c598829c732528487c7	c267d03095984ab2b5872abc1c291f21	\N	\N	apollo	CREATE	App.create	no description	f	0	\N	2024-02-07 14:36:40	\N	2024-02-07 14:36:40
77	27114c86cddb4c598829c732528487c7	dbaa95187b234b8e8b4686aebfcc0768	c267d03095984ab2b5872abc1c291f21	\N	apollo	CREATE	App.create	no description	f	0	\N	2024-02-07 14:36:40	\N	2024-02-07 14:36:40
78	27114c86cddb4c598829c732528487c7	2b1106a291b54b57be4183adf685ff3e	dbaa95187b234b8e8b4686aebfcc0768	\N	apollo	CREATE	AppNamespace.create	createDefaultAppNamespace	f	0	\N	2024-02-07 14:36:40	\N	2024-02-07 14:36:40
79	27114c86cddb4c598829c732528487c7	1d2ae246890c41dbbce00483b11e237b	dbaa95187b234b8e8b4686aebfcc0768	2b1106a291b54b57be4183adf685ff3e	apollo	CREATE	Auth.assignRoleToUsers	no description	f	0	\N	2024-02-07 14:36:40	\N	2024-02-07 14:36:40
80	27114c86cddb4c598829c732528487c7	d88ef8ecf5df42fd97ed2339d8a9b65d	dbaa95187b234b8e8b4686aebfcc0768	1d2ae246890c41dbbce00483b11e237b	apollo	CREATE	Auth.assignRoleToUsers	no description	f	0	\N	2024-02-07 14:36:40	\N	2024-02-07 14:36:40
81	27114c86cddb4c598829c732528487c7	d3347deaa0d2411987ad1926674f10ec	dbaa95187b234b8e8b4686aebfcc0768	d88ef8ecf5df42fd97ed2339d8a9b65d	apollo	CREATE	Auth.assignRoleToUsers	no description	f	0	\N	2024-02-07 14:36:40	\N	2024-02-07 14:36:40
82	27114c86cddb4c598829c732528487c7	0e786dca41ff4c2d89c22820d19bf330	dbaa95187b234b8e8b4686aebfcc0768	d3347deaa0d2411987ad1926674f10ec	apollo	RPC	App.createInRemote	no description	f	0	\N	2024-02-07 14:36:40	\N	2024-02-07 14:36:40
\.


--
-- TOC entry 3914 (class 0 OID 693904)
-- Dependencies: 298
-- Data for Name: AuditLogDataInfluence; Type: TABLE DATA; Schema: public; Owner: system
--

COPY public."AuditLogDataInfluence" ("Id", "SpanId", "InfluenceEntityId", "InfluenceEntityName", "FieldName", "FieldOldValue", "FieldNewValue", "IsDeleted", "DeletedAt", "DataChange_CreatedBy", "DataChange_CreatedTime", "DataChange_LastModifiedBy", "DataChange_LastTime") FROM stdin;
1	2c7b02cd05144ee798cadc899a6d15e9	1	App	Name	\N	test	f	0	\N	2024-02-07 10:38:03	\N	2024-02-07 10:38:03
2	2c7b02cd05144ee798cadc899a6d15e9	1	App	AppId	\N	test	f	0	\N	2024-02-07 10:38:03	\N	2024-02-07 10:38:03
3	647f039f71f340c5841953610fde5076	1	AppNamespace	Name	\N	application	f	0	\N	2024-02-07 10:38:03	\N	2024-02-07 10:38:03
4	647f039f71f340c5841953610fde5076	1	AppNamespace	AppId	\N	test	f	0	\N	2024-02-07 10:38:03	\N	2024-02-07 10:38:03
5	647f039f71f340c5841953610fde5076	1	AppNamespace	Format	\N	properties	f	0	\N	2024-02-07 10:38:03	\N	2024-02-07 10:38:03
6	647f039f71f340c5841953610fde5076	1	AppNamespace	IsPublic	\N	false	f	0	\N	2024-02-07 10:38:03	\N	2024-02-07 10:38:03
7	2c7b02cd05144ee798cadc899a6d15e9	3	Role	RoleName	\N	Master+test	f	0	\N	2024-02-07 10:38:03	\N	2024-02-07 10:38:03
8	2c7b02cd05144ee798cadc899a6d15e9	4	Role	RoleName	\N	ManageAppMaster+test	f	0	\N	2024-02-07 10:38:03	\N	2024-02-07 10:38:03
9	e1d2c3df8bfc4bfe882c33cc137b4b22	1	UserRole	UserId	\N	apollo	f	0	\N	2024-02-07 10:38:03	\N	2024-02-07 10:38:03
10	e1d2c3df8bfc4bfe882c33cc137b4b22	1	UserRole	RoleId	\N	3	f	0	\N	2024-02-07 10:38:03	\N	2024-02-07 10:38:03
11	2c7b02cd05144ee798cadc899a6d15e9	5	Role	RoleName	\N	ModifyNamespace+test+application	f	0	\N	2024-02-07 10:38:03	\N	2024-02-07 10:38:03
12	2c7b02cd05144ee798cadc899a6d15e9	6	Role	RoleName	\N	ReleaseNamespace+test+application	f	0	\N	2024-02-07 10:38:03	\N	2024-02-07 10:38:03
13	2c7b02cd05144ee798cadc899a6d15e9	7	Role	RoleName	\N	ModifyNamespace+test+application+DEV	f	0	\N	2024-02-07 10:38:03	\N	2024-02-07 10:38:03
14	2c7b02cd05144ee798cadc899a6d15e9	8	Role	RoleName	\N	ReleaseNamespace+test+application+DEV	f	0	\N	2024-02-07 10:38:03	\N	2024-02-07 10:38:03
15	8dcdcd8dd48c47c79f4afaa65894d991	2	UserRole	UserId	\N	apollo	f	0	\N	2024-02-07 10:38:03	\N	2024-02-07 10:38:03
16	8dcdcd8dd48c47c79f4afaa65894d991	2	UserRole	RoleId	\N	5	f	0	\N	2024-02-07 10:38:03	\N	2024-02-07 10:38:03
17	d09a9d37cfc3433282fc4beb3af37a6e	3	UserRole	UserId	\N	apollo	f	0	\N	2024-02-07 10:38:03	\N	2024-02-07 10:38:03
18	d09a9d37cfc3433282fc4beb3af37a6e	3	UserRole	RoleId	\N	6	f	0	\N	2024-02-07 10:38:03	\N	2024-02-07 10:38:03
29	e2c305d6bf9c4e73866f7b040ae02b8b	1	App	Name	test	\N	f	0	\N	2024-02-07 14:16:15	\N	2024-02-07 14:16:15
30	e2c305d6bf9c4e73866f7b040ae02b8b	1	App	AppId	test	\N	f	0	\N	2024-02-07 14:16:15	\N	2024-02-07 14:16:15
31	76b5c8fbf4364445b60521c65976617a	AnyMatched	AppNamespace	AppId	test	\N	f	0	\N	2024-02-07 14:16:15	\N	2024-02-07 14:16:15
32	d4a69268b97f4ec3a8367c1745bcce25	2	App	Name	\N	test	f	0	\N	2024-02-07 14:16:25	\N	2024-02-07 14:16:25
33	d4a69268b97f4ec3a8367c1745bcce25	2	App	AppId	\N	test	f	0	\N	2024-02-07 14:16:25	\N	2024-02-07 14:16:25
34	b2ba16dcb4b54b47ab67264cd72454b2	2	AppNamespace	Name	\N	application	f	0	\N	2024-02-07 14:16:25	\N	2024-02-07 14:16:25
35	b2ba16dcb4b54b47ab67264cd72454b2	2	AppNamespace	AppId	\N	test	f	0	\N	2024-02-07 14:16:25	\N	2024-02-07 14:16:25
36	b2ba16dcb4b54b47ab67264cd72454b2	2	AppNamespace	Format	\N	properties	f	0	\N	2024-02-07 14:16:25	\N	2024-02-07 14:16:25
37	b2ba16dcb4b54b47ab67264cd72454b2	2	AppNamespace	IsPublic	\N	false	f	0	\N	2024-02-07 14:16:25	\N	2024-02-07 14:16:25
38	d4a69268b97f4ec3a8367c1745bcce25	9	Role	RoleName	\N	Master+test	f	0	\N	2024-02-07 14:16:25	\N	2024-02-07 14:16:25
39	d4a69268b97f4ec3a8367c1745bcce25	10	Role	RoleName	\N	ManageAppMaster+test	f	0	\N	2024-02-07 14:16:25	\N	2024-02-07 14:16:25
40	1a1d13348ba0477dab2aec015e950010	4	UserRole	UserId	\N	apollo	f	0	\N	2024-02-07 14:16:25	\N	2024-02-07 14:16:25
41	1a1d13348ba0477dab2aec015e950010	4	UserRole	RoleId	\N	9	f	0	\N	2024-02-07 14:16:25	\N	2024-02-07 14:16:25
42	d4a69268b97f4ec3a8367c1745bcce25	11	Role	RoleName	\N	ModifyNamespace+test+application	f	0	\N	2024-02-07 14:16:25	\N	2024-02-07 14:16:25
43	d4a69268b97f4ec3a8367c1745bcce25	12	Role	RoleName	\N	ReleaseNamespace+test+application	f	0	\N	2024-02-07 14:16:25	\N	2024-02-07 14:16:25
44	d4a69268b97f4ec3a8367c1745bcce25	13	Role	RoleName	\N	ModifyNamespace+test+application+DEV	f	0	\N	2024-02-07 14:16:25	\N	2024-02-07 14:16:25
45	d4a69268b97f4ec3a8367c1745bcce25	14	Role	RoleName	\N	ReleaseNamespace+test+application+DEV	f	0	\N	2024-02-07 14:16:25	\N	2024-02-07 14:16:25
46	2795b7304b9341268cad473092c32256	5	UserRole	UserId	\N	apollo	f	0	\N	2024-02-07 14:16:25	\N	2024-02-07 14:16:25
47	2795b7304b9341268cad473092c32256	5	UserRole	RoleId	\N	11	f	0	\N	2024-02-07 14:16:25	\N	2024-02-07 14:16:25
48	bafba8b422334637a1b8f37eb57df6e9	6	UserRole	UserId	\N	apollo	f	0	\N	2024-02-07 14:16:25	\N	2024-02-07 14:16:25
49	bafba8b422334637a1b8f37eb57df6e9	6	UserRole	RoleId	\N	12	f	0	\N	2024-02-07 14:16:25	\N	2024-02-07 14:16:25
50	3a0b6220ae3a47eab8fcce83a49c1b39	2	App	Name	test	\N	f	0	\N	2024-02-07 14:18:34	\N	2024-02-07 14:18:34
51	3a0b6220ae3a47eab8fcce83a49c1b39	2	App	AppId	test	\N	f	0	\N	2024-02-07 14:18:34	\N	2024-02-07 14:18:34
52	b3d87c1bdf484fda88d7eaee79717e41	AnyMatched	AppNamespace	AppId	test	\N	f	0	\N	2024-02-07 14:18:34	\N	2024-02-07 14:18:34
53	e11309d12f97459cb3f93bcffd046684	3	App	Name	\N	aaa	f	0	\N	2024-02-07 14:18:52	\N	2024-02-07 14:18:52
54	e11309d12f97459cb3f93bcffd046684	3	App	AppId	\N	aaa	f	0	\N	2024-02-07 14:18:52	\N	2024-02-07 14:18:52
55	7ee3b42c3ef349168afff941ddcc2439	3	AppNamespace	Name	\N	application	f	0	\N	2024-02-07 14:18:52	\N	2024-02-07 14:18:52
56	7ee3b42c3ef349168afff941ddcc2439	3	AppNamespace	AppId	\N	aaa	f	0	\N	2024-02-07 14:18:52	\N	2024-02-07 14:18:52
57	7ee3b42c3ef349168afff941ddcc2439	3	AppNamespace	Format	\N	properties	f	0	\N	2024-02-07 14:18:52	\N	2024-02-07 14:18:52
58	7ee3b42c3ef349168afff941ddcc2439	3	AppNamespace	IsPublic	\N	false	f	0	\N	2024-02-07 14:18:52	\N	2024-02-07 14:18:52
59	e11309d12f97459cb3f93bcffd046684	15	Role	RoleName	\N	Master+aaa	f	0	\N	2024-02-07 14:18:52	\N	2024-02-07 14:18:52
60	e11309d12f97459cb3f93bcffd046684	16	Role	RoleName	\N	ManageAppMaster+aaa	f	0	\N	2024-02-07 14:18:52	\N	2024-02-07 14:18:52
61	7b761b5a3a8c40a5b53da60ebbaab3fd	7	UserRole	UserId	\N	apollo	f	0	\N	2024-02-07 14:18:52	\N	2024-02-07 14:18:52
62	7b761b5a3a8c40a5b53da60ebbaab3fd	7	UserRole	RoleId	\N	15	f	0	\N	2024-02-07 14:18:52	\N	2024-02-07 14:18:52
63	e11309d12f97459cb3f93bcffd046684	17	Role	RoleName	\N	ModifyNamespace+aaa+application	f	0	\N	2024-02-07 14:18:52	\N	2024-02-07 14:18:52
64	e11309d12f97459cb3f93bcffd046684	18	Role	RoleName	\N	ReleaseNamespace+aaa+application	f	0	\N	2024-02-07 14:18:52	\N	2024-02-07 14:18:52
65	e11309d12f97459cb3f93bcffd046684	19	Role	RoleName	\N	ModifyNamespace+aaa+application+DEV	f	0	\N	2024-02-07 14:18:52	\N	2024-02-07 14:18:52
66	e11309d12f97459cb3f93bcffd046684	20	Role	RoleName	\N	ReleaseNamespace+aaa+application+DEV	f	0	\N	2024-02-07 14:18:52	\N	2024-02-07 14:18:52
67	87b9f38172d74bc59084d2fbd744a254	8	UserRole	UserId	\N	apollo	f	0	\N	2024-02-07 14:18:52	\N	2024-02-07 14:18:52
68	87b9f38172d74bc59084d2fbd744a254	8	UserRole	RoleId	\N	17	f	0	\N	2024-02-07 14:18:52	\N	2024-02-07 14:18:52
69	c6ef0c67a9ae4b7eba68a0f8e886e8f2	9	UserRole	UserId	\N	apollo	f	0	\N	2024-02-07 14:18:52	\N	2024-02-07 14:18:52
70	c6ef0c67a9ae4b7eba68a0f8e886e8f2	9	UserRole	RoleId	\N	18	f	0	\N	2024-02-07 14:18:52	\N	2024-02-07 14:18:52
71	f9a8751c4687496293fc766d21d6cce5	3	App	Name	aaa	\N	f	0	\N	2024-02-07 14:22:27	\N	2024-02-07 14:22:27
72	f9a8751c4687496293fc766d21d6cce5	3	App	AppId	aaa	\N	f	0	\N	2024-02-07 14:22:27	\N	2024-02-07 14:22:27
73	c51a56ab65ab4f2c88c9a44556524e90	AnyMatched	AppNamespace	AppId	aaa	\N	f	0	\N	2024-02-07 14:22:27	\N	2024-02-07 14:22:27
74	d314c4d930324af4bf1e3f718e4dea45	4	App	Name	\N	aaa	f	0	\N	2024-02-07 14:22:40	\N	2024-02-07 14:22:40
75	d314c4d930324af4bf1e3f718e4dea45	4	App	AppId	\N	aaa	f	0	\N	2024-02-07 14:22:40	\N	2024-02-07 14:22:40
76	a8df9b05acd4497fa0fe9271d456ad70	4	AppNamespace	Name	\N	application	f	0	\N	2024-02-07 14:22:40	\N	2024-02-07 14:22:40
77	a8df9b05acd4497fa0fe9271d456ad70	4	AppNamespace	AppId	\N	aaa	f	0	\N	2024-02-07 14:22:40	\N	2024-02-07 14:22:40
78	a8df9b05acd4497fa0fe9271d456ad70	4	AppNamespace	Format	\N	properties	f	0	\N	2024-02-07 14:22:40	\N	2024-02-07 14:22:40
79	a8df9b05acd4497fa0fe9271d456ad70	4	AppNamespace	IsPublic	\N	false	f	0	\N	2024-02-07 14:22:40	\N	2024-02-07 14:22:40
80	d314c4d930324af4bf1e3f718e4dea45	21	Role	RoleName	\N	Master+aaa	f	0	\N	2024-02-07 14:22:40	\N	2024-02-07 14:22:40
81	d314c4d930324af4bf1e3f718e4dea45	22	Role	RoleName	\N	ManageAppMaster+aaa	f	0	\N	2024-02-07 14:22:40	\N	2024-02-07 14:22:40
82	73932711746d460eac540721d02ce813	10	UserRole	UserId	\N	apollo	f	0	\N	2024-02-07 14:22:40	\N	2024-02-07 14:22:40
83	73932711746d460eac540721d02ce813	10	UserRole	RoleId	\N	21	f	0	\N	2024-02-07 14:22:40	\N	2024-02-07 14:22:40
84	d314c4d930324af4bf1e3f718e4dea45	23	Role	RoleName	\N	ModifyNamespace+aaa+application	f	0	\N	2024-02-07 14:22:40	\N	2024-02-07 14:22:40
85	d314c4d930324af4bf1e3f718e4dea45	24	Role	RoleName	\N	ReleaseNamespace+aaa+application	f	0	\N	2024-02-07 14:22:40	\N	2024-02-07 14:22:40
86	d314c4d930324af4bf1e3f718e4dea45	25	Role	RoleName	\N	ModifyNamespace+aaa+application+DEV	f	0	\N	2024-02-07 14:22:40	\N	2024-02-07 14:22:40
87	d314c4d930324af4bf1e3f718e4dea45	26	Role	RoleName	\N	ReleaseNamespace+aaa+application+DEV	f	0	\N	2024-02-07 14:22:40	\N	2024-02-07 14:22:40
88	310c024184f9467c98afd1b27ed2b853	11	UserRole	UserId	\N	apollo	f	0	\N	2024-02-07 14:22:40	\N	2024-02-07 14:22:40
89	310c024184f9467c98afd1b27ed2b853	11	UserRole	RoleId	\N	23	f	0	\N	2024-02-07 14:22:40	\N	2024-02-07 14:22:40
90	d58d9ab2fe3a49bab872c1bb93de4955	12	UserRole	UserId	\N	apollo	f	0	\N	2024-02-07 14:22:40	\N	2024-02-07 14:22:40
91	d58d9ab2fe3a49bab872c1bb93de4955	12	UserRole	RoleId	\N	24	f	0	\N	2024-02-07 14:22:40	\N	2024-02-07 14:22:40
92	9fedad030b1c49d38551b40f365342b6	4	App	Name	aaa	\N	f	0	\N	2024-02-07 14:36:25	\N	2024-02-07 14:36:25
93	9fedad030b1c49d38551b40f365342b6	4	App	AppId	aaa	\N	f	0	\N	2024-02-07 14:36:25	\N	2024-02-07 14:36:25
94	0932f0cb707945c18cd47f11867ee6bd	AnyMatched	AppNamespace	AppId	aaa	\N	f	0	\N	2024-02-07 14:36:25	\N	2024-02-07 14:36:25
95	dbaa95187b234b8e8b4686aebfcc0768	5	App	Name	\N	bbb	f	0	\N	2024-02-07 14:36:40	\N	2024-02-07 14:36:40
96	dbaa95187b234b8e8b4686aebfcc0768	5	App	AppId	\N	bbb	f	0	\N	2024-02-07 14:36:40	\N	2024-02-07 14:36:40
97	2b1106a291b54b57be4183adf685ff3e	5	AppNamespace	Name	\N	application	f	0	\N	2024-02-07 14:36:40	\N	2024-02-07 14:36:40
98	2b1106a291b54b57be4183adf685ff3e	5	AppNamespace	AppId	\N	bbb	f	0	\N	2024-02-07 14:36:40	\N	2024-02-07 14:36:40
99	2b1106a291b54b57be4183adf685ff3e	5	AppNamespace	Format	\N	properties	f	0	\N	2024-02-07 14:36:40	\N	2024-02-07 14:36:40
100	2b1106a291b54b57be4183adf685ff3e	5	AppNamespace	IsPublic	\N	false	f	0	\N	2024-02-07 14:36:40	\N	2024-02-07 14:36:40
101	dbaa95187b234b8e8b4686aebfcc0768	27	Role	RoleName	\N	Master+bbb	f	0	\N	2024-02-07 14:36:40	\N	2024-02-07 14:36:40
102	dbaa95187b234b8e8b4686aebfcc0768	28	Role	RoleName	\N	ManageAppMaster+bbb	f	0	\N	2024-02-07 14:36:40	\N	2024-02-07 14:36:40
103	1d2ae246890c41dbbce00483b11e237b	13	UserRole	UserId	\N	apollo	f	0	\N	2024-02-07 14:36:40	\N	2024-02-07 14:36:40
104	1d2ae246890c41dbbce00483b11e237b	13	UserRole	RoleId	\N	27	f	0	\N	2024-02-07 14:36:40	\N	2024-02-07 14:36:40
105	dbaa95187b234b8e8b4686aebfcc0768	29	Role	RoleName	\N	ModifyNamespace+bbb+application	f	0	\N	2024-02-07 14:36:40	\N	2024-02-07 14:36:40
106	dbaa95187b234b8e8b4686aebfcc0768	30	Role	RoleName	\N	ReleaseNamespace+bbb+application	f	0	\N	2024-02-07 14:36:40	\N	2024-02-07 14:36:40
107	dbaa95187b234b8e8b4686aebfcc0768	31	Role	RoleName	\N	ModifyNamespace+bbb+application+DEV	f	0	\N	2024-02-07 14:36:40	\N	2024-02-07 14:36:40
108	dbaa95187b234b8e8b4686aebfcc0768	32	Role	RoleName	\N	ReleaseNamespace+bbb+application+DEV	f	0	\N	2024-02-07 14:36:40	\N	2024-02-07 14:36:40
109	d88ef8ecf5df42fd97ed2339d8a9b65d	14	UserRole	UserId	\N	apollo	f	0	\N	2024-02-07 14:36:40	\N	2024-02-07 14:36:40
110	d88ef8ecf5df42fd97ed2339d8a9b65d	14	UserRole	RoleId	\N	29	f	0	\N	2024-02-07 14:36:40	\N	2024-02-07 14:36:40
111	d3347deaa0d2411987ad1926674f10ec	15	UserRole	UserId	\N	apollo	f	0	\N	2024-02-07 14:36:40	\N	2024-02-07 14:36:40
112	d3347deaa0d2411987ad1926674f10ec	15	UserRole	RoleId	\N	30	f	0	\N	2024-02-07 14:36:40	\N	2024-02-07 14:36:40
\.


--
-- TOC entry 3892 (class 0 OID 693729)
-- Dependencies: 276
-- Data for Name: Authorities; Type: TABLE DATA; Schema: public; Owner: system
--

COPY public."Authorities" ("Id", "Username", "Authority") FROM stdin;
1	apollo	ROLE_user
\.


--
-- TOC entry 3900 (class 0 OID 693786)
-- Dependencies: 284
-- Data for Name: Consumer; Type: TABLE DATA; Schema: public; Owner: system
--

COPY public."Consumer" ("Id", "AppId", "Name", "OrgId", "OrgName", "OwnerName", "OwnerEmail", "IsDeleted", "DeletedAt", "DataChange_CreatedBy", "DataChange_CreatedTime", "DataChange_LastModifiedBy", "DataChange_LastTime") FROM stdin;
\.


--
-- TOC entry 3896 (class 0 OID 693756)
-- Dependencies: 280
-- Data for Name: ConsumerAudit; Type: TABLE DATA; Schema: public; Owner: system
--

COPY public."ConsumerAudit" ("Id", "ConsumerId", "Uri", "Method", "DataChange_CreatedTime", "DataChange_LastTime") FROM stdin;
\.


--
-- TOC entry 3904 (class 0 OID 693826)
-- Dependencies: 288
-- Data for Name: ConsumerRole; Type: TABLE DATA; Schema: public; Owner: system
--

COPY public."ConsumerRole" ("Id", "ConsumerId", "RoleId", "IsDeleted", "DeletedAt", "DataChange_CreatedBy", "DataChange_CreatedTime", "DataChange_LastModifiedBy", "DataChange_LastTime") FROM stdin;
\.


--
-- TOC entry 3912 (class 0 OID 693889)
-- Dependencies: 296
-- Data for Name: ConsumerToken; Type: TABLE DATA; Schema: public; Owner: system
--

COPY public."ConsumerToken" ("Id", "ConsumerId", "Token", "Expires", "IsDeleted", "DeletedAt", "DataChange_CreatedBy", "DataChange_CreatedTime", "DataChange_LastModifiedBy", "DataChange_LastTime") FROM stdin;
\.


--
-- TOC entry 3898 (class 0 OID 693770)
-- Dependencies: 282
-- Data for Name: Favorite; Type: TABLE DATA; Schema: public; Owner: system
--

COPY public."Favorite" ("Id", "UserId", "AppId", "Position", "IsDeleted", "DeletedAt", "DataChange_CreatedBy", "DataChange_CreatedTime", "DataChange_LastModifiedBy", "DataChange_LastTime") FROM stdin;
\.


--
-- TOC entry 3918 (class 0 OID 693931)
-- Dependencies: 302
-- Data for Name: Permission; Type: TABLE DATA; Schema: public; Owner: system
--

COPY public."Permission" ("Id", "PermissionType", "TargetId", "IsDeleted", "DeletedAt", "DataChange_CreatedBy", "DataChange_CreatedTime", "DataChange_LastModifiedBy", "DataChange_LastTime") FROM stdin;
4	CreateApplication	SystemRole	f	0	apollo	2024-02-07 10:22:27	apollo	2024-02-07 10:22:27
5	CreateNamespace	test	t	1707286575	apollo	2024-02-07 10:38:03	apollo	2024-02-07 10:38:03
6	CreateCluster	test	t	1707286575	apollo	2024-02-07 10:38:03	apollo	2024-02-07 10:38:03
7	AssignRole	test	t	1707286575	apollo	2024-02-07 10:38:03	apollo	2024-02-07 10:38:03
8	ManageAppMaster	test	t	1707286575	apollo	2024-02-07 10:38:03	apollo	2024-02-07 10:38:03
9	ModifyNamespace	test+application	t	1707286575	apollo	2024-02-07 10:38:03	apollo	2024-02-07 10:38:03
10	ReleaseNamespace	test+application	t	1707286575	apollo	2024-02-07 10:38:03	apollo	2024-02-07 10:38:03
11	ModifyNamespace	test+application+DEV	t	1707286575	apollo	2024-02-07 10:38:03	apollo	2024-02-07 10:38:03
12	ReleaseNamespace	test+application+DEV	t	1707286575	apollo	2024-02-07 10:38:03	apollo	2024-02-07 10:38:03
13	CreateNamespace	test	t	1707286715	apollo	2024-02-07 14:16:25	apollo	2024-02-07 14:16:25
14	AssignRole	test	t	1707286715	apollo	2024-02-07 14:16:25	apollo	2024-02-07 14:16:25
15	CreateCluster	test	t	1707286715	apollo	2024-02-07 14:16:25	apollo	2024-02-07 14:16:25
16	ManageAppMaster	test	t	1707286715	apollo	2024-02-07 14:16:25	apollo	2024-02-07 14:16:25
17	ModifyNamespace	test+application	t	1707286715	apollo	2024-02-07 14:16:25	apollo	2024-02-07 14:16:25
18	ReleaseNamespace	test+application	t	1707286715	apollo	2024-02-07 14:16:25	apollo	2024-02-07 14:16:25
19	ModifyNamespace	test+application+DEV	t	1707286715	apollo	2024-02-07 14:16:25	apollo	2024-02-07 14:16:25
20	ReleaseNamespace	test+application+DEV	t	1707286715	apollo	2024-02-07 14:16:25	apollo	2024-02-07 14:16:25
21	CreateCluster	aaa	t	1707286947	apollo	2024-02-07 14:18:52	apollo	2024-02-07 14:18:52
22	CreateNamespace	aaa	t	1707286947	apollo	2024-02-07 14:18:52	apollo	2024-02-07 14:18:52
23	AssignRole	aaa	t	1707286947	apollo	2024-02-07 14:18:52	apollo	2024-02-07 14:18:52
24	ManageAppMaster	aaa	t	1707286947	apollo	2024-02-07 14:18:52	apollo	2024-02-07 14:18:52
25	ModifyNamespace	aaa+application	t	1707286947	apollo	2024-02-07 14:18:52	apollo	2024-02-07 14:18:52
26	ReleaseNamespace	aaa+application	t	1707286947	apollo	2024-02-07 14:18:52	apollo	2024-02-07 14:18:52
27	ModifyNamespace	aaa+application+DEV	t	1707286947	apollo	2024-02-07 14:18:52	apollo	2024-02-07 14:18:52
28	ReleaseNamespace	aaa+application+DEV	t	1707286947	apollo	2024-02-07 14:18:52	apollo	2024-02-07 14:18:52
29	CreateCluster	aaa	t	1707287786	apollo	2024-02-07 14:22:40	apollo	2024-02-07 14:22:40
30	CreateNamespace	aaa	t	1707287786	apollo	2024-02-07 14:22:40	apollo	2024-02-07 14:22:40
31	AssignRole	aaa	t	1707287786	apollo	2024-02-07 14:22:40	apollo	2024-02-07 14:22:40
32	ManageAppMaster	aaa	t	1707287786	apollo	2024-02-07 14:22:40	apollo	2024-02-07 14:22:40
33	ModifyNamespace	aaa+application	t	1707287786	apollo	2024-02-07 14:22:40	apollo	2024-02-07 14:22:40
34	ReleaseNamespace	aaa+application	t	1707287786	apollo	2024-02-07 14:22:40	apollo	2024-02-07 14:22:40
35	ModifyNamespace	aaa+application+DEV	t	1707287786	apollo	2024-02-07 14:22:40	apollo	2024-02-07 14:22:40
36	ReleaseNamespace	aaa+application+DEV	t	1707287786	apollo	2024-02-07 14:22:40	apollo	2024-02-07 14:22:40
37	CreateNamespace	bbb	f	0	apollo	2024-02-07 14:36:40	apollo	2024-02-07 14:36:40
38	AssignRole	bbb	f	0	apollo	2024-02-07 14:36:40	apollo	2024-02-07 14:36:40
39	CreateCluster	bbb	f	0	apollo	2024-02-07 14:36:40	apollo	2024-02-07 14:36:40
40	ManageAppMaster	bbb	f	0	apollo	2024-02-07 14:36:40	apollo	2024-02-07 14:36:40
41	ModifyNamespace	bbb+application	f	0	apollo	2024-02-07 14:36:40	apollo	2024-02-07 14:36:40
42	ReleaseNamespace	bbb+application	f	0	apollo	2024-02-07 14:36:40	apollo	2024-02-07 14:36:40
43	ModifyNamespace	bbb+application+DEV	f	0	apollo	2024-02-07 14:36:40	apollo	2024-02-07 14:36:40
44	ReleaseNamespace	bbb+application+DEV	f	0	apollo	2024-02-07 14:36:40	apollo	2024-02-07 14:36:40
\.


--
-- TOC entry 3920 (class 0 OID 693946)
-- Dependencies: 304
-- Data for Name: Role; Type: TABLE DATA; Schema: public; Owner: system
--

COPY public."Role" ("Id", "RoleName", "IsDeleted", "DeletedAt", "DataChange_CreatedBy", "DataChange_CreatedTime", "DataChange_LastModifiedBy", "DataChange_LastTime") FROM stdin;
2	CreateApplication+SystemRole	f	0	apollo	2024-02-07 10:22:27	apollo	2024-02-07 10:22:27
3	Master+test	t	1707286575	apollo	2024-02-07 10:38:03	apollo	2024-02-07 10:38:03
4	ManageAppMaster+test	t	1707286575	apollo	2024-02-07 10:38:03	apollo	2024-02-07 10:38:03
5	ModifyNamespace+test+application	t	1707286575	apollo	2024-02-07 10:38:03	apollo	2024-02-07 10:38:03
6	ReleaseNamespace+test+application	t	1707286575	apollo	2024-02-07 10:38:03	apollo	2024-02-07 10:38:03
7	ModifyNamespace+test+application+DEV	t	1707286575	apollo	2024-02-07 10:38:03	apollo	2024-02-07 10:38:03
8	ReleaseNamespace+test+application+DEV	t	1707286575	apollo	2024-02-07 10:38:03	apollo	2024-02-07 10:38:03
9	Master+test	t	1707286715	apollo	2024-02-07 14:16:25	apollo	2024-02-07 14:16:25
10	ManageAppMaster+test	t	1707286715	apollo	2024-02-07 14:16:25	apollo	2024-02-07 14:16:25
11	ModifyNamespace+test+application	t	1707286715	apollo	2024-02-07 14:16:25	apollo	2024-02-07 14:16:25
12	ReleaseNamespace+test+application	t	1707286715	apollo	2024-02-07 14:16:25	apollo	2024-02-07 14:16:25
13	ModifyNamespace+test+application+DEV	t	1707286715	apollo	2024-02-07 14:16:25	apollo	2024-02-07 14:16:25
14	ReleaseNamespace+test+application+DEV	t	1707286715	apollo	2024-02-07 14:16:25	apollo	2024-02-07 14:16:25
15	Master+aaa	t	1707286947	apollo	2024-02-07 14:18:52	apollo	2024-02-07 14:18:52
16	ManageAppMaster+aaa	t	1707286947	apollo	2024-02-07 14:18:52	apollo	2024-02-07 14:18:52
17	ModifyNamespace+aaa+application	t	1707286947	apollo	2024-02-07 14:18:52	apollo	2024-02-07 14:18:52
18	ReleaseNamespace+aaa+application	t	1707286947	apollo	2024-02-07 14:18:52	apollo	2024-02-07 14:18:52
19	ModifyNamespace+aaa+application+DEV	t	1707286947	apollo	2024-02-07 14:18:52	apollo	2024-02-07 14:18:52
20	ReleaseNamespace+aaa+application+DEV	t	1707286947	apollo	2024-02-07 14:18:52	apollo	2024-02-07 14:18:52
21	Master+aaa	t	1707287786	apollo	2024-02-07 14:22:40	apollo	2024-02-07 14:22:40
22	ManageAppMaster+aaa	t	1707287786	apollo	2024-02-07 14:22:40	apollo	2024-02-07 14:22:40
23	ModifyNamespace+aaa+application	t	1707287786	apollo	2024-02-07 14:22:40	apollo	2024-02-07 14:22:40
24	ReleaseNamespace+aaa+application	t	1707287786	apollo	2024-02-07 14:22:40	apollo	2024-02-07 14:22:40
25	ModifyNamespace+aaa+application+DEV	t	1707287786	apollo	2024-02-07 14:22:40	apollo	2024-02-07 14:22:40
26	ReleaseNamespace+aaa+application+DEV	t	1707287786	apollo	2024-02-07 14:22:40	apollo	2024-02-07 14:22:40
27	Master+bbb	f	0	apollo	2024-02-07 14:36:40	apollo	2024-02-07 14:36:40
28	ManageAppMaster+bbb	f	0	apollo	2024-02-07 14:36:40	apollo	2024-02-07 14:36:40
29	ModifyNamespace+bbb+application	f	0	apollo	2024-02-07 14:36:40	apollo	2024-02-07 14:36:40
30	ReleaseNamespace+bbb+application	f	0	apollo	2024-02-07 14:36:40	apollo	2024-02-07 14:36:40
31	ModifyNamespace+bbb+application+DEV	f	0	apollo	2024-02-07 14:36:40	apollo	2024-02-07 14:36:40
32	ReleaseNamespace+bbb+application+DEV	f	0	apollo	2024-02-07 14:36:40	apollo	2024-02-07 14:36:40
\.


--
-- TOC entry 3906 (class 0 OID 693840)
-- Dependencies: 290
-- Data for Name: RolePermission; Type: TABLE DATA; Schema: public; Owner: system
--

COPY public."RolePermission" ("Id", "RoleId", "PermissionId", "IsDeleted", "DeletedAt", "DataChange_CreatedBy", "DataChange_CreatedTime", "DataChange_LastModifiedBy", "DataChange_LastTime") FROM stdin;
1	2	4	f	0	apollo	2024-02-07 10:22:27	apollo	2024-02-07 10:22:27
2	3	5	t	1707286575	apollo	2024-02-07 10:38:03	apollo	2024-02-07 10:38:03
3	3	6	t	1707286575	apollo	2024-02-07 10:38:03	apollo	2024-02-07 10:38:03
4	3	7	t	1707286575	apollo	2024-02-07 10:38:03	apollo	2024-02-07 10:38:03
5	4	8	t	1707286575	apollo	2024-02-07 10:38:03	apollo	2024-02-07 10:38:03
6	5	9	t	1707286575	apollo	2024-02-07 10:38:03	apollo	2024-02-07 10:38:03
7	6	10	t	1707286575	apollo	2024-02-07 10:38:03	apollo	2024-02-07 10:38:03
8	7	11	t	1707286575	apollo	2024-02-07 10:38:03	apollo	2024-02-07 10:38:03
9	8	12	t	1707286575	apollo	2024-02-07 10:38:03	apollo	2024-02-07 10:38:03
10	9	13	t	1707286715	apollo	2024-02-07 14:16:25	apollo	2024-02-07 14:16:25
11	9	14	t	1707286715	apollo	2024-02-07 14:16:25	apollo	2024-02-07 14:16:25
12	9	15	t	1707286715	apollo	2024-02-07 14:16:25	apollo	2024-02-07 14:16:25
13	10	16	t	1707286715	apollo	2024-02-07 14:16:25	apollo	2024-02-07 14:16:25
14	11	17	t	1707286715	apollo	2024-02-07 14:16:25	apollo	2024-02-07 14:16:25
15	12	18	t	1707286715	apollo	2024-02-07 14:16:25	apollo	2024-02-07 14:16:25
16	13	19	t	1707286715	apollo	2024-02-07 14:16:25	apollo	2024-02-07 14:16:25
17	14	20	t	1707286715	apollo	2024-02-07 14:16:25	apollo	2024-02-07 14:16:25
18	15	21	t	1707286947	apollo	2024-02-07 14:18:52	apollo	2024-02-07 14:18:52
19	15	22	t	1707286947	apollo	2024-02-07 14:18:52	apollo	2024-02-07 14:18:52
20	15	23	t	1707286947	apollo	2024-02-07 14:18:52	apollo	2024-02-07 14:18:52
21	16	24	t	1707286947	apollo	2024-02-07 14:18:52	apollo	2024-02-07 14:18:52
22	17	25	t	1707286947	apollo	2024-02-07 14:18:52	apollo	2024-02-07 14:18:52
23	18	26	t	1707286947	apollo	2024-02-07 14:18:52	apollo	2024-02-07 14:18:52
24	19	27	t	1707286947	apollo	2024-02-07 14:18:52	apollo	2024-02-07 14:18:52
25	20	28	t	1707286947	apollo	2024-02-07 14:18:52	apollo	2024-02-07 14:18:52
26	21	29	t	1707287786	apollo	2024-02-07 14:22:40	apollo	2024-02-07 14:22:40
27	21	30	t	1707287786	apollo	2024-02-07 14:22:40	apollo	2024-02-07 14:22:40
28	21	31	t	1707287786	apollo	2024-02-07 14:22:40	apollo	2024-02-07 14:22:40
29	22	32	t	1707287786	apollo	2024-02-07 14:22:40	apollo	2024-02-07 14:22:40
30	23	33	t	1707287786	apollo	2024-02-07 14:22:40	apollo	2024-02-07 14:22:40
31	24	34	t	1707287786	apollo	2024-02-07 14:22:40	apollo	2024-02-07 14:22:40
32	25	35	t	1707287786	apollo	2024-02-07 14:22:40	apollo	2024-02-07 14:22:40
33	26	36	t	1707287786	apollo	2024-02-07 14:22:40	apollo	2024-02-07 14:22:40
34	27	37	f	0	apollo	2024-02-07 14:36:40	apollo	2024-02-07 14:36:40
35	27	38	f	0	apollo	2024-02-07 14:36:40	apollo	2024-02-07 14:36:40
36	27	39	f	0	apollo	2024-02-07 14:36:40	apollo	2024-02-07 14:36:40
37	28	40	f	0	apollo	2024-02-07 14:36:40	apollo	2024-02-07 14:36:40
38	29	41	f	0	apollo	2024-02-07 14:36:40	apollo	2024-02-07 14:36:40
39	30	42	f	0	apollo	2024-02-07 14:36:40	apollo	2024-02-07 14:36:40
40	31	43	f	0	apollo	2024-02-07 14:36:40	apollo	2024-02-07 14:36:40
41	32	44	f	0	apollo	2024-02-07 14:36:40	apollo	2024-02-07 14:36:40
\.


--
-- TOC entry 3916 (class 0 OID 693926)
-- Dependencies: 300
-- Data for Name: SPRING_SESSION; Type: TABLE DATA; Schema: public; Owner: system
--

COPY public."SPRING_SESSION" ("PRIMARY_ID", "SESSION_ID", "CREATION_TIME", "LAST_ACCESS_TIME", "MAX_INACTIVE_INTERVAL", "EXPIRY_TIME", "PRINCIPAL_NAME") FROM stdin;
\.


--
-- TOC entry 3915 (class 0 OID 693920)
-- Dependencies: 299
-- Data for Name: SPRING_SESSION_ATTRIBUTES; Type: TABLE DATA; Schema: public; Owner: system
--

COPY public."SPRING_SESSION_ATTRIBUTES" ("SESSION_PRIMARY_ID", "ATTRIBUTE_NAME", "ATTRIBUTE_BYTES") FROM stdin;
\.


--
-- TOC entry 3902 (class 0 OID 693808)
-- Dependencies: 286
-- Data for Name: ServerConfig; Type: TABLE DATA; Schema: public; Owner: system
--

COPY public."ServerConfig" ("Id", "Key", "Value", "Comment", "IsDeleted", "DeletedAt", "DataChange_CreatedBy", "DataChange_CreatedTime", "DataChange_LastModifiedBy", "DataChange_LastTime") FROM stdin;
1	apollo.portal.envs	dev	可支持的环境列表	f	0	default	2024-02-04 09:42:48		2024-02-04 09:42:48
2	organizations	[{"orgId":"TEST1","orgName":"样例部门1"},{"orgId":"TEST2","orgName":"样例部门2"}]	部门列表	f	0	default	2024-02-04 09:42:48		2024-02-04 09:42:48
3	superAdmin	apollo	Portal超级管理员	f	0	default	2024-02-04 09:42:48		2024-02-04 09:42:48
4	api.readTimeout	10000	http接口read timeout	f	0	default	2024-02-04 09:42:48		2024-02-04 09:42:48
5	consumer.token.salt	someSalt	consumer token salt	f	0	default	2024-02-04 09:42:48		2024-02-04 09:42:48
6	admin.createPrivateNamespace.switch	true	是否允许项目管理员创建私有namespace	f	0	default	2024-02-04 09:42:48		2024-02-04 09:42:48
7	configView.memberOnly.envs	pro	只对项目成员显示配置信息的环境列表，多个env以英文逗号分隔	f	0	default	2024-02-04 09:42:48		2024-02-04 09:42:48
8	apollo.portal.meta.servers	{}	各环境Meta Service列表	f	0	default	2024-02-04 09:42:48		2024-02-04 09:42:48
\.


--
-- TOC entry 3910 (class 0 OID 693875)
-- Dependencies: 294
-- Data for Name: UserRole; Type: TABLE DATA; Schema: public; Owner: system
--

COPY public."UserRole" ("Id", "UserId", "RoleId", "IsDeleted", "DeletedAt", "DataChange_CreatedBy", "DataChange_CreatedTime", "DataChange_LastModifiedBy", "DataChange_LastTime") FROM stdin;
1	apollo	3	t	1707286575	apollo	2024-02-07 10:38:03	apollo	2024-02-07 10:38:03
2	apollo	5	t	1707286575	apollo	2024-02-07 10:38:03	apollo	2024-02-07 10:38:03
3	apollo	6	t	1707286575	apollo	2024-02-07 10:38:03	apollo	2024-02-07 10:38:03
4	apollo	9	t	1707286715	apollo	2024-02-07 14:16:25	apollo	2024-02-07 14:16:25
5	apollo	11	t	1707286715	apollo	2024-02-07 14:16:25	apollo	2024-02-07 14:16:25
6	apollo	12	t	1707286715	apollo	2024-02-07 14:16:25	apollo	2024-02-07 14:16:25
7	apollo	15	t	1707286947	apollo	2024-02-07 14:18:52	apollo	2024-02-07 14:18:52
8	apollo	17	t	1707286947	apollo	2024-02-07 14:18:52	apollo	2024-02-07 14:18:52
9	apollo	18	t	1707286947	apollo	2024-02-07 14:18:52	apollo	2024-02-07 14:18:52
10	apollo	21	t	1707287786	apollo	2024-02-07 14:22:40	apollo	2024-02-07 14:22:40
11	apollo	23	t	1707287786	apollo	2024-02-07 14:22:40	apollo	2024-02-07 14:22:40
12	apollo	24	t	1707287786	apollo	2024-02-07 14:22:40	apollo	2024-02-07 14:22:40
13	apollo	27	f	0	apollo	2024-02-07 14:36:40	apollo	2024-02-07 14:36:40
14	apollo	29	f	0	apollo	2024-02-07 14:36:40	apollo	2024-02-07 14:36:40
15	apollo	30	f	0	apollo	2024-02-07 14:36:40	apollo	2024-02-07 14:36:40
\.


--
-- TOC entry 3890 (class 0 OID 693715)
-- Dependencies: 274
-- Data for Name: Users; Type: TABLE DATA; Schema: public; Owner: system
--

COPY public."Users" ("Id", "Username", "Password", "UserDisplayName", "Email", "Enabled") FROM stdin;
1	apollo	$2a$10$7r20uS.BQ9uBpf3Baj3uQOZvMVvB1RN3PYoKE94gtz2.WAOuiiwXS	apollo	apollo@acme.com	1
\.


--
-- TOC entry 3923 (class 0 OID 694467)
-- Dependencies: 307
-- Data for Name: spring_session; Type: TABLE DATA; Schema: public; Owner: system
--

COPY public.spring_session (primary_id, session_id, creation_time, last_access_time, max_inactive_interval, expiry_time, principal_name) FROM stdin;
\.


--
-- TOC entry 3924 (class 0 OID 694482)
-- Dependencies: 308
-- Data for Name: spring_session_attributes; Type: TABLE DATA; Schema: public; Owner: system
--

COPY public.spring_session_attributes (session_primary_id, attribute_name, attribute_bytes) FROM stdin;
d9c2b822-898b-4b5e-b8ad-cc5ed1747d10	SPRING_SECURITY_CONTEXT	\\x7b2240636c617373223a226f72672e737072696e676672616d65776f726b2e73656375726974792e636f72652e636f6e746578742e5365637572697479436f6e74657874496d706c222c2261757468656e7469636174696f6e223a7b2240636c617373223a226f72672e737072696e676672616d65776f726b2e73656375726974792e61757468656e7469636174696f6e2e557365726e616d6550617373776f726441757468656e7469636174696f6e546f6b656e222c22617574686f726974696573223a5b226a6176612e7574696c2e436f6c6c656374696f6e7324556e6d6f6469666961626c6552616e646f6d4163636573734c697374222c5b7b2240636c617373223a226f72672e737072696e676672616d65776f726b2e73656375726974792e636f72652e617574686f726974792e53696d706c654772616e746564417574686f72697479222c22617574686f72697479223a22524f4c455f75736572227d5d5d2c2264657461696c73223a7b2240636c617373223a226f72672e737072696e676672616d65776f726b2e73656375726974792e7765622e61757468656e7469636174696f6e2e57656241757468656e7469636174696f6e44657461696c73222c2272656d6f746541646472657373223a223132372e302e302e31222c2273657373696f6e4964223a2234326531616331332d383833652d343130652d626266632d616634306436353064666334227d2c2261757468656e74696361746564223a747275652c227072696e636970616c223a7b2240636c617373223a226f72672e737072696e676672616d65776f726b2e73656375726974792e636f72652e7573657264657461696c732e55736572222c2270617373776f7264223a6e756c6c2c22757365726e616d65223a2261706f6c6c6f222c22617574686f726974696573223a5b226a6176612e7574696c2e436f6c6c656374696f6e7324556e6d6f6469666961626c65536574222c5b7b2240636c617373223a226f72672e737072696e676672616d65776f726b2e73656375726974792e636f72652e617574686f726974792e53696d706c654772616e746564417574686f72697479222c22617574686f72697479223a22524f4c455f75736572227d5d5d2c226163636f756e744e6f6e45787069726564223a747275652c226163636f756e744e6f6e4c6f636b6564223a747275652c2263726564656e7469616c734e6f6e45787069726564223a747275652c22656e61626c6564223a747275657d2c2263726564656e7469616c73223a6e756c6c7d7d
188a2d74-5dee-4100-af30-a7f6b6d428b8	SPRING_SECURITY_CONTEXT	\\x7b2240636c617373223a226f72672e737072696e676672616d65776f726b2e73656375726974792e636f72652e636f6e746578742e5365637572697479436f6e74657874496d706c222c2261757468656e7469636174696f6e223a7b2240636c617373223a226f72672e737072696e676672616d65776f726b2e73656375726974792e61757468656e7469636174696f6e2e557365726e616d6550617373776f726441757468656e7469636174696f6e546f6b656e222c22617574686f726974696573223a5b226a6176612e7574696c2e436f6c6c656374696f6e7324556e6d6f6469666961626c6552616e646f6d4163636573734c697374222c5b7b2240636c617373223a226f72672e737072696e676672616d65776f726b2e73656375726974792e636f72652e617574686f726974792e53696d706c654772616e746564417574686f72697479222c22617574686f72697479223a22524f4c455f75736572227d5d5d2c2264657461696c73223a7b2240636c617373223a226f72672e737072696e676672616d65776f726b2e73656375726974792e7765622e61757468656e7469636174696f6e2e57656241757468656e7469636174696f6e44657461696c73222c2272656d6f746541646472657373223a223132372e302e302e31222c2273657373696f6e4964223a2261313134353834662d316264312d343231302d613761302d623838636232356337336461227d2c2261757468656e74696361746564223a747275652c227072696e636970616c223a7b2240636c617373223a226f72672e737072696e676672616d65776f726b2e73656375726974792e636f72652e7573657264657461696c732e55736572222c2270617373776f7264223a6e756c6c2c22757365726e616d65223a2261706f6c6c6f222c22617574686f726974696573223a5b226a6176612e7574696c2e436f6c6c656374696f6e7324556e6d6f6469666961626c65536574222c5b7b2240636c617373223a226f72672e737072696e676672616d65776f726b2e73656375726974792e636f72652e617574686f726974792e53696d706c654772616e746564417574686f72697479222c22617574686f72697479223a22524f4c455f75736572227d5d5d2c226163636f756e744e6f6e45787069726564223a747275652c226163636f756e744e6f6e4c6f636b6564223a747275652c2263726564656e7469616c734e6f6e45787069726564223a747275652c22656e61626c6564223a747275657d2c2263726564656e7469616c73223a6e756c6c7d7d
2324f950-cd4d-49a0-ae2f-77a4fc207762	SPRING_SECURITY_CONTEXT	\\x7b2240636c617373223a226f72672e737072696e676672616d65776f726b2e73656375726974792e636f72652e636f6e746578742e5365637572697479436f6e74657874496d706c222c2261757468656e7469636174696f6e223a7b2240636c617373223a226f72672e737072696e676672616d65776f726b2e73656375726974792e61757468656e7469636174696f6e2e557365726e616d6550617373776f726441757468656e7469636174696f6e546f6b656e222c22617574686f726974696573223a5b226a6176612e7574696c2e436f6c6c656374696f6e7324556e6d6f6469666961626c6552616e646f6d4163636573734c697374222c5b7b2240636c617373223a226f72672e737072696e676672616d65776f726b2e73656375726974792e636f72652e617574686f726974792e53696d706c654772616e746564417574686f72697479222c22617574686f72697479223a22524f4c455f75736572227d5d5d2c2264657461696c73223a7b2240636c617373223a226f72672e737072696e676672616d65776f726b2e73656375726974792e7765622e61757468656e7469636174696f6e2e57656241757468656e7469636174696f6e44657461696c73222c2272656d6f746541646472657373223a223132372e302e302e31222c2273657373696f6e4964223a2236383663653436312d613630622d346561352d616633352d303238666336623236623337227d2c2261757468656e74696361746564223a747275652c227072696e636970616c223a7b2240636c617373223a226f72672e737072696e676672616d65776f726b2e73656375726974792e636f72652e7573657264657461696c732e55736572222c2270617373776f7264223a6e756c6c2c22757365726e616d65223a2261706f6c6c6f222c22617574686f726974696573223a5b226a6176612e7574696c2e436f6c6c656374696f6e7324556e6d6f6469666961626c65536574222c5b7b2240636c617373223a226f72672e737072696e676672616d65776f726b2e73656375726974792e636f72652e617574686f726974792e53696d706c654772616e746564417574686f72697479222c22617574686f72697479223a22524f4c455f75736572227d5d5d2c226163636f756e744e6f6e45787069726564223a747275652c226163636f756e744e6f6e4c6f636b6564223a747275652c2263726564656e7469616c734e6f6e45787069726564223a747275652c22656e61626c6564223a747275657d2c2263726564656e7469616c73223a6e756c6c7d7d
\.


--
-- TOC entry 3949 (class 0 OID 0)
-- Dependencies: 305
-- Name: AppNamespace_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: system
--

SELECT pg_catalog.setval('public."AppNamespace_Id_seq"', 5, true);


--
-- TOC entry 3950 (class 0 OID 0)
-- Dependencies: 291
-- Name: App_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: system
--

SELECT pg_catalog.setval('public."App_Id_seq"', 5, true);


--
-- TOC entry 3951 (class 0 OID 0)
-- Dependencies: 297
-- Name: AuditLogDataInfluence_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: system
--

SELECT pg_catalog.setval('public."AuditLogDataInfluence_Id_seq"', 112, true);


--
-- TOC entry 3952 (class 0 OID 0)
-- Dependencies: 277
-- Name: AuditLog_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: system
--

SELECT pg_catalog.setval('public."AuditLog_Id_seq"', 82, true);


--
-- TOC entry 3953 (class 0 OID 0)
-- Dependencies: 275
-- Name: Authorities_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: system
--

SELECT pg_catalog.setval('public."Authorities_Id_seq"', 2, false);


--
-- TOC entry 3954 (class 0 OID 0)
-- Dependencies: 279
-- Name: ConsumerAudit_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: system
--

SELECT pg_catalog.setval('public."ConsumerAudit_Id_seq"', 1, false);


--
-- TOC entry 3955 (class 0 OID 0)
-- Dependencies: 287
-- Name: ConsumerRole_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: system
--

SELECT pg_catalog.setval('public."ConsumerRole_Id_seq"', 1, false);


--
-- TOC entry 3956 (class 0 OID 0)
-- Dependencies: 295
-- Name: ConsumerToken_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: system
--

SELECT pg_catalog.setval('public."ConsumerToken_Id_seq"', 1, false);


--
-- TOC entry 3957 (class 0 OID 0)
-- Dependencies: 283
-- Name: Consumer_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: system
--

SELECT pg_catalog.setval('public."Consumer_Id_seq"', 1, false);


--
-- TOC entry 3958 (class 0 OID 0)
-- Dependencies: 281
-- Name: Favorite_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: system
--

SELECT pg_catalog.setval('public."Favorite_Id_seq"', 23, false);


--
-- TOC entry 3959 (class 0 OID 0)
-- Dependencies: 301
-- Name: Permission_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: system
--

SELECT pg_catalog.setval('public."Permission_Id_seq"', 44, true);


--
-- TOC entry 3960 (class 0 OID 0)
-- Dependencies: 289
-- Name: RolePermission_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: system
--

SELECT pg_catalog.setval('public."RolePermission_Id_seq"', 41, true);


--
-- TOC entry 3961 (class 0 OID 0)
-- Dependencies: 303
-- Name: Role_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: system
--

SELECT pg_catalog.setval('public."Role_Id_seq"', 32, true);


--
-- TOC entry 3962 (class 0 OID 0)
-- Dependencies: 285
-- Name: ServerConfig_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: system
--

SELECT pg_catalog.setval('public."ServerConfig_Id_seq"', 9, false);


--
-- TOC entry 3963 (class 0 OID 0)
-- Dependencies: 293
-- Name: UserRole_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: system
--

SELECT pg_catalog.setval('public."UserRole_Id_seq"', 15, true);


--
-- TOC entry 3964 (class 0 OID 0)
-- Dependencies: 273
-- Name: Users_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: system
--

SELECT pg_catalog.setval('public."Users_Id_seq"', 2, false);


--
-- TOC entry 3705 (class 2606 OID 694014)
-- Name: AuditLogDataInfluence PRIMARY_11ECE35D; Type: CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public."AuditLogDataInfluence"
    ADD CONSTRAINT "PRIMARY_11ECE35D" PRIMARY KEY ("Id");


--
-- TOC entry 3693 (class 2606 OID 693991)
-- Name: UserRole PRIMARY_2EA9C8FC; Type: CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public."UserRole"
    ADD CONSTRAINT "PRIMARY_2EA9C8FC" PRIMARY KEY ("Id");


--
-- TOC entry 3659 (class 2606 OID 693979)
-- Name: Favorite PRIMARY_42F7B9B7; Type: CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public."Favorite"
    ADD CONSTRAINT "PRIMARY_42F7B9B7" PRIMARY KEY ("Id");


--
-- TOC entry 3681 (class 2606 OID 693985)
-- Name: RolePermission PRIMARY_63002D00; Type: CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public."RolePermission"
    ADD CONSTRAINT "PRIMARY_63002D00" PRIMARY KEY ("Id");


--
-- TOC entry 3645 (class 2606 OID 694004)
-- Name: Authorities PRIMARY_64031CFC; Type: CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public."Authorities"
    ADD CONSTRAINT "PRIMARY_64031CFC" PRIMARY KEY ("Id");


--
-- TOC entry 3709 (class 2606 OID 694001)
-- Name: SPRING_SESSION PRIMARY_65B44DBC; Type: CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public."SPRING_SESSION"
    ADD CONSTRAINT "PRIMARY_65B44DBC" PRIMARY KEY ("PRIMARY_ID");


--
-- TOC entry 3707 (class 2606 OID 694007)
-- Name: SPRING_SESSION_ATTRIBUTES PRIMARY_710A7420; Type: CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public."SPRING_SESSION_ATTRIBUTES"
    ADD CONSTRAINT "PRIMARY_710A7420" PRIMARY KEY ("ATTRIBUTE_NAME", "SESSION_PRIMARY_ID");


--
-- TOC entry 3737 (class 2606 OID 694489)
-- Name: spring_session_attributes PRIMARY_710A74202; Type: CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public.spring_session_attributes
    ADD CONSTRAINT "PRIMARY_710A74202" PRIMARY KEY (attribute_name, session_primary_id);


--
-- TOC entry 3721 (class 2606 OID 694017)
-- Name: Role PRIMARY_7EFD8C91; Type: CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public."Role"
    ADD CONSTRAINT "PRIMARY_7EFD8C91" PRIMARY KEY ("Id");


--
-- TOC entry 3669 (class 2606 OID 693998)
-- Name: ServerConfig PRIMARY_81230E80; Type: CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public."ServerConfig"
    ADD CONSTRAINT "PRIMARY_81230E80" PRIMARY KEY ("Id");


--
-- TOC entry 3641 (class 2606 OID 693993)
-- Name: Users PRIMARY_85B151E3; Type: CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "PRIMARY_85B151E3" PRIMARY KEY ("Id");


--
-- TOC entry 3655 (class 2606 OID 693983)
-- Name: ConsumerAudit PRIMARY_86BC7B60; Type: CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public."ConsumerAudit"
    ADD CONSTRAINT "PRIMARY_86BC7B60" PRIMARY KEY ("Id");


--
-- TOC entry 3727 (class 2606 OID 694029)
-- Name: AppNamespace PRIMARY_9906B455; Type: CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public."AppNamespace"
    ADD CONSTRAINT "PRIMARY_9906B455" PRIMARY KEY ("Id");


--
-- TOC entry 3651 (class 2606 OID 693977)
-- Name: AuditLog PRIMARY_AF43F384; Type: CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public."AuditLog"
    ADD CONSTRAINT "PRIMARY_AF43F384" PRIMARY KEY ("Id");


--
-- TOC entry 3698 (class 2606 OID 694009)
-- Name: ConsumerToken PRIMARY_B1B19D7E; Type: CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public."ConsumerToken"
    ADD CONSTRAINT "PRIMARY_B1B19D7E" PRIMARY KEY ("Id");


--
-- TOC entry 3716 (class 2606 OID 694013)
-- Name: Permission PRIMARY_CE267EA; Type: CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public."Permission"
    ADD CONSTRAINT "PRIMARY_CE267EA" PRIMARY KEY ("Id");


--
-- TOC entry 3664 (class 2606 OID 693981)
-- Name: Consumer PRIMARY_DD828011; Type: CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public."Consumer"
    ADD CONSTRAINT "PRIMARY_DD828011" PRIMARY KEY ("Id");


--
-- TOC entry 3687 (class 2606 OID 693988)
-- Name: App PRIMARY_E21D63FC; Type: CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public."App"
    ADD CONSTRAINT "PRIMARY_E21D63FC" PRIMARY KEY ("Id");


--
-- TOC entry 3675 (class 2606 OID 693989)
-- Name: ConsumerRole PRIMARY_FFA18DA7; Type: CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public."ConsumerRole"
    ADD CONSTRAINT "PRIMARY_FFA18DA7" PRIMARY KEY ("Id");


--
-- TOC entry 3711 (class 2606 OID 694055)
-- Name: SPRING_SESSION SPRING_SESSION_IX1_51F0BCDE; Type: CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public."SPRING_SESSION"
    ADD CONSTRAINT "SPRING_SESSION_IX1_51F0BCDE" UNIQUE ("SESSION_ID");


--
-- TOC entry 3733 (class 2606 OID 694473)
-- Name: spring_session SPRING_SESSION_copy_SESSION_ID_key; Type: CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public.spring_session
    ADD CONSTRAINT "SPRING_SESSION_copy_SESSION_ID_key" UNIQUE (session_id);


--
-- TOC entry 3735 (class 2606 OID 694471)
-- Name: spring_session SPRING_SESSION_copy_pkey; Type: CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public.spring_session
    ADD CONSTRAINT "SPRING_SESSION_copy_pkey" PRIMARY KEY (primary_id);


--
-- TOC entry 3689 (class 2606 OID 694040)
-- Name: App UK_AppId_DeletedAt_3DEBF313; Type: CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public."App"
    ADD CONSTRAINT "UK_AppId_DeletedAt_3DEBF313" UNIQUE ("AppId", "DeletedAt");


--
-- TOC entry 3666 (class 2606 OID 694020)
-- Name: Consumer UK_AppId_DeletedAt_BAB36028; Type: CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public."Consumer"
    ADD CONSTRAINT "UK_AppId_DeletedAt_BAB36028" UNIQUE ("AppId", "DeletedAt");


--
-- TOC entry 3729 (class 2606 OID 694065)
-- Name: AppNamespace UK_AppId_Name_DeletedAt_DE2CC392; Type: CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public."AppNamespace"
    ADD CONSTRAINT "UK_AppId_Name_DeletedAt_DE2CC392" UNIQUE ("AppId", "Name", "DeletedAt");


--
-- TOC entry 3677 (class 2606 OID 694047)
-- Name: ConsumerRole UK_ConsumerId_RoleId_DeletedAt_EAA023BE; Type: CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public."ConsumerRole"
    ADD CONSTRAINT "UK_ConsumerId_RoleId_DeletedAt_EAA023BE" UNIQUE ("ConsumerId", "RoleId", "DeletedAt");


--
-- TOC entry 3671 (class 2606 OID 694052)
-- Name: ServerConfig UK_Key_DeletedAt_62F63017; Type: CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public."ServerConfig"
    ADD CONSTRAINT "UK_Key_DeletedAt_62F63017" UNIQUE ("Key", "DeletedAt");


--
-- TOC entry 3683 (class 2606 OID 694041)
-- Name: RolePermission UK_RoleId_PermissionId_DeletedAt_6808A3F7; Type: CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public."RolePermission"
    ADD CONSTRAINT "UK_RoleId_PermissionId_DeletedAt_6808A3F7" UNIQUE ("RoleId", "PermissionId", "DeletedAt");


--
-- TOC entry 3723 (class 2606 OID 694059)
-- Name: Role UK_RoleName_DeletedAt_214A534; Type: CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public."Role"
    ADD CONSTRAINT "UK_RoleName_DeletedAt_214A534" UNIQUE ("RoleName", "DeletedAt");


--
-- TOC entry 3718 (class 2606 OID 694056)
-- Name: Permission UK_TargetId_PermissionType_DeletedAt_760562E1; Type: CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public."Permission"
    ADD CONSTRAINT "UK_TargetId_PermissionType_DeletedAt_760562E1" UNIQUE ("TargetId", "PermissionType", "DeletedAt");


--
-- TOC entry 3700 (class 2606 OID 694051)
-- Name: ConsumerToken UK_Token_DeletedAt_63E54ED5; Type: CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public."ConsumerToken"
    ADD CONSTRAINT "UK_Token_DeletedAt_63E54ED5" UNIQUE ("Token", "DeletedAt");


--
-- TOC entry 3661 (class 2606 OID 694046)
-- Name: Favorite UK_UserId_AppId_DeletedAt_B770FDFE; Type: CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public."Favorite"
    ADD CONSTRAINT "UK_UserId_AppId_DeletedAt_B770FDFE" UNIQUE ("UserId", "AppId", "DeletedAt");


--
-- TOC entry 3695 (class 2606 OID 694062)
-- Name: UserRole UK_UserId_RoleId_DeletedAt_84DA91F3; Type: CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public."UserRole"
    ADD CONSTRAINT "UK_UserId_RoleId_DeletedAt_84DA91F3" UNIQUE ("UserId", "RoleId", "DeletedAt");


--
-- TOC entry 3643 (class 2606 OID 694018)
-- Name: Users UK_Username_A3445096; Type: CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "UK_Username_A3445096" UNIQUE ("Username");


--
-- TOC entry 3656 (class 1259 OID 693997)
-- Name: AppId_49B7595F; Type: INDEX; Schema: public; Owner: system
--

CREATE INDEX "AppId_49B7595F" ON public."Favorite" USING btree ("AppId");


--
-- TOC entry 3724 (class 1259 OID 694048)
-- Name: DataChange_LastTime_2F675AA1; Type: INDEX; Schema: public; Owner: system
--

CREATE INDEX "DataChange_LastTime_2F675AA1" ON public."AppNamespace" USING btree ("DataChange_LastTime");


--
-- TOC entry 3662 (class 1259 OID 693999)
-- Name: DataChange_LastTime_4BB17865; Type: INDEX; Schema: public; Owner: system
--

CREATE INDEX "DataChange_LastTime_4BB17865" ON public."Consumer" USING btree ("DataChange_LastTime");


--
-- TOC entry 3696 (class 1259 OID 694032)
-- Name: DataChange_LastTime_52D88E18; Type: INDEX; Schema: public; Owner: system
--

CREATE INDEX "DataChange_LastTime_52D88E18" ON public."ConsumerToken" USING btree ("DataChange_LastTime");


--
-- TOC entry 3657 (class 1259 OID 694024)
-- Name: DataChange_LastTime_588A287F; Type: INDEX; Schema: public; Owner: system
--

CREATE INDEX "DataChange_LastTime_588A287F" ON public."Favorite" USING btree ("DataChange_LastTime");


--
-- TOC entry 3684 (class 1259 OID 694010)
-- Name: DataChange_LastTime_C007005A; Type: INDEX; Schema: public; Owner: system
--

CREATE INDEX "DataChange_LastTime_C007005A" ON public."App" USING btree ("DataChange_LastTime");


--
-- TOC entry 3667 (class 1259 OID 694033)
-- Name: DataChange_LastTime_DE221456; Type: INDEX; Schema: public; Owner: system
--

CREATE INDEX "DataChange_LastTime_DE221456" ON public."ServerConfig" USING btree ("DataChange_LastTime");


--
-- TOC entry 3652 (class 1259 OID 693994)
-- Name: IX_ConsumerId_383A8FBC; Type: INDEX; Schema: public; Owner: system
--

CREATE INDEX "IX_ConsumerId_383A8FBC" ON public."ConsumerAudit" USING btree ("ConsumerId");


--
-- TOC entry 3701 (class 1259 OID 694034)
-- Name: IX_DataChange_CreatedTime_17772E57; Type: INDEX; Schema: public; Owner: system
--

CREATE INDEX "IX_DataChange_CreatedTime_17772E57" ON public."AuditLogDataInfluence" USING btree ("DataChange_CreatedTime");


--
-- TOC entry 3646 (class 1259 OID 693996)
-- Name: IX_DataChange_CreatedTime_AA27E93E; Type: INDEX; Schema: public; Owner: system
--

CREATE INDEX "IX_DataChange_CreatedTime_AA27E93E" ON public."AuditLog" USING btree ("DataChange_CreatedTime");


--
-- TOC entry 3690 (class 1259 OID 694031)
-- Name: IX_DataChange_LastTime_236BDEAE; Type: INDEX; Schema: public; Owner: system
--

CREATE INDEX "IX_DataChange_LastTime_236BDEAE" ON public."UserRole" USING btree ("DataChange_LastTime");


--
-- TOC entry 3714 (class 1259 OID 694038)
-- Name: IX_DataChange_LastTime_463D459C; Type: INDEX; Schema: public; Owner: system
--

CREATE INDEX "IX_DataChange_LastTime_463D459C" ON public."Permission" USING btree ("DataChange_LastTime");


--
-- TOC entry 3672 (class 1259 OID 694005)
-- Name: IX_DataChange_LastTime_936E3759; Type: INDEX; Schema: public; Owner: system
--

CREATE INDEX "IX_DataChange_LastTime_936E3759" ON public."ConsumerRole" USING btree ("DataChange_LastTime");


--
-- TOC entry 3678 (class 1259 OID 694003)
-- Name: IX_DataChange_LastTime_BC9132B2; Type: INDEX; Schema: public; Owner: system
--

CREATE INDEX "IX_DataChange_LastTime_BC9132B2" ON public."RolePermission" USING btree ("DataChange_LastTime");


--
-- TOC entry 3653 (class 1259 OID 694025)
-- Name: IX_DataChange_LastTime_DC7C0112; Type: INDEX; Schema: public; Owner: system
--

CREATE INDEX "IX_DataChange_LastTime_DC7C0112" ON public."ConsumerAudit" USING btree ("DataChange_LastTime");


--
-- TOC entry 3719 (class 1259 OID 694037)
-- Name: IX_DataChange_LastTime_FA840E43; Type: INDEX; Schema: public; Owner: system
--

CREATE INDEX "IX_DataChange_LastTime_FA840E43" ON public."Role" USING btree ("DataChange_LastTime");


--
-- TOC entry 3702 (class 1259 OID 694060)
-- Name: IX_EntityId_96BFAB9E; Type: INDEX; Schema: public; Owner: system
--

CREATE INDEX "IX_EntityId_96BFAB9E" ON public."AuditLogDataInfluence" USING btree ("InfluenceEntityId");


--
-- TOC entry 3685 (class 1259 OID 694026)
-- Name: IX_Name_EB95B6C; Type: INDEX; Schema: public; Owner: system
--

CREATE INDEX "IX_Name_EB95B6C" ON public."App" USING btree ("Name");


--
-- TOC entry 3647 (class 1259 OID 694030)
-- Name: IX_OpName_35A45D96; Type: INDEX; Schema: public; Owner: system
--

CREATE INDEX "IX_OpName_35A45D96" ON public."AuditLog" USING btree ("OpName");


--
-- TOC entry 3648 (class 1259 OID 694021)
-- Name: IX_Operator_1683F3E6; Type: INDEX; Schema: public; Owner: system
--

CREATE INDEX "IX_Operator_1683F3E6" ON public."AuditLog" USING btree ("Operator");


--
-- TOC entry 3679 (class 1259 OID 694023)
-- Name: IX_PermissionId_2062840E; Type: INDEX; Schema: public; Owner: system
--

CREATE INDEX "IX_PermissionId_2062840E" ON public."RolePermission" USING btree ("PermissionId");


--
-- TOC entry 3691 (class 1259 OID 694045)
-- Name: IX_RoleId_576FE1D8; Type: INDEX; Schema: public; Owner: system
--

CREATE INDEX "IX_RoleId_576FE1D8" ON public."UserRole" USING btree ("RoleId");


--
-- TOC entry 3673 (class 1259 OID 694022)
-- Name: IX_RoleId_EE4E3A43; Type: INDEX; Schema: public; Owner: system
--

CREATE INDEX "IX_RoleId_EE4E3A43" ON public."ConsumerRole" USING btree ("RoleId");


--
-- TOC entry 3703 (class 1259 OID 694063)
-- Name: IX_SpanId_781FF521; Type: INDEX; Schema: public; Owner: system
--

CREATE INDEX "IX_SpanId_781FF521" ON public."AuditLogDataInfluence" USING btree ("SpanId");


--
-- TOC entry 3649 (class 1259 OID 694042)
-- Name: IX_TraceId_E33D4416; Type: INDEX; Schema: public; Owner: system
--

CREATE INDEX "IX_TraceId_E33D4416" ON public."AuditLog" USING btree ("TraceId");


--
-- TOC entry 3725 (class 1259 OID 694058)
-- Name: Name_AppId_B47ED639; Type: INDEX; Schema: public; Owner: system
--

CREATE INDEX "Name_AppId_B47ED639" ON public."AppNamespace" USING btree ("Name", "AppId");


--
-- TOC entry 3712 (class 1259 OID 694027)
-- Name: SPRING_SESSION_IX2_A2002052; Type: INDEX; Schema: public; Owner: system
--

CREATE INDEX "SPRING_SESSION_IX2_A2002052" ON public."SPRING_SESSION" USING btree ("EXPIRY_TIME");


--
-- TOC entry 3713 (class 1259 OID 694039)
-- Name: SPRING_SESSION_IX3_77A04504; Type: INDEX; Schema: public; Owner: system
--

CREATE INDEX "SPRING_SESSION_IX3_77A04504" ON public."SPRING_SESSION" USING btree ("PRINCIPAL_NAME");


--
-- TOC entry 3730 (class 1259 OID 694474)
-- Name: SPRING_SESSION_copy_EXPIRY_TIME_idx; Type: INDEX; Schema: public; Owner: system
--

CREATE INDEX "SPRING_SESSION_copy_EXPIRY_TIME_idx" ON public.spring_session USING btree (expiry_time);


--
-- TOC entry 3731 (class 1259 OID 694475)
-- Name: SPRING_SESSION_copy_PRINCIPAL_NAME_idx; Type: INDEX; Schema: public; Owner: system
--

CREATE INDEX "SPRING_SESSION_copy_PRINCIPAL_NAME_idx" ON public.spring_session USING btree (principal_name);


--
-- TOC entry 3738 (class 2606 OID 694066)
-- Name: SPRING_SESSION_ATTRIBUTES SPRING_SESSION_ATTRIBUTES_FK_60BD67; Type: FK CONSTRAINT; Schema: public; Owner: system
--

ALTER TABLE ONLY public."SPRING_SESSION_ATTRIBUTES"
    ADD CONSTRAINT "SPRING_SESSION_ATTRIBUTES_FK_60BD67" FOREIGN KEY ("SESSION_PRIMARY_ID") REFERENCES public."SPRING_SESSION"("PRIMARY_ID") ON UPDATE RESTRICT ON DELETE CASCADE;


--
-- TOC entry 3930 (class 0 OID 0)
-- Dependencies: 398
-- Name: FUNCTION qps(); Type: ACL; Schema: pg_catalog; Owner: system
--

REVOKE ALL ON FUNCTION pg_catalog.qps() FROM PUBLIC;
GRANT ALL ON FUNCTION pg_catalog.qps() TO pg_monitor;


--
-- TOC entry 3931 (class 0 OID 0)
-- Dependencies: 397
-- Name: FUNCTION tps(); Type: ACL; Schema: pg_catalog; Owner: system
--

REVOKE ALL ON FUNCTION pg_catalog.tps() FROM PUBLIC;
GRANT ALL ON FUNCTION pg_catalog.tps() TO pg_monitor;


--
-- TOC entry 3932 (class 0 OID 0)
-- Dependencies: 270
-- Name: TABLE pg_triggers; Type: ACL; Schema: pg_catalog; Owner: system
--

GRANT SELECT ON TABLE pg_catalog.pg_triggers TO PUBLIC;


-- Completed on 2024-02-07 14:40:28

--
-- Kingbase database dump complete
--

