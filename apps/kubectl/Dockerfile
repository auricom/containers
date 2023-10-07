FROM ghcr.io/onedr0p/kubernetes-kubectl:1.28.2@sha256:cf752690ed76237c6cac12c623662df6c2f8836f411af02ac09e652371724f28

USER root

RUN \
  apk add --no-cache --upgrade \
    openssh && \
  rm -rf \
    /root/.cache \
    /tmp/*

USER kah

LABEL org.opencontainers.image.source="https://github.com/kubernetes/kubectl"