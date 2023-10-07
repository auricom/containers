FROM ghcr.io/onedr0p/alpine:rolling@sha256:7de9e0039cbc791e8fac00d59844a63c81e5bd7532a850a1f6731a190aab6ccd

ARG TARGETPLATFORM
ARG VERSION
ARG CHANNEL

#hadolint ignore=DL3018
RUN apk add --no-cache ca-certificates postgresql15-client~"${VERSION}"

USER kah

COPY ./apps/postgres-init/entrypoint.sh /entrypoint.sh

CMD ["/entrypoint.sh"]

LABEL org.opencontainers.image.source="https://github.com/postgres/postgres"