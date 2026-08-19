FROM cgr.dev/chainguard/wolfi-base:latest@sha256:8e8fe4b9b989b03daaa4305dba54a1b480f63716c56dc6bb074e5a6057bf3c73

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
