
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
VALUES ('8ea7efab-9aba-47ee-b59a-043cc113a04f', 'jimmy@mail.ru', 'Ivan Ivanov', '2006-05-15');

INSERT INTO users (id, email, fio, registration_date)
VALUES ('394a192e-8019-4c92-ae64-92a68c871335', 'billy@mail.ru', 'Anna Smirnova', '2006-08-20');

INSERT INTO posts (id, publication_date, text, "user")
VALUES ('a40fa7a6-9df6-4912-83ba-1485450f5796', '2025-01-01', 'random_text', '8ea7efab-9aba-47ee-b59a-043cc113a04f');

INSERT INTO posts (id, publication_date, text, "user")
VALUES ('f114d31f-6660-4dd9-ac76-fe90a9e4c6a1', '2025-01-02', 'random_string', '8ea7efab-9aba-47ee-b59a-043cc113a04f');

INSERT INTO likes (id, publication_date, owner_id, user_id)
VALUES ('c916d60c-9ef2-4c09-953a-6738dc2925b3', '2024-05-30', 'f114d31f-6660-4dd9-ac76-fe90a9e4c6a1', '394a192e-8019-4c92-ae64-92a68c871335');

INSERT INTO likes (id, publication_date, owner_id, user_id)
VALUES ('6c4706a2-8ba1-4397-a261-2f446c2b5833', '2024-07-03', 'f114d31f-6660-4dd9-ac76-fe90a9e4c6a1', '8ea7efab-9aba-47ee-b59a-043cc113a04f');

INSERT INTO likes (id, publication_date, owner_id, user_id)
VALUES ('0c23f0d8-7593-4e20-81ba-0b6599a4460f', '2024-07-13', 'a40fa7a6-9df6-4912-83ba-1485450f5796', '394a192e-8019-4c92-ae64-92a68c871335');

INSERT INTO likes (id, publication_date, owner_id, user_id)
VALUES ('3ebab049-520b-459f-9290-f75c83edf75c', '2024-06-27', 'a40fa7a6-9df6-4912-83ba-1485450f5796', '394a192e-8019-4c92-ae64-92a68c871335');

INSERT INTO likes (id, publication_date, owner_id, user_id)
VALUES ('c0dca581-e140-40e4-bf39-6ff0a042d05d', '2024-12-27', 'a40fa7a6-9df6-4912-83ba-1485450f5796', '8ea7efab-9aba-47ee-b59a-043cc113a04f');

INSERT INTO likes (id, publication_date, owner_id, user_id)
VALUES ('2d3aebd3-d323-466f-9bb8-3b02af1681fd', '2025-02-17', 'f114d31f-6660-4dd9-ac76-fe90a9e4c6a1', '394a192e-8019-4c92-ae64-92a68c871335');

INSERT INTO likes (id, publication_date, owner_id, user_id)
VALUES ('7a3f979a-405d-4635-9c21-ceb4475d1277', '2024-12-31', 'a40fa7a6-9df6-4912-83ba-1485450f5796', '394a192e-8019-4c92-ae64-92a68c871335');

INSERT INTO likes (id, publication_date, owner_id, user_id)
VALUES ('7396cf12-52a7-47d5-88f4-a2be873eeb5a', '2025-01-31', 'f114d31f-6660-4dd9-ac76-fe90a9e4c6a1', '8ea7efab-9aba-47ee-b59a-043cc113a04f');

INSERT INTO likes (id, publication_date, owner_id, user_id)
VALUES ('087051cd-31f6-491b-8da4-e484a5f395a7', '2024-08-29', 'f114d31f-6660-4dd9-ac76-fe90a9e4c6a1', '8ea7efab-9aba-47ee-b59a-043cc113a04f');

INSERT INTO likes (id, publication_date, owner_id, user_id)
VALUES ('637a91ed-3e01-4603-9a43-da8e4ba87e57', '2024-06-21', 'f114d31f-6660-4dd9-ac76-fe90a9e4c6a1', '394a192e-8019-4c92-ae64-92a68c871335');
