FROM cgr.dev/chainguard/wolfi-base:latest@sha256:815b27b8a70713c70404e44a718eddd52ea6f4a2bfad5f56455b52cd2789a9b2

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
