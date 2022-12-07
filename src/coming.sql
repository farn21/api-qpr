--
-- PostgreSQL database dump
--

-- Dumped from database version 14.5 (Ubuntu 14.5-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 14.5 (Ubuntu 14.5-0ubuntu0.22.04.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: postgis; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS postgis WITH SCHEMA public;


--
-- Name: EXTENSION postgis; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION postgis IS 'PostGIS geometry and geography spatial types and functions';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: apikey_apikey; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.apikey_apikey (
    id integer NOT NULL,
    key character varying(32) NOT NULL,
    logged_ip inet,
    last_used timestamp with time zone NOT NULL,
    dataset_id integer NOT NULL
);


ALTER TABLE public.apikey_apikey OWNER TO postgres;

--
-- Name: apikey_apikey_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.apikey_apikey_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.apikey_apikey_id_seq OWNER TO postgres;

--
-- Name: apikey_apikey_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.apikey_apikey_id_seq OWNED BY public.apikey_apikey.id;


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO postgres;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO postgres;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: celery_taskmeta; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.celery_taskmeta (
    id integer NOT NULL,
    task_id character varying(255) NOT NULL,
    status character varying(50) NOT NULL,
    result text,
    date_done timestamp with time zone NOT NULL,
    traceback text,
    hidden boolean NOT NULL,
    meta text
);


ALTER TABLE public.celery_taskmeta OWNER TO postgres;

--
-- Name: celery_taskmeta_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.celery_taskmeta_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.celery_taskmeta_id_seq OWNER TO postgres;

--
-- Name: celery_taskmeta_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.celery_taskmeta_id_seq OWNED BY public.celery_taskmeta.id;


--
-- Name: celery_tasksetmeta; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.celery_tasksetmeta (
    id integer NOT NULL,
    taskset_id character varying(255) NOT NULL,
    result text NOT NULL,
    date_done timestamp with time zone NOT NULL,
    hidden boolean NOT NULL
);


ALTER TABLE public.celery_tasksetmeta OWNER TO postgres;

--
-- Name: celery_tasksetmeta_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.celery_tasksetmeta_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.celery_tasksetmeta_id_seq OWNER TO postgres;

--
-- Name: celery_tasksetmeta_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.celery_tasksetmeta_id_seq OWNED BY public.celery_tasksetmeta.id;


--
-- Name: cors_origin; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cors_origin (
    id integer NOT NULL,
    pattern character varying(100) NOT NULL,
    logged_ip inet,
    last_used timestamp with time zone NOT NULL,
    dataset_id integer NOT NULL,
    place_email_template_id integer
);


ALTER TABLE public.cors_origin OWNER TO postgres;

--
-- Name: cors_origin_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cors_origin_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cors_origin_id_seq OWNER TO postgres;

--
-- Name: cors_origin_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cors_origin_id_seq OWNED BY public.cors_origin.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO postgres;

--
-- Name: django_site; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_site (
    id integer NOT NULL,
    domain character varying(100) NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.django_site OWNER TO postgres;

--
-- Name: django_site_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_site_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_site_id_seq OWNER TO postgres;

--
-- Name: django_site_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_site_id_seq OWNED BY public.django_site.id;


--
-- Name: djcelery_crontabschedule; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.djcelery_crontabschedule (
    id integer NOT NULL,
    minute character varying(64) NOT NULL,
    hour character varying(64) NOT NULL,
    day_of_week character varying(64) NOT NULL,
    day_of_month character varying(64) NOT NULL,
    month_of_year character varying(64) NOT NULL
);


ALTER TABLE public.djcelery_crontabschedule OWNER TO postgres;

--
-- Name: djcelery_crontabschedule_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.djcelery_crontabschedule_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.djcelery_crontabschedule_id_seq OWNER TO postgres;

--
-- Name: djcelery_crontabschedule_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.djcelery_crontabschedule_id_seq OWNED BY public.djcelery_crontabschedule.id;


--
-- Name: djcelery_intervalschedule; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.djcelery_intervalschedule (
    id integer NOT NULL,
    every integer NOT NULL,
    period character varying(24) NOT NULL
);


ALTER TABLE public.djcelery_intervalschedule OWNER TO postgres;

--
-- Name: djcelery_intervalschedule_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.djcelery_intervalschedule_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.djcelery_intervalschedule_id_seq OWNER TO postgres;

--
-- Name: djcelery_intervalschedule_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.djcelery_intervalschedule_id_seq OWNED BY public.djcelery_intervalschedule.id;


--
-- Name: djcelery_periodictask; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.djcelery_periodictask (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    task character varying(200) NOT NULL,
    args text NOT NULL,
    kwargs text NOT NULL,
    queue character varying(200),
    exchange character varying(200),
    routing_key character varying(200),
    expires timestamp with time zone,
    enabled boolean NOT NULL,
    last_run_at timestamp with time zone,
    total_run_count integer NOT NULL,
    date_changed timestamp with time zone NOT NULL,
    description text NOT NULL,
    crontab_id integer,
    interval_id integer,
    CONSTRAINT djcelery_periodictask_total_run_count_check CHECK ((total_run_count >= 0))
);


ALTER TABLE public.djcelery_periodictask OWNER TO postgres;

--
-- Name: djcelery_periodictask_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.djcelery_periodictask_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.djcelery_periodictask_id_seq OWNER TO postgres;

--
-- Name: djcelery_periodictask_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.djcelery_periodictask_id_seq OWNED BY public.djcelery_periodictask.id;


--
-- Name: djcelery_periodictasks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.djcelery_periodictasks (
    ident smallint NOT NULL,
    last_update timestamp with time zone NOT NULL
);


ALTER TABLE public.djcelery_periodictasks OWNER TO postgres;

--
-- Name: djcelery_taskstate; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.djcelery_taskstate (
    id integer NOT NULL,
    state character varying(64) NOT NULL,
    task_id character varying(36) NOT NULL,
    name character varying(200),
    tstamp timestamp with time zone NOT NULL,
    args text,
    kwargs text,
    eta timestamp with time zone,
    expires timestamp with time zone,
    result text,
    traceback text,
    runtime double precision,
    retries integer NOT NULL,
    hidden boolean NOT NULL,
    worker_id integer
);


ALTER TABLE public.djcelery_taskstate OWNER TO postgres;

--
-- Name: djcelery_taskstate_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.djcelery_taskstate_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.djcelery_taskstate_id_seq OWNER TO postgres;

--
-- Name: djcelery_taskstate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.djcelery_taskstate_id_seq OWNED BY public.djcelery_taskstate.id;


--
-- Name: djcelery_workerstate; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.djcelery_workerstate (
    id integer NOT NULL,
    hostname character varying(255) NOT NULL,
    last_heartbeat timestamp with time zone
);


ALTER TABLE public.djcelery_workerstate OWNER TO postgres;

--
-- Name: djcelery_workerstate_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.djcelery_workerstate_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.djcelery_workerstate_id_seq OWNER TO postgres;

--
-- Name: djcelery_workerstate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.djcelery_workerstate_id_seq OWNED BY public.djcelery_workerstate.id;


--
-- Name: djkombu_message; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.djkombu_message (
    id integer NOT NULL,
    visible boolean NOT NULL,
    sent_at timestamp with time zone,
    payload text NOT NULL,
    queue_id integer NOT NULL
);


ALTER TABLE public.djkombu_message OWNER TO postgres;

--
-- Name: djkombu_message_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.djkombu_message_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.djkombu_message_id_seq OWNER TO postgres;

--
-- Name: djkombu_message_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.djkombu_message_id_seq OWNED BY public.djkombu_message.id;


--
-- Name: djkombu_queue; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.djkombu_queue (
    id integer NOT NULL,
    name character varying(200) NOT NULL
);


ALTER TABLE public.djkombu_queue OWNER TO postgres;

--
-- Name: djkombu_queue_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.djkombu_queue_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.djkombu_queue_id_seq OWNER TO postgres;

--
-- Name: djkombu_queue_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.djkombu_queue_id_seq OWNED BY public.djkombu_queue.id;


--
-- Name: ms_api_place_tag; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ms_api_place_tag (
    id integer NOT NULL,
    created_datetime timestamp with time zone NOT NULL,
    updated_datetime timestamp with time zone NOT NULL,
    note text NOT NULL,
    submitter_id integer,
    tag_id integer NOT NULL,
    place_id integer NOT NULL
);


ALTER TABLE public.ms_api_place_tag OWNER TO postgres;

--
-- Name: ms_api_place_tag_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ms_api_place_tag_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ms_api_place_tag_id_seq OWNER TO postgres;

--
-- Name: ms_api_place_tag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ms_api_place_tag_id_seq OWNED BY public.ms_api_place_tag.id;


--
-- Name: ms_api_tag; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ms_api_tag (
    id integer NOT NULL,
    name character varying(24) NOT NULL,
    color character varying(7),
    is_enabled boolean NOT NULL,
    dataset_id integer NOT NULL,
    parent_id integer
);


ALTER TABLE public.ms_api_tag OWNER TO postgres;

--
-- Name: ms_api_tag_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ms_api_tag_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ms_api_tag_id_seq OWNER TO postgres;

--
-- Name: ms_api_tag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ms_api_tag_id_seq OWNED BY public.ms_api_tag.id;


--
-- Name: ms_api_tagclosure; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ms_api_tagclosure (
    id integer NOT NULL,
    depth integer NOT NULL,
    child_id integer NOT NULL,
    parent_id integer NOT NULL
);


ALTER TABLE public.ms_api_tagclosure OWNER TO postgres;

--
-- Name: ms_api_tagclosure_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ms_api_tagclosure_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ms_api_tagclosure_id_seq OWNER TO postgres;

--
-- Name: ms_api_tagclosure_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ms_api_tagclosure_id_seq OWNED BY public.ms_api_tagclosure.id;


--
-- Name: oauth2_provider_accesstoken_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.oauth2_provider_accesstoken_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oauth2_provider_accesstoken_id_seq OWNER TO postgres;

--
-- Name: oauth2_provider_accesstoken; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.oauth2_provider_accesstoken (
    id bigint DEFAULT nextval('public.oauth2_provider_accesstoken_id_seq'::regclass) NOT NULL,
    token character varying(255) NOT NULL,
    expires timestamp with time zone NOT NULL,
    scope text NOT NULL,
    application_id bigint,
    user_id integer,
    created timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL
);


ALTER TABLE public.oauth2_provider_accesstoken OWNER TO postgres;

--
-- Name: oauth2_provider_application_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.oauth2_provider_application_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oauth2_provider_application_id_seq OWNER TO postgres;

--
-- Name: oauth2_provider_application; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.oauth2_provider_application (
    id bigint DEFAULT nextval('public.oauth2_provider_application_id_seq'::regclass) NOT NULL,
    client_id character varying(100) NOT NULL,
    redirect_uris text NOT NULL,
    client_type character varying(32) NOT NULL,
    authorization_grant_type character varying(32) NOT NULL,
    client_secret character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    user_id integer,
    skip_authorization boolean NOT NULL,
    created timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL
);


ALTER TABLE public.oauth2_provider_application OWNER TO postgres;

--
-- Name: oauth2_provider_grant_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.oauth2_provider_grant_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oauth2_provider_grant_id_seq OWNER TO postgres;

--
-- Name: oauth2_provider_grant; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.oauth2_provider_grant (
    id bigint DEFAULT nextval('public.oauth2_provider_grant_id_seq'::regclass) NOT NULL,
    code character varying(255) NOT NULL,
    expires timestamp with time zone NOT NULL,
    redirect_uri character varying(255) NOT NULL,
    scope text NOT NULL,
    application_id bigint NOT NULL,
    user_id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL
);


ALTER TABLE public.oauth2_provider_grant OWNER TO postgres;

--
-- Name: oauth2_provider_refreshtoken_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.oauth2_provider_refreshtoken_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oauth2_provider_refreshtoken_id_seq OWNER TO postgres;

--
-- Name: oauth2_provider_refreshtoken; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.oauth2_provider_refreshtoken (
    id bigint DEFAULT nextval('public.oauth2_provider_refreshtoken_id_seq'::regclass) NOT NULL,
    token character varying(255) NOT NULL,
    access_token_id bigint NOT NULL,
    application_id bigint NOT NULL,
    user_id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL
);


ALTER TABLE public.oauth2_provider_refreshtoken OWNER TO postgres;

--
-- Name: remote_client_user_clientpermissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.remote_client_user_clientpermissions (
    id integer NOT NULL,
    allow_remote_signin boolean NOT NULL,
    allow_remote_signup boolean NOT NULL,
    client_id bigint NOT NULL
);


ALTER TABLE public.remote_client_user_clientpermissions OWNER TO postgres;

--
-- Name: remote_client_user_clientpermissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.remote_client_user_clientpermissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.remote_client_user_clientpermissions_id_seq OWNER TO postgres;

--
-- Name: remote_client_user_clientpermissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.remote_client_user_clientpermissions_id_seq OWNED BY public.remote_client_user_clientpermissions.id;


--
-- Name: sa_api_activity; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sa_api_activity (
    id integer NOT NULL,
    created_datetime timestamp with time zone NOT NULL,
    updated_datetime timestamp with time zone NOT NULL,
    action character varying(16) NOT NULL,
    source text,
    data_id integer NOT NULL
);


ALTER TABLE public.sa_api_activity OWNER TO postgres;

--
-- Name: sa_api_activity_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sa_api_activity_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sa_api_activity_id_seq OWNER TO postgres;

--
-- Name: sa_api_activity_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sa_api_activity_id_seq OWNED BY public.sa_api_activity.id;


--
-- Name: sa_api_attachment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sa_api_attachment (
    id integer NOT NULL,
    created_datetime timestamp with time zone NOT NULL,
    updated_datetime timestamp with time zone NOT NULL,
    file character varying(100) NOT NULL,
    name character varying(128),
    visible boolean NOT NULL,
    type character varying(2) NOT NULL,
    thing_id integer NOT NULL
);


ALTER TABLE public.sa_api_attachment OWNER TO postgres;

--
-- Name: sa_api_attachment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sa_api_attachment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sa_api_attachment_id_seq OWNER TO postgres;

--
-- Name: sa_api_attachment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sa_api_attachment_id_seq OWNED BY public.sa_api_attachment.id;


--
-- Name: sa_api_dataset; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sa_api_dataset (
    id integer NOT NULL,
    display_name character varying(128) NOT NULL,
    slug character varying(128) NOT NULL,
    owner_id integer NOT NULL
);


ALTER TABLE public.sa_api_dataset OWNER TO postgres;

--
-- Name: sa_api_dataset_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sa_api_dataset_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sa_api_dataset_id_seq OWNER TO postgres;

--
-- Name: sa_api_dataset_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sa_api_dataset_id_seq OWNED BY public.sa_api_dataset.id;


--
-- Name: sa_api_datasnapshot; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sa_api_datasnapshot (
    id integer NOT NULL,
    json text NOT NULL,
    csv text NOT NULL,
    request_id integer NOT NULL
);


ALTER TABLE public.sa_api_datasnapshot OWNER TO postgres;

--
-- Name: sa_api_datasnapshot_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sa_api_datasnapshot_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sa_api_datasnapshot_id_seq OWNER TO postgres;

--
-- Name: sa_api_datasnapshot_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sa_api_datasnapshot_id_seq OWNED BY public.sa_api_datasnapshot.id;


--
-- Name: sa_api_datasnapshotrequest; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sa_api_datasnapshotrequest (
    id integer NOT NULL,
    submission_set character varying(128) NOT NULL,
    include_private_fields boolean NOT NULL,
    include_private_places boolean NOT NULL,
    include_invisible boolean NOT NULL,
    include_submissions boolean NOT NULL,
    requested_at timestamp with time zone NOT NULL,
    status text NOT NULL,
    fulfilled_at timestamp with time zone,
    guid text NOT NULL,
    dataset_id integer NOT NULL,
    requester_id integer
);


ALTER TABLE public.sa_api_datasnapshotrequest OWNER TO postgres;

--
-- Name: sa_api_datasnapshotrequest_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sa_api_datasnapshotrequest_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sa_api_datasnapshotrequest_id_seq OWNER TO postgres;

--
-- Name: sa_api_datasnapshotrequest_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sa_api_datasnapshotrequest_id_seq OWNED BY public.sa_api_datasnapshotrequest.id;


--
-- Name: sa_api_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sa_api_group (
    id integer NOT NULL,
    name character varying(32) NOT NULL,
    dataset_id integer NOT NULL
);


ALTER TABLE public.sa_api_group OWNER TO postgres;

--
-- Name: sa_api_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sa_api_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sa_api_group_id_seq OWNER TO postgres;

--
-- Name: sa_api_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sa_api_group_id_seq OWNED BY public.sa_api_group.id;


--
-- Name: sa_api_group_submitters; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sa_api_group_submitters (
    id integer NOT NULL,
    group_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.sa_api_group_submitters OWNER TO postgres;

--
-- Name: sa_api_group_submitters_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sa_api_group_submitters_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sa_api_group_submitters_id_seq OWNER TO postgres;

--
-- Name: sa_api_group_submitters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sa_api_group_submitters_id_seq OWNED BY public.sa_api_group_submitters.id;


--
-- Name: sa_api_place; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sa_api_place (
    submittedthing_ptr_id integer NOT NULL,
    geometry public.geometry(Geometry,4326) NOT NULL,
    private boolean NOT NULL
);


ALTER TABLE public.sa_api_place OWNER TO postgres;

--
-- Name: sa_api_place_email_templates; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sa_api_place_email_templates (
    id integer NOT NULL,
    created_datetime timestamp with time zone NOT NULL,
    updated_datetime timestamp with time zone NOT NULL,
    submission_set character varying(128) NOT NULL,
    event character varying(128) NOT NULL,
    recipient_email_field character varying(128) NOT NULL,
    from_email character varying(254) NOT NULL,
    bcc_email_1 character varying(254),
    bcc_email_2 character varying(254),
    bcc_email_3 character varying(254),
    bcc_email_4 character varying(254),
    bcc_email_5 character varying(254),
    subject character varying(512) NOT NULL,
    body_text text NOT NULL,
    body_html text NOT NULL
);


ALTER TABLE public.sa_api_place_email_templates OWNER TO postgres;

--
-- Name: sa_api_place_email_templates_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sa_api_place_email_templates_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sa_api_place_email_templates_id_seq OWNER TO postgres;

--
-- Name: sa_api_place_email_templates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sa_api_place_email_templates_id_seq OWNED BY public.sa_api_place_email_templates.id;


--
-- Name: sa_api_submission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sa_api_submission (
    submittedthing_ptr_id integer NOT NULL,
    set_name text NOT NULL,
    place_model_id integer NOT NULL
);


ALTER TABLE public.sa_api_submission OWNER TO postgres;

--
-- Name: sa_api_submittedthing; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sa_api_submittedthing (
    id integer NOT NULL,
    created_datetime timestamp with time zone NOT NULL,
    updated_datetime timestamp with time zone NOT NULL,
    data text NOT NULL,
    visible boolean NOT NULL,
    dataset_id integer NOT NULL,
    submitter_id integer
);


ALTER TABLE public.sa_api_submittedthing OWNER TO postgres;

--
-- Name: sa_api_submittedthing_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sa_api_submittedthing_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sa_api_submittedthing_id_seq OWNER TO postgres;

--
-- Name: sa_api_submittedthing_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sa_api_submittedthing_id_seq OWNED BY public.sa_api_submittedthing.id;


--
-- Name: sa_api_v2_dataindex; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sa_api_v2_dataindex (
    id integer NOT NULL,
    attr_name character varying(100) NOT NULL,
    attr_type character varying(10) NOT NULL,
    dataset_id integer NOT NULL
);


ALTER TABLE public.sa_api_v2_dataindex OWNER TO postgres;

--
-- Name: sa_api_v2_dataindex_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sa_api_v2_dataindex_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sa_api_v2_dataindex_id_seq OWNER TO postgres;

--
-- Name: sa_api_v2_dataindex_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sa_api_v2_dataindex_id_seq OWNED BY public.sa_api_v2_dataindex.id;


--
-- Name: sa_api_v2_datasetpermission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sa_api_v2_datasetpermission (
    id integer NOT NULL,
    submission_set character varying(128) NOT NULL,
    can_retrieve boolean NOT NULL,
    can_create boolean NOT NULL,
    can_update boolean NOT NULL,
    can_destroy boolean NOT NULL,
    can_access_protected boolean NOT NULL,
    priority integer NOT NULL,
    dataset_id integer NOT NULL,
    CONSTRAINT sa_api_v2_datasetpermission_priority_check CHECK ((priority >= 0))
);


ALTER TABLE public.sa_api_v2_datasetpermission OWNER TO postgres;

--
-- Name: sa_api_v2_datasetpermission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sa_api_v2_datasetpermission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sa_api_v2_datasetpermission_id_seq OWNER TO postgres;

--
-- Name: sa_api_v2_datasetpermission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sa_api_v2_datasetpermission_id_seq OWNED BY public.sa_api_v2_datasetpermission.id;


--
-- Name: sa_api_v2_grouppermission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sa_api_v2_grouppermission (
    id integer NOT NULL,
    submission_set character varying(128) NOT NULL,
    can_retrieve boolean NOT NULL,
    can_create boolean NOT NULL,
    can_update boolean NOT NULL,
    can_destroy boolean NOT NULL,
    can_access_protected boolean NOT NULL,
    priority integer NOT NULL,
    group_id integer NOT NULL,
    CONSTRAINT sa_api_v2_grouppermission_priority_check CHECK ((priority >= 0))
);


ALTER TABLE public.sa_api_v2_grouppermission OWNER TO postgres;

--
-- Name: sa_api_v2_grouppermission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sa_api_v2_grouppermission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sa_api_v2_grouppermission_id_seq OWNER TO postgres;

--
-- Name: sa_api_v2_grouppermission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sa_api_v2_grouppermission_id_seq OWNED BY public.sa_api_v2_grouppermission.id;


--
-- Name: sa_api_v2_indexedvalue; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sa_api_v2_indexedvalue (
    id integer NOT NULL,
    value character varying(100),
    index_id integer NOT NULL,
    thing_id integer NOT NULL
);


ALTER TABLE public.sa_api_v2_indexedvalue OWNER TO postgres;

--
-- Name: sa_api_v2_indexedvalue_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sa_api_v2_indexedvalue_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sa_api_v2_indexedvalue_id_seq OWNER TO postgres;

--
-- Name: sa_api_v2_indexedvalue_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sa_api_v2_indexedvalue_id_seq OWNED BY public.sa_api_v2_indexedvalue.id;


--
-- Name: sa_api_v2_keypermission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sa_api_v2_keypermission (
    id integer NOT NULL,
    submission_set character varying(128) NOT NULL,
    can_retrieve boolean NOT NULL,
    can_create boolean NOT NULL,
    can_update boolean NOT NULL,
    can_destroy boolean NOT NULL,
    can_access_protected boolean NOT NULL,
    priority integer NOT NULL,
    key_id integer NOT NULL,
    CONSTRAINT sa_api_v2_keypermission_priority_check CHECK ((priority >= 0))
);


ALTER TABLE public.sa_api_v2_keypermission OWNER TO postgres;

--
-- Name: sa_api_v2_keypermission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sa_api_v2_keypermission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sa_api_v2_keypermission_id_seq OWNER TO postgres;

--
-- Name: sa_api_v2_keypermission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sa_api_v2_keypermission_id_seq OWNED BY public.sa_api_v2_keypermission.id;


--
-- Name: sa_api_v2_originpermission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sa_api_v2_originpermission (
    id integer NOT NULL,
    submission_set character varying(128) NOT NULL,
    can_retrieve boolean NOT NULL,
    can_create boolean NOT NULL,
    can_update boolean NOT NULL,
    can_destroy boolean NOT NULL,
    can_access_protected boolean NOT NULL,
    priority integer NOT NULL,
    origin_id integer NOT NULL,
    CONSTRAINT sa_api_v2_originpermission_priority_check CHECK ((priority >= 0))
);


ALTER TABLE public.sa_api_v2_originpermission OWNER TO postgres;

--
-- Name: sa_api_v2_originpermission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sa_api_v2_originpermission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sa_api_v2_originpermission_id_seq OWNER TO postgres;

--
-- Name: sa_api_v2_originpermission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sa_api_v2_originpermission_id_seq OWNED BY public.sa_api_v2_originpermission.id;


--
-- Name: sa_api_webhook; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sa_api_webhook (
    id integer NOT NULL,
    created_datetime timestamp with time zone NOT NULL,
    updated_datetime timestamp with time zone NOT NULL,
    submission_set character varying(128) NOT NULL,
    event character varying(128) NOT NULL,
    url character varying(2048) NOT NULL,
    dataset_id integer NOT NULL
);


ALTER TABLE public.sa_api_webhook OWNER TO postgres;

--
-- Name: sa_api_webhook_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sa_api_webhook_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sa_api_webhook_id_seq OWNER TO postgres;

--
-- Name: sa_api_webhook_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sa_api_webhook_id_seq OWNED BY public.sa_api_webhook.id;


--
-- Name: social_auth_association; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.social_auth_association (
    id integer NOT NULL,
    server_url character varying(255) NOT NULL,
    handle character varying(255) NOT NULL,
    secret character varying(255) NOT NULL,
    issued integer NOT NULL,
    lifetime integer NOT NULL,
    assoc_type character varying(64) NOT NULL
);


ALTER TABLE public.social_auth_association OWNER TO postgres;

--
-- Name: social_auth_association_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.social_auth_association_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.social_auth_association_id_seq OWNER TO postgres;

--
-- Name: social_auth_association_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.social_auth_association_id_seq OWNED BY public.social_auth_association.id;


--
-- Name: social_auth_code; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.social_auth_code (
    id integer NOT NULL,
    email character varying(254) NOT NULL,
    code character varying(32) NOT NULL,
    verified boolean NOT NULL,
    "timestamp" timestamp with time zone NOT NULL
);


ALTER TABLE public.social_auth_code OWNER TO postgres;

--
-- Name: social_auth_code_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.social_auth_code_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.social_auth_code_id_seq OWNER TO postgres;

--
-- Name: social_auth_code_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.social_auth_code_id_seq OWNED BY public.social_auth_code.id;


--
-- Name: social_auth_nonce; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.social_auth_nonce (
    id integer NOT NULL,
    server_url character varying(255) NOT NULL,
    "timestamp" integer NOT NULL,
    salt character varying(65) NOT NULL
);


ALTER TABLE public.social_auth_nonce OWNER TO postgres;

--
-- Name: social_auth_nonce_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.social_auth_nonce_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.social_auth_nonce_id_seq OWNER TO postgres;

--
-- Name: social_auth_nonce_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.social_auth_nonce_id_seq OWNED BY public.social_auth_nonce.id;


--
-- Name: social_auth_partial; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.social_auth_partial (
    id integer NOT NULL,
    token character varying(32) NOT NULL,
    next_step smallint NOT NULL,
    backend character varying(32) NOT NULL,
    data text NOT NULL,
    "timestamp" timestamp with time zone NOT NULL,
    CONSTRAINT social_auth_partial_next_step_check CHECK ((next_step >= 0))
);


ALTER TABLE public.social_auth_partial OWNER TO postgres;

--
-- Name: social_auth_partial_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.social_auth_partial_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.social_auth_partial_id_seq OWNER TO postgres;

--
-- Name: social_auth_partial_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.social_auth_partial_id_seq OWNED BY public.social_auth_partial.id;


--
-- Name: social_auth_usersocialauth; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.social_auth_usersocialauth (
    id integer NOT NULL,
    provider character varying(32) NOT NULL,
    uid character varying(255) NOT NULL,
    extra_data text NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.social_auth_usersocialauth OWNER TO postgres;

--
-- Name: social_auth_usersocialauth_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.social_auth_usersocialauth_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.social_auth_usersocialauth_id_seq OWNER TO postgres;

--
-- Name: social_auth_usersocialauth_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.social_auth_usersocialauth_id_seq OWNED BY public.social_auth_usersocialauth.id;


--
-- Name: apikey_apikey id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.apikey_apikey ALTER COLUMN id SET DEFAULT nextval('public.apikey_apikey_id_seq'::regclass);


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: celery_taskmeta id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.celery_taskmeta ALTER COLUMN id SET DEFAULT nextval('public.celery_taskmeta_id_seq'::regclass);


--
-- Name: celery_tasksetmeta id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.celery_tasksetmeta ALTER COLUMN id SET DEFAULT nextval('public.celery_tasksetmeta_id_seq'::regclass);


--
-- Name: cors_origin id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cors_origin ALTER COLUMN id SET DEFAULT nextval('public.cors_origin_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: django_site id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_site ALTER COLUMN id SET DEFAULT nextval('public.django_site_id_seq'::regclass);


--
-- Name: djcelery_crontabschedule id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.djcelery_crontabschedule ALTER COLUMN id SET DEFAULT nextval('public.djcelery_crontabschedule_id_seq'::regclass);


--
-- Name: djcelery_intervalschedule id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.djcelery_intervalschedule ALTER COLUMN id SET DEFAULT nextval('public.djcelery_intervalschedule_id_seq'::regclass);


--
-- Name: djcelery_periodictask id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.djcelery_periodictask ALTER COLUMN id SET DEFAULT nextval('public.djcelery_periodictask_id_seq'::regclass);


--
-- Name: djcelery_taskstate id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.djcelery_taskstate ALTER COLUMN id SET DEFAULT nextval('public.djcelery_taskstate_id_seq'::regclass);


--
-- Name: djcelery_workerstate id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.djcelery_workerstate ALTER COLUMN id SET DEFAULT nextval('public.djcelery_workerstate_id_seq'::regclass);


--
-- Name: djkombu_message id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.djkombu_message ALTER COLUMN id SET DEFAULT nextval('public.djkombu_message_id_seq'::regclass);


--
-- Name: djkombu_queue id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.djkombu_queue ALTER COLUMN id SET DEFAULT nextval('public.djkombu_queue_id_seq'::regclass);


--
-- Name: ms_api_place_tag id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ms_api_place_tag ALTER COLUMN id SET DEFAULT nextval('public.ms_api_place_tag_id_seq'::regclass);


--
-- Name: ms_api_tag id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ms_api_tag ALTER COLUMN id SET DEFAULT nextval('public.ms_api_tag_id_seq'::regclass);


--
-- Name: ms_api_tagclosure id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ms_api_tagclosure ALTER COLUMN id SET DEFAULT nextval('public.ms_api_tagclosure_id_seq'::regclass);


--
-- Name: remote_client_user_clientpermissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.remote_client_user_clientpermissions ALTER COLUMN id SET DEFAULT nextval('public.remote_client_user_clientpermissions_id_seq'::regclass);


--
-- Name: sa_api_activity id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sa_api_activity ALTER COLUMN id SET DEFAULT nextval('public.sa_api_activity_id_seq'::regclass);


--
-- Name: sa_api_attachment id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sa_api_attachment ALTER COLUMN id SET DEFAULT nextval('public.sa_api_attachment_id_seq'::regclass);


--
-- Name: sa_api_dataset id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sa_api_dataset ALTER COLUMN id SET DEFAULT nextval('public.sa_api_dataset_id_seq'::regclass);


--
-- Name: sa_api_datasnapshot id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sa_api_datasnapshot ALTER COLUMN id SET DEFAULT nextval('public.sa_api_datasnapshot_id_seq'::regclass);


--
-- Name: sa_api_datasnapshotrequest id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sa_api_datasnapshotrequest ALTER COLUMN id SET DEFAULT nextval('public.sa_api_datasnapshotrequest_id_seq'::regclass);


--
-- Name: sa_api_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sa_api_group ALTER COLUMN id SET DEFAULT nextval('public.sa_api_group_id_seq'::regclass);


--
-- Name: sa_api_group_submitters id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sa_api_group_submitters ALTER COLUMN id SET DEFAULT nextval('public.sa_api_group_submitters_id_seq'::regclass);


--
-- Name: sa_api_place_email_templates id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sa_api_place_email_templates ALTER COLUMN id SET DEFAULT nextval('public.sa_api_place_email_templates_id_seq'::regclass);


--
-- Name: sa_api_submittedthing id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sa_api_submittedthing ALTER COLUMN id SET DEFAULT nextval('public.sa_api_submittedthing_id_seq'::regclass);


--
-- Name: sa_api_v2_dataindex id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sa_api_v2_dataindex ALTER COLUMN id SET DEFAULT nextval('public.sa_api_v2_dataindex_id_seq'::regclass);


--
-- Name: sa_api_v2_datasetpermission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sa_api_v2_datasetpermission ALTER COLUMN id SET DEFAULT nextval('public.sa_api_v2_datasetpermission_id_seq'::regclass);


--
-- Name: sa_api_v2_grouppermission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sa_api_v2_grouppermission ALTER COLUMN id SET DEFAULT nextval('public.sa_api_v2_grouppermission_id_seq'::regclass);


--
-- Name: sa_api_v2_indexedvalue id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sa_api_v2_indexedvalue ALTER COLUMN id SET DEFAULT nextval('public.sa_api_v2_indexedvalue_id_seq'::regclass);


--
-- Name: sa_api_v2_keypermission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sa_api_v2_keypermission ALTER COLUMN id SET DEFAULT nextval('public.sa_api_v2_keypermission_id_seq'::regclass);


--
-- Name: sa_api_v2_originpermission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sa_api_v2_originpermission ALTER COLUMN id SET DEFAULT nextval('public.sa_api_v2_originpermission_id_seq'::regclass);


--
-- Name: sa_api_webhook id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sa_api_webhook ALTER COLUMN id SET DEFAULT nextval('public.sa_api_webhook_id_seq'::regclass);


--


--
-- Name: social_auth_association id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.social_auth_association ALTER COLUMN id SET DEFAULT nextval('public.social_auth_association_id_seq'::regclass);


--
-- Name: social_auth_code id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.social_auth_code ALTER COLUMN id SET DEFAULT nextval('public.social_auth_code_id_seq'::regclass);


--
-- Name: social_auth_nonce id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.social_auth_nonce ALTER COLUMN id SET DEFAULT nextval('public.social_auth_nonce_id_seq'::regclass);


--
-- Name: social_auth_partial id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.social_auth_partial ALTER COLUMN id SET DEFAULT nextval('public.social_auth_partial_id_seq'::regclass);


--
-- Name: social_auth_usersocialauth id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.social_auth_usersocialauth ALTER COLUMN id SET DEFAULT nextval('public.social_auth_usersocialauth_id_seq'::regclass);


--
-- Data for Name: apikey_apikey; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.apikey_apikey (id, key, logged_ip, last_used, dataset_id) FROM stdin;
\.


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add group	1	add_group
2	Can change group	1	change_group
3	Can delete group	1	delete_group
4	Can add permission	2	add_permission
5	Can change permission	2	change_permission
6	Can delete permission	2	delete_permission
7	Can add content type	3	add_contenttype
8	Can change content type	3	change_contenttype
9	Can delete content type	3	delete_contenttype
10	Can add session	4	add_session
11	Can change session	4	change_session
12	Can delete session	4	delete_session
13	Can add site	5	add_site
14	Can change site	5	change_site
15	Can delete site	5	delete_site
16	Can add log entry	6	add_logentry
17	Can change log entry	6	change_logentry
18	Can delete log entry	6	delete_logentry
19	Can add nonce	7	add_nonce
20	Can change nonce	7	change_nonce
21	Can delete nonce	7	delete_nonce
22	Can add user social auth	8	add_usersocialauth
23	Can change user social auth	8	change_usersocialauth
24	Can delete user social auth	8	delete_usersocialauth
25	Can add association	9	add_association
26	Can change association	9	change_association
27	Can delete association	9	delete_association
28	Can add code	10	add_code
29	Can change code	10	change_code
30	Can delete code	10	delete_code
31	Can add partial	11	add_partial
32	Can change partial	11	change_partial
33	Can delete partial	11	delete_partial
34	Can add periodic task	12	add_periodictask
35	Can change periodic task	12	change_periodictask
36	Can delete periodic task	12	delete_periodictask
37	Can add crontab	13	add_crontabschedule
38	Can change crontab	13	change_crontabschedule
39	Can delete crontab	13	delete_crontabschedule
40	Can add interval	14	add_intervalschedule
41	Can change interval	14	change_intervalschedule
42	Can delete interval	14	delete_intervalschedule
43	Can add periodic tasks	15	add_periodictasks
44	Can change periodic tasks	15	change_periodictasks
45	Can delete periodic tasks	15	delete_periodictasks
46	Can add task state	16	add_taskmeta
47	Can change task state	16	change_taskmeta
48	Can delete task state	16	delete_taskmeta
49	Can add saved group result	17	add_tasksetmeta
50	Can change saved group result	17	change_tasksetmeta
51	Can delete saved group result	17	delete_tasksetmeta
52	Can add worker	18	add_workerstate
53	Can change worker	18	change_workerstate
54	Can delete worker	18	delete_workerstate
55	Can add task	19	add_taskstate
56	Can change task	19	change_taskstate
57	Can delete task	19	delete_taskstate
58	Can add grant	20	add_grant
59	Can change grant	20	change_grant
60	Can delete grant	20	delete_grant
61	Can add access token	21	add_accesstoken
62	Can change access token	21	change_accesstoken
63	Can delete access token	21	delete_accesstoken
64	Can add application	22	add_application
65	Can change application	22	change_application
66	Can delete application	22	delete_application
67	Can add refresh token	23	add_refreshtoken
68	Can change refresh token	23	change_refreshtoken
69	Can delete refresh token	23	delete_refreshtoken
70	Can add cors model	24	add_corsmodel
71	Can change cors model	24	change_corsmodel
72	Can delete cors model	24	delete_corsmodel
73	Can add origin	25	add_origin
74	Can change origin	25	change_origin
75	Can delete origin	25	delete_origin
76	Can add api key	26	add_apikey
77	Can change api key	26	change_apikey
78	Can delete api key	26	delete_apikey
79	Can add data snapshot request	27	add_datasnapshotrequest
80	Can change data snapshot request	27	change_datasnapshotrequest
81	Can delete data snapshot request	27	delete_datasnapshotrequest
82	Can add group	28	add_group
83	Can change group	28	change_group
84	Can delete group	28	delete_group
85	Can add place tag	29	add_placetag
86	Can change place tag	29	change_placetag
87	Can delete place tag	29	delete_placetag
88	Can add data set permission	30	add_datasetpermission
89	Can change data set permission	30	change_datasetpermission
90	Can delete data set permission	30	delete_datasetpermission
91	Can add attachment	31	add_attachment
92	Can change attachment	31	change_attachment
93	Can delete attachment	31	delete_attachment
94	Can add action	32	add_action
95	Can change action	32	change_action
96	Can delete action	32	delete_action
97	Can add indexed value	33	add_indexedvalue
98	Can change indexed value	33	change_indexedvalue
99	Can delete indexed value	33	delete_indexedvalue
100	Can add key permission	34	add_keypermission
101	Can change key permission	34	change_keypermission
102	Can delete key permission	34	delete_keypermission
103	Can add data set	35	add_dataset
104	Can change data set	35	change_dataset
105	Can delete data set	35	delete_dataset
106	Can add tag closure	36	add_tagclosure
107	Can change tag closure	36	change_tagclosure
108	Can delete tag closure	36	delete_tagclosure
109	Can add master	37	add_master
110	Can change master	37	change_master
111	Can delete master	37	delete_master
112	Can add user	38	add_user
113	Can change user	38	change_user
114	Can delete user	38	delete_user
115	Can add group permission	39	add_grouppermission
116	Can change group permission	39	change_grouppermission
117	Can delete group permission	39	delete_grouppermission
118	Can add webhook	40	add_webhook
119	Can change webhook	40	change_webhook
120	Can delete webhook	40	delete_webhook
121	Can add place email template	41	add_placeemailtemplate
122	Can change place email template	41	change_placeemailtemplate
123	Can delete place email template	41	delete_placeemailtemplate
124	Can add data snapshot	42	add_datasnapshot
125	Can change data snapshot	42	change_datasnapshot
126	Can delete data snapshot	42	delete_datasnapshot
127	Can add tag	43	add_tag
128	Can change tag	43	change_tag
129	Can delete tag	43	delete_tag
130	Can add origin permission	44	add_originpermission
131	Can change origin permission	44	change_originpermission
132	Can delete origin permission	44	delete_originpermission
133	Can add submitted thing	45	add_submittedthing
134	Can change submitted thing	45	change_submittedthing
135	Can delete submitted thing	45	delete_submittedthing
136	Can add data index	46	add_dataindex
137	Can change data index	46	change_dataindex
138	Can delete data index	46	delete_dataindex
139	Can add submission	47	add_submission
140	Can change submission	47	change_submission
141	Can delete submission	47	delete_submission
142	Can add place	48	add_place
143	Can change place	48	change_place
144	Can delete place	48	delete_place
145	Can add client permissions	49	add_clientpermissions
146	Can change client permissions	49	change_clientpermissions
147	Can delete client permissions	49	delete_clientpermissions
148	Can add message	50	add_message
149	Can change message	50	change_message
150	Can delete message	50	delete_message
151	Can add queue	51	add_queue
152	Can change queue	51	change_queue
153	Can delete queue	51	delete_queue
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: celery_taskmeta; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.celery_taskmeta (id, task_id, status, result, date_done, traceback, hidden, meta) FROM stdin;
\.


--
-- Data for Name: celery_tasksetmeta; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.celery_tasksetmeta (id, taskset_id, result, date_done, hidden) FROM stdin;
\.


--
-- Data for Name: cors_origin; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cors_origin (id, pattern, logged_ip, last_used, dataset_id, place_email_template_id) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	auth	group
2	auth	permission
3	contenttypes	contenttype
4	sessions	session
5	sites	site
6	admin	logentry
7	social_django	nonce
8	social_django	usersocialauth
9	social_django	association
10	social_django	code
11	social_django	partial
12	djcelery	periodictask
13	djcelery	crontabschedule
14	djcelery	intervalschedule
15	djcelery	periodictasks
16	djcelery	taskmeta
17	djcelery	tasksetmeta
18	djcelery	workerstate
19	djcelery	taskstate
20	oauth2_provider	grant
21	oauth2_provider	accesstoken
22	oauth2_provider	application
23	oauth2_provider	refreshtoken
24	corsheaders	corsmodel
25	sa_api_v2	origin
26	sa_api_v2	apikey
27	sa_api_v2	datasnapshotrequest
28	sa_api_v2	group
29	sa_api_v2	placetag
30	sa_api_v2	datasetpermission
31	sa_api_v2	attachment
32	sa_api_v2	action
33	sa_api_v2	indexedvalue
34	sa_api_v2	keypermission
35	sa_api_v2	dataset
36	sa_api_v2	tagclosure
37	sa_api_v2	master
38	sa_api_v2	user
39	sa_api_v2	grouppermission
40	sa_api_v2	webhook
41	sa_api_v2	placeemailtemplate
42	sa_api_v2	datasnapshot
43	sa_api_v2	tag
44	sa_api_v2	originpermission
45	sa_api_v2	submittedthing
46	sa_api_v2	dataindex
47	sa_api_v2	submission
48	sa_api_v2	place
49	remote_client_user	clientpermissions
50	kombu_transport_django	message
51	kombu_transport_django	queue
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2022-11-19 02:31:40.753571-03
2	contenttypes	0002_remove_content_type_name	2022-11-19 02:31:40.766197-03
3	auth	0001_initial	2022-11-19 02:31:40.808292-03
4	auth	0002_alter_permission_name_max_length	2022-11-19 02:31:40.816813-03
5	auth	0003_alter_user_email_max_length	2022-11-19 02:31:40.827138-03
6	auth	0004_alter_user_username_opts	2022-11-19 02:31:40.837063-03
7	auth	0005_alter_user_last_login_null	2022-11-19 02:31:40.846352-03
8	auth	0006_require_contenttypes_0002	2022-11-19 02:31:40.848668-03
9	auth	0007_alter_validators_add_error_messages	2022-11-19 02:31:40.858427-03
10	auth	0008_alter_user_username_max_length	2022-11-19 02:31:40.867993-03
11	sa_api_v2	0001_initial	2022-11-19 02:31:41.834366-03
12	admin	0001_initial	2022-11-19 02:31:41.884104-03
13	admin	0002_logentry_remove_auto_add	2022-11-19 02:31:41.928085-03
14	djcelery	0001_initial	2022-11-19 02:31:42.030882-03
15	kombu_transport_django	0001_initial	2022-11-19 02:31:42.065516-03
16	oauth2_provider	0001_initial	2022-11-19 02:31:42.27516-03
17	oauth2_provider	0002_08_updates	2022-11-19 02:31:42.433543-03
18	oauth2_provider	0003_auto_20160316_1503	2022-11-19 02:31:42.488959-03
19	oauth2_provider	0004_auto_20160525_1623	2022-11-19 02:31:42.667071-03
20	oauth2_provider	0005_auto_20170514_1141	2022-11-19 02:31:43.597116-03
21	remote_client_user	0001_initial	2022-11-19 02:31:43.727575-03
22	sessions	0001_initial	2022-11-19 02:31:43.74044-03
23	sites	0001_initial	2022-11-19 02:31:43.75113-03
24	sites	0002_alter_domain_unique	2022-11-19 02:31:43.763596-03
25	default	0001_initial	2022-11-19 02:31:43.904688-03
26	social_auth	0001_initial	2022-11-19 02:31:43.906704-03
27	default	0002_add_related_name	2022-11-19 02:31:43.967469-03
28	social_auth	0002_add_related_name	2022-11-19 02:31:43.969858-03
29	default	0003_alter_email_max_length	2022-11-19 02:31:43.980249-03
30	social_auth	0003_alter_email_max_length	2022-11-19 02:31:43.982558-03
31	default	0004_auto_20160423_0400	2022-11-19 02:31:44.035356-03
32	social_auth	0004_auto_20160423_0400	2022-11-19 02:31:44.037808-03
33	social_auth	0005_auto_20160727_2333	2022-11-19 02:31:44.048949-03
34	social_django	0006_partial	2022-11-19 02:31:44.064439-03
35	social_django	0007_code_timestamp	2022-11-19 02:31:44.077352-03
36	social_django	0008_partial_timestamp	2022-11-19 02:31:44.089655-03
37	social_django	0002_add_related_name	2022-11-19 02:31:44.094069-03
38	social_django	0003_alter_email_max_length	2022-11-19 02:31:44.096802-03
39	social_django	0001_initial	2022-11-19 02:31:44.099634-03
40	social_django	0004_auto_20160423_0400	2022-11-19 02:31:44.102141-03
41	social_django	0005_auto_20160727_2333	2022-11-19 02:31:44.10444-03
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
\.


--
-- Data for Name: django_site; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_site (id, domain, name) FROM stdin;
1	example.com	example.com
\.


--
-- Data for Name: djcelery_crontabschedule; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.djcelery_crontabschedule (id, minute, hour, day_of_week, day_of_month, month_of_year) FROM stdin;
\.


--
-- Data for Name: djcelery_intervalschedule; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.djcelery_intervalschedule (id, every, period) FROM stdin;
\.


--
-- Data for Name: djcelery_periodictask; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.djcelery_periodictask (id, name, task, args, kwargs, queue, exchange, routing_key, expires, enabled, last_run_at, total_run_count, date_changed, description, crontab_id, interval_id) FROM stdin;
\.


--
-- Data for Name: djcelery_periodictasks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.djcelery_periodictasks (ident, last_update) FROM stdin;
\.


--
-- Data for Name: djcelery_taskstate; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.djcelery_taskstate (id, state, task_id, name, tstamp, args, kwargs, eta, expires, result, traceback, runtime, retries, hidden, worker_id) FROM stdin;
\.


--
-- Data for Name: djcelery_workerstate; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.djcelery_workerstate (id, hostname, last_heartbeat) FROM stdin;
\.


--
-- Data for Name: djkombu_message; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.djkombu_message (id, visible, sent_at, payload, queue_id) FROM stdin;
\.


--
-- Data for Name: djkombu_queue; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.djkombu_queue (id, name) FROM stdin;
\.


--
-- Data for Name: ms_api_place_tag; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ms_api_place_tag (id, created_datetime, updated_datetime, note, submitter_id, tag_id, place_id) FROM stdin;
\.


--
-- Data for Name: ms_api_tag; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ms_api_tag (id, name, color, is_enabled, dataset_id, parent_id) FROM stdin;
\.


--
-- Data for Name: ms_api_tagclosure; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ms_api_tagclosure (id, depth, child_id, parent_id) FROM stdin;
\.


--
-- Data for Name: oauth2_provider_accesstoken; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.oauth2_provider_accesstoken (id, token, expires, scope, application_id, user_id, created, updated) FROM stdin;
\.


--
-- Data for Name: oauth2_provider_application; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.oauth2_provider_application (id, client_id, redirect_uris, client_type, authorization_grant_type, client_secret, name, user_id, skip_authorization, created, updated) FROM stdin;
\.


--
-- Data for Name: oauth2_provider_grant; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.oauth2_provider_grant (id, code, expires, redirect_uri, scope, application_id, user_id, created, updated) FROM stdin;
\.


--
-- Data for Name: oauth2_provider_refreshtoken; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.oauth2_provider_refreshtoken (id, token, access_token_id, application_id, user_id, created, updated) FROM stdin;
\.


--
-- Data for Name: remote_client_user_clientpermissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.remote_client_user_clientpermissions (id, allow_remote_signin, allow_remote_signup, client_id) FROM stdin;
\.


--
-- Data for Name: sa_api_activity; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sa_api_activity (id, created_datetime, updated_datetime, action, source, data_id) FROM stdin;
\.


--
-- Data for Name: sa_api_attachment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sa_api_attachment (id, created_datetime, updated_datetime, file, name, visible, type, thing_id) FROM stdin;
\.


--
-- Data for Name: sa_api_dataset; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sa_api_dataset (id, display_name, slug, owner_id) FROM stdin;
\.


--
-- Data for Name: sa_api_datasnapshot; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sa_api_datasnapshot (id, json, csv, request_id) FROM stdin;
\.


--
-- Data for Name: sa_api_datasnapshotrequest; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sa_api_datasnapshotrequest (id, submission_set, include_private_fields, include_private_places, include_invisible, include_submissions, requested_at, status, fulfilled_at, guid, dataset_id, requester_id) FROM stdin;
\.


--
-- Data for Name: sa_api_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sa_api_group (id, name, dataset_id) FROM stdin;
\.


--
-- Data for Name: sa_api_group_submitters; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sa_api_group_submitters (id, group_id, user_id) FROM stdin;
\.


--
-- Data for Name: sa_api_place; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sa_api_place (submittedthing_ptr_id, geometry, private) FROM stdin;
\.


--
-- Data for Name: sa_api_place_email_templates; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sa_api_place_email_templates (id, created_datetime, updated_datetime, submission_set, event, recipient_email_field, from_email, bcc_email_1, bcc_email_2, bcc_email_3, bcc_email_4, bcc_email_5, subject, body_text, body_html) FROM stdin;
\.


--
-- Data for Name: sa_api_submission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sa_api_submission (submittedthing_ptr_id, set_name, place_model_id) FROM stdin;
\.


--
-- Data for Name: sa_api_submittedthing; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sa_api_submittedthing (id, created_datetime, updated_datetime, data, visible, dataset_id, submitter_id) FROM stdin;
\.


--
-- Data for Name: sa_api_v2_dataindex; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sa_api_v2_dataindex (id, attr_name, attr_type, dataset_id) FROM stdin;
\.


--
-- Data for Name: sa_api_v2_datasetpermission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sa_api_v2_datasetpermission (id, submission_set, can_retrieve, can_create, can_update, can_destroy, can_access_protected, priority, dataset_id) FROM stdin;
\.


--
-- Data for Name: sa_api_v2_grouppermission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sa_api_v2_grouppermission (id, submission_set, can_retrieve, can_create, can_update, can_destroy, can_access_protected, priority, group_id) FROM stdin;
\.


--
-- Data for Name: sa_api_v2_indexedvalue; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sa_api_v2_indexedvalue (id, value, index_id, thing_id) FROM stdin;
\.


--
-- Data for Name: sa_api_v2_keypermission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sa_api_v2_keypermission (id, submission_set, can_retrieve, can_create, can_update, can_destroy, can_access_protected, priority, key_id) FROM stdin;
\.


--
-- Data for Name: sa_api_v2_originpermission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sa_api_v2_originpermission (id, submission_set, can_retrieve, can_create, can_update, can_destroy, can_access_protected, priority, origin_id) FROM stdin;
\.


--
-- Data for Name: sa_api_webhook; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sa_api_webhook (id, created_datetime, updated_datetime, submission_set, event, url, dataset_id) FROM stdin;
\.


--
-- Data for Name: sa_apiv2_master; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sa_apiv2_master (id, visible, agua_calidad, biodiversidad_especies, cuerpo_agua, datetime_field, estado_agua_clara, estado_agua_registro, estado_color_agua, estado_materiales_cuales, estado_materiales_flotantes, estado_olores_agua, entorno_cuerpo_agua, fuente_contaminacion_cercana, fuentes_opcion, lluvias_observacion, lluvias_observacion_opcion, location_type, nivel_agua_cuerpo, private_address, referencia_cercana, reportes_estado_area, subbasin_name, subbasin_name_nombre, vegetacion_cuerpo_agua, vegetacion_cuerpo_agua_option, vegetacion_margenes_cuerpo, vegetacion_opcion, vientos_fuertes, visitas, image, dataset_id) FROM stdin;
\.


--
-- Data for Name: social_auth_association; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.social_auth_association (id, server_url, handle, secret, issued, lifetime, assoc_type) FROM stdin;
\.


--
-- Data for Name: social_auth_code; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.social_auth_code (id, email, code, verified, "timestamp") FROM stdin;
\.


--
-- Data for Name: social_auth_nonce; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.social_auth_nonce (id, server_url, "timestamp", salt) FROM stdin;
\.


--
-- Data for Name: social_auth_partial; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.social_auth_partial (id, token, next_step, backend, data, "timestamp") FROM stdin;
\.


--
-- Data for Name: social_auth_usersocialauth; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.social_auth_usersocialauth (id, provider, uid, extra_data, user_id) FROM stdin;
\.


--
-- Data for Name: spatial_ref_sys; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spatial_ref_sys (srid, auth_name, auth_srid, srtext, proj4text) FROM stdin;
\.


--
-- Name: apikey_apikey_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.apikey_apikey_id_seq', 1, false);


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 153, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 1, false);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: celery_taskmeta_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.celery_taskmeta_id_seq', 1, false);


--
-- Name: celery_tasksetmeta_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.celery_tasksetmeta_id_seq', 1, false);


--
-- Name: cors_origin_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cors_origin_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 51, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 41, true);


--
-- Name: django_site_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_site_id_seq', 1, true);


--
-- Name: djcelery_crontabschedule_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.djcelery_crontabschedule_id_seq', 1, false);


--
-- Name: djcelery_intervalschedule_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.djcelery_intervalschedule_id_seq', 1, false);


--
-- Name: djcelery_periodictask_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.djcelery_periodictask_id_seq', 1, false);


--
-- Name: djcelery_taskstate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.djcelery_taskstate_id_seq', 1, false);


--
-- Name: djcelery_workerstate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.djcelery_workerstate_id_seq', 1, false);


--
-- Name: djkombu_message_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.djkombu_message_id_seq', 1, false);


--
-- Name: djkombu_queue_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.djkombu_queue_id_seq', 1, false);


--
-- Name: ms_api_place_tag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ms_api_place_tag_id_seq', 1, false);


--
-- Name: ms_api_tag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ms_api_tag_id_seq', 1, false);


--
-- Name: ms_api_tagclosure_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ms_api_tagclosure_id_seq', 1, false);


--
-- Name: oauth2_provider_accesstoken_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.oauth2_provider_accesstoken_id_seq', 1, false);


--
-- Name: oauth2_provider_application_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.oauth2_provider_application_id_seq', 1, false);


--
-- Name: oauth2_provider_grant_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.oauth2_provider_grant_id_seq', 1, false);


--
-- Name: oauth2_provider_refreshtoken_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.oauth2_provider_refreshtoken_id_seq', 1, false);


--
-- Name: remote_client_user_clientpermissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.remote_client_user_clientpermissions_id_seq', 1, false);


--
-- Name: sa_api_activity_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sa_api_activity_id_seq', 1, false);


--
-- Name: sa_api_attachment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sa_api_attachment_id_seq', 1, false);


--
-- Name: sa_api_dataset_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sa_api_dataset_id_seq', 1, false);


--
-- Name: sa_api_datasnapshot_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sa_api_datasnapshot_id_seq', 1, false);


--
-- Name: sa_api_datasnapshotrequest_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sa_api_datasnapshotrequest_id_seq', 1, false);


--
-- Name: sa_api_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sa_api_group_id_seq', 1, false);


--
-- Name: sa_api_group_submitters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sa_api_group_submitters_id_seq', 1, false);


--
-- Name: sa_api_place_email_templates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sa_api_place_email_templates_id_seq', 1, false);


--
-- Name: sa_api_submittedthing_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sa_api_submittedthing_id_seq', 1, false);


--
-- Name: sa_api_v2_dataindex_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sa_api_v2_dataindex_id_seq', 1, false);


--
-- Name: sa_api_v2_datasetpermission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sa_api_v2_datasetpermission_id_seq', 1, false);


--
-- Name: sa_api_v2_grouppermission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sa_api_v2_grouppermission_id_seq', 1, false);


--
-- Name: sa_api_v2_indexedvalue_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sa_api_v2_indexedvalue_id_seq', 1, false);


--
-- Name: sa_api_v2_keypermission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sa_api_v2_keypermission_id_seq', 1, false);


--
-- Name: sa_api_v2_originpermission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sa_api_v2_originpermission_id_seq', 1, false);


--
-- Name: sa_api_webhook_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sa_api_webhook_id_seq', 1, false);


--
-- Name: sa_apiv2_master_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sa_apiv2_master_id_seq', 1, false);


--
-- Name: social_auth_association_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.social_auth_association_id_seq', 1, false);


--
-- Name: social_auth_code_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.social_auth_code_id_seq', 1, false);


--
-- Name: social_auth_nonce_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.social_auth_nonce_id_seq', 1, false);


--
-- Name: social_auth_partial_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.social_auth_partial_id_seq', 1, false);


--
-- Name: social_auth_usersocialauth_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.social_auth_usersocialauth_id_seq', 1, false);


--
-- Name: apikey_apikey apikey_apikey_key_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.apikey_apikey
    ADD CONSTRAINT apikey_apikey_key_key UNIQUE (key);


--
-- Name: apikey_apikey apikey_apikey_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.apikey_apikey
    ADD CONSTRAINT apikey_apikey_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: celery_taskmeta celery_taskmeta_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.celery_taskmeta
    ADD CONSTRAINT celery_taskmeta_pkey PRIMARY KEY (id);


--
-- Name: celery_taskmeta celery_taskmeta_task_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.celery_taskmeta
    ADD CONSTRAINT celery_taskmeta_task_id_key UNIQUE (task_id);


--
-- Name: celery_tasksetmeta celery_tasksetmeta_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.celery_tasksetmeta
    ADD CONSTRAINT celery_tasksetmeta_pkey PRIMARY KEY (id);


--
-- Name: celery_tasksetmeta celery_tasksetmeta_taskset_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.celery_tasksetmeta
    ADD CONSTRAINT celery_tasksetmeta_taskset_id_key UNIQUE (taskset_id);


--
-- Name: cors_origin cors_origin_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cors_origin
    ADD CONSTRAINT cors_origin_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: django_site django_site_domain_a2e37b91_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_site
    ADD CONSTRAINT django_site_domain_a2e37b91_uniq UNIQUE (domain);


--
-- Name: django_site django_site_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_site
    ADD CONSTRAINT django_site_pkey PRIMARY KEY (id);


--
-- Name: djcelery_crontabschedule djcelery_crontabschedule_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.djcelery_crontabschedule
    ADD CONSTRAINT djcelery_crontabschedule_pkey PRIMARY KEY (id);


--
-- Name: djcelery_intervalschedule djcelery_intervalschedule_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.djcelery_intervalschedule
    ADD CONSTRAINT djcelery_intervalschedule_pkey PRIMARY KEY (id);


--
-- Name: djcelery_periodictask djcelery_periodictask_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.djcelery_periodictask
    ADD CONSTRAINT djcelery_periodictask_name_key UNIQUE (name);


--
-- Name: djcelery_periodictask djcelery_periodictask_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.djcelery_periodictask
    ADD CONSTRAINT djcelery_periodictask_pkey PRIMARY KEY (id);


--
-- Name: djcelery_periodictasks djcelery_periodictasks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.djcelery_periodictasks
    ADD CONSTRAINT djcelery_periodictasks_pkey PRIMARY KEY (ident);


--
-- Name: djcelery_taskstate djcelery_taskstate_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.djcelery_taskstate
    ADD CONSTRAINT djcelery_taskstate_pkey PRIMARY KEY (id);


--
-- Name: djcelery_taskstate djcelery_taskstate_task_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.djcelery_taskstate
    ADD CONSTRAINT djcelery_taskstate_task_id_key UNIQUE (task_id);


--
-- Name: djcelery_workerstate djcelery_workerstate_hostname_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.djcelery_workerstate
    ADD CONSTRAINT djcelery_workerstate_hostname_key UNIQUE (hostname);


--
-- Name: djcelery_workerstate djcelery_workerstate_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.djcelery_workerstate
    ADD CONSTRAINT djcelery_workerstate_pkey PRIMARY KEY (id);


--
-- Name: djkombu_message djkombu_message_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.djkombu_message
    ADD CONSTRAINT djkombu_message_pkey PRIMARY KEY (id);


--
-- Name: djkombu_queue djkombu_queue_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.djkombu_queue
    ADD CONSTRAINT djkombu_queue_name_key UNIQUE (name);


--
-- Name: djkombu_queue djkombu_queue_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.djkombu_queue
    ADD CONSTRAINT djkombu_queue_pkey PRIMARY KEY (id);


--
-- Name: ms_api_place_tag ms_api_place_tag_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ms_api_place_tag
    ADD CONSTRAINT ms_api_place_tag_pkey PRIMARY KEY (id);


--
-- Name: ms_api_tag ms_api_tag_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ms_api_tag
    ADD CONSTRAINT ms_api_tag_pkey PRIMARY KEY (id);


--
-- Name: ms_api_tagclosure ms_api_tagclosure_parent_id_a702e50b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ms_api_tagclosure
    ADD CONSTRAINT ms_api_tagclosure_parent_id_a702e50b_uniq UNIQUE (parent_id, child_id);


--
-- Name: ms_api_tagclosure ms_api_tagclosure_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ms_api_tagclosure
    ADD CONSTRAINT ms_api_tagclosure_pkey PRIMARY KEY (id);


--
-- Name: oauth2_provider_accesstoken oauth2_provider_accesstoken_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth2_provider_accesstoken
    ADD CONSTRAINT oauth2_provider_accesstoken_pkey PRIMARY KEY (id);


--
-- Name: oauth2_provider_accesstoken oauth2_provider_accesstoken_token_8af090f8_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth2_provider_accesstoken
    ADD CONSTRAINT oauth2_provider_accesstoken_token_8af090f8_uniq UNIQUE (token);


--
-- Name: oauth2_provider_application oauth2_provider_application_client_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth2_provider_application
    ADD CONSTRAINT oauth2_provider_application_client_id_key UNIQUE (client_id);


--
-- Name: oauth2_provider_application oauth2_provider_application_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth2_provider_application
    ADD CONSTRAINT oauth2_provider_application_pkey PRIMARY KEY (id);


--
-- Name: oauth2_provider_grant oauth2_provider_grant_code_49ab4ddf_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth2_provider_grant
    ADD CONSTRAINT oauth2_provider_grant_code_49ab4ddf_uniq UNIQUE (code);


--
-- Name: oauth2_provider_grant oauth2_provider_grant_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth2_provider_grant
    ADD CONSTRAINT oauth2_provider_grant_pkey PRIMARY KEY (id);


--
-- Name: oauth2_provider_refreshtoken oauth2_provider_refreshtoken_access_token_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth2_provider_refreshtoken
    ADD CONSTRAINT oauth2_provider_refreshtoken_access_token_id_key UNIQUE (access_token_id);


--
-- Name: oauth2_provider_refreshtoken oauth2_provider_refreshtoken_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth2_provider_refreshtoken
    ADD CONSTRAINT oauth2_provider_refreshtoken_pkey PRIMARY KEY (id);


--
-- Name: oauth2_provider_refreshtoken oauth2_provider_refreshtoken_token_d090daa4_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth2_provider_refreshtoken
    ADD CONSTRAINT oauth2_provider_refreshtoken_token_d090daa4_uniq UNIQUE (token);


--
-- Name: remote_client_user_clientpermissions remote_client_user_clientpermissions_client_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.remote_client_user_clientpermissions
    ADD CONSTRAINT remote_client_user_clientpermissions_client_id_key UNIQUE (client_id);


--
-- Name: remote_client_user_clientpermissions remote_client_user_clientpermissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.remote_client_user_clientpermissions
    ADD CONSTRAINT remote_client_user_clientpermissions_pkey PRIMARY KEY (id);


--
-- Name: sa_api_activity sa_api_activity_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sa_api_activity
    ADD CONSTRAINT sa_api_activity_pkey PRIMARY KEY (id);


--
-- Name: sa_api_attachment sa_api_attachment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sa_api_attachment
    ADD CONSTRAINT sa_api_attachment_pkey PRIMARY KEY (id);


--
-- Name: sa_api_dataset sa_api_dataset_owner_id_cba5f90f_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sa_api_dataset
    ADD CONSTRAINT sa_api_dataset_owner_id_cba5f90f_uniq UNIQUE (owner_id, slug);


--
-- Name: sa_api_dataset sa_api_dataset_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sa_api_dataset
    ADD CONSTRAINT sa_api_dataset_pkey PRIMARY KEY (id);


--
-- Name: sa_api_datasnapshot sa_api_datasnapshot_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sa_api_datasnapshot
    ADD CONSTRAINT sa_api_datasnapshot_pkey PRIMARY KEY (id);


--
-- Name: sa_api_datasnapshot sa_api_datasnapshot_request_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sa_api_datasnapshot
    ADD CONSTRAINT sa_api_datasnapshot_request_id_key UNIQUE (request_id);


--
-- Name: sa_api_datasnapshotrequest sa_api_datasnapshotrequest_guid_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sa_api_datasnapshotrequest
    ADD CONSTRAINT sa_api_datasnapshotrequest_guid_key UNIQUE (guid);


--
-- Name: sa_api_datasnapshotrequest sa_api_datasnapshotrequest_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sa_api_datasnapshotrequest
    ADD CONSTRAINT sa_api_datasnapshotrequest_pkey PRIMARY KEY (id);


--
-- Name: sa_api_group sa_api_group_name_c5b02d55_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sa_api_group
    ADD CONSTRAINT sa_api_group_name_c5b02d55_uniq UNIQUE (name, dataset_id);


--
-- Name: sa_api_group sa_api_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sa_api_group
    ADD CONSTRAINT sa_api_group_pkey PRIMARY KEY (id);


--
-- Name: sa_api_group_submitters sa_api_group_submitters_group_id_25ae03b9_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sa_api_group_submitters
    ADD CONSTRAINT sa_api_group_submitters_group_id_25ae03b9_uniq UNIQUE (group_id, user_id);


--
-- Name: sa_api_group_submitters sa_api_group_submitters_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sa_api_group_submitters
    ADD CONSTRAINT sa_api_group_submitters_pkey PRIMARY KEY (id);


--
-- Name: sa_api_place_email_templates sa_api_place_email_templates_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sa_api_place_email_templates
    ADD CONSTRAINT sa_api_place_email_templates_pkey PRIMARY KEY (id);


--
-- Name: sa_api_place sa_api_place_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sa_api_place
    ADD CONSTRAINT sa_api_place_pkey PRIMARY KEY (submittedthing_ptr_id);


--
-- Name: sa_api_submission sa_api_submission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sa_api_submission
    ADD CONSTRAINT sa_api_submission_pkey PRIMARY KEY (submittedthing_ptr_id);


--
-- Name: sa_api_submittedthing sa_api_submittedthing_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sa_api_submittedthing
    ADD CONSTRAINT sa_api_submittedthing_pkey PRIMARY KEY (id);


--
-- Name: sa_api_v2_dataindex sa_api_v2_dataindex_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sa_api_v2_dataindex
    ADD CONSTRAINT sa_api_v2_dataindex_pkey PRIMARY KEY (id);


--
-- Name: sa_api_v2_datasetpermission sa_api_v2_datasetpermission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sa_api_v2_datasetpermission
    ADD CONSTRAINT sa_api_v2_datasetpermission_pkey PRIMARY KEY (id);


--
-- Name: sa_api_v2_grouppermission sa_api_v2_grouppermission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sa_api_v2_grouppermission
    ADD CONSTRAINT sa_api_v2_grouppermission_pkey PRIMARY KEY (id);


--
-- Name: sa_api_v2_indexedvalue sa_api_v2_indexedvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sa_api_v2_indexedvalue
    ADD CONSTRAINT sa_api_v2_indexedvalue_pkey PRIMARY KEY (id);


--
-- Name: sa_api_v2_keypermission sa_api_v2_keypermission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sa_api_v2_keypermission
    ADD CONSTRAINT sa_api_v2_keypermission_pkey PRIMARY KEY (id);


--
-- Name: sa_api_v2_originpermission sa_api_v2_originpermission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sa_api_v2_originpermission
    ADD CONSTRAINT sa_api_v2_originpermission_pkey PRIMARY KEY (id);


--
-- Name: sa_api_webhook sa_api_webhook_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sa_api_webhook
    ADD CONSTRAINT sa_api_webhook_pkey PRIMARY KEY (id);


--
-- Name: sa_apiv2_master sa_apiv2_master_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sa_apiv2_master
    ADD CONSTRAINT sa_apiv2_master_pkey PRIMARY KEY (id);


--
-- Name: social_auth_association social_auth_association_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.social_auth_association
    ADD CONSTRAINT social_auth_association_pkey PRIMARY KEY (id);


--
-- Name: social_auth_association social_auth_association_server_url_078befa2_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.social_auth_association
    ADD CONSTRAINT social_auth_association_server_url_078befa2_uniq UNIQUE (server_url, handle);


--
-- Name: social_auth_code social_auth_code_email_801b2d02_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.social_auth_code
    ADD CONSTRAINT social_auth_code_email_801b2d02_uniq UNIQUE (email, code);


--
-- Name: social_auth_code social_auth_code_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.social_auth_code
    ADD CONSTRAINT social_auth_code_pkey PRIMARY KEY (id);


--
-- Name: social_auth_nonce social_auth_nonce_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.social_auth_nonce
    ADD CONSTRAINT social_auth_nonce_pkey PRIMARY KEY (id);


--
-- Name: social_auth_nonce social_auth_nonce_server_url_f6284463_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.social_auth_nonce
    ADD CONSTRAINT social_auth_nonce_server_url_f6284463_uniq UNIQUE (server_url, "timestamp", salt);


--
-- Name: social_auth_partial social_auth_partial_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.social_auth_partial
    ADD CONSTRAINT social_auth_partial_pkey PRIMARY KEY (id);


--
-- Name: social_auth_usersocialauth social_auth_usersocialauth_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.social_auth_usersocialauth
    ADD CONSTRAINT social_auth_usersocialauth_pkey PRIMARY KEY (id);


--
-- Name: social_auth_usersocialauth social_auth_usersocialauth_provider_e6b5e668_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.social_auth_usersocialauth
    ADD CONSTRAINT social_auth_usersocialauth_provider_e6b5e668_uniq UNIQUE (provider, uid);


--
-- Name: apikey_apikey_d366d308; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX apikey_apikey_d366d308 ON public.apikey_apikey USING btree (dataset_id);


--
-- Name: apikey_apikey_key_10ddf9a2_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX apikey_apikey_key_10ddf9a2_like ON public.apikey_apikey USING btree (key varchar_pattern_ops);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_0e939a4f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_0e939a4f ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_8373b171; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_8373b171 ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_417f1b1c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_417f1b1c ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_0e939a4f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_0e939a4f ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_e8701ad4; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_e8701ad4 ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_8373b171; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_8373b171 ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_e8701ad4; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_e8701ad4 ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: celery_taskmeta_662f707d; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX celery_taskmeta_662f707d ON public.celery_taskmeta USING btree (hidden);


--
-- Name: celery_taskmeta_task_id_9558b198_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX celery_taskmeta_task_id_9558b198_like ON public.celery_taskmeta USING btree (task_id varchar_pattern_ops);


--
-- Name: celery_tasksetmeta_662f707d; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX celery_tasksetmeta_662f707d ON public.celery_tasksetmeta USING btree (hidden);


--
-- Name: celery_tasksetmeta_taskset_id_a5a1d4ae_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX celery_tasksetmeta_taskset_id_a5a1d4ae_like ON public.celery_tasksetmeta USING btree (taskset_id varchar_pattern_ops);


--
-- Name: cors_origin_b696bc20; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX cors_origin_b696bc20 ON public.cors_origin USING btree (place_email_template_id);


--
-- Name: cors_origin_d366d308; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX cors_origin_d366d308 ON public.cors_origin USING btree (dataset_id);


--
-- Name: django_admin_log_417f1b1c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_417f1b1c ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_e8701ad4; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_e8701ad4 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_de54fa62; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_de54fa62 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: django_site_domain_a2e37b91_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_site_domain_a2e37b91_like ON public.django_site USING btree (domain varchar_pattern_ops);


--
-- Name: djcelery_periodictask_1dcd7040; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX djcelery_periodictask_1dcd7040 ON public.djcelery_periodictask USING btree (interval_id);


--
-- Name: djcelery_periodictask_f3f0d72a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX djcelery_periodictask_f3f0d72a ON public.djcelery_periodictask USING btree (crontab_id);


--
-- Name: djcelery_periodictask_name_cb62cda9_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX djcelery_periodictask_name_cb62cda9_like ON public.djcelery_periodictask USING btree (name varchar_pattern_ops);


--
-- Name: djcelery_taskstate_662f707d; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX djcelery_taskstate_662f707d ON public.djcelery_taskstate USING btree (hidden);


--
-- Name: djcelery_taskstate_863bb2ee; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX djcelery_taskstate_863bb2ee ON public.djcelery_taskstate USING btree (tstamp);


--
-- Name: djcelery_taskstate_9ed39e2e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX djcelery_taskstate_9ed39e2e ON public.djcelery_taskstate USING btree (state);


--
-- Name: djcelery_taskstate_b068931c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX djcelery_taskstate_b068931c ON public.djcelery_taskstate USING btree (name);


--
-- Name: djcelery_taskstate_ce77e6ef; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX djcelery_taskstate_ce77e6ef ON public.djcelery_taskstate USING btree (worker_id);


--
-- Name: djcelery_taskstate_name_8af9eded_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX djcelery_taskstate_name_8af9eded_like ON public.djcelery_taskstate USING btree (name varchar_pattern_ops);


--
-- Name: djcelery_taskstate_state_53543be4_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX djcelery_taskstate_state_53543be4_like ON public.djcelery_taskstate USING btree (state varchar_pattern_ops);


--
-- Name: djcelery_taskstate_task_id_9d2efdb5_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX djcelery_taskstate_task_id_9d2efdb5_like ON public.djcelery_taskstate USING btree (task_id varchar_pattern_ops);


--
-- Name: djcelery_workerstate_f129901a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX djcelery_workerstate_f129901a ON public.djcelery_workerstate USING btree (last_heartbeat);


--
-- Name: djcelery_workerstate_hostname_b31c7fab_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX djcelery_workerstate_hostname_b31c7fab_like ON public.djcelery_workerstate USING btree (hostname varchar_pattern_ops);


--
-- Name: djkombu_message_46cf0e59; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX djkombu_message_46cf0e59 ON public.djkombu_message USING btree (visible);


--
-- Name: djkombu_message_75249aa1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX djkombu_message_75249aa1 ON public.djkombu_message USING btree (queue_id);


--
-- Name: djkombu_message_df2f2974; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX djkombu_message_df2f2974 ON public.djkombu_message USING btree (sent_at);


--
-- Name: djkombu_queue_name_8b43c728_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX djkombu_queue_name_8b43c728_like ON public.djkombu_queue USING btree (name varchar_pattern_ops);


--
-- Name: ms_api_place_tag_5965eaec; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ms_api_place_tag_5965eaec ON public.ms_api_place_tag USING btree (updated_datetime);


--
-- Name: ms_api_place_tag_5ea8d64f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ms_api_place_tag_5ea8d64f ON public.ms_api_place_tag USING btree (created_datetime);


--
-- Name: ms_api_place_tag_62becf4a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ms_api_place_tag_62becf4a ON public.ms_api_place_tag USING btree (place_id);


--
-- Name: ms_api_place_tag_76f094bc; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ms_api_place_tag_76f094bc ON public.ms_api_place_tag USING btree (tag_id);


--
-- Name: ms_api_place_tag_a8919bbb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ms_api_place_tag_a8919bbb ON public.ms_api_place_tag USING btree (submitter_id);


--
-- Name: ms_api_tag_6be37982; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ms_api_tag_6be37982 ON public.ms_api_tag USING btree (parent_id);


--
-- Name: ms_api_tag_d366d308; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ms_api_tag_d366d308 ON public.ms_api_tag USING btree (dataset_id);


--
-- Name: ms_api_tagclosure_6be37982; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ms_api_tagclosure_6be37982 ON public.ms_api_tagclosure USING btree (parent_id);


--
-- Name: ms_api_tagclosure_f36263a3; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ms_api_tagclosure_f36263a3 ON public.ms_api_tagclosure USING btree (child_id);


--
-- Name: oauth2_provider_accesstoken_6bc0a4eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX oauth2_provider_accesstoken_6bc0a4eb ON public.oauth2_provider_accesstoken USING btree (application_id);


--
-- Name: oauth2_provider_accesstoken_e8701ad4; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX oauth2_provider_accesstoken_e8701ad4 ON public.oauth2_provider_accesstoken USING btree (user_id);


--
-- Name: oauth2_provider_application_9d667c2b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX oauth2_provider_application_9d667c2b ON public.oauth2_provider_application USING btree (client_secret);


--
-- Name: oauth2_provider_application_client_id_03f0cc84_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX oauth2_provider_application_client_id_03f0cc84_like ON public.oauth2_provider_application USING btree (client_id varchar_pattern_ops);


--
-- Name: oauth2_provider_application_client_secret_53133678_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX oauth2_provider_application_client_secret_53133678_like ON public.oauth2_provider_application USING btree (client_secret varchar_pattern_ops);


--
-- Name: oauth2_provider_application_e8701ad4; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX oauth2_provider_application_e8701ad4 ON public.oauth2_provider_application USING btree (user_id);


--
-- Name: oauth2_provider_grant_6bc0a4eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX oauth2_provider_grant_6bc0a4eb ON public.oauth2_provider_grant USING btree (application_id);


--
-- Name: oauth2_provider_grant_e8701ad4; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX oauth2_provider_grant_e8701ad4 ON public.oauth2_provider_grant USING btree (user_id);


--
-- Name: oauth2_provider_refreshtoken_6bc0a4eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX oauth2_provider_refreshtoken_6bc0a4eb ON public.oauth2_provider_refreshtoken USING btree (application_id);


--
-- Name: oauth2_provider_refreshtoken_e8701ad4; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX oauth2_provider_refreshtoken_e8701ad4 ON public.oauth2_provider_refreshtoken USING btree (user_id);


--
-- Name: sa_api_activity_5965eaec; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sa_api_activity_5965eaec ON public.sa_api_activity USING btree (updated_datetime);


--
-- Name: sa_api_activity_5ea8d64f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sa_api_activity_5ea8d64f ON public.sa_api_activity USING btree (created_datetime);


--
-- Name: sa_api_activity_a565e755; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sa_api_activity_a565e755 ON public.sa_api_activity USING btree (data_id);


--
-- Name: sa_api_attachment_46cf0e59; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sa_api_attachment_46cf0e59 ON public.sa_api_attachment USING btree (visible);


--
-- Name: sa_api_attachment_5965eaec; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sa_api_attachment_5965eaec ON public.sa_api_attachment USING btree (updated_datetime);


--
-- Name: sa_api_attachment_5ea8d64f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sa_api_attachment_5ea8d64f ON public.sa_api_attachment USING btree (created_datetime);


--
-- Name: sa_api_attachment_674dc8dc; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sa_api_attachment_674dc8dc ON public.sa_api_attachment USING btree (thing_id);


--
-- Name: sa_api_dataset_2dbcba41; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sa_api_dataset_2dbcba41 ON public.sa_api_dataset USING btree (slug);


--
-- Name: sa_api_dataset_5e7b1936; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sa_api_dataset_5e7b1936 ON public.sa_api_dataset USING btree (owner_id);


--
-- Name: sa_api_dataset_slug_910cce96_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sa_api_dataset_slug_910cce96_like ON public.sa_api_dataset USING btree (slug varchar_pattern_ops);


--
-- Name: sa_api_datasnapshotrequest_573f8683; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sa_api_datasnapshotrequest_573f8683 ON public.sa_api_datasnapshotrequest USING btree (requester_id);


--
-- Name: sa_api_datasnapshotrequest_d366d308; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sa_api_datasnapshotrequest_d366d308 ON public.sa_api_datasnapshotrequest USING btree (dataset_id);


--
-- Name: sa_api_datasnapshotrequest_guid_cdfd8002_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sa_api_datasnapshotrequest_guid_cdfd8002_like ON public.sa_api_datasnapshotrequest USING btree (guid text_pattern_ops);


--
-- Name: sa_api_group_d366d308; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sa_api_group_d366d308 ON public.sa_api_group USING btree (dataset_id);


--
-- Name: sa_api_group_submitters_0e939a4f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sa_api_group_submitters_0e939a4f ON public.sa_api_group_submitters USING btree (group_id);


--
-- Name: sa_api_group_submitters_e8701ad4; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sa_api_group_submitters_e8701ad4 ON public.sa_api_group_submitters USING btree (user_id);


--
-- Name: sa_api_place_2c17c639; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sa_api_place_2c17c639 ON public.sa_api_place USING btree (private);


--
-- Name: sa_api_place_email_templates_5965eaec; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sa_api_place_email_templates_5965eaec ON public.sa_api_place_email_templates USING btree (updated_datetime);


--
-- Name: sa_api_place_email_templates_5ea8d64f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sa_api_place_email_templates_5ea8d64f ON public.sa_api_place_email_templates USING btree (created_datetime);


--
-- Name: sa_api_place_geometry_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sa_api_place_geometry_id ON public.sa_api_place USING gist (geometry);


--
-- Name: sa_api_submission_2faf0aa5; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sa_api_submission_2faf0aa5 ON public.sa_api_submission USING btree (place_model_id);


--
-- Name: sa_api_submission_8e2b615a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sa_api_submission_8e2b615a ON public.sa_api_submission USING btree (set_name);


--
-- Name: sa_api_submission_set_name_28e8ae4c_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sa_api_submission_set_name_28e8ae4c_like ON public.sa_api_submission USING btree (set_name text_pattern_ops);


--
-- Name: sa_api_submittedthing_46cf0e59; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sa_api_submittedthing_46cf0e59 ON public.sa_api_submittedthing USING btree (visible);


--
-- Name: sa_api_submittedthing_5965eaec; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sa_api_submittedthing_5965eaec ON public.sa_api_submittedthing USING btree (updated_datetime);


--
-- Name: sa_api_submittedthing_5ea8d64f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sa_api_submittedthing_5ea8d64f ON public.sa_api_submittedthing USING btree (created_datetime);


--
-- Name: sa_api_submittedthing_a8919bbb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sa_api_submittedthing_a8919bbb ON public.sa_api_submittedthing USING btree (submitter_id);


--
-- Name: sa_api_submittedthing_d366d308; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sa_api_submittedthing_d366d308 ON public.sa_api_submittedthing USING btree (dataset_id);


--
-- Name: sa_api_v2_dataindex_2b9331d0; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sa_api_v2_dataindex_2b9331d0 ON public.sa_api_v2_dataindex USING btree (attr_name);


--
-- Name: sa_api_v2_dataindex_attr_name_d1a8d4d1_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sa_api_v2_dataindex_attr_name_d1a8d4d1_like ON public.sa_api_v2_dataindex USING btree (attr_name varchar_pattern_ops);


--
-- Name: sa_api_v2_dataindex_d366d308; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sa_api_v2_dataindex_d366d308 ON public.sa_api_v2_dataindex USING btree (dataset_id);


--
-- Name: sa_api_v2_datasetpermission_d366d308; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sa_api_v2_datasetpermission_d366d308 ON public.sa_api_v2_datasetpermission USING btree (dataset_id);


--
-- Name: sa_api_v2_grouppermission_0e939a4f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sa_api_v2_grouppermission_0e939a4f ON public.sa_api_v2_grouppermission USING btree (group_id);


--
-- Name: sa_api_v2_indexedvalue_2063c160; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sa_api_v2_indexedvalue_2063c160 ON public.sa_api_v2_indexedvalue USING btree (value);


--
-- Name: sa_api_v2_indexedvalue_674dc8dc; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sa_api_v2_indexedvalue_674dc8dc ON public.sa_api_v2_indexedvalue USING btree (thing_id);


--
-- Name: sa_api_v2_indexedvalue_b618aa3c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sa_api_v2_indexedvalue_b618aa3c ON public.sa_api_v2_indexedvalue USING btree (index_id);


--
-- Name: sa_api_v2_indexedvalue_value_769126af_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sa_api_v2_indexedvalue_value_769126af_like ON public.sa_api_v2_indexedvalue USING btree (value varchar_pattern_ops);


--
-- Name: sa_api_v2_keypermission_30f69126; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sa_api_v2_keypermission_30f69126 ON public.sa_api_v2_keypermission USING btree (key_id);


--
-- Name: sa_api_v2_originpermission_c78b92ae; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sa_api_v2_originpermission_c78b92ae ON public.sa_api_v2_originpermission USING btree (origin_id);


--
-- Name: sa_api_webhook_5965eaec; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sa_api_webhook_5965eaec ON public.sa_api_webhook USING btree (updated_datetime);


--
-- Name: sa_api_webhook_5ea8d64f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sa_api_webhook_5ea8d64f ON public.sa_api_webhook USING btree (created_datetime);


--
-- Name: sa_api_webhook_d366d308; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sa_api_webhook_d366d308 ON public.sa_api_webhook USING btree (dataset_id);


--
-- Name: sa_apiv2_master_d366d308; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sa_apiv2_master_d366d308 ON public.sa_apiv2_master USING btree (dataset_id);


--
-- Name: social_auth_code_c1336794; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX social_auth_code_c1336794 ON public.social_auth_code USING btree (code);


--
-- Name: social_auth_code_code_a2393167_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX social_auth_code_code_a2393167_like ON public.social_auth_code USING btree (code varchar_pattern_ops);


--
-- Name: social_auth_code_d7e6d55b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX social_auth_code_d7e6d55b ON public.social_auth_code USING btree ("timestamp");


--
-- Name: social_auth_partial_94a08da1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX social_auth_partial_94a08da1 ON public.social_auth_partial USING btree (token);


--
-- Name: social_auth_partial_d7e6d55b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX social_auth_partial_d7e6d55b ON public.social_auth_partial USING btree ("timestamp");


--
-- Name: social_auth_partial_token_3017fea3_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX social_auth_partial_token_3017fea3_like ON public.social_auth_partial USING btree (token varchar_pattern_ops);


--
-- Name: social_auth_usersocialauth_e8701ad4; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX social_auth_usersocialauth_e8701ad4 ON public.social_auth_usersocialauth USING btree (user_id);


--
-- Name: apikey_apikey apikey_apikey_dataset_id_1d5d71da_fk_sa_api_dataset_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.apikey_apikey
    ADD CONSTRAINT apikey_apikey_dataset_id_1d5d71da_fk_sa_api_dataset_id FOREIGN KEY (dataset_id) REFERENCES public.sa_api_dataset(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permiss_permission_id_84c5c92e_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permiss_permission_id_84c5c92e_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permiss_content_type_id_2f476e4b_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permiss_content_type_id_2f476e4b_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_per_permission_id_1fbb5f2c_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_per_permission_id_1fbb5f2c_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cors_origin bad618163819571bde09b46b4541aaab; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cors_origin
    ADD CONSTRAINT bad618163819571bde09b46b4541aaab FOREIGN KEY (place_email_template_id) REFERENCES public.sa_api_place_email_templates(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cors_origin cors_origin_dataset_id_8a80aa5a_fk_sa_api_dataset_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cors_origin
    ADD CONSTRAINT cors_origin_dataset_id_8a80aa5a_fk_sa_api_dataset_id FOREIGN KEY (dataset_id) REFERENCES public.sa_api_dataset(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_content_type_id_c4bce8eb_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_content_type_id_c4bce8eb_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: djcelery_periodictask djcelery_p_interval_id_b426ab02_fk_djcelery_intervalschedule_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.djcelery_periodictask
    ADD CONSTRAINT djcelery_p_interval_id_b426ab02_fk_djcelery_intervalschedule_id FOREIGN KEY (interval_id) REFERENCES public.djcelery_intervalschedule(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: djcelery_periodictask djcelery_per_crontab_id_75609bab_fk_djcelery_crontabschedule_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.djcelery_periodictask
    ADD CONSTRAINT djcelery_per_crontab_id_75609bab_fk_djcelery_crontabschedule_id FOREIGN KEY (crontab_id) REFERENCES public.djcelery_crontabschedule(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: djcelery_taskstate djcelery_taskstat_worker_id_f7f57a05_fk_djcelery_workerstate_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.djcelery_taskstate
    ADD CONSTRAINT djcelery_taskstat_worker_id_f7f57a05_fk_djcelery_workerstate_id FOREIGN KEY (worker_id) REFERENCES public.djcelery_workerstate(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: djkombu_message djkombu_message_queue_id_38d205a7_fk_djkombu_queue_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.djkombu_message
    ADD CONSTRAINT djkombu_message_queue_id_38d205a7_fk_djkombu_queue_id FOREIGN KEY (queue_id) REFERENCES public.djkombu_queue(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ms_api_place_tag ms_api__place_id_c0e87834_fk_sa_api_place_submittedthing_ptr_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ms_api_place_tag
    ADD CONSTRAINT ms_api__place_id_c0e87834_fk_sa_api_place_submittedthing_ptr_id FOREIGN KEY (place_id) REFERENCES public.sa_api_place(submittedthing_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ms_api_place_tag ms_api_place_tag_submitter_id_8492a975_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ms_api_place_tag
    ADD CONSTRAINT ms_api_place_tag_submitter_id_8492a975_fk_auth_user_id FOREIGN KEY (submitter_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ms_api_place_tag ms_api_place_tag_tag_id_6f857456_fk_ms_api_tag_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ms_api_place_tag
    ADD CONSTRAINT ms_api_place_tag_tag_id_6f857456_fk_ms_api_tag_id FOREIGN KEY (tag_id) REFERENCES public.ms_api_tag(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ms_api_tag ms_api_tag_dataset_id_78ed6432_fk_sa_api_dataset_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ms_api_tag
    ADD CONSTRAINT ms_api_tag_dataset_id_78ed6432_fk_sa_api_dataset_id FOREIGN KEY (dataset_id) REFERENCES public.sa_api_dataset(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ms_api_tag ms_api_tag_parent_id_94af0b09_fk_ms_api_tag_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ms_api_tag
    ADD CONSTRAINT ms_api_tag_parent_id_94af0b09_fk_ms_api_tag_id FOREIGN KEY (parent_id) REFERENCES public.ms_api_tag(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ms_api_tagclosure ms_api_tagclosure_child_id_11a3babd_fk_ms_api_tag_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ms_api_tagclosure
    ADD CONSTRAINT ms_api_tagclosure_child_id_11a3babd_fk_ms_api_tag_id FOREIGN KEY (child_id) REFERENCES public.ms_api_tag(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ms_api_tagclosure ms_api_tagclosure_parent_id_572ad5d3_fk_ms_api_tag_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ms_api_tagclosure
    ADD CONSTRAINT ms_api_tagclosure_parent_id_572ad5d3_fk_ms_api_tag_id FOREIGN KEY (parent_id) REFERENCES public.ms_api_tag(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oauth2_provider_accesstoken oauth2_provider_accesstoken_application_id_b22886e1_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth2_provider_accesstoken
    ADD CONSTRAINT oauth2_provider_accesstoken_application_id_b22886e1_fk FOREIGN KEY (application_id) REFERENCES public.oauth2_provider_application(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oauth2_provider_accesstoken oauth2_provider_accesstoken_user_id_6e4c9a65_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth2_provider_accesstoken
    ADD CONSTRAINT oauth2_provider_accesstoken_user_id_6e4c9a65_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oauth2_provider_application oauth2_provider_application_user_id_79829054_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth2_provider_application
    ADD CONSTRAINT oauth2_provider_application_user_id_79829054_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oauth2_provider_grant oauth2_provider_grant_application_id_81923564_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth2_provider_grant
    ADD CONSTRAINT oauth2_provider_grant_application_id_81923564_fk FOREIGN KEY (application_id) REFERENCES public.oauth2_provider_application(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oauth2_provider_grant oauth2_provider_grant_user_id_e8f62af8_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth2_provider_grant
    ADD CONSTRAINT oauth2_provider_grant_user_id_e8f62af8_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oauth2_provider_refreshtoken oauth2_provider_refreshtoken_access_token_id_775e84e8_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth2_provider_refreshtoken
    ADD CONSTRAINT oauth2_provider_refreshtoken_access_token_id_775e84e8_fk FOREIGN KEY (access_token_id) REFERENCES public.oauth2_provider_accesstoken(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oauth2_provider_refreshtoken oauth2_provider_refreshtoken_application_id_2d1c311b_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth2_provider_refreshtoken
    ADD CONSTRAINT oauth2_provider_refreshtoken_application_id_2d1c311b_fk FOREIGN KEY (application_id) REFERENCES public.oauth2_provider_application(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oauth2_provider_refreshtoken oauth2_provider_refreshtoken_user_id_da837fce_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth2_provider_refreshtoken
    ADD CONSTRAINT oauth2_provider_refreshtoken_user_id_da837fce_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: remote_client_user_clientpermissions remote_cli_client_id_a3d481d8_fk_oauth2_provider_application_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.remote_client_user_clientpermissions
    ADD CONSTRAINT remote_cli_client_id_a3d481d8_fk_oauth2_provider_application_id FOREIGN KEY (client_id) REFERENCES public.oauth2_provider_application(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: sa_api_submission s_place_model_id_f37fd28f_fk_sa_api_place_submittedthing_ptr_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sa_api_submission
    ADD CONSTRAINT s_place_model_id_f37fd28f_fk_sa_api_place_submittedthing_ptr_id FOREIGN KEY (place_model_id) REFERENCES public.sa_api_place(submittedthing_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: sa_api_place sa_a_submittedthing_ptr_id_5fca79f4_fk_sa_api_submittedthing_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sa_api_place
    ADD CONSTRAINT sa_a_submittedthing_ptr_id_5fca79f4_fk_sa_api_submittedthing_id FOREIGN KEY (submittedthing_ptr_id) REFERENCES public.sa_api_submittedthing(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: sa_api_submission sa_a_submittedthing_ptr_id_dc0378a3_fk_sa_api_submittedthing_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sa_api_submission
    ADD CONSTRAINT sa_a_submittedthing_ptr_id_dc0378a3_fk_sa_api_submittedthing_id FOREIGN KEY (submittedthing_ptr_id) REFERENCES public.sa_api_submittedthing(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: sa_api_activity sa_api_activity_data_id_30872c50_fk_sa_api_submittedthing_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sa_api_activity
    ADD CONSTRAINT sa_api_activity_data_id_30872c50_fk_sa_api_submittedthing_id FOREIGN KEY (data_id) REFERENCES public.sa_api_submittedthing(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: sa_api_attachment sa_api_attachment_thing_id_17f30766_fk_sa_api_submittedthing_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sa_api_attachment
    ADD CONSTRAINT sa_api_attachment_thing_id_17f30766_fk_sa_api_submittedthing_id FOREIGN KEY (thing_id) REFERENCES public.sa_api_submittedthing(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: sa_api_datasnapshot sa_api_dat_request_id_5a1f644c_fk_sa_api_datasnapshotrequest_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sa_api_datasnapshot
    ADD CONSTRAINT sa_api_dat_request_id_5a1f644c_fk_sa_api_datasnapshotrequest_id FOREIGN KEY (request_id) REFERENCES public.sa_api_datasnapshotrequest(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: sa_api_dataset sa_api_dataset_owner_id_994ca70a_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sa_api_dataset
    ADD CONSTRAINT sa_api_dataset_owner_id_994ca70a_fk_auth_user_id FOREIGN KEY (owner_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: sa_api_datasnapshotrequest sa_api_datasnapshotreq_dataset_id_5d8adcbe_fk_sa_api_dataset_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sa_api_datasnapshotrequest
    ADD CONSTRAINT sa_api_datasnapshotreq_dataset_id_5d8adcbe_fk_sa_api_dataset_id FOREIGN KEY (dataset_id) REFERENCES public.sa_api_dataset(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: sa_api_datasnapshotrequest sa_api_datasnapshotreques_requester_id_9b601879_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sa_api_datasnapshotrequest
    ADD CONSTRAINT sa_api_datasnapshotreques_requester_id_9b601879_fk_auth_user_id FOREIGN KEY (requester_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: sa_api_group sa_api_group_dataset_id_e3b8b762_fk_sa_api_dataset_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sa_api_group
    ADD CONSTRAINT sa_api_group_dataset_id_e3b8b762_fk_sa_api_dataset_id FOREIGN KEY (dataset_id) REFERENCES public.sa_api_dataset(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: sa_api_group_submitters sa_api_group_submitters_group_id_4539593d_fk_sa_api_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sa_api_group_submitters
    ADD CONSTRAINT sa_api_group_submitters_group_id_4539593d_fk_sa_api_group_id FOREIGN KEY (group_id) REFERENCES public.sa_api_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: sa_api_group_submitters sa_api_group_submitters_user_id_a5c5d8d6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sa_api_group_submitters
    ADD CONSTRAINT sa_api_group_submitters_user_id_a5c5d8d6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: sa_api_submittedthing sa_api_submittedthing_dataset_id_115dc000_fk_sa_api_dataset_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sa_api_submittedthing
    ADD CONSTRAINT sa_api_submittedthing_dataset_id_115dc000_fk_sa_api_dataset_id FOREIGN KEY (dataset_id) REFERENCES public.sa_api_dataset(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: sa_api_submittedthing sa_api_submittedthing_submitter_id_c2eb2f6b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sa_api_submittedthing
    ADD CONSTRAINT sa_api_submittedthing_submitter_id_c2eb2f6b_fk_auth_user_id FOREIGN KEY (submitter_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: sa_api_v2_dataindex sa_api_v2_dataindex_dataset_id_f53fd30f_fk_sa_api_dataset_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sa_api_v2_dataindex
    ADD CONSTRAINT sa_api_v2_dataindex_dataset_id_f53fd30f_fk_sa_api_dataset_id FOREIGN KEY (dataset_id) REFERENCES public.sa_api_dataset(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: sa_api_v2_datasetpermission sa_api_v2_datasetpermi_dataset_id_513e88c9_fk_sa_api_dataset_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sa_api_v2_datasetpermission
    ADD CONSTRAINT sa_api_v2_datasetpermi_dataset_id_513e88c9_fk_sa_api_dataset_id FOREIGN KEY (dataset_id) REFERENCES public.sa_api_dataset(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: sa_api_v2_grouppermission sa_api_v2_grouppermission_group_id_a469367a_fk_sa_api_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sa_api_v2_grouppermission
    ADD CONSTRAINT sa_api_v2_grouppermission_group_id_a469367a_fk_sa_api_group_id FOREIGN KEY (group_id) REFERENCES public.sa_api_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: sa_api_v2_indexedvalue sa_api_v2_indexed_thing_id_6c94838d_fk_sa_api_submittedthing_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sa_api_v2_indexedvalue
    ADD CONSTRAINT sa_api_v2_indexed_thing_id_6c94838d_fk_sa_api_submittedthing_id FOREIGN KEY (thing_id) REFERENCES public.sa_api_submittedthing(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: sa_api_v2_indexedvalue sa_api_v2_indexedva_index_id_c4c8dcaa_fk_sa_api_v2_dataindex_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sa_api_v2_indexedvalue
    ADD CONSTRAINT sa_api_v2_indexedva_index_id_c4c8dcaa_fk_sa_api_v2_dataindex_id FOREIGN KEY (index_id) REFERENCES public.sa_api_v2_dataindex(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: sa_api_v2_keypermission sa_api_v2_keypermission_key_id_fcd75bbc_fk_apikey_apikey_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sa_api_v2_keypermission
    ADD CONSTRAINT sa_api_v2_keypermission_key_id_fcd75bbc_fk_apikey_apikey_id FOREIGN KEY (key_id) REFERENCES public.apikey_apikey(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: sa_api_v2_originpermission sa_api_v2_originpermission_origin_id_79d5894f_fk_cors_origin_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sa_api_v2_originpermission
    ADD CONSTRAINT sa_api_v2_originpermission_origin_id_79d5894f_fk_cors_origin_id FOREIGN KEY (origin_id) REFERENCES public.cors_origin(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: sa_api_webhook sa_api_webhook_dataset_id_8b872500_fk_sa_api_dataset_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sa_api_webhook
    ADD CONSTRAINT sa_api_webhook_dataset_id_8b872500_fk_sa_api_dataset_id FOREIGN KEY (dataset_id) REFERENCES public.sa_api_dataset(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: sa_apiv2_master sa_apiv2_master_dataset_id_ec18ef79_fk_sa_api_dataset_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sa_apiv2_master
    ADD CONSTRAINT sa_apiv2_master_dataset_id_ec18ef79_fk_sa_api_dataset_id FOREIGN KEY (dataset_id) REFERENCES public.sa_api_dataset(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: social_auth_usersocialauth social_auth_usersocialauth_user_id_17d28448_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.social_auth_usersocialauth
    ADD CONSTRAINT social_auth_usersocialauth_user_id_17d28448_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

