FROM ghcr.io/onedr0p/kubernetes-kubectl:1.28.2@sha256:15ef6d9e59f961fddac83e8f6b6a2201a5136cf8c509f41b7e5563525f8125e0

USER root

RUN \
  apk add --no-cache --upgrade \
    openssh && \
  rm -rf \
    /root/.cache \
    /tmp/*

USER kah

LABEL org.opencontainers.image.source="https://github.com/kubernetes/kubectl"