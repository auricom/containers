FROM cgr.dev/chainguard/wolfi-base:latest@sha256:cb2fc9d795bf874e660dbc25958cfa699b55e789235896ec7c354c57d3e3a704

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
