FROM ghcr.io/onedr0p/kubernetes-kubectl:1.28.2@sha256:2120f3c6e9f3b9c12671bedd7b342a06c77d25d7867f69f517731c93e73d2ee6

USER root

RUN \
  apk add --no-cache --upgrade \
    openssh && \
  rm -rf \
    /root/.cache \
    /tmp/*

USER kah

LABEL org.opencontainers.image.source="https://github.com/kubernetes/kubectl"