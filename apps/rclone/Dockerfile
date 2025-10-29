FROM cgr.dev/chainguard/wolfi-base:latest@sha256:318af6f376bc3d0ff9e361cd9f3a487690858e26b9a3540ca19452861bca3e1a

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
