FROM node:26-slim

# 1. Install gosu and create the 'penguin' user
COPY setup-penguin.sh /usr/local/bin/setup-penguin.sh
RUN /usr/local/bin/setup-penguin.sh node

COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

COPY install-npm-global-from-package-json.sh /usr/local/bin/install-npm-global-from-package-json.sh

COPY firebase/package.json /tmp/deps/package.json
RUN sh /usr/local/bin/install-npm-global-from-package-json.sh firebase-tools /tmp/deps --cleanup

WORKDIR /workspace

ENTRYPOINT ["/usr/local/bin/entrypoint.sh", "firebase"]