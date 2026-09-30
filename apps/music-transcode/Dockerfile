FROM cgr.dev/chainguard/wolfi-base:latest@sha256:6d63d8f5580a48e60b5c0dd9f67dd0672ea062d0eeabf0688fb10c522ee5967d

# trunk-ignore(hadolint/DL3018)
RUN apk add --no-cache \
    bash \
    coreutils \
    fd \
    ffmpeg \
    findutils \
    grep \
    rsync \
    sed \
    wget \
    xxhash

WORKDIR /app
