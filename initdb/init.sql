
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
VALUES ('a3fbb110-cef4-4358-b63f-6f36e357fb62', 'jimmy@mail.ru', 'Ivan Ivanov', '2006-05-15');

INSERT INTO users (id, email, fio, registration_date)
VALUES ('c74ff1f6-4049-4bd9-ad8c-b370852a3e27', 'billy@mail.ru', 'Anna Smirnova', '2006-08-20');

INSERT INTO posts (id, publication_date, text, "user")
VALUES ('441de3c0-171b-4b8d-b78c-ad2cd6281894', '2025-01-01', 'random_text', 'a3fbb110-cef4-4358-b63f-6f36e357fb62');

INSERT INTO posts (id, publication_date, text, "user")
VALUES ('ff5af458-7b4f-416e-974e-15df54ea52b6', '2025-01-02', 'random_string', 'a3fbb110-cef4-4358-b63f-6f36e357fb62');

INSERT INTO likes (id, publication_date, owner_id, user_id)
VALUES ('52adad2e-7df8-4fed-a718-b1c13dc6414b', '2024-09-02', 'ff5af458-7b4f-416e-974e-15df54ea52b6', 'c74ff1f6-4049-4bd9-ad8c-b370852a3e27');

INSERT INTO likes (id, publication_date, owner_id, user_id)
VALUES ('e2707962-4c1c-49f4-a2be-adb313bed314', '2024-10-05', 'ff5af458-7b4f-416e-974e-15df54ea52b6', 'c74ff1f6-4049-4bd9-ad8c-b370852a3e27');

INSERT INTO likes (id, publication_date, owner_id, user_id)
VALUES ('eaf0316e-69a0-4032-a16d-fd271b25ca06', '2025-02-14', 'ff5af458-7b4f-416e-974e-15df54ea52b6', 'c74ff1f6-4049-4bd9-ad8c-b370852a3e27');

INSERT INTO likes (id, publication_date, owner_id, user_id)
VALUES ('e70a8405-e5e6-4391-9545-2f23b35e7f1e', '2025-03-14', '441de3c0-171b-4b8d-b78c-ad2cd6281894', 'a3fbb110-cef4-4358-b63f-6f36e357fb62');

INSERT INTO likes (id, publication_date, owner_id, user_id)
VALUES ('06d71188-1eb0-4041-b113-eed999527747', '2024-11-18', 'ff5af458-7b4f-416e-974e-15df54ea52b6', 'c74ff1f6-4049-4bd9-ad8c-b370852a3e27');

INSERT INTO likes (id, publication_date, owner_id, user_id)
VALUES ('1a51817f-4f0c-41fb-9978-92ae04d8b459', '2024-11-23', '441de3c0-171b-4b8d-b78c-ad2cd6281894', 'c74ff1f6-4049-4bd9-ad8c-b370852a3e27');

INSERT INTO likes (id, publication_date, owner_id, user_id)
VALUES ('169ec0e3-30b9-4db3-8668-8959756513f6', '2024-08-17', '441de3c0-171b-4b8d-b78c-ad2cd6281894', 'c74ff1f6-4049-4bd9-ad8c-b370852a3e27');

INSERT INTO likes (id, publication_date, owner_id, user_id)
VALUES ('c1f85828-7d4b-4ac1-b183-56c5b2aa8bc9', '2024-08-01', 'ff5af458-7b4f-416e-974e-15df54ea52b6', 'c74ff1f6-4049-4bd9-ad8c-b370852a3e27');

INSERT INTO likes (id, publication_date, owner_id, user_id)
VALUES ('299ad060-672d-4692-be05-278836ab8123', '2024-08-08', 'ff5af458-7b4f-416e-974e-15df54ea52b6', 'c74ff1f6-4049-4bd9-ad8c-b370852a3e27');

INSERT INTO likes (id, publication_date, owner_id, user_id)
VALUES ('1a197173-22d7-4322-b03f-904700836eed', '2024-05-18', '441de3c0-171b-4b8d-b78c-ad2cd6281894', 'c74ff1f6-4049-4bd9-ad8c-b370852a3e27');
