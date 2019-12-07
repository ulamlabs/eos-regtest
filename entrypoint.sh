#!/bin/bash
set -x
action=$1
shift

case $action in
start)
    CMD="nodeos -d /data --config-dir /app -e -p eosio --contracts-console --verbose-http-errors --genesis-json=\"/app/genesis.json\" --filter-on \"*\""
    $CMD &
    PID=$!
    sleep 5
    bash /app/bootstrap.sh
    kill -15 $PID
    wait $PID
    exec $CMD
    ;;
*)
    exec $action "$@"
    ;;
esac
