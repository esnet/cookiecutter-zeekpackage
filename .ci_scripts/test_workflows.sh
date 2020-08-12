#!/bin/bash

set -e

ZEEK_VER=$1

for i in workflow-lint-*.json
do
    jq -c '.jobs.test.steps[].run' "$i" | egrep . | egrep -v "^null$" | while read -r cmd
    do
        cd evil_bit_checker
        cmd=$(echo "$cmd" | sed -e 's/$GITHUB_WORKSPACE/$GITHUB_WORKSPACE\/evil_bit_checker/g')
        cmd=$(echo "$cmd" | sed -e "s/\$\{\{ matrix.zeek \}\}/$ZEEK_VER/g")
        echo "Running command: $cmd"
        cmd_formatted=$(printf $cmd)
        eval $cmd_formatted
        cd -
    done
done
