FROM node:20-slim

COPY setup-penguin.sh /usr/local/bin/setup-penguin.sh
RUN /usr/local/bin/setup-penguin.sh node

COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

RUN npm install -g @google/gemini-cli@0.40.1


WORKDIR /workspace

ENTRYPOINT ["/usr/local/bin/entrypoint.sh", "gemini"]
