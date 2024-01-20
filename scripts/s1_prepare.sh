#!/bin/sh

. /scripts/logger.sh

prepare_nerdctl_binary() {
    nerdctl='/nerdctl/_output/nerdctl'
    if [ -f "${nerdctl}" ]; then
        ln -s "${nerdctl}" /usr/local/bin/nerdctl
        log_print 'nerdctl binary add to path'
    else
        log_error 'no binary executable nerdctl found under /nerdctl/_outputs'
        exit 1
    fi
}

startup_containerd_openrc() {
    : '
    # issues when try with bare fists:
    $ rc-service containerd start
    * WARNING: containerd is already starting

    $ rc-service containerd status
    * You are attempting to run an openrc service on a
    * system which openrc did not boot.
    * You may be inside a chroot or you may have used
    * another initialization system to boot this system.
    * In this situation, you will get unpredictable results!
    * If you really want to do this, issue the following command:
    * touch /run/openrc/softlevel

    # try the cmd but still failed:
    $ touch /run/openrc/softlevel
    touch: /run/openrc/softlevel: No such file or directory
    '
    # fix
    rc-status
    touch /run/openrc/softlevel
    # config
    rc-update add containerd default
    # start
    rc-service containerd start
    rc-service containerd status
    log_print 'containerd started'
}

start() {
    nerdctl ps -a
    log_print 'nerdctl started'
}

log_print "$0 running"

prepare_nerdctl_binary
startup_containerd_openrc

log_print "$0 finsihed"

# using cmd next as main process for container
exec "$@"

# add cni plugin for nerdctl
