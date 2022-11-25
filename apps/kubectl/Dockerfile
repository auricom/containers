FROM ghcr.io/onedr0p/kubernetes-kubectl:1.25.4@sha256:0d416e4095a476b900e93c8c818fbb17eda876709e3a00a4a3c7a725e95816ca

USER root

RUN \
  apk add --no-cache --upgrade \
    openssh && \
  rm -rf \
    /root/.cache \
    /tmp/*

USER kah

LABEL org.opencontainers.image.source="https://github.com/kubernetes/kubectl"