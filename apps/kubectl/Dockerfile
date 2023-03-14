FROM ghcr.io/onedr0p/kubernetes-kubectl:1.26.2@sha256:ac57906914821d74d65f880984c1af869a0bb33758d0701f227cf294e3665de5

USER root

RUN \
  apk add --no-cache --upgrade \
    openssh && \
  rm -rf \
    /root/.cache \
    /tmp/*

USER kah

LABEL org.opencontainers.image.source="https://github.com/kubernetes/kubectl"