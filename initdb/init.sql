
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
VALUES ('f70e1a10-8d27-4438-96e1-5813b05885f7', 'jimmy@mail.ru', 'Ivan Ivanov', '2006-05-15');

INSERT INTO users (id, email, fio, registration_date)
VALUES ('359828ff-8e15-49c1-b6fb-7e0f78d0d7cc', 'billy@mail.ru', 'Anna Smirnova', '2006-08-20');

INSERT INTO posts (id, publication_date, text, "user")
VALUES ('4e59b25b-1596-4fbe-aac4-eddad1919650', '2025-01-01', 'random_text', 'f70e1a10-8d27-4438-96e1-5813b05885f7');

INSERT INTO posts (id, publication_date, text, "user")
VALUES ('9d045809-d5cf-40e2-b854-6572f8c5d49e', '2025-01-02', 'random_string', 'f70e1a10-8d27-4438-96e1-5813b05885f7');

INSERT INTO likes (id, publication_date, owner_id, user_id)
VALUES ('86a48e85-5072-4a67-a0c9-49624bf3a6b5', '2024-06-10', '4e59b25b-1596-4fbe-aac4-eddad1919650', '359828ff-8e15-49c1-b6fb-7e0f78d0d7cc');

INSERT INTO likes (id, publication_date, owner_id, user_id)
VALUES ('0e1eabfa-2472-4688-a46f-3fd077165e58', '2024-06-06', '4e59b25b-1596-4fbe-aac4-eddad1919650', 'f70e1a10-8d27-4438-96e1-5813b05885f7');

INSERT INTO likes (id, publication_date, owner_id, user_id)
VALUES ('ed12c43a-ae2d-49ee-9ee0-b86bcb1230ee', '2024-11-27', '4e59b25b-1596-4fbe-aac4-eddad1919650', '359828ff-8e15-49c1-b6fb-7e0f78d0d7cc');

INSERT INTO likes (id, publication_date, owner_id, user_id)
VALUES ('0dfefa76-589d-446c-b567-714fb0df2951', '2025-01-28', '9d045809-d5cf-40e2-b854-6572f8c5d49e', '359828ff-8e15-49c1-b6fb-7e0f78d0d7cc');

INSERT INTO likes (id, publication_date, owner_id, user_id)
VALUES ('2e7384a1-ef44-47d9-9981-6fdb90124281', '2024-07-02', '4e59b25b-1596-4fbe-aac4-eddad1919650', '359828ff-8e15-49c1-b6fb-7e0f78d0d7cc');

INSERT INTO likes (id, publication_date, owner_id, user_id)
VALUES ('acaae17e-174e-4079-baf3-8903d65ccdf7', '2024-06-17', '4e59b25b-1596-4fbe-aac4-eddad1919650', 'f70e1a10-8d27-4438-96e1-5813b05885f7');

INSERT INTO likes (id, publication_date, owner_id, user_id)
VALUES ('6c86c903-4329-4a8e-8837-047954d4d2c4', '2025-02-08', '4e59b25b-1596-4fbe-aac4-eddad1919650', '359828ff-8e15-49c1-b6fb-7e0f78d0d7cc');

INSERT INTO likes (id, publication_date, owner_id, user_id)
VALUES ('dac6a8a9-af29-4864-a583-352ac57e830f', '2024-05-02', '4e59b25b-1596-4fbe-aac4-eddad1919650', 'f70e1a10-8d27-4438-96e1-5813b05885f7');

INSERT INTO likes (id, publication_date, owner_id, user_id)
VALUES ('469fdccd-0bc7-4d1e-afec-e0a421a46bc9', '2024-08-10', '4e59b25b-1596-4fbe-aac4-eddad1919650', '359828ff-8e15-49c1-b6fb-7e0f78d0d7cc');

INSERT INTO likes (id, publication_date, owner_id, user_id)
VALUES ('e7bb1daf-ad51-4b45-83e2-fbc53b550200', '2024-08-16', '4e59b25b-1596-4fbe-aac4-eddad1919650', '359828ff-8e15-49c1-b6fb-7e0f78d0d7cc');
