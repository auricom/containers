FROM ghcr.io/onedr0p/kubernetes-kubectl:1.27.2@sha256:86255d3ed5d85686d59444f5fc042bf56bf434c3ad4efe04f532c36326791243

USER root

RUN \
  apk add --no-cache --upgrade \
    openssh && \
  rm -rf \
    /root/.cache \
    /tmp/*

USER kah

LABEL org.opencontainers.image.source="https://github.com/kubernetes/kubectl"