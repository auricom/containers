#!/usr/bin/env bash

#shellcheck disable=SC1091
test -f "/scripts/umask.sh" && source "/scripts/umask.sh"

if [ "$KRESUS_DB_TYPE" != "postgres" ]; then
    export KRESUS_DIR=/config
    export KRESUS_DB_TYPE=sqlite
    export KRESUS_DB_SQLITE_PATH=/config/db.sqlite
fi

#shellcheck disable=SC2086
exec \
    /app/kresus/bin/kresus