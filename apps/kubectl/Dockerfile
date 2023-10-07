FROM ghcr.io/onedr0p/kubernetes-kubectl:1.28.2@sha256:cdee76a059c4d2123ef3fe708d261888652dcfb193593c33ee6082ad8e2fc2bc

USER root

RUN \
  apk add --no-cache --upgrade \
    openssh && \
  rm -rf \
    /root/.cache \
    /tmp/*

USER kah

LABEL org.opencontainers.image.source="https://github.com/kubernetes/kubectl"