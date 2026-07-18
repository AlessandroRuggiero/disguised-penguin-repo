FROM debian:13-slim

# Install the official AWS CLI v2 (arch-aware)
RUN apt-get update && apt-get install -y \
    curl \
    unzip \
    ca-certificates \
    less \
    groff \
    && case "$(dpkg --print-architecture)" in \
         amd64) ARCH=x86_64 ;; \
         arm64) ARCH=aarch64 ;; \
         *) echo "unsupported architecture" && exit 1 ;; \
       esac \
    && curl -fsSL "https://awscli.amazonaws.com/awscli-exe-linux-${ARCH}.zip" -o /tmp/awscliv2.zip \
    && unzip -q /tmp/awscliv2.zip -d /tmp \
    && /tmp/aws/install \
    && rm -rf /tmp/awscliv2.zip /tmp/aws \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

COPY setup-penguin.sh /usr/local/bin/setup-penguin.sh
RUN /usr/local/bin/setup-penguin.sh

COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

WORKDIR /workspace

ENTRYPOINT ["/usr/local/bin/entrypoint.sh", "aws"]
