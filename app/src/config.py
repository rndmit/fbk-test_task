import os


class DatabaseConfig():
    HOST = os.environ.get('APP_DB_HOST', default='127.0.0.1')
    PORT = os.environ.get('APP_DB_PORT', default='5432')
    NAME = os.environ.get('APP_DB_NAME', default='postgres')
    USER = os.environ.get('APP_DB_USER', default='user')
    PASSWORD = os.environ.get('APP_DB_PASSWORD', default='password')