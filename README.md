# Disguised Penguin Repo

This repository hosts Dockerized CLI tools and the shared build setup used to publish them.
Everything is automatically built and published on the GitHub container registry on change.

## Available packages
- `bash`
- `claude`
- `doctl`
- `firebase`
- `gcloud`
- `opencode`
- `gemini`

## Structure
- `build/<tool-name>/Dockerfile`: Dockerfiles for each tool.
- `build/setup-penguin.sh` and `build/entrypoint.sh`: shared user/entrypoint helpers.
- `pkgs.json`: tool registry with container images and config mounts.
- `info.json`: registry metadata.
