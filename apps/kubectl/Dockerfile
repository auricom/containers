FROM ghcr.io/onedr0p/kubernetes-kubectl:1.27.1@sha256:2067b52145cdcb99b1db4e92fa114babc0a8a91e08711cbe1aae05ba5a277dd9

USER root

RUN \
  apk add --no-cache --upgrade \
    openssh && \
  rm -rf \
    /root/.cache \
    /tmp/*

USER kah

LABEL org.opencontainers.image.source="https://github.com/kubernetes/kubectl"