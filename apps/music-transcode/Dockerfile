FROM cgr.dev/chainguard/wolfi-base:latest@sha256:c0534ee75e0a6bc74bdfef07155049ec435b9e03a706d3545be3130d1a7cd00f

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
