FROM cgr.dev/chainguard/wolfi-base:latest@sha256:77891a12dc762228955294f2207ee1cbd2b127f18dc7c7458203116288dce828

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
