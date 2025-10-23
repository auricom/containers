FROM cgr.dev/chainguard/wolfi-base:latest@sha256:be19869fc9a08c4a5798b87b3948daeacd213cfb0bfdc9b43ea3c97c9e07fa0f

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
