FROM node:20-slim

# 1. Install gosu (changes rarely)
RUN apt-get update && \
    apt-get install -y gosu && \
    rm -rf /var/lib/apt/lists/*

# 2. Copy the entrypoint script (changes rarely)
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

# 3. Install the CLI tool (changes frequently when you bump the version)
# Specify the exact version here instead of @latest
RUN npm install -g opencode-ai@1.4.3

WORKDIR /workspace

# 4. Set the Entrypoint
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
CMD ["opencode"]