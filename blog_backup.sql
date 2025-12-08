--
-- PostgreSQL database dump
--

\restrict HzL9cv70AlpXeCWIVi5wdX7pfWXOSUyM5DFR0yIMF8qVazshKLchGQCYoxI9C6m

-- Dumped from database version 18.1 (Postgres.app)
-- Dumped by pg_dump version 18.1 (Postgres.app)

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
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: noyb911
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.ar_internal_metadata OWNER TO noyb911;

--
-- Name: articles; Type: TABLE; Schema: public; Owner: noyb911
--

CREATE TABLE public.articles (
    id bigint NOT NULL,
    title character varying,
    body text,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    status character varying
);


ALTER TABLE public.articles OWNER TO noyb911;

--
-- Name: articles_id_seq; Type: SEQUENCE; Schema: public; Owner: noyb911
--

CREATE SEQUENCE public.articles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.articles_id_seq OWNER TO noyb911;

--
-- Name: articles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: noyb911
--

ALTER SEQUENCE public.articles_id_seq OWNED BY public.articles.id;


--
-- Name: comments; Type: TABLE; Schema: public; Owner: noyb911
--

CREATE TABLE public.comments (
    id bigint NOT NULL,
    commenter character varying,
    body text,
    article_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    status character varying
);


ALTER TABLE public.comments OWNER TO noyb911;

--
-- Name: comments_id_seq; Type: SEQUENCE; Schema: public; Owner: noyb911
--

CREATE SEQUENCE public.comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.comments_id_seq OWNER TO noyb911;

--
-- Name: comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: noyb911
--

ALTER SEQUENCE public.comments_id_seq OWNED BY public.comments.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: noyb911
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO noyb911;

--
-- Name: articles id; Type: DEFAULT; Schema: public; Owner: noyb911
--

ALTER TABLE ONLY public.articles ALTER COLUMN id SET DEFAULT nextval('public.articles_id_seq'::regclass);


--
-- Name: comments id; Type: DEFAULT; Schema: public; Owner: noyb911
--

ALTER TABLE ONLY public.comments ALTER COLUMN id SET DEFAULT nextval('public.comments_id_seq'::regclass);


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: noyb911
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2025-12-08 00:09:34.060118	2025-12-08 00:09:34.060119
\.


--
-- Data for Name: articles; Type: TABLE DATA; Schema: public; Owner: noyb911
--

COPY public.articles (id, title, body, created_at, updated_at, status) FROM stdin;
1	Article X	This is the first article ever!!	2025-12-08 00:09:57.318609	2025-12-08 00:09:57.318609	public
2	Article Y	Hopefully, this one shows up too.	2025-12-08 05:28:46.865649	2025-12-08 05:28:46.865649	public
\.


--
-- Data for Name: comments; Type: TABLE DATA; Schema: public; Owner: noyb911
--

COPY public.comments (id, commenter, body, article_id, created_at, updated_at, status) FROM stdin;
1	@noyb911	Safa!! First one.	1	2025-12-08 00:10:07.048339	2025-12-08 00:10:07.048339	public
2	@preslam	xXx	1	2025-12-08 00:10:17.455154	2025-12-08 00:10:17.455154	private
3	@noyb911	whatever...	2	2025-12-08 05:29:03.198276	2025-12-08 05:29:03.198276	public
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: noyb911
--

COPY public.schema_migrations (version) FROM stdin;
20251202061140
20251204061458
20251206231106
20251206231124
\.


--
-- Name: articles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: noyb911
--

SELECT pg_catalog.setval('public.articles_id_seq', 2, true);


--
-- Name: comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: noyb911
--

SELECT pg_catalog.setval('public.comments_id_seq', 3, true);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: noyb911
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: articles articles_pkey; Type: CONSTRAINT; Schema: public; Owner: noyb911
--

ALTER TABLE ONLY public.articles
    ADD CONSTRAINT articles_pkey PRIMARY KEY (id);


--
-- Name: comments comments_pkey; Type: CONSTRAINT; Schema: public; Owner: noyb911
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: noyb911
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: index_comments_on_article_id; Type: INDEX; Schema: public; Owner: noyb911
--

CREATE INDEX index_comments_on_article_id ON public.comments USING btree (article_id);


--
-- Name: comments fk_rails_3bf61a60d3; Type: FK CONSTRAINT; Schema: public; Owner: noyb911
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT fk_rails_3bf61a60d3 FOREIGN KEY (article_id) REFERENCES public.articles(id);


--
-- PostgreSQL database dump complete
--

\unrestrict HzL9cv70AlpXeCWIVi5wdX7pfWXOSUyM5DFR0yIMF8qVazshKLchGQCYoxI9C6m

