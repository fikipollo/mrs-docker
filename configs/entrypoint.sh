#!/bin/bash

if [ ! -d "/data/mrs-data/" ]; then
    tar xzvf /usr/local/etc/mrs/mrs-data.tgz -C /data
fi

if [ ! -d "/log/mrs-log/" ]; then
    mkdir /log/mrs-log
fi

/usr/local/bin/mrs server -F start
