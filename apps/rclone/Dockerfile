FROM cgr.dev/chainguard/wolfi-base:latest@sha256:50c61090df44477ef4a9dcf318f788b9ba82510c11de3ea4ec07ef5cdeb2acaa

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
