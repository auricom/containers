FROM cgr.dev/chainguard/wolfi-base:latest@sha256:eeb70e74e2ac07d3c80a30150bf473970c8b51a57f06daef3e4d065ac52489bc

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
