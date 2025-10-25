FROM cgr.dev/chainguard/wolfi-base:latest@sha256:0d1673dd55e8b7535fea5191c8337f0c18f46d55ed9020b9dcc1a2e17c550680

ARG VERSION=

WORKDIR /app

# trunk-ignore(hadolint/DL3018)
RUN apk update && \
  apk add --no-cache \
    libstdc++ \
    tini \
    wget && \
  wget --quiet --output-document /tmp/sync.tgz \
  https://download-cdn.resilio.com/stable/linux/x64/0/resilio-sync_x64.tar.gz && \
    tar -xf /tmp/sync.tgz -C /app rslsync && rm -f /tmp/sync.tgz && \
  apk del wget && \
    mkdir -p /config /sync && \
  chown -R nonroot:nonroot /app /config /sync && \
  chmod -R u=rwX,go=rX /app /config /sync

USER nonroot

COPY ./apps/resilio-sync/sync.conf /app/sync.conf

EXPOSE 8888/tcp
EXPOSE 55555/tcp
EXPOSE 55555/udp

CMD ["tini", "--", "/app/rslsync", "--nodaemon", "--config", "/app/sync.conf"]
