FROM ghcr.io/onedr0p/kubernetes-kubectl:1.26.1@sha256:7712b186022277af86d9a8518e45a69f00961674a0b26a8b2446c3a206a710b6

USER root

RUN \
  apk add --no-cache --upgrade \
    openssh && \
  rm -rf \
    /root/.cache \
    /tmp/*

USER kah

LABEL org.opencontainers.image.source="https://github.com/kubernetes/kubectl"