FROM cgr.dev/chainguard/wolfi-base:latest@sha256:2390110a7dcaaa2157420fe97811c9925578a3263405a1614432c88d8d36d1d3

ARG VERSION

WORKDIR /app

# trunk-ignore(hadolint/DL3018)
RUN apk update && \
  apk add --no-cache \
    libstdc++ \
    tini \
    wget && \
  wget --quiet --output-document /tmp/sync.tgz \
    https://download-cdn.resilio.com/${VERSION}/linux-x64/resilio-sync_x64.tar.gz && \
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
