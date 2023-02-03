--
-- PostgreSQL database dump
--

-- Dumped from database version 15.1 (Debian 15.1-1.pgdg110+1)
-- Dumped by pg_dump version 15.1

-- Started on 2023-02-03 20:44:34

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
-- TOC entry 214 (class 1259 OID 16389)
-- Name: Dishes; Type: TABLE; Schema: public; Owner: useradmin
--

CREATE TABLE public."Dishes" (
    "Description" text NOT NULL,
    "Price" double precision DEFAULT 0 NOT NULL,
    "Type" text NOT NULL,
    "Name" text NOT NULL,
    "DishId" integer NOT NULL
);


ALTER TABLE public."Dishes" OWNER TO useradmin;

--
-- TOC entry 215 (class 1259 OID 16395)
-- Name: Dishes_DishId_seq; Type: SEQUENCE; Schema: public; Owner: useradmin
--

CREATE SEQUENCE public."Dishes_DishId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Dishes_DishId_seq" OWNER TO useradmin;

--
-- TOC entry 3438 (class 0 OID 0)
-- Dependencies: 215
-- Name: Dishes_DishId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: useradmin
--

ALTER SEQUENCE public."Dishes_DishId_seq" OWNED BY public."Dishes"."DishId";


--
-- TOC entry 216 (class 1259 OID 16396)
-- Name: MenuDish; Type: TABLE; Schema: public; Owner: useradmin
--

CREATE TABLE public."MenuDish" (
    "MenuDishId" integer NOT NULL,
    "MenuId" integer NOT NULL,
    "DishId" integer NOT NULL
);


ALTER TABLE public."MenuDish" OWNER TO useradmin;

--
-- TOC entry 217 (class 1259 OID 16399)
-- Name: MenuDish_DishId_seq; Type: SEQUENCE; Schema: public; Owner: useradmin
--

CREATE SEQUENCE public."MenuDish_DishId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."MenuDish_DishId_seq" OWNER TO useradmin;

--
-- TOC entry 3439 (class 0 OID 0)
-- Dependencies: 217
-- Name: MenuDish_DishId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: useradmin
--

ALTER SEQUENCE public."MenuDish_DishId_seq" OWNED BY public."MenuDish"."DishId";


--
-- TOC entry 218 (class 1259 OID 16400)
-- Name: MenuDish_MenuDishId_seq; Type: SEQUENCE; Schema: public; Owner: useradmin
--

CREATE SEQUENCE public."MenuDish_MenuDishId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."MenuDish_MenuDishId_seq" OWNER TO useradmin;

--
-- TOC entry 3440 (class 0 OID 0)
-- Dependencies: 218
-- Name: MenuDish_MenuDishId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: useradmin
--

ALTER SEQUENCE public."MenuDish_MenuDishId_seq" OWNED BY public."MenuDish"."MenuDishId";


--
-- TOC entry 219 (class 1259 OID 16401)
-- Name: MenuDish_MenuId_seq; Type: SEQUENCE; Schema: public; Owner: useradmin
--

CREATE SEQUENCE public."MenuDish_MenuId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."MenuDish_MenuId_seq" OWNER TO useradmin;

--
-- TOC entry 3441 (class 0 OID 0)
-- Dependencies: 219
-- Name: MenuDish_MenuId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: useradmin
--

ALTER SEQUENCE public."MenuDish_MenuId_seq" OWNED BY public."MenuDish"."MenuId";


--
-- TOC entry 220 (class 1259 OID 16402)
-- Name: Menus; Type: TABLE; Schema: public; Owner: useradmin
--

CREATE TABLE public."Menus" (
    "Name" text NOT NULL,
    "Description" text NOT NULL,
    "MenuId" integer NOT NULL,
    "UserId" integer NOT NULL
);


ALTER TABLE public."Menus" OWNER TO useradmin;

--
-- TOC entry 221 (class 1259 OID 16407)
-- Name: Menus_MenuId_seq; Type: SEQUENCE; Schema: public; Owner: useradmin
--

CREATE SEQUENCE public."Menus_MenuId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Menus_MenuId_seq" OWNER TO useradmin;

--
-- TOC entry 3442 (class 0 OID 0)
-- Dependencies: 221
-- Name: Menus_MenuId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: useradmin
--

ALTER SEQUENCE public."Menus_MenuId_seq" OWNED BY public."Menus"."MenuId";


--
-- TOC entry 222 (class 1259 OID 16408)
-- Name: Menus_UserId_seq; Type: SEQUENCE; Schema: public; Owner: useradmin
--

CREATE SEQUENCE public."Menus_UserId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Menus_UserId_seq" OWNER TO useradmin;

--
-- TOC entry 3443 (class 0 OID 0)
-- Dependencies: 222
-- Name: Menus_UserId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: useradmin
--

ALTER SEQUENCE public."Menus_UserId_seq" OWNED BY public."Menus"."UserId";


--
-- TOC entry 223 (class 1259 OID 16409)
-- Name: Ratings; Type: TABLE; Schema: public; Owner: useradmin
--

CREATE TABLE public."Ratings" (
    "Date" date NOT NULL,
    "Comment" text NOT NULL,
    "Score" real NOT NULL,
    "ReviewerName" text NOT NULL,
    "RatingId" integer NOT NULL,
    "UserId" integer NOT NULL
);


ALTER TABLE public."Ratings" OWNER TO useradmin;

--
-- TOC entry 224 (class 1259 OID 16414)
-- Name: Ratings_RatingId_seq; Type: SEQUENCE; Schema: public; Owner: useradmin
--

CREATE SEQUENCE public."Ratings_RatingId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Ratings_RatingId_seq" OWNER TO useradmin;

--
-- TOC entry 3444 (class 0 OID 0)
-- Dependencies: 224
-- Name: Ratings_RatingId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: useradmin
--

ALTER SEQUENCE public."Ratings_RatingId_seq" OWNED BY public."Ratings"."RatingId";


--
-- TOC entry 225 (class 1259 OID 16415)
-- Name: Ratings_UserId_seq; Type: SEQUENCE; Schema: public; Owner: useradmin
--

CREATE SEQUENCE public."Ratings_UserId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Ratings_UserId_seq" OWNER TO useradmin;

--
-- TOC entry 3445 (class 0 OID 0)
-- Dependencies: 225
-- Name: Ratings_UserId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: useradmin
--

ALTER SEQUENCE public."Ratings_UserId_seq" OWNED BY public."Ratings"."UserId";


--
-- TOC entry 226 (class 1259 OID 16416)
-- Name: ReservationDish; Type: TABLE; Schema: public; Owner: useradmin
--

CREATE TABLE public."ReservationDish" (
    "ReservationDishId" integer NOT NULL,
    "ReservationId" integer NOT NULL,
    "DishId" integer NOT NULL
);


ALTER TABLE public."ReservationDish" OWNER TO useradmin;

--
-- TOC entry 227 (class 1259 OID 16419)
-- Name: ReservationDish_DishId_seq; Type: SEQUENCE; Schema: public; Owner: useradmin
--

CREATE SEQUENCE public."ReservationDish_DishId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."ReservationDish_DishId_seq" OWNER TO useradmin;

--
-- TOC entry 3446 (class 0 OID 0)
-- Dependencies: 227
-- Name: ReservationDish_DishId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: useradmin
--

ALTER SEQUENCE public."ReservationDish_DishId_seq" OWNED BY public."ReservationDish"."DishId";


--
-- TOC entry 228 (class 1259 OID 16420)
-- Name: ReservationDish_ReservationDishId_seq; Type: SEQUENCE; Schema: public; Owner: useradmin
--

CREATE SEQUENCE public."ReservationDish_ReservationDishId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."ReservationDish_ReservationDishId_seq" OWNER TO useradmin;

--
-- TOC entry 3447 (class 0 OID 0)
-- Dependencies: 228
-- Name: ReservationDish_ReservationDishId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: useradmin
--

ALTER SEQUENCE public."ReservationDish_ReservationDishId_seq" OWNED BY public."ReservationDish"."ReservationDishId";


--
-- TOC entry 229 (class 1259 OID 16421)
-- Name: ReservationDish_ReservationId_seq; Type: SEQUENCE; Schema: public; Owner: useradmin
--

CREATE SEQUENCE public."ReservationDish_ReservationId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."ReservationDish_ReservationId_seq" OWNER TO useradmin;

--
-- TOC entry 3448 (class 0 OID 0)
-- Dependencies: 229
-- Name: ReservationDish_ReservationId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: useradmin
--

ALTER SEQUENCE public."ReservationDish_ReservationId_seq" OWNED BY public."ReservationDish"."ReservationId";


--
-- TOC entry 230 (class 1259 OID 16422)
-- Name: Reservations; Type: TABLE; Schema: public; Owner: useradmin
--

CREATE TABLE public."Reservations" (
    "Date" timestamp without time zone NOT NULL,
    "Address" text NOT NULL,
    "PhoneNumber" text NOT NULL,
    "State" text NOT NULL,
    "Comments" text,
    "TotalPrice" double precision,
    "ReservationId" integer NOT NULL,
    "UserId" integer NOT NULL,
    "MenuId" integer NOT NULL,
    "NbPersons" integer DEFAULT 4 NOT NULL
);


ALTER TABLE public."Reservations" OWNER TO useradmin;

--
-- TOC entry 238 (class 1259 OID 16514)
-- Name: Reservations_MenuId_seq; Type: SEQUENCE; Schema: public; Owner: useradmin
--

CREATE SEQUENCE public."Reservations_MenuId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Reservations_MenuId_seq" OWNER TO useradmin;

--
-- TOC entry 3449 (class 0 OID 0)
-- Dependencies: 238
-- Name: Reservations_MenuId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: useradmin
--

ALTER SEQUENCE public."Reservations_MenuId_seq" OWNED BY public."Reservations"."MenuId";


--
-- TOC entry 231 (class 1259 OID 16427)
-- Name: Reservations_ReservationId_seq; Type: SEQUENCE; Schema: public; Owner: useradmin
--

CREATE SEQUENCE public."Reservations_ReservationId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Reservations_ReservationId_seq" OWNER TO useradmin;

--
-- TOC entry 3450 (class 0 OID 0)
-- Dependencies: 231
-- Name: Reservations_ReservationId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: useradmin
--

ALTER SEQUENCE public."Reservations_ReservationId_seq" OWNED BY public."Reservations"."ReservationId";


--
-- TOC entry 232 (class 1259 OID 16428)
-- Name: Reservations_UserId_seq; Type: SEQUENCE; Schema: public; Owner: useradmin
--

CREATE SEQUENCE public."Reservations_UserId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Reservations_UserId_seq" OWNER TO useradmin;

--
-- TOC entry 3451 (class 0 OID 0)
-- Dependencies: 232
-- Name: Reservations_UserId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: useradmin
--

ALTER SEQUENCE public."Reservations_UserId_seq" OWNED BY public."Reservations"."UserId";


--
-- TOC entry 233 (class 1259 OID 16429)
-- Name: Roles; Type: TABLE; Schema: public; Owner: useradmin
--

CREATE TABLE public."Roles" (
    "Name" text NOT NULL,
    "RoleId" integer NOT NULL
);


ALTER TABLE public."Roles" OWNER TO useradmin;

--
-- TOC entry 234 (class 1259 OID 16434)
-- Name: Roles_RoleId_seq; Type: SEQUENCE; Schema: public; Owner: useradmin
--

CREATE SEQUENCE public."Roles_RoleId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Roles_RoleId_seq" OWNER TO useradmin;

--
-- TOC entry 3452 (class 0 OID 0)
-- Dependencies: 234
-- Name: Roles_RoleId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: useradmin
--

ALTER SEQUENCE public."Roles_RoleId_seq" OWNED BY public."Roles"."RoleId";


--
-- TOC entry 235 (class 1259 OID 16435)
-- Name: Users; Type: TABLE; Schema: public; Owner: useradmin
--

CREATE TABLE public."Users" (
    "Lastname" text NOT NULL,
    "Firstname" text NOT NULL,
    "Age" integer NOT NULL,
    "Email" text NOT NULL,
    "Active" boolean NOT NULL,
    "Description" text,
    "UserId" integer NOT NULL,
    "RoleId" integer NOT NULL,
    "Password" character varying(512) NOT NULL
);


ALTER TABLE public."Users" OWNER TO useradmin;

--
-- TOC entry 236 (class 1259 OID 16440)
-- Name: Users_RoleId_seq; Type: SEQUENCE; Schema: public; Owner: useradmin
--

CREATE SEQUENCE public."Users_RoleId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Users_RoleId_seq" OWNER TO useradmin;

--
-- TOC entry 3453 (class 0 OID 0)
-- Dependencies: 236
-- Name: Users_RoleId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: useradmin
--

ALTER SEQUENCE public."Users_RoleId_seq" OWNED BY public."Users"."RoleId";


--
-- TOC entry 237 (class 1259 OID 16441)
-- Name: Users_UserId_seq; Type: SEQUENCE; Schema: public; Owner: useradmin
--

CREATE SEQUENCE public."Users_UserId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Users_UserId_seq" OWNER TO useradmin;

--
-- TOC entry 3454 (class 0 OID 0)
-- Dependencies: 237
-- Name: Users_UserId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: useradmin
--

ALTER SEQUENCE public."Users_UserId_seq" OWNED BY public."Users"."UserId";


--
-- TOC entry 3221 (class 2604 OID 16442)
-- Name: Dishes DishId; Type: DEFAULT; Schema: public; Owner: useradmin
--

ALTER TABLE ONLY public."Dishes" ALTER COLUMN "DishId" SET DEFAULT nextval('public."Dishes_DishId_seq"'::regclass);


--
-- TOC entry 3222 (class 2604 OID 16443)
-- Name: MenuDish MenuDishId; Type: DEFAULT; Schema: public; Owner: useradmin
--

ALTER TABLE ONLY public."MenuDish" ALTER COLUMN "MenuDishId" SET DEFAULT nextval('public."MenuDish_MenuDishId_seq"'::regclass);


--
-- TOC entry 3223 (class 2604 OID 16444)
-- Name: MenuDish MenuId; Type: DEFAULT; Schema: public; Owner: useradmin
--

ALTER TABLE ONLY public."MenuDish" ALTER COLUMN "MenuId" SET DEFAULT nextval('public."MenuDish_MenuId_seq"'::regclass);


--
-- TOC entry 3224 (class 2604 OID 16445)
-- Name: MenuDish DishId; Type: DEFAULT; Schema: public; Owner: useradmin
--

ALTER TABLE ONLY public."MenuDish" ALTER COLUMN "DishId" SET DEFAULT nextval('public."MenuDish_DishId_seq"'::regclass);


--
-- TOC entry 3225 (class 2604 OID 16446)
-- Name: Menus MenuId; Type: DEFAULT; Schema: public; Owner: useradmin
--

ALTER TABLE ONLY public."Menus" ALTER COLUMN "MenuId" SET DEFAULT nextval('public."Menus_MenuId_seq"'::regclass);


--
-- TOC entry 3226 (class 2604 OID 16447)
-- Name: Menus UserId; Type: DEFAULT; Schema: public; Owner: useradmin
--

ALTER TABLE ONLY public."Menus" ALTER COLUMN "UserId" SET DEFAULT nextval('public."Menus_UserId_seq"'::regclass);


--
-- TOC entry 3227 (class 2604 OID 16448)
-- Name: Ratings RatingId; Type: DEFAULT; Schema: public; Owner: useradmin
--

ALTER TABLE ONLY public."Ratings" ALTER COLUMN "RatingId" SET DEFAULT nextval('public."Ratings_RatingId_seq"'::regclass);


--
-- TOC entry 3228 (class 2604 OID 16449)
-- Name: Ratings UserId; Type: DEFAULT; Schema: public; Owner: useradmin
--

ALTER TABLE ONLY public."Ratings" ALTER COLUMN "UserId" SET DEFAULT nextval('public."Ratings_UserId_seq"'::regclass);


--
-- TOC entry 3229 (class 2604 OID 16450)
-- Name: ReservationDish ReservationDishId; Type: DEFAULT; Schema: public; Owner: useradmin
--

ALTER TABLE ONLY public."ReservationDish" ALTER COLUMN "ReservationDishId" SET DEFAULT nextval('public."ReservationDish_ReservationDishId_seq"'::regclass);


--
-- TOC entry 3230 (class 2604 OID 16451)
-- Name: ReservationDish ReservationId; Type: DEFAULT; Schema: public; Owner: useradmin
--

ALTER TABLE ONLY public."ReservationDish" ALTER COLUMN "ReservationId" SET DEFAULT nextval('public."ReservationDish_ReservationId_seq"'::regclass);


--
-- TOC entry 3231 (class 2604 OID 16452)
-- Name: ReservationDish DishId; Type: DEFAULT; Schema: public; Owner: useradmin
--

ALTER TABLE ONLY public."ReservationDish" ALTER COLUMN "DishId" SET DEFAULT nextval('public."ReservationDish_DishId_seq"'::regclass);


--
-- TOC entry 3232 (class 2604 OID 16453)
-- Name: Reservations ReservationId; Type: DEFAULT; Schema: public; Owner: useradmin
--

ALTER TABLE ONLY public."Reservations" ALTER COLUMN "ReservationId" SET DEFAULT nextval('public."Reservations_ReservationId_seq"'::regclass);


--
-- TOC entry 3233 (class 2604 OID 16454)
-- Name: Reservations UserId; Type: DEFAULT; Schema: public; Owner: useradmin
--

ALTER TABLE ONLY public."Reservations" ALTER COLUMN "UserId" SET DEFAULT nextval('public."Reservations_UserId_seq"'::regclass);


--
-- TOC entry 3234 (class 2604 OID 16515)
-- Name: Reservations MenuId; Type: DEFAULT; Schema: public; Owner: useradmin
--

ALTER TABLE ONLY public."Reservations" ALTER COLUMN "MenuId" SET DEFAULT nextval('public."Reservations_MenuId_seq"'::regclass);


--
-- TOC entry 3236 (class 2604 OID 16455)
-- Name: Roles RoleId; Type: DEFAULT; Schema: public; Owner: useradmin
--

ALTER TABLE ONLY public."Roles" ALTER COLUMN "RoleId" SET DEFAULT nextval('public."Roles_RoleId_seq"'::regclass);


--
-- TOC entry 3237 (class 2604 OID 16456)
-- Name: Users UserId; Type: DEFAULT; Schema: public; Owner: useradmin
--

ALTER TABLE ONLY public."Users" ALTER COLUMN "UserId" SET DEFAULT nextval('public."Users_UserId_seq"'::regclass);


--
-- TOC entry 3238 (class 2604 OID 16457)
-- Name: Users RoleId; Type: DEFAULT; Schema: public; Owner: useradmin
--

ALTER TABLE ONLY public."Users" ALTER COLUMN "RoleId" SET DEFAULT nextval('public."Users_RoleId_seq"'::regclass);


--
-- TOC entry 3408 (class 0 OID 16389)
-- Dependencies: 214
-- Data for Name: Dishes; Type: TABLE DATA; Schema: public; Owner: useradmin
--

COPY public."Dishes" ("Description", "Price", "Type", "Name", "DishId") FROM stdin;
Toasted bread topped with diced tomatoes, garlic, basil, and olive oil.	8	Starter	Bruschetta	1
Spaghetti pasta tossed with pancetta, eggs, and parmesan cheese.	15	Main	Spaghetti Carbonara	2
Layers of espresso-soaked ladyfingers and mascarpone cream.	8	Dessert	Tiramisu	3
Thinly sliced prosciutto served with fresh cantaloupe melon.	12	Starter	Prosciutto e Melone	4
Fettuccine pasta in a rich cream and parmesan sauce.	18	Main	Fettuccine Alfredo	5
Crisp tubes of fried pastry filled with sweet ricotta cream and chocolate chips.	8	Dessert	Cannoli	6
Selection of cured meats, marinated vegetables, and cheeses.	15	Starter	Antipasto platter	7
Slow-cooked veal shank served with saffron risotto.	25	Main	Ossobuco alla Milanese	8
 Creamy vanilla custard topped with mixed berries.	8	Dessert	Panna Cotta	9
Vegetable soup with a variety of fresh vegetables and a touch of olive oil.	6	Starter	Zuppa di Verdure	10
Breaded chicken cutlet topped with tomato sauce and mozzarella cheese.	20	Main	Pollo alla Parmigiana	11
Homemade fruit tart with a flaky pastry crust and a fruit filling.	10	Dessert	Crostata di Frutta	12
Mussels cooked in a flavorful tomato sauce with garlic and white wine.	12	Starter	Cozze alla Marinara	13
Risotto with mushrooms, parmesan cheese, and truffle oil.	22	Main	Risotto ai Funghi	14
Layers of espresso-soaked ladyfingers and mascarpone cream.	8	Dessert	Tiramisu	15
Thinly sliced raw beef served with arugula, parmesan cheese, and a lemon dressing.	14	Starter	Carpaccio di Manzo	16
Veal scallops sautéed with marsala wine and mushrooms.	28	Main	Vitello al Marsala	17
Creamy vanilla custard topped with mixed berries.	8	Dessert	Panna Cotta	18
Fresh mozzarella, tomatoes, and basil drizzled with olive oil.	8	Starter	Caprese	19
Braised veal shanks served with risotto	28	Main	Ossobuco	20
Crispy pastry shells filled with sweet ricotta cheese and chocolate chips.	12	Dessert	Cannoli	21
Grilled bread topped with diced tomatoes, garlic, basil, and extra-virgin olive oil.	6	Starter	Bruschetta	22
Homemade lasagna made with meat sauce, béchamel sauce, and parmesan cheese	22	Main	Lasagna	23
Layers of espresso-soaked ladyfingers and mascarpone cream.	10	Dessert	Tiramisu	24
Fried risotto balls filled with mozzarella cheese.	7	Starter	Arancini	25
Classic pizza with tomato sauce, mozzarella cheese, and basil.	15	Main	Margherita Pizza	26
Creamy vanilla custard topped with berry compote.	9	Dessert	Panna Cotta	27
\.


--
-- TOC entry 3410 (class 0 OID 16396)
-- Dependencies: 216
-- Data for Name: MenuDish; Type: TABLE DATA; Schema: public; Owner: useradmin
--

COPY public."MenuDish" ("MenuDishId", "MenuId", "DishId") FROM stdin;
1	1	10
2	1	25
3	1	16
4	2	13
5	2	1
6	2	22
7	3	7
8	3	4
9	3	19
10	1	14
11	1	2
12	1	5
13	2	8
14	2	11
15	2	17
16	3	20
17	3	23
18	3	26
19	1	9
20	1	3
21	1	21
22	2	6
23	2	27
24	2	15
25	3	12
26	3	24
27	3	18
\.


--
-- TOC entry 3414 (class 0 OID 16402)
-- Dependencies: 220
-- Data for Name: Menus; Type: TABLE DATA; Schema: public; Owner: useradmin
--

COPY public."Menus" ("Name", "Description", "MenuId", "UserId") FROM stdin;
La Vita è Bella	Indulge in the rich flavors of traditional Italian cuisine at "La Vita è Bella." Our menu features homemade pasta dishes, wood-fired pizzas, and fresh seafood options. Start with one of our appetizers, like bruschetta or arancini, before moving on to a classic dish like spaghetti carbonara or chicken parmesan. Finish with a sweet treat, like tiramisu or panna cotta, and wash it all down with a glass of wine from our extensive wine list. Buon appetito!	1	3
Sapore d'Italia	Discover the true taste of Italy at "Sapore d'Italia." Our menu offers a variety of authentic dishes, made with only the freshest ingredients. Begin your meal with a selection of antipasti, such as prosciutto and melon or fried mozzarella. Then, enjoy one of our homemade pasta dishes, like fettuccine alfredo or spaghetti alla puttanesca. For main course, our menu offers a range of options, from classic meat dishes such as Ossobuco alla Milanese or Saltimbocca alla Romana to fresh fish dishes such as Grilled Swordfish or Spaghetti alle Vongole. Finish with a sweet touch, like tiramisu or cannoli, and enjoy a cappuccino or espresso to complete your experience. Buon appetito!	2	3
Il Gusto della Tradizione	Step into the world of authentic Italian cuisine with "Il Gusto della Tradizione". Our menu features classic dishes passed down through generations, prepared with the freshest and highest quality ingredients. Start with a traditional antipasto platter, featuring cured meats, marinated vegetables, and cheeses. Move on to one of our homemade pasta dishes, like lasagna alla bolognese or pappardelle con ragu di cinghiale. For the main course, try one of our specialties like a wood-fired pizza or a hearty Ossobuco, a traditional slow-cooked veal shank served with creamy risotto. Finish with a classic dessert like tiramisu or panna cotta. Savor the flavors of Italy with a glass of wine from our carefully curated wine list. Buon appetito!	3	3
\.


--
-- TOC entry 3417 (class 0 OID 16409)
-- Dependencies: 223
-- Data for Name: Ratings; Type: TABLE DATA; Schema: public; Owner: useradmin
--

COPY public."Ratings" ("Date", "Comment", "Score", "ReviewerName", "RatingId", "UserId") FROM stdin;
\.


--
-- TOC entry 3420 (class 0 OID 16416)
-- Dependencies: 226
-- Data for Name: ReservationDish; Type: TABLE DATA; Schema: public; Owner: useradmin
--

COPY public."ReservationDish" ("ReservationDishId", "ReservationId", "DishId") FROM stdin;
\.


--
-- TOC entry 3424 (class 0 OID 16422)
-- Dependencies: 230
-- Data for Name: Reservations; Type: TABLE DATA; Schema: public; Owner: useradmin
--

COPY public."Reservations" ("Date", "Address", "PhoneNumber", "State", "Comments", "TotalPrice", "ReservationId", "UserId", "MenuId", "NbPersons") FROM stdin;
\.


--
-- TOC entry 3427 (class 0 OID 16429)
-- Dependencies: 233
-- Data for Name: Roles; Type: TABLE DATA; Schema: public; Owner: useradmin
--

COPY public."Roles" ("Name", "RoleId") FROM stdin;
User	1
Cook	2
\.


--
-- TOC entry 3429 (class 0 OID 16435)
-- Dependencies: 235
-- Data for Name: Users; Type: TABLE DATA; Schema: public; Owner: useradmin
--

COPY public."Users" ("Lastname", "Firstname", "Age", "Email", "Active", "Description", "UserId", "RoleId", "Password") FROM stdin;
Garcia	Jackson	21	gjackson@hotmail.edu	t		1	1	$2y$10$WoYmaWppu5b1SfK1tT.r8elQIcg9ryKV5UyotWOCb.JihlgTVLhYW
Ratliff	Perry	33	ratliff-perry@hotmail.ca	t		2	1	$2y$10$WoYmaWppu5b1SfK1tT.r8elQIcg9ryKV5UyotWOCb.JihlgTVLhYW
Robinson	Sebastian	21	sebastianrobinson4540@aol.couk	t		3	2	$2y$10$WoYmaWppu5b1SfK1tT.r8elQIcg9ryKV5UyotWOCb.JihlgTVLhYW
Justice	Duncan	25	j.duncan@outlook.net	t		4	2	$2y$10$WoYmaWppu5b1SfK1tT.r8elQIcg9ryKV5UyotWOCb.JihlgTVLhYW
Morse	Damian	35	morse-damian8165@protonmail.ca	t		5	1	$2y$10$WoYmaWppu5b1SfK1tT.r8elQIcg9ryKV5UyotWOCb.JihlgTVLhYW
Goodman	Nero	20	n_goodman@aol.com	t		6	1	$2y$10$WoYmaWppu5b1SfK1tT.r8elQIcg9ryKV5UyotWOCb.JihlgTVLhYW
Church	Marvin	20	c.marvin@protonmail.com	t		7	2	$2y$10$WoYmaWppu5b1SfK1tT.r8elQIcg9ryKV5UyotWOCb.JihlgTVLhYW
Hammond	Tad	20	h.tad@google.edu	t		8	2	$2y$10$WoYmaWppu5b1SfK1tT.r8elQIcg9ryKV5UyotWOCb.JihlgTVLhYW
Rocha	Ralph	20	r_rocha1003@hotmail.com	t		9	1	$2y$10$WoYmaWppu5b1SfK1tT.r8elQIcg9ryKV5UyotWOCb.JihlgTVLhYW
Trevino	Wade	22	trevinowade2200@protonmail.net	t		10	1	$2y$10$WoYmaWppu5b1SfK1tT.r8elQIcg9ryKV5UyotWOCb.JihlgTVLhYW
Marks	Kaseem	20	k.marks3538@icloud.couk	t		11	2	$2y$10$WoYmaWppu5b1SfK1tT.r8elQIcg9ryKV5UyotWOCb.JihlgTVLhYW
Hancock	Kane	22	k.hancock4192@yahoo.edu	t		12	2	$2y$10$WoYmaWppu5b1SfK1tT.r8elQIcg9ryKV5UyotWOCb.JihlgTVLhYW
Vega	Price	29	v.price@google.couk	t		13	1	$2y$10$WoYmaWppu5b1SfK1tT.r8elQIcg9ryKV5UyotWOCb.JihlgTVLhYW
Tucker	Chancellor	29	ctucker@hotmail.edu	t		14	1	$2y$10$WoYmaWppu5b1SfK1tT.r8elQIcg9ryKV5UyotWOCb.JihlgTVLhYW
Odonnell	Nasim	27	n_odonnell@protonmail.couk	t		15	2	$2y$10$WoYmaWppu5b1SfK1tT.r8elQIcg9ryKV5UyotWOCb.JihlgTVLhYW
Livingston	Abraham	31	alivingston@yahoo.com	t		16	2	$2y$10$WoYmaWppu5b1SfK1tT.r8elQIcg9ryKV5UyotWOCb.JihlgTVLhYW
Jacobson	Ezekiel	22	e-jacobson@hotmail.edu	t		17	1	$2y$10$WoYmaWppu5b1SfK1tT.r8elQIcg9ryKV5UyotWOCb.JihlgTVLhYW
Clay	Victor	22	victor.clay@aol.couk	t		18	1	$2y$10$WoYmaWppu5b1SfK1tT.r8elQIcg9ryKV5UyotWOCb.JihlgTVLhYW
Smith	Macon	31	macon-smith@aol.edu	t		19	2	$2y$10$WoYmaWppu5b1SfK1tT.r8elQIcg9ryKV5UyotWOCb.JihlgTVLhYW
Watson	Denton	33	watson_denton5202@icloud.net	t		20	2	$2y$10$WoYmaWppu5b1SfK1tT.r8elQIcg9ryKV5UyotWOCb.JihlgTVLhYW
Collier	Ethan	22	e-collier3655@aol.net	t		21	1	$2y$10$WoYmaWppu5b1SfK1tT.r8elQIcg9ryKV5UyotWOCb.JihlgTVLhYW
Mcleod	Matthew	24	m-mcleod9600@hotmail.edu	t		22	1	$2y$10$WoYmaWppu5b1SfK1tT.r8elQIcg9ryKV5UyotWOCb.JihlgTVLhYW
Cervantes	Harrison	34	hcervantes@protonmail.net	t		23	2	$2y$10$WoYmaWppu5b1SfK1tT.r8elQIcg9ryKV5UyotWOCb.JihlgTVLhYW
Lloyd	Quinn	27	l_quinn3909@aol.com	t		24	2	$2y$10$WoYmaWppu5b1SfK1tT.r8elQIcg9ryKV5UyotWOCb.JihlgTVLhYW
Odom	Orlando	28	oodom4287@icloud.org	t		25	1	$2y$10$WoYmaWppu5b1SfK1tT.r8elQIcg9ryKV5UyotWOCb.JihlgTVLhYW
Cummings	Axel	21	a-cummings7746@yahoo.org	t		26	1	$2y$10$WoYmaWppu5b1SfK1tT.r8elQIcg9ryKV5UyotWOCb.JihlgTVLhYW
Sawyer	Jamal	29	jsawyer9661@aol.ca	t		27	2	$2y$10$WoYmaWppu5b1SfK1tT.r8elQIcg9ryKV5UyotWOCb.JihlgTVLhYW
Townsend	Howard	33	t-howard@yahoo.ca	t		28	2	$2y$10$WoYmaWppu5b1SfK1tT.r8elQIcg9ryKV5UyotWOCb.JihlgTVLhYW
Mcintyre	Acton	29	acton.mcintyre@outlook.edu	t		29	1	$2y$10$WoYmaWppu5b1SfK1tT.r8elQIcg9ryKV5UyotWOCb.JihlgTVLhYW
Carlson	Brendan	34	carlsonbrendan5465@protonmail.com	t		30	1	$2y$10$WoYmaWppu5b1SfK1tT.r8elQIcg9ryKV5UyotWOCb.JihlgTVLhYW
\.


--
-- TOC entry 3455 (class 0 OID 0)
-- Dependencies: 215
-- Name: Dishes_DishId_seq; Type: SEQUENCE SET; Schema: public; Owner: useradmin
--

SELECT pg_catalog.setval('public."Dishes_DishId_seq"', 27, true);


--
-- TOC entry 3456 (class 0 OID 0)
-- Dependencies: 217
-- Name: MenuDish_DishId_seq; Type: SEQUENCE SET; Schema: public; Owner: useradmin
--

SELECT pg_catalog.setval('public."MenuDish_DishId_seq"', 1, false);


--
-- TOC entry 3457 (class 0 OID 0)
-- Dependencies: 218
-- Name: MenuDish_MenuDishId_seq; Type: SEQUENCE SET; Schema: public; Owner: useradmin
--

SELECT pg_catalog.setval('public."MenuDish_MenuDishId_seq"', 27, true);


--
-- TOC entry 3458 (class 0 OID 0)
-- Dependencies: 219
-- Name: MenuDish_MenuId_seq; Type: SEQUENCE SET; Schema: public; Owner: useradmin
--

SELECT pg_catalog.setval('public."MenuDish_MenuId_seq"', 1, false);


--
-- TOC entry 3459 (class 0 OID 0)
-- Dependencies: 221
-- Name: Menus_MenuId_seq; Type: SEQUENCE SET; Schema: public; Owner: useradmin
--

SELECT pg_catalog.setval('public."Menus_MenuId_seq"', 3, true);


--
-- TOC entry 3460 (class 0 OID 0)
-- Dependencies: 222
-- Name: Menus_UserId_seq; Type: SEQUENCE SET; Schema: public; Owner: useradmin
--

SELECT pg_catalog.setval('public."Menus_UserId_seq"', 1, true);


--
-- TOC entry 3461 (class 0 OID 0)
-- Dependencies: 224
-- Name: Ratings_RatingId_seq; Type: SEQUENCE SET; Schema: public; Owner: useradmin
--

SELECT pg_catalog.setval('public."Ratings_RatingId_seq"', 1, false);


--
-- TOC entry 3462 (class 0 OID 0)
-- Dependencies: 225
-- Name: Ratings_UserId_seq; Type: SEQUENCE SET; Schema: public; Owner: useradmin
--

SELECT pg_catalog.setval('public."Ratings_UserId_seq"', 1, false);


--
-- TOC entry 3463 (class 0 OID 0)
-- Dependencies: 227
-- Name: ReservationDish_DishId_seq; Type: SEQUENCE SET; Schema: public; Owner: useradmin
--

SELECT pg_catalog.setval('public."ReservationDish_DishId_seq"', 1, false);


--
-- TOC entry 3464 (class 0 OID 0)
-- Dependencies: 228
-- Name: ReservationDish_ReservationDishId_seq; Type: SEQUENCE SET; Schema: public; Owner: useradmin
--

SELECT pg_catalog.setval('public."ReservationDish_ReservationDishId_seq"', 1, false);


--
-- TOC entry 3465 (class 0 OID 0)
-- Dependencies: 229
-- Name: ReservationDish_ReservationId_seq; Type: SEQUENCE SET; Schema: public; Owner: useradmin
--

SELECT pg_catalog.setval('public."ReservationDish_ReservationId_seq"', 1, false);


--
-- TOC entry 3466 (class 0 OID 0)
-- Dependencies: 238
-- Name: Reservations_MenuId_seq; Type: SEQUENCE SET; Schema: public; Owner: useradmin
--

SELECT pg_catalog.setval('public."Reservations_MenuId_seq"', 1, false);


--
-- TOC entry 3467 (class 0 OID 0)
-- Dependencies: 231
-- Name: Reservations_ReservationId_seq; Type: SEQUENCE SET; Schema: public; Owner: useradmin
--

SELECT pg_catalog.setval('public."Reservations_ReservationId_seq"', 1, false);


--
-- TOC entry 3468 (class 0 OID 0)
-- Dependencies: 232
-- Name: Reservations_UserId_seq; Type: SEQUENCE SET; Schema: public; Owner: useradmin
--

SELECT pg_catalog.setval('public."Reservations_UserId_seq"', 1, false);


--
-- TOC entry 3469 (class 0 OID 0)
-- Dependencies: 234
-- Name: Roles_RoleId_seq; Type: SEQUENCE SET; Schema: public; Owner: useradmin
--

SELECT pg_catalog.setval('public."Roles_RoleId_seq"', 2, true);


--
-- TOC entry 3470 (class 0 OID 0)
-- Dependencies: 236
-- Name: Users_RoleId_seq; Type: SEQUENCE SET; Schema: public; Owner: useradmin
--

SELECT pg_catalog.setval('public."Users_RoleId_seq"', 1, false);


--
-- TOC entry 3471 (class 0 OID 0)
-- Dependencies: 237
-- Name: Users_UserId_seq; Type: SEQUENCE SET; Schema: public; Owner: useradmin
--

SELECT pg_catalog.setval('public."Users_UserId_seq"', 30, true);


--
-- TOC entry 3240 (class 2606 OID 16459)
-- Name: Dishes PK_DishId; Type: CONSTRAINT; Schema: public; Owner: useradmin
--

ALTER TABLE ONLY public."Dishes"
    ADD CONSTRAINT "PK_DishId" PRIMARY KEY ("DishId");


--
-- TOC entry 3242 (class 2606 OID 16461)
-- Name: MenuDish PK_MenuDishId; Type: CONSTRAINT; Schema: public; Owner: useradmin
--

ALTER TABLE ONLY public."MenuDish"
    ADD CONSTRAINT "PK_MenuDishId" PRIMARY KEY ("MenuDishId");


--
-- TOC entry 3244 (class 2606 OID 16463)
-- Name: Menus PK_MenuId; Type: CONSTRAINT; Schema: public; Owner: useradmin
--

ALTER TABLE ONLY public."Menus"
    ADD CONSTRAINT "PK_MenuId" PRIMARY KEY ("MenuId");


--
-- TOC entry 3246 (class 2606 OID 16465)
-- Name: Ratings PK_RatingId; Type: CONSTRAINT; Schema: public; Owner: useradmin
--

ALTER TABLE ONLY public."Ratings"
    ADD CONSTRAINT "PK_RatingId" PRIMARY KEY ("RatingId");


--
-- TOC entry 3248 (class 2606 OID 16467)
-- Name: ReservationDish PK_ReservationDishId; Type: CONSTRAINT; Schema: public; Owner: useradmin
--

ALTER TABLE ONLY public."ReservationDish"
    ADD CONSTRAINT "PK_ReservationDishId" PRIMARY KEY ("ReservationDishId");


--
-- TOC entry 3250 (class 2606 OID 16469)
-- Name: Reservations PK_ReservationId; Type: CONSTRAINT; Schema: public; Owner: useradmin
--

ALTER TABLE ONLY public."Reservations"
    ADD CONSTRAINT "PK_ReservationId" PRIMARY KEY ("ReservationId");


--
-- TOC entry 3252 (class 2606 OID 16471)
-- Name: Roles PK_RoleId; Type: CONSTRAINT; Schema: public; Owner: useradmin
--

ALTER TABLE ONLY public."Roles"
    ADD CONSTRAINT "PK_RoleId" PRIMARY KEY ("RoleId");


--
-- TOC entry 3254 (class 2606 OID 16473)
-- Name: Users PK_UserId; Type: CONSTRAINT; Schema: public; Owner: useradmin
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "PK_UserId" PRIMARY KEY ("UserId");


--
-- TOC entry 3256 (class 2606 OID 16529)
-- Name: Users U_email; Type: CONSTRAINT; Schema: public; Owner: useradmin
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "U_email" UNIQUE ("Email");


--
-- TOC entry 3257 (class 2606 OID 16474)
-- Name: MenuDish FK_DishId; Type: FK CONSTRAINT; Schema: public; Owner: useradmin
--

ALTER TABLE ONLY public."MenuDish"
    ADD CONSTRAINT "FK_DishId" FOREIGN KEY ("DishId") REFERENCES public."Dishes"("DishId") NOT VALID;


--
-- TOC entry 3261 (class 2606 OID 16479)
-- Name: ReservationDish FK_DishId; Type: FK CONSTRAINT; Schema: public; Owner: useradmin
--

ALTER TABLE ONLY public."ReservationDish"
    ADD CONSTRAINT "FK_DishId" FOREIGN KEY ("DishId") REFERENCES public."Dishes"("DishId") NOT VALID;


--
-- TOC entry 3258 (class 2606 OID 16484)
-- Name: MenuDish FK_MenuId; Type: FK CONSTRAINT; Schema: public; Owner: useradmin
--

ALTER TABLE ONLY public."MenuDish"
    ADD CONSTRAINT "FK_MenuId" FOREIGN KEY ("MenuId") REFERENCES public."Menus"("MenuId") NOT VALID;


--
-- TOC entry 3263 (class 2606 OID 16523)
-- Name: Reservations FK_MenuId; Type: FK CONSTRAINT; Schema: public; Owner: useradmin
--

ALTER TABLE ONLY public."Reservations"
    ADD CONSTRAINT "FK_MenuId" FOREIGN KEY ("MenuId") REFERENCES public."Menus"("MenuId") NOT VALID;


--
-- TOC entry 3262 (class 2606 OID 16489)
-- Name: ReservationDish FK_ReservationId; Type: FK CONSTRAINT; Schema: public; Owner: useradmin
--

ALTER TABLE ONLY public."ReservationDish"
    ADD CONSTRAINT "FK_ReservationId" FOREIGN KEY ("ReservationId") REFERENCES public."Reservations"("ReservationId") NOT VALID;


--
-- TOC entry 3265 (class 2606 OID 16494)
-- Name: Users FK_RoleId; Type: FK CONSTRAINT; Schema: public; Owner: useradmin
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "FK_RoleId" FOREIGN KEY ("RoleId") REFERENCES public."Roles"("RoleId") NOT VALID;


--
-- TOC entry 3259 (class 2606 OID 16499)
-- Name: Menus FK_UserId; Type: FK CONSTRAINT; Schema: public; Owner: useradmin
--

ALTER TABLE ONLY public."Menus"
    ADD CONSTRAINT "FK_UserId" FOREIGN KEY ("UserId") REFERENCES public."Users"("UserId") NOT VALID;


--
-- TOC entry 3260 (class 2606 OID 16504)
-- Name: Ratings FK_UserId; Type: FK CONSTRAINT; Schema: public; Owner: useradmin
--

ALTER TABLE ONLY public."Ratings"
    ADD CONSTRAINT "FK_UserId" FOREIGN KEY ("UserId") REFERENCES public."Users"("UserId") NOT VALID;


--
-- TOC entry 3264 (class 2606 OID 16509)
-- Name: Reservations FK_UserId; Type: FK CONSTRAINT; Schema: public; Owner: useradmin
--

ALTER TABLE ONLY public."Reservations"
    ADD CONSTRAINT "FK_UserId" FOREIGN KEY ("UserId") REFERENCES public."Users"("UserId") NOT VALID;


-- Completed on 2023-02-03 20:44:34

--
-- PostgreSQL database dump complete
--

