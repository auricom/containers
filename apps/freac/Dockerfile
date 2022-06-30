FROM ghcr.io/k8s-at-home/ubuntu-jammy:rolling@sha256:fdbafba13f7ed147d6f95ab5269ddaa7f17395e226f1bbc25381de4c6671442f

ARG VERSION
USER root

WORKDIR /app


RUN \
  curl --silent --location https://github.com/enzo1982/freac/releases/download/v${VERSION}/freac-${VERSION}-linux-x86_64.AppImage --output /app/freac.AppImage; \
  chmod a+x freac.AppImage; \
  ./freac.AppImage --appimage-extract

RUN \
  apt-get -qq update \
  && \
  apt-get -qq install -y fd-find nfs-common libgtk-3-0 imagemagick rsync \
  && rm freac.AppImage; mv squashfs-root/* ./; rm -rf squashfs-root \
  && apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false \
  && apt-get autoremove -y \
  && apt-get clean \
  && \
  rm -rf \
    /tmp/* \
    /var/lib/apt/lists/* \
    /var/tmp/ \
  && chown -R kah:kah /app \
  && chmod -R u=rwX,go=rX /app \
  && printf "umask %d" "${UMASK}" >> /etc/bash.bashrc

LABEL \
  org.opencontainers.image.title="freac" \
  org.opencontainers.image.description="fre:ac command line for k8s" \
  org.opencontainers.image.source="https://github.com/enzo1982/freac" \
  org.opencontainers.image.version="${VERSION}"

USER kah