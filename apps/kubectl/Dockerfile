FROM ghcr.io/onedr0p/kubernetes-kubectl:1.29.1@sha256:84ba499f1576199f85c9b8da313ef0a31dd65781739b4ea6fa91cba71fa0490c

USER root

RUN \
  apk add --no-cache --upgrade \
    exiftool \
    fd \
    openssh && \
  rm -rf \
    /root/.cache \
    /tmp/*

USER kah

LABEL org.opencontainers.image.source="https://github.com/kubernetes/kubectl"