# syntax=docker/dockerfile:1

# ── Stage 1: Build ────────────────────────────────────────────
FROM cgr.dev/chainguard/rust:latest-dev@sha256:667591dc8dfd00eb8f8ce2d868d3e71472369700985973c2d51473a3d3e63e6d as builder

ARG VERSION

WORKDIR /repository

RUN git clone --depth 1 --revision "${VERSION}" https://github.com/zeroclaw-labs/zeroclaw.git /repository

WORKDIR /app

# 1. Copy manifests to cache dependencies
RUN cp /repository/Cargo.toml /app && \
    cp /repository/Cargo.lock /app

# Create dummy main.rs to build dependencies
RUN mkdir src && echo "fn main() {}" > src/main.rs
RUN --mount=type=cache,target=/usr/local/cargo/registry \
    --mount=type=cache,target=/usr/local/cargo/git \
    cargo build --release --locked
RUN rm -rf src

# 2. Copy source code
RUN cp -r /repository/* /app
# Touch main.rs to force rebuild
RUN touch src/main.rs
RUN --mount=type=cache,target=/usr/local/cargo/registry \
    --mount=type=cache,target=/usr/local/cargo/git \
    cargo build --release --locked && \
    strip target/release/zeroclaw

# ── Stage 2: Permissions & Config Prep ───────────────────────
FROM busybox:1.37@sha256:b3255e7dfbcd10cb367af0d409747d511aeb66dfac98cf30e97e87e4207dd76f AS permissions
# Create directory structure (simplified workspace path)
RUN mkdir -p /zeroclaw-data/.zeroclaw /zeroclaw-data/workspace

# Create minimal config for PRODUCTION (allows binding to public interfaces)
# NOTE: Provider configuration must be done via environment variables at runtime
RUN cat > /zeroclaw-data/.zeroclaw/config.toml << 'EOF'
workspace_dir = "/zeroclaw-data/workspace"
config_path = "/zeroclaw-data/.zeroclaw/config.toml"
api_key = ""
default_provider = "openrouter"
default_model = "moonshotai/kimi-k2.5"
default_temperature = 0.7

[gateway]
port = 3000
host = "[::]"
allow_public_bind = true
EOF

RUN chown -R 65534:65534 /zeroclaw-data

# ── Stage 3: Production Runtime (Distroless) ─────────────────
FROM cgr.dev/chainguard/wolfi-base:latest@sha256:b5f4a33fa2fee95dd79535e069bafd60f52085c5786677da5724414374c5194c

COPY --from=builder /app/target/release/zeroclaw /usr/local/bin/zeroclaw
COPY --from=permissions /zeroclaw-data /zeroclaw-data

# trunk-ignore(hadolint/DL3018)
RUN apk update && \
    apk add --no-cache \
    git

# Environment setup
ENV ZEROCLAW_WORKSPACE=/zeroclaw-data/workspace
ENV HOME=/zeroclaw-data
# Default provider (model is set in config.toml, not here,
# so config file edits are not silently overridden)
ENV PROVIDER="openrouter"
ENV ZEROCLAW_GATEWAY_PORT=3000

# API_KEY must be provided at runtime!

WORKDIR /zeroclaw-data
USER nonroot
EXPOSE 3000
ENTRYPOINT ["zeroclaw"]
CMD ["gateway", "--port", "3000", "--host", "[::]"]
