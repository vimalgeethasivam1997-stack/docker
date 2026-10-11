#!/bin/bash
set -e
if ! command -v docker >/dev/null 2>&1; then
  if command -v apt-get >/dev/null 2>&1; then
    apt-get update
    apt-get install -y docker.io
  elif command -v dnf >/dev/null 2>&1; then
    dnf install -y docker
  elif command -v yum >/dev/null 2>&1; then
    yum install -y docker
  else
    echo "Cannot install Docker automatically" >&2
    exit 1
  fi
fi
systemctl enable --now docker
EOF
