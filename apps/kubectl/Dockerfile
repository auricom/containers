FROM cgr.dev/chainguard/wolfi-base:latest@sha256:c0ead40adeb4b6f55c80c011032a20272e10bde3d745c18bbab7345fccff6791

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
