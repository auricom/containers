FROM cgr.dev/chainguard/wolfi-base:latest@sha256:72de158dcb2951c4815e016c1a7804af4e1af98d1d1922c1565a85b5987fbe43

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
