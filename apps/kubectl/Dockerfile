FROM ghcr.io/onedr0p/kubernetes-kubectl:1.26.3@sha256:e0607ef3a8d8347e715fdf1b087160bde7cc496fa051deba5aa7484903c61276

USER root

RUN \
  apk add --no-cache --upgrade \
    openssh && \
  rm -rf \
    /root/.cache \
    /tmp/*

USER kah

LABEL org.opencontainers.image.source="https://github.com/kubernetes/kubectl"