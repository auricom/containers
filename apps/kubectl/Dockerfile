FROM ghcr.io/onedr0p/kubernetes-kubectl:1.28.1@sha256:e2d3f49bcda7824cb182da0c79aa65596d5d3be2cc77512d0ddb5458cf3f2413

USER root

RUN \
  apk add --no-cache --upgrade \
    openssh && \
  rm -rf \
    /root/.cache \
    /tmp/*

USER kah

LABEL org.opencontainers.image.source="https://github.com/kubernetes/kubectl"