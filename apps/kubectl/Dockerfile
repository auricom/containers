FROM ghcr.io/onedr0p/kubernetes-kubectl:1.28.2@sha256:4867cee96b8acb87cc5069c96abaf46f13818a2edeb0116ea8921eda424e7eda

USER root

RUN \
  apk add --no-cache --upgrade \
    openssh && \
  rm -rf \
    /root/.cache \
    /tmp/*

USER kah

LABEL org.opencontainers.image.source="https://github.com/kubernetes/kubectl"