FROM ghcr.io/onedr0p/kubernetes-kubectl:1.26.0@sha256:6ee3353da3495bc99d73af29a4495bb95570e31e71579cfce719c4123882723d

USER root

RUN \
  apk add --no-cache --upgrade \
    openssh && \
  rm -rf \
    /root/.cache \
    /tmp/*

USER kah

LABEL org.opencontainers.image.source="https://github.com/kubernetes/kubectl"