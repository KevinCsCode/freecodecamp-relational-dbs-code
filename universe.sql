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
    name character varying(50) NOT NULL,
    galaxy_type_id integer NOT NULL,
    galactic_diameter_in_lightyears integer,
    is_active boolean,
    contains_black_hole boolean
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
-- Name: galaxy_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_type (
    galaxy_type_id integer NOT NULL,
    name character varying(30),
    in_use boolean DEFAULT true NOT NULL
);


ALTER TABLE public.galaxy_type OWNER TO freecodecamp;

--
-- Name: galaxy_types_galaxy_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_types_galaxy_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_types_galaxy_type_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_types_galaxy_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_types_galaxy_type_id_seq OWNED BY public.galaxy_type.galaxy_type_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(80),
    planet_id integer NOT NULL,
    dist_to_planet_thousand_km numeric(10,2),
    orbital_eccentricity numeric(8,4)
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
    name character varying(80) NOT NULL,
    star_id integer NOT NULL,
    dist_to_star_in_hundred_thousand_km numeric(10,2),
    has_life boolean,
    is_spherical boolean,
    is_solid boolean,
    orbital_eccentricity numeric(8,4),
    mass_in_earth_masses numeric(15,2),
    radius_in_earth_radii numeric(15,3)
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
    name character varying(70) NOT NULL,
    star_type_id integer NOT NULL,
    galaxy_id integer NOT NULL,
    mass_in_solar_masses numeric(15,2),
    radius_in_solar_radii numeric(15,2),
    bolometric_luminosity integer
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
-- Name: star_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star_type (
    star_type_id integer NOT NULL,
    name character varying(1) NOT NULL,
    min_temperature_in_kelvin integer NOT NULL,
    colour text NOT NULL
);


ALTER TABLE public.star_type OWNER TO freecodecamp;

--
-- Name: star_types_star_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_types_star_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_types_star_type_id_seq OWNER TO freecodecamp;

--
-- Name: star_types_star_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_types_star_type_id_seq OWNED BY public.star_type.star_type_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: galaxy_type galaxy_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type ALTER COLUMN galaxy_type_id SET DEFAULT nextval('public.galaxy_types_galaxy_type_id_seq'::regclass);


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
-- Name: star_type star_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_type ALTER COLUMN star_type_id SET DEFAULT nextval('public.star_types_star_type_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'NGC 669', 1, 153577, true, NULL);
INSERT INTO public.galaxy VALUES (2, 'Milky Way', 1, 87400, false, true);
INSERT INTO public.galaxy VALUES (3, 'Andromeda', 1, 152000, false, true);
INSERT INTO public.galaxy VALUES (4, 'NGC 4569', 1, 113354, false, NULL);
INSERT INTO public.galaxy VALUES (5, 'Maffei 1', 2, 75000, false, NULL);
INSERT INTO public.galaxy VALUES (6, 'ESO 350-40', 3, 144300, false, true);
INSERT INTO public.galaxy VALUES (7, 'NGC 4374', 3, 54900000, false, true);
INSERT INTO public.galaxy VALUES (8, 'IC 4710', 4, 36000, false, NULL);
INSERT INTO public.galaxy VALUES (9, 'IC 3583', 4, 30000000, false, NULL);


--
-- Data for Name: galaxy_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_type VALUES (1, 'Spiral', true);
INSERT INTO public.galaxy_type VALUES (2, 'Elliptical', true);
INSERT INTO public.galaxy_type VALUES (3, 'Lenticular', true);
INSERT INTO public.galaxy_type VALUES (4, 'Irregular', true);
INSERT INTO public.galaxy_type VALUES (5, 'Seyfert', true);
INSERT INTO public.galaxy_type VALUES (6, 'Quasars', true);
INSERT INTO public.galaxy_type VALUES (7, 'Blazars', true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Metis', 16, 128.00, 0.0002);
INSERT INTO public.moon VALUES (2, 'Adrastea', 16, 129.00, 0.0015);
INSERT INTO public.moon VALUES (3, 'Amalthea', 16, 181.40, 0.0032);
INSERT INTO public.moon VALUES (4, 'Thebe', 16, 221.90, 0.0175);
INSERT INTO public.moon VALUES (5, 'Io', 16, 421.80, 0.0041);
INSERT INTO public.moon VALUES (6, 'Europa', 16, 671.10, 0.0090);
INSERT INTO public.moon VALUES (7, 'Ganymede', 16, 1070.40, 0.0013);
INSERT INTO public.moon VALUES (8, 'Callisto', 16, 1882.70, 0.0074);
INSERT INTO public.moon VALUES (9, 'Themisto', 16, 7398.50, 0.3400);
INSERT INTO public.moon VALUES (10, 'Leda', 16, 11146.40, 0.1620);
INSERT INTO public.moon VALUES (11, 'Ersa', 16, 11401.00, 0.1160);
INSERT INTO public.moon VALUES (12, 'Himalia', 16, 11440.60, 0.1600);
INSERT INTO public.moon VALUES (13, 'Pandia', 16, 11481.00, 0.1790);
INSERT INTO public.moon VALUES (14, 'Lysithea', 16, 11700.80, 0.1170);
INSERT INTO public.moon VALUES (15, 'Elara', 16, 11712.30, 0.2110);
INSERT INTO public.moon VALUES (16, 'Carpo', 16, 17042.30, 0.4160);
INSERT INTO public.moon VALUES (17, 'Valetudo', 16, 18694.20, 0.2170);
INSERT INTO public.moon VALUES (18, 'Euporie', 16, 19265.80, 0.1480);
INSERT INTO public.moon VALUES (19, 'Eupheme', 16, 20768.60, 0.2410);
INSERT INTO public.moon VALUES (20, 'Titan', 17, 1221.93, 0.0288);
INSERT INTO public.moon VALUES (21, 'Rhea', 17, 527.11, 0.0013);
INSERT INTO public.moon VALUES (22, 'Calypso', 17, 294.62, 0.0010);
INSERT INTO public.moon VALUES (23, 'Tethys', 17, 294.62, 0.0001);
INSERT INTO public.moon VALUES (24, 'Mimas', 17, 185.40, 0.0202);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (12, 'Mercury', 8, 54.62, false, true, true, 0.2060, 0.06, 0.380);
INSERT INTO public.planet VALUES (13, 'Venus', 8, 102.08, false, true, true, 0.0070, 0.82, 0.950);
INSERT INTO public.planet VALUES (14, 'Earth', 8, 141.13, true, true, true, 0.0170, 1.00, 1.000);
INSERT INTO public.planet VALUES (15, 'Mars', 8, 215.09, false, true, true, 0.0940, 0.11, 0.530);
INSERT INTO public.planet VALUES (16, 'Jupiter', 8, 734.43, false, true, false, 0.0490, 317.92, 11.210);
INSERT INTO public.planet VALUES (17, 'Saturn', 8, 1350.94, false, true, false, 0.0520, 95.14, 9.450);
INSERT INTO public.planet VALUES (18, 'Uranus', 8, 2704.72, false, true, false, 0.0470, 14.54, 4.010);
INSERT INTO public.planet VALUES (19, 'Neptune', 8, 4259.43, false, true, false, 0.0100, 17.09, 3.880);
INSERT INTO public.planet VALUES (20, 'Pluto', 8, 5572.08, false, true, true, 0.2440, 0.00, 0.190);
INSERT INTO public.planet VALUES (21, 'Proxima Centauri d', 9, 43000.00, false, true, NULL, 0.0400, 0.26, 0.810);
INSERT INTO public.planet VALUES (22, 'Proxima Centauri b', 9, 75000.00, false, true, NULL, NULL, NULL, 1.070);
INSERT INTO public.planet VALUES (23, 'Lalande b', 10, NULL, false, true, false, NULL, 2.64, NULL);
INSERT INTO public.planet VALUES (24, 'Lalande c', 10, NULL, false, true, false, NULL, 14.20, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Alpheratz', 2, 3, 3.80, 2.70, 240);
INSERT INTO public.star VALUES (2, 'Mirach', 7, 3, 2.49, 100.00, 1995);
INSERT INTO public.star VALUES (3, 'Veritate', 6, 3, 1.12, 10.49, 60);
INSERT INTO public.star VALUES (4, 'VY Canis Majoris', 7, 1, 17.00, 1420.00, 270000);
INSERT INTO public.star VALUES (5, 'UY Scuti', 7, 1, 8.00, 1708.00, 340000);
INSERT INTO public.star VALUES (6, 'Sirius', 3, 1, 2.06, 1.71, 25);
INSERT INTO public.star VALUES (7, 'Vega', 3, 1, 2.14, 2.36, 40);
INSERT INTO public.star VALUES (9, 'Proxima Centauri', 7, 1, 0.12, 0.15, 0);
INSERT INTO public.star VALUES (8, 'Sun', 5, 1, 1.00, 1.00, 1);
INSERT INTO public.star VALUES (10, 'Lalande 21185', 5, 1, 0.39, 0.39, 0);


--
-- Data for Name: star_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star_type VALUES (1, 'O', 30000, 'Blue');
INSERT INTO public.star_type VALUES (2, 'B', 10000, 'Blue-White');
INSERT INTO public.star_type VALUES (3, 'A', 7500, 'White');
INSERT INTO public.star_type VALUES (4, 'F', 6000, 'Yellow-White');
INSERT INTO public.star_type VALUES (5, 'G', 5200, 'Yellow');
INSERT INTO public.star_type VALUES (6, 'K', 3700, 'Orange');
INSERT INTO public.star_type VALUES (7, 'M', 0, 'Red');


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 9, true);


--
-- Name: galaxy_types_galaxy_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_types_galaxy_type_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 24, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 44, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 10, true);


--
-- Name: star_types_star_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_types_star_type_id_seq', 7, true);


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
-- Name: galaxy_type galaxy_types_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT galaxy_types_name_key UNIQUE (name);


--
-- Name: galaxy_type galaxy_types_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT galaxy_types_pkey PRIMARY KEY (galaxy_type_id);


--
-- Name: moon moon_name_planet_constraint; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_planet_constraint UNIQUE (name, planet_id);


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
-- Name: star_type star_types_classification_char_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_type
    ADD CONSTRAINT star_types_classification_char_key UNIQUE (name);


--
-- Name: star_type star_types_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_type
    ADD CONSTRAINT star_types_pkey PRIMARY KEY (star_type_id);


--
-- Name: galaxy galaxy_galaxy_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_type_id_fkey FOREIGN KEY (galaxy_type_id) REFERENCES public.galaxy_type(galaxy_type_id);


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
-- Name: star star_star_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_type_id_fkey FOREIGN KEY (star_type_id) REFERENCES public.star_type(star_type_id);


--
-- PostgreSQL database dump complete
--

