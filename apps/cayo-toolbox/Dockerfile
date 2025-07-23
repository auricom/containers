FROM cgr.dev/chainguard/wolfi-base:latest@sha256:9c86299eaeb27bfec41728fc56a19fa00656c001c0f01228b203379e5ac3ef28

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

