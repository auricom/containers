FROM cgr.dev/chainguard/wolfi-base:latest@sha256:9c2092b053779e14c82fb50f77b37bcc38b7d2c83972352d5813280f9d035b03

ARG VERSION

WORKDIR /app

# trunk-ignore(hadolint/DL3018)
RUN apk add --no-cache \
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
