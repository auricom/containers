FROM ghcr.io/onedr0p/kubernetes-kubectl:1.29.1@sha256:ec66e81a2459c2e326dbc17c9f310148458e122c3277728c6492b4b4b616b020

USER root

RUN \
  apk add --no-cache --upgrade \
    openssh && \
  rm -rf \
    /root/.cache \
    /tmp/*

USER kah

LABEL org.opencontainers.image.source="https://github.com/kubernetes/kubectl"