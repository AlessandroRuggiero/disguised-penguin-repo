FROM debian:13-slim

# Install git and the latest lazygit release from the official GitHub releases (arch-aware),
# verified against the release's checksums.txt
RUN apt-get update && apt-get install -y \
    curl \
    ca-certificates \
    git \
    openssh-client \
    nano \
    && LAZYGIT_VERSION="$(curl -fsSL https://api.github.com/repos/jesseduffield/lazygit/releases/latest | grep -Po '"tag_name": *"v\K[^"]*')" \
    && LAZYGIT_ARCH="$(uname -m | sed -e 's/aarch64/arm64/')" \
    && LAZYGIT_FILE="lazygit_${LAZYGIT_VERSION}_linux_${LAZYGIT_ARCH}.tar.gz" \
    && LAZYGIT_URL="https://github.com/jesseduffield/lazygit/releases/download/v${LAZYGIT_VERSION}" \
    && cd /tmp \
    && curl -fsSLO "${LAZYGIT_URL}/${LAZYGIT_FILE}" \
    && curl -fsSL "${LAZYGIT_URL}/checksums.txt" | grep " ${LAZYGIT_FILE}\$" | sha256sum -c - \
    && tar xzf "${LAZYGIT_FILE}" --no-same-owner -C /usr/local/bin lazygit \
    && rm "${LAZYGIT_FILE}" \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

COPY setup-penguin.sh /usr/local/bin/setup-penguin.sh
RUN /usr/local/bin/setup-penguin.sh

# Pre-create the parents of the config mounts so they are owned by penguin
RUN mkdir -p /home/penguin/.config /home/penguin/.local/state && \
    chown -R penguin:penguin /home/penguin

# Keep the global git config inside the mounted ~/.config/git/ so it persists
ENV GIT_CONFIG_GLOBAL=/home/penguin/.config/git/config
ENV EDITOR=nano

COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

WORKDIR /workspace

ENTRYPOINT ["/usr/local/bin/entrypoint.sh", "lazygit"]
