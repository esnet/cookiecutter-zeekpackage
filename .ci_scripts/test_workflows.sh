#!/bin/bash

set -e

ZEEK_VER=$1

cd evil_bit_checker
ls -laR
cd -

for i in workflow-lint-*.json
do
    jq -c '.jobs.test.steps[].run' "$i" | egrep . | egrep -v "^null$" | while read -r cmd
    do
        cd evil_bit_checker
        cmd=$(echo "$cmd" | sed -e 's/$GITHUB_WORKSPACE/$PWD/g')
        cmd=$(echo "$cmd" | sed -e 's/${{ matrix.zeek }}/'$ZEEK_VER'/g')
        echo "Running command: $cmd"
        eval "$(printf "$cmd")"
        cd -
    done
done
