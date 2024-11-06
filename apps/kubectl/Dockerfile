FROM cgr.dev/chainguard/wolfi-base:latest@sha256:ef6dd240997674c8a940dd9ab565dd3e8700b8f7a8e7b743ed16b925d81a70ef

ARG VERSION

USER root

RUN \
    apk add --no-cache --upgrade \
        bash \
        curl \
        exiftool \
        fd \
        kubectl-${VERSION}-default \
        openssh && \
    rm -rf \
        /root/.cache \
        /tmp/*

USER nonroot
CMD [ "/usr/local/bin/kubectl" ]

LABEL org.opencontainers.image.source="https://github.com/kubernetes/kubectl"
