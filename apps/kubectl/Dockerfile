FROM ghcr.io/onedr0p/kubernetes-kubectl:1.25.4@sha256:24a91a058c534b10881f0bbbf0d0829aaf2b5761e4ff56b7b75179977e1798ea

USER root

RUN \
  apk add --no-cache --upgrade \
    openssh && \
  rm -rf \
    /root/.cache \
    /tmp/*

USER kah

LABEL org.opencontainers.image.source="https://github.com/kubernetes/kubectl"