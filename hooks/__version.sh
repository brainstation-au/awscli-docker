#!/usr/bin/env bash

if [[ "$DOCKER_TAG" == "1"* ]] || [[ "$DOCKER_TAG" == "latest" ]]; then
  AWSCLI_MAJOR_VERSION="1"
elif [[ "$DOCKER_TAG" == "2"* ]]; then
  AWSCLI_MAJOR_VERSION="2"
else
  echo "Unknown docker tag $DOCKER_TAG"
  exit 1
fi
