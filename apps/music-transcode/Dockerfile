FROM cgr.dev/chainguard/wolfi-base:latest@sha256:4ac37aff83b3f67e96674ddf86d878f8c2a8f16ef1420b02611600bbe94ea8c9

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
