FROM cgr.dev/chainguard/go:latest-dev@sha256:f80d05a884ccf0dd15adf9ae977c290228d5cae634d6cd847721eb024af4739e as builder

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

FROM cgr.dev/chainguard/wolfi-base:latest@sha256:72c8bfed3266b2780243b144dc5151150015baf5a739edbbde53d154574f1607

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
