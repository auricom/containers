FROM cgr.dev/chainguard/wolfi-base:latest@sha256:50c61090df44477ef4a9dcf318f788b9ba82510c11de3ea4ec07ef5cdeb2acaa

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
