#!/bin/sh

. /scripts/logger.sh

log_print "$0 running"
log_print "$0 finished"

exec "$@"
