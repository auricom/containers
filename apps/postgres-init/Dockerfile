FROM ghcr.io/onedr0p/alpine:rolling@sha256:f4f467263cf0cfcd9c9ec2a42f5bea147c53732e56c19d558c9369897530e03c

ARG TARGETPLATFORM
ARG VERSION
ARG CHANNEL

#hadolint ignore=DL3018
RUN apk add --no-cache ca-certificates postgresql15-client~"${VERSION}"

USER kah

COPY ./apps/postgres-init/entrypoint.sh /entrypoint.sh

CMD ["/entrypoint.sh"]

LABEL org.opencontainers.image.source="https://github.com/postgres/postgres"