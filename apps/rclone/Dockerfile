FROM cgr.dev/chainguard/wolfi-base:latest@sha256:c6584af9be8d4aad9b3a41ad3fdc520c3a84e14dd9ae1738b054e8b6df8c5194

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
