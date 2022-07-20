FROM ghcr.io/k8s-at-home/kubectl:v1.24.3@sha256:92c52efe8a94a19ffb27f5534f7b000999558fb6908dee5d8b50104590b795a5

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
