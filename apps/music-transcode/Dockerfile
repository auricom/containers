FROM cgr.dev/chainguard/wolfi-base:latest@sha256:865267010fd5c6a45c7ab456848573010ec521b0d2677a0a966f3f2211b71eda

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
