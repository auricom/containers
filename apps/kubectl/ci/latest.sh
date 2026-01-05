#!/usr/bin/env bash
file=/tmp/kubernetes.yaml

BASE_URL="https://raw.githubusercontent.com/wolfi-dev/os/main"
MAX_MAJOR=40          # reasonable upper bound; bump if needed
OUT_FILE="kubernetes-latest.yaml"

for ((minor=MAX_MAJOR; minor>=30; minor--)); do
    URL="${BASE_URL}/kubernetes-1.${minor}.yaml"
    if curl -fsSI "${URL}" >/dev/null 2>&1; then
        curl -fsS "${URL}" -o "${OUT_FILE}"
        curl -fsSL -o "${file}" "${URL}"
        version="$(yq .package.version ${file})"
        version="${version#*v}"
        version="${version#*release-}"
        printf "%s" "${version}"
        rm "${file}"
        break
    fi
done
