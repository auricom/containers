FROM ubuntu:rolling

ARG VERSION

ENV NVM_DIR /app/.nvm
ENV WOOB_GIT true

WORKDIR /app

COPY ./apps/kresus/requirements.txt /tmp

RUN \
  echo "**** install packages ****" && \
  apt-get -qq update && \
  apt-get -qq install -y --no-install-recommends \
    locales \
    python3 \
    python3-pip \
    mupdf-tools \
    libnss3-tools \
    python3-nss \
    rustc \
    git \
    build-essential && \
  pip install --upgrade --no-cache-dir \
    pip \
    setuptools && \
  pip install --no-cache-dir --trusted-host pypi.python.org -r /tmp/requirements.txt && \
  locale-gen C.UTF-8 && \
  update-locale C.UTF-8 && \
  echo "**** install woob from git ****" && \
  if [ $WOOB_GIT = "true" ]; then mkdir /woob && git clone --depth 1 https://gitlab.com/woob/woob.git /woob ; fi && \
  echo "**** install node.js ****" && \
  mkdir -p ${NVM_DIR} && \
  NODE_VERSION=$(curl -s https://nodejs.org/dist/index.json | jq -r '.[] | select(.lts) | .version' | sort -V | tail -n 1) && \
  NODE_VERSION="${NODE_VERSION#*v}" && \
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | bash && \
  . "$NVM_DIR/nvm.sh" && nvm install ${NODE_VERSION} && \
  . "$NVM_DIR/nvm.sh" && nvm use v${NODE_VERSION} && \
  . "$NVM_DIR/nvm.sh" && nvm alias default v${NODE_VERSION} && \
  $NVM_DIR/versions/node/v$NODE_VERSION/bin/npm install --global yarn && \
  ln -s $(which node) /usr/bin/node && \
  npm explore npm -g -- npm install node-gyp@latest && \
  echo "**** install kresus ****" && \
    yarn global add kresus@${VERSION} --prefix /app/kresus --production  && \
  echo "**** cleanup ****" && \
  apt-get purge -y python3-pip rustc git build-essential && \
  apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false && \
  apt-get autoremove -y && \
  apt-get clean && \
  rm -rf \
    /tmp/* \
    /var/lib/apt/lists/* \
    /var/tmp/

ENV NODE_PATH $NVM_DIR/versions/node/$NODE_VERSION/bin
ENV PATH $NODE_PATH:$PATH

RUN \
  chown -R ubuntu:ubuntu /app /config && \
  chmod -R u=rwX,go=rX /app /config && \
  printf "umask %d" "${UMASK}" >> /etc/bash.bashrc

USER ubuntu

EXPOSE 9876

COPY ./apps/kresus/entrypoint.sh /entrypoint.sh

VOLUME /config

CMD ["/entrypoint.sh"]
