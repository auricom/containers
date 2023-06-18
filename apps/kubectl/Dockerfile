FROM ghcr.io/onedr0p/kubernetes-kubectl:1.27.3@sha256:fcc5372b0e1e3d51c0d3a95282fdfd80aeb389aa4077fd430276c511857313cf

USER root

RUN \
  apk add --no-cache --upgrade \
    openssh && \
  rm -rf \
    /root/.cache \
    /tmp/*

USER kah

LABEL org.opencontainers.image.source="https://github.com/kubernetes/kubectl"