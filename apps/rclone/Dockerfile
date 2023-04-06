FROM ghcr.io/onedr0p/rclone:1.60.1@sha256:b52ba4b468a26291e231bf7afa2770e26ed784969e494f604bbafd0a6458fc6c

USER root

RUN \
  apk add --no-cache --upgrade \
    age && \
  rm -rf \
    /root/.cache \
    /tmp/*

USER kah

LABEL org.opencontainers.image.source="https://github.com/rclone/rclone"