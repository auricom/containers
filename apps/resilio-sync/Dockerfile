FROM ghcr.io/onedr0p/ubuntu:rolling@sha256:a79a3386914dfdf37d4d03173ab8bba51512305b3863ab178f2520ef27981083 

ARG VERSION

WORKDIR /app

RUN \
  apt-get -qq update && \
  apt-get -qq install -y gnupg && \
  echo "deb http://linux-packages.resilio.com/resilio-sync/deb resilio-sync non-free" | tee /etc/apt/sources.list.d/resilio-sync.list && \
  curl --location https://linux-packages.resilio.com/resilio-sync/key.asc | apt-key add && \
  apt-get -qq update && \
  apt-get install -y --no-install-recommends \
    resilio-sync=${VERSION}

RUN \
  apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false && \
  apt-get autoremove -y && \
  apt-get clean && \
  rm -rf \
    /tmp/* \
    /var/lib/apt/lists/* \
    /var/tmp/ && \
  chown -R kah:kah /app && \
  chmod -R u=rwX,go=rX /app && \
  printf "umask %d" "${UMASK}" >> /etc/bash.bashrc

USER kah

COPY ./apps/resilio-sync/sync.conf /config/sync.conf
COPY ./apps/resilio-sync/entrypoint.sh /entrypoint.sh

CMD ["/entrypoint.sh"]
