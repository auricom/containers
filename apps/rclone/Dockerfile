FROM cgr.dev/chainguard/wolfi-base:latest@sha256:e735a9b94027e0d33e0056f94cfdca6d88adfbdf1ffa96bdbed0d43dc72fd179

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
