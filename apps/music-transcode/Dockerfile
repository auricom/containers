FROM cgr.dev/chainguard/wolfi-base:latest@sha256:824f77df45397eb954dfb963db255907ee8842e3446353ce93d688e5e862f51d

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
