
CREATE TABLE IF NOT EXISTS public.users
(
    id integer NOT NULL DEFAULT nextval('users_id_seq'::regclass),
    name character varying(255) COLLATE pg_catalog."default" DEFAULT NULL::character varying,
    email character varying(255) COLLATE pg_catalog."default" DEFAULT NULL::character varying,
    user_name character varying(255) COLLATE pg_catalog."default" DEFAULT NULL::character varying,
    avatar character varying(255) COLLATE pg_catalog."default" DEFAULT NULL::character varying,
    topic_fav character varying(255) COLLATE pg_catalog."default" DEFAULT NULL::character varying,
    password character varying(255) COLLATE pg_catalog."default" DEFAULT NULL::character varying,
    CONSTRAINT users_pkey PRIMARY KEY (id)
)

CREATE TABLE IF NOT EXISTS public.review
(
    id integer NOT NULL DEFAULT nextval('review_id_seq'::regclass),
    list_date timestamp without time zone[],
    date_created timestamp without time zone,
    CONSTRAINT review_pkey PRIMARY KEY (id)
)

CREATE TABLE IF NOT EXISTS public.note_detail
(
    id integer NOT NULL DEFAULT nextval('note_detail_id_seq'::regclass),
    date_created timestamp without time zone,
    user_id integer NOT NULL,
    note_id integer NOT NULL,
    level_prioritize integer,
    category_id integer NOT NULL,
    review_id integer NOT NULL,
    CONSTRAINT note_detail_pkey PRIMARY KEY (id),
    CONSTRAINT fk_category_id FOREIGN KEY (category_id)
        REFERENCES public.category_note (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT fk_note FOREIGN KEY (note_id)
        REFERENCES public.note (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT fk_review FOREIGN KEY (review_id)
        REFERENCES public.review (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT fk_user FOREIGN KEY (user_id)
        REFERENCES public.users (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

CREATE TABLE IF NOT EXISTS public.note
(
    id integer NOT NULL DEFAULT nextval('note_id_seq'::regclass),
    title character varying(255) COLLATE pg_catalog."default" DEFAULT NULL::character varying,
    content_note text COLLATE pg_catalog."default",
    CONSTRAINT note_pkey PRIMARY KEY (id)
)

CREATE TABLE IF NOT EXISTS public.category_note
(
    id integer NOT NULL DEFAULT nextval('category_note_id_seq'::regclass),
    topic character varying(50) COLLATE pg_catalog."default",
    user_id integer,
    CONSTRAINT category_note_pkey PRIMARY KEY (id),
    CONSTRAINT fk_user_id FOREIGN KEY (user_id)
        REFERENCES public.users (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

