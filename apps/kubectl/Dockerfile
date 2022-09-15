FROM ghcr.io/onedr0p/kubernetes-kubectl:1.25.1@sha256:15db7764acb67a55dcf5977ef5d8c145f6d2ce830c9065a7e5223f7564246c80

USER root

RUN \
  apk add --no-cache --upgrade \
    openssh && \
  rm -rf \
    /root/.cache \
    /tmp/*

USER kah

LABEL org.opencontainers.image.source="https://github.com/kubernetes/kubectl"