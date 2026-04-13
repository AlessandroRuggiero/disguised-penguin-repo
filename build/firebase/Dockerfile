FROM node:20-slim

#RUN useradd -m -u 1001 fb
RUN npm install -g firebase-tools

WORKDIR /workspace
#USER fb
ENTRYPOINT ["firebase"]