#!/usr/bin/env sh

set -eu

apt-get update -y > /dev/null
apt-get install -y curl unzip jq > /dev/null

cd /tmp
AARCH=$([ "$TARGETPLATFORM" = "linux/arm64" ] && echo "aarch64" || echo "x86_64")
echo $AARCH > /tmp/aarch.txt
curl "https://awscli.amazonaws.com/awscli-exe-linux-${AARCH}-${DOCKER_TAG}.zip" -o "awscliv2.zip"
unzip -q awscliv2.zip
./aws/install
rm -rf aws
rm awscliv2.zip

apt-get purge --auto-remove unzip -y > /dev/null
apt-get clean
