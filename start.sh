#!/bin/bash

python src/manage.py collectstatic --noinput
gunicorn wsgi:application -w 3 -b 0.0.0.0:8010 --log-level=debug
#python src/manage.py makemigrations
#python src/manage.py migrate
#python src/manage.py runserver 
