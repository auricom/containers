FROM cgr.dev/chainguard/wolfi-base:latest@sha256:8c1c57686e99628612da1efadaabf245ca57b962c7b3a432f5937e5fe07a5d97

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
