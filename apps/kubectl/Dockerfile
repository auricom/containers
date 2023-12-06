FROM ghcr.io/onedr0p/kubernetes-kubectl:1.28.4@sha256:ec9b134f490f2b41ba63f83afb2aad0d71a1938f61872d88316f5ec57f4f1fcd

USER root

RUN \
  apk add --no-cache --upgrade \
    openssh && \
  rm -rf \
    /root/.cache \
    /tmp/*

USER kah

LABEL org.opencontainers.image.source="https://github.com/kubernetes/kubectl"