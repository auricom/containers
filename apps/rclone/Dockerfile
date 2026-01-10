FROM cgr.dev/chainguard/wolfi-base:latest@sha256:caa431d92d0b6f31c4845ddca9c4dd813d5f488ba0e3416ff6135d83b2f1c068

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
