#!/bin/bash
set -e

IMAGE="738959336030.dkr.ecr.us-east-1.amazonaws.com/test/practice-repo:latest"
CONTAINER="flask-app"

# Log in to Amazon ECR
aws ecr get-login-password --region us-east-1 \
  | docker login --username AWS --password-stdin \
    738959336030.dkr.ecr.us-east-1.amazonaws.com

# Pull the latest image
docker pull "$IMAGE"

# Remove the old container if it exists
docker rm -f "$CONTAINER" 2>/dev/null || true

# Start the application
docker run -d \
  --name "$CONTAINER" \
  --restart unless-stopped \
  -p 5000:5000 \
  "$IMAGE"

# Show container status
docker ps --filter "name=$CONTAINER"
