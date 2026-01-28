FROM cgr.dev/chainguard/rust:latest-dev@sha256:a3f989c28db9b8439e5c319441345ad3407cd468cda371285829cc357bd2430d as builder

ARG VERSION

WORKDIR /app

# RUN \
#   git clone --depth 1 --branch "v${VERSION}" -c advice.detachedHead=false https://github.com/redlib-org/redlib.git /app && \
#   cargo build --release

RUN \
    git clone https://github.com/redlib-org/redlib.git /app && cd /app && git checkout "${VERSION}" && \
    cargo build --release

FROM cgr.dev/chainguard/wolfi-base:latest@sha256:17ab0709456ce1a2aedd85e95f72e58d73133bb70c33ae945a4d4b2424e984f1

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
