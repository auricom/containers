FROM cgr.dev/chainguard/wolfi-base:latest@sha256:4f12c90f259bd273ed698660bc983053c5f4d2d2617beb0d481d4ec43d7cbbbd

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
