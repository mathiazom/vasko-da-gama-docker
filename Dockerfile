FROM python:3.10

RUN apt-get update && apt-get install -y cron

WORKDIR /app

RUN pip install "poetry==1.2.0"

COPY vasko-da-gama/pyproject.toml vasko-da-gama/poetry.lock ./

RUN poetry config virtualenvs.create false

RUN poetry install

COPY vasko-da-gama .

COPY ./runner.sh /

RUN chmod 0744 /runner.sh

CMD ["sh", "/runner.sh"]
