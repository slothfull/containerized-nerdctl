#!/bin/sh

curpath="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
docker run -it --rm -v /sys/fs/cgroup -v "$curpath"/nerdctl:/nerdctl nerdctl:test /scripts/s1_prepare.sh sh
# docker run -it --rm -v "$curpath"/nerdctl:/nerdctl nerdctl:test /scripts/s1_prepare.sh sh
