FROM cgr.dev/chainguard/wolfi-base:latest@sha256:af366da38c839436746f79c3e52bba671a756d43e2980ecbf37ecf35348faba9

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
