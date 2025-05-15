--
-- PostgreSQL database dump
--

-- Dumped from database version 17.4
-- Dumped by pg_dump version 17.4

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- Name: administrador; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.administrador (
    id integer NOT NULL,
    nombre text,
    correo text
);


ALTER TABLE public.administrador OWNER TO postgres;

--
-- Name: estudiantes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.estudiantes (
    id integer NOT NULL,
    nombre character varying(100) NOT NULL,
    email character varying(100) NOT NULL,
    grado character varying(50) NOT NULL,
    seccion character varying(10),
    sexo character varying(10),
    fecha_nacimiento date,
    estado boolean DEFAULT true
);


ALTER TABLE public.estudiantes OWNER TO postgres;

--
-- Name: estudiantes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.estudiantes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.estudiantes_id_seq OWNER TO postgres;

--
-- Name: estudiantes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.estudiantes_id_seq OWNED BY public.estudiantes.id;


--
-- Name: participacion_sudoku; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.participacion_sudoku (
    id integer NOT NULL,
    estudiante_id integer,
    nivel_juego character varying(20) NOT NULL,
    armado_juego integer[] NOT NULL,
    solucion_juego integer[] NOT NULL,
    fecha_juego timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    tiempo interval,
    fallas integer,
    puntaje double precision
);


ALTER TABLE public.participacion_sudoku OWNER TO postgres;

--
-- Name: participacion_sudoku_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.participacion_sudoku_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.participacion_sudoku_id_seq OWNER TO postgres;

--
-- Name: participacion_sudoku_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.participacion_sudoku_id_seq OWNED BY public.participacion_sudoku.id;


--
-- Name: usuarios_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.usuarios_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.usuarios_id_seq OWNER TO postgres;

--
-- Name: usuarios_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.usuarios_id_seq OWNED BY public.administrador.id;


--
-- Name: administrador id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.administrador ALTER COLUMN id SET DEFAULT nextval('public.usuarios_id_seq'::regclass);


--
-- Name: estudiantes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estudiantes ALTER COLUMN id SET DEFAULT nextval('public.estudiantes_id_seq'::regclass);


--
-- Name: participacion_sudoku id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.participacion_sudoku ALTER COLUMN id SET DEFAULT nextval('public.participacion_sudoku_id_seq'::regclass);


--
-- Data for Name: administrador; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.administrador (id, nombre, correo) FROM stdin;
1	berta	pero@hit.com
2	sandro	sandro@hit.com
3	olinda	olinda@pedro.com
4	wilfredo	wilfredo@htomail.com
5	mirta	mirsta@gg.com
6	frid	frida@ggg.es
\.


--
-- Data for Name: estudiantes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.estudiantes (id, nombre, email, grado, seccion, sexo, fecha_nacimiento, estado) FROM stdin;
1	yanet	yanet@uno.com	Cuarto	D	Femenino	2006-11-18	t
2	wilfredo	triplewipama@gmail.com	Quinto	D	Masculino	1985-11-14	t
3	carlos	carlos@uno.com	Tercero	C	Masculino	2016-03-03	t
4	luis	luis@uno.com	Primero	B	Masculino	2025-04-04	t
5	lid	lid@uno.com	Tercero	A	Femenino	2025-04-02	t
6	karla	karla@uno.com	Segundo	H	Masculino	2015-01-28	t
7	Rosa	rosa@uno.com	Tercero	B	Femenino	2016-10-13	t
8	olinda	liz@gmail.com	Quinto	D	Masculino	2005-09-10	t
9	Mario	mario@uno.com	Tercero	E	Masculino	2005-03-04	t
\.


--
-- Data for Name: participacion_sudoku; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.participacion_sudoku (id, estudiante_id, nivel_juego, armado_juego, solucion_juego, fecha_juego, tiempo, fallas, puntaje) FROM stdin;
3	1	Muy facil	{{8,4,7,5,1,3,9,0,2},{0,1,3,9,0,2,0,4,0},{9,6,2,0,4,7,5,0,3},{4,7,5,0,3,9,6,2,8},{6,2,8,4,7,5,1,0,9},{0,3,9,6,2,8,4,7,5},{2,8,4,7,5,1,3,9,6},{3,9,6,2,8,4,7,0,1},{7,5,1,3,9,6,0,0,0}}	{{8,4,7,5,1,3,9,6,2},{5,1,3,9,6,2,8,4,7},{9,6,2,8,4,7,5,1,3},{4,7,5,1,3,9,6,2,8},{6,2,8,4,7,5,1,3,9},{1,3,9,6,2,8,4,7,5},{2,8,4,7,5,1,3,9,6},{3,9,6,2,8,4,7,5,1},{7,5,1,3,9,6,2,8,4}}	2025-05-07 00:59:52.439283	00:01:54	5	15
2	4	Muy facil	{{4,0,2,6,0,1,5,9,3},{6,7,0,5,9,0,4,8,2},{5,9,3,4,0,2,6,7,0},{3,4,0,2,6,7,1,5,9},{2,6,0,0,5,0,3,4,8},{1,0,9,3,4,8,2,6,0},{7,1,5,9,3,4,8,2,0},{0,2,6,7,0,0,9,3,4},{9,0,4,8,0,6,7,0,5}}	{{4,8,2,6,7,1,5,9,3},{6,7,1,5,9,3,4,8,2},{5,9,3,4,8,2,6,7,1},{3,4,8,2,6,7,1,5,9},{2,6,7,1,5,9,3,4,8},{1,5,9,3,4,8,2,6,7},{7,1,5,9,3,4,8,2,6},{8,2,6,7,1,5,9,3,4},{9,3,4,8,2,6,7,1,5}}	2025-05-06 21:37:39.042039	00:02:56	3	17
4	8	Muy facil	{{6,0,1,2,7,4,5,8,9},{2,7,0,5,8,9,6,3,0},{5,8,9,6,3,1,2,7,4},{1,2,0,4,5,0,9,6,3},{9,6,3,0,2,7,4,5,8},{0,5,8,9,6,0,1,2,7},{0,4,5,8,9,6,3,1,2},{8,0,6,3,1,2,7,4,5},{3,1,2,0,0,5,8,9,6}}	{{6,3,1,2,7,4,5,8,9},{2,7,4,5,8,9,6,3,1},{5,8,9,6,3,1,2,7,4},{1,2,7,4,5,8,9,6,3},{9,6,3,1,2,7,4,5,8},{4,5,8,9,6,3,1,2,7},{7,4,5,8,9,6,3,1,2},{8,9,6,3,1,2,7,4,5},{3,1,2,7,4,5,8,9,6}}	2025-05-07 07:19:59.657099	00:02:29	1	19
5	8	Muy facil	{{1,0,8,0,6,3,4,9,0},{4,9,2,0,7,8,5,6,3},{5,6,3,0,0,2,1,7,8},{9,2,1,7,8,5,6,3,4},{6,0,4,0,2,1,7,0,5},{7,0,5,0,3,4,9,0,0},{3,0,0,2,1,7,8,0,6},{8,0,0,3,4,9,2,1,7},{2,0,7,0,5,6,3,4,9}}	{{1,7,8,5,6,3,4,9,2},{4,9,2,1,7,8,5,6,3},{5,6,3,4,9,2,1,7,8},{9,2,1,7,8,5,6,3,4},{6,3,4,9,2,1,7,8,5},{7,8,5,6,3,4,9,2,1},{3,4,9,2,1,7,8,5,6},{8,5,6,3,4,9,2,1,7},{2,1,7,8,5,6,3,4,9}}	2025-05-07 07:23:26.758046	00:03:16	1	18.5
6	8	Facil	{{0,7,9,2,5,0,6,8,4},{6,8,4,1,7,0,2,0,3},{2,5,3,6,8,0,0,0,9},{3,0,0,0,1,0,9,2,5},{0,2,5,3,0,0,0,1,0},{4,1,7,9,0,5,3,6,8},{0,9,2,5,3,6,0,4,1},{5,3,6,8,4,0,7,9,0},{0,4,0,7,9,2,5,3,0}}	{{1,7,9,2,5,3,6,8,4},{6,8,4,1,7,9,2,5,3},{2,5,3,6,8,4,1,7,9},{3,6,8,4,1,7,9,2,5},{9,2,5,3,6,8,4,1,7},{4,1,7,9,2,5,3,6,8},{7,9,2,5,3,6,8,4,1},{5,3,6,8,4,1,7,9,2},{8,4,1,7,9,2,5,3,6}}	2025-05-07 07:30:49.357078	00:04:00	0	19.5
7	2	Muy facil	{{1,6,0,9,8,4,3,7,2},{3,7,2,1,6,5,9,8,4},{9,0,0,3,0,0,1,0,5},{7,2,1,6,0,9,8,4,3},{8,4,3,7,0,0,0,5,9},{6,5,0,0,4,3,7,2,1},{4,3,7,2,1,6,5,9,8},{2,0,6,5,9,8,4,3,7},{5,9,8,4,3,0,2,1,6}}	{{1,6,5,9,8,4,3,7,2},{3,7,2,1,6,5,9,8,4},{9,8,4,3,7,2,1,6,5},{7,2,1,6,5,9,8,4,3},{8,4,3,7,2,1,6,5,9},{6,5,9,8,4,3,7,2,1},{4,3,7,2,1,6,5,9,8},{2,1,6,5,9,8,4,3,7},{5,9,8,4,3,7,2,1,6}}	2025-05-07 07:36:02.397236	00:01:49	0	20
8	2	Intermedio	{{0,1,8,0,0,0,0,0,7},{9,0,4,0,0,7,0,1,0},{5,0,7,0,1,0,9,6,0},{6,4,5,2,7,3,0,0,0},{2,7,3,1,0,9,0,4,0},{1,0,0,0,4,0,0,0,3},{0,5,2,7,0,1,8,0,0},{8,9,0,4,5,2,0,0,1},{0,3,1,8,9,6,0,0,2}}	{{3,1,8,9,6,4,5,2,7},{9,6,4,5,2,7,3,1,8},{5,2,7,3,1,8,9,6,4},{6,4,5,2,7,3,1,8,9},{2,7,3,1,8,9,6,4,5},{1,8,9,6,4,5,2,7,3},{4,5,2,7,3,1,8,9,6},{8,9,6,4,5,2,7,3,1},{7,3,1,8,9,6,4,5,2}}	2025-05-07 07:39:47.248028	00:07:29	2	16.5
9	8	Intermedio	{{0,0,0,0,0,8,4,9,6},{0,9,6,0,2,7,0,0,0},{5,3,8,4,9,6,1,2,0},{3,8,4,0,0,0,0,7,0},{2,0,5,3,0,0,9,0,1},{0,6,1,2,7,5,0,0,0},{6,0,0,7,5,0,0,4,9},{7,5,0,0,4,9,6,1,0},{8,4,9,6,1,0,7,0,3}}	{{1,2,7,5,3,8,4,9,6},{4,9,6,1,2,7,5,3,8},{5,3,8,4,9,6,1,2,7},{3,8,4,9,6,1,2,7,5},{2,7,5,3,8,4,9,6,1},{9,6,1,2,7,5,3,8,4},{6,1,2,7,5,3,8,4,9},{7,5,3,8,4,9,6,1,2},{8,4,9,6,1,2,7,5,3}}	2025-05-07 07:47:43.489051	00:07:00	1	17.5
10	8	Dificil	{{1,4,0,8,7,2,9,6,5},{9,6,5,1,0,0,8,0,2},{8,0,2,9,6,0,1,4,3},{0,0,7,0,9,6,0,1,4},{0,0,4,3,0,7,2,9,6},{2,9,0,5,1,0,3,8,0},{6,0,1,0,3,0,0,2,9},{0,3,8,0,2,0,6,0,0},{7,2,0,0,5,1,4,3,8}}	{{1,4,3,8,7,2,9,6,5},{9,6,5,1,4,3,8,7,2},{8,7,2,9,6,5,1,4,3},{3,8,7,2,9,6,5,1,4},{5,1,4,3,8,7,2,9,6},{2,9,6,5,1,4,3,8,7},{6,5,1,4,3,8,7,2,9},{4,3,8,7,2,9,6,5,1},{7,2,9,6,5,1,4,3,8}}	2025-05-07 07:56:37.442707	00:04:05	0	19.5
15	8	Avanzado	{{0,0,5,0,0,0,0,0,0},{0,0,2,6,7,0,0,8,9},{0,0,0,0,3,0,6,0,0},{0,4,0,0,0,0,0,1,0},{0,0,0,0,0,3,2,0,7},{0,0,0,5,0,0,9,4,0},{0,0,0,0,0,0,0,0,0},{7,0,0,0,9,0,3,0,0},{3,0,0,0,0,0,8,0,4}}	{{6,7,5,1,8,9,4,3,2},{4,3,2,6,7,5,1,8,9},{1,8,9,4,3,2,6,7,5},{9,4,3,2,6,7,5,1,8},{5,1,8,9,4,3,2,6,7},{2,6,7,5,1,8,9,4,3},{8,9,4,3,2,6,7,5,1},{7,5,1,8,9,4,3,2,6},{3,2,6,7,5,1,8,9,4}}	2025-05-08 16:53:40.351913	00:25:36	5	6.97
1	4	Muy facil	{{4,2,7,3,1,0,0,0,5},{0,1,8,6,9,5,4,2,7},{6,9,5,4,2,0,3,1,8},{5,4,2,7,0,1,8,6,0},{8,6,9,5,4,2,7,3,1},{0,3,0,8,0,9,5,4,0},{9,5,4,2,7,0,1,0,0},{2,0,0,1,8,6,9,5,4},{1,8,6,9,5,4,2,0,0}}	{{4,2,7,3,1,8,6,9,5},{3,1,8,6,9,5,4,2,7},{6,9,5,4,2,7,3,1,8},{5,4,2,7,3,1,8,6,9},{8,6,9,5,4,2,7,3,1},{7,3,1,8,6,9,5,4,2},{9,5,4,2,7,3,1,8,6},{2,7,3,1,8,6,9,5,4},{1,8,6,9,5,4,2,7,3}}	2025-05-06 21:35:05.145633	00:02:20	1	19
11	2	Dificil	{{0,7,2,3,0,4,0,6,0},{0,9,4,0,0,8,0,7,0},{0,0,0,0,7,0,3,9,4},{7,0,0,0,0,5,6,0,1},{9,0,0,0,0,1,0,0,0},{0,0,1,7,2,0,0,4,0},{0,0,6,8,0,0,0,3,9},{8,0,0,2,0,9,0,0,0},{2,3,0,4,0,0,0,1,7}}	{{1,7,2,3,9,4,5,6,8},{3,9,4,5,6,8,1,7,2},{5,6,8,1,7,2,3,9,4},{7,2,3,9,4,5,6,8,1},{9,4,5,6,8,1,7,2,3},{6,8,1,7,2,3,9,4,5},{4,5,6,8,1,7,2,3,9},{8,1,7,2,3,9,4,5,6},{2,3,9,4,5,6,8,1,7}}	2025-05-07 08:01:28.134812	00:12:17	1	15.5
12	4	Muy facil	{{9,1,8,2,6,5,4,3,7},{4,3,7,9,1,0,2,6,5},{2,6,5,4,3,7,9,1,8},{3,7,9,1,8,2,0,5,0},{1,8,2,6,5,4,3,7,9},{6,0,4,3,7,9,1,8,0},{0,9,1,8,2,6,0,4,3},{8,2,6,0,4,3,0,9,1},{5,4,0,7,9,1,8,2,0}}	{{9,1,8,2,6,5,4,3,7},{4,3,7,9,1,8,2,6,5},{2,6,5,4,3,7,9,1,8},{3,7,9,1,8,2,6,5,4},{1,8,2,6,5,4,3,7,9},{6,5,4,3,7,9,1,8,2},{7,9,1,8,2,6,5,4,3},{8,2,6,5,4,3,7,9,1},{5,4,3,7,9,1,8,2,6}}	2025-05-07 08:27:07.3902	00:03:28	0	19.5
13	4	Avanzado	{{8,0,3,0,4,7,5,0,6},{5,1,0,0,0,3,2,4,7},{0,4,7,5,0,0,0,0,0},{0,0,0,1,6,0,9,3,2},{9,3,0,4,7,0,0,6,8},{0,6,0,9,3,0,0,0,0},{3,0,4,7,5,0,0,0,0},{7,0,0,0,8,9,0,0,4},{0,0,0,3,2,4,7,5,0}}	{{8,9,3,2,4,7,5,1,6},{5,1,6,8,9,3,2,4,7},{2,4,7,5,1,6,8,9,3},{4,7,5,1,6,8,9,3,2},{9,3,2,4,7,5,1,6,8},{1,6,8,9,3,2,4,7,5},{3,2,4,7,5,1,6,8,9},{7,5,1,6,8,9,3,2,4},{6,8,9,3,2,4,7,5,1}}	2025-05-07 08:33:51.886224	00:11:56	6	11
16	2	Muy facil	{{0,1,5,9,7,0,6,2,8},{9,7,0,6,0,8,4,1,5},{0,2,0,4,0,5,9,7,0},{1,0,9,7,3,6,2,8,4},{7,3,0,2,8,4,1,5,0},{2,0,0,0,5,9,7,0,6},{3,6,2,8,0,0,5,9,7},{5,0,7,0,6,2,8,0,1},{8,4,0,0,9,0,3,0,0}}	{{4,1,5,9,7,3,6,2,8},{9,7,3,6,2,8,4,1,5},{6,2,8,4,1,5,9,7,3},{1,5,9,7,3,6,2,8,4},{7,3,6,2,8,4,1,5,9},{2,8,4,1,5,9,7,3,6},{3,6,2,8,4,1,5,9,7},{5,9,7,3,6,2,8,4,1},{8,4,1,5,9,7,3,6,2}}	2025-05-08 17:20:21.379674	00:03:43	0	19.26
14	2	Muy facil	{{5,9,1,7,6,2,3,0,4},{7,0,2,3,8,4,5,0,1},{3,8,4,5,9,1,7,6,2},{0,0,0,2,3,8,4,5,9},{2,3,8,4,5,9,1,7,6},{0,5,9,1,7,6,2,3,8},{0,2,3,8,4,5,9,1,0},{8,4,5,9,0,7,0,2,3},{9,1,0,6,2,0,8,4,5}}	{{5,9,1,7,6,2,3,8,4},{7,6,2,3,8,4,5,9,1},{3,8,4,5,9,1,7,6,2},{1,7,6,2,3,8,4,5,9},{2,3,8,4,5,9,1,7,6},{4,5,9,1,7,6,2,3,8},{6,2,3,8,4,5,9,1,7},{8,4,5,9,1,7,6,2,3},{9,1,7,6,2,3,8,4,5}}	2025-05-08 16:45:54.288446	00:01:39	1	18.95
\.


--
-- Name: estudiantes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.estudiantes_id_seq', 9, true);


--
-- Name: participacion_sudoku_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.participacion_sudoku_id_seq', 16, true);


--
-- Name: usuarios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.usuarios_id_seq', 6, true);


--
-- Name: estudiantes estudiantes_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estudiantes
    ADD CONSTRAINT estudiantes_email_key UNIQUE (email);


--
-- Name: estudiantes estudiantes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estudiantes
    ADD CONSTRAINT estudiantes_pkey PRIMARY KEY (id);


--
-- Name: participacion_sudoku participacion_sudoku_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.participacion_sudoku
    ADD CONSTRAINT participacion_sudoku_pkey PRIMARY KEY (id);


--
-- Name: administrador usuarios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.administrador
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (id);


--
-- Name: participacion_sudoku participacion_sudoku_estudiante_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.participacion_sudoku
    ADD CONSTRAINT participacion_sudoku_estudiante_id_fkey FOREIGN KEY (estudiante_id) REFERENCES public.estudiantes(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

