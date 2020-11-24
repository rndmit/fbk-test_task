FROM python:3.8

ENV FLASK_APP=src

WORKDIR /app

COPY . /app

RUN pip install --no-cache-dir -r requirements.txt

CMD waitress-serve --call 'src:create_app' 

EXPOSE 8080