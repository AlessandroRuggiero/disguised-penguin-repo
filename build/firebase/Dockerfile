FROM node:26-slim

# 1. Install gosu and create the 'penguin' user
COPY setup-penguin.sh /usr/local/bin/setup-penguin.sh
RUN /usr/local/bin/setup-penguin.sh node

COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

RUN npm install -g firebase-tools@15.16

WORKDIR /workspace

ENTRYPOINT ["/usr/local/bin/entrypoint.sh", "firebase"]