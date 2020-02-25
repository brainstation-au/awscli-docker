#!/usr/bin/env bash

UserId=$(aws sts get-caller-identity | jq -r '.UserId')
echo "My user id: $UserId"
