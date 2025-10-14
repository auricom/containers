FROM cgr.dev/chainguard/wolfi-base:latest@sha256:602525a5e85f0b3a6196dd5a47b8e91a1f0f89d7bd3223b2dce54a6b36e2b1ef

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
