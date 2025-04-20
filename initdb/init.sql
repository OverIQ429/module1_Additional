
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
VALUES ('7ccf5ccc-20b1-4027-aa6c-8f125b70ed4c', 'jimmy@mail.ru', 'Ivan Ivanov', '2006-05-15');

INSERT INTO users (id, email, fio, registration_date)
VALUES ('d0ed990b-43bc-4a67-a5be-5d4c5065a478', 'billy@mail.ru', 'Anna Smirnova', '2006-08-20');

INSERT INTO posts (id, publication_date, text, "user")
VALUES ('e4d24104-f366-4da5-80eb-a2762d6ca996', '2025-01-01', 'random_text', '7ccf5ccc-20b1-4027-aa6c-8f125b70ed4c');

INSERT INTO posts (id, publication_date, text, "user")
VALUES ('a70f3649-7acf-49be-8f20-b56ed4e30cac', '2025-01-02', 'random_string', '7ccf5ccc-20b1-4027-aa6c-8f125b70ed4c');

INSERT INTO likes (id, publication_date, owner_id, user_id)
VALUES ('ae0c6c23-d0b5-423b-9862-a07fde387d6b', '2024-12-01', 'a70f3649-7acf-49be-8f20-b56ed4e30cac', '7ccf5ccc-20b1-4027-aa6c-8f125b70ed4c');

INSERT INTO likes (id, publication_date, owner_id, user_id)
VALUES ('f9f12b28-1371-4ca2-a664-be251ae40cc3', '2025-03-29', 'a70f3649-7acf-49be-8f20-b56ed4e30cac', '7ccf5ccc-20b1-4027-aa6c-8f125b70ed4c');

INSERT INTO likes (id, publication_date, owner_id, user_id)
VALUES ('922e1722-6e29-4045-b397-da7794c63c83', '2025-03-23', 'a70f3649-7acf-49be-8f20-b56ed4e30cac', '7ccf5ccc-20b1-4027-aa6c-8f125b70ed4c');

INSERT INTO likes (id, publication_date, owner_id, user_id)
VALUES ('cc7cde1f-9068-48c1-9e12-cb67cbcc833e', '2025-04-12', 'e4d24104-f366-4da5-80eb-a2762d6ca996', 'd0ed990b-43bc-4a67-a5be-5d4c5065a478');

INSERT INTO likes (id, publication_date, owner_id, user_id)
VALUES ('97b030a9-a765-459c-a9f4-a534f55de89b', '2024-06-19', 'a70f3649-7acf-49be-8f20-b56ed4e30cac', '7ccf5ccc-20b1-4027-aa6c-8f125b70ed4c');

INSERT INTO likes (id, publication_date, owner_id, user_id)
VALUES ('baca2f07-fdfe-4ac3-b761-3b757211a217', '2024-08-16', 'a70f3649-7acf-49be-8f20-b56ed4e30cac', 'd0ed990b-43bc-4a67-a5be-5d4c5065a478');

INSERT INTO likes (id, publication_date, owner_id, user_id)
VALUES ('0efc10df-509e-4202-90d3-fc9e4a5b3b7f', '2024-11-29', 'a70f3649-7acf-49be-8f20-b56ed4e30cac', '7ccf5ccc-20b1-4027-aa6c-8f125b70ed4c');

INSERT INTO likes (id, publication_date, owner_id, user_id)
VALUES ('40f6748b-f77c-4505-ac5c-32f0e4e8d343', '2024-11-25', 'a70f3649-7acf-49be-8f20-b56ed4e30cac', 'd0ed990b-43bc-4a67-a5be-5d4c5065a478');

INSERT INTO likes (id, publication_date, owner_id, user_id)
VALUES ('50b2dd9c-3d9a-4dc0-9990-7c3696d4e2fd', '2024-10-05', 'e4d24104-f366-4da5-80eb-a2762d6ca996', '7ccf5ccc-20b1-4027-aa6c-8f125b70ed4c');

INSERT INTO likes (id, publication_date, owner_id, user_id)
VALUES ('322721d9-b9ce-4a71-8ab2-5c6759e76d25', '2025-04-04', 'a70f3649-7acf-49be-8f20-b56ed4e30cac', 'd0ed990b-43bc-4a67-a5be-5d4c5065a478');
