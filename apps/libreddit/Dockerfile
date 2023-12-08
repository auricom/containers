FROM rust:alpine  AS builder

ARG VERSION
# hadolint ignore=DL3018
RUN apk add --no-cache musl-dev git

RUN \
  git clone --depth 1 --branch "v${VERSION}" -c advice.detachedHead=false https://github.com/libreddit/libreddit.git /app && \
  cd /app && \
  cargo build --target x86_64-unknown-linux-musl --release

FROM ghcr.io/onedr0p/alpine:rolling@sha256:2d4bec1c2378a8a682626148425bf73e4996e4f8f322ba61b046f280f141503a

COPY --from=builder /usr/share/ca-certificates /usr/share/ca-certificates
COPY --from=builder /etc/ssl/certs /etc/ssl/certs
COPY --from=builder /app/target/x86_64-unknown-linux-musl/release/libreddit /app/libreddit

COPY apps/libreddit/entrypoint.sh /entrypoint.sh

RUN \
  chown -R kah:kah /app && \
  chmod -R u=rwX,go=rX /app
USER kah

EXPOSE 8080

CMD ["/entrypoint.sh"]
