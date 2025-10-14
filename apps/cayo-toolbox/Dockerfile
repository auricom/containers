# trunk-ignore-all(checkov/CKV_DOCKER_2)
# trunk-ignore-all(trivy/DS026)
FROM cgr.dev/chainguard/wolfi-base:latest@sha256:602525a5e85f0b3a6196dd5a47b8e91a1f0f89d7bd3223b2dce54a6b36e2b1ef

WORKDIR /app

# trunk-ignore(hadolint/DL3018)
RUN apk update && \
    apk add --no-cache \
        fd \
        wget && \
    # Exiftool
    exiftool_version=$(wget -qO- https://exiftool.org/ver.txt) && \
    exiftool_installer=$(mktemp --directory) && \
    wget -q --show-progress --output-document "${exiftool_installer}/exiftool.tar.gz" "https://exiftool.org/Image-ExifTool-${exiftool_version}.tar.gz" && \
    tar xvf "${exiftool_installer}/exiftool.tar.gz" --strip-components=1 -C "${exiftool_installer}" && \
    cp "${exiftool_installer}/exiftool" /usr/bin/exiftool && \
    cp -r "${exiftool_installer}/lib" /usr/bin/lib && \
    rm -rf "${exiftool_installer}" && \
    apk del wget && \
    adduser -D -u 1000 core && \
    chown -R core:core /app && \
    chmod -R u=rwX,go=rX /app

USER core
