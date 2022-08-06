FROM python:3.9.2-slim-buster

WORKDIR /app

ENV PYTHONUNBUFFERED 1
ENV PYTHONDONTWRITEBYTECODE 1

RUN apt-get update \
    && apt-get -y install netcat gcc postgresql \
    && apt-get clean 

RUN apt-get update \
    && apt-get -y install binutils libproj-dev gdal-bin python-gdal python3-gdal \
    && apt-get clean

RUN pip install --upgrade pip

COPY requirements.txt /app/requirements.txt
RUN pip install -r requirements.txt

COPY . /app