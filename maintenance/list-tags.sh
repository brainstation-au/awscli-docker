#!/usr/bin/env bash

CURR_DIR="$(dirname $0)"

git tag -l > $CURR_DIR/tags.txt
