FROM cgr.dev/chainguard/wolfi-base:latest@sha256:78adc0075d239ee722b5d6ba0ca23e1cd40a30f23aac2e38d48f61a014151277

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
