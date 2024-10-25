FROM cgr.dev/chainguard/go:latest-dev@sha256:d5c9ae29f0a9659135aaa8264935c0307eb30df61e658ed7488037f21685cab0 as builder

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

FROM cgr.dev/chainguard/wolfi-base:latest@sha256:8ece91a71d17ae3792056b3bfa64cb80dfbcb01848b320e446dd632ff9672491

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
