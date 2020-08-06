#!/bin/bash

export PATH=/usr/local/zeek/bin:/opt/zeek/bin:/opt/zeek-nightly/bin:$PATH

pip install -U zkg
zkg autoconfig
