FROM ghcr.io/onedr0p/kubernetes-kubectl:1.25.4@sha256:ba26842ad0ad09b368cf5f747a6052b7d5f99d7638462b4ab08288c529866049

USER root

RUN \
  apk add --no-cache --upgrade \
    openssh && \
  rm -rf \
    /root/.cache \
    /tmp/*

USER kah

LABEL org.opencontainers.image.source="https://github.com/kubernetes/kubectl"