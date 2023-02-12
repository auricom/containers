FROM ghcr.io/onedr0p/kubernetes-kubectl:1.26.1@sha256:b3c111e0eca603f3e3f638a713669f7b2c64e8eb58ba5937632a7c2a2b58f51c

USER root

RUN \
  apk add --no-cache --upgrade \
    openssh && \
  rm -rf \
    /root/.cache \
    /tmp/*

USER kah

LABEL org.opencontainers.image.source="https://github.com/kubernetes/kubectl"