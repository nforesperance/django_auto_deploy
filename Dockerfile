# FROM python:3.7

# ENV MICRO_SERVICE=/home/app/microservice
# ENV APP_USER=nfor
# RUN addgroup docker && usermod -aG docker $APP_USER
# set work directory


# RUN mkdir -p $MICRO_SERVICE
# RUN mkdir -p $MICRO_SERVICE/static

# where the code lives
# WORKDIR $MICRO_SERVICE

# set environment variables
# ENV PYTHONDONTWRITEBYTECODE 1
# ENV PYTHONUNBUFFERED 1

# install psycopg2 dependencies
# RUN apk update \
#     && apk add --virtual build-deps gcc python3-dev musl-dev \
#     && apk add postgresql-dev gcc python3-dev musl-dev \
#     && apk del build-deps \
#     && apk --no-cache add musl-dev linux-headers g++
# install dependencies
# RUN pip install --upgrade pip
# # copy project
# COPY . $MICRO_SERVICE
# RUN pip install -r requirements.txt
# COPY ./entrypoint.sh $MICRO_SERVICE

# CMD ["/bin/bash", "/home/app/microservice/entrypoint.sh"]
# CMD [ "python","manage.py","runserver","0.0.0.0:8000"]

# syntax=docker/dockerfile:1
FROM python:3.7
ENV PYTHONUNBUFFERED=1
WORKDIR /code
RUN mkdir staticfiles
RUN pip install --upgrade pip
COPY requirements.txt /code/
RUN pip install -r requirements.txt
COPY . /code/
COPY ./entrypoint.sh /
ENTRYPOINT ["sh", "/entrypoint.sh"]

# docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q) && docker rmi $(docker images -q)