FROM cgr.dev/chainguard/wolfi-base:latest@sha256:150a90c21d962ea400988490b629e245658391b63a1f625e847f5dea50dd3094

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
