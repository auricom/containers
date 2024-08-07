FROM cgr.dev/chainguard/rust:latest-dev@sha256:d6f0492e5bef8a55d5dffa5765cb011e4e7e1901b87b105cbdaebf66b618964a as builder

ARG VERSION

WORKDIR /app

RUN \
  git clone --depth 1 --branch "v${VERSION}" -c advice.detachedHead=false https://github.com/redlib-org/redlib.git /app && \
  cargo build --release

FROM cgr.dev/chainguard/wolfi-base:latest@sha256:bf0547b7d8d03e4f43e3e2b91630af5dc560bd91d09b8286148da8ffebd2092a

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
