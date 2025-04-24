
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
VALUES ('b6ed2582-ee37-405a-95be-0501dc8cbe0f', 'jimmy@mail.ru', 'Ivan Ivanov', '2006-05-15');

INSERT INTO users (id, email, fio, registration_date)
VALUES ('75916a86-aa26-4c6e-ae7d-811342aca569', 'billy@mail.ru', 'Anna Smirnova', '2006-08-20');

INSERT INTO posts (id, publication_date, text, "user")
VALUES ('f5bc0cea-3ac7-4966-add1-b73703d928d9', '2025-01-01', 'random_text', 'b6ed2582-ee37-405a-95be-0501dc8cbe0f');

INSERT INTO posts (id, publication_date, text, "user")
VALUES ('2d590c03-ffc1-46ed-a453-c0febeb786d6', '2025-01-02', 'random_string', 'b6ed2582-ee37-405a-95be-0501dc8cbe0f');

INSERT INTO likes (id, publication_date, owner_id, user_id)
VALUES ('e430d1f6-f039-41ca-a554-1d1fe456a95a', '2024-08-08', '2d590c03-ffc1-46ed-a453-c0febeb786d6', '75916a86-aa26-4c6e-ae7d-811342aca569');

INSERT INTO likes (id, publication_date, owner_id, user_id)
VALUES ('99c4be4f-089b-4cd5-b30b-c0e023b4758c', '2024-07-05', '2d590c03-ffc1-46ed-a453-c0febeb786d6', 'b6ed2582-ee37-405a-95be-0501dc8cbe0f');

INSERT INTO likes (id, publication_date, owner_id, user_id)
VALUES ('c8878388-e9dc-40c5-b915-1770da88edce', '2024-10-14', 'f5bc0cea-3ac7-4966-add1-b73703d928d9', '75916a86-aa26-4c6e-ae7d-811342aca569');

INSERT INTO likes (id, publication_date, owner_id, user_id)
VALUES ('36023b8d-e571-4c46-9e6c-11641a386a5b', '2024-09-19', 'f5bc0cea-3ac7-4966-add1-b73703d928d9', 'b6ed2582-ee37-405a-95be-0501dc8cbe0f');

INSERT INTO likes (id, publication_date, owner_id, user_id)
VALUES ('d5045fa8-d620-482f-9863-5b143205a49e', '2024-07-18', 'f5bc0cea-3ac7-4966-add1-b73703d928d9', '75916a86-aa26-4c6e-ae7d-811342aca569');

INSERT INTO likes (id, publication_date, owner_id, user_id)
VALUES ('be886718-f05c-4538-8287-5fbb41efb5af', '2025-03-21', 'f5bc0cea-3ac7-4966-add1-b73703d928d9', '75916a86-aa26-4c6e-ae7d-811342aca569');

INSERT INTO likes (id, publication_date, owner_id, user_id)
VALUES ('c3694dd6-986b-4fab-8a06-ee6782bebf4e', '2024-12-07', '2d590c03-ffc1-46ed-a453-c0febeb786d6', 'b6ed2582-ee37-405a-95be-0501dc8cbe0f');

INSERT INTO likes (id, publication_date, owner_id, user_id)
VALUES ('3d878872-85a9-47c6-8623-4233e652aaab', '2024-09-11', 'f5bc0cea-3ac7-4966-add1-b73703d928d9', '75916a86-aa26-4c6e-ae7d-811342aca569');

INSERT INTO likes (id, publication_date, owner_id, user_id)
VALUES ('f9386667-f664-493e-9dbb-f031f71a0a02', '2024-07-11', '2d590c03-ffc1-46ed-a453-c0febeb786d6', '75916a86-aa26-4c6e-ae7d-811342aca569');

INSERT INTO likes (id, publication_date, owner_id, user_id)
VALUES ('be929e08-7607-4bb4-88ae-8240f4fbd9d5', '2024-05-10', '2d590c03-ffc1-46ed-a453-c0febeb786d6', '75916a86-aa26-4c6e-ae7d-811342aca569');
