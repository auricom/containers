#!/usr/bin/env bash

version="$(curl -sX GET "https://registry.npmjs.org/kresus/latest" | jq -j -r '.version')"
version="${version#*v}"
version="${version#*release-}"
printf "%s" "${version}"