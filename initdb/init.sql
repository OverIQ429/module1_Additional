
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
VALUES ('bab10bfc-5d7d-48ae-a843-eebd5887361b', 'jimmy@mail.ru', 'Ivan Ivanov', '2006-05-15');

INSERT INTO users (id, email, fio, registration_date)
VALUES ('80dbd712-ad8a-47d6-8ebc-c9117ca833a2', 'billy@mail.ru', 'Anna Smirnova', '2006-08-20');

INSERT INTO posts (id, publication_date, text, "user")
VALUES ('60143f71-89f1-4680-9a9a-42d10ccdc09b', '2025-01-01', 'random_text', 'bab10bfc-5d7d-48ae-a843-eebd5887361b');

INSERT INTO posts (id, publication_date, text, "user")
VALUES ('b1c6c22b-f625-4e7f-9553-e83e5a3e2189', '2025-01-02', 'random_string', 'bab10bfc-5d7d-48ae-a843-eebd5887361b');

INSERT INTO likes (id, publication_date, owner_id, user_id)
VALUES ('bec6ea21-a6b6-42ac-97fb-e8cf9ace41b4', '2024-06-01', '60143f71-89f1-4680-9a9a-42d10ccdc09b', '80dbd712-ad8a-47d6-8ebc-c9117ca833a2');

INSERT INTO likes (id, publication_date, owner_id, user_id)
VALUES ('41e47def-755b-4748-b032-ccf391218fbd', '2024-08-02', '60143f71-89f1-4680-9a9a-42d10ccdc09b', 'bab10bfc-5d7d-48ae-a843-eebd5887361b');

INSERT INTO likes (id, publication_date, owner_id, user_id)
VALUES ('40071b15-914c-4a6d-a6f8-48e89529e074', '2025-01-05', 'b1c6c22b-f625-4e7f-9553-e83e5a3e2189', 'bab10bfc-5d7d-48ae-a843-eebd5887361b');

INSERT INTO likes (id, publication_date, owner_id, user_id)
VALUES ('7396094c-d958-4108-b2b5-8963b2379c15', '2024-08-18', '60143f71-89f1-4680-9a9a-42d10ccdc09b', 'bab10bfc-5d7d-48ae-a843-eebd5887361b');

INSERT INTO likes (id, publication_date, owner_id, user_id)
VALUES ('65c331f5-3ba4-442c-b583-eda4bb6bf03a', '2024-10-13', 'b1c6c22b-f625-4e7f-9553-e83e5a3e2189', 'bab10bfc-5d7d-48ae-a843-eebd5887361b');

INSERT INTO likes (id, publication_date, owner_id, user_id)
VALUES ('779d93db-a59a-41a7-ab3c-8853223c0be2', '2025-01-31', 'b1c6c22b-f625-4e7f-9553-e83e5a3e2189', '80dbd712-ad8a-47d6-8ebc-c9117ca833a2');

INSERT INTO likes (id, publication_date, owner_id, user_id)
VALUES ('a9447f1e-c1a1-48fb-bd3f-06919bde961b', '2024-07-07', '60143f71-89f1-4680-9a9a-42d10ccdc09b', 'bab10bfc-5d7d-48ae-a843-eebd5887361b');

INSERT INTO likes (id, publication_date, owner_id, user_id)
VALUES ('d60a7db3-6df7-422b-b3ee-a74110b3d9db', '2024-08-22', '60143f71-89f1-4680-9a9a-42d10ccdc09b', 'bab10bfc-5d7d-48ae-a843-eebd5887361b');

INSERT INTO likes (id, publication_date, owner_id, user_id)
VALUES ('455b64e6-60c0-4ad6-b5e7-640ca773ba81', '2024-12-11', 'b1c6c22b-f625-4e7f-9553-e83e5a3e2189', 'bab10bfc-5d7d-48ae-a843-eebd5887361b');

INSERT INTO likes (id, publication_date, owner_id, user_id)
VALUES ('5b5518f9-3f94-4dd9-b8c8-667f22101cca', '2024-10-03', 'b1c6c22b-f625-4e7f-9553-e83e5a3e2189', 'bab10bfc-5d7d-48ae-a843-eebd5887361b');
