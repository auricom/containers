FROM ghcr.io/onedr0p/kubernetes-kubectl:1.28.4@sha256:7039783f8ecb83acf0f5359ec7aa901f6e73af1c76470e7317caf19f7514fedd

USER root

RUN \
  apk add --no-cache --upgrade \
    openssh && \
  rm -rf \
    /root/.cache \
    /tmp/*

USER kah

LABEL org.opencontainers.image.source="https://github.com/kubernetes/kubectl"