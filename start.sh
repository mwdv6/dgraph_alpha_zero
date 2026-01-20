#!/bin/sh

set -e

# check if hmac_secret_file exists and create it if it doesn't
if [ ! -f /dgraph/hmac_secret_file ]; then
    echo "Data encryption key does not exist. Generating..."
    tr -dc 'a-zA-Z0-9' < /dev/urandom | dd bs=1 count=32 of=/dgraph/hmac_secret_file
fi

exec parallel --ungroup --halt now,fail=1 ::: \
    "dgraph zero --my=localhost:5080 --replicas 1 --raft idx=1 --telemetry \"reports=false; sentry=false;\"" \
    "dgraph alpha --zero=localhost:5080 --acl secret-file=/dgraph/hmac_secret_file --security whitelist=\"0.0.0.0/0\" --telemetry \"reports=false; sentry=false;\""
