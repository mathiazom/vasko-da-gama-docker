FROM python:3.8-alpine

# Need curl for healthchecks ping
RUN apk add --no-cache curl

COPY vasko-da-gama/requirements.txt vasko-da-gama/requirements.txt

RUN python -m venv /opt/vasko && /opt/vasko/bin/pip install --no-cache-dir -r vasko-da-gama/requirements.txt

#COPY tagordo/requirements.txt vasko-da-gama/tagordo/requirements.txt

#RUN pip install --no-cache-dir -r vasko-da-gama/tagordo/requirements.txt

COPY vasko-da-gama vasko-da-gama

WORKDIR vasko-da-gama

#COPY tagordo tagordo
#RUN mkdir checkpoints

COPY ./runner.sh /

RUN chmod 0744 /runner.sh

CMD ["sh", "/runner.sh"]
