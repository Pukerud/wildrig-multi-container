FROM ubuntu:22.04@sha256:b8b6ee6aa931ecd9d0d952abc34dc0e5f7c6a30c6bb71b079fe399fde0329c02

LABEL org.opencontainers.image.source="https://github.com/Pukerud/wildrig-multi-container"

ARG WILDRIG_VERSION=0.51.2
ARG WILDRIG_SHA256=da1463dcd3444687c7b29b1351e5bd2cb6b7fe204254f12cfac9796a17615c37

RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
       ca-certificates curl libcurl4 libnuma1 ocl-icd-libopencl1 \
    && rm -rf /var/lib/apt/lists/* \
    && mkdir -p /opt/wildrig \
    && curl --fail --location --show-error --silent \
       "https://github.com/andru-kun/wildrig-multi/releases/download/${WILDRIG_VERSION}/wildrig-multi-linux-${WILDRIG_VERSION}.tar.gz" \
       -o /tmp/wildrig.tar.gz \
    && echo "${WILDRIG_SHA256}  /tmp/wildrig.tar.gz" | sha256sum --check \
    && tar -xzf /tmp/wildrig.tar.gz -C /opt/wildrig wildrig-multi \
    && chmod 0755 /opt/wildrig/wildrig-multi \
    && rm /tmp/wildrig.tar.gz

WORKDIR /opt/wildrig
COPY entrypoint.sh /opt/wildrig/entrypoint.sh
RUN chmod 0755 /opt/wildrig/entrypoint.sh
ENTRYPOINT ["/opt/wildrig/entrypoint.sh"]
