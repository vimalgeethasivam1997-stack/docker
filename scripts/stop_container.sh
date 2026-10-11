#!/bin/bash
set -e

if docker container inspect flask-app >/dev/null 2>&1; then
    docker stop flask-app
    docker rm flask-app
fi

echo "ApplicationStop completed successfully."
