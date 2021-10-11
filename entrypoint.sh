#!/bin/sh


echo "Lunching entrypoint.sh ..."
python manage.py migrate --no-input
python manage.py collectstatic --no-input

gunicorn django_auto_deploy.wsgi:application --bind 0.0.0.0:8000

exec "$@"