FROM alpine:3.18

ENV http_proxy='http://10.144.1.10:8080'
ENV https_proxy='http://10.144.1.10:8080'

RUN apk update && \
    apk add --no-cache vim && \
    apk add --no-cache make && \
    apk add --no-cache go && \
    apk add --no-cache git && \
    apk add --no-cache containerd && \
    apk add --no-cache openrc && \
    rm -rf /var/cache/apk/*

VOLUME [ "/sys/fs/cgroup" ]

COPY logger.sh /scripts/logger.sh
COPY s0_entry.sh /scripts/s0_entry.sh
COPY s1_prepare.sh /scripts/s1_prepare.sh
     
ENTRYPOINT ["/scripts/s0_entry.sh"]
# CMD ["/bin/sh", "/scripts/s1_prepare.sh"]

