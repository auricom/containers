# trunk-ignore-all(checkov/CKV_DOCKER_2)
FROM ubuntu:rolling@sha256:10bb10bb062de665d4dc3e0ea36715270ead632cfcb74d08ca2273712a0dfb42

ARG VERSION
USER root

WORKDIR /app


# trunk-ignore(hadolint/DL3008)
RUN \
  apt-get -qq update && \
  apt-get -qq install --no-install-recommends -y fd-find nfs-common libgtk-3-0 imagemagick rsync ca-certificates parallel wget && \
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
  chown -R ubuntu:ubuntu /app && \
  chmod -R u=rwX,go=rX /app && \
  printf "umask %d" "${UMASK}" >> /etc/bash.bashrc

LABEL \
  org.opencontainers.image.title="freac" \
  org.opencontainers.image.description="fre:ac command line for k8s" \
  org.opencontainers.image.source="https://github.com/enzo1982/freac" \
  org.opencontainers.image.version="${VERSION}"

USER ubuntu
