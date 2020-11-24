import psycopg2
from .config import DatabaseConfig


class DB():
    __connection = None

    def __init__(self, cfg: DatabaseConfig):
        self.__connection = psycopg2.connect(
            host=cfg.HOST,
            port=cfg.PORT,
            database=cfg.NAME,
            user=cfg.USER,
            password=cfg.PASSWORD,
            application_name='testapp'
        )

    def __enter__(self):
        return self

    def __exit__(self, type, value, tr):
        self.__connection.close()
        return True

    def commit_recieved(self, data: str):
        cursor = self.__connection.cursor()
        cursor.execute(
            '''
            INSERT INTO recieved_data (data, created_at)
            VALUES (
                %s,
                timezone('utc' :: text, now())
            )
            ''', [data]
        )
        self.__connection.commit()