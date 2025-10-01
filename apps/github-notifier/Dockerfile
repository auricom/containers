# trunk-ignore-all(checkov/CKV_DOCKER_2)
FROM cgr.dev/chainguard/wolfi-base:latest@sha256:5d0f514b76a62a9557abc4d30e19c9eb3f2665f1b8227e96eff7a920e389e08b

USER root

ARG VERSION

WORKDIR /app

COPY ./apps/github-notifier/requirements.txt /tmp

# trunk-ignore(hadolint/DL3018)
RUN apk update && \
    apk add --no-cache \
        bash \
        build-base \
        gdbm \
        glibc \
        glibc-locale-posix \
        icu \
        libbrotlicommon1 \
        libbrotlidec1 \
        libexpat1 \
        libffi \
        libgcc \
        libstdc++ \
        libxcrypt \
        mpdecimal \
        ncurses \
        ncurses-terminfo-base \
        python3 \
        python3-dev \
        py3-pip \
        readline \
        sqlite-libs \
        sqlite-dev \
        tini \
    && \
    pip install --no-cache-dir --requirement /tmp/requirements.txt && \
    apk del \
        build-base \
        python3-dev \
        sqlite-dev \
    && \
    mkdir -p /config && \
    chown -R nonroot:nonroot /app /config && \
    chmod -R u=rwX,go=rX /app /config

USER nonroot

VOLUME /config

ENTRYPOINT ["tini", "--"]
