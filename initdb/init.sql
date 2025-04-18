
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
VALUES ('79e6518f-7b60-4fa4-88ee-a51c920ba8b0', 'jimmy@mail.ru', 'Ivan Ivanov', '2006-05-15');

INSERT INTO users (id, email, fio, registration_date)
VALUES ('e02a6130-3d5d-4adf-8869-4c53e5db8c3c', 'billy@mail.ru', 'Anna Smirnova', '2006-08-20');

INSERT INTO posts (id, publication_date, text, "user")
VALUES ('79520306-d008-46db-87a1-b613cb03c70f', '2025-01-01', 'random_text', '79e6518f-7b60-4fa4-88ee-a51c920ba8b0');

INSERT INTO posts (id, publication_date, text, "user")
VALUES ('5afc2619-5054-4ff5-bc98-4a536d62e5b6', '2025-01-02', 'random_string', '79e6518f-7b60-4fa4-88ee-a51c920ba8b0');

INSERT INTO likes (id, publication_date, owner_id, user_id)
VALUES ('ab59b9ca-682e-4c1a-b688-e9bf41e57aa4', '2024-10-16', '79520306-d008-46db-87a1-b613cb03c70f', 'e02a6130-3d5d-4adf-8869-4c53e5db8c3c');

INSERT INTO likes (id, publication_date, owner_id, user_id)
VALUES ('9e041aac-e360-4dc6-8c60-4f0bcbc02585', '2024-08-13', '79520306-d008-46db-87a1-b613cb03c70f', '79e6518f-7b60-4fa4-88ee-a51c920ba8b0');

INSERT INTO likes (id, publication_date, owner_id, user_id)
VALUES ('03b8be01-eaf3-4128-8da8-e69d5992f1c7', '2024-06-24', '79520306-d008-46db-87a1-b613cb03c70f', '79e6518f-7b60-4fa4-88ee-a51c920ba8b0');

INSERT INTO likes (id, publication_date, owner_id, user_id)
VALUES ('0785cbdd-0a88-49da-8a22-a005bcd5beee', '2024-04-30', '5afc2619-5054-4ff5-bc98-4a536d62e5b6', '79e6518f-7b60-4fa4-88ee-a51c920ba8b0');

INSERT INTO likes (id, publication_date, owner_id, user_id)
VALUES ('11f88785-423e-41f3-b421-d45553a77bdb', '2024-08-25', '79520306-d008-46db-87a1-b613cb03c70f', '79e6518f-7b60-4fa4-88ee-a51c920ba8b0');

INSERT INTO likes (id, publication_date, owner_id, user_id)
VALUES ('3934edcb-1685-4b32-b25e-3b3229acfcba', '2025-02-23', '5afc2619-5054-4ff5-bc98-4a536d62e5b6', '79e6518f-7b60-4fa4-88ee-a51c920ba8b0');

INSERT INTO likes (id, publication_date, owner_id, user_id)
VALUES ('319bdc13-7f35-4a4b-8622-f3dcecb0df11', '2024-06-18', '5afc2619-5054-4ff5-bc98-4a536d62e5b6', '79e6518f-7b60-4fa4-88ee-a51c920ba8b0');

INSERT INTO likes (id, publication_date, owner_id, user_id)
VALUES ('d90ec2fc-b650-49ad-85d8-4fc556f57862', '2024-04-26', '5afc2619-5054-4ff5-bc98-4a536d62e5b6', '79e6518f-7b60-4fa4-88ee-a51c920ba8b0');

INSERT INTO likes (id, publication_date, owner_id, user_id)
VALUES ('9663cce8-4b96-4bcf-abf0-819e96105215', '2024-07-05', '79520306-d008-46db-87a1-b613cb03c70f', '79e6518f-7b60-4fa4-88ee-a51c920ba8b0');

INSERT INTO likes (id, publication_date, owner_id, user_id)
VALUES ('bbba4a57-ebea-4a92-ac4d-37d4d8473567', '2025-03-24', '5afc2619-5054-4ff5-bc98-4a536d62e5b6', 'e02a6130-3d5d-4adf-8869-4c53e5db8c3c');
