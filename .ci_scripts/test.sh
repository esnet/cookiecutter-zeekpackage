#!/bin/bash

set -e

export PATH=/opt/zeek/bin:$PATH

cd /tmp/evil_bit_checker

echo "Running travis lint..."
/usr/local/bin/travis login --github-token $GITHUB_TOKEN --com
/usr/local/bin/travis lint --com --skip-completion-check --exit-code .travis.yml
echo "Running zkg test script"
bash .ci_scripts/test.sh
echo "Building docs"
make -C docs
echo "Tests succeeded."
