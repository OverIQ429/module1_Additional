
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
VALUES ('1da900a5-e9fb-4632-af7b-d9c906a5bdef', 'jimmy@mail.ru', 'Ivan Ivanov', '2006-05-15');

INSERT INTO users (id, email, fio, registration_date)
VALUES ('665f1a58-3f6e-4762-a93d-70238e11e177', 'billy@mail.ru', 'Anna Smirnova', '2006-08-20');

INSERT INTO posts (id, publication_date, text, "user")
VALUES ('a9c50a8f-ff91-41fa-86d2-24b2afad6105', '2025-01-01', 'random_text', '1da900a5-e9fb-4632-af7b-d9c906a5bdef');

INSERT INTO posts (id, publication_date, text, "user")
VALUES ('5c65bb3a-8812-42a3-a636-15cb2e52dffb', '2025-01-02', 'random_string', '1da900a5-e9fb-4632-af7b-d9c906a5bdef');

INSERT INTO likes (id, publication_date, owner_id, user_id)
VALUES ('edc36ec7-1173-47c3-af84-f2bb00fef64b', '2024-09-06', '5c65bb3a-8812-42a3-a636-15cb2e52dffb', '665f1a58-3f6e-4762-a93d-70238e11e177');

INSERT INTO likes (id, publication_date, owner_id, user_id)
VALUES ('5bc4882a-01f4-4205-9aeb-34d48920e544', '2024-09-26', 'a9c50a8f-ff91-41fa-86d2-24b2afad6105', '665f1a58-3f6e-4762-a93d-70238e11e177');

INSERT INTO likes (id, publication_date, owner_id, user_id)
VALUES ('f1691873-ab3d-41f3-8ab4-7588bb63863a', '2025-02-18', 'a9c50a8f-ff91-41fa-86d2-24b2afad6105', '665f1a58-3f6e-4762-a93d-70238e11e177');

INSERT INTO likes (id, publication_date, owner_id, user_id)
VALUES ('53ddd0ed-5042-43d5-99f4-04e39cedd01f', '2024-05-23', 'a9c50a8f-ff91-41fa-86d2-24b2afad6105', '665f1a58-3f6e-4762-a93d-70238e11e177');

INSERT INTO likes (id, publication_date, owner_id, user_id)
VALUES ('f4aa82d5-74b7-4186-94b9-ccb47779dcab', '2025-02-06', 'a9c50a8f-ff91-41fa-86d2-24b2afad6105', '665f1a58-3f6e-4762-a93d-70238e11e177');

INSERT INTO likes (id, publication_date, owner_id, user_id)
VALUES ('1628fdd0-74ae-40a9-aa5a-8f0ca7329b88', '2024-07-17', 'a9c50a8f-ff91-41fa-86d2-24b2afad6105', '665f1a58-3f6e-4762-a93d-70238e11e177');

INSERT INTO likes (id, publication_date, owner_id, user_id)
VALUES ('60bebc79-9bc6-4f06-8de6-bb431a9c5477', '2024-11-01', 'a9c50a8f-ff91-41fa-86d2-24b2afad6105', '665f1a58-3f6e-4762-a93d-70238e11e177');

INSERT INTO likes (id, publication_date, owner_id, user_id)
VALUES ('3e3a36d3-84d2-4187-a104-c693000ba413', '2024-05-29', 'a9c50a8f-ff91-41fa-86d2-24b2afad6105', '1da900a5-e9fb-4632-af7b-d9c906a5bdef');

INSERT INTO likes (id, publication_date, owner_id, user_id)
VALUES ('e71a1bf3-9e0a-4d33-8520-e4f6a0adf282', '2025-02-19', '5c65bb3a-8812-42a3-a636-15cb2e52dffb', '665f1a58-3f6e-4762-a93d-70238e11e177');

INSERT INTO likes (id, publication_date, owner_id, user_id)
VALUES ('fe0cc6a5-017a-430c-a677-0bdf59d5d3dd', '2024-10-17', 'a9c50a8f-ff91-41fa-86d2-24b2afad6105', '1da900a5-e9fb-4632-af7b-d9c906a5bdef');
