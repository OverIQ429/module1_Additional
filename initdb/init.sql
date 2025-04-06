
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
VALUES ('857b06de-a1ff-4a98-b48e-9e15f6efcdf2', 'jimmy@mail.ru', 'Ivan Ivanov', '2006-05-15');

INSERT INTO users (id, email, fio, registration_date)
VALUES ('ecd9c328-2e19-4786-a8da-3c0615f9145e', 'billy@mail.ru', 'Anna Smirnova', '2006-08-20');

INSERT INTO posts (id, publication_date, text, "user")
VALUES ('1eeb2b57-7368-4410-9f66-e4e76af529c3', '2025-01-01', 'random_text', '857b06de-a1ff-4a98-b48e-9e15f6efcdf2');

INSERT INTO posts (id, publication_date, text, "user")
VALUES ('1fc619c4-509c-4542-8e44-696b56d4d6fd', '2025-01-02', 'random_string', '857b06de-a1ff-4a98-b48e-9e15f6efcdf2');

INSERT INTO likes (id, publication_date, owner_id, user_id)
VALUES ('1b3f1ed9-b6d3-4b17-8f51-60c5ae9b01cc', '2024-10-16', '1fc619c4-509c-4542-8e44-696b56d4d6fd', '857b06de-a1ff-4a98-b48e-9e15f6efcdf2');

INSERT INTO likes (id, publication_date, owner_id, user_id)
VALUES ('514e5fca-9af8-4b38-8370-b5fdfdc81c72', '2024-07-03', '1fc619c4-509c-4542-8e44-696b56d4d6fd', 'ecd9c328-2e19-4786-a8da-3c0615f9145e');

INSERT INTO likes (id, publication_date, owner_id, user_id)
VALUES ('0b833e53-0101-4bcb-94d4-65f2069d08dc', '2024-09-27', '1fc619c4-509c-4542-8e44-696b56d4d6fd', 'ecd9c328-2e19-4786-a8da-3c0615f9145e');

INSERT INTO likes (id, publication_date, owner_id, user_id)
VALUES ('edf71ae6-d813-4379-9b15-2d0243c03a14', '2024-11-02', '1fc619c4-509c-4542-8e44-696b56d4d6fd', '857b06de-a1ff-4a98-b48e-9e15f6efcdf2');

INSERT INTO likes (id, publication_date, owner_id, user_id)
VALUES ('b992cd1b-ba98-49f1-aa7d-94c963c0f13f', '2025-03-26', '1eeb2b57-7368-4410-9f66-e4e76af529c3', 'ecd9c328-2e19-4786-a8da-3c0615f9145e');

INSERT INTO likes (id, publication_date, owner_id, user_id)
VALUES ('95fd3ca1-1483-40b7-a38c-2328d353b49a', '2024-09-21', '1eeb2b57-7368-4410-9f66-e4e76af529c3', 'ecd9c328-2e19-4786-a8da-3c0615f9145e');

INSERT INTO likes (id, publication_date, owner_id, user_id)
VALUES ('4182c540-304d-4a4f-9521-0ff040db2f60', '2024-09-15', '1fc619c4-509c-4542-8e44-696b56d4d6fd', 'ecd9c328-2e19-4786-a8da-3c0615f9145e');

INSERT INTO likes (id, publication_date, owner_id, user_id)
VALUES ('97653371-9c2d-425b-b28a-aed08f164c28', '2024-11-07', '1eeb2b57-7368-4410-9f66-e4e76af529c3', '857b06de-a1ff-4a98-b48e-9e15f6efcdf2');

INSERT INTO likes (id, publication_date, owner_id, user_id)
VALUES ('8904f4d9-4c8e-4316-b39c-663ab79c0288', '2024-08-29', '1fc619c4-509c-4542-8e44-696b56d4d6fd', 'ecd9c328-2e19-4786-a8da-3c0615f9145e');

INSERT INTO likes (id, publication_date, owner_id, user_id)
VALUES ('00bce5c7-15d4-4ba4-a4c7-a8e8975b506a', '2024-11-06', '1eeb2b57-7368-4410-9f66-e4e76af529c3', 'ecd9c328-2e19-4786-a8da-3c0615f9145e');
