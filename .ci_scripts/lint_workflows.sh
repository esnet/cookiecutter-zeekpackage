#!/bin/bash

set -e

curl -o github-workflow.json https://raw.githubusercontent.com/Logerfo/schemastore/master/src/schemas/json/github-workflow.json

for i in evil_bit_checker/.github/workflows/*.yml
do
    cat $i | python3 -c 'import json, sys; from ruamel import yaml ; y=yaml.safe_load(sys.stdin.read()) ; json.dump(y, sys.stdout)' > $i.json
    echo "Validating GitHub workflow $i"
    jsonschema -i $i.json github-workflow.json
done
