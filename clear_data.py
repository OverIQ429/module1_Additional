import psycopg2
from psycopg2 import sql

# Параметры подключения к базе данных
DB_HOST = "localhost"  # Хост
DB_NAME = "socialnetwork"     # Имя базы данных
DB_USER = "postgres"      # Имя пользователя
DB_PASSWORD = "postgres" # Пароль

# Создаем подключение к базе данных
def create_connection():
    return psycopg2.connect(
        host=DB_HOST,
        database=DB_NAME,
        user=DB_USER,
        password=DB_PASSWORD
    )

# Очистка данных в таблицах и в flyway_schema_history
def clear_data():
    conn = create_connection()
    cursor = conn.cursor()

        # Очистка таблиц
    tables = ['users', 'posts', 'likes']
    for table in tables:
        cursor.execute(sql.SQL("TRUNCATE TABLE {} CASCADE;").format(sql.Identifier(table)))
        print(f"Таблица {table} очищена.")

        # Очистка таблицы flyway_schema_history
        # cursor.execute("TRUNCATE TABLE flyway_schema_history;")
        # print("Таблица flyway_schema_history очищена.")

    conn.commit()
    cursor.close()
    conn.close()

if __name__ == "__main__":
    clear_data()