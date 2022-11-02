FROM ghcr.io/onedr0p/kubernetes-kubectl:1.25.3@sha256:c6acda21cdc7a479e25b41660e8c5a955dc036b9234a6747f9912a979a674e57

USER root

RUN \
  apk add --no-cache --upgrade \
    openssh && \
  rm -rf \
    /root/.cache \
    /tmp/*

USER kah

LABEL org.opencontainers.image.source="https://github.com/kubernetes/kubectl"