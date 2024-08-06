FROM cgr.dev/chainguard/rust:latest-dev@sha256:ccc9f33747a5369386544ca1dde4eb5353f46d02ca349e7dfee648426fbcfe9b as builder

ARG VERSION

WORKDIR /app

RUN \
  git clone --depth 1 --branch "v${VERSION}" -c advice.detachedHead=false https://github.com/redlib-org/redlib.git /app && \
  cargo build --release

FROM cgr.dev/chainguard/wolfi-base:latest@sha256:378e1d3d5ced3c8ea83c92784b081972bb235c813db8b56f936c50deac8357f3

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
