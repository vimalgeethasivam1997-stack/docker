#!/bin/bash
set -e

CONTAINER="flask-app"

if docker container inspect "$CONTAINER" >/dev/null 2>&1; then
    docker stop "$CONTAINER"
    docker rm "$CONTAINER"
fi

echo "ApplicationStop completed successfully."
