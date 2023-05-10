FROM ghcr.io/onedr0p/rclone:1.62.2@sha256:079049001bd5a072b0d52ace8b7ab605bb37e33bbc7298abcfeed6a6c01e1de4

USER root

RUN \
  apk add --no-cache --upgrade \
    age && \
  rm -rf \
    /root/.cache \
    /tmp/*

USER kah

LABEL org.opencontainers.image.source="https://github.com/rclone/rclone"