#!/usr/bin/env bash

version=$(aws --version)

echo $version

if [[ "$version" == "aws-cli/$DOCKER_TAG"* ]] \
  || ([[ "$DOCKER_TAG" == "latest" ]] && [[ "$version" == "aws-cli/2."* ]]); then
  echo "AWS CLI version matches with Docker Tag.";
else
  echo "AWS CLI version doesn't match with Docker Tag '$DOCKER_TAG'"
  exit 1
fi
