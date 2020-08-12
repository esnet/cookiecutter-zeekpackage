#!/bin/bash

set -e

curl -o github-workflow.json https://raw.githubusercontent.com/Logerfo/schemastore/master/src/schemas/json/github-workflow.json

for i in evil_bit_checker/.github/workflows/*.yml
do
    name=$(basename "$i")
    cat $i | python3 -c 'import json, sys; from ruamel import yaml ; y=yaml.safe_load(sys.stdin.read()) ; json.dump(y, sys.stdout)' > workflow-lint-$name.json
    echo "Validating GitHub workflow $i"
    jsonschema -i workflow-lint-$name.json github-workflow.json
done
