
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
VALUES ('f3de12c9-725a-4274-8fda-0dc0545d1d5b', 'jimmy@mail.ru', 'Ivan Ivanov', '2006-05-15');

INSERT INTO users (id, email, fio, registration_date)
VALUES ('f42e5b95-5df0-4899-b894-70886d5bb7ce', 'billy@mail.ru', 'Anna Smirnova', '2006-08-20');

INSERT INTO posts (id, publication_date, text, "user")
VALUES ('10fe631e-cc97-4dc1-92f8-f41904be636c', '2025-01-01', 'random_text', 'f3de12c9-725a-4274-8fda-0dc0545d1d5b');

INSERT INTO posts (id, publication_date, text, "user")
VALUES ('5f6e2926-92b0-4d4b-af3d-698d4c6aa1b3', '2025-01-02', 'random_string', 'f3de12c9-725a-4274-8fda-0dc0545d1d5b');

INSERT INTO likes (id, publication_date, owner_id, user_id)
VALUES ('411d738c-d56f-43c3-87fb-eb8d53d137ea', '2025-01-28', '10fe631e-cc97-4dc1-92f8-f41904be636c', 'f42e5b95-5df0-4899-b894-70886d5bb7ce');

INSERT INTO likes (id, publication_date, owner_id, user_id)
VALUES ('b24e41e4-63e7-4803-9401-016fc5977e9f', '2025-01-05', '5f6e2926-92b0-4d4b-af3d-698d4c6aa1b3', 'f42e5b95-5df0-4899-b894-70886d5bb7ce');

INSERT INTO likes (id, publication_date, owner_id, user_id)
VALUES ('29bc91a5-d65c-4e1e-8b80-22575c6122d8', '2024-10-26', '5f6e2926-92b0-4d4b-af3d-698d4c6aa1b3', 'f42e5b95-5df0-4899-b894-70886d5bb7ce');

INSERT INTO likes (id, publication_date, owner_id, user_id)
VALUES ('362c4784-4f82-4542-8c1d-533f571338cf', '2024-10-22', '5f6e2926-92b0-4d4b-af3d-698d4c6aa1b3', 'f3de12c9-725a-4274-8fda-0dc0545d1d5b');

INSERT INTO likes (id, publication_date, owner_id, user_id)
VALUES ('0450e2d3-330f-468b-9e7f-3ffd6c505a38', '2025-02-07', '10fe631e-cc97-4dc1-92f8-f41904be636c', 'f42e5b95-5df0-4899-b894-70886d5bb7ce');

INSERT INTO likes (id, publication_date, owner_id, user_id)
VALUES ('e4356ce5-489e-48ca-96dd-fbd86c2fd918', '2025-03-27', '10fe631e-cc97-4dc1-92f8-f41904be636c', 'f3de12c9-725a-4274-8fda-0dc0545d1d5b');

INSERT INTO likes (id, publication_date, owner_id, user_id)
VALUES ('8fb335b0-efcf-41dd-99d4-53695d4924da', '2024-08-16', '5f6e2926-92b0-4d4b-af3d-698d4c6aa1b3', 'f42e5b95-5df0-4899-b894-70886d5bb7ce');

INSERT INTO likes (id, publication_date, owner_id, user_id)
VALUES ('204c0715-615a-43d8-85ac-c912eee9f3a5', '2025-03-03', '5f6e2926-92b0-4d4b-af3d-698d4c6aa1b3', 'f3de12c9-725a-4274-8fda-0dc0545d1d5b');

INSERT INTO likes (id, publication_date, owner_id, user_id)
VALUES ('69ab0d07-c459-4b8f-b1e3-dbf33ce7e2b0', '2024-09-09', '10fe631e-cc97-4dc1-92f8-f41904be636c', 'f3de12c9-725a-4274-8fda-0dc0545d1d5b');

INSERT INTO likes (id, publication_date, owner_id, user_id)
VALUES ('8112c9d0-84dd-40fd-a4cf-3d0242ed1e43', '2025-01-31', '5f6e2926-92b0-4d4b-af3d-698d4c6aa1b3', 'f42e5b95-5df0-4899-b894-70886d5bb7ce');
