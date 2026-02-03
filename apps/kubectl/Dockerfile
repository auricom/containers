FROM cgr.dev/chainguard/wolfi-base:latest@sha256:2bdab5abde97a1487c667d3ffcc7265fa9abdeb5b2365bca9a64a5f3afc5a563

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
