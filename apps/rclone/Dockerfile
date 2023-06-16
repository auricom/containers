FROM ghcr.io/onedr0p/rclone:1.62.2@sha256:def7013f6a5d74ccfadfbe114547d8ff2d51580d4128aaf212ddb53ddc0004b3

USER root

RUN \
  apk add --no-cache --upgrade \
    age && \
  rm -rf \
    /root/.cache \
    /tmp/*

USER kah

LABEL org.opencontainers.image.source="https://github.com/rclone/rclone"