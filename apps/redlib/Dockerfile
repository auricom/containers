FROM cgr.dev/chainguard/rust:latest-dev@sha256:08607711af9eb3bb4d14faa20f0d2ae131bc6a3eba530f94196675236d5d6767 as builder

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

FROM cgr.dev/chainguard/wolfi-base:latest@sha256:b78bb982194828b6c9c214230bf34d51944e2102ea8468f01ac21e5f99328efd

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
