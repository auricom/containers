FROM ghcr.io/onedr0p/kubernetes-kubectl:1.25.3@sha256:4474b5fd0336c5d946216f63389342eef7871f9cbba42b50bb406496528c20d8

USER root

RUN \
  apk add --no-cache --upgrade \
    openssh && \
  rm -rf \
    /root/.cache \
    /tmp/*

USER kah

LABEL org.opencontainers.image.source="https://github.com/kubernetes/kubectl"