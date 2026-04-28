FROM cgr.dev/chainguard/wolfi-base:latest@sha256:d6e31fc9dad5fd76d7160ba833502865e17c226ab261cb6893a0624b68198d7b

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
