FROM ghcr.io/onedr0p/kubernetes-kubectl:1.27.4@sha256:00a2d149524ec73f877e66032378209c6d8b700c78f371a3f0d4feed39008689

USER root

RUN \
  apk add --no-cache --upgrade \
    openssh && \
  rm -rf \
    /root/.cache \
    /tmp/*

USER kah

LABEL org.opencontainers.image.source="https://github.com/kubernetes/kubectl"