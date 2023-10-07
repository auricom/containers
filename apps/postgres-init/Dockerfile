FROM ghcr.io/onedr0p/alpine:rolling@sha256:01db2e6ff88bf0ce692fb6552ab68f4eb3f77d16ba5d3402e8a7de3f4f8873f1

ARG TARGETPLATFORM
ARG VERSION
ARG CHANNEL

#hadolint ignore=DL3018
RUN apk add --no-cache ca-certificates postgresql15-client~"${VERSION}"

USER kah

COPY ./apps/postgres-init/entrypoint.sh /entrypoint.sh

CMD ["/entrypoint.sh"]

LABEL org.opencontainers.image.source="https://github.com/postgres/postgres"