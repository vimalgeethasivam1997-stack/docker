#!/bin/bash
set -e

for attempt in $(seq 1 12); do
  if curl --fail --silent http://127.0.0.1:5000/health; then
    echo
    exit 0
  fi
  sleep 5
done

docker logs flask-app || true
echo "Application health check failed" >&2
exit 1
EOF
