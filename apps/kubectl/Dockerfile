FROM ghcr.io/onedr0p/kubernetes-kubectl:1.25.2@sha256:9d7a9880d59feb6d32c3d29cd5e14b9e76dfb1f086d63929db0ca295a98e5b2e

USER root

RUN \
  apk add --no-cache --upgrade \
    openssh && \
  rm -rf \
    /root/.cache \
    /tmp/*

USER kah

LABEL org.opencontainers.image.source="https://github.com/kubernetes/kubectl"