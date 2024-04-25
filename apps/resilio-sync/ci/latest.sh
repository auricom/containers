#!/usr/bin/env bash

version="$(curl -sX GET https://linux-packages.resilio.com/resilio-sync/deb/dists/resilio-sync/non-free/binary-amd64/Packages | grep -A 7 -m 1 'Package: resilio-sync' | awk -F ': ' '/Version/{split($2, a, "-"); split(a[1], b, "."); print b[1] "." b[2] "." b[3]; exit}')"
version="${version#*v}"
version="${version#*release-}"
printf "%s" "${version}"
