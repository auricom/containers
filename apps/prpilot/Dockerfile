FROM ghcr.io/auricom/toolbox:rolling@sha256:539c22aff26fe64fb0e11ba47eda6af75526485f2624e228c7c804a6ee03fbb8

ARG VERSION
ARG AGENTS_REPO_URL=https://github.com/auricom/agents.git

ENV MISE_YES=1

USER root

WORKDIR /tmp/src

RUN apk add --no-cache --upgrade \
        libatomic libstdc++ && \
    mkdir -p /app && \
    git clone "${AGENTS_REPO_URL}" /tmp/src/agents && \
    if [ "${VERSION}" != "rolling" ]; then \
      git -C /tmp/src/agents checkout "${VERSION}"; \
    fi && \
    test -d /tmp/src/agents/prpilot

WORKDIR /tmp/src/agents/prpilot

RUN mise use -g $(awk -F'[= "]+' '/^\[tools\]/{in_tools=1; next} /^\[/{in_tools=0} in_tools && NF>=2{print $1"@"$2}' mise.toml) && \
    npm ci && \
    npm run build && \
    npm prune --omit=dev && \
    cp -r dist node_modules package.json package-lock.json /app && \
    rm -rf \
        /root/.cache \
        /tmp/*

RUN mkdir -p /workspace /data/sessions && \
    chown -R nonroot:nonroot /app /workspace /data

USER nonroot

WORKDIR /workspace

ENV PORT=8080 \
    METRICS_PORT=9090 \
    REPOS_ROOT=/workspace \
    SESSION_DIR=/data/sessions

VOLUME ["/workspace", "/data/sessions"]

EXPOSE 8080 9090

HEALTHCHECK --interval=30s --timeout=5s --start-period=30s --retries=3 CMD curl --fail --silent http://localhost:8080/healthz || exit 1

ENTRYPOINT ["node","/app/dist/main.js"]
