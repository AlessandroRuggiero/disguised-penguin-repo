FROM node:20-slim

# 1. Install gosu and create the 'penguin' user
RUN apt-get update && \
    apt-get install -y gosu && \
    rm -rf /var/lib/apt/lists/* && \
    # Rename the default 'node' user and group to 'penguin'
    groupmod -n penguin node && \
    usermod -l penguin -d /home/penguin -m node

# 2. Pre-create the exact mount paths and cache directories
RUN mkdir -p /home/penguin/.config && \
    mkdir -p /home/penguin/.local/share/opencode && \
    mkdir -p /home/penguin/.local/state && \
    mkdir -p /home/penguin/.cache && \
    chown -R penguin:penguin /home/penguin

# 2. Copy the entrypoint script
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

# 3. Install the CLI tool (changes frequently when you bump the version)
# Specify the exact version here instead of @latest
RUN npm install -g opencode-ai@1.4.3

WORKDIR /workspace

# 4. Set the Entrypoint
ENTRYPOINT ["/usr/local/bin/entrypoint.sh", "opencode"]