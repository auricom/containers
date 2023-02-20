FROM ghcr.io/onedr0p/rclone:1.60.1@sha256:756dc0fda2f879a862f9e7a57f7d092edc0c46b1d6dc6b6b204b4fb567862759

USER root

RUN \
  apk add --no-cache --upgrade \
    age && \
  rm -rf \
    /root/.cache \
    /tmp/*

USER kah

LABEL org.opencontainers.image.source="https://github.com/rclone/rclone"