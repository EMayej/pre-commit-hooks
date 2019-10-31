#!/usr/bin/env bash

set -e

exec 5>&1
# Use goimports installed with retool if possible
current_dir=$(pwd)
export PATH=$current_dir/_tools/bin:$PATH
if command -v goimports >/dev/null; then
    output=$(goimports -l -w "$@" | tee /dev/fd/5)
    [ -z "$output" ]
fi
