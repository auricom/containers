#!/usr/bin/env bash

version="$(curl -sX GET "https://api.github.com/repos/auricom/containers/commits?path=apps/cayo-toolbox&per_page=1" | jq --raw-output '.[0].sha')"
version="${version#*v}"
version="${version#*release-}"
printf "%s" "${version}"
