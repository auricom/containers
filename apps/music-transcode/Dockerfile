FROM cgr.dev/chainguard/wolfi-base:latest@sha256:34977aa13765da89f60fee8fe5230e2bb1c55192df08e383c58221ee0d1277fb

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
