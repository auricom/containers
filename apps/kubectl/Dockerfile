FROM ghcr.io/onedr0p/kubernetes-kubectl:1.28.2@sha256:123741e0ff2d48184d2fcfc88f09be8fb0a1508fc69df0708bc927d57cff3156

USER root

RUN \
  apk add --no-cache --upgrade \
    openssh && \
  rm -rf \
    /root/.cache \
    /tmp/*

USER kah

LABEL org.opencontainers.image.source="https://github.com/kubernetes/kubectl"