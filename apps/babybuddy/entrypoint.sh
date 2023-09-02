#!/usr/bin/env bash

#shellcheck disable=SC1091
test -f "/scripts/umask.sh" && source "/scripts/umask.sh"

#shellcheck disable=SC2086
exec \
    uwsgi --http-socket 0.0.0.0:3000 \
    --chdir /app/www/public \
    --env DJANGO_SETTINGS_MODULE=babybuddy.settings.production  \
    --processes 4 \
    --threads 2 \
    --plugin python3  \
    --module "babybuddy.wsgi:application"
