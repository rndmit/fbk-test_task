import json
from flask import Blueprint, request, jsonify
from .db import DB
from .config import DatabaseConfig

handlers = Blueprint(name='handlers', import_name='handlers')

@handlers.route('/', methods=['POST'])
def recieve():
    data = request.get_data(as_text=True)

    cfg = DatabaseConfig()
    with DB(cfg) as db:
        db.commit_recieved(data)
    return jsonify({'responce': 'Created'})