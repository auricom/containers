FROM cgr.dev/chainguard/wolfi-base:latest@sha256:9608820b6ea4da8bcf16989dac37a280f8f1fa0022efc45b5ed4b1ac1f634a79

ARG VERSION

USER root

RUN \
    apk add --no-cache --upgrade \
        bash \
        curl \
        exiftool \
        fd \
        kubectl-${VERSION}-default \
        openssh \
        openssl && \
    rm -rf \
        /root/.cache \
        /tmp/*

USER nonroot
CMD [ "/usr/local/bin/kubectl" ]

LABEL org.opencontainers.image.source="https://github.com/kubernetes/kubectl"
