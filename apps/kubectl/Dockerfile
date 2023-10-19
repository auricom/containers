FROM ghcr.io/onedr0p/kubernetes-kubectl:1.28.3@sha256:6b68063623c22be538727998ccc1bf0433ea71c7a73f73e3f2250896a390901a

USER root

RUN \
  apk add --no-cache --upgrade \
    openssh && \
  rm -rf \
    /root/.cache \
    /tmp/*

USER kah

LABEL org.opencontainers.image.source="https://github.com/kubernetes/kubectl"