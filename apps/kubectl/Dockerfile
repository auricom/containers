FROM ghcr.io/onedr0p/kubernetes-kubectl:1.27.1@sha256:46cd239aaf1797e5333036e41d32febf4e40f554e103f5008ff43387bcb49a57

USER root

RUN \
  apk add --no-cache --upgrade \
    openssh && \
  rm -rf \
    /root/.cache \
    /tmp/*

USER kah

LABEL org.opencontainers.image.source="https://github.com/kubernetes/kubectl"