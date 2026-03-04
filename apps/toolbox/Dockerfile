FROM cgr.dev/chainguard/wolfi-base:latest@sha256:c11fcfc9f7497a947c2e1fa5d7b5171c0b6985d4f7fb1fcc68eaf1a62c76d048

ENV MISE_INSTALL_PATH=/usr/local/bin/mise

# renovate: datasource=github-releases depName=charmbracelet/gum
ENV GUM_VERSION=v0.17.0

# renovate: datasource=github-releases depName=charmbracelet/gum
ENV MISE_VERSION=v2026.3.2

ENV MISE_DATA_DIR="/mise"
ENV MISE_CONFIG_DIR="/mise"
ENV MISE_CACHE_DIR="/mise/cache"
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

COPY apps/toolbox/mise.toml .
COPY apps/toolbox/requirements.txt .

RUN \
    # Download Mise
    mkdir -p /usr/local/bin /mise && \
    curl -L https://github.com/jdx/mise/releases/download/${MISE_VERSION}/mise-${MISE_VERSION}-linux-x64 > /usr/local/bin/mise  && \
    chmod +x /usr/local/bin/mise \
    && \
    # Download gum binary
    curl --silent --location https://github.com/charmbracelet/gum/releases/download/${GUM_VERSION}/gum_${GUM_VERSION#v}_Linux_x86_64.tar.gz --output /tmp/gum.tar.gz && \
    tar -xvf /tmp/gum.tar.gz -C /tmp && \
    mv /tmp/gum_*/gum /usr/local/bin/ \
    && \
    chown -R nonroot:nonroot /mise && \
    rm -rf \
        /root/.cache \
        /tmp/*

USER nonroot

WORKDIR /home/nonroot

RUN \
    mise use --yes \
        age \
        fd \
        gh \
        kubectl \
        python \
        rclone \
        uv && \
    mise run dependencies
