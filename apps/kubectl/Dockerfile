FROM ghcr.io/onedr0p/kubernetes-kubectl:1.29.2@sha256:6324f99979877f3ded7647f4efa4df6d73f11bb9d8302dc81ab4a5d38e406867

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