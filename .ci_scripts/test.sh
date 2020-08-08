#!/bin/bash

set -e

export PATH=/opt/zeek/bin:$PATH

cd /tmp/evil_bit_checker

echo "Running travis lint..."
/usr/local/bin/travis lint --skip-completion-check --exit-code .travis.yml
echo "Running zkg test script"
bash .ci_scripts/test.sh
echo "Tests succeeded."
