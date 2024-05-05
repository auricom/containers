#!/bin/sh
PORT=${FB_PORT:-80)}
ADDRESS=${FB_ADDRESS)}
ADDRESS=${ADDRESS:-localhost}
curl -f http://$ADDRESS:$PORT/health || exit 1