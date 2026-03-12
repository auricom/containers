FROM cgr.dev/chainguard/wolfi-base:latest@sha256:8f4bb89aa9962e60d9e975d229624a29e81185db286f796e87ed0f7333c1b69e

ENV MISE_INSTALL_PATH=/usr/local/bin/mise

# renovate: datasource=github-releases depName=charmbracelet/gum
ENV GUM_VERSION=v0.17.0

# renovate: datasource=github-releases depName=charmbracelet/gum
ENV MISE_VERSION=v2026.3.2

ENV MISE_DATA_DIR="/mise"
ENV MISE_CONFIG_DIR="/mise"
ENV MISE_CACHE_DIR="/mise/cache"
ENV MISE_STATE_DIR="/mise/state"
ENV MISE_INSTALL_PATH="/usr/local/bin/mise"
ENV PATH="/mise/shims:$PATH"

USER root

RUN \
    apk add --no-cache --upgrade \
        bash \
        curl \
        exiftool \
        git \
        openssh \
        openssl

RUN \
    # Download Mise
    mkdir -p /usr/local/bin /mise && \
    curl -L https://github.com/jdx/mise/releases/download/${MISE_VERSION}/mise-${MISE_VERSION}-linux-x64 > /usr/local/bin/mise  && \
    chmod +x /usr/local/bin/mise \
    && \
    # Download gum binary
    curl --silent --location https://github.com/charmbracelet/gum/releases/download/${GUM_VERSION}/gum_${GUM_VERSION#v}_Linux_x86_64.tar.gz --output /tmp/gum.tar.gz && \
    mkdir -p /tmp/gum_extract && \
    tar -xzf /tmp/gum.tar.gz -C /tmp/gum_extract && \
    find /tmp/gum_extract -name 'gum' -type f -exec install -m 755 {} /usr/local/bin/gum \; \
    && \
    chown -R nonroot:nonroot /mise && \
    rm -rf \
        /root/.cache \
        /tmp/*

USER nonroot

WORKDIR /home/nonroot

COPY apps/toolbox/mise.toml .
COPY apps/toolbox/requirements.txt .

RUN \
    mise use --pin --yes \
        age \
        fd \
        gh \
        kubectl \
        python \
        rclone \
        uv && \
    mise run dependencies && \
    rm mise.toml requirements.txt
