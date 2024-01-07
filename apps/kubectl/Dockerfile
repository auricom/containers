FROM ghcr.io/onedr0p/kubernetes-kubectl:1.29.0@sha256:e7705753c1a0b8c47e50a045f6aef50415949771be110adcfb137b33609c2921

USER root

RUN \
  apk add --no-cache --upgrade \
    openssh && \
  rm -rf \
    /root/.cache \
    /tmp/*

USER kah

LABEL org.opencontainers.image.source="https://github.com/kubernetes/kubectl"