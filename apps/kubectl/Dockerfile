FROM ghcr.io/onedr0p/kubernetes-kubectl:1.28.2@sha256:b01e9921d75241962a4d84dadf95547cd6b7f90d18c460529cc1250f7cf3ff54

USER root

RUN \
  apk add --no-cache --upgrade \
    openssh && \
  rm -rf \
    /root/.cache \
    /tmp/*

USER kah

LABEL org.opencontainers.image.source="https://github.com/kubernetes/kubectl"