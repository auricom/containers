FROM ghcr.io/k8s-at-home/kubectl:v1.24.1@sha256:908fa0166aa250e0d70716fc7694623173a49681281697c8cedb5d29eeb2c540

RUN \
  apt-get -qq update \
  && \
  apt-get -qq install -y \
  openssh-client \
  && apt-get clean \
  && \
  rm -rf \
    /tmp/* \
    /var/lib/apt/lists/* \
    /var/tmp/

LABEL \
  org.opencontainers.image.title="kubectl" \
  org.opencontainers.image.description="kubectl for k8s jobs" \
  org.opencontainers.image.source="https://github.com/k8s-at-home/container-images/blob/main/apps/kubectl" \
  org.opencontainers.image.version="${VERSION}"
