FROM cgr.dev/chainguard/go:latest-dev@sha256:d90fe0a2c9da1c9f7c3424a6931a34a43f248229491275e8863b2dc0662e89b1 as builder

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

FROM cgr.dev/chainguard/wolfi-base:latest@sha256:e1d402d624011d0f4439bfb0d46a3ddc692465103c7234a326e0194953c3cfe0

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
