FROM cgr.dev/chainguard/wolfi-base:latest@sha256:5cb6b2e19db57ed06599c833cb05319a6a91e18816bab90a1154574de20c3822

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
