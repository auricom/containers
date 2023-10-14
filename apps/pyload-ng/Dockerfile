FROM ghcr.io/onedr0p/alpine:rolling@sha256:b0b6f6f42bf9649ccaf0e98cd74d5e123471e2c4a4db4a5ee417b18dde9973a9

ARG VERSION

USER root

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

RUN \
  apk add --no-cache --upgrade \
    curl \
    ffmpeg \
    libjpeg-turbo \
    p7zip \
    py3-pip \
    python3 \
    sqlite \
    tesseract-ocr

RUN \
  apk add --no-cache --upgrade --virtual .build-deps \
    build-base \
    cargo \
    curl-dev \
    libffi-dev \
    libjpeg-turbo-dev \
    openssl-dev \
    python3-dev \
    zlib-dev && \
  python3 -m ensurepip && \
  rm -rf /usr/lib/python*/ensurepip && \
  pip3 install \
    setuptools \
    wheel && \
  PACKAGE="pyload-ng[all]==${VERSION/-/}" && \
  pip3 install --no-cache-dir --find-links https://wheel-index.linuxserver.io/alpine/ ${PACKAGE} && \
  chown -R kah:kah /config && \
  chmod -R u=rwX,go=rX /config && \
  apk del --purge .build-deps && \
  rm -rf \
    /root/.cache \
    /root/.cargo \
    /tmp/*

USER kah

COPY ./apps/pyload-ng/entrypoint.sh /entrypoint.sh

CMD ["/entrypoint.sh"]

EXPOSE 8000

VOLUME /config
VOLUME /downloads

LABEL org.opencontainers.image.source="https://github.com/pyload/pyload"