FROM ubuntu:18.04

RUN apt update && apt -y upgrade
RUN apt install -y python3-pip
RUN pip3 install --upgrade pip

COPY ./requirements.txt /requirements.txt
RUN pip3 install -r /requirements.txt

RUN mkdir /app
COPY ./app /app
WORKDIR /app

RUN mkdir -p /vol/web/media
RUN mkdir -p /vol/web/static

RUN adduser --no-create-home user
RUN chown -R user:user /vol
RUN chmod -R 755 /vol/web
USER user