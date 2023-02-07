FROM ghcr.io/onedr0p/rclone:1.60.1@sha256:05f3674d7a6b029c909f86e1968c17b3a98e710732cee2760d32267ac77147e9

USER root

RUN \
  apk add --no-cache --upgrade \
    age && \
  rm -rf \
    /root/.cache \
    /tmp/*

USER kah

LABEL org.opencontainers.image.source="https://github.com/rclone/rclone"