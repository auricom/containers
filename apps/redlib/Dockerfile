FROM cgr.dev/chainguard/rust:latest-dev@sha256:4446a5575698c53c6161d43e865ddbe933f979d311ea8eb8bc4e6961913b5367 as builder

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

FROM cgr.dev/chainguard/wolfi-base:latest@sha256:b2ce5aedd6166cd643db037b4159dd6456d8e175947211c4c8703fcaca8de869

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
