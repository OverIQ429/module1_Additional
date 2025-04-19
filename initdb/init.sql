
CREATE TABLE IF NOT EXISTS users (
    id uuid NOT NULL,
    email character varying(255) COLLATE pg_catalog."default",
    fio character varying(255) COLLATE pg_catalog."default",
    registration_date timestamp(6) without time zone,
    CONSTRAINT users_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS posts (
    id character varying(255) COLLATE pg_catalog."default" NOT NULL,
    publication_date timestamp(6) without time zone,
    text character varying(255) COLLATE pg_catalog."default",
    "user" uuid NOT NULL,
    CONSTRAINT posts_pkey PRIMARY KEY (id),
    CONSTRAINT fkrgj3cqthk0cqd8lsnuy5qeikg FOREIGN KEY ("user")
        REFERENCES public.users (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
);

CREATE TABLE IF NOT EXISTS likes (
    id uuid NOT NULL,
    publication_date timestamp(6) without time zone,
    owner_id character varying(255) COLLATE pg_catalog."default" NOT NULL,
    user_id uuid NOT NULL,
    CONSTRAINT likes_pkey PRIMARY KEY (id),
    CONSTRAINT fkns0jk5hjuvu0adxcqe28lfngq FOREIGN KEY (owner_id)
        REFERENCES public.posts (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT fknvx9seeqqyy71bij291pwiwrg FOREIGN KEY (user_id)
        REFERENCES public.users (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
);

INSERT INTO users (id, email, fio, registration_date)
VALUES ('df0de691-3a01-491b-a280-5f921df75b02', 'jimmy@mail.ru', 'Ivan Ivanov', '2006-05-15');

INSERT INTO users (id, email, fio, registration_date)
VALUES ('ffc7b183-bdaa-4274-aa11-9b08ccfbad3e', 'billy@mail.ru', 'Anna Smirnova', '2006-08-20');

INSERT INTO posts (id, publication_date, text, "user")
VALUES ('1e2d996e-0a8c-4311-a5e8-a37477cc4c90', '2025-01-01', 'random_text', 'df0de691-3a01-491b-a280-5f921df75b02');

INSERT INTO posts (id, publication_date, text, "user")
VALUES ('15d1af8b-5efe-4493-8ef6-e4c293d56e99', '2025-01-02', 'random_string', 'df0de691-3a01-491b-a280-5f921df75b02');

INSERT INTO likes (id, publication_date, owner_id, user_id)
VALUES ('df163539-45ed-43b3-b6fc-3aa92717904c', '2024-09-24', '1e2d996e-0a8c-4311-a5e8-a37477cc4c90', 'ffc7b183-bdaa-4274-aa11-9b08ccfbad3e');

INSERT INTO likes (id, publication_date, owner_id, user_id)
VALUES ('dabdb0eb-6149-401b-b46e-a59720f8a6ee', '2025-01-19', '1e2d996e-0a8c-4311-a5e8-a37477cc4c90', 'df0de691-3a01-491b-a280-5f921df75b02');

INSERT INTO likes (id, publication_date, owner_id, user_id)
VALUES ('f76679a5-76c5-4435-a08c-ace4c82be22c', '2024-07-30', '1e2d996e-0a8c-4311-a5e8-a37477cc4c90', 'ffc7b183-bdaa-4274-aa11-9b08ccfbad3e');

INSERT INTO likes (id, publication_date, owner_id, user_id)
VALUES ('8cbaea4a-9019-4e57-bee9-ea085fc88ed8', '2024-05-09', '1e2d996e-0a8c-4311-a5e8-a37477cc4c90', 'ffc7b183-bdaa-4274-aa11-9b08ccfbad3e');

INSERT INTO likes (id, publication_date, owner_id, user_id)
VALUES ('70a27cef-2cd7-4d41-89bb-e8eeceb88b8f', '2024-11-26', '1e2d996e-0a8c-4311-a5e8-a37477cc4c90', 'ffc7b183-bdaa-4274-aa11-9b08ccfbad3e');

INSERT INTO likes (id, publication_date, owner_id, user_id)
VALUES ('3097b7e4-f2c2-405a-935e-375792ca1afd', '2024-08-03', '15d1af8b-5efe-4493-8ef6-e4c293d56e99', 'ffc7b183-bdaa-4274-aa11-9b08ccfbad3e');

INSERT INTO likes (id, publication_date, owner_id, user_id)
VALUES ('7b374d1a-934e-4c82-a996-7645ca91a935', '2024-12-01', '1e2d996e-0a8c-4311-a5e8-a37477cc4c90', 'df0de691-3a01-491b-a280-5f921df75b02');

INSERT INTO likes (id, publication_date, owner_id, user_id)
VALUES ('380e520a-7eef-49eb-9912-95449df2abd9', '2025-01-01', '15d1af8b-5efe-4493-8ef6-e4c293d56e99', 'ffc7b183-bdaa-4274-aa11-9b08ccfbad3e');

INSERT INTO likes (id, publication_date, owner_id, user_id)
VALUES ('0d7dcb7e-78d6-42b2-b1b0-ce9fdb29b498', '2024-05-27', '15d1af8b-5efe-4493-8ef6-e4c293d56e99', 'df0de691-3a01-491b-a280-5f921df75b02');

INSERT INTO likes (id, publication_date, owner_id, user_id)
VALUES ('569130c7-7c01-4bf3-a7ee-ef62479888f8', '2024-09-23', '15d1af8b-5efe-4493-8ef6-e4c293d56e99', 'df0de691-3a01-491b-a280-5f921df75b02');
