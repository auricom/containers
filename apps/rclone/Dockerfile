FROM cgr.dev/chainguard/wolfi-base:latest@sha256:521076e8673dfb887f8b0a748aeb65793498779ff4946a3961ad79a014799123

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
