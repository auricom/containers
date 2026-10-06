FROM cgr.dev/chainguard/wolfi-base:latest@sha256:00fd4e9cdd9c5576c336d979fa663f9976f160c456b6ae9fe87e19c4e9c759a2

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
