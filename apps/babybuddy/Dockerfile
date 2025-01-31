FROM cgr.dev/chainguard/wolfi-base:latest@sha256:1ec3327af43d7af231ffe475aff88d49dbb5e09af9f28610e6afbd2cb096e751
ARG VERSION
ENV DJANGO_SETTINGS_MODULE=babybuddy.settings.production
WORKDIR /app
RUN \
  apk update && \
  apk add --no-cache \
    bash \
    libpq \
    gcc \
    glibc-dev \
    openjpeg-dev \
    python3-dev \
    python3 \
    py3-pip \
    tini \
    wget && \
  wget --quiet --output-document /tmp/babybuddy.tar.gz \
  https://github.com/babybuddy/babybuddy/archive/refs/tags/v${VERSION}.tar.gz && \
  mkdir -p /app/www/public && \
  tar xf \
    /tmp/babybuddy.tar.gz -C \
    /app/www/public --strip-components=1 && \
  cd /app/www/public && \
  pip install -U --no-cache-dir \
    pip \
    tzdata \
    uwsgi \
    wheel && \
  pip install -U --no-cache-dir \
    -r requirements.txt && \
  mkdir -p /config/{data,media}  && \
  rm -rf /app/www/public/{data,media}  && \
  ln -s /config/data /app/www/public/data  && \
  ln -s /config/media /app/www/public/media  && \
  apk del \
    libpq \
    gcc \
    glibc-dev \
    openjpeg-dev \
    python3-dev
COPY ./apps/babybuddy/production.py /app/www/public/babybuddy/settings/production.py
COPY ./apps/babybuddy/entrypoint.sh /entrypoint.sh
RUN \
  chown -R nonroot:nonroot /app && \
  chmod -R u=rwX,go=rX /app
USER nonroot
EXPOSE 3000
VOLUME /config
CMD ["/entrypoint.sh"]
