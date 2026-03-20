FROM cgr.dev/chainguard/wolfi-base:latest@sha256:73de6aadd7e28fb516fa1270fcb411b94ee79949635e7de2a4bdb8705f6c120c

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
