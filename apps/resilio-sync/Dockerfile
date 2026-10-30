FROM cgr.dev/chainguard/wolfi-base:latest@sha256:88a20e2d017bd20cdc0cb3910de603e7bea9512a6c351a8dd3c9df212ab03d73 AS download

ARG PACKAGE_VERSION
ARG PACKAGE_SHA256

RUN apk add --no-cache binutils curl xz && \
    curl --fail --silent --show-error --location \
      "https://linux-packages.resilio.com/resilio-sync/deb/pool/non-free/r/resilio-sync/resilio-sync_${PACKAGE_VERSION}_amd64.deb" \
      --output /tmp/resilio.deb && \
    echo "${PACKAGE_SHA256}  /tmp/resilio.deb" | sha256sum -c - && \
    mkdir /extract && cd /extract && \
    ar x /tmp/resilio.deb && \
    tar -xf data.tar.* ./usr/bin/rslsync

FROM cgr.dev/chainguard/wolfi-base:latest@sha256:88a20e2d017bd20cdc0cb3910de603e7bea9512a6c351a8dd3c9df212ab03d73

WORKDIR /app

# trunk-ignore(hadolint/DL3018)
RUN apk add --no-cache libstdc++ tini && \
    mkdir -p /config /sync && \
    chown -R nonroot:nonroot /app /config /sync && \
    chmod -R u=rwX,go=rX /app /config /sync

COPY --from=download --chmod=755 /extract/usr/bin/rslsync /app/rslsync
COPY sync.conf /app/sync.conf

USER nonroot

EXPOSE 8888/tcp
EXPOSE 55555/tcp
EXPOSE 55555/udp

CMD ["tini", "--", "/app/rslsync", "--nodaemon", "--config", "/app/sync.conf"]
