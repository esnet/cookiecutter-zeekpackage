#!/bin/bash

set -e

ZEEK_VER=$1

file /home/runner/work/cookiecutter-zeekpackage/cookiecutter-zeekpackage/evil_bit_checker/.ci_scripts/install_zeek.sh

for i in workflow-lint-*.json
do
    jq -c '.jobs.test.steps[].run' "$i" | egrep . | egrep -v "^null$" | while read -r cmd
    do
        cd evil_bit_checker
        cmd=$(echo "$cmd" | sed -e 's/$GITHUB_WORKSPACE/$PWD/g')
        cmd=$(echo "$cmd" | sed -e 's/${{ matrix.zeek }}/'$ZEEK_VER'/g')
        cmd=$(echo "$cmd" | sed -e 's/^"//' | sed -e 's/"$//')
        echo "Running command: $cmd"
        eval "$(printf "$cmd")"
        cd -
    done
done
