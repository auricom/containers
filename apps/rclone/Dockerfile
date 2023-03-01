FROM ghcr.io/onedr0p/rclone:1.60.1@sha256:911ad5c372f77dbb98bc54de17af7ad4837933b37107530bf04fb1266de6a185

USER root

RUN \
  apk add --no-cache --upgrade \
    age && \
  rm -rf \
    /root/.cache \
    /tmp/*

USER kah

LABEL org.opencontainers.image.source="https://github.com/rclone/rclone"