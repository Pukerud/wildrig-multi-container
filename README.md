# WildRig Multi 0.51.3 container

Minimal Linux AMD64 container for the [WildRig Multi 0.51.3 release](https://github.com/andru-kun/wildrig-multi/releases/tag/0.51.3). The upstream release archive is SHA-256 verified during the build. This repository is an independent packaging project, not an official WildRig release. The existing `0.51.2` image tag is not changed by this release.

Image: `ghcr.io/pukerud/wildrig-multi-container:0.51.3`

Build locally with `docker build -t wildrig-multi:0.51.3 .` and inspect miner options with `docker run --rm wildrig-multi:0.51.3 --help`.

The entrypoint passes explicit arguments directly to `wildrig-multi`. Without arguments, it constructs the command from `WILDRIG_ALGO`, `WILDRIG_URL`, `WILDRIG_USER`, `WILDRIG_WORKER`, and optional `WILDRIG_PASSWORD` (default `x`). Supply your own algorithm, pool, and account details at runtime; the image contains none. For example:

```sh
docker run --rm --gpus all \
  -e WILDRIG_ALGO='<algorithm>' \
  -e WILDRIG_URL='<pool-host:port>' \
  -e WILDRIG_USER='<account>' \
  -e WILDRIG_WORKER='<worker>' \
  ghcr.io/pukerud/wildrig-multi-container:0.51.3
```

The host needs a compatible GPU driver and container runtime. Check the upstream miner documentation for supported algorithms and GPU requirements. Publishing the image through GitHub Actions does not automatically make its GitHub Container Registry package public; set package visibility separately if anonymous pulls are required.
