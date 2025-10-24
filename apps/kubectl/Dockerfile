FROM cgr.dev/chainguard/wolfi-base:latest@sha256:c47abf97153fcba9af42ad9b3627c9db4e5fc0d87bc5e191cbd8f0e9c43616a2

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
