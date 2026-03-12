FROM cgr.dev/chainguard/wolfi-base:latest@sha256:a9a3a0c9fb954fd70b398afdd055d74a4f196095b9fdfbcfb13495aefeefd075

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
