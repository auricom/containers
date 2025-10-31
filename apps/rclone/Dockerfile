FROM cgr.dev/chainguard/wolfi-base:latest@sha256:ae238a181d95804645919b2671d50ae77477efbfb299544491346e2911125aaf

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
