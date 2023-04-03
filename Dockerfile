FROM python:3.8-slim

WORKDIR /app

COPY . /app
COPY ./data /app/data
COPY requirements.txt ./


RUN apt update
RUN apt upgrade
RUN pip3 install --upgrade pip --user
RUN pip3 install -r requirements.txt
RUN python -m spacy download pt_core_news_sm
RUN python3 -m rasa train

CMD [ "run","-m","/app/models","--enable-api","--cors","*","--debug"]