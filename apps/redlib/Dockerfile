FROM cgr.dev/chainguard/rust:latest-dev@sha256:697642d8e8a094d1c67501277023fd6b57dca4082a94de38ca87851eb1c765f0 as builder

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

FROM cgr.dev/chainguard/wolfi-base:latest@sha256:5ec604f42453ccad5058c32094de2347b4bf8f67980465a8f1505ccec4fc6883

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
