FROM ghcr.io/onedr0p/kubernetes-kubectl:1.26.1@sha256:c85224928b2e384e63bd8c9ba89753dd3d1cd9c178350d83efa3182b480c31a0

USER root

RUN \
  apk add --no-cache --upgrade \
    openssh && \
  rm -rf \
    /root/.cache \
    /tmp/*

USER kah

LABEL org.opencontainers.image.source="https://github.com/kubernetes/kubectl"