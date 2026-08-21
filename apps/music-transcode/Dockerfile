FROM cgr.dev/chainguard/wolfi-base:latest@sha256:bfcffaf1336b26a3fd33c8cb31a86a09324d2048420d7f49b983f323b0d33e8d

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
