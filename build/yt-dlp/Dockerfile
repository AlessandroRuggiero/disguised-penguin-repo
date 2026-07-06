FROM debian:stable-slim

# Install Python, pip and ffmpeg for media processing
RUN apt-get update && apt-get install -y \
    python3 \
    python3-venv \
    python3-pip \
    ffmpeg \
    ca-certificates \
    && python3 -m venv /opt/yt-env \
    && /opt/yt-env/bin/python -m pip install --no-cache-dir --upgrade pip setuptools wheel \
    && /opt/yt-env/bin/python -m pip install --no-cache-dir yt-dlp \
    && ln -s /opt/yt-env/bin/yt-dlp /usr/local/bin/yt-dlp \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

COPY setup-penguin.sh /usr/local/bin/setup-penguin.sh
RUN /usr/local/bin/setup-penguin.sh

COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

WORKDIR /workspace

ENTRYPOINT ["/usr/local/bin/entrypoint.sh", "yt-dlp"]
