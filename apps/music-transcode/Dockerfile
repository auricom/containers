FROM cgr.dev/chainguard/wolfi-base:latest@sha256:8f4bb89aa9962e60d9e975d229624a29e81185db286f796e87ed0f7333c1b69e

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
    vips \
    wget

WORKDIR /app
