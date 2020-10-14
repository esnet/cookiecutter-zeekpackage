#!/bin/bash

set -e

if [ -d /usr/local/zeek ]; then
    export PATH=/usr/local/zeek/bin:$PATH
elif [ -d /usr/local/bro ]; then
    export PATH=/usr/local/bro/bin:$PATH
    # Just symlink for anything expecting new behavior
    ln -sf /usr/local/bro/bin/bro /usr/local/bro/bin/zeek
fi

if command -v btest; then
    true
elif [ -f /build/zeek/aux/btest/btest ]; then
    export PATH=/build/zeek/aux/btest:$PATH
else
    pip3 install --user btest || pip install --user btest
fi

cd $GITHUB_WORKSPACE/tests

if scl -l && [ $(rpm -E %{rhel}) == "7" ]; then
    scl enable devtoolset-7 make
else
    make
fi
