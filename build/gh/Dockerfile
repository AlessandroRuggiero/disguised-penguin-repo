FROM golang:1.27.2-trixie AS build

# gh's version is pinned in go.mod so Dependabot (gomod) can bump it
WORKDIR /src
COPY gh/go.mod gh/go.sum ./
RUN GH_VERSION="$(go list -m -f '{{.Version}}' github.com/cli/cli/v2)" \
    && CGO_ENABLED=0 go build -trimpath \
    -ldflags "-s -w -X github.com/cli/cli/v2/internal/build.Version=${GH_VERSION#v}" \
    -o /out/gh github.com/cli/cli/v2/cmd/gh

FROM debian:13-slim

RUN apt-get update && apt-get install -y \
    ca-certificates \
    git \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

COPY --from=build /out/gh /usr/local/bin/gh

COPY setup-penguin.sh /usr/local/bin/setup-penguin.sh
RUN /usr/local/bin/setup-penguin.sh

COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

WORKDIR /workspace

ENTRYPOINT ["/usr/local/bin/entrypoint.sh", "gh"]
