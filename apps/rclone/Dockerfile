FROM ghcr.io/onedr0p/rclone:1.62.2@sha256:6f39624a9d012af2cbd471dc9c3617e42fadb016d4cb4716d6dbeee1e3d95b76

USER root

RUN \
  apk add --no-cache --upgrade \
    age && \
  rm -rf \
    /root/.cache \
    /tmp/*

USER kah

LABEL org.opencontainers.image.source="https://github.com/rclone/rclone"