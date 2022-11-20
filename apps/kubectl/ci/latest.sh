#!/usr/bin/env bash

version="$(curl -sX GET https://raw.githubusercontent.com/auricom/containers/main/apps/kubectl/Dockerfile | head -n 1 | awk '{print $2}')"
version="${version#*ghcr.io/onedr0p/kubernetes-kubectl:}"
version="${version%@*}"

printf "%s" "${version}"
