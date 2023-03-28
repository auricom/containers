#!/usr/bin/env bash

version="$(curl -sX GET "https://api.github.com/repos/TandoorRecipes/recipes/releases/latest" | jq --raw-output '.tag_name')"
version="${version#*v}"
version="${version#*release-}"
printf "%s" "${version}"