FROM node:20-slim

# 1. Install gosu and create the 'penguin' user
RUN apt-get update && \
    apt-get install -y gosu && \
    rm -rf /var/lib/apt/lists/* && \
    # Rename the default 'node' user and group to 'penguin'
    groupmod -n penguin node && \
    usermod -l penguin -d /home/penguin -m node

COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

RUN npm install -g @anthropic-ai/claude-code

WORKDIR /workspace
USER penguin

ENTRYPOINT ["/usr/local/bin/entrypoint.sh", "claude"]