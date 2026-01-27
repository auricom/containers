FROM cgr.dev/chainguard/wolfi-base:latest@sha256:f6959a1b0ed7e6f4696f5cd8373b28846494cb9272a14dc0ddc0db94d00e7344

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
