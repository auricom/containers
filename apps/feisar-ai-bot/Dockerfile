FROM ghcr.io/auricom/toolbox:rolling

ARG VERSION
ARG AGENTS_REPO_URL=https://github.com/auricom/agents.git

USER root

WORKDIR /tmp/src

RUN git clone "${AGENTS_REPO_URL}" /tmp/src/agents && \
    if [ "${VERSION}" != "rolling" ]; then \
      git -C /tmp/src/agents checkout "${VERSION}"; \
    fi && \
    test -d /tmp/src/agents/feisar-ai-bot

WORKDIR /tmp/src/agents/feisar-ai-bot

RUN npm ci && \
    npm run build && \
    npm prune --omit=dev

RUN mkdir -p /app && \
    cp -r dist node_modules package.json package-lock.json mise.toml /app && \
    rm -rf /tmp/src

RUN mkdir -p /workspace /data/sessions && \
    chown -R nonroot:nonroot /app /workspace /data

USER nonroot

WORKDIR /app

RUN mise install && \
    mise run requirements

WORKDIR /workspace

ENV PORT=8080 \
    METRICS_PORT=9090 \
    REPOS_ROOT=/workspace \
    SESSION_DIR=/data/sessions

VOLUME ["/workspace", "/data/sessions"]

EXPOSE 8080 9090

HEALTHCHECK --interval=30s --timeout=5s --start-period=30s --retries=3 CMD curl --fail --silent http://localhost:8080/healthz || exit 1

ENTRYPOINT ["tini", "--"]
CMD ["node", "/app/dist/main.js"]
