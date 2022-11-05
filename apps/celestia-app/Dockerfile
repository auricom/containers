# stage 1 Generate celestia-appd Binary
FROM docker.io/golang:1.19-alpine as builder

# hadolint ignore=DL3018
RUN apk update && \
    apk upgrade && \
    apk --no-cache add make gcc musl-dev git 

RUN \
  git clone https://github.com/celestiaorg/celestia-app.git /celestia-app && \
  cd /celestia-app && \
  git checkout ${VERSION} && \
  make build

# stage 2
FROM ghcr.io/onedr0p/alpine:rolling@sha256:e25d6744afe5ae0c03e0b2af4977c2d7df3f56b713c3b5cdffb8c372edf626be

USER root

# hadolint ignore=DL3018
RUN apk update && \
    apk upgrade && \
    apk --no-cache add curl jq bash git

COPY --from=builder /celestia-app/build/celestia-appd /app/celestia-appd
COPY apps/celestia-app/entrypoint.sh /entrypoint.sh

WORKDIR /config

USER kah

# p2p, rpc and prometheus port
EXPOSE 26656 26657 1317 9090

# This allows us to always set the --home directory using an env 
# var while still capturing all arguments passed at runtime
ENTRYPOINT [ "/entrypoint.sh" ]