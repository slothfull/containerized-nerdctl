#!/bin/sh

# $PWD only show current dir to execution
spath="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

# docker run -it --rm -v /sys/fs/cgroup -v "$scriptpath"/nerdctl:/nerdctl --privileged --cap-add all nerdctl:test /scripts/s1_prepare.sh sh
docker run -it --rm -v "$spath"/nerdctl:/nerdctl \
                    -v "$spath"/lib:/var/lib/containerd \
                    --privileged --cap-add all nerdctl:test /scripts/prepare.sh sh
#   -v /sys/fs/cgroup:/sys/fs/cgroup \
