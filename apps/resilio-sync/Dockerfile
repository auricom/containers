FROM cgr.dev/chainguard/wolfi-base:latest@sha256:36e4b16af5c6f70e7eb71349f9c0341dd96a364ff04a4e0f352cb2a8389bf6f3

ARG VERSION

WORKDIR /app

ADD https://download-cdn.resilio.com/${VERSION}/linux-x64/resilio-sync_x64.tar.gz /tmp/sync.tgz
RUN tar -xf /tmp/sync.tgz -C /app rslsync && rm -f /tmp/sync.tgz

# trunk-ignore(hadolint/DL3018)
RUN apk update && \
  apk add --no-cache \
    libstdc++ \
    tini && \
  mkdir -p /config /sync && \
  chown -R nonroot:nonroot /app /config /sync && \
  chmod -R u=rwX,go=rX /app /config /sync

USER nonroot

COPY ./apps/resilio-sync/sync.conf /app/sync.conf

EXPOSE 8888/tcp
EXPOSE 55555/tcp
EXPOSE 55555/udp

CMD ["tini", "--", "/app/rslsync", "--nodaemon", "--config", "/app/sync.conf"]
