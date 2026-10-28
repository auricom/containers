FROM cgr.dev/chainguard/wolfi-base:latest@sha256:31cfe087eb48bde827a6e0f607a12865f6f37d89093b95b324b9d5714e3cedab

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
