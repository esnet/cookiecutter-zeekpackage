#!/bin/bash

export PATH=/usr/local/zeek/bin:$PATH

pip install -U zkg
zkg autoconfig
