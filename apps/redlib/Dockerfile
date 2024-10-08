FROM cgr.dev/chainguard/rust:latest-dev@sha256:f0683253cdbff97f2b8c68f2b5c7463e24f1126142cdaecc3a75d86378b484d5 as builder

ARG VERSION

WORKDIR /app

RUN \
  git clone --depth 1 --branch "v${VERSION}" -c advice.detachedHead=false https://github.com/redlib-org/redlib.git /app && \
  cargo build --release

FROM cgr.dev/chainguard/wolfi-base:latest@sha256:28f57f6a9fb2478f3a3dd160794831bd0099ec92d0d7b81cd203fae67bcb5339

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
