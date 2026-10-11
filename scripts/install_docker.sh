
#!/bin/bash
set -e

apt-get update
apt-get install -y docker.io

systemctl enable --now docker

docker --version
