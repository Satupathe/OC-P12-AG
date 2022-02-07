--
-- PostgreSQL database dump
--

-- Dumped from database version 14.1
-- Dumped by pg_dump version 14.1

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: EEadmin
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO "EEadmin";

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: EEadmin
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO "EEadmin";

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: EEadmin
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: EEadmin
--

CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO "EEadmin";

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: EEadmin
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO "EEadmin";

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: EEadmin
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: EEadmin
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO "EEadmin";

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: EEadmin
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO "EEadmin";

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: EEadmin
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: authtoken_token; Type: TABLE; Schema: public; Owner: EEadmin
--

CREATE TABLE public.authtoken_token (
    key character varying(40) NOT NULL,
    created timestamp with time zone NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.authtoken_token OWNER TO "EEadmin";

--
-- Name: clients_client; Type: TABLE; Schema: public; Owner: EEadmin
--

CREATE TABLE public.clients_client (
    id bigint NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    status character varying(30) NOT NULL,
    email character varying(100) NOT NULL,
    phone character varying(25) NOT NULL,
    mobile character varying(25) NOT NULL,
    company_name character varying(255) NOT NULL,
    created_time timestamp with time zone NOT NULL,
    updated_time timestamp with time zone NOT NULL,
    sales_employee_id bigint NOT NULL
);


ALTER TABLE public.clients_client OWNER TO "EEadmin";

--
-- Name: clients_client_id_seq; Type: SEQUENCE; Schema: public; Owner: EEadmin
--

CREATE SEQUENCE public.clients_client_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.clients_client_id_seq OWNER TO "EEadmin";

--
-- Name: clients_client_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: EEadmin
--

ALTER SEQUENCE public.clients_client_id_seq OWNED BY public.clients_client.id;


--
-- Name: contractsEvents_contract; Type: TABLE; Schema: public; Owner: EEadmin
--

CREATE TABLE public."contractsEvents_contract" (
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    description text NOT NULL,
    value integer NOT NULL,
    deadline date NOT NULL,
    status character varying(50) NOT NULL,
    created_time timestamp with time zone NOT NULL,
    updated_time timestamp with time zone NOT NULL,
    client_id bigint NOT NULL,
    event_id bigint,
    sales_administrator_id bigint NOT NULL
);


ALTER TABLE public."contractsEvents_contract" OWNER TO "EEadmin";

--
-- Name: contractsEvents_contract_id_seq; Type: SEQUENCE; Schema: public; Owner: EEadmin
--

CREATE SEQUENCE public."contractsEvents_contract_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."contractsEvents_contract_id_seq" OWNER TO "EEadmin";

--
-- Name: contractsEvents_contract_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: EEadmin
--

ALTER SEQUENCE public."contractsEvents_contract_id_seq" OWNED BY public."contractsEvents_contract".id;


--
-- Name: contractsEvents_event; Type: TABLE; Schema: public; Owner: EEadmin
--

CREATE TABLE public."contractsEvents_event" (
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    description text NOT NULL,
    event_beginning timestamp with time zone NOT NULL,
    event_end timestamp with time zone NOT NULL,
    status character varying(50) NOT NULL,
    created_time timestamp with time zone NOT NULL,
    updated_time timestamp with time zone NOT NULL,
    support_employee_id bigint
);


ALTER TABLE public."contractsEvents_event" OWNER TO "EEadmin";

--
-- Name: contractsEvents_event_id_seq; Type: SEQUENCE; Schema: public; Owner: EEadmin
--

CREATE SEQUENCE public."contractsEvents_event_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."contractsEvents_event_id_seq" OWNER TO "EEadmin";

--
-- Name: contractsEvents_event_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: EEadmin
--

ALTER SEQUENCE public."contractsEvents_event_id_seq" OWNED BY public."contractsEvents_event".id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: EEadmin
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id bigint NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO "EEadmin";

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: EEadmin
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO "EEadmin";

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: EEadmin
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: EEadmin
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO "EEadmin";

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: EEadmin
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO "EEadmin";

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: EEadmin
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: EEadmin
--

CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO "EEadmin";

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: EEadmin
--

CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO "EEadmin";

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: EEadmin
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: EEadmin
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO "EEadmin";

--
-- Name: employeeApp_employee; Type: TABLE; Schema: public; Owner: EEadmin
--

CREATE TABLE public."employeeApp_employee" (
    id bigint NOT NULL,
    password character varying(128) NOT NULL,
    username character varying(50) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    email character varying(60) NOT NULL,
    phone character varying(25) NOT NULL,
    mobile character varying(25) NOT NULL,
    department character varying(20) NOT NULL,
    created_time timestamp with time zone NOT NULL,
    modified_time timestamp with time zone NOT NULL,
    is_admin boolean NOT NULL,
    is_active boolean NOT NULL,
    is_superuser boolean NOT NULL,
    is_staff boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL,
    last_login timestamp with time zone NOT NULL,
    groups_id integer
);


ALTER TABLE public."employeeApp_employee" OWNER TO "EEadmin";

--
-- Name: employeeApp_employee_id_seq; Type: SEQUENCE; Schema: public; Owner: EEadmin
--

CREATE SEQUENCE public."employeeApp_employee_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."employeeApp_employee_id_seq" OWNER TO "EEadmin";

--
-- Name: employeeApp_employee_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: EEadmin
--

ALTER SEQUENCE public."employeeApp_employee_id_seq" OWNED BY public."employeeApp_employee".id;


--
-- Name: employeeApp_employee_user_permissions; Type: TABLE; Schema: public; Owner: EEadmin
--

CREATE TABLE public."employeeApp_employee_user_permissions" (
    id bigint NOT NULL,
    employee_id bigint NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public."employeeApp_employee_user_permissions" OWNER TO "EEadmin";

--
-- Name: employeeApp_employee_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: EEadmin
--

CREATE SEQUENCE public."employeeApp_employee_user_permissions_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."employeeApp_employee_user_permissions_id_seq" OWNER TO "EEadmin";

--
-- Name: employeeApp_employee_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: EEadmin
--

ALTER SEQUENCE public."employeeApp_employee_user_permissions_id_seq" OWNED BY public."employeeApp_employee_user_permissions".id;


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: EEadmin
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: EEadmin
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: EEadmin
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: clients_client id; Type: DEFAULT; Schema: public; Owner: EEadmin
--

ALTER TABLE ONLY public.clients_client ALTER COLUMN id SET DEFAULT nextval('public.clients_client_id_seq'::regclass);


--
-- Name: contractsEvents_contract id; Type: DEFAULT; Schema: public; Owner: EEadmin
--

ALTER TABLE ONLY public."contractsEvents_contract" ALTER COLUMN id SET DEFAULT nextval('public."contractsEvents_contract_id_seq"'::regclass);


--
-- Name: contractsEvents_event id; Type: DEFAULT; Schema: public; Owner: EEadmin
--

ALTER TABLE ONLY public."contractsEvents_event" ALTER COLUMN id SET DEFAULT nextval('public."contractsEvents_event_id_seq"'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: EEadmin
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: EEadmin
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: EEadmin
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: employeeApp_employee id; Type: DEFAULT; Schema: public; Owner: EEadmin
--

ALTER TABLE ONLY public."employeeApp_employee" ALTER COLUMN id SET DEFAULT nextval('public."employeeApp_employee_id_seq"'::regclass);


--
-- Name: employeeApp_employee_user_permissions id; Type: DEFAULT; Schema: public; Owner: EEadmin
--

ALTER TABLE ONLY public."employeeApp_employee_user_permissions" ALTER COLUMN id SET DEFAULT nextval('public."employeeApp_employee_user_permissions_id_seq"'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: EEadmin
--

COPY public.auth_group (id, name) FROM stdin;
(2,	Support team)
(3,	Sales team)
(1,	Management team)
(5,	Support admin)
(4,	Sales admin)
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: EEadmin
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
1	1	24
2	1	21
3	1	22
4	1	23
5	4	33
6	4	34
7	4	35
8	4	36
13	5	41
14	5	42
15	5	43
16	5	44
17	4	37
18	4	38
19	4	39
20	4	40
21	4	41
22	4	42
23	4	43
24	4	44
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: EEadmin
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add content type	4	add_contenttype
14	Can change content type	4	change_contenttype
15	Can delete content type	4	delete_contenttype
16	Can view content type	4	view_contenttype
17	Can add session	5	add_session
18	Can change session	5	change_session
19	Can delete session	5	delete_session
20	Can view session	5	view_session
21	Can add employee	6	add_employee
22	Can change employee	6	change_employee
23	Can delete employee	6	delete_employee
24	Can view employee	6	view_employee
25	Can add Token	7	add_token
26	Can change Token	7	change_token
27	Can delete Token	7	delete_token
28	Can view Token	7	view_token
29	Can add token	8	add_tokenproxy
30	Can change token	8	change_tokenproxy
31	Can delete token	8	delete_tokenproxy
32	Can view token	8	view_tokenproxy
33	Can add client	9	add_client
34	Can change client	9	change_client
35	Can delete client	9	delete_client
36	Can view client	9	view_client
37	Can add contract	10	add_contract
38	Can change contract	10	change_contract
39	Can delete contract	10	delete_contract
40	Can view contract	10	view_contract
41	Can add event	11	add_event
42	Can change event	11	change_event
43	Can delete event	11	delete_event
44	Can view event	11	view_event
\.


--
-- Data for Name: authtoken_token; Type: TABLE DATA; Schema: public; Owner: EEadmin
--

COPY public.authtoken_token (key, created, user_id) FROM stdin;
\.


--
-- Data for Name: clients_client; Type: TABLE DATA; Schema: public; Owner: EEadmin
--

COPY public.clients_client (id, first_name, last_name, status, email, phone, mobile, company_name, created_time, updated_time, sales_employee_id) FROM stdin;
14	jean	Dumoulin	Prospect	jeandumoulin1@prospect.com	0484846519	0649332986	delatourprospect	2022-01-24 17:29:12.12275+01	2022-01-24 17:29:12.123748+01	7
6	Melissa	Candide	Customer	melissacandide@prospect.com	0465986334	0648967485	superprospect	2022-01-24 16:25:28.052061+01	2022-01-24 16:25:28.052061+01	4
16	Bertrand	Grips	Prospect	bertrandgrip@prospect.com	6019510911	0651908191	prospectgrip	2022-01-25 15:59:28.924853+01	2022-01-25 15:59:28.924853+01	5
24	Hugo	Nadin	Prospect	hugonadin@prospect.com	0684182777	0498756958	nadinprospect	2022-02-01 17:13:25.028838+01	2022-02-01 17:13:25.028838+01	5
25	Andr├®	Lina	Prospect	andrelina@prospect.com	0654846298	0437144969	linaprospect	2022-02-01 17:21:58.187728+01	2022-02-01 17:21:58.187728+01	5
26	Marion	Marchand	Prospect	marionmarchand@prospect.com	0654846298	0437144969	Marchandprospect	2022-02-02 16:31:36.430618+01	2022-02-02 16:31:36.430618+01	5
\.


--
-- Data for Name: contractsEvents_contract; Type: TABLE DATA; Schema: public; Owner: EEadmin
--

COPY public."contractsEvents_contract" (id, name, description, value, deadline, status, created_time, updated_time, client_id, event_id, sales_administrator_id) FROM stdin;
4	EVG Andr├® Lina	EVG de Andr├® Lina	3000	2022-03-17	Signed	2022-02-02 16:10:42.736197+01	2022-02-02 16:11:53.623206+01	25	3	9
5	Festival d'├®t├®	Festival de l'├®t├® pour la f├¬te nationale	70000	2022-04-05	Pending	2022-02-02 16:35:34.262093+01	2022-02-03 12:28:06.773393+01	25	4	5
\.


--
-- Data for Name: contractsEvents_event; Type: TABLE DATA; Schema: public; Owner: EEadmin
--

COPY public."contractsEvents_event" (id, name, description, event_beginning, event_end, status, created_time, updated_time, support_employee_id) FROM stdin;
3	EVG Andr├® Lina	EVG de Andr├® Lina	2022-06-11 14:00:00+02	2022-06-12 20:00:00+02	Pending	2022-02-02 16:11:42.10496+01	2022-02-02 16:11:42.10496+01	10
4	mariage M. X et Mme Y	Le marriage de M. X et Mme Y se d├®roulera dans une ambiance chic dans les beaux quartiers	2022-07-24 10:30:00+02	2022-04-25 16:30:00+02	Pending	2022-02-02 16:37:40.573413+01	2022-02-04 15:32:16.37756+01	10
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: EEadmin
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2022-01-18 10:02:53.812797+01	3	test@ee.com	1	[{"added": {}}]	6	2
2	2022-01-18 10:03:38.375196+01	3	test@ee.com	2	[{"changed": {"fields": ["Username", "First name", "Last name", "Phone", "Mobile", "Department", "Is admin", "Is staff"]}}]	6	2
3	2022-01-18 10:04:09.202817+01	1	manager	1	[{"added": {}}]	3	2
4	2022-01-18 10:34:05.381534+01	3	test@ee.com	2	[{"changed": {"fields": ["Groups"]}}]	6	2
5	2022-01-18 15:08:58.517241+01	2	Support team	1	[{"added": {}}]	3	2
6	2022-01-18 15:09:28.016779+01	1	Manager	2	[{"changed": {"fields": ["Name"]}}]	3	2
7	2022-01-18 15:09:40.587854+01	3	Sales team	1	[{"added": {}}]	3	2
8	2022-01-18 15:10:56.611844+01	1	Management team	2	[{"changed": {"fields": ["Name"]}}]	3	2
9	2022-01-18 15:12:47.879264+01	4	alicemartin@eem.com	1	[{"added": {}}]	6	2
10	2022-01-18 15:13:30.153115+01	4	alicemartin@eem.com	2	[{"changed": {"fields": ["Username", "First name", "Last name", "Phone", "Mobile", "Department", "Groups", "Is staff"]}}]	6	2
11	2022-01-18 15:17:10.373295+01	5	ericmarona@eesales.com	1	[{"added": {}}]	6	4
12	2022-01-18 15:18:11.006501+01	5	ericmarona@eesales.com	2	[{"changed": {"fields": ["Username", "First name", "Last name", "Phone", "Mobile", "Department", "Groups"]}}]	6	4
13	2022-01-24 17:02:47.96957+01	3	test@ee.com	3		6	2
14	2022-01-24 17:03:52.359693+01	6	clementmenant@eem.com	1	[{"added": {}}]	6	2
15	2022-01-24 17:04:27.265679+01	6	clementmenant@eem.com	2	[{"changed": {"fields": ["Username", "First name", "Last name", "Phone", "Mobile", "Department", "Groups", "Is staff"]}}]	6	2
16	2022-01-24 17:26:48.530141+01	7	testnonsales@eem.com	1	[{"added": {}}]	6	2
17	2022-01-24 17:27:25.004018+01	7	testnonsales@eem.com	2	[{"changed": {"fields": ["Username", "First name", "Last name", "Phone", "Mobile", "Department", "Groups", "Is staff"]}}]	6	2
18	2022-01-25 14:24:35.105083+01	4	Sales admin	1	[{"added": {}}]	3	2
19	2022-01-25 14:28:48.938792+01	5	ericmarona@eesales.com	2	[{"changed": {"fields": ["Department", "Groups", "Is staff"]}}]	6	2
20	2022-01-25 14:30:13.827202+01	4	Sales admin	2	[]	3	2
21	2022-01-25 14:30:51.226419+01	5	ericmarona@eesales.com	2	[{"changed": {"fields": ["Department"]}}]	6	2
22	2022-01-25 14:34:32.406513+01	4	alicemartin@eem.com	2	[{"changed": {"fields": ["Department"]}}]	6	2
23	2022-01-25 14:34:38.723613+01	6	clementmenant@eem.com	2	[{"changed": {"fields": ["Department"]}}]	6	2
24	2022-01-25 14:36:32.553284+01	1	Management team	2	[{"changed": {"fields": ["Permissions"]}}]	3	2
25	2022-01-25 14:36:58.482829+01	1	Management team	2	[{"changed": {"fields": ["Permissions"]}}]	3	2
26	2022-01-25 15:04:06.819544+01	5	ericmarona@eesales.com	2	[{"changed": {"fields": ["Department", "Is admin"]}}]	6	2
27	2022-01-25 15:59:28.941545+01	16	bertrandgrip@prospect.com	1	[{"added": {}}]	9	5
28	2022-01-25 15:59:45.495098+01	12	alfredapuis@prospect.com	3		9	5
29	2022-01-25 15:59:45.499093+01	8	alfreddelatour@prospect.com	3		9	5
30	2022-01-25 15:59:45.499093+01	9	alfreddupuis@prospect.com	3		9	5
31	2022-01-25 15:59:45.499093+01	11	alfredopuis@prospect.com	3		9	5
32	2022-01-25 15:59:45.50309+01	13	alfredoupuis@prospect.com	3		9	5
33	2022-01-25 15:59:45.50309+01	10	alfredupuis@prospect.com	3		9	5
34	2022-01-25 15:59:57.927658+01	14	jeandumoulin1@prospect.com	2	[{"changed": {"fields": ["Status"]}}]	9	5
35	2022-01-25 16:00:04.072804+01	6	melissacandide@prospect.com	2	[{"changed": {"fields": ["Status"]}}]	9	5
36	2022-01-25 16:06:47.811019+01	16	bertrandgrip@prospect.com	2	[{"changed": {"fields": ["Last name"]}}]	9	5
37	2022-01-25 16:26:31.404859+01	21	julientanak@prospect.com	1	[{"added": {}}]	9	5
38	2022-01-26 15:19:43.409006+01	21	julientanak@prospect.com	2	[{"changed": {"fields": ["Last name"]}}]	9	5
39	2022-01-31 16:14:03.597858+01	8	jeanmartin@eesupp.com	1	[{"added": {}}]	6	4
40	2022-01-31 16:14:39.769408+01	8	jeanmartin@eesupp.com	2	[{"changed": {"fields": ["Username", "First name", "Last name", "Phone", "Mobile", "Department", "Groups"]}}]	6	4
41	2022-02-01 16:27:21.092583+01	5	Support admin	1	[{"added": {}}]	3	2
42	2022-02-01 16:27:34.150981+01	4	Sales admin	2	[{"changed": {"fields": ["Permissions"]}}]	3	2
43	2022-02-01 16:30:08.532554+01	8	jeanmartin@eesupp.com	2	[{"changed": {"fields": ["Groups", "Is staff"]}}]	6	2
44	2022-02-01 16:30:49.399562+01	1	mariage M. X et Mme Y	2	[{"changed": {"fields": ["Status"]}}]	11	8
45	2022-02-01 17:02:55.879264+01	1	Mariage lambda	2	[{"changed": {"fields": ["Status"]}}]	10	5
46	2022-02-01 17:11:10.149829+01	5	ericmarona@eesales.com	2	[{"changed": {"fields": ["Groups"]}}]	6	2
47	2022-02-01 17:11:18.435514+01	8	jeanmartin@eesupp.com	2	[{"changed": {"fields": ["Groups"]}}]	6	2
48	2022-02-02 14:03:21.916737+01	9	marionmineta@eesales.com	1	[{"added": {}}]	6	2
49	2022-02-02 14:03:52.842697+01	9	marionmineta@eesales.com	2	[{"changed": {"fields": ["Username", "First name", "Last name", "Phone", "Mobile", "Department", "Groups"]}}]	6	2
50	2022-02-02 14:04:48.605097+01	10	edgarmani@eesupp.com	1	[{"added": {}}]	6	2
51	2022-02-02 14:05:15.183603+01	10	edgarmani@eesupp.com	2	[{"changed": {"fields": ["Username", "First name", "Last name", "Phone", "Mobile", "Department", "Groups"]}}]	6	2
52	2022-02-02 16:08:19.866953+01	1	mariage M. X et Mme Y	3		11	2
53	2022-02-02 16:10:42.740853+01	4	EVG Andr├® Lina	1	[{"added": {}}]	10	2
54	2022-02-02 16:11:42.114888+01	3	EVG Andr├® Lina	1	[{"added": {}}]	11	2
55	2022-02-02 16:11:53.630221+01	4	EVG Andr├® Lina	2	[{"changed": {"fields": ["Status", "Event"]}}]	10	2
56	2022-02-03 12:26:58.104795+01	5	Festival d'├®t├®	2	[{"changed": {"fields": ["Event"]}}]	10	2
57	2022-02-03 12:27:58.722263+01	2	soir├®e f├¬te nationale de juillet	3		11	2
58	2022-02-03 12:28:06.774866+01	5	Festival d'├®t├®	2	[]	10	2
59	2022-02-07 11:47:40.4583+01	5	ericmarona@eesales.com	2	[{"changed": {"fields": ["Groups", "Is admin"]}}]	6	2
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: EEadmin
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	contenttypes	contenttype
5	sessions	session
6	employeeApp	employee
7	authtoken	token
8	authtoken	tokenproxy
9	clients	client
10	contractsEvents	contract
11	contractsEvents	event
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: EEadmin
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2022-01-18 09:53:53.476645+01
2	contenttypes	0002_remove_content_type_name	2022-01-18 09:53:53.504581+01
3	auth	0001_initial	2022-01-18 09:53:53.631923+01
4	auth	0002_alter_permission_name_max_length	2022-01-18 09:53:53.642892+01
5	auth	0003_alter_user_email_max_length	2022-01-18 09:53:53.652867+01
6	auth	0004_alter_user_username_opts	2022-01-18 09:53:53.664833+01
7	auth	0005_alter_user_last_login_null	2022-01-18 09:53:53.68379+01
8	auth	0006_require_contenttypes_0002	2022-01-18 09:53:53.686778+01
9	auth	0007_alter_validators_add_error_messages	2022-01-18 09:53:53.694752+01
10	auth	0008_alter_user_username_max_length	2022-01-18 09:53:53.721684+01
11	auth	0009_alter_user_last_name_max_length	2022-01-18 09:53:53.735644+01
12	auth	0010_alter_group_name_max_length	2022-01-18 09:53:53.750609+01
13	auth	0011_update_proxy_permissions	2022-01-18 09:53:53.759094+01
14	auth	0012_alter_user_first_name_max_length	2022-01-18 09:53:53.771062+01
15	employeeApp	0001_initial	2022-01-18 09:53:53.871689+01
16	admin	0001_initial	2022-01-18 09:53:53.947488+01
17	admin	0002_logentry_remove_auto_add	2022-01-18 09:53:53.963447+01
18	admin	0003_logentry_add_action_flag_choices	2022-01-18 09:53:53.982397+01
19	authtoken	0001_initial	2022-01-18 09:53:54.022289+01
20	authtoken	0002_auto_20160226_1747	2022-01-18 09:53:54.098086+01
21	authtoken	0003_tokenproxy	2022-01-18 09:53:54.105068+01
22	sessions	0001_initial	2022-01-18 09:53:54.159963+01
23	employeeApp	0002_alter_employee_groups	2022-01-18 10:00:09.719396+01
24	clients	0001_initial	2022-01-24 15:43:52.343809+01
25	clients	0002_rename_compagny_name_client_company_name	2022-01-24 16:07:41.217762+01
26	clients	0003_alter_client_status	2022-01-24 16:27:26.563073+01
27	clients	0004_alter_client_status	2022-01-24 16:41:29.35342+01
28	employeeApp	0003_alter_employee_department	2022-01-24 17:22:28.286588+01
29	clients	0005_alter_client_uptaded_time	2022-01-25 16:12:50.378326+01
30	clients	0006_alter_client_uptaded_time	2022-01-25 16:26:19.900824+01
31	clients	0007_alter_client_uptaded_time	2022-01-26 15:37:05.984966+01
32	contractsEvents	0001_initial	2022-01-28 16:02:16.346552+01
33	contractsEvents	0002_alter_contract_event	2022-01-31 17:33:07.681439+01
34	contractsEvents	0003_alter_contract_value	2022-02-03 17:07:15.460639+01
35	contractsEvents	0004_alter_contract_value	2022-02-03 17:13:18.775133+01
36	contractsEvents	0005_alter_event_support_employee	2022-02-04 11:57:58.656925+01
37	clients	0008_rename_uptaded_time_client_updated_time	2022-02-04 15:02:21.936156+01
38	contractsEvents	0006_rename_uptaded_time_contract_updated_time_and_more	2022-02-04 15:02:21.989528+01
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: EEadmin
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
kc9q0sydkntcuqrw2jh50fxwblkb4ebd	.eJxVjEEOwiAQRe_C2hAgZQCX7j0DGYZBqgaS0q6Md9cmXej2v_f-S0Tc1hq3wUucszgLI06_W0J6cNtBvmO7dUm9rcuc5K7Igw557Zmfl8P9O6g46rcu4A0n5cCiS4WMZUUaUGl0BoBMUKy0T4Y0cbFQCk-TLx5C8EDZTuL9AeWyN-A:1nH4wT:OLQKHmJiR5p5kW3yzq_XNDfQWz_Z_r736pJxyo6DAjM	2022-02-21 15:24:33.673542+01
\.


--
-- Data for Name: employeeApp_employee; Type: TABLE DATA; Schema: public; Owner: EEadmin
--

COPY public."employeeApp_employee" (id, password, username, first_name, last_name, email, phone, mobile, department, created_time, modified_time, is_admin, is_active, is_superuser, is_staff, date_joined, last_login, groups_id) FROM stdin;
4	pbkdf2_sha256$320000$QP3E5ylPix8SF0NDdEUaw1$kKqxeZQR1C++Epwxze7HrniuC5OaRaFndyMSZK3UteE=	AliceMartinManagement	Alice	martin	alicemartin@eem.com	984894209	919129198	Management	2022-01-18 15:12:47.826086+01	2022-01-18 15:12:47.826086+01	f	t	f	t	2022-01-18 15:12:47.826086+01	2022-01-31 16:13:16.290406+01	1
2	pbkdf2_sha256$320000$MrQBcxnIhxUf68Vyw7HdCT$wx1WlE2ISO+qxXSS6IOVqtHVuBeqKeRUI4k6AvEAxwM=	epicadmin			epicadmin@ee.com			1	2022-01-18 10:00:41.844086+01	2022-01-18 10:00:41.844086+01	t	t	t	t	2022-01-18 10:00:41.844086+01	2022-02-07 15:24:33.664011+01	\N
7	pbkdf2_sha256$320000$q9Y1bUNQQmUaUGdoXujd4z$xGaQQx5Ccwjoe04+YDp02GPyK6r77z3+z3O3iJaHzFY=	testnonsalesmanagement	test	nonsales	testnonsales@eem.com	9429492924	9429192129	Management	2022-01-24 17:26:48.498861+01	2022-01-24 17:26:48.498861+01	f	t	f	t	2022-01-24 17:26:48.498861+01	2022-01-25 14:33:24.628801+01	1
6	pbkdf2_sha256$320000$pMMBJK0Zti9FXBvBxzWMqy$7gBlGZq+FwBNEbbUvsXUZHjc0IXtmq3K3P840/T6/bo=	ClementMenantManagement	Cl├®ment	Menant	clementmenant@eem.com	0498526134	0618115462	Management	2022-01-24 17:03:52.221421+01	2022-01-24 17:03:52.221421+01	f	t	f	t	2022-01-24 17:03:52.221421+01	2022-01-24 17:03:52.221421+01	1
8	pbkdf2_sha256$320000$Kq1lgLmgFglz9Rapol8Oyo$O7OYeKygRpNOrgMMUklMpGs/6KlLwVF6hJN+SACTRsk=	JeanMartinSupport	Jean	Martin	jeanmartin@eesupp.com	068981919	049898198	Support	2022-01-31 16:14:03.569544+01	2022-01-31 16:14:03.569544+01	f	t	f	t	2022-01-31 16:14:03.569544+01	2022-02-01 16:30:28.348683+01	2
9	pbkdf2_sha256$320000$M4wgRFhEdnYesWzTFKzrDI$senFvy+dAF7AHht9gZ0pFd2D5cIkuzfO2nbKDapTGOE=	MarionMinetaSales	Marion	Mineta	marionmineta@eesales.com	0645789562	0412389566	Sales	2022-02-02 14:03:21.884423+01	2022-02-02 14:03:21.884423+01	f	t	f	f	2022-02-02 14:03:21.884423+01	2022-02-02 14:03:21.884423+01	3
10	pbkdf2_sha256$320000$9tj6hwN0fHZKpJcHQVQCpa$G9gonTik1Mwd4OpyMa1XnaVBPmrMkgXM0HKKXXLXjVI=	EdgarManiSupport	Edgar	Mani	edgarmani@eesupp.com	0645782195	0412879932	Support	2022-02-02 14:04:48.603107+01	2022-02-02 14:04:48.603107+01	f	t	f	f	2022-02-02 14:04:48.603107+01	2022-02-02 14:04:48.603107+01	2
5	pbkdf2_sha256$320000$XS9DnmfAwvf3oYo52nD1o7$NHQC0VvTksq2sD4cR1bCE7QwW1vcAFYmO3f2vzYlWl8=	EricMaronaSales	Eric	Marona	ericmarona@eesales.com	654184156	651867867	Sales	2022-01-18 15:17:10.351968+01	2022-01-18 15:17:10.351968+01	f	t	f	t	2022-01-18 15:17:10.351968+01	2022-02-07 12:11:47.851717+01	4
\.


--
-- Data for Name: employeeApp_employee_user_permissions; Type: TABLE DATA; Schema: public; Owner: EEadmin
--

COPY public."employeeApp_employee_user_permissions" (id, employee_id, permission_id) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: EEadmin
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 5, true);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: EEadmin
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 24, true);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: EEadmin
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 44, true);


--
-- Name: clients_client_id_seq; Type: SEQUENCE SET; Schema: public; Owner: EEadmin
--

SELECT pg_catalog.setval('public.clients_client_id_seq', 26, true);


--
-- Name: contractsEvents_contract_id_seq; Type: SEQUENCE SET; Schema: public; Owner: EEadmin
--

SELECT pg_catalog.setval('public."contractsEvents_contract_id_seq"', 5, true);


--
-- Name: contractsEvents_event_id_seq; Type: SEQUENCE SET; Schema: public; Owner: EEadmin
--

SELECT pg_catalog.setval('public."contractsEvents_event_id_seq"', 4, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: EEadmin
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 59, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: EEadmin
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 11, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: EEadmin
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 38, true);


--
-- Name: employeeApp_employee_id_seq; Type: SEQUENCE SET; Schema: public; Owner: EEadmin
--

SELECT pg_catalog.setval('public."employeeApp_employee_id_seq"', 10, true);


--
-- Name: employeeApp_employee_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: EEadmin
--

SELECT pg_catalog.setval('public."employeeApp_employee_user_permissions_id_seq"', 1, false);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: EEadmin
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: EEadmin
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: EEadmin
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: EEadmin
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: EEadmin
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: EEadmin
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: authtoken_token authtoken_token_pkey; Type: CONSTRAINT; Schema: public; Owner: EEadmin
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_pkey PRIMARY KEY (key);


--
-- Name: authtoken_token authtoken_token_user_id_key; Type: CONSTRAINT; Schema: public; Owner: EEadmin
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_key UNIQUE (user_id);


--
-- Name: clients_client clients_client_email_key; Type: CONSTRAINT; Schema: public; Owner: EEadmin
--

ALTER TABLE ONLY public.clients_client
    ADD CONSTRAINT clients_client_email_key UNIQUE (email);


--
-- Name: clients_client clients_client_pkey; Type: CONSTRAINT; Schema: public; Owner: EEadmin
--

ALTER TABLE ONLY public.clients_client
    ADD CONSTRAINT clients_client_pkey PRIMARY KEY (id);


--
-- Name: contractsEvents_contract contractsEvents_contract_pkey; Type: CONSTRAINT; Schema: public; Owner: EEadmin
--

ALTER TABLE ONLY public."contractsEvents_contract"
    ADD CONSTRAINT "contractsEvents_contract_pkey" PRIMARY KEY (id);


--
-- Name: contractsEvents_event contractsEvents_event_pkey; Type: CONSTRAINT; Schema: public; Owner: EEadmin
--

ALTER TABLE ONLY public."contractsEvents_event"
    ADD CONSTRAINT "contractsEvents_event_pkey" PRIMARY KEY (id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: EEadmin
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: EEadmin
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: EEadmin
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: EEadmin
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: EEadmin
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: employeeApp_employee employeeApp_employee_email_key; Type: CONSTRAINT; Schema: public; Owner: EEadmin
--

ALTER TABLE ONLY public."employeeApp_employee"
    ADD CONSTRAINT "employeeApp_employee_email_key" UNIQUE (email);


--
-- Name: employeeApp_employee employeeApp_employee_pkey; Type: CONSTRAINT; Schema: public; Owner: EEadmin
--

ALTER TABLE ONLY public."employeeApp_employee"
    ADD CONSTRAINT "employeeApp_employee_pkey" PRIMARY KEY (id);


--
-- Name: employeeApp_employee_user_permissions employeeApp_employee_use_employee_id_permission_i_33dcf5b6_uniq; Type: CONSTRAINT; Schema: public; Owner: EEadmin
--

ALTER TABLE ONLY public."employeeApp_employee_user_permissions"
    ADD CONSTRAINT "employeeApp_employee_use_employee_id_permission_i_33dcf5b6_uniq" UNIQUE (employee_id, permission_id);


--
-- Name: employeeApp_employee_user_permissions employeeApp_employee_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: EEadmin
--

ALTER TABLE ONLY public."employeeApp_employee_user_permissions"
    ADD CONSTRAINT "employeeApp_employee_user_permissions_pkey" PRIMARY KEY (id);


--
-- Name: employeeApp_employee employeeApp_employee_username_key; Type: CONSTRAINT; Schema: public; Owner: EEadmin
--

ALTER TABLE ONLY public."employeeApp_employee"
    ADD CONSTRAINT "employeeApp_employee_username_key" UNIQUE (username);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: EEadmin
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: EEadmin
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: EEadmin
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: EEadmin
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: authtoken_token_key_10f0b77e_like; Type: INDEX; Schema: public; Owner: EEadmin
--

CREATE INDEX authtoken_token_key_10f0b77e_like ON public.authtoken_token USING btree (key varchar_pattern_ops);


--
-- Name: clients_client_email_29ccf6eb_like; Type: INDEX; Schema: public; Owner: EEadmin
--

CREATE INDEX clients_client_email_29ccf6eb_like ON public.clients_client USING btree (email varchar_pattern_ops);


--
-- Name: clients_client_sales_employee_id_f0211f30; Type: INDEX; Schema: public; Owner: EEadmin
--

CREATE INDEX clients_client_sales_employee_id_f0211f30 ON public.clients_client USING btree (sales_employee_id);


--
-- Name: contractsEvents_contract_client_id_6dff6b31; Type: INDEX; Schema: public; Owner: EEadmin
--

CREATE INDEX "contractsEvents_contract_client_id_6dff6b31" ON public."contractsEvents_contract" USING btree (client_id);


--
-- Name: contractsEvents_contract_event_id_7a80cc2d; Type: INDEX; Schema: public; Owner: EEadmin
--

CREATE INDEX "contractsEvents_contract_event_id_7a80cc2d" ON public."contractsEvents_contract" USING btree (event_id);


--
-- Name: contractsEvents_contract_sales_administrator_id_cef7c5a4; Type: INDEX; Schema: public; Owner: EEadmin
--

CREATE INDEX "contractsEvents_contract_sales_administrator_id_cef7c5a4" ON public."contractsEvents_contract" USING btree (sales_administrator_id);


--
-- Name: contractsEvents_event_support_employee_id_c70d5d7f; Type: INDEX; Schema: public; Owner: EEadmin
--

CREATE INDEX "contractsEvents_event_support_employee_id_c70d5d7f" ON public."contractsEvents_event" USING btree (support_employee_id);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: EEadmin
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: EEadmin
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: EEadmin
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: EEadmin
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: employeeApp_employee_email_74b7e3c7_like; Type: INDEX; Schema: public; Owner: EEadmin
--

CREATE INDEX "employeeApp_employee_email_74b7e3c7_like" ON public."employeeApp_employee" USING btree (email varchar_pattern_ops);


--
-- Name: employeeApp_employee_groups_id_b4c9982e; Type: INDEX; Schema: public; Owner: EEadmin
--

CREATE INDEX "employeeApp_employee_groups_id_b4c9982e" ON public."employeeApp_employee" USING btree (groups_id);


--
-- Name: employeeApp_employee_user_permissions_employee_id_bee72995; Type: INDEX; Schema: public; Owner: EEadmin
--

CREATE INDEX "employeeApp_employee_user_permissions_employee_id_bee72995" ON public."employeeApp_employee_user_permissions" USING btree (employee_id);


--
-- Name: employeeApp_employee_user_permissions_permission_id_e08fafd6; Type: INDEX; Schema: public; Owner: EEadmin
--

CREATE INDEX "employeeApp_employee_user_permissions_permission_id_e08fafd6" ON public."employeeApp_employee_user_permissions" USING btree (permission_id);


--
-- Name: employeeApp_employee_username_5e1bb95e_like; Type: INDEX; Schema: public; Owner: EEadmin
--

CREATE INDEX "employeeApp_employee_username_5e1bb95e_like" ON public."employeeApp_employee" USING btree (username varchar_pattern_ops);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: EEadmin
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: EEadmin
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: EEadmin
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: authtoken_token authtoken_token_user_id_35299eff_fk_employeeApp_employee_id; Type: FK CONSTRAINT; Schema: public; Owner: EEadmin
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT "authtoken_token_user_id_35299eff_fk_employeeApp_employee_id" FOREIGN KEY (user_id) REFERENCES public."employeeApp_employee"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: clients_client clients_client_sales_employee_id_f0211f30_fk_employeeA; Type: FK CONSTRAINT; Schema: public; Owner: EEadmin
--

ALTER TABLE ONLY public.clients_client
    ADD CONSTRAINT "clients_client_sales_employee_id_f0211f30_fk_employeeA" FOREIGN KEY (sales_employee_id) REFERENCES public."employeeApp_employee"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: contractsEvents_contract contractsEvents_cont_client_id_6dff6b31_fk_clients_c; Type: FK CONSTRAINT; Schema: public; Owner: EEadmin
--

ALTER TABLE ONLY public."contractsEvents_contract"
    ADD CONSTRAINT "contractsEvents_cont_client_id_6dff6b31_fk_clients_c" FOREIGN KEY (client_id) REFERENCES public.clients_client(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: contractsEvents_contract contractsEvents_cont_event_id_7a80cc2d_fk_contracts; Type: FK CONSTRAINT; Schema: public; Owner: EEadmin
--

ALTER TABLE ONLY public."contractsEvents_contract"
    ADD CONSTRAINT "contractsEvents_cont_event_id_7a80cc2d_fk_contracts" FOREIGN KEY (event_id) REFERENCES public."contractsEvents_event"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: contractsEvents_contract contractsEvents_cont_sales_administrator__cef7c5a4_fk_employeeA; Type: FK CONSTRAINT; Schema: public; Owner: EEadmin
--

ALTER TABLE ONLY public."contractsEvents_contract"
    ADD CONSTRAINT "contractsEvents_cont_sales_administrator__cef7c5a4_fk_employeeA" FOREIGN KEY (sales_administrator_id) REFERENCES public."employeeApp_employee"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: contractsEvents_event contractsEvents_even_support_employee_id_c70d5d7f_fk_employeeA; Type: FK CONSTRAINT; Schema: public; Owner: EEadmin
--

ALTER TABLE ONLY public."contractsEvents_event"
    ADD CONSTRAINT "contractsEvents_even_support_employee_id_c70d5d7f_fk_employeeA" FOREIGN KEY (support_employee_id) REFERENCES public."employeeApp_employee"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: EEadmin
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_employeeApp_employee_id; Type: FK CONSTRAINT; Schema: public; Owner: EEadmin
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT "django_admin_log_user_id_c564eba6_fk_employeeApp_employee_id" FOREIGN KEY (user_id) REFERENCES public."employeeApp_employee"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: employeeApp_employee_user_permissions employeeApp_employee_employee_id_bee72995_fk_employeeA; Type: FK CONSTRAINT; Schema: public; Owner: EEadmin
--

ALTER TABLE ONLY public."employeeApp_employee_user_permissions"
    ADD CONSTRAINT "employeeApp_employee_employee_id_bee72995_fk_employeeA" FOREIGN KEY (employee_id) REFERENCES public."employeeApp_employee"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: employeeApp_employee employeeApp_employee_groups_id_b4c9982e_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: EEadmin
--

ALTER TABLE ONLY public."employeeApp_employee"
    ADD CONSTRAINT "employeeApp_employee_groups_id_b4c9982e_fk_auth_group_id" FOREIGN KEY (groups_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: employeeApp_employee_user_permissions employeeApp_employee_permission_id_e08fafd6_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: EEadmin
--

ALTER TABLE ONLY public."employeeApp_employee_user_permissions"
    ADD CONSTRAINT "employeeApp_employee_permission_id_e08fafd6_fk_auth_perm" FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

