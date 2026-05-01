FROM digitalocean/doctl:latest AS doctl

FROM debian:bookworm-slim

# 1. Install gosu and create the 'penguin' user
COPY setup-penguin.sh /usr/local/bin/setup-penguin.sh
RUN /usr/local/bin/setup-penguin.sh

# 2. Pre-create the config directory used by doctl
RUN mkdir -p /home/penguin/.config && \
    chown -R penguin:penguin /home/penguin

# 3. Copy doctl from the official image
COPY --from=doctl /app/doctl /usr/local/bin/doctl

# 4. Copy the entrypoint script
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

WORKDIR /workspace

ENTRYPOINT ["/usr/local/bin/entrypoint.sh", "doctl"]
