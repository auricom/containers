FROM cgr.dev/chainguard/rust:latest-dev@sha256:bef98c22b975617b3dc5989e1428d3b2da8d3287c951b5961fd16a881882a11e as builder

ARG VERSION

WORKDIR /app

RUN \
  git clone --depth 1 --branch "v${VERSION}" -c advice.detachedHead=false https://github.com/redlib-org/redlib.git /app && \
  cargo build --release

FROM cgr.dev/chainguard/wolfi-base:latest@sha256:3490ac41510e17846b30c9ebfc4a323dfdecbd9a35e7b0e4e745a8f496a18f25

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
