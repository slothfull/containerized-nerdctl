readonly LOG_INFO=">>>"
readonly LOG_DEBUG="$$$"
readonly LOG_ERROR="!!!"

logtime() {
    echo $(date +"%Y-%m-%d %H:%M:%S.$(date +"%N" | cut -c1-3)")
}

# Log function for info messages
log_print() {
    local message="$1"
    echo "$(logtime) $LOG_INFO $message"
}

# Log function for debug messages
log_debug() {
    local message="$1"
    echo "$(logtime) $LOG_DEBUG $message"
}

# Log function for error messages
log_error() {
    local message="$1"
    echo "$(logtime) $LOG_ERROR $message" >&2
}

test() {
    log_print "info message."
    log_debug "debug message."
    log_error "error message."
}

# test

# on centos VM workstation, the date resolution is full:
# $ ./logger.sh
# 2024-01-17 20:49:49.436 >>> info message.
# 2024-01-17 20:49:49.441 5192$ debug message.
# 2024-01-17 20:49:49.445 !!! error message.

# inside alpine linux container, the date resolution is only reaches s -> see yingjie bai debug blog post
# $ ./r.sh
# 2024-01-17 12:47:02. >>> /scripts/s0_entry.sh running
# 2024-01-17 12:47:02. >>> /scripts/s0_entry.sh finished
# 2024-01-17 12:47:02. >>> /scripts/s1_prepare.sh running
# 2024-01-17 12:47:02. !!! no binary executable nerdctl found under nerdctl/_outputs
