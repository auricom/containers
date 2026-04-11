FROM cgr.dev/chainguard/wolfi-base:latest@sha256:9a74366aa10eff2bf14dab0948123bd2c51703e1c553a73740ef687f723aecf4

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
