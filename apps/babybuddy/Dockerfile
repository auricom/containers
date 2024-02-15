FROM ghcr.io/onedr0p/ubuntu:rolling@sha256:d9363dc90afbd228b02de429c739b1ffeab6b1bc902c80d394717969ec387acf 

ARG VERSION

ENV DJANGO_SETTINGS_MODULE=babybuddy.settings.production

WORKDIR /app

RUN \
  echo "**** install packages ****" && \
  apt-get -qq update && \
  apt-get -qq install -y \
    python3 \
    python3-pip \
    uwsgi \
    uwsgi-plugin-python3 \
    libopenjp2-7-dev \
    libpq-dev && \
  echo "**** install babybuddy ****" && \
  curl -o \
    /tmp/babybuddy.tar.gz -L \
    "https://github.com/babybuddy/babybuddy/archive/refs/tags/v${VERSION}.tar.gz" && \
  mkdir -p /app/www/public && \
  tar xf \
    /tmp/babybuddy.tar.gz -C \
    /app/www/public --strip-components=1 && \
  cd /app/www/public && \
  pip install -U --no-cache-dir \
    pip \
    wheel && \
  pip install -U --no-cache-dir \
    -r requirements.txt && \
  echo "**** symlinks ****" && \
  mkdir -p /config/{data,media}  && \
  rm -rf /app/www/public/{data,media}  && \
  ln -s /config/data /app/www/public/data  && \
  ln -s /config/media /app/www/public/media  && \
  echo "**** cleanup ****" && \
  apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false && \
  apt-get autoremove -y && \
  apt-get clean && \
  rm -rf \
    /tmp/* \
    /var/lib/apt/lists/* \
    /var/tmp/

COPY ./apps/babybuddy/production.py /app/www/public/babybuddy/settings/production.py

RUN \
  chown -R kah:kah /app && \
  chmod -R u=rwX,go=rX /app && \
  printf "umask %d" "${UMASK}" >> /etc/bash.bashrc

USER kah

EXPOSE 3000

COPY ./apps/babybuddy/entrypoint.sh /entrypoint.sh

VOLUME /config

CMD ["/entrypoint.sh"]
