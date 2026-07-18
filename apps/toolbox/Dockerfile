FROM cgr.dev/chainguard/wolfi-base:latest@sha256:02dab76bd852a70556b5b2002195c8a5fdab77d323c433bf6642aab080489795

ENV MISE_INSTALL_PATH=/usr/local/bin/mise

# renovate: datasource=github-releases depName=charmbracelet/gum
ENV GUM_VERSION=v0.17.0

# renovate: datasource=github-releases depName=jdx/mise
ENV MISE_VERSION=v2026.7.7

ENV VIRTUAL_ENV="/home/nonroot/.venv"
ENV MISE_DATA_DIR="/mise"
ENV MISE_CONFIG_DIR="/mise"
ENV MISE_CACHE_DIR="/mise/cache"
ENV MISE_STATE_DIR="/mise/state"
ENV MISE_INSTALL_PATH="/usr/local/bin/mise"
ENV PATH="/home/nonroot/.venv/bin:/mise/shims:$PATH"

USER root

RUN \
    apk add --no-cache --upgrade \
        bash \
        curl \
        exiftool \
        git \
        openssh \
        openssl \
        python3

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
    chown -R nonroot:nonroot /home/nonroot /mise && \
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
        rclone \
        uv && \
    mise run dependencies && \
    rm mise.toml requirements.txt
