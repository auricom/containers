FROM ghcr.io/onedr0p/kubernetes-kubectl:1.26.3@sha256:6d18a7a0321da63b7f80bf7d82bf5848656b352db07d4353bde7541546f9e0ea

USER root

RUN \
  apk add --no-cache --upgrade \
    openssh && \
  rm -rf \
    /root/.cache \
    /tmp/*

USER kah

LABEL org.opencontainers.image.source="https://github.com/kubernetes/kubectl"