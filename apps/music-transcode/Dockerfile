FROM cgr.dev/chainguard/wolfi-base:latest@sha256:550e0d6f3b235cd52f141d98594672401adba71642ec367b8874a676ec61ca44

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
