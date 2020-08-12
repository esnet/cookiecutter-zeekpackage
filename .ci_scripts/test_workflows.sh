#!/bin/bash

set -e

ZEEK_VER=$1

for i in workflow-lint-*.json
do
    for cmd in $(cat "$i")
    do
        cd evil_bit_checker
        cmd=$(echo "$cmd" | sed -e 's/$GITHUB_WORKSPACE/$GITHUB_WORKSPACE\/evil_bit_checker/g')
        cmd=$(echo "$cmd" | sed -e "s/\${{ matrix.zeek }}/$ZEEK_VER/g")
        echo "Running command: $cmd"
        eval "$(printf $cmd)"
        cd -
    done
done
