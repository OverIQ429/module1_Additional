
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
VALUES ('e60221cb-eb25-48fc-8666-05f697f7872d', 'jimmy@mail.ru', 'Ivan Ivanov', '2006-05-15');

INSERT INTO users (id, email, fio, registration_date)
VALUES ('53b022df-89a1-4d8a-95f3-04aa96de517b', 'billy@mail.ru', 'Anna Smirnova', '2006-08-20');

INSERT INTO posts (id, publication_date, text, "user")
VALUES ('1aa1354a-8889-4e67-89c5-0afa0cdedfed', '2025-01-01', 'random_text', 'e60221cb-eb25-48fc-8666-05f697f7872d');

INSERT INTO posts (id, publication_date, text, "user")
VALUES ('d019a1d6-1bcc-47cc-8e3f-54c2603cd73c', '2025-01-02', 'random_string', 'e60221cb-eb25-48fc-8666-05f697f7872d');

INSERT INTO likes (id, publication_date, owner_id, user_id)
VALUES ('2dfdda8d-af22-4317-beae-a4897ae59cec', '2024-05-27', '1aa1354a-8889-4e67-89c5-0afa0cdedfed', 'e60221cb-eb25-48fc-8666-05f697f7872d');

INSERT INTO likes (id, publication_date, owner_id, user_id)
VALUES ('7ea5aac7-e217-4159-9c13-2e72d5c0014b', '2024-11-09', '1aa1354a-8889-4e67-89c5-0afa0cdedfed', 'e60221cb-eb25-48fc-8666-05f697f7872d');

INSERT INTO likes (id, publication_date, owner_id, user_id)
VALUES ('db6ca0fd-1ca3-4a08-8120-9a50d72638df', '2024-09-07', '1aa1354a-8889-4e67-89c5-0afa0cdedfed', '53b022df-89a1-4d8a-95f3-04aa96de517b');

INSERT INTO likes (id, publication_date, owner_id, user_id)
VALUES ('3741fc6c-b666-4de3-9de8-3087759ae3e1', '2024-11-07', '1aa1354a-8889-4e67-89c5-0afa0cdedfed', 'e60221cb-eb25-48fc-8666-05f697f7872d');

INSERT INTO likes (id, publication_date, owner_id, user_id)
VALUES ('dfaf4c6a-a3de-4412-9659-43cd164a2280', '2024-05-06', '1aa1354a-8889-4e67-89c5-0afa0cdedfed', 'e60221cb-eb25-48fc-8666-05f697f7872d');

INSERT INTO likes (id, publication_date, owner_id, user_id)
VALUES ('a303d94a-8c68-4275-b1f9-409911edae08', '2025-02-24', 'd019a1d6-1bcc-47cc-8e3f-54c2603cd73c', '53b022df-89a1-4d8a-95f3-04aa96de517b');

INSERT INTO likes (id, publication_date, owner_id, user_id)
VALUES ('442dde4f-e582-47f3-b4ee-93b18745779a', '2024-05-14', '1aa1354a-8889-4e67-89c5-0afa0cdedfed', '53b022df-89a1-4d8a-95f3-04aa96de517b');

INSERT INTO likes (id, publication_date, owner_id, user_id)
VALUES ('05d65bf0-c1d5-48d1-b1fc-055f7a534b8f', '2025-01-28', 'd019a1d6-1bcc-47cc-8e3f-54c2603cd73c', '53b022df-89a1-4d8a-95f3-04aa96de517b');

INSERT INTO likes (id, publication_date, owner_id, user_id)
VALUES ('f70e63ff-134f-4cfa-b4aa-1def0f2a1dc4', '2025-01-08', 'd019a1d6-1bcc-47cc-8e3f-54c2603cd73c', '53b022df-89a1-4d8a-95f3-04aa96de517b');

INSERT INTO likes (id, publication_date, owner_id, user_id)
VALUES ('eaed09b5-2362-4bf9-ae5d-bc4aa1005f98', '2025-02-26', '1aa1354a-8889-4e67-89c5-0afa0cdedfed', 'e60221cb-eb25-48fc-8666-05f697f7872d');
