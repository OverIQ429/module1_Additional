

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
VALUES ('b6b4c37b-9072-439d-bc37-47198af1db36', 'jimmy@mail.ru', 'Ivan Ivanov', '2006-05-15');

INSERT INTO users (id, email, fio, registration_date)
VALUES ('a6e37b18-e2b3-4935-aebd-759de33c69d1', 'billy@mail.ru', 'Anna Smirnova', '2006-08-20');

INSERT INTO posts (id, publication_date, text, "user")
VALUES ('de9ca2df-380c-4ff3-a43d-888794606cf7', '2025-01-01', 'random_text', 'b6b4c37b-9072-439d-bc37-47198af1db36');

INSERT INTO posts (id, publication_date, text, "user")
VALUES ('cdf82bc2-6a14-4995-9a57-eeafe5affbe5', '2025-01-02', 'random_string', 'b6b4c37b-9072-439d-bc37-47198af1db36');

INSERT INTO likes (id, publication_date, owner_id, user_id)
VALUES ('6f6586ff-2c3b-4ae8-b0ca-9a02f0796740', '2024-09-27', 'cdf82bc2-6a14-4995-9a57-eeafe5affbe5', 'b6b4c37b-9072-439d-bc37-47198af1db36');

INSERT INTO likes (id, publication_date, owner_id, user_id)
VALUES ('842fb7cf-85c1-4cad-ac20-bd194bff0eae', '2024-05-27', 'de9ca2df-380c-4ff3-a43d-888794606cf7', 'b6b4c37b-9072-439d-bc37-47198af1db36');

INSERT INTO likes (id, publication_date, owner_id, user_id)
VALUES ('1560ce64-40a7-4066-a8f1-b9f7780564a0', '2024-06-06', 'cdf82bc2-6a14-4995-9a57-eeafe5affbe5', 'a6e37b18-e2b3-4935-aebd-759de33c69d1');

INSERT INTO likes (id, publication_date, owner_id, user_id)
VALUES ('6fdefc08-d99c-4ffa-98a4-6058facdab69', '2024-09-30', 'cdf82bc2-6a14-4995-9a57-eeafe5affbe5', 'a6e37b18-e2b3-4935-aebd-759de33c69d1');

INSERT INTO likes (id, publication_date, owner_id, user_id)
VALUES ('a2425040-97ae-47ce-a379-57203f5b1d78', '2024-12-17', 'cdf82bc2-6a14-4995-9a57-eeafe5affbe5', 'a6e37b18-e2b3-4935-aebd-759de33c69d1');

INSERT INTO likes (id, publication_date, owner_id, user_id)
VALUES ('e6670e46-c8fe-4af6-a5b0-b10239bf33ac', '2024-12-27', 'de9ca2df-380c-4ff3-a43d-888794606cf7', 'a6e37b18-e2b3-4935-aebd-759de33c69d1');

INSERT INTO likes (id, publication_date, owner_id, user_id)
VALUES ('fecfc609-43a3-4c6a-bb54-44e887735eac', '2025-02-05', 'de9ca2df-380c-4ff3-a43d-888794606cf7', 'b6b4c37b-9072-439d-bc37-47198af1db36');

INSERT INTO likes (id, publication_date, owner_id, user_id)
VALUES ('95339de4-93d4-4099-9b13-760560552675', '2024-08-22', 'de9ca2df-380c-4ff3-a43d-888794606cf7', 'b6b4c37b-9072-439d-bc37-47198af1db36');

INSERT INTO likes (id, publication_date, owner_id, user_id)
VALUES ('ac9d9bb0-362c-4010-bea7-a9d305d94639', '2025-01-23', 'cdf82bc2-6a14-4995-9a57-eeafe5affbe5', 'b6b4c37b-9072-439d-bc37-47198af1db36');

INSERT INTO likes (id, publication_date, owner_id, user_id)
VALUES ('459278f3-fbef-4d03-86fb-d14c4d63ec5f', '2025-01-25', 'cdf82bc2-6a14-4995-9a57-eeafe5affbe5', 'a6e37b18-e2b3-4935-aebd-759de33c69d1');
