FROM cgr.dev/chainguard/wolfi-base:latest@sha256:c11fcfc9f7497a947c2e1fa5d7b5171c0b6985d4f7fb1fcc68eaf1a62c76d048

ENV MISE_INSTALL_PATH=/usr/local/bin/mise

ENV GUM_VERSION=v0.17.0

USER root

RUN \
    apk add --no-cache --upgrade \
        bash \
        curl \
        exiftool \
        git \
        openssh \
        openssl && \
    # Install mise
    curl https://mise.run | sh \
    && \
    # Download gum binary
    curl --silent --location https://github.com/charmbracelet/gum/releases/download/${GUM_VERSION}/gum_${GUM_VERSION#v}_Linux_x86_64.tar.gz --output /tmp/gum.tar.gz && \
    tar -xvf /tmp/gum.tar.gz -C /tmp && \
    mv /tmp/gum_*/gum /usr/local/bin/ \
    && \
    rm -rf \
        /root/.cache \
        /tmp/*

USER nonroot

COPY apps/toolbox/mise.toml /home/nonroot/.config/mise/config.toml

RUN \
    mise install --yes

CMD [ "cat" ]
