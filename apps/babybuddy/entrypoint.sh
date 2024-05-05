#!/usr/bin/env bash

mkdir -p /config/media

exec \
    uwsgi --http-socket 0.0.0.0:3000 \
    --chdir /app/www/public \
    --env DJANGO_SETTINGS_MODULE=babybuddy.settings.production  \
    --processes 4 \
    --threads 2 \
    --plugin python3  \
    --module "babybuddy.wsgi:application"
