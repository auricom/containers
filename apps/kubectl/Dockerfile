FROM ghcr.io/k8s-at-home/kubectl:v1.25.0@sha256:8d21a039342d0e87f456dc25dfb5b4d4ded4452c87aee82de82b77dca7629a31

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
