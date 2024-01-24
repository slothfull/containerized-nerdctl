FROM alpine:3.18

ENV http_proxy='http://10.144.1.10:8080'
ENV https_proxy='http://10.144.1.10:8080'

# fix /usr/include/magic.h not found, default alpine use forify-headers.h -> linux-headers.h
RUN apk update && \
    apk add vim && \
    apk add make && \
    apk add go && \
    apk add git && \
    apk add linux-headers && \
    apk add iptables && \
    apk add ip6tables && \
    apk add containerd && \
    apk add openrc && \
    apk add cni-plugins && \
    rm -rf /var/cache/apk/*

# VOLUME [ "/sys/fs/cgroup" ]
# fixs: /lib/rc/sh/openrc-run.sh: line 279: can't create /sys/fs/cgroup/*/tasks: Read-only file system

COPY ./scripts/logger.sh /scripts/logger.sh
COPY ./scripts/entry.sh /scripts/entry.sh
COPY ./scripts/prepare.sh /scripts/prepare.sh

ENTRYPOINT ["/scripts/entry.sh"]
# CMD ["/bin/sh", "/scripts/prepare.sh"]
