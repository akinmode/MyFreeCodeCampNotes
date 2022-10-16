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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30),
    planet_counts integer,
    star_counts integer,
    description text,
    count numeric,
    has_moons boolean NOT NULL,
    has_stars boolean NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    planet_id integer,
    name character varying(30),
    has_sun boolean NOT NULL,
    radius numeric(5,2) NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    star_id integer,
    num_moons numeric,
    name character varying(30),
    has_moons boolean NOT NULL,
    has_life boolean NOT NULL,
    radius numeric(5,2)
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    galaxy_id integer,
    name character varying(30),
    has_sun boolean NOT NULL,
    is_spherical boolean NOT NULL,
    radius numeric(5,2)
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: sun; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.sun (
    sun_id integer NOT NULL,
    radius numeric(6,2),
    alias character varying(20) NOT NULL,
    is_hot boolean NOT NULL,
    name character varying(30)
);


ALTER TABLE public.sun OWNER TO freecodecamp;

--
-- Name: sun_sun_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.sun_sun_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sun_sun_id_seq OWNER TO freecodecamp;

--
-- Name: sun_sun_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.sun_sun_id_seq OWNED BY public.sun.sun_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Name: sun sun_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.sun ALTER COLUMN sun_id SET DEFAULT nextval('public.sun_sun_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'g-one', 3, 14, 'newly found', 3, true, false);
INSERT INTO public.galaxy VALUES (2, 'g-two', 4, 5, 'milky way', 4, true, true);
INSERT INTO public.galaxy VALUES (3, 'g-three', 10, 15, 'my new guy', 10, true, true);
INSERT INTO public.galaxy VALUES (4, 'g-four', 8, 15, 'my new planet', 10, true, true);
INSERT INTO public.galaxy VALUES (5, 'g-five', 8, 15, 'my new planet', 10, true, true);
INSERT INTO public.galaxy VALUES (6, 'g-siz', 8, 10, 'my new baby', 10, true, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 1, 'onebig', true, 50.00);
INSERT INTO public.moon VALUES (2, 2, 'twobig', true, 60.00);
INSERT INTO public.moon VALUES (3, 3, 'threesmall', true, 100.00);
INSERT INTO public.moon VALUES (4, 4, 'fourgreat', true, 120.00);
INSERT INTO public.moon VALUES (5, 2, 'fivebig', true, 60.00);
INSERT INTO public.moon VALUES (6, 3, 'sixsmall', true, 100.00);
INSERT INTO public.moon VALUES (7, 4, 'sevengreat', true, 120.00);
INSERT INTO public.moon VALUES (8, 2, 'fiveten', true, 60.00);
INSERT INTO public.moon VALUES (9, 3, 'sixnine', true, 100.00);
INSERT INTO public.moon VALUES (10, 4, 'seveneightt', true, 120.00);
INSERT INTO public.moon VALUES (11, 2, 'threen', true, 60.00);
INSERT INTO public.moon VALUES (12, 3, 'twelve', true, 100.00);
INSERT INTO public.moon VALUES (13, 4, 'ele', true, 120.00);
INSERT INTO public.moon VALUES (14, 2, 'topen', true, 60.00);
INSERT INTO public.moon VALUES (15, 3, 'twelvemoon', true, 100.00);
INSERT INTO public.moon VALUES (16, 4, 'ele14', true, 120.00);
INSERT INTO public.moon VALUES (17, 2, 'silver', true, 60.00);
INSERT INTO public.moon VALUES (18, 3, 'brass', true, 100.00);
INSERT INTO public.moon VALUES (19, 4, 'golf', true, 120.00);
INSERT INTO public.moon VALUES (20, 2, 'diamond', true, 60.00);
INSERT INTO public.moon VALUES (21, 3, 'copper', true, 100.00);
INSERT INTO public.moon VALUES (22, 4, 'pork', true, 120.00);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 4, 1, 'Earth', true, true, 80.50);
INSERT INTO public.planet VALUES (2, 5, 1, 'Mars', true, true, 180.50);
INSERT INTO public.planet VALUES (3, 5, 1, 'Mercury', true, true, 120.50);
INSERT INTO public.planet VALUES (4, 5, 1, 'Mersurt', true, true, 150.50);
INSERT INTO public.planet VALUES (5, 4, 2, 'Jupiter', true, false, 150.50);
INSERT INTO public.planet VALUES (6, 4, 3, 'Saturn', true, false, 200.50);
INSERT INTO public.planet VALUES (7, 4, 4, 'Venus', true, false, 100.00);
INSERT INTO public.planet VALUES (8, 4, 4, 'Venus2', true, false, 100.00);
INSERT INTO public.planet VALUES (9, 4, 4, 'Venu52', true, false, 100.00);
INSERT INTO public.planet VALUES (10, 4, 4, 'Erth', true, false, 100.00);
INSERT INTO public.planet VALUES (12, 4, 4, 'Erath', true, false, 100.00);
INSERT INTO public.planet VALUES (14, 4, 4, 'Gold', true, false, 100.00);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (4, 1, 'medusa', true, false, 100.56);
INSERT INTO public.star VALUES (5, 1, 'orion', true, false, 250.00);
INSERT INTO public.star VALUES (6, 3, 'apollo', true, true, 120.00);
INSERT INTO public.star VALUES (7, 4, 'zeis', true, true, 300.00);
INSERT INTO public.star VALUES (8, 6, 'argo', true, true, 350.00);
INSERT INTO public.star VALUES (9, 5, 'bluebelt', true, false, 400.00);


--
-- Data for Name: sun; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.sun VALUES (1, 2000.40, 'starboy', true, 'Helium');
INSERT INTO public.sun VALUES (2, 2500.40, 'bigbag', true, 'Hydro');
INSERT INTO public.sun VALUES (3, 1005.40, 'allstar', false, 'sharp');


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 22, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 14, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 9, true);


--
-- Name: sun_sun_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.sun_sun_id_seq', 3, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: sun sun_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.sun
    ADD CONSTRAINT sun_name_key UNIQUE (name);


--
-- Name: sun sun_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.sun
    ADD CONSTRAINT sun_pkey PRIMARY KEY (sun_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

