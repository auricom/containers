FROM cgr.dev/chainguard/wolfi-base:latest@sha256:1c58df26f9196ea67e71bbff393764dc9fa79ea7562fe44ade04d1f247fd581d

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
