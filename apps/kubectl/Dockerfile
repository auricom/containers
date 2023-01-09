FROM ghcr.io/onedr0p/kubernetes-kubectl:1.26.0@sha256:0e4be5e6ba3dbb0f12896796da78988136460bb6f027d79e51300a19a021c92a

USER root

RUN \
  apk add --no-cache --upgrade \
    openssh && \
  rm -rf \
    /root/.cache \
    /tmp/*

USER kah

LABEL org.opencontainers.image.source="https://github.com/kubernetes/kubectl"