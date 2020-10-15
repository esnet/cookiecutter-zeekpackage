#!/bin/bash

git init
git add .
git commit -m "Initial commit [cookiecutter-zeekpackage]"

git checkout --orphan gh-pages
git reset --hard
git commit --allow-empty -m "Initializing gh-pages branch"
git checkout -
