
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
VALUES ('acd2ee30-d7d4-4160-b990-028edd507cb4', 'jimmy@mail.ru', 'Ivan Ivanov', '2006-05-15');

INSERT INTO users (id, email, fio, registration_date)
VALUES ('b79dd0f3-8e0f-4118-b412-debc743bc67f', 'billy@mail.ru', 'Anna Smirnova', '2006-08-20');

INSERT INTO posts (id, publication_date, text, "user")
VALUES ('98fecce5-4f20-442f-bb0e-fe533e1ffc02', '2025-01-01', 'random_text', 'acd2ee30-d7d4-4160-b990-028edd507cb4');

INSERT INTO posts (id, publication_date, text, "user")
VALUES ('9fadc4eb-0366-49e6-bfea-de3b72e63d00', '2025-01-02', 'random_string', 'acd2ee30-d7d4-4160-b990-028edd507cb4');

INSERT INTO likes (id, publication_date, owner_id, user_id)
VALUES ('221c3a89-2241-4002-995a-e04955ece2ad', '2024-04-23', '98fecce5-4f20-442f-bb0e-fe533e1ffc02', 'acd2ee30-d7d4-4160-b990-028edd507cb4');

INSERT INTO likes (id, publication_date, owner_id, user_id)
VALUES ('b9e8b9c5-5844-4b17-a4ef-4cd11452026c', '2025-04-13', '98fecce5-4f20-442f-bb0e-fe533e1ffc02', 'b79dd0f3-8e0f-4118-b412-debc743bc67f');

INSERT INTO likes (id, publication_date, owner_id, user_id)
VALUES ('89bd7564-d400-4d57-8898-b487afca5440', '2024-10-07', '9fadc4eb-0366-49e6-bfea-de3b72e63d00', 'b79dd0f3-8e0f-4118-b412-debc743bc67f');

INSERT INTO likes (id, publication_date, owner_id, user_id)
VALUES ('59593948-444b-4a79-959c-ec7b21d49e2e', '2025-03-12', '9fadc4eb-0366-49e6-bfea-de3b72e63d00', 'b79dd0f3-8e0f-4118-b412-debc743bc67f');

INSERT INTO likes (id, publication_date, owner_id, user_id)
VALUES ('943ffe42-dfa4-4f67-94d7-ef69ea7838e9', '2025-02-12', '9fadc4eb-0366-49e6-bfea-de3b72e63d00', 'b79dd0f3-8e0f-4118-b412-debc743bc67f');

INSERT INTO likes (id, publication_date, owner_id, user_id)
VALUES ('a850b31f-408d-4a18-8c90-3f9c844f4243', '2024-09-21', '98fecce5-4f20-442f-bb0e-fe533e1ffc02', 'acd2ee30-d7d4-4160-b990-028edd507cb4');

INSERT INTO likes (id, publication_date, owner_id, user_id)
VALUES ('22d5b199-5dd7-4026-910f-4fd860b68a6f', '2024-10-26', '98fecce5-4f20-442f-bb0e-fe533e1ffc02', 'b79dd0f3-8e0f-4118-b412-debc743bc67f');

INSERT INTO likes (id, publication_date, owner_id, user_id)
VALUES ('e6650c97-3537-4818-bb05-2818cfd39d35', '2024-06-02', '98fecce5-4f20-442f-bb0e-fe533e1ffc02', 'acd2ee30-d7d4-4160-b990-028edd507cb4');

INSERT INTO likes (id, publication_date, owner_id, user_id)
VALUES ('4034b832-1d43-4ae4-9138-9c72a4e2aad2', '2024-12-24', '9fadc4eb-0366-49e6-bfea-de3b72e63d00', 'b79dd0f3-8e0f-4118-b412-debc743bc67f');

INSERT INTO likes (id, publication_date, owner_id, user_id)
VALUES ('4996c3dc-f5e4-4af8-ac63-65f17326e317', '2024-05-26', '9fadc4eb-0366-49e6-bfea-de3b72e63d00', 'acd2ee30-d7d4-4160-b990-028edd507cb4');
