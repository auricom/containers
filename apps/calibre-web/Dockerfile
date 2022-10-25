FROM ghcr.io/onedr0p/ubuntu:rolling@sha256:e32a43e70fc5e64ed9ba9be51541ca7255e377bcb42c69d389cb35a849c1eb39 

ARG VERSION

WORKDIR /app

RUN \
  apt-get -qq update && \
  apt-get -qq install -y \
    build-essential \
    git \
    libldap2-dev \
    libsasl2-dev \
    python3-dev \
    python3-pip \
    imagemagick \
    libnss3 \
    libxcomposite1 \
    libxi6 \
    libxslt1.1 \
    libldap-2.4-2 \
    libsasl2-2 \
    libxrandr2 \
    python3-minimal \
    python3-pkg-resources \
    unrar \
  && \
  curl --silent --location https://github.com/janeczku/calibre-web/archive/${VERSION}.tar.gz --output /tmp/calibre-web.tar.gz && \
  tar xf /tmp/calibre-web.tar.gz -C /app --strip-components=1 && \
  cd /app && \
  pip3 install --no-cache-dir -U pip && \
  pip install --no-cache-dir -U --ignore-installed --find-links https://wheel-index.linuxserver.io/ubuntu/ -r requirements.txt -r optional-requirements.txt && \
  rm -rf /tmp/calibre-web.tar.gz


RUN \
  KEPUBIFY_VERSION=$(curl -sX GET "https://api.github.com/repos/pgaskin/kepubify/releases/latest" | jq --raw-output '.tag_name') && \
  curl --silent --location https://github.com/pgaskin/kepubify/releases/download/${KEPUBIFY_VERSION}/kepubify-linux-64bit --output /usr/bin/kepubify && \
  chmod +x /usr/bin/kepubify

RUN \
  apt-get purge -y \
    git \
    python3-dev \
    libldap2-dev \
    libsasl2-dev \
    python3-pip \
    build-essential \
  && \
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

COPY ./apps/calibre-web/imagemagick-policy.xml /etc/ImageMagick-6/policy.xml
COPY ./apps/calibre-web/app.db /app/app.db
COPY ./apps/calibre-web/entrypoint.sh /entrypoint.sh

USER kah

CMD ["/entrypoint.sh"]
