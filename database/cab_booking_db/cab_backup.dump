--
-- PostgreSQL database dump
--

-- Dumped from database version 12.13 (Ubuntu 12.13-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 15.2 (Ubuntu 15.2-1.pgdg22.04+1)

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
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO postgres;

--
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;


--
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


--
-- Name: gender; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.gender AS ENUM (
    'male',
    'female',
    'others'
);


ALTER TYPE public.gender OWNER TO postgres;

--
-- Name: payment_methods; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.payment_methods AS ENUM (
    'cash',
    'upi',
    'card',
    'net banking'
);


ALTER TYPE public.payment_methods OWNER TO postgres;

--
-- Name: rate_val; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.rate_val AS ENUM (
    '1',
    '2',
    '3',
    '4',
    '5'
);


ALTER TYPE public.rate_val OWNER TO postgres;

--
-- Name: transaction_status; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.transaction_status AS ENUM (
    'success',
    'failed',
    'pending'
);


ALTER TYPE public.transaction_status OWNER TO postgres;

--
-- Name: trip_status; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.trip_status AS ENUM (
    'booked',
    'cancelled',
    'confirmed',
    'completed'
);


ALTER TYPE public.trip_status OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: bookings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bookings (
    id uuid DEFAULT public.uuid_generate_v1() NOT NULL,
    customer_id uuid,
    driver_id uuid,
    status public.trip_status,
    "from" date DEFAULT now(),
    "to" date DEFAULT now(),
    source point,
    destination point,
    booked_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.bookings OWNER TO postgres;

--
-- Name: cab_categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cab_categories (
    cabs_id uuid,
    cab_types_id integer
);


ALTER TABLE public.cab_categories OWNER TO postgres;

--
-- Name: cab_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cab_types (
    id integer NOT NULL,
    type character varying,
    base_charge numeric,
    charge_type integer,
    per_charge numeric
);


ALTER TABLE public.cab_types OWNER TO postgres;

--
-- Name: cabs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cabs (
    id uuid DEFAULT public.uuid_generate_v1() NOT NULL,
    driver_id uuid,
    name character varying,
    reg_no character varying NOT NULL,
    reg_date date
);


ALTER TABLE public.cabs OWNER TO postgres;

--
-- Name: charging_modes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.charging_modes (
    id integer NOT NULL,
    mode character varying
);


ALTER TABLE public.charging_modes OWNER TO postgres;

--
-- Name: COLUMN charging_modes.mode; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.charging_modes.mode IS 'per km, per hour,per day,etc';


--
-- Name: miscellaneous_charges; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.miscellaneous_charges (
    id integer NOT NULL,
    name character varying,
    charge numeric
);


ALTER TABLE public.miscellaneous_charges OWNER TO postgres;

--
-- Name: other_charges; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.other_charges (
    cab_types_id integer,
    miscellaneous_charges_id integer
);


ALTER TABLE public.other_charges OWNER TO postgres;

--
-- Name: payments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payments (
    id uuid DEFAULT public.uuid_generate_v1() NOT NULL,
    booking_id uuid,
    method public.payment_methods,
    amount numeric,
    created_at timestamp with time zone DEFAULT now(),
    status public.transaction_status
);


ALTER TABLE public.payments OWNER TO postgres;

--
-- Name: ratings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ratings (
    id uuid DEFAULT public.uuid_generate_v1() NOT NULL,
    book_id uuid,
    value public.rate_val DEFAULT '5'::public.rate_val,
    feedback text
);


ALTER TABLE public.ratings OWNER TO postgres;

--
-- Name: role_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.role_types (
    id integer NOT NULL,
    role character varying NOT NULL
);


ALTER TABLE public.role_types OWNER TO postgres;

--
-- Name: roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.roles (
    users_id uuid NOT NULL,
    roles_id integer NOT NULL
);


ALTER TABLE public.roles OWNER TO postgres;

--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id uuid DEFAULT public.uuid_generate_v1() NOT NULL,
    name character varying,
    email character varying,
    phone character varying NOT NULL,
    dob date,
    gender public.gender,
    created_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: COLUMN users.phone; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.users.phone IS 'Assuming phone number as authenticator';


--
-- Data for Name: bookings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bookings (id, customer_id, driver_id, status, "from", "to", source, destination, booked_at) FROM stdin;
777fb6b4-7c5b-4927-88ae-5b16499c5b4c	e21394de-af6b-11ed-9ed3-1b0367dc8e20	1d3aacf8-af6c-11ed-9ed3-1b0367dc8e20	completed	2023-02-20	2023-02-20	(50.1292303,32.4626078)	(37.0476194,52.9743779)	2023-02-20 14:17:24.17895+05:30
e2995c57-0c79-4ea8-9a8c-9ab804b923bc	1d3aacf0-af6c-11ed-9ed3-1b0367dc8e20	1d3aacfa-af6c-11ed-9ed3-1b0367dc8e20	booked	2023-02-20	2023-02-20	(120.413631,15.92762)	(-41.5612423,-20.1217728)	2023-02-20 14:18:58.998989+05:30
9cd2ec1f-0fe8-4772-92eb-0ae033b879a6	1d3aacf1-af6c-11ed-9ed3-1b0367dc8e20	1d3aacfb-af6c-11ed-9ed3-1b0367dc8e20	completed	2023-02-20	2023-02-20	(37.39423,55.650711)	(6.774529,51.1615558)	2023-02-20 14:19:07.851068+05:30
2c4e0d69-69c9-4e69-82c1-f49aa994ddb2	1d3aacf2-af6c-11ed-9ed3-1b0367dc8e20	1d3aacfc-af6c-11ed-9ed3-1b0367dc8e20	cancelled	2023-02-20	2023-02-20	(-80.6482153,-4.8383044)	(114.9755481,44.0150814)	2023-02-20 14:19:07.864072+05:30
cea0b495-0a06-47d4-9df4-e2a7f8608168	1d3aacf3-af6c-11ed-9ed3-1b0367dc8e20	1d3aacfd-af6c-11ed-9ed3-1b0367dc8e20	confirmed	2023-02-20	2023-02-20	(-9.232542,39.3253135)	(-72.1579033,-13.3346641)	2023-02-20 14:19:07.872071+05:30
80bb2faa-393f-4e85-b0f2-e293f7cbcc2c	1d3aacf4-af6c-11ed-9ed3-1b0367dc8e20	1d3aacfe-af6c-11ed-9ed3-1b0367dc8e20	confirmed	2023-02-20	2023-02-20	(-7.2372538,39.9226488)	(112.390857,35.293048)	2023-02-20 14:19:07.880513+05:30
bc43badb-32e8-43d7-ac49-5836f1d8229d	1d3aacf5-af6c-11ed-9ed3-1b0367dc8e20	1d3aacff-af6c-11ed-9ed3-1b0367dc8e20	completed	2023-02-20	2023-02-20	(35.124097,31.87989)	(47.9400154,29.273357)	2023-02-20 14:19:07.888842+05:30
e25e0ab0-4fd0-4fce-b223-4aefb29fd6ea	1d3aacf6-af6c-11ed-9ed3-1b0367dc8e20	1d3aad00-af6c-11ed-9ed3-1b0367dc8e20	completed	2023-02-20	2023-02-20	(112.4619282,-6.972219)	(-44.9833395,-4.6138241)	2023-02-20 14:19:07.897342+05:30
62e1b271-b35b-4048-9193-0c838e6d2975	d436516e-b0e0-11ed-b086-436833f0f540	d4365171-b0e0-11ed-b086-436833f0f540	booked	2023-02-20	2023-02-20	(44.5219358,33.8430437)	(13.1536197,55.376816)	2023-02-20 14:19:07.906629+05:30
4e5d2b78-9a3a-44fa-8be3-72a9c18a6917	d4365170-b0e0-11ed-b086-436833f0f540	d4365173-b0e0-11ed-b086-436833f0f540	completed	2023-02-20	2023-02-20	(111.1041635,-6.6328316)	(13.9774742,49.9120778)	2023-02-20 14:19:07.913842+05:30
6ed9812c-ce66-43a6-b0ab-d344ead6a6db	e21394de-af6b-11ed-9ed3-1b0367dc8e20	d4365173-b0e0-11ed-b086-436833f0f540	completed	2023-02-20	2023-02-20	(-9.3719884,38.7432706)	(124.9202302,11.1856085)	2023-02-20 14:19:07.922087+05:30
207d277a-13b3-4850-9cbe-7f1773c9ae62	1d3aacf3-af6c-11ed-9ed3-1b0367dc8e20	d4365173-b0e0-11ed-b086-436833f0f540	completed	2023-02-20	2023-02-20	(26.5963713,-10.8778699)	(-78.25705,-6.906714)	2023-02-20 14:19:07.930513+05:30
501f6bac-6b75-4239-9fc6-cf238de71ab9	1d3aad00-af6c-11ed-9ed3-1b0367dc8e20	d4365173-b0e0-11ed-b086-436833f0f540	completed	2023-02-20	2023-02-20	(86.937376,28.505315)	(120.3867834,-8.5997534)	2023-02-20 14:19:07.938766+05:30
4b94ca9c-3668-485a-bbff-147135e3b949	e21394de-af6b-11ed-9ed3-1b0367dc8e20	1d3aacf8-af6c-11ed-9ed3-1b0367dc8e20	booked	2023-02-20	2023-02-20	(-88.9856574,13.8354819)	(24.5034541,58.610989)	2023-02-20 14:19:07.947096+05:30
ef65390f-1ada-47ff-bb96-239a893846b0	e21394de-af6b-11ed-9ed3-1b0367dc8e20	1d3aacff-af6c-11ed-9ed3-1b0367dc8e20	completed	2023-02-20	2023-02-20	(19.8420937,43.8554024)	(34.844675,32.162413)	2023-02-20 14:19:07.955341+05:30
bf2d190e-4ffc-4677-af2e-f608d4c15009	1d3aacf3-af6c-11ed-9ed3-1b0367dc8e20	1d3aacfd-af6c-11ed-9ed3-1b0367dc8e20	cancelled	2023-02-20	2023-02-20	(18.3257,54.6186348)	(130.5762726,32.9483104)	2023-02-20 14:19:07.963929+05:30
e41ff1d5-a7e4-4e6e-a2ba-4f15981196b6	1d3aad00-af6c-11ed-9ed3-1b0367dc8e20	1d3aacfd-af6c-11ed-9ed3-1b0367dc8e20	cancelled	2023-02-20	2023-02-20	(-65.0008536,-19.1813272)	(120.3168231,29.1520649)	2023-02-20 14:19:07.972143+05:30
0a7e200b-03f6-445e-b034-add640d67f61	1d3aad00-af6c-11ed-9ed3-1b0367dc8e20	1d3aacfd-af6c-11ed-9ed3-1b0367dc8e20	confirmed	2023-02-20	2023-02-20	(106.8203259,-6.2151565)	(45.4912648,39.3256814)	2023-02-20 14:19:07.980436+05:30
\.


--
-- Data for Name: cab_categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cab_categories (cabs_id, cab_types_id) FROM stdin;
36757f2e-b0e3-11ed-b086-436833f0f540	1
36757f2e-b0e3-11ed-b086-436833f0f540	2
36757f2e-b0e3-11ed-b086-436833f0f540	3
36757f2e-b0e3-11ed-b086-436833f0f540	4
36757f2e-b0e3-11ed-b086-436833f0f540	5
36757f2e-b0e3-11ed-b086-436833f0f540	6
36757f2e-b0e3-11ed-b086-436833f0f540	7
36757f2e-b0e3-11ed-b086-436833f0f540	12
36757f2e-b0e3-11ed-b086-436833f0f540	13
36757f39-b0e3-11ed-b086-436833f0f540	1
36757f39-b0e3-11ed-b086-436833f0f540	2
36757f39-b0e3-11ed-b086-436833f0f540	3
36757f39-b0e3-11ed-b086-436833f0f540	4
36757f39-b0e3-11ed-b086-436833f0f540	5
36757f39-b0e3-11ed-b086-436833f0f540	6
36757f39-b0e3-11ed-b086-436833f0f540	7
36757f39-b0e3-11ed-b086-436833f0f540	12
36757f39-b0e3-11ed-b086-436833f0f540	13
36757f2f-b0e3-11ed-b086-436833f0f540	1
36757f2f-b0e3-11ed-b086-436833f0f540	2
36757f2f-b0e3-11ed-b086-436833f0f540	3
36757f2f-b0e3-11ed-b086-436833f0f540	6
36757f2f-b0e3-11ed-b086-436833f0f540	7
36757f2f-b0e3-11ed-b086-436833f0f540	13
36757f30-b0e3-11ed-b086-436833f0f540	11
36757f30-b0e3-11ed-b086-436833f0f540	13
36757f31-b0e3-11ed-b086-436833f0f540	1
36757f31-b0e3-11ed-b086-436833f0f540	5
36757f31-b0e3-11ed-b086-436833f0f540	7
36757f31-b0e3-11ed-b086-436833f0f540	10
36757f31-b0e3-11ed-b086-436833f0f540	13
36757f38-b0e3-11ed-b086-436833f0f540	1
36757f38-b0e3-11ed-b086-436833f0f540	5
36757f38-b0e3-11ed-b086-436833f0f540	7
36757f38-b0e3-11ed-b086-436833f0f540	10
36757f38-b0e3-11ed-b086-436833f0f540	13
49003bfc-b0e3-11ed-b086-436833f0f540	1
49003bfc-b0e3-11ed-b086-436833f0f540	5
49003bfc-b0e3-11ed-b086-436833f0f540	7
49003bfc-b0e3-11ed-b086-436833f0f540	10
49003bfc-b0e3-11ed-b086-436833f0f540	13
36757f32-b0e3-11ed-b086-436833f0f540	12
36757f35-b0e3-11ed-b086-436833f0f540	12
36757f36-b0e3-11ed-b086-436833f0f540	12
36757f3a-b0e3-11ed-b086-436833f0f540	12
36757f33-b0e3-11ed-b086-436833f0f540	1
36757f33-b0e3-11ed-b086-436833f0f540	2
36757f33-b0e3-11ed-b086-436833f0f540	3
36757f33-b0e3-11ed-b086-436833f0f540	4
36757f33-b0e3-11ed-b086-436833f0f540	6
36757f33-b0e3-11ed-b086-436833f0f540	7
36757f33-b0e3-11ed-b086-436833f0f540	13
36757f34-b0e3-11ed-b086-436833f0f540	11
36757f34-b0e3-11ed-b086-436833f0f540	13
36757f37-b0e3-11ed-b086-436833f0f540	4
36757f37-b0e3-11ed-b086-436833f0f540	6
36757f37-b0e3-11ed-b086-436833f0f540	7
36757f3b-b0e3-11ed-b086-436833f0f540	11
\.


--
-- Data for Name: cab_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cab_types (id, type, base_charge, charge_type, per_charge) FROM stdin;
1	Uber Reserve	100	1	15
2	Hourly	112	2	20
3	UberX	70	1	13
4	UberX Saver	50	1	11
5	UberX Share	50	1	9
6	Uber Taxi	70	2	20
7	Uber Intercity	130	2	50
8	Scooters	100	2	5
9	Bikes	100	2	10
10	UberXL	200	1	20
11	Uber Comfort	230	2	60
12	Uber Green	125	1	5
13	Uber Rent	80	3	1500
\.


--
-- Data for Name: cabs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cabs (id, driver_id, name, reg_no, reg_date) FROM stdin;
36757f2e-b0e3-11ed-b086-436833f0f540	1d3aacfb-af6c-11ed-9ed3-1b0367dc8e20	Lincoln	PN-02-VS-3222	2020-07-22
36757f2f-b0e3-11ed-b086-436833f0f540	1d3aacfc-af6c-11ed-9ed3-1b0367dc8e20	Volkswagen	HR-82-JN-5272	2013-02-16
36757f30-b0e3-11ed-b086-436833f0f540	1d3aacfd-af6c-11ed-9ed3-1b0367dc8e20	Acura	DL-52-CA-3242	2022-08-10
36757f31-b0e3-11ed-b086-436833f0f540	1d3aacfe-af6c-11ed-9ed3-1b0367dc8e20	Nissan	HR-02-EO-8242	2018-05-20
36757f32-b0e3-11ed-b086-436833f0f540	1d3aacff-af6c-11ed-9ed3-1b0367dc8e20	Chrysler	PN-82-SC-3292	2018-06-18
36757f33-b0e3-11ed-b086-436833f0f540	1d3aad00-af6c-11ed-9ed3-1b0367dc8e20	Dodge	PN-52-EA-6232	2014-03-10
36757f34-b0e3-11ed-b086-436833f0f540	1d3aad01-af6c-11ed-9ed3-1b0367dc8e20	GMC	DL-22-BN-5262	2022-12-14
36757f35-b0e3-11ed-b086-436833f0f540	1d3aad02-af6c-11ed-9ed3-1b0367dc8e20	Chrysler	HR-52-IX-5222	2013-12-13
36757f36-b0e3-11ed-b086-436833f0f540	d4365176-b0e0-11ed-b086-436833f0f540	Chrysler	PN-62-KQ-5262	2021-05-30
36757f37-b0e3-11ed-b086-436833f0f540	1d3aad03-af6c-11ed-9ed3-1b0367dc8e20	Kia	PN-92-DD-8262	2018-05-19
36757f38-b0e3-11ed-b086-436833f0f540	d4365174-b0e0-11ed-b086-436833f0f540	Nissan	PN-42-HC-8212	2012-06-11
36757f39-b0e3-11ed-b086-436833f0f540	d4365175-b0e0-11ed-b086-436833f0f540	Lincoln	PN-22-BF-1292	2022-09-27
36757f3a-b0e3-11ed-b086-436833f0f540	ab7d420b-b0e0-11ed-b086-436833f0f540	Chrysler	PN-62-AW-0232	2013-01-26
36757f3b-b0e3-11ed-b086-436833f0f540	d4365171-b0e0-11ed-b086-436833f0f540	Honda	HR-02-PB-6202	2012-09-10
49003bfc-b0e3-11ed-b086-436833f0f540	1d3aacfa-af6c-11ed-9ed3-1b0367dc8e20	Nissan	UP-02-QF-6242	2018-10-11
\.


--
-- Data for Name: charging_modes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.charging_modes (id, mode) FROM stdin;
1	per km
2	per hr
3	per day
\.


--
-- Data for Name: miscellaneous_charges; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.miscellaneous_charges (id, name, charge) FROM stdin;
1	extra hours	30
2	extra kilometer	20
3	night charge	100
4	parking charge	60
5	waiting charge	50
6	outstation charge	100
\.


--
-- Data for Name: other_charges; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.other_charges (cab_types_id, miscellaneous_charges_id) FROM stdin;
1	1
1	2
1	3
1	4
1	5
1	6
2	1
2	3
2	4
2	5
2	6
3	1
3	3
3	2
3	5
3	6
4	1
4	2
4	3
4	6
5	1
5	2
5	3
5	6
6	5
6	1
6	2
6	3
6	6
7	5
7	1
7	2
7	6
8	1
9	1
10	5
10	1
10	2
10	3
10	6
11	5
11	1
11	2
11	3
11	6
12	5
12	1
12	2
12	3
12	6
13	4
13	5
13	1
13	2
13	3
13	6
\.


--
-- Data for Name: payments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.payments (id, booking_id, method, amount, created_at, status) FROM stdin;
a2aa4d80-b0fe-11ed-b086-436833f0f540	777fb6b4-7c5b-4927-88ae-5b16499c5b4c	card	1076.6	2023-02-20 14:42:01.55939+05:30	success
accea5d6-b0fe-11ed-b086-436833f0f540	9cd2ec1f-0fe8-4772-92eb-0ae033b879a6	net banking	2770.62	2023-02-20 14:42:18.575303+05:30	success
accea5d7-b0fe-11ed-b086-436833f0f540	cea0b495-0a06-47d4-9df4-e2a7f8608168	net banking	1606.15	2023-02-20 14:42:18.590401+05:30	success
accea5d8-b0fe-11ed-b086-436833f0f540	80bb2faa-393f-4e85-b0f2-e293f7cbcc2c	upi	2793.11	2023-02-20 14:42:18.599003+05:30	success
accea5d9-b0fe-11ed-b086-436833f0f540	bc43badb-32e8-43d7-ac49-5836f1d8229d	card	1523.47	2023-02-20 14:42:18.607107+05:30	success
accea5da-b0fe-11ed-b086-436833f0f540	e25e0ab0-4fd0-4fce-b223-4aefb29fd6ea	net banking	2084.92	2023-02-20 14:42:18.615749+05:30	success
accea5db-b0fe-11ed-b086-436833f0f540	4e5d2b78-9a3a-44fa-8be3-72a9c18a6917	card	2129.01	2023-02-20 14:42:18.623949+05:30	success
accea5dc-b0fe-11ed-b086-436833f0f540	6ed9812c-ce66-43a6-b0ab-d344ead6a6db	upi	1542.71	2023-02-20 14:42:18.632377+05:30	success
accea5dd-b0fe-11ed-b086-436833f0f540	207d277a-13b3-4850-9cbe-7f1773c9ae62	net banking	1172.72	2023-02-20 14:42:18.640746+05:30	success
accea5de-b0fe-11ed-b086-436833f0f540	501f6bac-6b75-4239-9fc6-cf238de71ab9	net banking	2443.01	2023-02-20 14:42:18.649041+05:30	success
accea5df-b0fe-11ed-b086-436833f0f540	ef65390f-1ada-47ff-bb96-239a893846b0	net banking	1211.88	2023-02-20 14:42:18.657225+05:30	success
accea5e0-b0fe-11ed-b086-436833f0f540	0a7e200b-03f6-445e-b034-add640d67f61	card	2935.42	2023-02-20 14:42:18.665512+05:30	success
accea5e1-b0fe-11ed-b086-436833f0f540	e2995c57-0c79-4ea8-9a8c-9ab804b923bc	net banking	1081.43	2023-02-20 14:42:18.674141+05:30	pending
accea5e2-b0fe-11ed-b086-436833f0f540	62e1b271-b35b-4048-9193-0c838e6d2975	card	1893.92	2023-02-20 14:42:18.682276+05:30	pending
accea5e3-b0fe-11ed-b086-436833f0f540	4b94ca9c-3668-485a-bbff-147135e3b949	net banking	1256.9	2023-02-20 14:42:18.690738+05:30	pending
0d3feaec-b0ff-11ed-b086-436833f0f540	2c4e0d69-69c9-4e69-82c1-f49aa994ddb2	card	2007.22	2023-02-20 14:45:00.378079+05:30	failed
10f5ac26-b0ff-11ed-b086-436833f0f540	bf2d190e-4ffc-4677-af2e-f608d4c15009	net banking	1363.29	2023-02-20 14:45:06.603059+05:30	failed
10f5ac27-b0ff-11ed-b086-436833f0f540	e41ff1d5-a7e4-4e6e-a2ba-4f15981196b6	card	2615.74	2023-02-20 14:45:06.616729+05:30	failed
\.


--
-- Data for Name: ratings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ratings (id, book_id, value, feedback) FROM stdin;
7d169bf8-70d8-45ac-ab6b-bd20efba71c5	777fb6b4-7c5b-4927-88ae-5b16499c5b4c	3	Overall experience was average.
57819449-f728-45f1-a398-fff043560d89	9cd2ec1f-0fe8-4772-92eb-0ae033b879a6	5	Overall experience was awesome.
8f917664-676c-49a7-a2db-69799ae39bed	bc43badb-32e8-43d7-ac49-5836f1d8229d	3	Overall experience was average.
6efe299f-840f-46a8-a9d2-fe066aac5891	e25e0ab0-4fd0-4fce-b223-4aefb29fd6ea	2	Overall experience was not good.
0e4b0093-35a8-427e-b0df-4ee9206788cc	4e5d2b78-9a3a-44fa-8be3-72a9c18a6917	3	Overall experience was average.
75c42289-ad1f-468a-b0bd-b926562b5a10	6ed9812c-ce66-43a6-b0ab-d344ead6a6db	3	Overall experience was average.
ee345324-b157-4691-bd14-c143f14ed795	207d277a-13b3-4850-9cbe-7f1773c9ae62	5	\N
0a2a9482-c670-45dc-aa0d-cb623ca252c2	501f6bac-6b75-4239-9fc6-cf238de71ab9	1	Overall experience was not good.
f343de46-4cab-47b8-b73e-ac891090a7d5	ef65390f-1ada-47ff-bb96-239a893846b0	2	Overall experience was average.
\.


--
-- Data for Name: role_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.role_types (id, role) FROM stdin;
1	user
2	driver
\.


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.roles (users_id, roles_id) FROM stdin;
e21394de-af6b-11ed-9ed3-1b0367dc8e20	1
1d3aacf0-af6c-11ed-9ed3-1b0367dc8e20	1
1d3aacf1-af6c-11ed-9ed3-1b0367dc8e20	1
1d3aacf3-af6c-11ed-9ed3-1b0367dc8e20	1
1d3aacf4-af6c-11ed-9ed3-1b0367dc8e20	1
1d3aacf5-af6c-11ed-9ed3-1b0367dc8e20	1
1d3aacf6-af6c-11ed-9ed3-1b0367dc8e20	1
1d3aacf7-af6c-11ed-9ed3-1b0367dc8e20	1
1d3aacf9-af6c-11ed-9ed3-1b0367dc8e20	1
1d3aacfa-af6c-11ed-9ed3-1b0367dc8e20	2
1d3aacfb-af6c-11ed-9ed3-1b0367dc8e20	2
1d3aacfc-af6c-11ed-9ed3-1b0367dc8e20	2
1d3aacfd-af6c-11ed-9ed3-1b0367dc8e20	2
1d3aacfe-af6c-11ed-9ed3-1b0367dc8e20	2
1d3aacff-af6c-11ed-9ed3-1b0367dc8e20	2
1d3aad00-af6c-11ed-9ed3-1b0367dc8e20	2
1d3aad01-af6c-11ed-9ed3-1b0367dc8e20	2
1d3aad02-af6c-11ed-9ed3-1b0367dc8e20	2
1d3aad00-af6c-11ed-9ed3-1b0367dc8e20	1
1d3aad01-af6c-11ed-9ed3-1b0367dc8e20	1
1d3aad02-af6c-11ed-9ed3-1b0367dc8e20	1
1d3aacf2-af6c-11ed-9ed3-1b0367dc8e20	1
ab7d420c-b0e0-11ed-b086-436833f0f540	1
d4365172-b0e0-11ed-b086-436833f0f540	1
d436516f-b0e0-11ed-b086-436833f0f540	1
d4365170-b0e0-11ed-b086-436833f0f540	1
d436516e-b0e0-11ed-b086-436833f0f540	1
d4365176-b0e0-11ed-b086-436833f0f540	1
d4365176-b0e0-11ed-b086-436833f0f540	2
1d3aad03-af6c-11ed-9ed3-1b0367dc8e20	2
d4365174-b0e0-11ed-b086-436833f0f540	2
d4365175-b0e0-11ed-b086-436833f0f540	2
ab7d420b-b0e0-11ed-b086-436833f0f540	2
d4365171-b0e0-11ed-b086-436833f0f540	2
1d3aacf8-af6c-11ed-9ed3-1b0367dc8e20	2
d4365173-b0e0-11ed-b086-436833f0f540	2
1d3aacf7-af6c-11ed-9ed3-1b0367dc8e20	2
1d3aacf9-af6c-11ed-9ed3-1b0367dc8e20	2
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, name, email, phone, dob, gender, created_at) FROM stdin;
e21394de-af6b-11ed-9ed3-1b0367dc8e20	Jacquetta Littlefield	jlittlefield0@bloglovin.com	+351 976 822 0732	2001-05-05	female	2023-02-18 14:39:00.764269+05:30
1d3aacf0-af6c-11ed-9ed3-1b0367dc8e20	Debbi Josselsohn	djosselsohn0@woothemes.com	+216 358 711 4976	1993-07-14	others	2023-02-18 14:40:40.006084+05:30
1d3aacf1-af6c-11ed-9ed3-1b0367dc8e20	Mozes Stamp	mstamp1@npr.org	+81 661 293 3147	1993-10-01	others	2023-02-18 14:40:40.02284+05:30
1d3aacf2-af6c-11ed-9ed3-1b0367dc8e20	Hallie Jeenes	hjeenes2@tumblr.com	+62 573 275 2410	1989-01-18	male	2023-02-18 14:40:40.031336+05:30
1d3aacf3-af6c-11ed-9ed3-1b0367dc8e20	Brigida Americi	bamerici3@vistaprint.com	+62 971 429 3145	1987-06-09	male	2023-02-18 14:40:40.039408+05:30
1d3aacf4-af6c-11ed-9ed3-1b0367dc8e20	Hale Kemmis	hkemmis4@123-reg.co.uk	+27 955 837 4785	1999-06-05	male	2023-02-18 14:40:40.048226+05:30
1d3aacf5-af6c-11ed-9ed3-1b0367dc8e20	Nilson Douthwaite	ndouthwaite5@scientificamerican.com	+420 820 972 9040	1997-10-01	others	2023-02-18 14:40:40.05626+05:30
1d3aacf6-af6c-11ed-9ed3-1b0367dc8e20	Calli Skyrm	cskyrm6@ning.com	+63 182 621 0224	1990-09-14	female	2023-02-18 14:40:40.064654+05:30
1d3aacf7-af6c-11ed-9ed3-1b0367dc8e20	Mandy Pellett	mpellett7@ifeng.com	+351 910 792 5839	1998-11-16	others	2023-02-18 14:40:40.072974+05:30
1d3aacf8-af6c-11ed-9ed3-1b0367dc8e20	Vilhelmina Matas	vmatas8@globo.com	+63 533 525 1185	1998-12-29	others	2023-02-18 14:40:40.081269+05:30
1d3aacf9-af6c-11ed-9ed3-1b0367dc8e20	Aron Blumer	ablumer9@narod.ru	+66 924 962 7757	2001-03-25	male	2023-02-18 14:40:40.089682+05:30
1d3aacfa-af6c-11ed-9ed3-1b0367dc8e20	Iain Heers	iheersa@weebly.com	+86 428 989 8949	1993-04-22	female	2023-02-18 14:40:40.097997+05:30
1d3aacfb-af6c-11ed-9ed3-1b0367dc8e20	Peggy Tooher	ptooherb@vistaprint.com	+57 246 183 1561	2000-05-16	female	2023-02-18 14:40:40.106387+05:30
1d3aacfc-af6c-11ed-9ed3-1b0367dc8e20	Jaquith Mableson	jmablesonc@behance.net	+381 538 517 0155	1997-01-13	others	2023-02-18 14:40:40.114709+05:30
1d3aacfd-af6c-11ed-9ed3-1b0367dc8e20	Manuel L'argent	mlargentd@xinhuanet.com	+86 494 125 3282	1998-04-16	others	2023-02-18 14:40:40.123068+05:30
1d3aacfe-af6c-11ed-9ed3-1b0367dc8e20	Brantley Grigorushkin	bgrigorushkine@behance.net	+380 798 215 9661	1992-04-08	others	2023-02-18 14:40:40.131234+05:30
1d3aacff-af6c-11ed-9ed3-1b0367dc8e20	Lenard Kira	lkiraf@paginegialle.it	+62 520 360 1924	2003-01-19	others	2023-02-18 14:40:40.139648+05:30
1d3aad00-af6c-11ed-9ed3-1b0367dc8e20	Cletis Hele	cheleg@hao123.com	+86 607 128 8961	1993-09-23	others	2023-02-18 14:40:40.148171+05:30
1d3aad01-af6c-11ed-9ed3-1b0367dc8e20	Rees Tierny	rtiernyh@dell.com	+58 639 661 5588	2001-08-04	male	2023-02-18 14:40:40.156492+05:30
1d3aad02-af6c-11ed-9ed3-1b0367dc8e20	Iormina Clifton	icliftoni@cornell.edu	+86 982 399 7135	1999-02-02	others	2023-02-18 14:40:40.164649+05:30
1d3aad03-af6c-11ed-9ed3-1b0367dc8e20	Caspar Addie	caddiej@rambler.ru	+353 511 559 5638	1991-02-05	female	2023-02-18 14:40:40.173124+05:30
ab7d420b-b0e0-11ed-b086-436833f0f540	Carr Zecchii	czecchii2@va.gov	+86-510-577-0330	2022-08-04	female	2023-02-20 11:07:31.482601+05:30
ab7d420c-b0e0-11ed-b086-436833f0f540	Elfrieda Craw	ecraw7@istockphoto.com	+86-381-563-4237	2022-01-12	others	2023-02-20 11:07:31.493099+05:30
d436516e-b0e0-11ed-b086-436833f0f540	Wood Blanche	wblanche0@cpanel.net	+63-491-617-7389	1994-02-23	male	2023-02-20 11:08:39.783939+05:30
d436516f-b0e0-11ed-b086-436833f0f540	Randy Stains	rstains1@imdb.com	+63-551-435-7193	1990-07-06	female	2023-02-20 11:08:39.799175+05:30
d4365170-b0e0-11ed-b086-436833f0f540	Cathlene Petteford	cpetteford2@pinterest.com	+93-884-668-3078	1988-02-23	female	2023-02-20 11:08:39.807504+05:30
d4365171-b0e0-11ed-b086-436833f0f540	Temple Bernat	tbernat3@sina.com.cn	+93-407-504-6666	1988-05-27	others	2023-02-20 11:08:39.815642+05:30
d4365172-b0e0-11ed-b086-436833f0f540	Ulric McIntee	umcintee4@hibu.com	+62-626-909-0527	1996-12-22	others	2023-02-20 11:08:39.823913+05:30
d4365173-b0e0-11ed-b086-436833f0f540	Collin Wilshere	cwilshere5@tinyurl.com	+66-153-527-5677	1990-07-12	others	2023-02-20 11:08:39.832295+05:30
d4365174-b0e0-11ed-b086-436833f0f540	Tallie Fayer	tfayer6@angelfire.com	+62-758-725-0619	1997-06-01	others	2023-02-20 11:08:39.840885+05:30
d4365175-b0e0-11ed-b086-436833f0f540	Boigie Cromley	bcromley7@nsw.gov.au	+232-460-237-8590	1993-03-14	male	2023-02-20 11:08:39.849267+05:30
d4365176-b0e0-11ed-b086-436833f0f540	Yul Tudor	ytudor8@guardian.co.uk	+1-704-186-4248	1998-10-10	female	2023-02-20 11:08:39.857566+05:30
\.


--
-- Name: bookings bookings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bookings
    ADD CONSTRAINT bookings_pkey PRIMARY KEY (id);


--
-- Name: cab_types cab_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cab_types
    ADD CONSTRAINT cab_types_pkey PRIMARY KEY (id);


--
-- Name: cabs cabs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cabs
    ADD CONSTRAINT cabs_pkey PRIMARY KEY (id);


--
-- Name: cabs cabs_uniquekey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cabs
    ADD CONSTRAINT cabs_uniquekey UNIQUE (driver_id);


--
-- Name: charging_modes charging_modes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.charging_modes
    ADD CONSTRAINT charging_modes_pkey PRIMARY KEY (id);


--
-- Name: miscellaneous_charges miscellaneous_charges_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.miscellaneous_charges
    ADD CONSTRAINT miscellaneous_charges_pkey PRIMARY KEY (id);


--
-- Name: payments payments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payments
    ADD CONSTRAINT payments_pkey PRIMARY KEY (id);


--
-- Name: payments payments_uniquekey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payments
    ADD CONSTRAINT payments_uniquekey UNIQUE (booking_id);


--
-- Name: ratings ratings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ratings
    ADD CONSTRAINT ratings_pkey PRIMARY KEY (id);


--
-- Name: ratings ratings_uniquekey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ratings
    ADD CONSTRAINT ratings_uniquekey UNIQUE (book_id);


--
-- Name: role_types role_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role_types
    ADD CONSTRAINT role_types_pkey PRIMARY KEY (id);


--
-- Name: roles roles_uniquekey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_uniquekey UNIQUE (users_id, roles_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: bookings bookings_customer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bookings
    ADD CONSTRAINT bookings_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.users(id);


--
-- Name: bookings bookings_driver_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bookings
    ADD CONSTRAINT bookings_driver_id_fkey FOREIGN KEY (driver_id) REFERENCES public.users(id);


--
-- Name: cab_categories cab_categories_cab_types_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cab_categories
    ADD CONSTRAINT cab_categories_cab_types_id_fkey FOREIGN KEY (cab_types_id) REFERENCES public.cab_types(id);


--
-- Name: cab_categories cab_categories_cabs_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cab_categories
    ADD CONSTRAINT cab_categories_cabs_id_fkey FOREIGN KEY (cabs_id) REFERENCES public.cabs(id);


--
-- Name: cab_types cab_types_charge_type_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cab_types
    ADD CONSTRAINT cab_types_charge_type_fkey FOREIGN KEY (charge_type) REFERENCES public.charging_modes(id);


--
-- Name: cabs cabs_driver_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cabs
    ADD CONSTRAINT cabs_driver_id_fkey FOREIGN KEY (driver_id) REFERENCES public.users(id);


--
-- Name: other_charges other_charges_cab_types_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.other_charges
    ADD CONSTRAINT other_charges_cab_types_id_fkey FOREIGN KEY (cab_types_id) REFERENCES public.cab_types(id);


--
-- Name: other_charges other_charges_miscellaneous_charges_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.other_charges
    ADD CONSTRAINT other_charges_miscellaneous_charges_id_fkey FOREIGN KEY (miscellaneous_charges_id) REFERENCES public.miscellaneous_charges(id);


--
-- Name: payments payments_booking_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payments
    ADD CONSTRAINT payments_booking_id_fkey FOREIGN KEY (booking_id) REFERENCES public.bookings(id);


--
-- Name: ratings ratings_book_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ratings
    ADD CONSTRAINT ratings_book_id_fkey FOREIGN KEY (book_id) REFERENCES public.bookings(id);


--
-- Name: roles roles_roles_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_roles_id_fkey FOREIGN KEY (roles_id) REFERENCES public.role_types(id);


--
-- Name: roles roles_users_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_users_id_fkey FOREIGN KEY (users_id) REFERENCES public.users(id);


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

