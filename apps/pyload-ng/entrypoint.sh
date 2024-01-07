#!/usr/bin/env bash

#shellcheck disable=SC1091
test -f "/scripts/umask.sh" && source "/scripts/umask.sh"

#shellcheck disable=SC1091
source /app/venv/bin/activate

#shellcheck disable=SC2086
exec \
    pyload --userdir /config