FROM cgr.dev/chainguard/wolfi-base:latest@sha256:9925d3017788558fa8f27e8bb160b791e56202b60c91fbcc5c867de3175986c8

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

COPY mise.toml /home/nonroot/.config/mise/config.toml

RUN \
    mise install --yes

CMD [ "cat" ]
