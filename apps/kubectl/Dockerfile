FROM cgr.dev/chainguard/wolfi-base:latest@sha256:417d791afa234c538bca977fe0f44011d2381e60a9fde44c938bd17b9cc38f66

ARG VERSION

USER root

RUN \
    apk add --no-cache --upgrade \
        bash \
        curl \
        exiftool \
        fd \
        kubernetes \
        openssh \
        openssl && \
    rm -rf \
        /root/.cache \
        /tmp/*

USER nonroot
CMD [ "/usr/local/bin/kubectl" ]

LABEL org.opencontainers.image.source="https://github.com/kubernetes/kubectl"
