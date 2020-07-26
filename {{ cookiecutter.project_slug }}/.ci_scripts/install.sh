#!/bin/bash

export PATH=/usr/local/zeek/bin:/opt/zeek/bin:$PATH

pip install -U zkg
zkg autoconfig
