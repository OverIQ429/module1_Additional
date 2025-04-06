
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
VALUES ('ca68df63-7e1f-4248-9904-a2c4f20fe1a6', 'jimmy@mail.ru', 'Ivan Ivanov', '2006-05-15');

INSERT INTO users (id, email, fio, registration_date)
VALUES ('3d04a28b-c33b-4364-9379-a8f1b0a909f7', 'billy@mail.ru', 'Anna Smirnova', '2006-08-20');

INSERT INTO posts (id, publication_date, text, "user")
VALUES ('52992011-2669-4196-9786-5924e07a44d6', '2025-01-01', 'random_text', 'ca68df63-7e1f-4248-9904-a2c4f20fe1a6');

INSERT INTO posts (id, publication_date, text, "user")
VALUES ('5d8b6dd9-7e22-4872-b797-5070bd23ca9c', '2025-01-02', 'random_string', 'ca68df63-7e1f-4248-9904-a2c4f20fe1a6');

INSERT INTO likes (id, publication_date, owner_id, user_id)
VALUES ('4372dd83-420e-469b-9a07-77cc60c9538c', '2024-07-06', '52992011-2669-4196-9786-5924e07a44d6', 'ca68df63-7e1f-4248-9904-a2c4f20fe1a6');

INSERT INTO likes (id, publication_date, owner_id, user_id)
VALUES ('e0f15d6b-c875-48c3-8361-6e375ad8bde8', '2024-11-18', '52992011-2669-4196-9786-5924e07a44d6', '3d04a28b-c33b-4364-9379-a8f1b0a909f7');

INSERT INTO likes (id, publication_date, owner_id, user_id)
VALUES ('0a4cd8bb-ea9c-4f0d-900c-985dc7792cee', '2025-04-04', '5d8b6dd9-7e22-4872-b797-5070bd23ca9c', 'ca68df63-7e1f-4248-9904-a2c4f20fe1a6');

INSERT INTO likes (id, publication_date, owner_id, user_id)
VALUES ('d8614487-970f-4f4c-9880-273fe16a8caf', '2025-03-30', '52992011-2669-4196-9786-5924e07a44d6', '3d04a28b-c33b-4364-9379-a8f1b0a909f7');

INSERT INTO likes (id, publication_date, owner_id, user_id)
VALUES ('53d8a327-e851-4772-811a-46b47ffeda1c', '2024-12-12', '52992011-2669-4196-9786-5924e07a44d6', 'ca68df63-7e1f-4248-9904-a2c4f20fe1a6');

INSERT INTO likes (id, publication_date, owner_id, user_id)
VALUES ('21b5435e-c660-41da-8a28-982a59337057', '2024-12-23', '52992011-2669-4196-9786-5924e07a44d6', '3d04a28b-c33b-4364-9379-a8f1b0a909f7');

INSERT INTO likes (id, publication_date, owner_id, user_id)
VALUES ('db52aa07-da0e-4a40-96f5-f2a791f93a74', '2024-04-25', '5d8b6dd9-7e22-4872-b797-5070bd23ca9c', 'ca68df63-7e1f-4248-9904-a2c4f20fe1a6');

INSERT INTO likes (id, publication_date, owner_id, user_id)
VALUES ('fef4a50e-2d7b-46e9-a6da-c71761511a25', '2024-08-05', '52992011-2669-4196-9786-5924e07a44d6', '3d04a28b-c33b-4364-9379-a8f1b0a909f7');

INSERT INTO likes (id, publication_date, owner_id, user_id)
VALUES ('10a66397-709b-48a9-84be-0db1824503e9', '2024-09-30', '52992011-2669-4196-9786-5924e07a44d6', '3d04a28b-c33b-4364-9379-a8f1b0a909f7');

INSERT INTO likes (id, publication_date, owner_id, user_id)
VALUES ('d655a58e-861c-4cbe-abaa-8e682e0f6299', '2024-09-03', '52992011-2669-4196-9786-5924e07a44d6', '3d04a28b-c33b-4364-9379-a8f1b0a909f7');
