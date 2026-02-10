FROM cgr.dev/chainguard/wolfi-base:latest@sha256:1c56f3ceb1c9929611a1cc7ab7a5fde1ec5df87add282029cd1596b8eae5af67

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
