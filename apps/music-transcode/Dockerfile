FROM cgr.dev/chainguard/wolfi-base:latest@sha256:08420c1a0f2995c677fa91982155c8d7da2ebd2e832a9f0070f633dae97d9099

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
