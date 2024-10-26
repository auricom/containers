FROM cgr.dev/chainguard/rust:latest-dev@sha256:0e8338e79df7051728b11d25d3ae1fb77948dda157e68277d54483fd57383c19 as builder

ARG VERSION

WORKDIR /app

# RUN \
#   git clone --depth 1 --branch "v${VERSION}" -c advice.detachedHead=false https://github.com/redlib-org/redlib.git /app && \
#   cargo build --release

RUN \
  git clone https://github.com/redlib-org/redlib.git /app && cd /app && git checkout "${VERSION}" && \
  cargo build --release

FROM cgr.dev/chainguard/wolfi-base:latest@sha256:8ece91a71d17ae3792056b3bfa64cb80dfbcb01848b320e446dd632ff9672491

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
