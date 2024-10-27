FROM cgr.dev/chainguard/rust:latest-dev@sha256:1800c88f10e6e9dadf3ec6564c9a7ee9a4856ac94963c1324769f57fab5d314d as builder

ARG VERSION

WORKDIR /app

# RUN \
#   git clone --depth 1 --branch "v${VERSION}" -c advice.detachedHead=false https://github.com/redlib-org/redlib.git /app && \
#   cargo build --release

RUN \
  git clone https://github.com/redlib-org/redlib.git /app && cd /app && git checkout "${VERSION}" && \
  cargo build --release

FROM cgr.dev/chainguard/wolfi-base:latest@sha256:3221f96f52fca0020fa6f404b0370d132403be6b3736d8dd92275ccd72129c1f

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
