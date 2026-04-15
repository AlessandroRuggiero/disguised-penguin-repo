FROM gcr.io/google.com/cloudsdktool/google-cloud-cli:slim

RUN apt-get update && \
    apt-get install -y gosu && \
    rm -rf /var/lib/apt/lists/* && \
    # Create a new 'penguin' user and group
    groupadd penguin && \
    useradd -m -g penguin -s /bin/bash penguin

COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

WORKDIR /workspace

ENTRYPOINT ["/usr/local/bin/entrypoint.sh", "gcloud"]