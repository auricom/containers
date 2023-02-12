FROM ghcr.io/onedr0p/rclone:1.60.1@sha256:198014a24af7fd134d9b360c3159930b6731f27680c6f2b93d829727779e8886

USER root

RUN \
  apk add --no-cache --upgrade \
    age && \
  rm -rf \
    /root/.cache \
    /tmp/*

USER kah

LABEL org.opencontainers.image.source="https://github.com/rclone/rclone"