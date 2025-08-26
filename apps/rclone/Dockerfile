FROM cgr.dev/chainguard/wolfi-base:latest@sha256:202dc2241806cbce4472fd287d8e87eb8bd38585d6f8946deeb30672e1c2dc84

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
