FROM cgr.dev/chainguard/wolfi-base:latest@sha256:315732e5ca8b9f9285ed36ce9a5bb2a99f700ca8f0570d7061f9a4987fcf6688

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
