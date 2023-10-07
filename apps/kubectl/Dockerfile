FROM ghcr.io/onedr0p/kubernetes-kubectl:1.28.2@sha256:965c14a147a5f5a050fc5e67908ac21255e7d9bd2a0b07659818438dde87c02f

USER root

RUN \
  apk add --no-cache --upgrade \
    openssh && \
  rm -rf \
    /root/.cache \
    /tmp/*

USER kah

LABEL org.opencontainers.image.source="https://github.com/kubernetes/kubectl"