FROM ghcr.io/onedr0p/kubernetes-kubectl:1.25.4@sha256:8ad5ad035d77f6d2cd0e443575f74244ed65bf7ab1821c0a919801c5213ed814

USER root

RUN \
  apk add --no-cache --upgrade \
    openssh && \
  rm -rf \
    /root/.cache \
    /tmp/*

USER kah

LABEL org.opencontainers.image.source="https://github.com/kubernetes/kubectl"