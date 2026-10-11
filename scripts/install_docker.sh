#!/bin/bash
set -e

export DEBIAN_FRONTEND=noninteractive

apt-get update

# Remove conflicting packages from Ubuntu
apt-get remove -y docker.io docker-doc docker-compose docker-compose-v2 docker-buildx podman-docker containerd runc || true

# Install Docker Engine from Docker's official repository
apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Start Docker
systemctl enable --now docker

# Verify
docker --version
systemctl is-active docker
