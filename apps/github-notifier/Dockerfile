# trunk-ignore-all(checkov/CKV_DOCKER_2)
FROM cgr.dev/chainguard/wolfi-base:latest@sha256:cdab2937f46d3485a80b1e3b4e4e0dffa510df62c1b2b372c4c047caefd71a2a

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
