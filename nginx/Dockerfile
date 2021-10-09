# https://www.pluralsight.com/guides/packaging-a-django-app-using-docker-nginx-and-gunicorn
FROM nginx:alpine

RUN rm /etc/nginx/conf.d/default.conf
COPY nginx.conf /etc/nginx/conf.d