FROM cgr.dev/chainguard/wolfi-base:latest@sha256:28f57f6a9fb2478f3a3dd160794831bd0099ec92d0d7b81cd203fae67bcb5339

ARG VERSION

USER root

RUN \
    apk add --no-cache \
        age \
        rclone=~${VERSION} && \
    rm -rf \
        /root/.cache \
        /tmp/*

USER nonroot
