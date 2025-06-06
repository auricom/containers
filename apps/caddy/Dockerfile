FROM cgr.dev/chainguard/go:latest-dev@sha256:49786768094b49794f9f2988e329fdaf6b87ce0d6f0ea137a1e1705787fad916 as builder

ARG VERSION=2.7.6

WORKDIR /app

RUN \
  wget --quiet --output-document /tmp/caddy.tar.gz \
  https://github.com/caddyserver/caddy/archive/refs/tags/v${VERSION}.tar.gz && \
  tar xf /tmp/caddy.tar.gz --strip-components=1 -C /app/

RUN \
  --mount=type=cache,target=/root/go/.cache \
  --mount=type=cache,target=/tmp/go-build \
  --mount=type=cache,target=/root/go/pkg/mod \
  go install github.com/caddyserver/xcaddy/cmd/xcaddy@latest && \
  /root/go/bin/xcaddy build --with github.com/caddy-dns/ovh

FROM cgr.dev/chainguard/wolfi-base:latest@sha256:cb5d1d9d5d562191f7f1c37c2ee21e8a9cdf3d25bf1faa4ac10ee375597ef9db

WORKDIR /app

COPY --from=builder /app/caddy /app/

# trunk-ignore(hadolint/DL3018)
RUN apk update && \
  apk add --no-cache \
    curl \
    tini && \
    mkdir -p /config && \
  chown -R nonroot:nonroot /app /config && \
  chmod -R u=rwX,go=rX /app /config

USER nonroot

EXPOSE 8080/tcp 8443/tcp 2019/tcp

HEALTHCHECK --start-period=2s --interval=5s --timeout=3s \
    CMD curl -f http://localhost:2019/config/ || exit 1

CMD ["tini", "--", "/app/caddy", "run"]
