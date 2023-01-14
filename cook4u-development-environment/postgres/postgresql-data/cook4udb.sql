--
-- PostgreSQL database dump
--

-- Dumped from database version 15.1 (Debian 15.1-1.pgdg110+1)
-- Dumped by pg_dump version 15.1

-- Started on 2023-01-13 18:46:25

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
-- TOC entry 3412 (class 0 OID 0)
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
-- TOC entry 3413 (class 0 OID 0)
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
-- TOC entry 3414 (class 0 OID 0)
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
-- TOC entry 3415 (class 0 OID 0)
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
-- TOC entry 3416 (class 0 OID 0)
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
-- TOC entry 3417 (class 0 OID 0)
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
-- TOC entry 3418 (class 0 OID 0)
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
-- TOC entry 3419 (class 0 OID 0)
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
-- TOC entry 3420 (class 0 OID 0)
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
-- TOC entry 3421 (class 0 OID 0)
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
-- TOC entry 3422 (class 0 OID 0)
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
    "MenuId" integer NOT NULL
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
-- TOC entry 3423 (class 0 OID 0)
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
-- TOC entry 3424 (class 0 OID 0)
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
-- TOC entry 3425 (class 0 OID 0)
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
-- TOC entry 3426 (class 0 OID 0)
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
-- TOC entry 3427 (class 0 OID 0)
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
-- TOC entry 3428 (class 0 OID 0)
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
-- TOC entry 3235 (class 2604 OID 16455)
-- Name: Roles RoleId; Type: DEFAULT; Schema: public; Owner: useradmin
--

ALTER TABLE ONLY public."Roles" ALTER COLUMN "RoleId" SET DEFAULT nextval('public."Roles_RoleId_seq"'::regclass);


--
-- TOC entry 3236 (class 2604 OID 16456)
-- Name: Users UserId; Type: DEFAULT; Schema: public; Owner: useradmin
--

ALTER TABLE ONLY public."Users" ALTER COLUMN "UserId" SET DEFAULT nextval('public."Users_UserId_seq"'::regclass);


--
-- TOC entry 3237 (class 2604 OID 16457)
-- Name: Users RoleId; Type: DEFAULT; Schema: public; Owner: useradmin
--

ALTER TABLE ONLY public."Users" ALTER COLUMN "RoleId" SET DEFAULT nextval('public."Users_RoleId_seq"'::regclass);


--
-- TOC entry 3239 (class 2606 OID 16459)
-- Name: Dishes PK_DishId; Type: CONSTRAINT; Schema: public; Owner: useradmin
--

ALTER TABLE ONLY public."Dishes"
    ADD CONSTRAINT "PK_DishId" PRIMARY KEY ("DishId");


--
-- TOC entry 3241 (class 2606 OID 16461)
-- Name: MenuDish PK_MenuDishId; Type: CONSTRAINT; Schema: public; Owner: useradmin
--

ALTER TABLE ONLY public."MenuDish"
    ADD CONSTRAINT "PK_MenuDishId" PRIMARY KEY ("MenuDishId");


--
-- TOC entry 3243 (class 2606 OID 16463)
-- Name: Menus PK_MenuId; Type: CONSTRAINT; Schema: public; Owner: useradmin
--

ALTER TABLE ONLY public."Menus"
    ADD CONSTRAINT "PK_MenuId" PRIMARY KEY ("MenuId");


--
-- TOC entry 3245 (class 2606 OID 16465)
-- Name: Ratings PK_RatingId; Type: CONSTRAINT; Schema: public; Owner: useradmin
--

ALTER TABLE ONLY public."Ratings"
    ADD CONSTRAINT "PK_RatingId" PRIMARY KEY ("RatingId");


--
-- TOC entry 3247 (class 2606 OID 16467)
-- Name: ReservationDish PK_ReservationDishId; Type: CONSTRAINT; Schema: public; Owner: useradmin
--

ALTER TABLE ONLY public."ReservationDish"
    ADD CONSTRAINT "PK_ReservationDishId" PRIMARY KEY ("ReservationDishId");


--
-- TOC entry 3249 (class 2606 OID 16469)
-- Name: Reservations PK_ReservationId; Type: CONSTRAINT; Schema: public; Owner: useradmin
--

ALTER TABLE ONLY public."Reservations"
    ADD CONSTRAINT "PK_ReservationId" PRIMARY KEY ("ReservationId");


--
-- TOC entry 3251 (class 2606 OID 16471)
-- Name: Roles PK_RoleId; Type: CONSTRAINT; Schema: public; Owner: useradmin
--

ALTER TABLE ONLY public."Roles"
    ADD CONSTRAINT "PK_RoleId" PRIMARY KEY ("RoleId");


--
-- TOC entry 3253 (class 2606 OID 16473)
-- Name: Users PK_UserId; Type: CONSTRAINT; Schema: public; Owner: useradmin
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "PK_UserId" PRIMARY KEY ("UserId");


--
-- TOC entry 3255 (class 2606 OID 16529)
-- Name: Users U_email; Type: CONSTRAINT; Schema: public; Owner: useradmin
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "U_email" UNIQUE ("Email");


--
-- TOC entry 3256 (class 2606 OID 16474)
-- Name: MenuDish FK_DishId; Type: FK CONSTRAINT; Schema: public; Owner: useradmin
--

ALTER TABLE ONLY public."MenuDish"
    ADD CONSTRAINT "FK_DishId" FOREIGN KEY ("DishId") REFERENCES public."Dishes"("DishId") NOT VALID;


--
-- TOC entry 3260 (class 2606 OID 16479)
-- Name: ReservationDish FK_DishId; Type: FK CONSTRAINT; Schema: public; Owner: useradmin
--

ALTER TABLE ONLY public."ReservationDish"
    ADD CONSTRAINT "FK_DishId" FOREIGN KEY ("DishId") REFERENCES public."Dishes"("DishId") NOT VALID;


--
-- TOC entry 3257 (class 2606 OID 16484)
-- Name: MenuDish FK_MenuId; Type: FK CONSTRAINT; Schema: public; Owner: useradmin
--

ALTER TABLE ONLY public."MenuDish"
    ADD CONSTRAINT "FK_MenuId" FOREIGN KEY ("MenuId") REFERENCES public."Menus"("MenuId") NOT VALID;


--
-- TOC entry 3262 (class 2606 OID 16523)
-- Name: Reservations FK_MenuId; Type: FK CONSTRAINT; Schema: public; Owner: useradmin
--

ALTER TABLE ONLY public."Reservations"
    ADD CONSTRAINT "FK_MenuId" FOREIGN KEY ("MenuId") REFERENCES public."Menus"("MenuId") NOT VALID;


--
-- TOC entry 3261 (class 2606 OID 16489)
-- Name: ReservationDish FK_ReservationId; Type: FK CONSTRAINT; Schema: public; Owner: useradmin
--

ALTER TABLE ONLY public."ReservationDish"
    ADD CONSTRAINT "FK_ReservationId" FOREIGN KEY ("ReservationId") REFERENCES public."Reservations"("ReservationId") NOT VALID;


--
-- TOC entry 3264 (class 2606 OID 16494)
-- Name: Users FK_RoleId; Type: FK CONSTRAINT; Schema: public; Owner: useradmin
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "FK_RoleId" FOREIGN KEY ("RoleId") REFERENCES public."Roles"("RoleId") NOT VALID;


--
-- TOC entry 3258 (class 2606 OID 16499)
-- Name: Menus FK_UserId; Type: FK CONSTRAINT; Schema: public; Owner: useradmin
--

ALTER TABLE ONLY public."Menus"
    ADD CONSTRAINT "FK_UserId" FOREIGN KEY ("UserId") REFERENCES public."Users"("UserId") NOT VALID;


--
-- TOC entry 3259 (class 2606 OID 16504)
-- Name: Ratings FK_UserId; Type: FK CONSTRAINT; Schema: public; Owner: useradmin
--

ALTER TABLE ONLY public."Ratings"
    ADD CONSTRAINT "FK_UserId" FOREIGN KEY ("UserId") REFERENCES public."Users"("UserId") NOT VALID;


--
-- TOC entry 3263 (class 2606 OID 16509)
-- Name: Reservations FK_UserId; Type: FK CONSTRAINT; Schema: public; Owner: useradmin
--

ALTER TABLE ONLY public."Reservations"
    ADD CONSTRAINT "FK_UserId" FOREIGN KEY ("UserId") REFERENCES public."Users"("UserId") NOT VALID;


-- Completed on 2023-01-13 18:46:26

--
-- PostgreSQL database dump complete
--

