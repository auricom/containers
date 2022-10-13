FROM ghcr.io/onedr0p/kubernetes-kubectl:1.25.3@sha256:e1f54416c4f8779f748ba4a8d7d48d489b584e8963ee8b84310e19d6e2f0430e

USER root

RUN \
  apk add --no-cache --upgrade \
    openssh && \
  rm -rf \
    /root/.cache \
    /tmp/*

USER kah

LABEL org.opencontainers.image.source="https://github.com/kubernetes/kubectl"