#!/usr/bin/env bash
file=/tmp/rclone.yaml

curl -fsSL -o "${file}" https://raw.githubusercontent.com/wolfi-dev/os/main/rclone.yaml
version="$(yq .package.version ${file})"
version="${version#*v}"
version="${version#*release-}"
printf "%s" "${version}"
rm "${file}"
