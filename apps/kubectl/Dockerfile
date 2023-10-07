FROM ghcr.io/onedr0p/kubernetes-kubectl:1.28.2@sha256:d53b64e663d8bde3615007210b728653372c8e31b75ed9b82d6a63de3d662d39

USER root

RUN \
  apk add --no-cache --upgrade \
    openssh && \
  rm -rf \
    /root/.cache \
    /tmp/*

USER kah

LABEL org.opencontainers.image.source="https://github.com/kubernetes/kubectl"