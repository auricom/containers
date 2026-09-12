FROM cgr.dev/chainguard/rust:latest-dev@sha256:2797424582bc3fab467e27cfc7b1a66d31ac57a6b5b4bd8f2d90059a6a1ec9d8 as builder

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

FROM cgr.dev/chainguard/wolfi-base:latest@sha256:65e1acb87a2bf356b92c5f70f3980f03b4bb51dfd483c834e01557525f15c1d9

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
