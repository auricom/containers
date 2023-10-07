FROM ghcr.io/onedr0p/ubuntu:rolling@sha256:392227c1edbbb884f10686a837db2eaaeef5ff1379a8645214e5c0fb1e6c7590 

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
