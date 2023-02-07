FROM ghcr.io/onedr0p/kubernetes-kubectl:1.26.1@sha256:012f5097389a5e6b2a8c8c6be60cec5a0651fadc650881f82881f434eb14c84a

USER root

RUN \
  apk add --no-cache --upgrade \
    openssh && \
  rm -rf \
    /root/.cache \
    /tmp/*

USER kah

LABEL org.opencontainers.image.source="https://github.com/kubernetes/kubectl"