FROM cgr.dev/chainguard/rust:latest-dev@sha256:7a5092a56791127010ae868fd0b0377cc2bd9a194930f0eac4f8411b99ea534b as builder

ARG VERSION

WORKDIR /app

RUN \
  git clone --depth 1 --branch "v${VERSION}" -c advice.detachedHead=false https://github.com/redlib-org/redlib.git /app && \
  cargo build --release

FROM cgr.dev/chainguard/wolfi-base:latest@sha256:72c8bfed3266b2780243b144dc5151150015baf5a739edbbde53d154574f1607

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
