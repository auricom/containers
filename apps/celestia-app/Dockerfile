# stage 1 Generate celestia-appd Binary
FROM golang:1.18-alpine as builder

# hadolint ignore=DL3018
RUN apk update && \
    apk upgrade && \
    apk --no-cache add make gcc musl-dev

ENV HOME /celestia-app

COPY / ${HOME}
WORKDIR ${HOME}

RUN make build

# stage 2
FROM ghcr.io/onedr0p/alpine:rolling@sha256:35dc08b62b80ebd6d9a4e46ff1c4503967d4c0ca6a9ca8b04e299102b0319bf6

USER root

# hadolint ignore=DL3018
RUN apk update && \
    apk upgrade && \
    apk --no-cache add curl jq bash

COPY --from=builder /app/build/celestia-appd /app/celestia-appd
COPY apps/celestia-app/entrypoint.sh /entrypoint.sh

WORKDIR /config

USER kah

# p2p, rpc and prometheus port
EXPOSE 26656 26657 1317 9090

# This allows us to always set the --home directory using an env 
# var while still capturing all arguments passed at runtime
ENTRYPOINT [ "/entrypoint.sh" ]