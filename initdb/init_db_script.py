import uuid
from datetime import datetime, timedelta
from random import randint, choice
from pathlib import Path

db_init_dir = Path(".")
db_init_dir.mkdir(exist_ok=True)
file_path = db_init_dir / "init.sql"

users = [
    {"email": "jimmy@mail.ru", "fio": "Ivan Ivanov", "registration_date": "2006-05-15"},
    {"email": "billy@mail.ru", "fio": "Anna Smirnova", "registration_date": "2006-08-20"}
]

posts = [
    {"publication_date": "2025-01-01", "text": "random_text", "user": "Ivan Ivanov"},
    {"publication_date": "2025-01-02", "text": "random_string", "user": "Ivan Ivanov"}
]

with open(file_path, "w") as f:
    f.write("""

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
""")

    user_map = {}
    for user in users:
        user_id = uuid.uuid4()
        user["identifier"] = user_id  # Добавляем identifier в словарь user
        user_map[user["fio"]] = user_id
        f.write(f"""
INSERT INTO users (id, email, fio, registration_date)
VALUES ('{user_id}', '{user["email"]}', '{user["fio"]}', '{user["registration_date"]}');
""")

    post_map = {}
    for post in posts:
        post_id = str(uuid.uuid4())  # posts.id - это character varying
        user_id = user_map[post["user"]]  # Получаем правильный uuid из user_map
        post["identifier"] = post_id  # Добавляем identifier в словарь post
        f.write(f"""
INSERT INTO posts (id, publication_date, text, "user")
VALUES ('{post_id}', '{post["publication_date"]}', '{post["text"]}', '{user_id}');
""")
        post_map[post_id] = post_id  # Добавляем в map

    likes = []
    for _ in range(10):
        user = choice(users)
        post = choice(posts)
        likes_date = (datetime.now() - timedelta(days=randint(1, 365))).strftime('%Y-%m-%d')

        likes.append({
            "publication_date": likes_date,
            "owner_id": post["identifier"],  # Используем post["identifier"]
            "user_id": user["identifier"]  # Используем user["identifier"]
        })

    for like in likes:
        like_id = uuid.uuid4()
        f.write(f"""
INSERT INTO likes (id, publication_date, owner_id, user_id)
VALUES ('{like_id}', '{like["publication_date"]}', '{like["owner_id"]}', '{like["user_id"]}');
""")