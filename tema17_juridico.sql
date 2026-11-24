--
-- PostgreSQL database dump
--

\restrict TTCH19hyUPr1PQGWYTgH8Jp9h8cGtLx4KZmFaooAkATt5OCUBA0O9dmfyMVPZRv

-- Dumped from database version 17.12
-- Dumped by pg_dump version 17.12

-- Started on 2026-11-23 21:13:15

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

--
-- TOC entry 6 (class 2615 OID 16461)
-- Name: juridico; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA juridico;


ALTER SCHEMA juridico OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 229 (class 1259 OID 16463)
-- Name: advogado; Type: TABLE; Schema: juridico; Owner: postgres
--

CREATE TABLE juridico.advogado (
    id bigint NOT NULL,
    nome character varying(150) NOT NULL,
    oab character varying(30) NOT NULL
);


ALTER TABLE juridico.advogado OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 16462)
-- Name: advogado_id_seq; Type: SEQUENCE; Schema: juridico; Owner: postgres
--

ALTER TABLE juridico.advogado ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME juridico.advogado_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 236 (class 1259 OID 16510)
-- Name: andamento; Type: TABLE; Schema: juridico; Owner: postgres
--

CREATE TABLE juridico.andamento (
    id bigint NOT NULL,
    processo_id bigint NOT NULL,
    data_andamento date NOT NULL,
    descricao text NOT NULL
);


ALTER TABLE juridico.andamento OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 16509)
-- Name: andamento_id_seq; Type: SEQUENCE; Schema: juridico; Owner: postgres
--

ALTER TABLE juridico.andamento ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME juridico.andamento_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 231 (class 1259 OID 16471)
-- Name: parte; Type: TABLE; Schema: juridico; Owner: postgres
--

CREATE TABLE juridico.parte (
    id bigint NOT NULL,
    nome character varying(150) NOT NULL,
    tipo character varying(20) NOT NULL,
    CONSTRAINT parte_tipo_check CHECK (((tipo)::text = ANY ((ARRAY['AUTOR'::character varying, 'REU'::character varying, 'TERCEIRO'::character varying])::text[])))
);


ALTER TABLE juridico.parte OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 16470)
-- Name: parte_id_seq; Type: SEQUENCE; Schema: juridico; Owner: postgres
--

ALTER TABLE juridico.parte ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME juridico.parte_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 238 (class 1259 OID 16523)
-- Name: prazo; Type: TABLE; Schema: juridico; Owner: postgres
--

CREATE TABLE juridico.prazo (
    id bigint NOT NULL,
    processo_id bigint NOT NULL,
    descricao character varying(200) NOT NULL,
    data_final date NOT NULL,
    status character varying(20) NOT NULL,
    CONSTRAINT prazo_status_check CHECK (((status)::text = ANY ((ARRAY['PENDENTE'::character varying, 'CUMPRIDO'::character varying, 'CANCELADO'::character varying])::text[])))
);


ALTER TABLE juridico.prazo OWNER TO postgres;

--
-- TOC entry 237 (class 1259 OID 16522)
-- Name: prazo_id_seq; Type: SEQUENCE; Schema: juridico; Owner: postgres
--

ALTER TABLE juridico.prazo ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME juridico.prazo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 233 (class 1259 OID 16478)
-- Name: processo; Type: TABLE; Schema: juridico; Owner: postgres
--

CREATE TABLE juridico.processo (
    id bigint NOT NULL,
    numero_cnj character varying(25) NOT NULL,
    assunto character varying(200) NOT NULL,
    status character varying(20) NOT NULL,
    advogado_id bigint NOT NULL,
    cadastrado_em date DEFAULT CURRENT_DATE NOT NULL,
    CONSTRAINT processo_numero_cnj_check CHECK (((numero_cnj)::text ~ '^[0-9]{7}-[0-9]{2}\.[0-9]{4}\.[0-9]\.[0-9]{2}\.[0-9]{4}$'::text)),
    CONSTRAINT processo_status_check CHECK (((status)::text = ANY ((ARRAY['ATIVO'::character varying, 'SUSPENSO'::character varying, 'ENCERRADO'::character varying])::text[])))
);


ALTER TABLE juridico.processo OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 16477)
-- Name: processo_id_seq; Type: SEQUENCE; Schema: juridico; Owner: postgres
--

ALTER TABLE juridico.processo ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME juridico.processo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 234 (class 1259 OID 16493)
-- Name: processo_parte; Type: TABLE; Schema: juridico; Owner: postgres
--

CREATE TABLE juridico.processo_parte (
    processo_id bigint NOT NULL,
    parte_id bigint NOT NULL,
    polo character varying(20) NOT NULL,
    CONSTRAINT processo_parte_polo_check CHECK (((polo)::text = ANY ((ARRAY['ATIVO'::character varying, 'PASSIVO'::character varying, 'TERCEIRO'::character varying])::text[])))
);


ALTER TABLE juridico.processo_parte OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16388)
-- Name: advogado; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.advogado (
    id_advogado integer NOT NULL,
    nome character varying(150) NOT NULL,
    oab character varying(30) NOT NULL,
    email character varying(150)
);


ALTER TABLE public.advogado OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16387)
-- Name: advogado_id_advogado_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.advogado_id_advogado_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.advogado_id_advogado_seq OWNER TO postgres;

--
-- TOC entry 4977 (class 0 OID 0)
-- Dependencies: 218
-- Name: advogado_id_advogado_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.advogado_id_advogado_seq OWNED BY public.advogado.id_advogado;


--
-- TOC entry 225 (class 1259 OID 16430)
-- Name: andamento; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.andamento (
    id_andamento integer NOT NULL,
    descricao text NOT NULL,
    data_andamento date NOT NULL,
    id_processo integer NOT NULL
);


ALTER TABLE public.andamento OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 16429)
-- Name: andamento_id_andamento_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.andamento_id_andamento_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.andamento_id_andamento_seq OWNER TO postgres;

--
-- TOC entry 4978 (class 0 OID 0)
-- Dependencies: 224
-- Name: andamento_id_andamento_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.andamento_id_andamento_seq OWNED BY public.andamento.id_andamento;


--
-- TOC entry 223 (class 1259 OID 16417)
-- Name: parte; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.parte (
    id_parte integer NOT NULL,
    nome character varying(150) NOT NULL,
    cpf_cnpj character varying(20),
    tipo_parte character varying(30) NOT NULL,
    id_processo integer NOT NULL,
    CONSTRAINT chk_tipo_parte CHECK (((tipo_parte)::text = ANY ((ARRAY['Autor'::character varying, 'Réu'::character varying, 'Terceiro'::character varying])::text[])))
);


ALTER TABLE public.parte OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16416)
-- Name: parte_id_parte_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.parte_id_parte_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.parte_id_parte_seq OWNER TO postgres;

--
-- TOC entry 4979 (class 0 OID 0)
-- Dependencies: 222
-- Name: parte_id_parte_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.parte_id_parte_seq OWNED BY public.parte.id_parte;


--
-- TOC entry 227 (class 1259 OID 16444)
-- Name: prazo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.prazo (
    id_prazo integer NOT NULL,
    descricao text NOT NULL,
    data_inicio date NOT NULL,
    data_final date NOT NULL,
    status character varying(20) DEFAULT 'Pendente'::character varying NOT NULL,
    id_processo integer NOT NULL,
    CONSTRAINT chk_datas_prazo CHECK ((data_final >= data_inicio)),
    CONSTRAINT chk_status_prazo CHECK (((status)::text = ANY ((ARRAY['Pendente'::character varying, 'Cumprido'::character varying, 'Vencido'::character varying])::text[])))
);


ALTER TABLE public.prazo OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 16443)
-- Name: prazo_id_prazo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.prazo_id_prazo_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.prazo_id_prazo_seq OWNER TO postgres;

--
-- TOC entry 4980 (class 0 OID 0)
-- Dependencies: 226
-- Name: prazo_id_prazo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.prazo_id_prazo_seq OWNED BY public.prazo.id_prazo;


--
-- TOC entry 221 (class 1259 OID 16397)
-- Name: processo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.processo (
    id_processo integer NOT NULL,
    numero_cnj character varying(25) NOT NULL,
    descricao text,
    tipo character varying(50) DEFAULT 'Cível'::character varying,
    status character varying(20) DEFAULT 'Ativo'::character varying NOT NULL,
    data_distribuicao date NOT NULL,
    id_advogado integer NOT NULL,
    CONSTRAINT chk_numero_cnj CHECK (((numero_cnj)::text ~ '^[0-9]{7}-[0-9]{2}\.[0-9]{4}\.[0-9]\.[0-9]{2}\.[0-9]{4}$'::text)),
    CONSTRAINT chk_status_processo CHECK (((status)::text = ANY ((ARRAY['Ativo'::character varying, 'Suspenso'::character varying, 'Arquivado'::character varying, 'Encerrado'::character varying])::text[])))
);


ALTER TABLE public.processo OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16396)
-- Name: processo_id_processo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.processo_id_processo_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.processo_id_processo_seq OWNER TO postgres;

--
-- TOC entry 4981 (class 0 OID 0)
-- Dependencies: 220
-- Name: processo_id_processo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.processo_id_processo_seq OWNED BY public.processo.id_processo;


--
-- TOC entry 4745 (class 2604 OID 16391)
-- Name: advogado id_advogado; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.advogado ALTER COLUMN id_advogado SET DEFAULT nextval('public.advogado_id_advogado_seq'::regclass);


--
-- TOC entry 4750 (class 2604 OID 16433)
-- Name: andamento id_andamento; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.andamento ALTER COLUMN id_andamento SET DEFAULT nextval('public.andamento_id_andamento_seq'::regclass);


--
-- TOC entry 4749 (class 2604 OID 16420)
-- Name: parte id_parte; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.parte ALTER COLUMN id_parte SET DEFAULT nextval('public.parte_id_parte_seq'::regclass);


--
-- TOC entry 4751 (class 2604 OID 16447)
-- Name: prazo id_prazo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prazo ALTER COLUMN id_prazo SET DEFAULT nextval('public.prazo_id_prazo_seq'::regclass);


--
-- TOC entry 4746 (class 2604 OID 16400)
-- Name: processo id_processo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.processo ALTER COLUMN id_processo SET DEFAULT nextval('public.processo_id_processo_seq'::regclass);


--
-- TOC entry 4962 (class 0 OID 16463)
-- Dependencies: 229
-- Data for Name: advogado; Type: TABLE DATA; Schema: juridico; Owner: postgres
--

COPY juridico.advogado (id, nome, oab) FROM stdin;
1	Ana Lima	SE12345
2	Bruno Costa	SE23456
3	Carla Souza	SE34567
\.


--
-- TOC entry 4969 (class 0 OID 16510)
-- Dependencies: 236
-- Data for Name: andamento; Type: TABLE DATA; Schema: juridico; Owner: postgres
--

COPY juridico.andamento (id, processo_id, data_andamento, descricao) FROM stdin;
1	1	2026-08-15	Petição inicial
2	2	2026-11-13	Manifestação
3	3	2026-08-20	Distribuição
4	4	2026-11-18	Baixa
\.


--
-- TOC entry 4964 (class 0 OID 16471)
-- Dependencies: 231
-- Data for Name: parte; Type: TABLE DATA; Schema: juridico; Owner: postgres
--

COPY juridico.parte (id, nome, tipo) FROM stdin;
1	Empresa Alfa	AUTOR
2	Empresa Beta	REU
3	Pessoa Gama	AUTOR
4	Pessoa Delta	REU
\.


--
-- TOC entry 4971 (class 0 OID 16523)
-- Dependencies: 238
-- Data for Name: prazo; Type: TABLE DATA; Schema: juridico; Owner: postgres
--

COPY juridico.prazo (id, processo_id, descricao, data_final, status) FROM stdin;
1	1	Apresentar documentos	2026-11-26	PENDENTE
2	2	Contestação	2026-11-30	PENDENTE
3	3	Recurso	2026-12-05	PENDENTE
4	4	Prazo concluído	2026-11-21	CUMPRIDO
5	1	Prazo vencido	2026-11-22	PENDENTE
\.


--
-- TOC entry 4966 (class 0 OID 16478)
-- Dependencies: 233
-- Data for Name: processo; Type: TABLE DATA; Schema: juridico; Owner: postgres
--

COPY juridico.processo (id, numero_cnj, assunto, status, advogado_id, cadastrado_em) FROM stdin;
1	0000001-00.2026.8.25.0001	Cobrança	ATIVO	1	2026-06-26
2	0000002-00.2026.8.25.0001	Indenização	ATIVO	1	2026-07-16
3	0000003-00.2026.8.25.0001	Contrato	ATIVO	2	2026-08-05
4	0000004-00.2026.8.25.0001	Cobrança	ENCERRADO	3	2026-08-15
\.


--
-- TOC entry 4967 (class 0 OID 16493)
-- Dependencies: 234
-- Data for Name: processo_parte; Type: TABLE DATA; Schema: juridico; Owner: postgres
--

COPY juridico.processo_parte (processo_id, parte_id, polo) FROM stdin;
1	1	ATIVO
1	2	PASSIVO
2	3	ATIVO
2	4	PASSIVO
3	1	ATIVO
3	4	PASSIVO
4	3	ATIVO
4	2	PASSIVO
\.


--
-- TOC entry 4952 (class 0 OID 16388)
-- Dependencies: 219
-- Data for Name: advogado; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.advogado (id_advogado, nome, oab, email) FROM stdin;
1	Carlos Eduardo Silva	OAB/SE 12345	carlos@email.com
2	Mariana Oliveira Santos	OAB/SE 23456	mariana@email.com
3	Roberto Almeida Costa	OAB/SE 34567	roberto@email.com
\.


--
-- TOC entry 4958 (class 0 OID 16430)
-- Dependencies: 225
-- Data for Name: andamento; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.andamento (id_andamento, descricao, data_andamento, id_processo) FROM stdin;
1	Petição inicial protocolada	2026-11-13	1
2	Última movimentação processual	2026-08-15	2
3	Audiência realizada	2026-11-18	3
\.


--
-- TOC entry 4956 (class 0 OID 16417)
-- Dependencies: 223
-- Data for Name: parte; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.parte (id_parte, nome, cpf_cnpj, tipo_parte, id_processo) FROM stdin;
1	João Pereira	12345678900	Autor	1
2	Empresa Alfa Ltda	12345678000199	Réu	1
3	Maria Souza	98765432100	Autor	2
4	Empresa Beta Ltda	98765432000199	Réu	2
5	Pedro Santos	11122233344	Autor	3
6	Ana Costa	55566677788	Réu	4
\.


--
-- TOC entry 4960 (class 0 OID 16444)
-- Dependencies: 227
-- Data for Name: prazo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.prazo (id_prazo, descricao, data_inicio, data_final, status, id_processo) FROM stdin;
1	Apresentar contestação	2026-11-21	2026-11-25	Pendente	1
2	Apresentar manifestação	2026-11-22	2026-11-28	Pendente	2
3	Entregar documentos	2026-11-23	2026-12-03	Pendente	3
4	Cumprir determinação judicial	2026-11-08	2026-11-18	Vencido	4
\.


--
-- TOC entry 4954 (class 0 OID 16397)
-- Dependencies: 221
-- Data for Name: processo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.processo (id_processo, numero_cnj, descricao, tipo, status, data_distribuicao, id_advogado) FROM stdin;
1	0000001-23.2025.8.25.0001	Ação de cobrança	Cível	Ativo	2026-05-07	1
2	0000002-34.2025.8.25.0001	Ação de indenização	Cível	Ativo	2026-06-26	2
3	0000003-45.2025.8.25.0001	Ação de obrigação de fazer	Cível	Ativo	2026-08-15	1
4	0000004-56.2025.8.25.0001	Ação de danos morais	Cível	Suspenso	2026-09-04	3
\.


--
-- TOC entry 4982 (class 0 OID 0)
-- Dependencies: 228
-- Name: advogado_id_seq; Type: SEQUENCE SET; Schema: juridico; Owner: postgres
--

SELECT pg_catalog.setval('juridico.advogado_id_seq', 3, true);


--
-- TOC entry 4983 (class 0 OID 0)
-- Dependencies: 235
-- Name: andamento_id_seq; Type: SEQUENCE SET; Schema: juridico; Owner: postgres
--

SELECT pg_catalog.setval('juridico.andamento_id_seq', 4, true);


--
-- TOC entry 4984 (class 0 OID 0)
-- Dependencies: 230
-- Name: parte_id_seq; Type: SEQUENCE SET; Schema: juridico; Owner: postgres
--

SELECT pg_catalog.setval('juridico.parte_id_seq', 4, true);


--
-- TOC entry 4985 (class 0 OID 0)
-- Dependencies: 237
-- Name: prazo_id_seq; Type: SEQUENCE SET; Schema: juridico; Owner: postgres
--

SELECT pg_catalog.setval('juridico.prazo_id_seq', 5, true);


--
-- TOC entry 4986 (class 0 OID 0)
-- Dependencies: 232
-- Name: processo_id_seq; Type: SEQUENCE SET; Schema: juridico; Owner: postgres
--

SELECT pg_catalog.setval('juridico.processo_id_seq', 7, true);


--
-- TOC entry 4987 (class 0 OID 0)
-- Dependencies: 218
-- Name: advogado_id_advogado_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.advogado_id_advogado_seq', 3, true);


--
-- TOC entry 4988 (class 0 OID 0)
-- Dependencies: 224
-- Name: andamento_id_andamento_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.andamento_id_andamento_seq', 3, true);


--
-- TOC entry 4989 (class 0 OID 0)
-- Dependencies: 222
-- Name: parte_id_parte_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.parte_id_parte_seq', 6, true);


--
-- TOC entry 4990 (class 0 OID 0)
-- Dependencies: 226
-- Name: prazo_id_prazo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.prazo_id_prazo_seq', 4, true);


--
-- TOC entry 4991 (class 0 OID 0)
-- Dependencies: 220
-- Name: processo_id_processo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.processo_id_processo_seq', 6, true);


--
-- TOC entry 4780 (class 2606 OID 16469)
-- Name: advogado advogado_oab_key; Type: CONSTRAINT; Schema: juridico; Owner: postgres
--

ALTER TABLE ONLY juridico.advogado
    ADD CONSTRAINT advogado_oab_key UNIQUE (oab);


--
-- TOC entry 4782 (class 2606 OID 16467)
-- Name: advogado advogado_pkey; Type: CONSTRAINT; Schema: juridico; Owner: postgres
--

ALTER TABLE ONLY juridico.advogado
    ADD CONSTRAINT advogado_pkey PRIMARY KEY (id);


--
-- TOC entry 4792 (class 2606 OID 16516)
-- Name: andamento andamento_pkey; Type: CONSTRAINT; Schema: juridico; Owner: postgres
--

ALTER TABLE ONLY juridico.andamento
    ADD CONSTRAINT andamento_pkey PRIMARY KEY (id);


--
-- TOC entry 4784 (class 2606 OID 16476)
-- Name: parte parte_pkey; Type: CONSTRAINT; Schema: juridico; Owner: postgres
--

ALTER TABLE ONLY juridico.parte
    ADD CONSTRAINT parte_pkey PRIMARY KEY (id);


--
-- TOC entry 4796 (class 2606 OID 16528)
-- Name: prazo prazo_pkey; Type: CONSTRAINT; Schema: juridico; Owner: postgres
--

ALTER TABLE ONLY juridico.prazo
    ADD CONSTRAINT prazo_pkey PRIMARY KEY (id);


--
-- TOC entry 4786 (class 2606 OID 16487)
-- Name: processo processo_numero_cnj_key; Type: CONSTRAINT; Schema: juridico; Owner: postgres
--

ALTER TABLE ONLY juridico.processo
    ADD CONSTRAINT processo_numero_cnj_key UNIQUE (numero_cnj);


--
-- TOC entry 4790 (class 2606 OID 16498)
-- Name: processo_parte processo_parte_pkey; Type: CONSTRAINT; Schema: juridico; Owner: postgres
--

ALTER TABLE ONLY juridico.processo_parte
    ADD CONSTRAINT processo_parte_pkey PRIMARY KEY (processo_id, parte_id);


--
-- TOC entry 4788 (class 2606 OID 16485)
-- Name: processo processo_pkey; Type: CONSTRAINT; Schema: juridico; Owner: postgres
--

ALTER TABLE ONLY juridico.processo
    ADD CONSTRAINT processo_pkey PRIMARY KEY (id);


--
-- TOC entry 4765 (class 2606 OID 16395)
-- Name: advogado advogado_oab_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.advogado
    ADD CONSTRAINT advogado_oab_key UNIQUE (oab);


--
-- TOC entry 4767 (class 2606 OID 16393)
-- Name: advogado advogado_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.advogado
    ADD CONSTRAINT advogado_pkey PRIMARY KEY (id_advogado);


--
-- TOC entry 4775 (class 2606 OID 16437)
-- Name: andamento andamento_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.andamento
    ADD CONSTRAINT andamento_pkey PRIMARY KEY (id_andamento);


--
-- TOC entry 4773 (class 2606 OID 16423)
-- Name: parte parte_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.parte
    ADD CONSTRAINT parte_pkey PRIMARY KEY (id_parte);


--
-- TOC entry 4778 (class 2606 OID 16454)
-- Name: prazo prazo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prazo
    ADD CONSTRAINT prazo_pkey PRIMARY KEY (id_prazo);


--
-- TOC entry 4769 (class 2606 OID 16410)
-- Name: processo processo_numero_cnj_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.processo
    ADD CONSTRAINT processo_numero_cnj_key UNIQUE (numero_cnj);


--
-- TOC entry 4771 (class 2606 OID 16408)
-- Name: processo processo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.processo
    ADD CONSTRAINT processo_pkey PRIMARY KEY (id_processo);


--
-- TOC entry 4793 (class 1259 OID 16535)
-- Name: idx_andamento_processo_data; Type: INDEX; Schema: juridico; Owner: postgres
--

CREATE INDEX idx_andamento_processo_data ON juridico.andamento USING btree (processo_id, data_andamento DESC);


--
-- TOC entry 4794 (class 1259 OID 16534)
-- Name: idx_prazo_data_final; Type: INDEX; Schema: juridico; Owner: postgres
--

CREATE INDEX idx_prazo_data_final ON juridico.prazo USING btree (data_final);


--
-- TOC entry 4776 (class 1259 OID 16460)
-- Name: idx_prazo_data_final; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_prazo_data_final ON public.prazo USING btree (data_final);


--
-- TOC entry 4804 (class 2606 OID 16517)
-- Name: andamento andamento_processo_id_fkey; Type: FK CONSTRAINT; Schema: juridico; Owner: postgres
--

ALTER TABLE ONLY juridico.andamento
    ADD CONSTRAINT andamento_processo_id_fkey FOREIGN KEY (processo_id) REFERENCES juridico.processo(id);


--
-- TOC entry 4805 (class 2606 OID 16529)
-- Name: prazo prazo_processo_id_fkey; Type: FK CONSTRAINT; Schema: juridico; Owner: postgres
--

ALTER TABLE ONLY juridico.prazo
    ADD CONSTRAINT prazo_processo_id_fkey FOREIGN KEY (processo_id) REFERENCES juridico.processo(id);


--
-- TOC entry 4801 (class 2606 OID 16488)
-- Name: processo processo_advogado_id_fkey; Type: FK CONSTRAINT; Schema: juridico; Owner: postgres
--

ALTER TABLE ONLY juridico.processo
    ADD CONSTRAINT processo_advogado_id_fkey FOREIGN KEY (advogado_id) REFERENCES juridico.advogado(id);


--
-- TOC entry 4802 (class 2606 OID 16504)
-- Name: processo_parte processo_parte_parte_id_fkey; Type: FK CONSTRAINT; Schema: juridico; Owner: postgres
--

ALTER TABLE ONLY juridico.processo_parte
    ADD CONSTRAINT processo_parte_parte_id_fkey FOREIGN KEY (parte_id) REFERENCES juridico.parte(id);


--
-- TOC entry 4803 (class 2606 OID 16499)
-- Name: processo_parte processo_parte_processo_id_fkey; Type: FK CONSTRAINT; Schema: juridico; Owner: postgres
--

ALTER TABLE ONLY juridico.processo_parte
    ADD CONSTRAINT processo_parte_processo_id_fkey FOREIGN KEY (processo_id) REFERENCES juridico.processo(id);


--
-- TOC entry 4799 (class 2606 OID 16438)
-- Name: andamento andamento_id_processo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.andamento
    ADD CONSTRAINT andamento_id_processo_fkey FOREIGN KEY (id_processo) REFERENCES public.processo(id_processo);


--
-- TOC entry 4797 (class 2606 OID 16411)
-- Name: processo fk_processo_advogado; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.processo
    ADD CONSTRAINT fk_processo_advogado FOREIGN KEY (id_advogado) REFERENCES public.advogado(id_advogado);


--
-- TOC entry 4798 (class 2606 OID 16424)
-- Name: parte parte_id_processo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.parte
    ADD CONSTRAINT parte_id_processo_fkey FOREIGN KEY (id_processo) REFERENCES public.processo(id_processo);


--
-- TOC entry 4800 (class 2606 OID 16455)
-- Name: prazo prazo_id_processo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prazo
    ADD CONSTRAINT prazo_id_processo_fkey FOREIGN KEY (id_processo) REFERENCES public.processo(id_processo);


-- Completed on 2026-11-23 21:13:15

--
-- PostgreSQL database dump complete
--

\unrestrict TTCH19hyUPr1PQGWYTgH8Jp9h8cGtLx4KZmFaooAkATt5OCUBA0O9dmfyMVPZRv

