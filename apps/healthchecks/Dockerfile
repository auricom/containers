FROM ghcr.io/onedr0p/alpine:rolling@sha256:c3323a3704b6770d02d838e8ab6a1692f9a676a21e5f0dc6d34df32e4fce6d57

ARG VERSION

USER root

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

RUN \
  apk add --no-cache --upgrade \
    mariadb-client \
    postgresql-client \
    python3 \
    uwsgi \
    uwsgi-python \
    mariadb-connector-c-dev

RUN \
  curl -o \
    /tmp/app.tar.gz -L \
    "https://github.com/healthchecks/healthchecks/archive/v${VERSION}.tar.gz" && \
  tar xf \
    /tmp/app.tar.gz -C \
    /app --strip-components=1 && \
  chown -R kah:kah /app && \
  chmod -R 755 /app && \
  rm -rf /tmp/*

RUN \
  apk add --no-cache --upgrade --virtual .build-deps \
    cargo \
    curl \
    curl-dev \
    gcc \
    jpeg-dev \
    libffi-dev \
    mariadb-dev \
    musl-dev \
    postgresql-dev \
    python3-dev \
    zlib-dev && \
  python3 -m ensurepip && \
  rm -rf /usr/lib/python*/ensurepip && \
  cd /app && \
  pip3 install \
    apprise \
    mysqlclient \
    wheel && \
  pip3 install --no-cache-dir --find-links https://wheel-index.linuxserver.io/alpine/ -r requirements.txt && \
  apk del --purge .build-deps && \
  rm -rf \
    /root/.cache \
    /root/.cargo \
    /tmp/*

USER kah
COPY ./apps/healthchecks/entrypoint.sh /entrypoint.sh
COPY ./apps/healthchecks/uwsgi.ini /app/uwsgi.ini
CMD ["/entrypoint.sh"]

LABEL org.opencontainers.image.source="https://github.com/healthchecks/healthchecks"
