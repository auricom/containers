FROM ghcr.io/onedr0p/rclone:1.60.1@sha256:9e7f62528f63fdd398bc25bfd54088a47f0bf086e4887089b8b7ef5e345262ed

USER root

RUN \
  apk add --no-cache --upgrade \
    age && \
  rm -rf \
    /root/.cache \
    /tmp/*

USER kah

LABEL org.opencontainers.image.source="https://github.com/rclone/rclone"