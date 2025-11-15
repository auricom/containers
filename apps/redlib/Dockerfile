FROM cgr.dev/chainguard/rust:latest-dev@sha256:32f2e632e185230010ccb9d83e339c2053a17525faf291ecead13ca872a875ff as builder

ARG VERSION

WORKDIR /app

# RUN \
#   git clone --depth 1 --branch "v${VERSION}" -c advice.detachedHead=false https://github.com/redlib-org/redlib.git /app && \
#   cargo build --release

RUN \
    git clone https://github.com/redlib-org/redlib.git /app && cd /app && git checkout "${VERSION}" && \
    cargo build --release

FROM cgr.dev/chainguard/wolfi-base:latest@sha256:77891a12dc762228955294f2207ee1cbd2b127f18dc7c7458203116288dce828

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
