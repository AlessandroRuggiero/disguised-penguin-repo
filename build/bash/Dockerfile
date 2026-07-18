FROM debian:13-slim

# bash ships in the base image; just add the shared user/entrypoint setup
COPY setup-penguin.sh /usr/local/bin/setup-penguin.sh
RUN /usr/local/bin/setup-penguin.sh

COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

WORKDIR /workspace

ENTRYPOINT ["/usr/local/bin/entrypoint.sh", "bash"]
