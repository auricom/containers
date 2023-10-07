FROM ghcr.io/onedr0p/kubernetes-kubectl:1.28.2@sha256:b9fa1b849085ef1ad51236ff2ce2e38a58e07ccb676695a628c47d1831764b8c

USER root

RUN \
  apk add --no-cache --upgrade \
    openssh && \
  rm -rf \
    /root/.cache \
    /tmp/*

USER kah

LABEL org.opencontainers.image.source="https://github.com/kubernetes/kubectl"