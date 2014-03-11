#!/bin/bash
set -e

USER=${POSTGRESQL_USER:-"root"}
PASSWORD=${POSTGRESQL_PASS:-"root"}

BIN_PATH=/usr/lib/postgresql/9.3/bin
CONFIG=/usr/lib/postgresql/postgresql.conf
DATA_DIR=/var/lib/postgresql
BIN=$BIN_PATH/postgres

if find $DATA_DIR -maxdepth 0 -empty | read v; then
    mkdir -p $DATA_DIR
    chown -R postgres:postgres $DATA_DIR
    sudo -u postgres $BIN_PATH/initdb -D $DATA_DIR -E utf8 --locale en_US.UTF-8

    sudo -u postgres $BIN --single --config-file=$CONFIG <<< "CREATE USER $USER WITH SUPERUSER;"
    sudo -u postgres $BIN --single --config-file=$CONFIG <<< "ALTER USER $USER WITH PASSWORD '$PASSWORD';"
fi

## Fix permissions
chmod -R 700 /var/lib/postgresql
chown -R postgres /var/lib/postgresql

sudo -u postgres $BIN_PATH/postgres --config-file=$CONFIG
