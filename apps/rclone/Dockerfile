FROM cgr.dev/chainguard/wolfi-base:latest@sha256:4c4a48b87480f65c9600eeda9afc783a54def1d936edde52d1bca11bda885d37

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
