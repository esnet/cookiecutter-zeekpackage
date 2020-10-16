# Cookiecutter Zeek Package

Cookiecutter template for a Zeek package (zkg).

* GitHub repo: https://github.com/esnet/cookiecutter-zeekpackage
* Free software: BSD license

## Features

* Script testing with ``btest``
* GitHub integration: Actions for testing and building documentation as GitHub Pages
* Documentation generation
* Code coverage analysis

## Quickstart

Install Cruft:

    pip install -U cruft

### New Package

Generate a Zeek package project:

    cruft create https://github.com/esnet/cookiecutter-zeekpackage.git

Answer some questions, and it will create a new directory for you. Follow the instructions in README.md

### Existing Package

Create a new branch (optional):

    git checkout -b feat/use-template

Go back up a directory, and run:

    cd ..; cruft create -f https://github.com/esnet/cookiecutter-zeekpackage.git

Answer the questions. Note that `project_slug` must match your directory name.

At this point, some of your files have been overwritten. Run `git status`, and review the proposed changes. Some helpful commands:

* To accept the changes, `git add filename`.
* To reject the changes to an existing file, `git checkout -- filename`.
* To reject the changes to a new file, `rm filename`.
* If you want to save the old version of a file, to copy/paste some portions of it: `git show HEAD:README.rst > README.old`

## Updating

To update, `cruft update`.

Note that in some cases, newly created files or files that were deleted may not get added correctly. There is a cruft issue tracking this behavior.

## Configuration

Some of the questions that that cookiecutter will prompt you for will likely be the same across many different packages. You can create a [cookiecutter configuration file](https://cookiecutter.readthedocs.io/en/1.7.2/advanced/user_config.html) as `~/.cookiecutterrc`, which will be read as the defaults:

``` yaml
default_context:
    github_username: "grigorescu"
    project_credits: "Vlad Grigorescu <vlad@es.net>"
    project_namespace: "ESnet"
    copyright_owner: "Energy Sciences Network"
    open_source_license: "BSD license"
```
