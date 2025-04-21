
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
VALUES ('309bc45e-c698-4c0f-8ce5-6003ab37eeb8', 'jimmy@mail.ru', 'Ivan Ivanov', '2006-05-15');

INSERT INTO users (id, email, fio, registration_date)
VALUES ('0babd029-9df7-48fe-a7a9-8377a132d28b', 'billy@mail.ru', 'Anna Smirnova', '2006-08-20');

INSERT INTO posts (id, publication_date, text, "user")
VALUES ('a22552c1-890b-4958-a820-0014f76d0d2d', '2025-01-01', 'random_text', '309bc45e-c698-4c0f-8ce5-6003ab37eeb8');

INSERT INTO posts (id, publication_date, text, "user")
VALUES ('b30b4a85-d9f3-4fb9-b73f-e7b31c766374', '2025-01-02', 'random_string', '309bc45e-c698-4c0f-8ce5-6003ab37eeb8');

INSERT INTO likes (id, publication_date, owner_id, user_id)
VALUES ('254847a4-e738-4513-a6ab-dcb5571e2ec4', '2024-11-19', 'b30b4a85-d9f3-4fb9-b73f-e7b31c766374', '0babd029-9df7-48fe-a7a9-8377a132d28b');

INSERT INTO likes (id, publication_date, owner_id, user_id)
VALUES ('16e81444-6468-4f8c-a77a-4f115634ab4d', '2024-06-17', 'a22552c1-890b-4958-a820-0014f76d0d2d', '0babd029-9df7-48fe-a7a9-8377a132d28b');

INSERT INTO likes (id, publication_date, owner_id, user_id)
VALUES ('fefa66d6-a338-408f-b7ca-1b72605d643d', '2025-01-12', 'b30b4a85-d9f3-4fb9-b73f-e7b31c766374', '0babd029-9df7-48fe-a7a9-8377a132d28b');

INSERT INTO likes (id, publication_date, owner_id, user_id)
VALUES ('0d61b5d6-a7d0-406f-8595-719ddb5d7d20', '2024-09-30', 'a22552c1-890b-4958-a820-0014f76d0d2d', '0babd029-9df7-48fe-a7a9-8377a132d28b');

INSERT INTO likes (id, publication_date, owner_id, user_id)
VALUES ('336163c7-e0d4-4260-ac52-f28d549b9038', '2024-11-16', 'b30b4a85-d9f3-4fb9-b73f-e7b31c766374', '0babd029-9df7-48fe-a7a9-8377a132d28b');

INSERT INTO likes (id, publication_date, owner_id, user_id)
VALUES ('deb44c71-9f09-42c6-a866-1103cdd92a64', '2025-03-12', 'a22552c1-890b-4958-a820-0014f76d0d2d', '0babd029-9df7-48fe-a7a9-8377a132d28b');

INSERT INTO likes (id, publication_date, owner_id, user_id)
VALUES ('d0950756-4a50-4cb6-97bf-91801bac4bc6', '2024-12-10', 'a22552c1-890b-4958-a820-0014f76d0d2d', '0babd029-9df7-48fe-a7a9-8377a132d28b');

INSERT INTO likes (id, publication_date, owner_id, user_id)
VALUES ('0b2fe942-28bd-4431-a799-9f21029ecaf0', '2024-08-05', 'a22552c1-890b-4958-a820-0014f76d0d2d', '0babd029-9df7-48fe-a7a9-8377a132d28b');

INSERT INTO likes (id, publication_date, owner_id, user_id)
VALUES ('21eaf5d0-68d3-4995-a467-24b1fe2ac865', '2024-10-16', 'b30b4a85-d9f3-4fb9-b73f-e7b31c766374', '0babd029-9df7-48fe-a7a9-8377a132d28b');

INSERT INTO likes (id, publication_date, owner_id, user_id)
VALUES ('4a620687-c2ac-4743-94e8-b86466b642e0', '2025-01-22', 'a22552c1-890b-4958-a820-0014f76d0d2d', '0babd029-9df7-48fe-a7a9-8377a132d28b');
