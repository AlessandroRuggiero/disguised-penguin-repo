FROM node:20-slim

ENV NO_UPDATE_NOTIFIER=1

# 1. Install gosu and create the 'penguin' user
RUN apt-get update && \
    apt-get install -y gosu && \
    rm -rf /var/lib/apt/lists/* && \
    # Rename the default 'node' user and group to 'penguin'
    groupmod -n penguin node && \
    usermod -l penguin -d /home/penguin -m node

# 2. Pre-create the exact mount paths and cache directories
# You mentioned mounting /home/penguin/.claude/
RUN mkdir -p /home/penguin/.claude && \
    mkdir -p /home/penguin/.config && \
    mkdir -p /home/penguin/.cache && \
    chown -R penguin:penguin /home/penguin

# 3. Copy the entrypoint script
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

# 4. Install Claude Code
RUN npm install -g @anthropic-ai/claude-code

WORKDIR /workspace

ENTRYPOINT ["/usr/local/bin/entrypoint.sh", "claude"]