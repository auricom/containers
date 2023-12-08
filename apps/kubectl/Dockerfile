FROM ghcr.io/onedr0p/kubernetes-kubectl:1.28.4@sha256:6de857bec9429c3f9fb94fe17bfa8008f7b2d26fc08d671b64e63bff6905c6f8

USER root

RUN \
  apk add --no-cache --upgrade \
    openssh && \
  rm -rf \
    /root/.cache \
    /tmp/*

USER kah

LABEL org.opencontainers.image.source="https://github.com/kubernetes/kubectl"