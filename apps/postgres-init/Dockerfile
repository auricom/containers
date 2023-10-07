FROM ghcr.io/onedr0p/alpine:rolling@sha256:def056ca431d37935788aade44889bd34ca0f6b00bffff49dad41a613c0f79c7

ARG TARGETPLATFORM
ARG VERSION
ARG CHANNEL

#hadolint ignore=DL3018
RUN apk add --no-cache ca-certificates postgresql15-client~"${VERSION}"

USER kah

COPY ./apps/postgres-init/entrypoint.sh /entrypoint.sh

CMD ["/entrypoint.sh"]

LABEL org.opencontainers.image.source="https://github.com/postgres/postgres"