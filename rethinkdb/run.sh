#!/bin/bash
set -e

BASE_DIR=/var/lib/rethinkdb
DATA_DIR=$BASE_DIR/data
BIN=/usr/bin/rethinkdb

# Setup data directory on first run
if find $BASE_DIR -maxdepth 0 -empty | read v; then
  $BIN create --directory $DATA_DIR
fi

# pass an extra arg for join
if [ "$#" -ne 0 ]; then
  echo "joining $1"
  $BIN --bind all --directory $DATA_DIR --join "$1"
else
  $BIN --bind all --directory $DATA_DIR
fi
