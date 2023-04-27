FROM ghcr.io/onedr0p/kubernetes-kubectl:1.27.1@sha256:c879fa55fa664ef27c6952f3e35490e91fefa03e9098e839ed1aed8038af4abe

USER root

RUN \
  apk add --no-cache --upgrade \
    openssh && \
  rm -rf \
    /root/.cache \
    /tmp/*

USER kah

LABEL org.opencontainers.image.source="https://github.com/kubernetes/kubectl"