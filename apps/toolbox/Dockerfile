FROM cgr.dev/chainguard/wolfi-base:latest@sha256:c11fcfc9f7497a947c2e1fa5d7b5171c0b6985d4f7fb1fcc68eaf1a62c76d048

ENV MISE_INSTALL_PATH=/usr/local/bin/mise

USER root

RUN \
    apk add --no-cache --upgrade \
        bash \
        curl \
        exiftool \
        git \
        openssh \
        openssl && \
    curl https://mise.run | sh && \
    rm -rf \
        /root/.cache \
        /tmp/*

USER nonroot

COPY apps/toolbox/mise.toml /home/nonroot/.config/mise/config.toml

RUN \
    mise install --yes

CMD [ "cat" ]
