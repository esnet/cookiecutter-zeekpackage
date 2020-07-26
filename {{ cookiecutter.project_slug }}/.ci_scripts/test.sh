#!/bin/bash

set -e

function debug_and_die {
	OUTPUT_PATH=$HOME/.zkg/testing/{{ cookiecutter.project_slug }}/clones/{{ cookiecutter.project_slug }}
	if [ -s $OUTPUT_PATH/zkg.test_command.stdout ]; then
		echo "zkg test command stdout"
		echo "-----------------------"
		cat $OUTPUT_PATH/zkg.test_command.stdout
	fi

	if [ -s $OUTPUT_PATH/zkg.test_command.stderr ]; then
		echo "zkg test command stderr"
		echo "-----------------------"
		cat $OUTPUT_PATH/zkg.test_command.stderr
	fi

	exit 1
}

export PATH=/usr/local/zeek/bin:/opt/zeek/bin:$PATH

echo "Running zkg test..."
zkg test "$PWD" || debug_and_die
echo "Tests succeeded. Running zkg install..."
zkg install --force --skiptests "$PWD" || debug_and_die
echo "Install succeeded."
