--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: user_info; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.user_info (
    username character varying(22) NOT NULL,
    games_played integer,
    best_game integer
);


ALTER TABLE public.user_info OWNER TO freecodecamp;

--
-- Data for Name: user_info; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.user_info VALUES ('ol', 0, NULL);
INSERT INTO public.user_info VALUES ('as', 0, NULL);
INSERT INTO public.user_info VALUES ('ALA', 1, NULL);
INSERT INTO public.user_info VALUES ('DAS', 1, NULL);
INSERT INTO public.user_info VALUES ('ALAN', 1, NULL);
INSERT INTO public.user_info VALUES ('UL', 0, NULL);
INSERT INTO public.user_info VALUES ('YH', 0, NULL);
INSERT INTO public.user_info VALUES ('KA', 2, NULL);
INSERT INTO public.user_info VALUES ('de', 1, 0);
INSERT INTO public.user_info VALUES ('ad', 2, 0);
INSERT INTO public.user_info VALUES ('ala', 4, 1);
INSERT INTO public.user_info VALUES ('pl', 1, 0);
INSERT INTO public.user_info VALUES ('ty', 1, 0);
INSERT INTO public.user_info VALUES ('hg', 4, 1);
INSERT INTO public.user_info VALUES ('user_1693335824668', 2, 278);
INSERT INTO public.user_info VALUES ('user_1693335824669', 5, 15);


--
-- Name: user_info user_info_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.user_info
    ADD CONSTRAINT user_info_pkey PRIMARY KEY (username);


--
-- PostgreSQL database dump complete
--
