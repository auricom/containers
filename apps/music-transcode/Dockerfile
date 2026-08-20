FROM cgr.dev/chainguard/wolfi-base:latest@sha256:fdcd31a2db35958c251ea22e80cda72a8222228114e736ec7dd9c94452a2dc51

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
