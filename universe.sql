--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
    name character varying(60) NOT NULL,
    galaxy_type character varying(40) NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    distance_from_earth numeric(12,2),
    has_supermassive_black_hole boolean NOT NULL,
    description text
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
    name character varying(60) NOT NULL,
    planet_id integer NOT NULL,
    diameter_km integer NOT NULL,
    orbital_radius_km numeric(12,2),
    is_tidally_locked boolean NOT NULL,
    description text
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
-- Name: nebula; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.nebula (
    nebula_id integer NOT NULL,
    name character varying(60) NOT NULL,
    galaxy_id integer NOT NULL,
    light_years_across integer NOT NULL,
    is_emission boolean NOT NULL,
    description text
);


ALTER TABLE public.nebula OWNER TO freecodecamp;

--
-- Name: nebula_nebula_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.nebula_nebula_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.nebula_nebula_id_seq OWNER TO freecodecamp;

--
-- Name: nebula_nebula_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.nebula_nebula_id_seq OWNED BY public.nebula.nebula_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(60) NOT NULL,
    star_id integer NOT NULL,
    planet_type character varying(40) NOT NULL,
    orbital_period_days integer NOT NULL,
    distance_from_star_au numeric(10,3),
    has_life boolean NOT NULL,
    is_spherical boolean NOT NULL,
    description text
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
    name character varying(60) NOT NULL,
    galaxy_id integer NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    mass_solar numeric(10,3),
    is_main_sequence boolean NOT NULL,
    description text
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
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: nebula nebula_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.nebula ALTER COLUMN nebula_id SET DEFAULT nextval('public.nebula_nebula_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 13600, 0.00, true, 'Our home barred spiral galaxy.');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 10000, 2537000.00, true, 'Nearest major spiral galaxy to the Milky Way.');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 12000, 2730000.00, false, 'Third-largest member of the Local Group.');
INSERT INTO public.galaxy VALUES (4, 'Sombrero', 'Lenticular', 13250, 29350000.00, true, 'Bright nucleus with a prominent dust lane.');
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 'Spiral', 400, 23160000.00, true, 'Interacting grand-design spiral galaxy.');
INSERT INTO public.galaxy VALUES (6, 'Messier 87', 'Elliptical', 13000, 53500000.00, true, 'Supergiant elliptical galaxy in the Virgo Cluster.');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, 3474, 384400.00, true, 'Earth sole natural satellite.');
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 22, 9376.00, true, 'Inner and larger moon of Mars.');
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 12, 23463.00, true, 'Outer and smaller moon of Mars.');
INSERT INTO public.moon VALUES (4, 'Io', 5, 3643, 421700.00, true, 'Most volcanically active body in the Solar System.');
INSERT INTO public.moon VALUES (5, 'Europa', 5, 3122, 671034.00, true, 'Icy moon with a subsurface saltwater ocean.');
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, 5268, 1070412.00, true, 'Largest moon in the Solar System.');
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 4821, 1882709.00, true, 'Heavily cratered outer Galilean moon.');
INSERT INTO public.moon VALUES (8, 'Amalthea', 5, 167, 181366.00, true, 'Irregular inner moon of Jupiter.');
INSERT INTO public.moon VALUES (9, 'Himalia', 5, 140, 11460000.00, false, 'Largest irregular moon of Jupiter.');
INSERT INTO public.moon VALUES (10, 'Titan', 6, 5150, 1221870.00, true, 'Saturn largest moon with a dense atmosphere.');
INSERT INTO public.moon VALUES (11, 'Enceladus', 6, 504, 237948.00, true, 'Icy moon venting water plumes from its south pole.');
INSERT INTO public.moon VALUES (12, 'Mimas', 6, 396, 185539.00, true, 'Small moon featuring the giant Herschel crater.');
INSERT INTO public.moon VALUES (13, 'Tethys', 6, 1062, 294619.00, true, 'Mid-sized icy moon of Saturn.');
INSERT INTO public.moon VALUES (14, 'Dione', 6, 1123, 377396.00, true, 'Dense icy moon of Saturn.');
INSERT INTO public.moon VALUES (15, 'Rhea', 6, 1527, 527108.00, true, 'Second-largest moon of Saturn.');
INSERT INTO public.moon VALUES (16, 'Iapetus', 6, 1469, 3560820.00, true, 'Two-tone moon of Saturn.');
INSERT INTO public.moon VALUES (17, 'Titania', 7, 1578, 435910.00, true, 'Largest moon of Uranus.');
INSERT INTO public.moon VALUES (18, 'Oberon', 7, 1523, 583520.00, true, 'Outermost major moon of Uranus.');
INSERT INTO public.moon VALUES (19, 'Miranda', 7, 472, 129390.00, true, 'Smallest major moon of Uranus with extreme cliffs.');
INSERT INTO public.moon VALUES (20, 'Triton', 8, 2707, 354759.00, true, 'Largest moon of Neptune with retrograde orbit.');


--
-- Data for Name: nebula; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.nebula VALUES (1, 'Orion Nebula', 1, 24, true, 'Diffuse nebula south of Orion Belt.');
INSERT INTO public.nebula VALUES (2, 'Crab Nebula', 1, 11, true, 'Supernova remnant in Taurus.');
INSERT INTO public.nebula VALUES (3, 'Tarantula Nebula', 1, 1800, true, 'Active star-forming region in the Large Magellanic Cloud.');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 'Terrestrial', 88, 0.390, false, true, 'Smallest and innermost planet in the Solar System.');
INSERT INTO public.planet VALUES (2, 'Venus', 1, 'Terrestrial', 225, 0.720, false, true, 'Hottest planet with a thick carbon dioxide atmosphere.');
INSERT INTO public.planet VALUES (3, 'Earth', 1, 'Terrestrial', 365, 1.000, true, true, 'Only known astronomical body harboring life.');
INSERT INTO public.planet VALUES (4, 'Mars', 1, 'Terrestrial', 687, 1.520, false, true, 'Cold desert world with iron oxide surface.');
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 'Gas Giant', 4333, 5.200, false, true, 'Largest planet in the Solar System.');
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 'Gas Giant', 10759, 9.580, false, true, 'Known for its extensive ring system.');
INSERT INTO public.planet VALUES (7, 'Uranus', 1, 'Ice Giant', 30688, 19.200, false, true, 'Rotates on its side with an axial tilt near 98 degrees.');
INSERT INTO public.planet VALUES (8, 'Neptune', 1, 'Ice Giant', 60195, 30.050, false, true, 'Distant blue ice giant with supersonic winds.');
INSERT INTO public.planet VALUES (9, 'Proxima Centauri b', 2, 'Exoplanet', 11, 0.049, false, true, 'Exoplanet orbiting within the habitable zone of Proxima Centauri.');
INSERT INTO public.planet VALUES (10, 'Proxima Centauri c', 2, 'Super-Earth', 1928, 1.489, false, true, 'Candidate super-Earth orbiting Proxima Centauri.');
INSERT INTO public.planet VALUES (11, 'Alpheratz I', 5, 'Gas Giant', 410, 1.250, false, true, 'Hypothetical gas giant orbiting Alpheratz.');
INSERT INTO public.planet VALUES (12, 'Mirach I', 6, 'Rocky', 520, 1.800, false, true, 'Hypothetical rocky planet orbiting Mirach.');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 4600, 1.000, true, 'G-type main-sequence star at the center of our Solar System.');
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 1, 4850, 0.122, true, 'Closest known star to the Sun.');
INSERT INTO public.star VALUES (3, 'Sirius A', 1, 242, 2.063, true, 'Brightest star in Earth night sky.');
INSERT INTO public.star VALUES (4, 'Vega', 1, 455, 2.135, true, 'Bright star in the constellation Lyra.');
INSERT INTO public.star VALUES (5, 'Alpheratz', 2, 60, 3.800, true, 'Brightest star in the Andromeda constellation.');
INSERT INTO public.star VALUES (6, 'Mirach', 2, 1200, 3.500, false, 'Red giant star in Andromeda.');


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: nebula_nebula_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.nebula_nebula_id_seq', 3, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


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
-- Name: nebula nebula_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.nebula
    ADD CONSTRAINT nebula_name_key UNIQUE (name);


--
-- Name: nebula nebula_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.nebula
    ADD CONSTRAINT nebula_pkey PRIMARY KEY (nebula_id);


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
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: nebula nebula_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.nebula
    ADD CONSTRAINT nebula_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


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

