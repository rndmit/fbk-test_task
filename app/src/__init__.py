import os
from flask import Flask
from .handlers import handlers


__version__ = '0.1.0'

def create_app(test_config=None):
    app = Flask(__name__, instance_relative_config=True)

    app.register_blueprint(handlers)

    return app