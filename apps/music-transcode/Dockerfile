FROM cgr.dev/chainguard/wolfi-base:latest@sha256:9a8d954d8f03a21bcf2be73d4628f0ad26d35c3275469925de63a34eebd58f13

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
