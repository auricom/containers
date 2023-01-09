FROM ghcr.io/onedr0p/rclone:1.60.1@sha256:93000aa78eb8057c9c02aa5c294d086129c4966f12bc732467deccb0f282e736

USER root

RUN \
  apk add --no-cache --upgrade \
    age && \
  rm -rf \
    /root/.cache \
    /tmp/*

USER kah

LABEL org.opencontainers.image.source="https://github.com/rclone/rclone"