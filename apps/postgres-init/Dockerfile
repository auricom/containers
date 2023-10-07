FROM ghcr.io/onedr0p/alpine:rolling@sha256:cf87d34e67b3ebb2978fddb6ef93243febd62a482097dcc9d72cf50dea1e1e5d

ARG TARGETPLATFORM
ARG VERSION
ARG CHANNEL

#hadolint ignore=DL3018
RUN apk add --no-cache ca-certificates postgresql15-client~"${VERSION}"

USER kah

COPY ./apps/postgres-init/entrypoint.sh /entrypoint.sh

CMD ["/entrypoint.sh"]

LABEL org.opencontainers.image.source="https://github.com/postgres/postgres"