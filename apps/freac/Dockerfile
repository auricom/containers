FROM ghcr.io/onedr0p/ubuntu:rolling@sha256:48749b7c9c25fe711391ad43cf8c20e3acce61b94d020d7e8b286a7755e3240b 

ARG VERSION
USER root

WORKDIR /app


RUN \
  apt-get -qq update && \
  apt-get -qq install -y fd-find nfs-common libgtk-3-0 imagemagick rsync && \
  curl --silent --location https://github.com/enzo1982/freac/releases/download/v${VERSION}/freac-${VERSION}-linux-x86_64.AppImage --output /app/freac.AppImage && \
  chmod a+x /app/freac.AppImage && \
  /app/freac.AppImage --appimage-extract && \
  rm /app/freac.AppImage && \
  mv squashfs-root/* ./ &&\
  rm -rf squashfs-root

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

RUN groupmod -g 1000 kah && usermod -u 1000 -g 1000 kah

LABEL \
  org.opencontainers.image.title="freac" \
  org.opencontainers.image.description="fre:ac command line for k8s" \
  org.opencontainers.image.source="https://github.com/enzo1982/freac" \
  org.opencontainers.image.version="${VERSION}"

USER kah