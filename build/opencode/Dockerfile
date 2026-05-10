FROM node:26-slim

# 1. Install gosu and create the 'penguin' user
COPY setup-penguin.sh /usr/local/bin/setup-penguin.sh
RUN /usr/local/bin/setup-penguin.sh node

# 2. Pre-create the exact mount paths and cache directories
RUN mkdir -p /home/penguin/.config && \
    mkdir -p /home/penguin/.local/share/opencode && \
    mkdir -p /home/penguin/.local/state && \
    mkdir -p /home/penguin/.cache && \
    chown -R penguin:penguin /home/penguin

# 2. Copy the entrypoint script
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

COPY install-npm-global-from-package-json.sh /usr/local/bin/install-npm-global-from-package-json.sh

# 3. Install the CLI tool (changes frequently when you bump the version)
# Specify the exact version here instead of @latest
COPY opencode/package.json /tmp/deps/package.json
RUN sh /usr/local/bin/install-npm-global-from-package-json.sh opencode-ai /tmp/deps --cleanup

WORKDIR /workspace

# 4. Set the Entrypoint
ENTRYPOINT ["/usr/local/bin/entrypoint.sh", "opencode"]
