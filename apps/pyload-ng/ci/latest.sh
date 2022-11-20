#!/usr/bin/env bash

version="$(curl -sX GET "https://pypi.org/pypi/pyload-ng/json" | jq --raw-output '.urls | last(.[]) | .filename')"
version="${version#*pyload-ng-}"
version="${version%.*}"
version="${version%.*}"
suffix=$(echo $version |  awk '{ print substr ($0, 6 ) }')
base=$(echo $version | cut -c1-5)
printf "%s" "${base}-${suffix}"