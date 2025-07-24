FROM cgr.dev/chainguard/wolfi-base:latest@sha256:25f877c4528bbb99a1d7ab0c063a7a64958e0cef9e73ee0b98bd52b6e2c83538

ARG VERSION

WORKDIR /app

COPY ./apps/filebrowser/healthcheck.sh /healthcheck.sh

# trunk-ignore(hadolint/DL3018)
RUN apk update && \
  apk add --no-cache \
    atuin \
    chezmoi \
    curl \
    fish \
    nmap \
  && \
  curl https://mise.run | sh && \
  curl --silent --output /usr/local/bin/dysk https://dystroy.org/dysk/download/x86_64-linux/dysk

