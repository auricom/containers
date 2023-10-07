FROM ghcr.io/onedr0p/alpine:rolling@sha256:41a5e9e7152569abf59cb6a8f4848ee5855f28ae6a8f54c129e7c13a1ae0a020

ARG TARGETPLATFORM
ARG VERSION
ARG CHANNEL

#hadolint ignore=DL3018
RUN apk add --no-cache ca-certificates postgresql15-client~"${VERSION}"

USER kah

COPY ./apps/postgres-init/entrypoint.sh /entrypoint.sh

CMD ["/entrypoint.sh"]

LABEL org.opencontainers.image.source="https://github.com/postgres/postgres"