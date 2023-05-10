FROM ghcr.io/onedr0p/kubernetes-kubectl:1.27.1@sha256:657387a5fedaa4d12b55a4e85d572e21e82d08b7e87e2c084847731ed57a1671

USER root

RUN \
  apk add --no-cache --upgrade \
    openssh && \
  rm -rf \
    /root/.cache \
    /tmp/*

USER kah

LABEL org.opencontainers.image.source="https://github.com/kubernetes/kubectl"