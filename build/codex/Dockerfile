FROM node:26-slim

ENV NO_UPDATE_NOTIFIER=1

# 1. Install gosu and create the 'penguin' user
COPY setup-penguin.sh /usr/local/bin/setup-penguin.sh
RUN /usr/local/bin/setup-penguin.sh node

# 2. Pre-create the exact mount paths and cache directories
RUN mkdir -p /home/penguin/.codex && \
    mkdir -p /home/penguin/.config && \
    mkdir -p /home/penguin/.cache && \
    chown -R penguin:penguin /home/penguin

# 3. Copy the entrypoint script
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

COPY install-npm-global-from-package-json.sh /usr/local/bin/install-npm-global-from-package-json.sh

# 4. Install Codex CLI
COPY codex/package.json /tmp/deps/package.json
RUN sh /usr/local/bin/install-npm-global-from-package-json.sh @openai/codex /tmp/deps --cleanup

WORKDIR /workspace

ENTRYPOINT ["/usr/local/bin/entrypoint.sh", "codex"]
