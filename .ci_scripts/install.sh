#!/bin/bash

set -e

export PATH=/opt/zeek/bin:$PATH

gem install travis --no-rdoc --no-ri
find /usr -name travis

pip install --no-input cookiecutter

cookiecutter --no-input -o /tmp .
bash /tmp/evil_bit_checker/.ci_scripts/install.sh

# zkg will fail if the repo is dirty
cd /tmp/evil_bit_checker
git add .
git commit -m 'Initial commit'
