FROM ghcr.io/onedr0p/kubernetes-kubectl:1.28.2@sha256:ec27da3d60e4979e53dcf1a5f36656623b3488c7aa0d88112b0978cce09f43ad

USER root

RUN \
  apk add --no-cache --upgrade \
    openssh && \
  rm -rf \
    /root/.cache \
    /tmp/*

USER kah

LABEL org.opencontainers.image.source="https://github.com/kubernetes/kubectl"