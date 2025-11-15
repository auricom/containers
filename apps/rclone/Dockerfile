FROM cgr.dev/chainguard/wolfi-base:latest@sha256:5c393319e5fd3eeb275f2eda85377633d344328b6f81e8378dc6b36fdd078918

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
