FROM cgr.dev/chainguard/rust:latest-dev@sha256:4a9e1cfa03a7cc83b51cf7f91c246766f3ebff2b90fcfea0c675d6c2b16a256e as builder

ARG VERSION

USER root

WORKDIR /app

# RUN \
#   git clone --depth 1 --branch "v${VERSION}" -c advice.detachedHead=false https://github.com/redlib-org/redlib.git /app && \
#   cargo build --release

RUN \
    apk update && \
    apk add --no-cache \
        openssl \
        perl \
    && \
    # git clone https://github.com/redlib-org/redlib.git /app && cd /app && git checkout "${VERSION}" && \
    git clone https://github.com/chowder/redlib.git /app && cd /app && git checkout "${VERSION}" && \
    cargo build --release

FROM cgr.dev/chainguard/wolfi-base:latest@sha256:865267010fd5c6a45c7ab456848573010ec521b0d2677a0a966f3f2211b71eda

# trunk-ignore(hadolint/DL3018)
RUN apk update && \
    apk add --no-cache \
        libgcc \
        tini \
        wget

USER nonroot

COPY --from=builder /app/target/release/redlib /app/redlib

WORKDIR /app

EXPOSE 8080

HEALTHCHECK --interval=1m --timeout=3s CMD wget --spider --quiet http://localhost:8080/settings || exit 1

CMD ["tini", "--", "/app/redlib", "--address", "0.0.0.0"]
