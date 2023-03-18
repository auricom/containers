FROM ghcr.io/onedr0p/kubernetes-kubectl:1.26.3@sha256:4dd76f75fc0b465e2cc976570380152c428b5047fd87b5538e16502fb5c8978a

USER root

RUN \
  apk add --no-cache --upgrade \
    openssh && \
  rm -rf \
    /root/.cache \
    /tmp/*

USER kah

LABEL org.opencontainers.image.source="https://github.com/kubernetes/kubectl"