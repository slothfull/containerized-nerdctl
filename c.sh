#!/bin/sh

echo $PWD
path="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
echo $path

hello() {
    : '
    This is a
    very neat comment
    in bash
    '
}

hello
