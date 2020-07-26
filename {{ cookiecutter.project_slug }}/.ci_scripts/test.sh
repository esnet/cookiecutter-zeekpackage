#!/bin/bash

set -e

export PATH=/usr/local/zeek/bin:/opt/zeek/bin:$PATH

zkg test "$PWD" || $(for i in ~/.zkg/testing/{{ cookiecutter.project.slug }}/clones/{{ cookiecutter.project_slug}}/*; do echo "$i"; echo "------------"; cat "$i"; done; exit 1)
zkg install --force --skiptests "$PWD" || $(for i in ~/.zkg/testing/{{ cookiecutter.project.slug }}/clones/{{ cookiecutter.project_slug}}/*; do echo "$i"; echo "------------"; cat "$i"; done; exit 1)
zkg test "$PWD"
zkg install --force --skiptests "$PWD"
