FROM cgr.dev/chainguard/wolfi-base:latest@sha256:c0ead40adeb4b6f55c80c011032a20272e10bde3d745c18bbab7345fccff6791

ARG VERSION

USER root

RUN \
    apk add --no-cache \
        age \
        bash \
        curl \
        rclone=~${VERSION} && \
    rm -rf \
        /root/.cache \
        /tmp/*

USER nonroot
