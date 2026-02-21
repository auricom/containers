# syntax=docker/dockerfile:1@sha256:b6afd42430b15f2d2a4c5a02b919e98a525b785b1aaff16747d2f623364e39b6

# ── Stage 1: Permissions & Config Prep ───────────────────────
FROM busybox:1.37@sha256:b3255e7dfbcd10cb367af0d409747d511aeb66dfac98cf30e97e87e4207dd76f AS permissions

ARG VERSION

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

# Download zeroclaw binary
RUN wget --quiet https://github.com/zeroclaw-labs/zeroclaw/releases/download/v${VERSION}/zeroclaw-x86_64-unknown-linux-gnu.tar.gz --output-document=/tmp/zeroclaw.tar.gz && \
tar -xvf /tmp/zeroclaw.tar.gz -C /tmp

# ── Stage 2: Production Runtime ─────────────────
FROM cgr.dev/chainguard/wolfi-base:latest@sha256:c9a27ee8d2d441f941de2f8e4c2c8ddb0b313adb5d14ab934b19f467b9ea8083

COPY --from=permissions /tmp/zeroclaw /usr/local/bin/zeroclaw
COPY --from=permissions /zeroclaw-data /zeroclaw-data

# trunk-ignore(hadolint/DL3018)
RUN apk update && \
    apk add --no-cache \
        gh \
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
