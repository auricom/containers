FROM cgr.dev/chainguard/wolfi-base:latest@sha256:d653e81239ff979cf810ca6f706d1bcf56d6994da75f37b4702327a3c2696900

ARG VERSION

WORKDIR /app

COPY ./apps/filebrowser/healthcheck.sh /healthcheck.sh

# trunk-ignore(hadolint/DL3018)
RUN apk update && \
  apk add --no-cache \
    tini \
    wget && \
  wget --quiet --output-document /tmp/filebrowser.tar.gz \
  https://github.com/filebrowser/filebrowser/releases/download/v${VERSION}/linux-amd64-filebrowser.tar.gz && \
    tar -xf /tmp/filebrowser.tar.gz -C /app filebrowser && rm -f /tmp/filebrowser.tar.gz && \
  apk del wget && \
    mkdir -p /config && \
  adduser -D -u 1000 core && \
  chown -R core:core /app /config && \
  chmod -R u=rwX,go=rX /app /config && \
  chmod +x /healthcheck.sh

USER core

EXPOSE 8080/tcp

HEALTHCHECK --start-period=2s --interval=5s --timeout=3s \
    CMD /healthcheck.sh || exit 1

CMD ["tini", "--", "/app/filebrowser"]
