
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
VALUES ('8177cc84-6a29-43b6-b00b-d47e6ca2ba54', 'jimmy@mail.ru', 'Ivan Ivanov', '2006-05-15');

INSERT INTO users (id, email, fio, registration_date)
VALUES ('2c042a34-f768-43bc-a30f-a3c4e554fcaf', 'billy@mail.ru', 'Anna Smirnova', '2006-08-20');

INSERT INTO posts (id, publication_date, text, "user")
VALUES ('10b8a112-8b22-450f-8acb-b721e02bec24', '2025-01-01', 'random_text', '8177cc84-6a29-43b6-b00b-d47e6ca2ba54');

INSERT INTO posts (id, publication_date, text, "user")
VALUES ('e1983eb6-56cc-4963-9fcc-00c019b3e5c4', '2025-01-02', 'random_string', '8177cc84-6a29-43b6-b00b-d47e6ca2ba54');

INSERT INTO likes (id, publication_date, owner_id, user_id)
VALUES ('90d7c76b-20d3-4495-9abf-ff61036df2db', '2024-12-08', '10b8a112-8b22-450f-8acb-b721e02bec24', '2c042a34-f768-43bc-a30f-a3c4e554fcaf');

INSERT INTO likes (id, publication_date, owner_id, user_id)
VALUES ('754ca2bc-ab44-442f-91a3-877eb3e93169', '2025-02-13', 'e1983eb6-56cc-4963-9fcc-00c019b3e5c4', '8177cc84-6a29-43b6-b00b-d47e6ca2ba54');

INSERT INTO likes (id, publication_date, owner_id, user_id)
VALUES ('a220f81d-971a-41b5-a8b2-478d147f4cf5', '2025-04-04', 'e1983eb6-56cc-4963-9fcc-00c019b3e5c4', '8177cc84-6a29-43b6-b00b-d47e6ca2ba54');

INSERT INTO likes (id, publication_date, owner_id, user_id)
VALUES ('85fea024-2aa6-4644-9375-177406b87ace', '2025-01-04', 'e1983eb6-56cc-4963-9fcc-00c019b3e5c4', '2c042a34-f768-43bc-a30f-a3c4e554fcaf');

INSERT INTO likes (id, publication_date, owner_id, user_id)
VALUES ('8991ff28-0cd3-4b32-8c25-f5b7c6d75858', '2024-10-04', '10b8a112-8b22-450f-8acb-b721e02bec24', '8177cc84-6a29-43b6-b00b-d47e6ca2ba54');

INSERT INTO likes (id, publication_date, owner_id, user_id)
VALUES ('b35274c2-3d16-47ad-95b8-77742780116f', '2024-12-24', '10b8a112-8b22-450f-8acb-b721e02bec24', '2c042a34-f768-43bc-a30f-a3c4e554fcaf');

INSERT INTO likes (id, publication_date, owner_id, user_id)
VALUES ('c08b8610-7b0c-4af3-99d0-81df4f4e9534', '2024-09-20', '10b8a112-8b22-450f-8acb-b721e02bec24', '2c042a34-f768-43bc-a30f-a3c4e554fcaf');

INSERT INTO likes (id, publication_date, owner_id, user_id)
VALUES ('0f2603b7-5dbd-4ac3-bbef-c99d0c38a086', '2024-05-16', '10b8a112-8b22-450f-8acb-b721e02bec24', '8177cc84-6a29-43b6-b00b-d47e6ca2ba54');

INSERT INTO likes (id, publication_date, owner_id, user_id)
VALUES ('ea9f6f67-78f7-4f95-8272-2ab2f772acbe', '2024-08-07', 'e1983eb6-56cc-4963-9fcc-00c019b3e5c4', '8177cc84-6a29-43b6-b00b-d47e6ca2ba54');

INSERT INTO likes (id, publication_date, owner_id, user_id)
VALUES ('5af71e6c-e5c7-44f8-ab4b-79ee7749c891', '2024-09-16', 'e1983eb6-56cc-4963-9fcc-00c019b3e5c4', '8177cc84-6a29-43b6-b00b-d47e6ca2ba54');
