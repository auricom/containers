FROM cgr.dev/chainguard/wolfi-base:latest@sha256:1e1f283d9d69a2b08bc6da47f53dc29d64b975dcb1c3d4276a22ff30543142ea

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
