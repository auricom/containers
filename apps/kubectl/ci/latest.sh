#!/usr/bin/env bash
file=/tmp/kubernetes.yaml

curl -fsSL -o "${file}" https://raw.githubusercontent.com/wolfi-dev/os/main/kubernetes-latest.yaml
version="$(yq .vars.kubernetes-version ${file})"
version="${version#*v}"
version="${version#*release-}"
printf "%s" "${version}"
rm "${file}"
