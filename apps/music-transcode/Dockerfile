FROM cgr.dev/chainguard/wolfi-base:latest@sha256:d68b2b10db0ddb2c6d9cb3a7720ecab5ca19b4b430fd592cd07c23d7da971b56

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
