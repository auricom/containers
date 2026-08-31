FROM cgr.dev/chainguard/wolfi-base:latest@sha256:e624c5d5e42382ce7165ddafcbbf8e6769a24cbd02ea6114b880b05ae5ba2a8d

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
