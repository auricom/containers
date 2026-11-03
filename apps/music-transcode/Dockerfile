FROM cgr.dev/chainguard/wolfi-base:latest@sha256:629d9acaceda7746cd9293365eb0d8e8fabf74e91830b05470cfbee20b53f447

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
