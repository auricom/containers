FROM cgr.dev/chainguard/wolfi-base:latest@sha256:b6bfe8564bb0630778b04df06b42e78acf221e9540703cfc03d040ab7f91e357

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
