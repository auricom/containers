FROM ghcr.io/onedr0p/kubernetes-kubectl:1.28.2@sha256:87b2a4ea4dd9bc5666f260e07949456883aedc7e8d16fab396e92a27197c8ed2

USER root

RUN \
  apk add --no-cache --upgrade \
    openssh && \
  rm -rf \
    /root/.cache \
    /tmp/*

USER kah

LABEL org.opencontainers.image.source="https://github.com/kubernetes/kubectl"