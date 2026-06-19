FROM cgr.dev/chainguard/wolfi-base:latest@sha256:e161445c05b19e668cb5cc44df2f0403329fd4f0ac892794255e328e760612a1

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
