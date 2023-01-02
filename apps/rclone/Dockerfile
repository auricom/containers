FROM ghcr.io/onedr0p/rclone:1.60.1@sha256:44adc9380cd35500ddc1f5f3acb3c1745b30e65b683a5e4fbf1fea2512dd1c04

USER root

RUN \
  apk add --no-cache --upgrade \
    age && \
  rm -rf \
    /root/.cache \
    /tmp/*

USER kah

LABEL org.opencontainers.image.source="https://github.com/rclone/rclone"