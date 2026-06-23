FROM cgr.dev/chainguard/wolfi-base:latest@sha256:c61ac6919b811ea53c4782d69f1fe05218ba3c25d53f01b6ab7892e621bd4370

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
