FROM cgr.dev/chainguard/wolfi-base:latest@sha256:237a457dc67857705d15573e4bd3528338ac38e2fb0f591ec50ede03448f8258

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
