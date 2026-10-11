#!/bin/bash
set -e

REGION="us-east-1"
REGISTRY="738959336030.dkr.ecr.us-east-1.amazonaws.com"
IMAGE="$REGISTRY/test/practice-repo:latest"

aws ecr get-login-password --region "$REGION" \
  | docker login --username AWS --password-stdin "$REGISTRY"

docker pull "$IMAGE"
docker rm -f flask-app 2>/dev/null || true

docker run -d \
  --name flask-app \
  --restart unless-stopped \
  -p 5000:5000 \
  "$IMAGE"
EOF
