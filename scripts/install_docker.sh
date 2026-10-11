#!/bin/bash
set -e

apt-get update

# Remove conflicting container runtime packages if installed
apt-get remove -y containerd docker.io docker-doc docker-compose podman-docker || true

# Install Docker using Ubuntu packages
apt-get install -y docker.io

# Enable and start Docker
systemctl enable --now docker

# Verify Docker installation
docker --version
systemctl is-active docker
