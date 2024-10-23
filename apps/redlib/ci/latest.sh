#!/usr/bin/env bash

# version="$(curl -sX GET "https://api.github.com/repos/redlib-org/redlib/releases/latest" | jq --raw-output '.tag_name' || true)"
version="$(curl -sX GET "https://api.github.com/repos/redlib-org/redlib/commits/main" | jq --raw-output '.sha')"
version="${version#*v}"
version="${version#*release-}"
printf "%s" "${version}"
