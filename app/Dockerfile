FROM python:3.8-alpine

ENV FLASK_APP=src

RUN apk add --no-cache \
    gcc \
    python3-dev \
    musl-dev \
    postgresql-dev

WORKDIR /app

COPY . /app

RUN pip install --no-cache-dir -r requirements.txt

CMD ["flask", "run"]

EXPOSE 5000