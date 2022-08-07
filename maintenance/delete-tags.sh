#!/usr/bin/env bash

CURR_DIR="$(dirname $0)"

while read TAG; do
  git tag --delete $TAG
  git push --delete origin $TAG
done < "$CURR_DIR/tags.txt"
