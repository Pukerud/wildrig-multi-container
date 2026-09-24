#!/bin/sh
set -eu

if [ "$#" -gt 0 ]; then
  exec /opt/wildrig/wildrig-multi "$@"
fi

: "${WILDRIG_ALGO:?WILDRIG_ALGO is required}"
: "${WILDRIG_URL:?WILDRIG_URL is required}"
: "${WILDRIG_USER:?WILDRIG_USER is required}"
: "${WILDRIG_WORKER:?WILDRIG_WORKER is required}"

exec /opt/wildrig/wildrig-multi \
  --algo "$WILDRIG_ALGO" \
  --url "$WILDRIG_URL" \
  --user "$WILDRIG_USER" \
  --worker "$WILDRIG_WORKER" \
  --pass "${WILDRIG_PASSWORD:-x}"
