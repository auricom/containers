#!/usr/bin/env bash

#shellcheck disable=SC1091
test -f "/scripts/umask.sh" && source "/scripts/umask.sh"

# create symlinks for database
[[ ! -f /config/app.db ]] && \
    cp /app/app.db /config/app.db
[[ -f /app/app.db ]] && \
    rm /app/app.db
[[ ! -L /app/app.db ]] && \
    ln -s /config/app.db /app/app.db

#shellcheck disable=SC2086
exec \
    /usr/bin/python3 /app/cps.py