FROM cgr.dev/chainguard/wolfi-base:latest@sha256:b5f4a33fa2fee95dd79535e069bafd60f52085c5786677da5724414374c5194c

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
